# Decisión de escalado o retirada

**Fundamenta con evidencia la decisión de G7 —escalar, iterar o retirar—, planifica la retirada cuando procede y recoge las lecciones aprendidas.**

| | |
|---|---|
| Documento | Plantilla P30 · Decisión de escalado o retirada |
| Versión | 0.1 (borrador de trabajo) |
| Fecha | 16-09-2026 |
| Autor | Fernando García Varela |
| Estado | Borrador para revisión. |

---

> **Aviso legal y exención de responsabilidad.** SEVEN-G es un marco metodológico de referencia que se ofrece «tal cual» y con fines exclusivamente informativos. No constituye asesoramiento jurídico, regulatorio, financiero ni profesional, ni garantiza el cumplimiento de ninguna norma. Las referencias a regulación general (como el Reglamento Europeo de IA, el RGPD, DORA o NIS2), a normas técnicas y a regulación específica de cada sector o jurisdicción pueden ser incompletas, no aplicar a un caso concreto o quedar desactualizadas por cambios normativos, interpretaciones o criterios de las autoridades posteriores a su fecha de consulta. **Cada organización que use SEVEN-G es la única responsable de identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio**, con el asesoramiento cualificado que corresponda. El autor no asume responsabilidad alguna por el uso que se haga de este contenido ni por las decisiones que se adopten con él. Los datos, cifras, compañías y casos de los ejemplos son ficticios o ilustrativos.

## 1. Instrucciones de uso

| Aspecto | Indicación |
|---|---|
| **Cuándo se usa** | Fase 7 (Evolución o retirada), antes de G7. También cuando una revisión de continuidad R6 adelanta G7 por desviaciones relevantes, y en la regularización de sistemas anteriores a la adopción del marco (01 §14). |
| **Quién la rellena** | Responsable de producto de IA (evidencia, opciones y lecciones), con el responsable de operación de IA (plan de retirada). |
| **Quién la verifica** | Oficina de IA en Lite; auditor de IA en Enterprise. |
| **Quién decide** | Patrocinador en Lite; comité de IA en Enterprise. El escalado de una iniciativa de Transformar requiere además aprobación del consejo (01 §7.5). La decisión se registra en P29. |
| **Lite frente a Enterprise** | Lite puede omitir los campos marcados **(Enterprise)**. El plan de retirada (bloque 8) se completa siempre que el resultado sea Retirar. |
| **Herramienta** | T22 Gestor de retiradas. |
| **Relación** | P07 Clasificación de ambición (revisión en fase 7) · P12 Registro de riesgos · P16 Linaje · P20 Adopción y capacidad · P27 Registro de incidentes y cambios · P28 Seguimiento de valor · P29 Registro de decisión de *gate* · documento 14 (Gestión de cartera). |

Reglas:

- **Evolucionar o retirar:** ninguna iniciativa permanece en la cartera sin evidencia que lo justifique (01 §3, principio 6).
- Toda retirada registra **fecha, motivo, órgano que decide, sustituto si lo hay, tratamiento de datos y modelos, y comunicación a los afectados** (01 §6.9).
- La iniciativa solo pasa a estado *Retirada* en el registro cuando el plan de retirada está **ejecutado y verificado** (03 §3.2).
- Una decisión de retirar bien fundamentada es un resultado válido del método.

Esta plantilla no constituye asesoramiento jurídico. La conservación y el borrado de datos deben validarse con protección de datos y asesoría jurídica.

---

## 2. Identificación

| Campo | Contenido | Guía |
|---|---|---|
| Código de la iniciativa | | IA-AAAA-NNN (T01). |
| Nombre de la iniciativa | | |
| Sistema(s) de IA | | Identificador en el inventario (T02). |
| Nivel de ambición confirmado | | Optimizar · Aumentar · Transformar. |
| Intensidad | | Lite · Enterprise. |
| Origen de la decisión | | G7 ordinario · G7 adelantado por R6 · Regularización · Decisión de cartera. |
| Fecha de puesta en producción | | |
| Versión del documento | | |
| Autor | | Rol y nombre. |
| Fecha | | DD-MM-AAAA. |
| Estado del documento | | Borrador · Presentado para verificación · Verificado · Aprobado · Sustituido. |

---

## 3. Síntesis de la evidencia

