from flask import Flask, request, jsonify
import psycopg2
from psycopg2.extras import RealDictCursor
from werkzeug.security import check_password_hash, generate_password_hash
import secrets
from datetime import datetime, timedelta, timezone
import os
import logging

app = Flask(__name__)

# Configuración de logging
logging.basicConfig(
    level=logging.INFO,
    format='[%(levelname)s] %(message)s'
)
logger = logging.getLogger(__name__)

# Configuración de la base de datos
DB_CONFIG = {
    'host': os.getenv('DB_HOST', 'localhost'),
    'port': os.getenv('DB_PORT', '5432'),
    'database': os.getenv('DB_NAME', 'mydb'),
    'user': os.getenv('DB_USER', 'postgres'),
    'password': os.getenv('DB_PASSWORD', 'password')
}

def get_db_connection():
    """Establece conexión con PostgreSQL"""
    return psycopg2.connect(**DB_CONFIG)

@app.route('/api/password-reset/request', methods=['POST'])
def password_reset_request():
    """
    Endpoint para solicitar reset de contraseña.
    
    Request Body (JSON):
        - email (str): Email del usuario
    
    Returns:
        JSON con mensaje genérico (no revela si el usuario existe)
    """
    conn = None
    cursor = None
    try:
        # Paso 4: Validar formato JSON
        data = request.get_json()
        if not data:
            return jsonify({
                'success': False,
                'error': 'Se requiere datos en formato JSON'
            }), 400
        
        # Paso 4: Obtener email
        email = data.get('email')
        if not email:
            return jsonify({
                'success': False,
                'error': 'El campo email es requerido'
            }), 400
        
        # Paso 5: Normalizar email (trim y lowercase)
        email_normalizado = email.strip().lower()
        
        # Paso 6: Buscar usuario por email normalizado
        conn = get_db_connection()
        cursor = conn.cursor(cursor_factory=RealDictCursor)
        
        cursor.execute(
            "SELECT id FROM usuarios WHERE LOWER(TRIM(email)) = %s",
            (email_normalizado,)
        )
        usuario = cursor.fetchone()
        
        # Paso 7: Si usuario NO existe, retornar respuesta genérica
        if not usuario:
            # Logging: registrar intento con email inexistente
            print(f"[SECURITY] Password reset requested for non-existent email: {email_normalizado}")
            return jsonify({
                'success': True,
                'message': 'Si el email existe, recibirás instrucciones'
            }), 200
        
        # Paso 8: Generar token único
        token = secrets.token_urlsafe(32)
        
        # Paso 9: Calcular expires_at (1 hora desde ahora)
        expires_at = datetime.now(timezone.utc) + timedelta(hours=1)
        
        # Paso 10: Transacción atómica - invalidar tokens anteriores e insertar nuevo
        try:
            # Invalidar tokens NO USADOS anteriores del mismo usuario
            cursor.execute(
                "UPDATE password_reset_tokens SET used = true WHERE user_id = %s AND used = false",
                (usuario['id'],)
            )
            
            # Insertar nuevo token
            cursor.execute(
                """INSERT INTO password_reset_tokens (user_id, token, expires_at)
                   VALUES (%s, %s, %s)""",
                (usuario['id'], token, expires_at)
            )
            
            conn.commit()
            
            # Paso 11: Registrar evento en log
            print(f"[SECURITY] Password reset requested: user_id={usuario['id']}, timestamp={datetime.now(timezone.utc).isoformat()}")
            
        except Exception as e:
            conn.rollback()
            raise e
        
        # Paso 12: Retornar respuesta con token
        # Nota: En producción, el token se enviaría por email y NO se incluiría en la respuesta
        return jsonify({
            'success': True,
            'message': 'Si el email existe, recibirás instrucciones',
            'token': token  # Solo para desarrollo/testing
        }), 200
        
    except psycopg2.Error as e:
        # Paso 24: Manejo de errores de BD
        print(f"[ERROR] Database error in password_reset_request: {str(e)}")
        return jsonify({
            'success': False,
            'error': 'Error del servidor'
        }), 500
    
    except Exception as e:
        # Paso 24: Manejo de errores generales
        print(f"[ERROR] Unexpected error in password_reset_request: {str(e)}")
        return jsonify({
            'success': False,
            'error': 'Error del servidor'
        }), 500
    
    finally:
        # Garantizar cierre de recursos
        if cursor:
            cursor.close()
        if conn:
            conn.close()

