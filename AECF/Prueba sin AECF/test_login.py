"""
Script de prueba para el endpoint de login.
Ejecutar después de iniciar el servidor Flask.
"""
import requests
import json

BASE_URL = "http://localhost:5000"

def test_login(usuario, password):
    """Probar el endpoint de login"""
    url = f"{BASE_URL}/login"
    data = {
        "usuario": usuario,
        "password": password
    }
    
    print(f"\n{'='*60}")
    print(f"Probando login con: {usuario}")
    print(f"{'='*60}")
    
    try:
        response = requests.post(url, json=data)
        print(f"Status: {response.status_code}")
        print(f"Response: {json.dumps(response.json(), indent=2, ensure_ascii=False)}")
    except Exception as e:
        print(f"Error: {e}")

def main():
    print("PRUEBAS DEL SISTEMA DE LOGIN")
    print("="*60)
    
    # Caso 1: Login exitoso como admin
    test_login("admin@example.com", "admin123")
    
    # Caso 2: Login exitoso como usuario normal
    test_login("juan.perez@example.com", "user123")
    
    # Caso 3: Login con nombre en lugar de email
    test_login("Juan Pérez", "user123")
    
    # Caso 4: Contraseña incorrecta
    test_login("admin@example.com", "wrong_password")
    
    # Caso 5: Usuario no existe
    test_login("noexiste@example.com", "password")
    
    # Caso 6: Usuario inactivo
    test_login("carlos.lopez@example.com", "user123")
    
    print(f"\n{'='*60}")
    print("Pruebas completadas")
    print(f"{'='*60}\n")

if __name__ == '__main__':
    main()
