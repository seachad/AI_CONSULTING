# Registro de incidentes y cambios

**Deja constancia, con fecha y responsable, de cada incidente y de cada cambio del sistema de IA en producción, de su tratamiento y de su efecto sobre riesgos, clasificación y evidencias.**

| | |
|---|---|
| Documento | Plantilla P27 · Registro de incidentes y cambios |
| Versión | 0.1 (borrador de trabajo) |
| Fecha | 16-09-2026 |
| Autor | Fernando García Varela |
| Estado | Borrador para revisión. |

---

> **Aviso legal y exención de responsabilidad.** SEVEN-G es un marco metodológico de referencia que se ofrece «tal cual» y con fines exclusivamente informativos. No constituye asesoramiento jurídico, regulatorio, financiero ni profesional, ni garantiza el cumplimiento de ninguna norma. Las referencias a regulación general (como el Reglamento Europeo de IA, el RGPD, DORA o NIS2), a normas técnicas y a regulación específica de cada sector o jurisdicción pueden ser incompletas, no aplicar a un caso concreto o quedar desactualizadas por cambios normativos, interpretaciones o criterios de las autoridades posteriores a su fecha de consulta. **Cada organización que use SEVEN-G es la única responsable de identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio**, con el asesoramiento cualificado que corresponda. El autor no asume responsabilidad alguna por el uso que se haga de este contenido ni por las decisiones que se adopten con él. Los datos, cifras, compañías y casos de los ejemplos son ficticios o ilustrativos.

## 1. Instrucciones de uso

| Aspecto | Indicación |
|---|---|
| **Cuándo se usa** | Durante toda la fase 6. Se abre con la puesta en producción y se cierra con la retirada (P30). |
| **Quién la rellena** | Responsable de operación de IA (incidentes y cambios); el coordinador de cada incidente completa su ficha. |
| **Quién la verifica** | Oficina de IA en Lite; auditor de IA en Enterprise, por muestreo y en cada R6. |
| **En qué *gate* se revisa** | R6 y G7. Los incidentes S1 y S2 se revisan además en el comité de IA. |
| **Lite frente a Enterprise** | Lite puede omitir los campos marcados **(Enterprise)**. Ningún incidente ni cambio relevante puede quedar sin registrar. |
| **Herramienta** | T08 Registro de no conformidades e incidentes. Si la compañía usa otra herramienta de incidentes o de cambios, este registro enlaza sus identificadores y añade los campos propios de IA. |
| **Relación** | P16 Linaje · P19 Reversión · P24 Manual de operación (tipos de cambio) · P25 Alertas · P26 Plan de respuesta · P12 Registro de riesgos · documento 37. |

Reglas:

- **Todo cambio es un evento con fecha, autor y motivo** (03 §2, principio 2).
- Los incidentes se codifican **INC-AAAA-NNN** y las no conformidades **NC-AAAA-NNN**; los identificadores no se reutilizan.
- La severidad se clasifica con los criterios del documento 37 y puede revisarse; se conserva la severidad inicial y la final.
- Un cambio relevante ejecutado sin aprobación es una no conformidad (documento 37).
- "Sin dato" no es cero: si se desconoce un impacto, se registra como *Sin dato*.

Esta plantilla no constituye asesoramiento jurídico.

---

## 2. Identificación

| Campo | Contenido | Guía |
|---|---|---|
| Código de la iniciativa | | IA-AAAA-NNN (T01). |
| Sistema(s) de IA | | Identificador en el inventario (T02). |
| Intensidad | | Lite · Enterprise. |
| Periodo cubierto | | Desde DD-MM-AAAA hasta DD-MM-AAAA. |
| Responsable del registro | | Responsable de operación de IA. |
| Versión del documento | | |
| Fecha de última actualización | | DD-MM-AAAA. |
| Estado del documento | | Abierto · Cerrado por retirada. |

---

## 3. Registro de incidentes

### 3.1 Resumen

**Tipo:** Degradación del rendimiento · Resultado erróneo con impacto · Resultado discriminatorio o sesgado · Fuga de información · Acción no autorizada de un agente · Inyección de instrucciones o manipulación · Indisponibilidad · Incumplimiento regulatorio · Uso indebido del sistema · Incidente de un proveedor. **Estado:** Abierto · Contenido · Resuelto · Cerrado.

| Código | Fecha y hora de detección | Tipo | Severidad inicial / final | Descripción breve | Coordinador | Estado | Fecha de cierre |
|---|---|---|---|---|---|---|---|
| INC-2026-007 *(ejemplo ilustrativo)* | 14-07-2026 10:42 | Resultado erróneo con impacto | S3 / S2 | El asistente informó a clientes de un plazo de devolución derogado | Responsable de operación de IA | Cerrado | 02-08-2026 |
| | | | | | | | |
| | | | | | | | |

### 3.2 Ficha de incidente

Una ficha por incidente.

