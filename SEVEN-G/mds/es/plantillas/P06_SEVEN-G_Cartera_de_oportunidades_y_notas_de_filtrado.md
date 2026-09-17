# Cartera de oportunidades y notas de filtrado

**Registra las oportunidades identificadas desde el negocio, las alternativas sin IA consideradas y el motivo por el que cada oportunidad avanza, espera o se descarta.**

| | |
|---|---|
| Documento | Plantilla P06 · Cartera de oportunidades y notas de filtrado |
| Versión | 0.1 (borrador de trabajo) |
| Fecha | 16-09-2026 |
| Autor | Fernando García · SEACHAD |
| Estado | Borrador para revisión. |

---

> **Aviso legal y exención de responsabilidad.** SEVEN-G es un marco metodológico de referencia que se ofrece «tal cual» y con fines exclusivamente informativos. No constituye asesoramiento jurídico, regulatorio, financiero ni profesional, ni garantiza el cumplimiento de ninguna norma. Las referencias a regulación general (como el Reglamento Europeo de IA, el RGPD, DORA o NIS2), a normas técnicas y a regulación específica de cada sector o jurisdicción pueden ser incompletas, no aplicar a un caso concreto o quedar desactualizadas por cambios normativos, interpretaciones o criterios de las autoridades posteriores a su fecha de consulta. **Cada organización que use SEVEN-G es la única responsable de identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio**, con el asesoramiento cualificado que corresponda. El autor y SEACHAD no asumen responsabilidad alguna por el uso que se haga de este contenido ni por las decisiones que se adopten con él. Los datos, cifras, compañías y casos de los ejemplos son ficticios o ilustrativos.

## 1. Instrucciones de uso

| Aspecto | Indicación |
|---|---|
| **Cuándo se usa** | En la fase 1 (Descubrimiento de oportunidades), después de G0 y antes de G1. |
| **Quién la rellena** | El responsable de producto de IA, con el área de negocio. Consulta al responsable técnico (datos y viabilidad preliminar) y al responsable de riesgos (líneas rojas). |
| **Quién la verifica** | Lite: oficina de IA. Enterprise: auditor de IA. |
| **Quién decide** | Lite: patrocinador. Enterprise: patrocinador, informando al comité de IA. |
| **Gate en que se revisa** | G1 · Oportunidad. |
| **Herramienta** | T01 · Registro de iniciativas (las oportunidades que avanzan quedan vinculadas a la iniciativa). |
| **Lite frente a Enterprise** | Lite puede omitir los campos y bloques marcados **(Enterprise)**. El filtrado y las alternativas sin IA son obligatorios en ambas. |

Reglas de cumplimentación:

- Las oportunidades parten de una **necesidad de negocio**, no de una tecnología disponible.
- Toda oportunidad que avance debe haber comparado **alternativas sin IA** (01 §6.3).
- El valor en esta fase es un **orden de magnitud estimado**. La cuantificación con fórmula se hace en P08.
- Las oportunidades descartadas se conservan con su motivo: son aprendizaje para la cartera.

---

## 2. Identificación

| Campo | Contenido | Guía |
|---|---|---|
| Código de la iniciativa | | IA-AAAA-NNN. |
| Nombre de la iniciativa | | |
| Versión del documento | | |
| Fecha | | DD-MM-AAAA. |
| Autor | | Nombre y rol. |
| Intensidad aplicable | | Lite · Enterprise. |

---

## 3. Método de descubrimiento

| Campo | Contenido | Guía |
|---|---|---|
| Ámbito analizado | | Procesos, decisiones o experiencias de cliente revisados. |
| Método | | Entrevistas, talleres, análisis de datos del proceso, reclamaciones, propuestas de empleados, otros. |
| Periodo | | Fechas del trabajo de descubrimiento. |
| Participantes | | Áreas y funciones que han participado. |
| Fuentes de datos consultadas **(Enterprise)** | | Informes, indicadores o muestras usados para dimensionar. |

