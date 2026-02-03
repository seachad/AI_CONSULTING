"""
Script auxiliar para generar hashes de contraseñas
y actualizar la base de datos con credenciales de prueba.
"""
from werkzeug.security import generate_password_hash
import psycopg2
import os

# Configuración de la base de datos
DB_CONFIG = {
    'host': os.getenv('DB_HOST', 'localhost'),
    'database': os.getenv('DB_NAME', 'mi_base_datos'),
    'user': os.getenv('DB_USER', 'postgres'),
    'password': os.getenv('DB_PASSWORD', 'password'),
    'port': os.getenv('DB_PORT', '5432')
}

# Usuarios de prueba con contraseñas
usuarios_prueba = [
    ('admin@example.com', 'Administrador', 'admin123', True, True),
    ('juan.perez@example.com', 'Juan Pérez', 'user123', True, False),
    ('maria.garcia@example.com', 'María García', 'user123', True, False),
    ('carlos.lopez@example.com', 'Carlos López', 'user123', False, False),
    ('ana.martinez@example.com', 'Ana Martínez', 'user123', True, False),
]

def crear_usuarios_con_hashes():
    """Crear usuarios en la base de datos con contraseñas hasheadas"""
    try:
        conn = psycopg2.connect(**DB_CONFIG)
        cursor = conn.cursor()
        
        # Limpiar tabla
        cursor.execute("DELETE FROM usuarios")
        
        # Insertar usuarios con hashes
        for email, nombre, password, activo, is_admin in usuarios_prueba:
            password_hash = generate_password_hash(password)
            cursor.execute(
                """
                INSERT INTO usuarios (email, nombre, password_hash, activo, is_admin)
                VALUES (%s, %s, %s, %s, %s)
                """,
                (email, nombre, password_hash, activo, is_admin)
            )
            print(f"✓ Usuario creado: {email} (password: {password}, admin: {is_admin})")
        
        conn.commit()
        cursor.close()
        conn.close()
        
        print("\n¡Usuarios de prueba creados exitosamente!")
        print("\nCredenciales de prueba:")
        print("- Admin: admin@example.com / admin123")
        print("- Usuario: juan.perez@example.com / user123")
        
    except Exception as e:
        print(f"Error: {e}")

if __name__ == '__main__':
    print("Generando hashes y creando usuarios...")
    crear_usuarios_con_hashes()
