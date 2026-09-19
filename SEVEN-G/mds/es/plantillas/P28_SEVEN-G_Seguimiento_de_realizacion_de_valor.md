# Seguimiento de realización de valor

**Mide, periodo a periodo, el valor que realmente aporta la iniciativa en producción, con fórmula y estado de cada importe, y lo compara con la hipótesis aprobada.**

| | |
|---|---|
| Documento | Plantilla P28 · Seguimiento de realización de valor |
| Versión | 0.1 (borrador de trabajo) |
| Fecha | 16-09-2026 |
| Autor | Fernando García · SEACHAD |
| Estado | Borrador para revisión. |

---

> **Aviso legal y exención de responsabilidad.** SEVEN-G es un marco metodológico de referencia que se ofrece «tal cual» y con fines exclusivamente informativos. No constituye asesoramiento jurídico, regulatorio, financiero ni profesional, ni garantiza el cumplimiento de ninguna norma. Las referencias a regulación general (como el Reglamento Europeo de IA, el RGPD, DORA o NIS2), a normas técnicas y a regulación específica de cada sector o jurisdicción pueden ser incompletas, no aplicar a un caso concreto o quedar desactualizadas por cambios normativos, interpretaciones o criterios de las autoridades posteriores a su fecha de consulta. **Cada organización que use SEVEN-G es la única responsable de identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio**, con el asesoramiento cualificado que corresponda. El autor y SEACHAD no asumen responsabilidad alguna por el uso que se haga de este contenido ni por las decisiones que se adopten con él. Los datos, cifras, compañías y casos de los ejemplos son ficticios o ilustrativos.

## 1. Instrucciones de uso

| Aspecto | Indicación |
|---|---|
| **Cuándo se usa** | Desde la puesta en producción (fase 6) y hasta la decisión de G7. Se actualiza con la periodicidad fijada (mensual o trimestral) y siempre antes de cada R6 y de G7. |
| **Quién la rellena** | Responsable de producto de IA. |
| **Quién valida los importes** | Control de gestión o auditoría para el estado *validado*; el área responsable para *declarado*; el comité, el consejo o el equipo evaluador para *estimado* (01 §11). |
| **Quién la verifica** | Oficina de IA en Lite; auditor de IA en Enterprise. |
| **En qué *gate* se revisa** | R6 y G7. Alimenta el panel del consejo (T17) y la cartera (documento 14). |
| **Lite frente a Enterprise** | Lite puede omitir los campos marcados **(Enterprise)**. |
| **Herramienta** | T12 Seguimiento de realización de valor. |
| **Relación** | P08 Lienzo de hipótesis de valor · P09 Línea base · P20 Plan de adopción y capacidad · P22 Resultados del piloto · P30 Decisión de escalado o retirada · P31 Ficha de caso de uso · P62 Plan de realización de beneficios (curva, responsables, habilitadores; referencia del esperado por periodo) · documentos 40, 42 y 43. |

Reglas de medición aplicables (00 §6):

- **Regla 1.** Todo importe tiene **fórmula** (unidades × valor unitario) y es **incremental** frente a la línea base o el grupo de control.
- **Regla 2.** Todo importe tiene **estado**: validado, declarado o estimado. Se informa siempre la proporción validada.
- **Regla 3.** La **capacidad liberada no suma** como ahorro hasta que se materializa o se reasigna de forma explícita; se informa por separado (bloque 6).
- **Regla 5.** **Cada euro se atribuye a un solo caso**; los repartos se declaran (bloque 8).
- **Regla 6.** Se separan **eficiencias, retorno y coste recurrente**. **Valor neto anual = eficiencias + retorno − coste recurrente.**
- **Regla 7.** Toda magnitud se traduce a dinero o se indica que no se ha podido cuantificar.
- **Regla 8.** **"Sin dato" no es cero.**

---

## 2. Identificación

