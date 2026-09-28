# Lienzo de hipótesis de valor

**Formula el valor esperado de la iniciativa como una hipótesis falsable, medible y expresada en dinero, con su método de atribución y sus criterios de parada fijados antes de invertir.**

| | |
|---|---|
| Documento | Plantilla P08 · Lienzo de hipótesis de valor |
| Versión | 0.1 (borrador de trabajo) |
| Fecha | 16-09-2026 |
| Autor | Fernando García Varela |
| Estado | Borrador para revisión. |

---

> **Aviso legal y exención de responsabilidad.** SEVEN-G es un marco metodológico de referencia que se ofrece «tal cual» y con fines exclusivamente informativos. No constituye asesoramiento jurídico, regulatorio, financiero ni profesional, ni garantiza el cumplimiento de ninguna norma. Las referencias a regulación general (como el Reglamento Europeo de IA, el RGPD, DORA o NIS2), a normas técnicas y a regulación específica de cada sector o jurisdicción pueden ser incompletas, no aplicar a un caso concreto o quedar desactualizadas por cambios normativos, interpretaciones o criterios de las autoridades posteriores a su fecha de consulta. **Cada organización que use SEVEN-G es la única responsable de identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio**, con el asesoramiento cualificado que corresponda. Esta metodología es una ayuda genérica y gratuita, compartida con la comunidad para que nadie tenga que empezar desde cero; cada persona u organización puede y debe adaptarla a su propio uso. No debe entenderse que sus partes jurídicamente sensibles hayan sido revisadas por una asesoría jurídica: esas revisiones, para cada empresa o sector, son responsabilidad última de la empresa, el consultor o la organización que la use. Aunque se procura mantenerla al día, alguna norma puede haber cambiado sin que se recoja aquí. En la máxima medida permitida por la ley, el autor no asume responsabilidad alguna por los efectos de su aplicación en ninguna organización ni por su aplicabilidad completa. La metodología no otorga certificación de ningún tipo. El autor no asume responsabilidad alguna por el uso que se haga de este contenido ni por las decisiones que se adopten con él. Los datos, cifras, compañías y casos de los ejemplos son ficticios o ilustrativos.

## 1. Instrucciones de uso

| Aspecto | Indicación |
|---|---|
| **Cuándo se usa** | En la fase 2 (Hipótesis de valor), antes de G2. Se contrasta con los resultados del piloto en la fase 5 (P22) y con el valor realizado en las fases 6 y 7 (P28). |
| **Quién la rellena** | El responsable de producto de IA. Control de gestión revisa los valores unitarios y la fórmula. |
| **Quién la verifica** | Lite: oficina de IA. Enterprise: auditor de IA. |
| **Quién decide** | Lite: patrocinador. Enterprise: comité de IA. Transformar: además, el consejo o su comisión delegada. |
| **Gate en que se revisa** | G2 · Hipótesis. |
| **Herramienta** | T11 · Lienzo y calculadora de hipótesis de valor. |
| **Lite frente a Enterprise** | Lite puede omitir los campos marcados **(Enterprise)**. La hipótesis, la métrica principal, la línea base, el umbral, el método de atribución, la fórmula y los criterios de parada son obligatorios en ambas. |

Reglas que se aplican (00 §6):

- Todo importe tiene **fórmula** (unidades × valor unitario), es **incremental** frente a la línea base y tiene **estado**: validado, declarado o estimado.
- Se separan **eficiencias**, **retorno** y **coste recurrente**. **Valor neto anual = eficiencias + retorno − coste recurrente.**
- La **capacidad liberada no suma** hasta que se materializa o se reasigna de forma explícita.
- Cada euro se atribuye a **un solo caso**; si hay resultados compartidos, se declara el reparto.
- **Una hipótesis que no puede fallar no es válida.** Los criterios de parada no pueden relajarse después sin aprobación del órgano que autorizó la iniciativa (01 §7.4).

Las cifras de los ejemplos son **ficticias**.

---

## 2. Identificación