---

## 4. Criterios de filtrado

Cada oportunidad se contrasta con estos criterios. Una respuesta "No" en F1, F3 o F6 impide que la oportunidad avance.

| Código | Criterio | Pregunta | Bloqueante |
|---|---|---|---|
| F1 | Necesidad de negocio | ¿Responde a un problema u oportunidad de negocio identificable, con un área que lo asume? | Sí |
| F2 | Encaje estratégico | ¿Encaja con la tesis de IA y con la ambición aprobada para la esfera en C2? | No, pero debe justificarse |
| F3 | Aportación de la IA | ¿La IA aporta algo que las alternativas sin IA no aportan? | Sí |
| F4 | Valor plausible | ¿El orden de magnitud del valor justifica formular una hipótesis? | No, pero debe justificarse |
| F5 | Datos | ¿Existen los datos necesarios, o pueden obtenerse legalmente y en plazo razonable? | No, pero debe justificarse |
| F6 | Líneas rojas | ¿Respeta las líneas rojas de P02, la política corporativa y las prácticas prohibidas por la regulación? | Sí |
| F7 | Capacidad | ¿Hay patrocinio y capacidad para abordarla en el plazo previsto? | No, pero debe justificarse |

---

## 5. Registro de oportunidades

### 5.1 Descripción

| ID | Oportunidad | Necesidad de negocio | Proceso o decisión | Área | Esfera propuesta | Ambición propuesta | Tipo de valor |
|---|---|---|---|---|---|---|---|
| OP-01 | | | | | | Optimizar · Aumentar · Transformar | Eficiencia · Retorno · Riesgo evitado · Cumplimiento |
| OP-02 | | | | | | | |
| *(ejemplo ilustrativo)* OP-01 | Asistente de respuesta a consultas sobre pedidos | Respuesta lenta en temporada alta | Atención de consultas de estado de pedido | Atención al cliente | 01 Cliente | Optimizar | Eficiencia |
| *(ejemplo ilustrativo)* OP-02 | Recomendación de fecha de entrega personalizada | Pérdida de ventas por plazos genéricos | Oferta de plazo en la compra | Comercio electrónico | 02 Producto y servicio | Aumentar | Retorno |

La esfera usa la lista de 03 §3.3. La ambición propuesta se justifica con P07.

### 5.2 Filtrado

| ID | F1 | F2 | F3 | F4 | F5 | F6 | F7 | Valor anual (orden de magnitud, estimado) | Resultado | Motivo |
|---|---|---|---|---|---|---|---|---|---|---|
| OP-01 | Sí · No | | | | | | | | Avanza · En reserva · Descartada | |
| OP-02 | | | | | | | | | | |
| *(ejemplo ilustrativo)* OP-01 | Sí | Sí | Sí | Sí | Sí | Sí | Sí | 50.000–100.000 € | Avanza | — |
| *(ejemplo ilustrativo)* OP-02 | Sí | Sí | Sí | Sin dato | No | Sí | Sí | Sin dato | En reserva | Datos insuficientes |

Resultados posibles:

- **Avanza**: pasa a formular la hipótesis de valor (fase 2).
- **En reserva**: cumple los criterios bloqueantes, pero falta una condición (datos, capacidad, prioridad). Se indica qué debe cambiar y cuándo revisarla.
- **Descartada**: no avanza. El motivo se toma de la lista codificada de 03 §3.3: Sin valor plausible · Hipótesis refutada · Datos insuficientes · Inviable técnicamente · Coste superior al valor · Riesgo inaceptable · Regulación · Sin adopción · Sustituida por otra solución · Cambio de prioridad estratégica.

---

## 6. Alternativas sin IA

Para cada oportunidad que avance o quede en reserva.

