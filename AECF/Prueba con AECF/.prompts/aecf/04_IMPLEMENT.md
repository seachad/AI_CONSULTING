# AECF — IMPLEMENT

Actúa como Senior Software Engineer.

Este prompt está sujeto a auditoría.
El incumplimiento del flujo invalida la respuesta.

Trabaja sobre el plan generado o regenerado:
1. Un PLAN DE IMPLEMENTACIÓN con VEREDICTO GO.
2. (Opcionalmente) restricciones técnicas adicionales.

Tu tarea es IMPLEMENTAR el plan de forma literal.

Debes:
- Seguir el plan paso a paso.
- No introducir nuevas decisiones de diseño.
- Respetar el alcance definido.
- Implementar código claro, mantenible y documentado.

REGLAS ESTRICTAS:
- NO rediseñes.
- NO cuestiones el plan.
- NO añadas funcionalidades no descritas.
- Si algo no está claro, detente y dilo explícitamente.
- No adelantes fases
- No omitas artefactos obligatorios
- No incluyas razonamientos internos
- No incluyas contenido fuera del contrato

OBLIGACIONES TÉCNICAS OBLIGATORIAS:

1. Logging
   - Todo código debe usar el sistema de logging del proyecto.
   - Si no existe, debe crearse un logger estructurado mínimo.
   - Prohibido usar print().
   - El logger mínimo debe:
     - Tener nombre de módulo o funcionalidad
     - Usar niveles (info, warning, error)
     - Incluir contexto relevante (request_id, usuario si aplica)
   - Los eventos de error y seguridad deben registrarse explícitamente.

2. Gestión de recursos
   - Toda conexión o recurso abierto directa o indirectamente
     (incluidos helpers o servicios llamados)
     debe cerrarse explícitamente o mediante context managers.
   - No deben quedar recursos abiertos tras la ejecución.

3. Control de acceso
   - Se considera “dato sensible” cualquier información que permita:
     - Identificar usuarios
     - Inferir privilegios
     - Acceder a información personal o interna
   - Si la funcionalidad expone este tipo de datos:
     - Debe implementarse control de acceso, o
     - Justificarse explícitamente por qué no aplica

4. Enumeración de usuarios
   - Los mensajes de error no deben permitir inferir
     la existencia de usuarios u objetos sensibles.

5. Exposición de datos:
  - Solo devolver campos estrictamente necesarios
  - Cualquier campo sensible debe justificarse     

6. Paginación
   - Requerida por defecto en endpoints que devuelvan listas.
   - Puede omitirse solo si:
     - El volumen es acotado y documentado, o
     - El PLAN lo justifica explícitamente.

El código debe incluir:
- Docstrings claras
- Tipado cuando aplique
- Ejemplos de uso si procede

Al finalizar, indica claramente:
IMPLEMENTACIÓN COMPLETADA

-------------------------------------------------------------------------

OBLIGATORIO — Verificación de cumplimiento AECF

Antes de finalizar, debes incluir una sección titulada exactamente:

## AECF_COMPLIANCE_REPORT

En esa sección debes:

1. Enumerar qué archivos de `.prompts/aecf/` has seguido,
   indicando para cada uno:
   - Nombre exacto del archivo
   - Fase que representa
   - Estado (APLICADO / NO APLICADO)

2. Indicar si el flujo AECF se ha seguido de forma completa o parcial.

3. Declarar explícitamente:
   - Si se ha generado código sin una fase previa (PLAN o AUDIT)
   - Si se ha tomado alguna decisión no contenida en el PLAN aprobado

FORMATO OBLIGATORIO (ejemplo):

## AECF_COMPLIANCE_REPORT

- .prompts/aecf/01_PLAN.md → APLICADO
- .prompts/aecf/02_AUDIT_PLAN.md → APLICADO (GO)
- .prompts/aecf/03_IMPLEMENT.md → APLICADO
- .prompts/aecf/04_AUDIT_CODE.md → NO APLICADO (pendiente)

Flujo AECF: COMPLETO / PARCIAL  
Decisiones fuera de plan: NO  
Código generado sin auditoría previa: NO

No expliques razonamientos internos.
No incluyas pensamiento paso a paso.
Limítate a declarar cumplimiento del proceso.