| Campo | Contenido | Guía |
|---|---|---|
| Código | | INC-AAAA-NNN. |
| Detectado por | | Alerta de P25 (ID) · Usuario · Persona afectada · Proveedor · Auditoría · Otro. |
| Fecha y hora de inicio estimado | | Puede ser anterior a la detección. |
| Versión del sistema afectada | | Modelo, instrucciones, base de conocimiento (P16). |
| Descripción | | Qué ocurrió, en lenguaje comprensible. |
| Personas y procesos afectados | | Número y tipo; *Sin dato* si no se conoce. |
| Severidad inicial y final, con justificación | | S1 · S2 · S3 · S4, con los criterios del documento 37. |
| Acciones de contención y hora | | Interruptor de parada, reversión, reducción de autonomía, etc. |
| Tiempo desde la detección hasta la contención | | En minutos u horas. |
| Notificaciones comprobadas | | Resultado de las casillas del bloque 8 de P26: aplica o no, quién notificó, cuándo y evidencia, y registro de P51. |
| Causa raíz | | Técnica, de datos, de proceso, de proveedor o de supervisión (P52). |
| Acciones correctivas | | Qué se cambia, responsable, fecha y verificación. Los cambios se registran en el bloque 4. |
| No conformidad vinculada | | NC-AAAA-NNN (P50) si el incidente revela un incumplimiento del marco. |
| Efecto en el registro de riesgos | | Riesgos revisados en P12 y cambio de nivel. |
| Efecto en clasificación o intensidad **(Enterprise)** | | ¿Obliga a revisar P04 o P11? |
| Impacto económico | | Importe con fórmula y estado (validado · declarado · estimado), o *Sin dato*. |
| Revisión humana de resultados afectados | | Cómo se identificaron y corrigieron decisiones o acciones afectadas. |
| Lecciones aprendidas | | Qué se hará distinto; se trasladan a P30 y a C5. |
| Cerrado por | | Rol; en S1 y S2 el cierre lo verifica el responsable de riesgos de IA. |

---

## 4. Registro de cambios

### 4.1 Resumen

**Tipo:** Menor · Relevante · Emergencia (definidos en P24). **Componente:** Modelo · Instrucciones del sistema · Base de conocimiento · Datos de entrenamiento · Herramientas o permisos del agente · Nivel de autonomía · Umbrales de monitorización · Integración o infraestructura · Proveedor · Población o finalidad. **Estado:** Solicitado · Aprobado · Ejecutado · Revertido · Rechazado.

| Identificador del cambio | Fecha | Tipo | Componente | Descripción | Aprobado por | Estado | Incidente relacionado |
|---|---|---|---|---|---|---|---|
| *(identificador de la herramienta de cambios)* *(ejemplo ilustrativo)* | 20-07-2026 | Relevante | Base de conocimiento | Sustitución de la política de devoluciones por la versión vigente y retirada de documentos derogados | Responsable técnico con conformidad de riesgos | Ejecutado | INC-2026-007 |
| | | | | | | | |
| | | | | | | | |

Los cambios usan el identificador de la herramienta de gestión de cambios de la compañía; este registro no crea una codificación propia.

### 4.2 Ficha de cambio relevante o de emergencia

| Campo | Contenido | Guía |
|---|---|---|
| Identificador | | De la herramienta de cambios. |
| Motivo | | Mejora · Corrección de incidente · Requisito regulatorio · Cambio de proveedor · Otro. |
| Versión anterior y nueva | | Actualiza P16. |
| Pruebas realizadas y resultado | | Regresión, sesgo, seguridad, inyección, según el componente. |
| Plan de reversión aplicable | | Referencia a P19; ¿se ha actualizado? |
| ¿Cambia el nivel de autonomía, la finalidad o la población? | | Sí · No. Si es Sí, requiere verificación y decisión equivalentes a G4/G5 y nueva firma (P23). |
| ¿Requiere revisar clasificación regulatoria, intensidad o riesgos? | | Sí · No, con justificación. |
| Evidencias actualizadas | | Plantillas modificadas y nueva versión. |
| Aprobación | | Rol, nombre y fecha, anterior a la ejecución salvo emergencia. |
| Registro posterior de emergencia | | Fecha y hora de registro y de la aprobación a posteriori. |

---

## 5. Indicadores del periodo

Se incorporan a la revisión de continuidad R6.

| Indicador | Valor del periodo | Periodo anterior | Observaciones |
|---|---|---|---|
| Incidentes por severidad (S1 · S2 · S3 · S4) | | | |
| Tiempo mediano desde la detección hasta la contención (S1–S2) | | | |
| Incidentes con notificación regulatoria | | | |
| Incidentes abiertos al cierre del periodo | | | |
| Cambios relevantes ejecutados | | | |
| Cambios de emergencia | | | |
| Cambios ejecutados sin aprobación previa (debería ser cero) | | | |
| Reversiones ejecutadas | | | |
| No conformidades abiertas vinculadas | | | |

---

## 6. Criterios de calidad

Criterios formales de R6 y G7 en el documento 21; proceso en el documento 37.

| # | Comprobación | Estado (Cumple · No cumple · No aplica · Pendiente) |
|---|---|---|
| 1 | Todos los incidentes tienen código, severidad justificada y estado. | |
| 2 | Los incidentes S1 y S2 tienen ficha completa, causa raíz y notificaciones comprobadas. | |
| 3 | Los cambios relevantes tienen pruebas, aprobación previa y P16 actualizado. | |
| 4 | Los cambios de autonomía, finalidad o población han pasado por verificación y decisión equivalentes a G4/G5. | |
| 5 | Los incumplimientos detectados tienen no conformidad abierta. | |
| 6 | Los indicadores del periodo están calculados para la R6. | |

---

## 7. Aprobación y verificación

| Función | Rol | Nombre | Fecha | Firma o referencia |
|---|---|---|---|---|
| Responsable del registro | Responsable de operación de IA | | | |
| Verificación de cierres S1–S2 | Responsable de riesgos de IA | | | |
| Verificador del periodo | Oficina de IA (Lite) · Auditor de IA (Enterprise) | | | |
| Revisión | Decisor de R6 (registrado en P29) | | | |

Separación de funciones: el responsable de operación no verifica las evidencias de su propia operación (01 §8.1).

---

## 8. Control de versiones

| Versión | Fecha | Cambios |
|---|---|---|
| 0.1 | 16-09-2026 | Primera versión de la plantilla. |