| Campo | Contenido | Guía |
|---|---|---|
| Código de la iniciativa | | IA-AAAA-NNN (T01). |
| Nombre de la iniciativa | | |
| Nivel de ambición | | Optimizar · Aumentar · Transformar (confirmado en fase 2). |
| Intensidad | | Lite · Enterprise. |
| Fecha de puesta en producción | | |
| Periodicidad del seguimiento | | Mensual · Trimestral. |
| Periodo informado | | Por ejemplo, 3T-2026. |
| Versión del documento | | |
| Autor | | Rol y nombre. |
| Fecha | | DD-MM-AAAA. |
| Estado del documento | | Borrador · Presentado para verificación · Verificado · Aprobado · Sustituido. |

---

## 3. Referencia de la hipótesis aprobada

Se copia de P08 y P09 y no se modifica durante el seguimiento. Si la hipótesis cambia, es un Pivotar o una nueva decisión del órgano competente.

| Campo | Contenido | Guía |
|---|---|---|
| Métrica principal y línea base | | Valor y fecha de medición (P09). |
| Objetivo y umbral de éxito | | |
| Método de atribución | | Grupo de control · Antes y después · Otro justificado. |
| Valor anual esperado: eficiencias (€) | | |
| Valor anual esperado: retorno (€) | | |
| Coste recurrente anual esperado (€) | | |
| Valor neto anual esperado (€) | | Eficiencias + retorno − coste recurrente. |
| Inversión aprobada (€) | | |
| Horizonte fijado en C2 | | |
| Criterios de parada | | Los aprobados en la fase 2. |

---

## 4. Valor por periodo

Una fila por concepto y periodo. **Tipo:** Eficiencias · Retorno · Coste recurrente. **Estado:** Validado · Declarado · Estimado.

| Periodo | Concepto | Tipo | Fórmula | Unidades | Valor unitario (€) | Importe (€) | Estado | Quién valida, declara o estima | Evidencia |
|---|---|---|---|---|---|---|---|---|---|
| 3T-2026 *(ejemplo ilustrativo)* | Reducción de subcontratación de revisión documental | Eficiencias | Documentos no subcontratados × coste por documento | 6.000 | 2,50 | 15.000 | Validado | Control de gestión (facturas del proveedor externo) | Informe de costes 3T |
| 3T-2026 *(ejemplo ilustrativo)* | Clientes retenidos atribuibles | Retorno | Clientes retenidos adicionales frente a grupo de control × margen anual por cliente ÷ 4 | 40 | 180 | 7.200 | Declarado | Dirección comercial | Análisis de retención 3T |
| 3T-2026 *(ejemplo ilustrativo)* | Consumo de modelos, licencias y operación | Coste recurrente | Facturas del periodo + horas de operación × coste por hora | — | — | 9.400 | Validado | Control de gestión | Informe de costes 3T |
| | | | | | | | | | |
| | | | | | | | | | |

---

## 5. Resumen del periodo y acumulado

Importes en euros. El valor neto del ejemplo es 15.000 + 7.200 − 9.400 = 12.800 € en el trimestre *(ejemplo ilustrativo)*.

| Magnitud | Validado | Declarado | Estimado | Total del periodo | Acumulado del año | Esperado para el mismo periodo | Desviación |
|---|---|---|---|---|---|---|---|
| Eficiencias | | | | | | | |
| Retorno | | | | | | | |
| Coste recurrente | | | | | | | |
| **Valor neto = eficiencias + retorno − coste recurrente** | | | | | | | |

| Indicador | Valor | Guía |
|---|---|---|
| Proporción de valor validado | | (Eficiencias validadas + retorno validado) ÷ (eficiencias + retorno totales). |
| Valor neto anualizado | | Indique el método de anualización y márquelo como estimado. |
| Inversión realizada acumulada (€) | | |
| Neto adicional por euro de inversión adicional **(Enterprise)** | | Solo si se propone ampliar: neto anual adicional esperado ÷ inversión adicional necesaria. Sin inversión, hipótesis y plazo no es un dato (regla 4). |

---

## 6. Capacidad liberada (separada, no suma)

**Destino:** Materializada en menor coste · Reasignada de forma explícita · Pendiente de destino.

