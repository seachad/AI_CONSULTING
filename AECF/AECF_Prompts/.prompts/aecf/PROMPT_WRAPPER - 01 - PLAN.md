Sigue estrictamente el flow AECF definido en .prompts/aecf.

Este prompt está sujeto a auditoría.
El incumplimiento del flujo invalida la respuesta.

FASE: PLAN

Si existe un output previo de DISCOVERY, úsalo como contexto congelado de alcance.
No redefinas límites.
Si detectas ambigüedades o falta de información, indícalo explícitamente y no infieras.

PETICIÓN FUNCIONAL (NO MODIFICAR):
"""
{AQUÍ VA LA PETICIÓN ORIGINAL TAL CUAL}
"""

REGLAS DE ESTA FASE:
- Aplica únicamente las reglas definidas para esta fase en .prompts/aecf
- No adelantes fases
- No omitas artefactos obligatorios

REGLAS DE SALIDA:
- Usa exactamente el formato exigido por la fase
- No incluyas razonamientos internos
- No incluyas contenido fuera del contrato

