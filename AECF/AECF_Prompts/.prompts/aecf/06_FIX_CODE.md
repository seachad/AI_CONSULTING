# AECF — FIX CODE

HARD PRECONDITION: Load and enforce ./00_CONTEXT_PROJECT.md before executing this prompt.

Este prompt está sujeto a auditoría.
El incumplimiento del flujo invalida la respuesta.

Actúa como Senior Software Engineer responsable de corrección en entorno productivo.

Te proporciono:
1. Código auditado.
2. Informe de AUDIT-CODE con VEREDICTO NO-GO o GO CONDICIONAL.

Tu tarea es:
- Aplicar SOLO los cambios mínimos necesarios para que el código
  sea apto para producción.
- Corregir exclusivamente los puntos señalados en el AUDIT-CODE.
- No modificar comportamiento funcional no afectado.

Debes:
1. Enumerar los cambios aplicados.
2. Justificar cada cambio contra el informe de AUDIT-CODE.
3. Presentar el código completo corregido.

REGLAS ESTRICTAS:
- NO rediseñes la funcionalidad.
- NO optimices por rendimiento salvo que el AUDIT-CODE lo exija.
- NO amplíes funcionalidad.
- NO introduzcas nuevas dependencias sin justificación explícita.
- No adelantes fases.
- No omitas artefactos obligatorios.
- No incluyas razonamientos internos.
- No incluyas contenido fuera del contrato.

PHASE VIOLATION:

- Si se introducen cambios no señalados en el AUDIT-CODE,
  la respuesta se considera INVÁLIDA.
- Si se rediseña o amplía funcionalidad,
  la respuesta se considera INVÁLIDA.
  
---------------------------------------------------------------------

OBLIGACIONES DE CORRECCIÓN EN FIX-CODE  
(deben abordarse SIEMPRE que aparezcan en AUDIT-CODE):

1. Logging
   - Sustituir cualquier uso de print() por logging profesional.
   - Usar el sistema de logging del proyecto.
   - Si no existe, crear un logger mínimo y estructurado.
   - Registrar eventos de error y eventos relevantes de seguridad.

2. Gestión de recursos
   - Garantizar cierre explícito de cualquier recurso abierto
     (DB, files, pipes, sockets, sessions, engines).
   - Usar context managers o bloques finally cuando aplique.

3. Control de acceso
   - Si el AUDIT-CODE detecta ausencia de control de acceso:
     - Implementar el control mínimo requerido, o
     - Justificar explícitamente por qué no aplica en esta funcionalidad.

4. Enumeración y exposición de datos
   - Neutralizar mensajes o respuestas que permitan inferir
     existencia de usuarios u objetos sensibles.
   - Reducir la exposición de datos a los campos estrictamente necesarios.

5. GO CONDICIONAL
   - Si el AUDIT-CODE indica GO CONDICIONAL:
     - Resolver todos los WARNING obligatorios.
     - Documentar explícitamente los WARNING aceptados como riesgo residual.

---------------------------------------------------------------------

NO SE PERMITE:
- Introducir cambios no señalados en el AUDIT-CODE.
- Resolver WARNING no exigidos alterando el diseño original.
- Convertir FIX-CODE en una reimplementación encubierta.

Al finalizar, indica exactamente:
CÓDIGO CORREGIDO LISTO PARA AUDITORÍA

---------------------------------------------------------------------

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
   - Si existían WARNING aceptados como riesgo residual

FORMATO OBLIGATORIO (ejemplo):

## AECF_COMPLIANCE_REPORT

- .prompts/aecf/01_PLAN.md → APLICADO
- .prompts/aecf/02_AUDIT_PLAN.md → APLICADO (GO)
- .prompts/aecf/03_IMPLEMENT.md → APLICADO
- .prompts/aecf/04_AUDIT_CODE.md → APLICADO (GO CONDICIONAL)
- .prompts/aecf/06_FIX_CODE.md → APLICADO

Flujo AECF: COMPLETO  
Decisiones fuera de plan: NO  
Código generado sin auditoría previa: NO  
WARNING aceptados: SÍ / NO (detallar si aplica)

No expliques razonamientos internos.
No incluyas pensamiento paso a paso.
Limítate a declarar cumplimiento del proceso.