| Periodo | Colectivo o actividad | Horas liberadas | Fórmula | Estado de las horas (Validado · Declarado · Estimado) | Destino | Actividad de destino o partida reducida | Importe materializado (€) | Evidencia |
|---|---|---|---|---|---|---|---|---|
| 3T-2026 *(ejemplo ilustrativo)* | Gestores de expedientes internos | 900 | 3.600 expedientes × 15 min ahorrados ÷ 60 | Declarado | Reasignada de forma explícita | Revisión de contratos de alto importe, antes no revisados | — (reasignación, no ahorro) | Acta de la dirección del área |
| | | | | | | | | |

Solo el importe **materializado** en menor coste real puede trasladarse al bloque 4 como eficiencia, y una sola vez. La capacidad reasignada se informa aquí y se valora por lo que produce la nueva actividad, si se mide.

---

## 7. Valor no sumable

| Tipo | Descripción | ¿Traducido a dinero? (Sí · No) | Fórmula e importe, si se traduce | Estado |
|---|---|---|---|---|
| Riesgo evitado | | | | |
| Cumplimiento | | | | |

Si no se traduce a dinero con fórmula, no suma en el bloque 5 y se indica "no cuantificado".

---

## 8. Atribución y reparto **(Enterprise)**

| Resultado compartido | Otros casos o iniciativas que contribuyen | Reparto declarado (%) | Criterio de reparto | Aprobado por |
|---|---|---|---|---|
| | | | | |

---

## 9. Datos ausentes

| Magnitud | Motivo por el que no hay dato | Desde cuándo | Acción para obtenerlo | Responsable |
|---|---|---|---|---|
| | | | | |

---

## 10. Criterios de parada y lectura por ambición

| Criterio de parada (fase 2) | Umbral | Valor en el periodo | ¿Activado? (Sí · No) |
|---|---|---|---|
| | | | |

| Nivel | Qué se exigirá en G7 (01 §7.6) | Situación en el periodo |
|---|---|---|
| Optimizar | Ahorro materializado, no solo capacidad liberada. | |
| Aumentar | Rendimiento sostenido y capacidad reasignada. | |
| Transformar | Retorno medido y cambio del modelo operativo o de la oferta verificado. | |

---

## 11. Conclusión del periodo

| Campo | Contenido | Guía |
|---|---|---|
| Valoración | | En línea con la hipótesis · Por debajo, dentro de la tolerancia aprobada · Desviación relevante. |
| ¿Se propone adelantar G7? | | Sí · No. Una desviación relevante en R6 adelanta G7 (01 §6.8). |
| Explicación | | Causas de la desviación y acciones. |

---

## 12. Criterios de calidad

Criterios formales de R6 y G7 en el documento 21; reglas en el documento 40.

| # | Comprobación | Estado (Cumple · No cumple · No aplica · Pendiente) |
|---|---|---|
| 1 | Todo importe tiene fórmula, tipo, estado y evidencia. | |
| 2 | Los importes validados tienen validación de control de gestión o auditoría. | |
| 3 | El valor neto se calcula como eficiencias + retorno − coste recurrente. | |
| 4 | La capacidad liberada figura por separado y solo lo materializado suma, una vez. | |
| 5 | Los datos ausentes figuran como ausentes, no como cero. | |
| 6 | La hipótesis de referencia no se ha modificado sin decisión del órgano competente. | |
| 7 | Se informa la proporción de valor validado. | |

---

## 13. Aprobación y verificación

| Función | Rol | Nombre | Fecha | Firma o referencia |
|---|---|---|---|---|
| Autor | Responsable de producto de IA | | | |
| Validación de importes | Control de gestión | | | |
| Verificador | Oficina de IA (Lite) · Auditor de IA (Enterprise) | | | |
| Revisión | Decisor de R6 o G7 (registrado en P29) | | | |

Separación de funciones: quien declara un importe no lo valida; el verificador no forma parte del equipo que construye.

---

## 14. Control de versiones

| Versión | Fecha | Cambios |
|---|---|---|
| 0.1 | 16-09-2026 | Primera versión de la plantilla. |
