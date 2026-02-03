# API de Búsqueda de Usuarios - Flask + PostgreSQL

API REST para buscar usuarios en PostgreSQL con filtros dinámicos, autenticación y sistema de recuperación de contraseña.

## Características

- Búsqueda de usuarios por email, nombre o estado activo
- **Sistema de login con autenticación de usuarios**
- **Verificación de credenciales contra PostgreSQL**
- **Identificación de usuarios administradores**
- **Sistema completo de recuperación de contraseña**
- Filtros opcionales mediante query parameters
- Respuestas en formato JSON
- Manejo de errores robusto
- Health check endpoint

## Instalación

1. **Clonar el repositorio e instalar dependencias:**
```bash
pip install -r requirements.txt
```

2. **Configurar variables de entorno:**
```bash
copy .env.example .env
# Edita .env con tus credenciales de PostgreSQL
```

3. **Crear la base de datos:**
```bash
psql -U postgres -f setup_db.sql
psql -U postgres -f password_reset_schema.sql
```

## Uso

### Iniciar el servidor

```bash
python app.py
```

El servidor estará disponible en `http://localhost:5000`

### Endpoints

#### 1. Login de usuarios
```
POST /api/login
```

**Request Body (JSON):**
```json
{
  "email": "admin@example.com",
  "password": "password123"
}
```

**Respuesta exitosa:**
```json
{
  "success": true,
  "message": "Login exitoso",
  "usuario": {
    "id": 5,
    "nombre": "Admin User",
    "email": "admin@example.com",
    "is_admin": true
  }
}
```

**Errores posibles:**
- `400` - Datos faltantes o inválidos
- `401` - Credenciales incorrectas
- `403` - Usuario inactivo

**Ejemplos:**

```bash
# Login de usuario normal
curl -X POST http://localhost:5000/api/login \
  -H "Content-Type: application/json" \
  -d '{"email": "juan.perez@example.com", "password": "password123"}'

# Login de administrador
curl -X POST http://localhost:5000/api/login \
  -H "Content-Type: application/json" \
  -d '{"email": "admin@example.com", "password": "password123"}'
```

#### 2. Solicitar reset de contraseña
```
POST /api/password-reset/request
```

**Request Body (JSON):**
```json
{
  "email": "usuario@example.com"
}
```

**Respuesta exitosa (siempre genérica):**
```json
{
  "success": true,
  "message": "Si el email existe, recibirás instrucciones",
  "token": "abc123..."
}
```

**Notas:**
- La respuesta es siempre exitosa (código 200) para evitar enumeración de usuarios
- El campo `token` solo aparece en desarrollo; en producción se enviaría por email
- Los tokens expiran en 1 hora
- Los tokens anteriores del mismo usuario se invalidan automáticamente

**Códigos de respuesta:**
- `200 OK` - Solicitud procesada (sin revelar si el email existe)
- `400 Bad Request` - Formato JSON inválido o email faltante
- `500 Internal Server Error` - Error del servidor

**Ejemplos:**

```bash
# Solicitar reset de contraseña
curl -X POST http://localhost:5000/api/password-reset/request \
  -H "Content-Type: application/json" \
  -d '{"email": "juan.perez@example.com"}'
```

#### 3. Confirmar reset de contraseña
```
POST /api/password-reset/confirm
```

**Request Body (JSON):**
```json
{
  "token": "abc123...",
  "new_password": "nuevaContraseña123"
}
```

**Respuesta exitosa:**
```json
{
  "success": true,
  "message": "Contraseña actualizada correctamente"
}
```

**Respuestas de error:**

- **400 Bad Request** - Contraseña muy corta:
```json
{
  "success": false,
  "error": "La contraseña debe tener al menos 8 caracteres"
}
```

- **404 Not Found** - Token inválido:
```json
{
  "success": false,
  "error": "Token inválido o ya utilizado"
}
```

