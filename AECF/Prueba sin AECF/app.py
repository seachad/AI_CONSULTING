from flask import Flask, request, jsonify
import psycopg2
from psycopg2.extras import RealDictCursor
from werkzeug.security import check_password_hash, generate_password_hash
import os
import secrets
from datetime import datetime, timedelta

app = Flask(__name__)

# Configuración de la base de datos
DB_CONFIG = {
    'host': os.getenv('DB_HOST', 'localhost'),
    'database': os.getenv('DB_NAME', 'mi_base_datos'),
    'user': os.getenv('DB_USER', 'postgres'),
    'password': os.getenv('DB_PASSWORD', 'password'),
    'port': os.getenv('DB_PORT', '5432')
}

def get_db_connection():
    """Obtener conexión a la base de datos PostgreSQL"""
    conn = psycopg2.connect(**DB_CONFIG)
    return conn

@app.route('/login', methods=['POST'])
def login():
    """
    Endpoint de login para autenticar usuarios.
    Espera JSON con 'usuario' (email o nombre) y 'password'.
    
    Ejemplo de petición:
    {
        "usuario": "admin@example.com",
        "password": "admin123"
    }
    """
    try:
        # Obtener datos del request
        data = request.get_json()
        
        if not data or 'usuario' not in data or 'password' not in data:
            return jsonify({
                'success': False,
                'message': 'Se requiere usuario y contraseña'
            }), 400
        
        usuario = data['usuario']
        password = data['password']
        
        # Buscar usuario por email o nombre
        conn = get_db_connection()
        cursor = conn.cursor(cursor_factory=RealDictCursor)
        
        query = """
            SELECT id, email, nombre, password_hash, activo, is_admin 
            FROM usuarios 
            WHERE (email = %s OR nombre = %s) AND activo = TRUE
        """
        cursor.execute(query, (usuario, usuario))
        user = cursor.fetchone()
        cursor.close()
        conn.close()
        
        # Verificar si el usuario existe
        if not user:
            return jsonify({
                'success': False,
                'message': 'Usuario o contraseña incorrectos'
            }), 401
        
        # Verificar contraseña
        if not check_password_hash(user['password_hash'], password):
            return jsonify({
                'success': False,
                'message': 'Usuario o contraseña incorrectos'
            }), 401
        
        # Login exitoso - devolver información del usuario (sin la contraseña)
        return jsonify({
            'success': True,
            'message': 'Login exitoso',
            'usuario': {
                'id': user['id'],
                'email': user['email'],
                'nombre': user['nombre'],
                'is_admin': user['is_admin'],
                'activo': user['activo']
            }
        }), 200
        
    except Exception as e:
        return jsonify({
            'success': False,
            'error': str(e)
        }), 500

@app.route('/reset-password/solicitar', methods=['POST'])
def solicitar_reset_password():
    """
    Solicitar reset de contraseña.
    Genera un token único para resetear la contraseña.
    
    Ejemplo de petición:
    {
        "email": "usuario@example.com"
    }
    """
    try:
        data = request.get_json()
        
        if not data or 'email' not in data:
            return jsonify({
                'success': False,
                'message': 'Se requiere el email'
            }), 400
        
        email = data['email']
        
        # Buscar usuario por email
        conn = get_db_connection()
        cursor = conn.cursor(cursor_factory=RealDictCursor)
        
        cursor.execute("SELECT id, email, nombre FROM usuarios WHERE email = %s AND activo = TRUE", (email,))
        user = cursor.fetchone()
        
        if not user:
            # Por seguridad, no revelar si el email existe o no
            return jsonify({
                'success': True,
                'message': 'Si el email existe, recibirás instrucciones para resetear tu contraseña'
            }), 200
        
        # Generar token único
        token = secrets.token_urlsafe(32)
        expira_en = datetime.now() + timedelta(hours=1)  # Token válido por 1 hora
        
        # Guardar token en la base de datos
        cursor.execute(
            """
            INSERT INTO password_reset_tokens (usuario_id, token, expira_en)
            VALUES (%s, %s, %s)
            """,
            (user['id'], token, expira_en)
        )
        
        conn.commit()
        cursor.close()
        conn.close()
        
        # En producción, aquí se enviaría un email con el token
        # Para este ejemplo, devolvemos el token directamente
        return jsonify({
            'success': True,
            'message': 'Token de reset generado exitosamente',
            'token': token,  # En producción esto NO se devolvería, se enviaría por email
            'expira_en': expira_en.isoformat(),
            'nota': 'En producción, este token se enviaría por email'
        }), 200
        
    except Exception as e:
        return jsonify({
            'success': False,
            'error': str(e)
        }), 500