| Campo | Contenido | Guía |
|---|---|---|
| Código de la iniciativa | | IA-AAAA-NNN. |
| Nombre de la iniciativa | | |
| Nivel de ambición confirmado | | Optimizar · Aumentar · Transformar (P07, columna Confirmada). |
| Esfera principal | | Taxonomía de 03 §3.3. |
| Intensidad | | Lite · Enterprise. |
| Versión del documento | | |
| Fecha | | DD-MM-AAAA. |
| Autor | | Nombre y rol. |

---

## 3. Problema, usuarios y solución

| Campo | Contenido | Guía |
|---|---|---|
| Descripción comprensible | | Qué es y para qué se usa (regla 10). |
| Problema u oportunidad | | Situación actual con datos de la línea base (P09). |
| Usuarios y beneficiarios | | Quién usa el sistema y quién recibe el beneficio. |
| Solución propuesta | | Qué hará el sistema y qué seguirán haciendo las personas. |
| Supuestos críticos | | Condiciones sin las cuales la hipótesis no se sostiene. |

---

## 4. Hipótesis de valor falsable

**Formato:** *Si* [intervención], *entonces* [métrica principal] pasará de [línea base] a [objetivo] en [ámbito] en [plazo], medido con [método de atribución]. *La hipótesis se considerará refutada si* [condición medible].

| Campo | Contenido | Guía |
|---|---|---|
| Enunciado de la hipótesis | | Una sola frase con el formato anterior. |
| Condición de refutación | | Resultado concreto que demostraría que la hipótesis es falsa. |
| Horizonte de comprobación | | Fecha o periodo en el que se comprobará. |

*(ejemplo ilustrativo)* Si se incorpora un asistente de respuesta a las consultas sobre pedidos del canal web, entonces la tasa de consultas resueltas sin intervención de un agente pasará del 0 % al 35 % en ese canal en seis meses desde el inicio del piloto, medido con grupo de control. La hipótesis se considerará refutada si la tasa es inferior al 20 % o si la satisfacción de los clientes atendidos cae más de 5 puntos respecto del grupo de control.

Prueba de falsabilidad:

| Pregunta | Sí · No |
|---|---|
| ¿Existe un resultado posible que refutaría la hipótesis? | |
| ¿La métrica, el umbral, el ámbito y el plazo son numéricos o verificables? | |
| ¿La línea base está medida o su estimación está justificada (P09)? | |

---

## 5. Métricas

| Tipo | Métrica | Definición y fórmula | Unidad | Línea base (P09) | Objetivo | Umbral de éxito | Frecuencia |
|---|---|---|---|---|---|---|---|
| Principal | | | | | | | |
| Secundaria | | | | | | | |
| De salvaguarda | | | | | | | |
| *(ejemplo ilustrativo)* Principal | Tasa de resolución sin agente | Consultas cerradas sin traspaso ÷ consultas atendidas por el asistente | % | 0 % | 35 % | 20 % | Semanal |
| *(ejemplo ilustrativo)* De salvaguarda | Satisfacción del cliente atendido | Media de la encuesta posterior (0–100) | puntos | 78 | ≥ 78 | ≥ 73 | Semanal |

- **Objetivo**: resultado esperado.
- **Umbral de éxito**: mínimo para considerar validada la hipótesis.
- **Métrica de salvaguarda**: lo que no debe empeorar (calidad, satisfacción, errores, quejas, equidad).

---

## 6. Método de atribución

| Campo | Contenido | Guía |
|---|---|---|
| Método | | Grupo de control · Antes y después · Otro justificado. Se prefiere grupo de control siempre que sea posible. |
| Diseño | | Cómo se forman los grupos o periodos, tamaño y duración. |
| Amenazas a la validez | | Estacionalidad, cambios simultáneos en el proceso, efecto novedad, selección de casos favorables. |
| Cómo se controlan | | Medidas para neutralizar cada amenaza. |
| Quién valida la medición | | Control de gestión o auditoría (condición para el estado *validado*). |
| Reparto con otras iniciativas | | Si otra iniciativa contribuye al mismo resultado, porcentaje atribuido a cada una y criterio (regla 5). |

---

## 7. Valor en dinero

### 7.1 Importes anuales