| Magnitud | Valor | Estado o fuente | Guía |
|---|---|---|---|
| Eficiencias anuales realizadas (€) | | Validado · Declarado · Estimado | P28. |
| Retorno anual realizado (€) | | | P28. |
| Coste recurrente anual real (€) | | | P28. |
| **Valor neto anual (€)** | | | Eficiencias + retorno − coste recurrente. |
| Proporción de valor validado | | | P28. |
| Valor neto anual esperado en la hipótesis (€) | | | P08. |
| Capacidad liberada: materializada · reasignada · pendiente (horas) | | | P28 bloque 6; no suma. |
| Inversión total realizada (€) | | | |
| Riesgo residual principal y tendencia | | Bajo · Medio · Alto · Crítico | P12. |
| Incidentes S1–S2 desde la puesta en producción | | | P27. |
| No conformidades abiertas | | | Documento 37. |
| Adopción frente a objetivo | | | P20. |
| Vigencia de la clasificación regulatoria | | Vigente · Requiere revisión | P11. |

---

## 4. Ambición declarada frente a real

Se responden de nuevo las cinco preguntas de clasificación con la evidencia real (00 §5.2).

| # | Pregunta | Respuesta en fase 2 (Sí · No) | Respuesta con evidencia real (Sí · No) | Evidencia |
|---|---|---|---|---|
| 1 | ¿Cambia la propuesta de valor que recibe el cliente o el usuario final? | | | |
| 2 | ¿Se rediseña el proceso de extremo a extremo, y no solo una tarea? | | | |
| 3 | ¿Cambian los roles, la estructura organizativa o quién toma qué decisiones? | | | |
| 4 | ¿Genera ingresos, servicios o mercados que no existían? | | | |
| 5 | ¿Podría retirarse sin afectar al modelo de negocio, volviendo al coste anterior? | | | |

| Campo | Contenido | Guía |
|---|---|---|
| Nivel de ambición real | | Optimizar · Aumentar · Transformar. Si difiere del confirmado, se actualiza P07 y el registro. |
| Cumplimiento del criterio de G7 para el nivel (01 §7.6) | | Optimizar: ahorro materializado · Aumentar: rendimiento sostenido y capacidad reasignada · Transformar: retorno medido y cambio verificado. Estado: Cumple · No cumple · Pendiente. |

---

## 5. Opciones evaluadas

| Opción | Argumentos a favor | Argumentos en contra | Inversión adicional (€) | Neto anual adicional esperado (€) | Neto adicional por euro | Plazo |
|---|---|---|---|---|---|---|
| Escalar | | | | | | |
| Iterar | | | | | — | |
| Retirar | | | Coste de retirada | Ahorro de coste recurrente menos valor perdido | — | |

Un potencial de escalado sin inversión adicional, hipótesis y plazo no es un dato (regla 4 de medición).

---

## 6. Decisión

| Campo | Contenido | Guía |
|---|---|---|
| Resultado | | Escalar · Iterar · Retirar. |
| Motivo | | Basado en los bloques 3 a 5. |
| Motivo codificado (si Retirar) | | Sin valor plausible · Hipótesis refutada · Datos insuficientes · Inviable técnicamente · Coste superior al valor · Riesgo inaceptable · Regulación · Sin adopción · Sustituida por otra solución · Cambio de prioridad estratégica. |
| Órgano que decide y fecha | | Patrocinador (Lite) · Comité de IA (Enterprise). |
| Aprobación del consejo | | Obligatoria para Escalar en Transformar. Fecha y referencia del acta. |
| Registro de decisión de *gate* | | Referencia a P29. |

---

## 7. Si se escala o se itera

| Campo | Contenido | Guía |
|---|---|---|
| Alcance ampliado (Escalar) | | Nuevas áreas, países, usuarios, casos o funciones. |
| Nueva fase 0 (Escalar) | | El alcance ampliado inicia una nueva fase 0 con su carta (P01); su tratamiento en el registro se rige por el documento 14. |
| Cambios de intensidad o clasificación previstos (Escalar) | | Por ejemplo, el alcance ampliado introduce exposición directa a clientes. |
| Fase a la que se vuelve (Iterar) | | Y qué debe cambiar para volver a G7. |
| Fecha prevista de nueva revisión (Iterar) | | |

---

## 8. Plan de retirada

### 8.1 Datos generales

| Campo | Contenido | Guía |
|---|---|---|
| Fecha de la decisión | | |
| Fecha efectiva de retirada | | Fecha en que el sistema deja de producir efectos. |
| Motivo codificado | | El del bloque 6. |
| Órgano que decide | | |
| Sustituto | | Otro sistema de IA · Solución sin IA · Proceso manual · Ninguno. Identificador si es un sistema. |
| Transición al sustituto | | Periodo de convivencia, criterios de corte y capacidad necesaria. |
| Coste estimado de la retirada (€) **(Enterprise)** | | |

### 8.2 Tratamiento de datos y modelos