@app.route('/reset-password/cambiar', methods=['POST'])
def cambiar_password_con_token():
    """
    Cambiar contraseña usando un token de reset.
    
    Ejemplo de petición:
    {
        "token": "token_generado",
        "nueva_password": "nueva_contraseña_123"
    }
    """
    try:
        data = request.get_json()
        
        if not data or 'token' not in data or 'nueva_password' not in data:
            return jsonify({
                'success': False,
                'message': 'Se requiere token y nueva_password'
            }), 400
        
        token = data['token']
        nueva_password = data['nueva_password']
        
        # Validar longitud mínima de contraseña
        if len(nueva_password) < 6:
            return jsonify({
                'success': False,
                'message': 'La contraseña debe tener al menos 6 caracteres'
            }), 400
        
        conn = get_db_connection()
        cursor = conn.cursor(cursor_factory=RealDictCursor)
        
        # Buscar token válido
        cursor.execute(
            """
            SELECT id, usuario_id, expira_en, usado
            FROM password_reset_tokens
            WHERE token = %s
            """,
            (token,)
        )
        token_data = cursor.fetchone()
        
        # Validar token
        if not token_data:
            cursor.close()
            conn.close()
            return jsonify({
                'success': False,
                'message': 'Token inválido'
            }), 400
        
        if token_data['usado']:
            cursor.close()
            conn.close()
            return jsonify({
                'success': False,
                'message': 'Este token ya ha sido usado'
            }), 400
        
        if datetime.now() > token_data['expira_en']:
            cursor.close()
            conn.close()
            return jsonify({
                'success': False,
                'message': 'El token ha expirado'
            }), 400
        
        # Actualizar contraseña del usuario
        nuevo_hash = generate_password_hash(nueva_password)
        cursor.execute(
            "UPDATE usuarios SET password_hash = %s WHERE id = %s",
            (nuevo_hash, token_data['usuario_id'])
        )
        
        # Marcar token como usado
        cursor.execute(
            "UPDATE password_reset_tokens SET usado = TRUE WHERE id = %s",
            (token_data['id'],)
        )
        
        conn.commit()
        cursor.close()
        conn.close()
        
        return jsonify({
            'success': True,
            'message': 'Contraseña actualizada exitosamente'
        }), 200
        
    except Exception as e:
        return jsonify({
            'success': False,
            'error': str(e)
        }), 500

@app.route('/usuarios/buscar', methods=['GET'])
def buscar_usuarios():
    """
    Buscar usuarios por email, nombre o estado activo.
    Parámetros de querystring:
    - email: buscar por email (búsqueda parcial)
    - nombre: buscar por nombre (búsqueda parcial)
    - activo: filtrar por estado activo (true/false)
    
    Ejemplo: /usuarios/buscar?email=juan&activo=true
    """
    try:
        # Obtener parámetros de querystring
        email = request.args.get('email')
        nombre = request.args.get('nombre')
        activo = request.args.get('activo')
        
        # Construir la consulta SQL con filtros dinámicos
        query = "SELECT id, email, nombre, activo, is_admin FROM usuarios WHERE 1=1"
        params = []
        
        if email:
            query += " AND email ILIKE %s"
            params.append(f"%{email}%")
        
        if nombre:
            query += " AND nombre ILIKE %s"
            params.append(f"%{nombre}%")
        
        if activo is not None:
            # Convertir string a booleano
            activo_bool = activo.lower() in ('true', '1', 'yes', 'si')
            query += " AND activo = %s"
            params.append(activo_bool)
        
        # Ejecutar la consulta
        conn = get_db_connection()
        cursor = conn.cursor(cursor_factory=RealDictCursor)
        cursor.execute(query, params)
        usuarios = cursor.fetchall()
        cursor.close()
        conn.close()
        
        # Convertir resultados a lista de diccionarios
        resultado = [dict(usuario) for usuario in usuarios]
        
        return jsonify({
            'success': True,
            'count': len(resultado),
            'usuarios': resultado
        }), 200
        
    except Exception as e:
        return jsonify({
            'success': False,
            'error': str(e)
        }), 500

@app.route('/usuarios', methods=['GET'])
def listar_usuarios():
    """Listar todos los usuarios"""
    try:
        conn = get_db_connection()
        cursor = conn.cursor(cursor_factory=RealDictCursor)
        cursor.execute("SELECT id, email, nombre, activo, is_admin FROM usuarios")
        usuarios = cursor.fetchall()
        cursor.close()
        conn.close()
        
        resultado = [dict(usuario) for usuario in usuarios]
        
        return jsonify({
            'success': True,
            'count': len(resultado),
            'usuarios': resultado
        }), 200
        
    except Exception as e:
        return jsonify({
            'success': False,
            'error': str(e)
        }), 500

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)