@app.route('/api/password-reset/confirm', methods=['POST'])
def password_reset_confirm():
    """
    Endpoint para confirmar reset de contraseña usando token.
    
    Request Body (JSON):
        - token (str): Token de reset
        - new_password (str): Nueva contraseña (mínimo 8 caracteres)
    
    Returns:
        JSON con confirmación de éxito o error específico
    """
    try:
        # Paso 25: Validar formato JSON
        data = request.get_json()
        if not data:
            return jsonify({
                'success': False,
                'error': 'Se requiere datos en formato JSON'
            }), 400
        
        # Paso 14: Obtener datos del request
        token = data.get('token')
        new_password = data.get('new_password')
        
        if not token or not new_password:
            return jsonify({
                'success': False,
                'error': 'Los campos token y new_password son requeridos'
            }), 400
        
        # Paso 15: Validar longitud mínima de contraseña
        if len(new_password) < 8:
            return jsonify({
                'success': False,
                'error': 'La contraseña debe tener al menos 8 caracteres'
            }), 400
        
        conn = get_db_connection()
        cursor = conn.cursor(cursor_factory=RealDictCursor)
        
        # Paso 16: Buscar token no usado
        cursor.execute(
            "SELECT * FROM password_reset_tokens WHERE token = %s AND used = false",
            (token,)
        )
        token_record = cursor.fetchone()
        
        # Paso 17: Si no existe, retornar error
        if not token_record:
            cursor.close()
            conn.close()
            return jsonify({
                'success': False,
                'error': 'Token inválido o ya utilizado'
            }), 404
        
        # Paso 18: Verificar si el token expiró
        if token_record['expires_at'] < datetime.now(timezone.utc):
            # Marcar token como usado antes de retornar error
            cursor.execute(
                "UPDATE password_reset_tokens SET used = true WHERE token = %s",
                (token,)
            )
            conn.commit()
            cursor.close()
            conn.close()
            return jsonify({
                'success': False,
                'error': 'Token expirado'
            }), 410
        
        # Paso 19: Obtener user_id del token
        user_id = token_record['user_id']
        
        # Paso 20: Hashear nueva contraseña
        password_hash = generate_password_hash(new_password)
        
        # Paso 21: Transacción atómica - actualizar contraseña y marcar token como usado
        try:
            cursor.execute(
                "UPDATE usuarios SET password_hash = %s WHERE id = %s",
                (password_hash, user_id)
            )
            
            cursor.execute(
                "UPDATE password_reset_tokens SET used = true WHERE token = %s",
                (token,)
            )
            
            conn.commit()
            
            # Paso 22: Registrar evento en log
            print(f"[SECURITY] Password reset completed: user_id={user_id}, timestamp={datetime.now(timezone.utc).isoformat()}")
            
        except Exception as e:
            conn.rollback()
            raise e
        finally:
            cursor.close()
            conn.close()
        
        # Paso 23: Retornar confirmación de éxito
        return jsonify({
            'success': True,
            'message': 'Contraseña actualizada correctamente'
        }), 200
        
    except psycopg2.Error as e:
        # Paso 24: Manejo de errores de BD
        print(f"[ERROR] Database error in password_reset_confirm: {str(e)}")
        return jsonify({
            'success': False,
            'error': 'Error del servidor'
        }), 500
    
    except Exception as e:
        # Paso 24: Manejo de errores generales
        print(f"[ERROR] Unexpected error in password_reset_confirm: {str(e)}")
        return jsonify({
            'success': False,
            'error': 'Error del servidor'
        }), 500

