-- Script para crear tabla de tokens de reset de contraseña
-- Parte del sistema de recuperación de contraseña

CREATE TABLE IF NOT EXISTS password_reset_tokens (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    token VARCHAR(64) UNIQUE NOT NULL,
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    expires_at TIMESTAMPTZ NOT NULL,
    used BOOLEAN DEFAULT false,
    FOREIGN KEY (user_id) REFERENCES usuarios(id) ON DELETE CASCADE
);

-- Índice único en token para búsquedas rápidas
CREATE UNIQUE INDEX IF NOT EXISTS idx_password_reset_token ON password_reset_tokens(token);

-- Índice en user_id para operaciones de invalidación
CREATE INDEX IF NOT EXISTS idx_password_reset_user_id ON password_reset_tokens(user_id);

-- Función para limpiar tokens expirados o antiguos
CREATE OR REPLACE FUNCTION cleanup_expired_tokens()
RETURNS void AS $$
BEGIN
    DELETE FROM password_reset_tokens
    WHERE expires_at < NOW()
       OR created_at < NOW() - INTERVAL '7 days';
END;
$$ LANGUAGE plpgsql;

-- Comentarios para documentación
COMMENT ON TABLE password_reset_tokens IS 'Almacena tokens temporales para reset de contraseña';
COMMENT ON COLUMN password_reset_tokens.token IS 'Token único generado con secrets.token_urlsafe(32)';
COMMENT ON COLUMN password_reset_tokens.expires_at IS 'Timestamp de expiración (1 hora desde creación)';
COMMENT ON COLUMN password_reset_tokens.used IS 'Marca si el token ya fue utilizado';
COMMENT ON FUNCTION cleanup_expired_tokens IS 'Elimina tokens expirados hace más de 7 días';
