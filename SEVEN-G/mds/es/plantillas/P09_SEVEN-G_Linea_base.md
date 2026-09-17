# Línea base

**Mide la situación de partida de las métricas de la hipótesis de valor, con método reproducible, para que el valor posterior sea incremental y verificable.**

| | |
|---|---|
| Documento | Plantilla P09 · Línea base |
| Versión | 0.1 (borrador de trabajo) |
| Fecha | 16-09-2026 |
| Autor | Fernando García · SEACHAD |
| Estado | Borrador para revisión. |

---

> **Aviso legal y exención de responsabilidad.** SEVEN-G es un marco metodológico de referencia que se ofrece «tal cual» y con fines exclusivamente informativos. No constituye asesoramiento jurídico, regulatorio, financiero ni profesional, ni garantiza el cumplimiento de ninguna norma. Las referencias a regulación general (como el Reglamento Europeo de IA, el RGPD, DORA o NIS2), a normas técnicas y a regulación específica de cada sector o jurisdicción pueden ser incompletas, no aplicar a un caso concreto o quedar desactualizadas por cambios normativos, interpretaciones o criterios de las autoridades posteriores a su fecha de consulta. **Cada organización que use SEVEN-G es la única responsable de identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio**, con el asesoramiento cualificado que corresponda. El autor y SEACHAD no asumen responsabilidad alguna por el uso que se haga de este contenido ni por las decisiones que se adopten con él. Los datos, cifras, compañías y casos de los ejemplos son ficticios o ilustrativos.

## 1. Instrucciones de uso

| Aspecto | Indicación |
|---|---|
| **Cuándo se usa** | En la fase 2, antes de G2, en paralelo al lienzo de hipótesis de valor (P08). La línea base se congela en G2 y se usa en las fases 5, 6 y 7. |
| **Quién la rellena** | El responsable de producto de IA, con el propietario de los datos del proceso. Control de gestión revisa los valores unitarios. |
| **Quién la verifica** | Lite: oficina de IA. Enterprise: auditor de IA. |
| **Quién decide** | Se aprueba con G2: patrocinador (Lite) · comité de IA (Enterprise). |
| **Gate en que se revisa** | G2 · Hipótesis. Se vuelve a consultar en G5, R6 y G7. |
| **Herramienta** | T11 · Lienzo y calculadora de hipótesis de valor. |
| **Lite frente a Enterprise** | Lite puede omitir los campos y bloques marcados **(Enterprise)**. La definición de métricas, el periodo, el método y los resultados son obligatorios en ambas. |

Reglas de cumplimentación:

- La línea base se **mide**; solo se estima si se justifica por qué no puede medirse y cómo se corregirá (01 §6.4).
- "Sin dato" no es cero: los datos ausentes se muestran como ausentes y nunca se rellenan sin indicarlo (regla 8).
- Las métricas deben ser **las mismas**, con la misma definición, que se usarán para medir el resultado.

---

## 2. Identificación

| Campo | Contenido | Guía |
|---|---|---|
| Código de la iniciativa | | IA-AAAA-NNN. |
| Nombre de la iniciativa | | |
| Versión del lienzo asociado | | Versión de P08 a la que corresponde esta línea base. |
| Versión del documento | | |
| Fecha | | DD-MM-AAAA. |
| Autor | | Nombre y rol. |
| Fecha de congelación | | Fecha de G2. Después solo se modifica según la sección 9. |

---

## 3. Definición de las métricas

| Métrica | Tipo | Definición operativa | Fórmula | Unidad | Fuente de datos | Responsable del dato |
|---|---|---|---|---|---|---|
| | Principal · Secundaria · De salvaguarda | | | | | |
| *(ejemplo ilustrativo)* Tiempo medio de primera respuesta | Secundaria | Horas desde la entrada de la consulta hasta la primera respuesta útil al cliente | Suma de tiempos ÷ nº de consultas | horas | Herramienta de atención al cliente | Responsable de operaciones de atención |
| *(ejemplo ilustrativo)* Horas de atención externa | Principal (económica) | Horas facturadas por el proveedor externo de atención | Suma mensual de horas facturadas | h | Facturas del proveedor | Control de gestión |

La definición operativa responde a: qué se cuenta, qué se excluye, desde cuándo y hasta cuándo, y en qué sistema se registra.

---

## 4. Periodo y método de medición

| Campo | Contenido | Guía |
|---|---|---|
| Periodo de referencia | | Fechas de inicio y fin. |
| Justificación de la duración | | Debe cubrir los ciclos relevantes del proceso (semanas, meses, campañas). |
| Ámbito o población | | Canales, unidades, clientes o casos incluidos. |
| Muestra **(Enterprise)** | | Si no se mide el universo: tamaño, criterio de selección y representatividad. |
| Medida o estimada | | Medida · Estimada. Si es estimada, justificación y plan para medirla antes de G5. |
| Método de extracción | | Consulta, informe o sistema del que se obtiene. |
| Exclusiones | | Casos excluidos y motivo. |
| Tratamiento de datos ausentes | | Cómo se muestran y cuántos son. |
| Calidad del dato | | Completitud y problemas conocidos. |

---