@app.route('/api/login', methods=['POST'])
def login():
    """
    Endpoint para autenticar usuarios.
    
    Request Body (JSON):
        - email (str): Email del usuario
        - password (str): Contraseña del usuario
    
    Returns:
        JSON con información del usuario si las credenciales son válidas
    """
    try:
        # Obtener datos del request
        data = request.get_json()
        
        if not data:
            return jsonify({
                'success': False,
                'error': 'Se requiere datos en formato JSON'
            }), 400
        
        email = data.get('email')
        password = data.get('password')
        
        # Validar campos requeridos
        if not email or not password:
            return jsonify({
                'success': False,
                'error': 'Email y contraseña son requeridos'
            }), 400
        
        # Buscar usuario en la base de datos
        conn = get_db_connection()
        cursor = conn.cursor(cursor_factory=RealDictCursor)
        
        cursor.execute(
            "SELECT id, nombre, email, activo, is_admin, password_hash FROM usuarios WHERE email = %s",
            (email,)
        )
        usuario = cursor.fetchone()
        
        cursor.close()
        conn.close()
        
        # Verificar si el usuario existe
        if not usuario:
            return jsonify({
                'success': False,
                'error': 'Credenciales inválidas'
            }), 401
        
        # Verificar si el usuario está activo
        if not usuario['activo']:
            return jsonify({
                'success': False,
                'error': 'Usuario inactivo'
            }), 403
        
        # Verificar contraseña
        if not check_password_hash(usuario['password_hash'], password):
            return jsonify({
                'success': False,
                'error': 'Credenciales inválidas'
            }), 401
        
        # Login exitoso - devolver información del usuario (sin el hash)
        return jsonify({
            'success': True,
            'message': 'Login exitoso',
            'usuario': {
                'id': usuario['id'],
                'nombre': usuario['nombre'],
                'email': usuario['email'],
                'is_admin': usuario['is_admin']
            }
        }), 200
        
    except psycopg2.Error as e:
        return jsonify({
            'success': False,
            'error': 'Error de base de datos',
            'detalle': str(e)
        }), 500
    
    except Exception as e:
        return jsonify({
            'success': False,
            'error': 'Error interno del servidor',
            'detalle': str(e)
        }), 500

@app.route('/api/usuarios', methods=['GET'])
def buscar_usuarios():
    """
    Endpoint para buscar usuarios con filtros opcionales.
    
    Query Parameters:
        - email (str): Filtro por email (búsqueda parcial)
        - username (str): Alias de email (búsqueda parcial)
        - nombre (str): Filtro por nombre (búsqueda parcial)
        - activo (bool): Filtro por estado activo (true/false)
    
    Returns:
        JSON con lista de usuarios encontrados
    """
    conn = None
    cursor = None
    try:
        # Obtener parámetros de búsqueda
        email = request.args.get('email')
        username = request.args.get('username')
        nombre = request.args.get('nombre')
        activo = request.args.get('activo')
        
        # Si username existe, tiene precedencia sobre email
        if username:
            email = username
            print(f"Usuario buscado por username: {username}")
        
        # Construir query base
        query = "SELECT id, nombre, email, activo, is_admin, fecha_creacion FROM usuarios WHERE 1=1"
        params = []
        
        # Aplicar filtros dinámicamente
        if email:
            query += " AND email ILIKE %s"
            params.append(f"%{email}%")
        
        if nombre:
            query += " AND nombre ILIKE %s"
            params.append(f"%{nombre}%")
        
        if activo is not None:
            # Convertir string a boolean
            activo_bool = activo.lower() in ['true', '1', 'yes', 'si']
            query += " AND activo = %s"
            params.append(activo_bool)
        
        # Ejecutar consulta
        conn = get_db_connection()
        cursor = conn.cursor(cursor_factory=RealDictCursor)
        cursor.execute(query, params)
        usuarios = cursor.fetchall()
        
        # Convertir resultados a formato JSON serializable
        resultado = []
        for usuario in usuarios:
            usuario_dict = dict(usuario)
            # Convertir fecha a string si existe
            if 'fecha_creacion' in usuario_dict and usuario_dict['fecha_creacion']:
                usuario_dict['fecha_creacion'] = usuario_dict['fecha_creacion'].isoformat()
            resultado.append(usuario_dict)
        
        return jsonify({
            'success': True,
            'total': len(resultado),
            'usuarios': resultado
        }), 200
        
    except psycopg2.Error as e:
        logger.error(f"Database error in buscar_usuarios: {str(e)}")
        return jsonify({
            'success': False,
            'error': 'Error de base de datos'
        }), 500
    
    except Exception as e:
        logger.error(f"Unexpected error in buscar_usuarios: {str(e)}")
        return jsonify({
            'success': False,
            'error': 'Error interno del servidor'
        }), 500
    
    finally:
        # Garantizar cierre de recursos
        if cursor:
            cursor.close()
        if conn:
            conn.close()

@app.route('/api/health', methods=['GET'])
def health_check():
    """Endpoint para verificar el estado de la API"""
    try:
        conn = get_db_connection()
        conn.close()
        return jsonify({'status': 'healthy', 'database': 'connected'}), 200
    except Exception as e:
        return jsonify({'status': 'unhealthy', 'database': 'disconnected', 'error': str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)
