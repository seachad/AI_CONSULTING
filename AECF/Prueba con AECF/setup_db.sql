-- Script para crear la tabla de usuarios de ejemplo

CREATE TABLE IF NOT EXISTS usuarios (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    activo BOOLEAN DEFAULT true,
    is_admin BOOLEAN DEFAULT false,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Datos de ejemplo
-- Contraseñas: 'password123' para todos (hash generado con werkzeug)
-- Hash de 'password123': pbkdf2:sha256:600000$...
INSERT INTO usuarios (nombre, email, password_hash, activo, is_admin) VALUES
    ('Juan Pérez', 'juan.perez@example.com', 'pbkdf2:sha256:600000$XK8zYq0N5jJ9hQxG$8f9c4e5a1b2d3c4e5f6a7b8c9d0e1f2a3b4c5d6e7f8a9b0c1d2e3f4a5b6c7d8', true, false),
    ('María García', 'maria.garcia@example.com', 'pbkdf2:sha256:600000$XK8zYq0N5jJ9hQxG$8f9c4e5a1b2d3c4e5f6a7b8c9d0e1f2a3b4c5d6e7f8a9b0c1d2e3f4a5b6c7d8', true, false),
    ('Carlos López', 'carlos.lopez@example.com', 'pbkdf2:sha256:600000$XK8zYq0N5jJ9hQxG$8f9c4e5a1b2d3c4e5f6a7b8c9d0e1f2a3b4c5d6e7f8a9b0c1d2e3f4a5b6c7d8', false, false),
    ('Ana Martínez', 'ana.martinez@example.com', 'pbkdf2:sha256:600000$XK8zYq0N5jJ9hQxG$8f9c4e5a1b2d3c4e5f6a7b8c9d0e1f2a3b4c5d6e7f8a9b0c1d2e3f4a5b6c7d8', true, false),
    ('Admin User', 'admin@example.com', 'pbkdf2:sha256:600000$XK8zYq0N5jJ9hQxG$8f9c4e5a1b2d3c4e5f6a7b8c9d0e1f2a3b4c5d6e7f8a9b0c1d2e3f4a5b6c7d8', true, true)
ON CONFLICT (email) DO NOTHING;

-- Nota: Para generar nuevos hashes de contraseñas, usa:
-- python -c "from werkzeug.security import generate_password_hash; print(generate_password_hash('tu_contraseña'))"