| Tipo | Concepto | Unidades | Valor unitario (€) y fuente | Fórmula | Importe anual (€) | Estado del importe | Supuestos |
|---|---|---|---|---|---|---|---|
| Eficiencias | | | | | | validado · declarado · estimado | |
| Retorno | | | | | | | |
| Coste recurrente | | | | | | | |
| *(ejemplo ilustrativo)* Eficiencias | Horas de atención externa que se dejan de contratar | 4.000 h | 21,00 €/h (contrato vigente) | 4.000 × 21,00 | 84.000 | estimado | Reducción contractual acordada con el proveedor a partir del segundo trimestre. |
| *(ejemplo ilustrativo)* Retorno | Pedidos no cancelados por respuesta inmediata | 1.200 pedidos | 9,00 € de margen por pedido | 1.200 × 9,00 | 10.800 | estimado | Tasa de cancelación del grupo de control. |
| *(ejemplo ilustrativo)* Coste recurrente | Consumo de modelos | 200.000 consultas | 0,03 € por consulta | 200.000 × 0,03 | 6.000 | estimado | Tarifa pública del proveedor. |
| *(ejemplo ilustrativo)* Coste recurrente | Licencias de la plataforma | 1 | 12.000 € anuales | 1 × 12.000 | 12.000 | estimado | Oferta recibida. |
| *(ejemplo ilustrativo)* Coste recurrente | Personas de operación | 0,3 FTE | 55.000 € por FTE | 0,3 × 55.000 | 16.500 | estimado | Coste medio de la función. |

### 7.2 Resumen económico

| Concepto | Importe (€) | Guía |
|---|---|---|
| Eficiencias | | Suma de 7.1. |
| Retorno | | Suma de 7.1. |
| Coste recurrente | | Suma de 7.1. |
| **Valor neto anual** | | Eficiencias + retorno − coste recurrente. |
| Inversión adicional necesaria | | Construcción, integración, adopción y control hasta producción. |
| **Neto adicional por euro** | | Neto anual adicional esperado ÷ inversión adicional necesaria. |
| Plazo hasta el primer valor | | Meses. |
| Horizonte de retorno fijado en C2 **(Enterprise)** | | Plazo en el que el neto debe ser positivo. |

*(ejemplo ilustrativo)* 84.000 + 10.800 − 34.500 = **60.300 €** de valor neto anual. Con una inversión adicional de 90.000 €, el neto adicional por euro es 60.300 ÷ 90.000 = **0,67**.

### 7.3 Capacidad liberada (no suma)

| Capacidad | Cantidad | Plan de materialización o reasignación | Responsable | Fecha |
|---|---|---|---|---|
| | | Materialización (menor coste real) · Reasignación explícita a otra actividad · Sin plan | | |
| *(ejemplo ilustrativo)* Horas de agentes internos | 2.500 h/año | Reasignación a gestión de incidencias complejas | Dirección de atención al cliente | Tercer trimestre |

Solo cuando se materializa o se reasigna de forma verificable pasa a 7.1 como eficiencia.

### 7.4 Valor no sumable y magnitudes no monetarias **(Enterprise)**

| Tipo | Descripción | ¿Traducido a dinero? | Fórmula o motivo por el que no se ha podido cuantificar |
|---|---|---|---|
| Riesgo evitado · Cumplimiento · Otra magnitud | | Sí · No | |

Riesgo evitado y cumplimiento no se suman al valor neto salvo que se traduzcan a dinero con fórmula (regla 7).

---

## 8. Criterios de parada

| # | Criterio | Indicador y umbral | Momento de evaluación | Decisión si se activa | Quién lo evalúa |
|---|---|---|---|---|---|
| 1 | | | | Parar · Pivotar · Iterar | |
| 2 | | | | | |
| *(ejemplo ilustrativo)* 1 | Resolución insuficiente | Tasa de resolución < 20 % tras 8 semanas de piloto | Fin del piloto | Parar | Comité de IA |
| *(ejemplo ilustrativo)* 2 | Deterioro de la experiencia | Satisfacción < 73 puntos dos semanas seguidas | Semanal | Suspender el piloto e Iterar | Responsable de producto; decide el patrocinador |

Deben incluir, como mínimo, un criterio sobre la métrica principal, uno sobre la salvaguarda y uno económico (coste o inversión máxima).

---