## 5. Resultados de la línea base

| Métrica | Periodo | Valor | Variabilidad | Nº de observaciones | Estado | Observaciones |
|---|---|---|---|---|---|---|
| | | | Mínimo–máximo o desviación típica | | Medida · Estimada · Sin dato | |
| *(ejemplo ilustrativo)* Tiempo medio de primera respuesta | 01-01-2026 a 30-06-2026 | 26,4 h | 9,1–41,7 h (media mensual) | 96.300 | Medida | Picos en campañas de enero. |
| *(ejemplo ilustrativo)* Horas de atención externa | 01-01-2026 a 30-06-2026 | 5.150 h | 610–1.240 h/mes | 6 facturas | Medida | — |
| *(ejemplo ilustrativo)* Satisfacción del cliente atendido | 01-01-2026 a 30-06-2026 | Sin dato | — | — | Sin dato | La encuesta se activa en octubre; se medirá cuatro semanas antes del piloto. |

---

## 6. Valores unitarios para la traducción a dinero

| Concepto | Valor unitario (€) | Fuente | Fecha de referencia | Revisado por control de gestión |
|---|---|---|---|---|
| | | | | Sí · No |
| *(ejemplo ilustrativo)* Coste por hora de atención externa | 21,00 | Contrato vigente con el proveedor | 01-06-2026 | Sí |
| *(ejemplo ilustrativo)* Margen medio por pedido | 9,00 | Cuenta de resultados del canal | Primer semestre de 2026 | Sí |

Los valores unitarios se usan en la fórmula de P08 (unidades × valor unitario). Si cambian después de G2, se registra en la sección 9.

---

## 7. Grupo de control

Rellenar si el método de atribución de P08 es grupo de control.

| Campo | Contenido | Guía |
|---|---|---|
| Definición del grupo de control | | Qué casos, clientes o unidades no reciben la intervención. |
| Criterio de asignación | | Aleatorio, por región, por turno u otro, con justificación. |
| Comparabilidad | | Valores de la línea base en el grupo de control y en el grupo tratado. |
| Riesgo de contaminación | | Cómo se evita que el grupo de control reciba efectos de la intervención. |

| Métrica | Grupo tratado (línea base) | Grupo de control (línea base) | Diferencia | ¿Comparables? |
|---|---|---|---|---|
| | | | | Sí · No |

---

## 8. Factores externos y estacionalidad

| Factor | Efecto esperado sobre la métrica | Cómo se corrige o se controla |
|---|---|---|
| | | |
| *(ejemplo ilustrativo)* Campaña de rebajas | Aumento de consultas del 60 % en enero | Comparar con el mismo periodo del grupo de control y no con la media anual. |

---

## 9. Congelación y cambios posteriores

Tras G2, la línea base solo puede modificarse por error material documentado o por cambio en la definición de una métrica, con aprobación del órgano que autorizó la iniciativa. Modificarla para favorecer el resultado es una no conformidad.

| Fecha | Métrica | Valor anterior | Valor nuevo | Motivo | Aprobado por |
|---|---|---|---|---|---|
| | | | | | |

---

## 10. Reproducibilidad **(Enterprise)**

| Campo | Contenido | Guía |
|---|---|---|
| Consulta o procedimiento de cálculo | | Enlace a la consulta, script o informe versionado. |
| Versión o instantánea de los datos | | Identificador de la extracción usada. |
| Ubicación | | Repositorio donde se conserva. |
| Persona que puede reproducirla | | Distinta de quien la calculó. |

---

## 11. Criterios de calidad

Los criterios formales de G2 están en el documento 21 (ver criterios G2.xx).

| # | Comprobación | Estado |
|---|---|---|
| 1 | Cada métrica de P08 tiene definición operativa, fórmula y fuente. | Cumple · No cumple · No aplica · Pendiente |
| 2 | El periodo cubre los ciclos relevantes del proceso. | |
| 3 | La línea base está medida o su estimación está justificada con plan de medición. | |
| 4 | Los datos ausentes figuran como "sin dato". | |
| 5 | Los valores unitarios tienen fuente y revisión de control de gestión. | |
| 6 | Si hay grupo de control, se demuestra su comparabilidad. | |
| 7 | Está registrada la fecha de congelación. | |

---

## 12. Aprobación y verificación

| Función | Rol en SEVEN-G | Nombre y cargo | Fecha | Firma o referencia |
|---|---|---|---|---|
| Elabora | Responsable de producto de IA | | | |
| Aporta datos | Propietario de los datos del proceso | | | |
| Revisa valores unitarios | Control de gestión | | | |
| Verifica | Oficina de IA (Lite) · Auditor de IA (Enterprise) | | | |
| Decide | Patrocinador de IA (Lite) · Comité de IA (Enterprise), con G2 | | | |

Separación de funciones: quien verifica no ha calculado la línea base.

---

## 13. Control de versiones

**Documento cumplimentado**

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| | | | |

**Plantilla**

| Versión | Fecha | Cambios |
|---|---|---|
| 0.1 | 16-09-2026 | Primera versión. Estructura alineada con 01 §6.4 y con las reglas 1 y 8 de medición de 00 §6. |