- **410 Gone** - Token expirado:
```json
{
  "success": false,
  "error": "Token expirado"
}
```

**Validaciones:**
- La nueva contraseña debe tener mínimo 8 caracteres
- El token debe ser válido, no usado y no expirado
- El token se invalida automáticamente después de usarse

**Ejemplos:**

```bash
# Confirmar reset con token
curl -X POST http://localhost:5000/api/password-reset/confirm \
  -H "Content-Type: application/json" \
  -d '{"token": "TOKEN_RECIBIDO", "new_password": "miNuevaPass123"}'
```

#### 4. Buscar usuarios
```
GET /api/usuarios
```

**Query Parameters (todos opcionales):**
- `email` - Busca por email (búsqueda parcial, case-insensitive)
- `nombre` - Busca por nombre (búsqueda parcial, case-insensitive)
- `activo` - Filtra por estado activo (true/false)

**Ejemplos:**

```bash
# Buscar todos los usuarios
curl "http://localhost:5000/api/usuarios"

# Buscar por email
curl "http://localhost:5000/api/usuarios?email=juan"

# Buscar por nombre
curl "http://localhost:5000/api/usuarios?nombre=García"

# Buscar usuarios activos
curl "http://localhost:5000/api/usuarios?activo=true"

# Combinar filtros
curl "http://localhost:5000/api/usuarios?nombre=juan&activo=true"
```

**Respuesta exitosa:**
```json
{
  "success": true,
  "total": 2,
  "usuarios": [
    {
      "id": 1,
      "nombre": "Juan Pérez",
      "email": "juan.perez@example.com",
      "activo": true,
      "is_admin": false,
      "fecha_creacion": "2026-02-02T10:30:00"
    }
  ]
}
```

#### 5. Health Check
```
GET /api/health
```

Verifica el estado de la API y la conexión a la base de datos.

## Estructura del Proyecto

```
.
├── app.py                      # Aplicación Flask principal
├── requirements.txt            # Dependencias Python
├── .env.example               # Ejemplo de configuración
├── setup_db.sql               # Script para crear tabla usuarios
├── password_reset_schema.sql  # Script para sistema de reset
├── generar_hash.py            # Utilidad para generar hashes de contraseñas
└── README.md                  # Documentación
```

## Credenciales de Prueba

**Usuario normal:**
- Email: `juan.perez@example.com`
- Password: `password123`
- Admin: `false`

**Usuario administrador:**
- Email: `admin@example.com`
- Password: `password123`
- Admin: `true`

**Usuario inactivo:**
- Email: `carlos.lopez@example.com`
- Password: `password123`
- Estado: Inactivo (retorna error 403)

## Seguridad

### Contraseñas
- Las contraseñas se almacenan hasheadas con `werkzeug.security`
- Se usa `pbkdf2:sha256` con 600,000 iteraciones
- Para generar nuevos hashes: `python generar_hash.py`

### Tokens de reset
- Generados con `secrets.token_urlsafe(32)` (criptográficamente seguros)
- Expiración automática: 1 hora
- Un solo uso: se invalidan al cambiar la contraseña
- Respuestas genéricas para prevenir enumeración de usuarios
- Normalización de emails (trim, lowercase) para evitar duplicados

### Logging
- Eventos de seguridad registrados en consola:
  - Solicitudes de reset de contraseña
  - Cambios de contraseña completados
  - Intentos con emails inexistentes

### Mantenimiento
- Función `cleanup_expired_tokens()` disponible para limpieza periódica
- Ejecutar manualmente o configurar con pg_cron:
```sql
-- Limpiar tokens expirados cada hora
SELECT cleanup_expired_tokens();
```

## Tecnologías

- **Flask** - Framework web
- **PostgreSQL** - Base de datos
- **psycopg2** - Driver PostgreSQL para Python
- **Werkzeug** - Utilities para hashing de contraseñas
- **secrets** - Generación de tokens criptográficamente seguros