## 9. Solo para Transformar

### 9.1 Hitos de aprendizaje y límite de inversión por etapa

| Etapa | Pregunta de aprendizaje | Evidencia esperada | Métrica y umbral | Fecha | Inversión máxima de la etapa (€) | Inversión acumulada máxima (€) | Decisión al cierre | Órgano |
|---|---|---|---|---|---|---|---|---|
| 1 | | | | | | | Continuar · Pivotar · Parar | |
| 2 | | | | | | | | |
| *(ejemplo ilustrativo)* 1 | ¿Pagarían los clientes profesionales por un servicio de previsión de roturas de stock? | Cartas de intención de clientes piloto | ≥ 5 clientes con intención firmada | 31-03-2027 | 60.000 | 60.000 | Continuar si se alcanza; Parar si no | Comité de IA |
| *(ejemplo ilustrativo)* 2 | ¿Se sostiene el uso pagado? | Contratos de prueba de pago | ≥ 3 clientes renuevan tras 3 meses | 30-09-2027 | 150.000 | 210.000 | Continuar · Pivotar · Parar | Consejo |

### 9.2 Aprobación de la apuesta

| Campo | Contenido | Guía |
|---|---|---|
| Hipótesis de retorno | | Qué ingresos, servicios o cambio de modelo operativo se esperan y cuándo. |
| Incertidumbres principales | | Lo que todavía no se sabe y se resolverá con los hitos. |
| Valor de opción | | Qué capacidad o posición gana la compañía aunque la apuesta no llegue a escalar. Se documenta para G3. |
| Límite total de inversión | | Máximo autorizado antes de nueva decisión del consejo. |
| Decisión del consejo | | Fecha, órgano y referencia del acta. |

---

## 10. Comprobación por nivel de ambición en G2

Referencia: 01 §7.6.

| Nivel | Qué debe contener el lienzo | Cumple |
|---|---|---|
| Optimizar | Línea base de coste, tiempo o errores; ahorro esperado con fórmula. | Sí · No · No aplica |
| Aumentar | Métricas de rendimiento y de coste; objetivo de adopción. | |
| Transformar | Hipótesis de retorno con hitos de aprendizaje; límite de inversión por etapa; aprobación del consejo. | |

---

## 11. Criterios de calidad

Los criterios formales de G2 están en el documento 21 (ver criterios G2.xx).

| # | Comprobación | Estado |
|---|---|---|
| 1 | La hipótesis es falsable: tiene condición de refutación, umbral, ámbito y plazo. | Cumple · No cumple · No aplica · Pendiente |
| 2 | La línea base está medida o su estimación está justificada en P09. | |
| 3 | Hay una métrica principal y al menos una de salvaguarda. | |
| 4 | El método de atribución es explícito y controla las amenazas principales. | |
| 5 | Todo importe tiene fórmula, tipo y estado. | |
| 6 | La capacidad liberada figura aparte y no suma. | |
| 7 | Valor neto anual y neto adicional por euro están calculados. | |
| 8 | Los criterios de parada existen y son anteriores a la inversión. | |
| 9 | En Transformar: hitos, límite por etapa, valor de opción y aprobación del consejo. | |

---

## 12. Aprobación y verificación

| Función | Rol en SEVEN-G | Nombre y cargo | Fecha | Firma o referencia |
|---|---|---|---|---|
| Elabora | Responsable de producto de IA | | | |
| Revisa valores unitarios | Control de gestión | | | |
| Verifica | Oficina de IA (Lite) · Auditor de IA (Enterprise) | | | |
| Decide | Patrocinador de IA (Lite) · Comité de IA (Enterprise) | | | |
| Aprueba Transformar | Consejo o comisión delegada | | | |

Separación de funciones: quien verifica no ha elaborado el lienzo; el patrocinador responde del valor, pero no verifica.

---

## 13. Control de versiones

**Documento cumplimentado**

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| | | | |

**Plantilla**

| Versión | Fecha | Cambios |
|---|---|---|
| 0.1 | 16-09-2026 | Primera versión. Aplica las reglas de medición de 00 §6, los criterios de G2 por nivel de ambición de 01 §7.6 y los parámetros de valor de la especificación común §5.7. |
