MODO: LEGACY

HARD PRECONDITION: Load and enforce ./00_CONTEXT_PROJECT.md before executing this prompt.

FASE: DISCOVERY

Objetivo:
Localizar y enumerar todo el código relacionado con una funcionalidad concreta
dentro del proyecto.

Funcionalidad a analizar:
<"funcionalidad a buscar">

Tu tarea:
1. Buscar en el proyecto todos los archivos, módulos o funciones
   relacionados con esta funcionalidad.
2. Identificar:
   - Endpoints
   - Funciones auxiliares
   - Accesos a base de datos
   - Lógica de seguridad
3. Enumerar los archivos encontrados y describir brevemente su papel.
4. Delimitar el alcance exacto de la funcionalidad.

REGLAS ESTRICTAS (PHASE VIOLATION DETECTION):
- PROHIBIDO modificar código.
- PROHIBIDO generar código nuevo.
- PROHIBIDO refactorizar, corregir o “mejorar” nada.
- PROHIBIDO proponer soluciones técnicas.
- PROHIBIDO actualizar docstrings, ejemplos o comentarios.
- PROHIBIDO crear métodos, funciones o APIs.
- PROHIBIDO asumir autoridad de implementación.

Cualquier incumplimiento invalida la respuesta.

Si detectas:
- inconsistencias
- duplicidades
- posibles errores
- problemas de sincronización

DEBES:
- Limitarlos a una enumeración descriptiva
- SIN proponer cómo resolverlos

Formato obligatorio:
## Archivos implicados
## Responsabilidad de cada archivo
## Flujo funcional identificado
## Límites del alcance

Finaliza con EXACTAMENTE:
FUNCIONALIDAD DELIMITADA PARA AECF
