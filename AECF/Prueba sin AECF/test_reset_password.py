"""
Script de prueba para el sistema de reset de contraseña.
Ejecutar después de iniciar el servidor Flask.
"""
import requests
import json

BASE_URL = "http://localhost:5000"

def solicitar_reset(email):
    """Solicitar reset de contraseña"""
    url = f"{BASE_URL}/reset-password/solicitar"
    data = {"email": email}
    
    print(f"\n{'='*60}")
    print(f"1. Solicitando reset de contraseña para: {email}")
    print(f"{'='*60}")
    
    try:
        response = requests.post(url, json=data)
        print(f"Status: {response.status_code}")
        result = response.json()
        print(f"Response: {json.dumps(result, indent=2, ensure_ascii=False)}")
        
        # Retornar el token si existe
        if result.get('success') and 'token' in result:
            return result['token']
        return None
    except Exception as e:
        print(f"Error: {e}")
        return None

def cambiar_password(token, nueva_password):
    """Cambiar contraseña con token"""
    url = f"{BASE_URL}/reset-password/cambiar"
    data = {
        "token": token,
        "nueva_password": nueva_password
    }
    
    print(f"\n{'='*60}")
    print(f"2. Cambiando contraseña con token")
    print(f"{'='*60}")
    
    try:
        response = requests.post(url, json=data)
        print(f"Status: {response.status_code}")
        print(f"Response: {json.dumps(response.json(), indent=2, ensure_ascii=False)}")
        return response.status_code == 200
    except Exception as e:
        print(f"Error: {e}")
        return False

def probar_login(usuario, password):
    """Probar login con las nuevas credenciales"""
    url = f"{BASE_URL}/login"
    data = {
        "usuario": usuario,
        "password": password
    }
    
    print(f"\n{'='*60}")
    print(f"3. Probando login con nueva contraseña")
    print(f"{'='*60}")
    
    try:
        response = requests.post(url, json=data)
        print(f"Status: {response.status_code}")
        print(f"Response: {json.dumps(response.json(), indent=2, ensure_ascii=False)}")
        return response.status_code == 200
    except Exception as e:
        print(f"Error: {e}")
        return False

def main():
    print("\n" + "="*60)
    print("PRUEBA COMPLETA DEL SISTEMA DE RESET DE CONTRASEÑA")
    print("="*60)
    
    # Flujo completo de reset de contraseña
    email_prueba = "juan.perez@example.com"
    nueva_password = "nueva_password_123"
    
    print(f"\nEmail a resetear: {email_prueba}")
    print(f"Nueva contraseña: {nueva_password}")
    
    # Paso 1: Solicitar reset
    token = solicitar_reset(email_prueba)
    
    if not token:
        print("\n❌ No se pudo obtener el token. Verifica que el servidor esté ejecutándose.")
        return
    
    print(f"\n✅ Token obtenido: {token[:20]}...")
    
    # Paso 2: Cambiar contraseña
    if cambiar_password(token, nueva_password):
        print(f"\n✅ Contraseña cambiada exitosamente")
        
        # Paso 3: Verificar que el login funciona con la nueva contraseña
        if probar_login(email_prueba, nueva_password):
            print(f"\n✅ Login exitoso con la nueva contraseña")
        else:
            print(f"\n❌ No se pudo hacer login con la nueva contraseña")
    else:
        print(f"\n❌ No se pudo cambiar la contraseña")
    
    # Pruebas adicionales de validación
    print(f"\n{'='*60}")
    print("PRUEBAS DE VALIDACIÓN")
    print(f"{'='*60}")
    
    # Caso 1: Intentar usar el mismo token de nuevo
    print(f"\n4. Intentando reusar el token (debería fallar)")
    print(f"{'='*60}")
    cambiar_password(token, "otra_password")
    
    # Caso 2: Token inválido
    print(f"\n5. Intentando usar token inválido (debería fallar)")
    print(f"{'='*60}")
    cambiar_password("token_invalido_12345", "password123")
    
    # Caso 3: Email que no existe
    print(f"\n6. Solicitando reset para email inexistente")
    print(f"{'='*60}")
    solicitar_reset("noexiste@example.com")
    
    # Caso 4: Contraseña muy corta
    token2 = solicitar_reset("maria.garcia@example.com")
    if token2:
        print(f"\n7. Intentando password muy corta (debería fallar)")
        print(f"{'='*60}")
        cambiar_password(token2, "123")
    
    print(f"\n{'='*60}")
    print("✅ PRUEBAS COMPLETADAS")
    print(f"{'='*60}\n")

if __name__ == '__main__':
    main()
