"""
Script auxiliar para generar hashes de contraseñas
"""
from werkzeug.security import generate_password_hash

# Generar hash para la contraseña por defecto
password = 'password123'
hash_generado = generate_password_hash(password)

print(f"Contraseña: {password}")
print(f"Hash: {hash_generado}")
print("\nPara usar en SQL:")
print(f"password_hash = '{hash_generado}'")