| ID | Alternativa | Descripción | Coste estimado | Valor estimado | Por qué es o no es suficiente | Decisión |
|---|---|---|---|---|---|---|
| | Rediseño del proceso · Reglas de negocio · Automatización sin IA · Formación · Cambio de política · Solución estándar sin IA · No actuar | | | | | Se descarta · Se combina con la IA · Sustituye a la IA |
| *(ejemplo ilustrativo)* OP-01 | Automatización sin IA | Mensaje automático con el estado del pedido extraído del sistema logístico. | Bajo | Resuelve consultas simples de estado | No resuelve consultas con incidencias ni preguntas abiertas. | Se combina con la IA: primera respuesta automática y asistente para el resto. |
| *(ejemplo ilustrativo)* OP-01 | No actuar | Mantener el modelo actual con refuerzo externo en temporada alta. | Coste actual | — | Coste creciente y tiempos de respuesta fuera de objetivo. | Se descarta |

Si una alternativa sin IA consigue un resultado equivalente con menor coste o riesgo, la oportunidad se descarta con motivo "Sustituida por otra solución".

---

## 7. Notas de filtrado

Una nota por cada oportunidad que avance.

| Campo | Contenido | Guía |
|---|---|---|
| ID de la oportunidad | | |
| Resumen de la decisión | | Por qué avanza, en tres a cinco líneas. |
| Qué aporta la IA | | Lo que las alternativas no consiguen. |
| Supuestos principales | | Hechos que se dan por ciertos al estimar el valor. |
| Incertidumbres que debe resolver la fase 2 | | Preguntas concretas para la hipótesis de valor y la línea base. |
| Datos necesarios | | Fuentes, disponibilidad y restricciones conocidas. |
| Riesgos preliminares | | Riesgos que conviene anticipar para la fase 3. |
| Esfera y ambición propuestas | | Referencia a P07 (columna "Propuesta"). |

---

## 8. Priorización **(Enterprise)**

Cuando avanzan varias oportunidades y no hay capacidad para todas.

| ID | Valor (orden de magnitud) | Inversión (orden de magnitud) | Complejidad | Riesgo preliminar | Encaje estratégico | Prioridad | Justificación |
|---|---|---|---|---|---|---|---|
| | | | Baja · Media · Alta | Bajo · Medio · Alto | Bajo · Medio · Alto | 1, 2, 3… | |

En esta fase la priorización es cualitativa. El neto adicional por euro de inversión adicional (regla 9) se calcula cuando existan P08 y P10.

---

## 9. Criterios de calidad

Los criterios formales de G1 están en el documento 21 (ver criterios G1.xx).

| # | Comprobación | Estado |
|---|---|---|
| 1 | Cada oportunidad nace de una necesidad de negocio con área responsable. | Cumple · No cumple · No aplica · Pendiente |
| 2 | Todas las oportunidades tienen resultado del filtrado. | |
| 3 | Las descartadas tienen motivo codificado. | |
| 4 | Las que avanzan han comparado al menos una alternativa sin IA, además de "no actuar". | |
| 5 | Las que avanzan tienen nota de filtrado con incertidumbres para la fase 2. | |
| 6 | Esfera y ambición propuestas usan la taxonomía y son coherentes con P07. | |
| 7 | Los importes se presentan como orden de magnitud estimado y "sin dato" se muestra como tal. | |

---

## 10. Aprobación y verificación

| Función | Rol en SEVEN-G | Nombre y cargo | Fecha | Firma o referencia |
|---|---|---|---|---|
| Elabora | Responsable de producto de IA | | | |
| Verifica | Oficina de IA (Lite) · Auditor de IA (Enterprise) | | | |
| Decide | Patrocinador de IA (en Enterprise, informando al comité de IA) | | | |

Separación de funciones: quien verifica no ha participado en el filtrado. La decisión se registra en P29.

---

## 11. Control de versiones

**Documento cumplimentado**

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| | | | |

**Plantilla**

| Versión | Fecha | Cambios |
|---|---|---|
| 0.1 | 16-09-2026 | Primera versión. Estructura alineada con 01 §6.3 y con los motivos codificados de 03 §3.3. |