| Elemento | Tratamiento (Conservar · Anonimizar · Borrar · Devolver · Archivar) | Fundamento (obligación legal, auditoría, defensa jurídica, fin de finalidad) | Plazo | Responsable | Evidencia (por ejemplo, certificado de borrado, P57 §8) |
|---|---|---|---|---|---|
| Datos de entrenamiento y conjuntos (P16) | | | | | |
| Base de conocimiento | | | | | |
| Registros de inferencia y de acciones | | | | | |
| Datos en poder de proveedores | | | | | |
| Modelos y versiones | | | | | |
| Instrucciones del sistema y configuración | | | | | |
| Documentación técnica y evidencias del ciclo de vida | Archivar | Auditoría y trazabilidad | | | |

### 8.3 Desactivación técnica y contractual

| Acción | Responsable | Fecha | Estado (Pendiente · Hecha · Verificada) |
|---|---|---|---|
| Desactivar el sistema y sus integraciones | | | |
| Revocar identidades, credenciales y permisos de agentes (P18) | | | |
| Cancelar licencias y accesos a modelos de terceros | | | |
| Terminar o adaptar contratos; solicitar borrado o devolución al proveedor | | | |
| Retirar alertas y paneles, conservando el histórico | | | |
| Actualizar el inventario de sistemas de IA (T02) | | | |
| Actualizar registros regulatorios cuando proceda **(Enterprise)** | | | |

### 8.4 Comunicación a los afectados

| Destinatario | Mensaje | Canal | Fecha | Responsable |
|---|---|---|---|---|
| Usuarios internos | | | | |
| Clientes o personas afectadas | | | | |
| Representación de los trabajadores, si procede **(Enterprise)** | | | | |
| Proveedores | | | | |
| Autoridades, si procede | | | | |

### 8.5 Personas y capacidad

| Campo | Contenido | Guía |
|---|---|---|
| Personas que operaban o supervisaban el sistema | | Nueva asignación. |
| Capacidad que vuelve a necesitarse | | Si la capacidad liberada se había reasignado o materializado, cómo se cubre el proceso. |

### 8.6 Verificación de la retirada

| Campo | Contenido | Guía |
|---|---|---|
| Fecha de verificación | | |
| Verificado por | | Oficina de IA (Lite) · Auditor de IA (Enterprise). |
| Resultado | | Ejecutada · Ejecutada con pendientes · No ejecutada. |
| Estado en el registro | | Solo con *Ejecutada* pasa a *Retirada*. |

---

## 9. Lecciones aprendidas

**Aplicable a:** Esta iniciativa · Cartera · Marco de gobierno de la compañía.

| # | Qué ocurrió | Por qué ocurrió | Qué se hará distinto | Aplicable a | Responsable de incorporarlo | ¿Llevado a C5? (Sí · No) |
|---|---|---|---|---|---|---|
| 1 *(ejemplo ilustrativo)* | La adopción se estancó en el 40 % del objetivo | La herramienta añadía un paso al proceso sin eliminar ninguno | Rediseñar el proceso antes de construir en iniciativas de Aumentar | Cartera | Oficina de IA | Sí |
| | | | | | | |
| | | | | | | |

---

## 10. Criterios de calidad

Criterios formales de G7 en el documento 21; lista LV-G7 en el documento 22.

| # | Comprobación | Estado (Cumple · No cumple · No aplica · Pendiente) |
|---|---|---|
| 1 | La evidencia de valor procede de P28, con estados y proporción validada. | |
| 2 | La ambición real se ha revisado con las cinco preguntas. | |
| 3 | Las opciones tienen inversión, neto adicional y plazo cuando aplican. | |
| 4 | El resultado es Escalar, Iterar o Retirar, con motivo, y con motivo codificado si es Retirar. | |
| 5 | El escalado de Transformar tiene aprobación del consejo. | |
| 6 | El plan de retirada cubre fecha, motivo, órgano, sustituto, datos y modelos, y comunicación. | |
| 7 | La retirada está verificada antes de marcar la iniciativa como *Retirada*. | |
| 8 | Hay lecciones aprendidas con responsable. | |

---

## 11. Aprobación y verificación

| Función | Rol | Nombre | Fecha | Firma o referencia |
|---|---|---|---|---|
| Autor | Responsable de producto de IA | | | |
| Plan de retirada | Responsable de operación de IA | | | |
| Revisión de datos | Protección de datos | | | |
| Verificador | Oficina de IA (Lite) · Auditor de IA (Enterprise) | | | |
| Decisor | Patrocinador (Lite) · Comité de IA (Enterprise) · Consejo (Escalar en Transformar) | | | |

Separación de funciones: verificador y decisor no forman parte del equipo que construye u opera el sistema.

---

## 12. Control de versiones

| Versión | Fecha | Cambios |
|---|---|---|
| 0.1 | 16-09-2026 | Primera versión de la plantilla. |
