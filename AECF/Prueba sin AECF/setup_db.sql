-- Script para crear la tabla de usuarios
CREATE TABLE IF NOT EXISTS usuarios (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    nombre VARCHAR(255) NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    activo BOOLEAN DEFAULT TRUE,
    is_admin BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla para tokens de reset de contraseña
CREATE TABLE IF NOT EXISTS password_reset_tokens (
    id SERIAL PRIMARY KEY,
    usuario_id INTEGER NOT NULL REFERENCES usuarios(id) ON DELETE CASCADE,
    token VARCHAR(255) NOT NULL UNIQUE,
    expira_en TIMESTAMP NOT NULL,
    usado BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Índice para búsqueda rápida de tokens
CREATE INDEX IF NOT EXISTS idx_password_reset_tokens_token ON password_reset_tokens(token);
CREATE INDEX IF NOT EXISTS idx_password_reset_tokens_usuario_id ON password_reset_tokens(usuario_id);

-- Datos de ejemplo
-- Contraseñas: admin123 para admin, user123 para el resto
-- Hash generado con werkzeug.security.generate_password_hash('password')
INSERT INTO usuarios (email, nombre, password_hash, activo, is_admin) VALUES
    ('admin@example.com', 'Administrador', 'pbkdf2:sha256:600000$random$hash1', TRUE, TRUE),
    ('juan.perez@example.com', 'Juan Pérez', 'pbkdf2:sha256:600000$random$hash2', TRUE, FALSE),
    ('maria.garcia@example.com', 'María García', 'pbkdf2:sha256:600000$random$hash3', TRUE, FALSE),
    ('carlos.lopez@example.com', 'Carlos López', 'pbkdf2:sha256:600000$random$hash4', FALSE, FALSE),
    ('ana.martinez@example.com', 'Ana Martínez', 'pbkdf2:sha256:600000$random$hash5', TRUE, FALSE);

-- Nota: Para generar hashes reales, ejecuta este script Python:
-- from werkzeug.security import generate_password_hash
-- print(generate_password_hash('tu_password'))
