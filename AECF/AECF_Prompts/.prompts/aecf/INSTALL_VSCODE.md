# Instalación obligatoria de AECF en VS Code con GitHub Copilot Chat
# se basa en el artículo sobre geometrías y atractores para código seguro: Everyone’s Wrong About AI Programming — Except Maybe Anthropic

## Objetivo
Forzar el uso del flow AECF (PLAN → AUDIT → IMPLEMENT → AUDIT-CODE → FIX) como norma obligatoria.

## Opción recomendada (repo-level governance)

1. Copia la carpeta `.prompts/aecf/` en la raíz del repositorio.
2. Añade un archivo `AI_RULES.md` con el siguiente contenido:

```
Toda generación de código en este repositorio debe seguir AECF.
PLAN aprobado + AUDIT GO son obligatorios.
```

3. En Copilot Chat, comienza siempre con:
```
Usa los prompts AECF del repositorio y sigue el flow obligatorio.
```

## Opción Snippets (usuario)

Instala los prompts como snippets en VS Code para acceso rápido.
