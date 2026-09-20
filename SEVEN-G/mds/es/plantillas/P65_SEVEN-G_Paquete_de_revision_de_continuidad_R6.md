# Paquete de revisión de continuidad R6

**Reúne en un solo documento los datos del periodo que necesita la revisión de continuidad —valor, coste, estabilidad, incidentes, riesgos y cumplimiento— y la propuesta del equipo, para que el verificador compruebe y el órgano decida.**

| | |
|---|---|
| Documento | Plantilla P65 · Paquete de revisión de continuidad R6 |
| Versión | 0.1 (borrador de trabajo) |
| Fecha | 19-09-2026 |
| Autor | Fernando García Varela |
| Estado | Borrador para revisión. |

---

> **Aviso legal y exención de responsabilidad.** SEVEN-G es un marco metodológico de referencia que se ofrece «tal cual» y con fines exclusivamente informativos. No constituye asesoramiento jurídico, regulatorio, financiero ni profesional, ni garantiza el cumplimiento de ninguna norma. Las referencias a regulación general (como el Reglamento Europeo de IA, el RGPD, DORA o NIS2), a normas técnicas y a regulación específica de cada sector o jurisdicción pueden ser incompletas, no aplicar a un caso concreto o quedar desactualizadas por cambios normativos, interpretaciones o criterios de las autoridades posteriores a su fecha de consulta. **Cada organización que use SEVEN-G es la única responsable de identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio**, con el asesoramiento cualificado que corresponda. El autor no asume responsabilidad alguna por el uso que se haga de este contenido ni por las decisiones que se adopten con él. Los datos, cifras, compañías y casos de los ejemplos son ficticios o ilustrativos.

> **Por qué importa.** Un sistema en producción puede seguir disponible mientras pierde valor, acumula coste, deriva o deja de cumplir. La R6 es el control periódico que lo detecta a tiempo, pero sus evidencias están repartidas en diez plantillas y herramientas. Si nadie las reúne con los mismos datos del mismo periodo, la revisión se convierte en una conversación y el órgano decide sin ver el conjunto. El paquete ordena los diez bloques de 52 §8.2, señala qué criterio R6 cubre cada uno y obliga a concluir si hay que adelantar G7. Omitir una R6 es una no conformidad mayor.

## 1. Instrucciones de uso

| Aspecto | Indicación |
|---|---|
| **Cuándo se usa** | En cada R6: al menos trimestral en Enterprise y semestral en Lite. Se adelanta tras un incidente S1 o S2, un cambio sustancial o un cambio relevante del proveedor (52 §8.1). Puede coincidir con la revisión a 6 o 12 meses (43 §8.1); en ese caso se adjunta el informe de P62. |
| **Quién la rellena** | El responsable de producto de IA y el responsable de operación de IA, con los datos del periodo (52 §8.2). |
| **Quién la verifica** | Oficina de IA en Lite; auditor de IA en Enterprise, con la lista LV-R6 del documento 22. |
| **Quién decide** | Patrocinador de IA en Lite; comité de IA en Enterprise (21 §6.7). |
| **Etapa, *gate* o momento** | R6 · Revisión de continuidad (fase 6). El resultado se registra en P29. |
| **Herramienta** | T01 (eventos y fechas de R6), T03 (verificación), T08, T10, T12 y T13 como fuentes. |
| **Documento de referencia** | Documento 52 §8; criterios R6.01–R6.16 del documento 21 §6.7; LV-R6 del documento 22 §9. |
| **Lite frente a Enterprise** | Lite puede omitir los campos marcados **(Enterprise)** y presentar los bloques de valor, coste y riesgo en versión simplificada. R6.13 no aplica en Lite. |

Reglas de cumplimentación:

- **Mismo periodo para todos los bloques.** Cada dato indica su fecha de corte; un dato de otro periodo se señala.
- **Se aporta la evidencia, no un resumen de ella:** cada bloque enlaza la versión vigente de su plantilla o el informe de su herramienta.
- **"Sin dato" no es cero.** Un bloque sin dato se marca como tal y su criterio queda *Pendiente*.
- Este paquete es la **propuesta del equipo**. No sustituye la verificación (LV-R6) ni la decisión, que se registran en P29.

---

## 2. Identificación

| Campo | Contenido | Guía |
|---|---|---|
| Código de la iniciativa | | IA-AAAA-NNN (T01). |
| Sistemas de IA | | SIA-AAAA-NNN (P05). |
| Tipo de sistema y nivel de autonomía | | ML predictivo · IA generativa · Agente; A0–A3. |
| Intensidad, nivel de ambición y clasificación regulatoria | | P04, P07, P11. |
| Número de R6 y periodo revisado | | Por ejemplo, 3.ª R6 · 01-01-2027 a 31-03-2027. |
| Tipo de R6 | | Ordinaria · Adelantada (motivo) · Coincide con revisión a 6 o 12 meses. |
| Fecha de la R6 anterior y su resultado | | P29. |
| Fecha límite según la periodicidad (R6.01) | | |
| Fecha de presentación del paquete | | Anterior a la solicitud de la revisión. |

---

## 3. Resumen para la decisión

Una línea por bloque. **Situación:** Dentro de lo aprobado · Desviación con acción · Desviación relevante · Sin dato.

| Bloque | Situación | Dato clave del periodo | Criterios R6 |
|---|---|---|---|
| 1 · Valor | | | R6.02 |
| 2 · Capacidad liberada | | | R6.02, R6.14 |
| 3 · Coste | | | R6.03 |
| 4 · Estabilidad, rendimiento y calidad | | | R6.04, R6.05 |
| 5 · Incidentes y cambios | | | R6.06, R6.07, R6.15 |
| 6 · Agentes | | | R6.11 |
| 7 · Supervisión humana y adopción | | | R6.10, R6.14 |
| 8 · Riesgo y cumplimiento | | | R6.08, R6.09, R6.13 |
| 9 · Continuidad | | | R6.12 |
| 10 · Propuesta | | | R6.16 |

---

## 4. Bloque 1 · Valor (P28, T12)

| Campo | Contenido | Guía |
|---|---|---|
| Valor realizado del periodo por tipo (eficiencias, retorno) y estado | | Validado · Declarado · Estimado. |
| Realización del periodo y acumulada (F10) | | Frente a la curva de P62. |
| Proporción validada (F6) | | |
| Valor neto anualizado (F2) y validado (F2v) | | |
| Criterios de parada | | ¿Alguno alcanzado? |
| Lectura por ambición | | Optimizar: ahorro materializado o capacidad reasignada. Aumentar: rendimiento y adopción sostenidos. Transformar: avance frente a los hitos de la etapa. |
| Evidencia | | P28 versión y fecha. |

---

## 5. Bloque 2 · Capacidad liberada (T20)

| Horas liberadas netas | Materializadas | Reasignadas | Sin decisión | Tasa de materialización (F5) | Tasa de reasignación (F5) | Evidencia |
|---|---|---|---|---|---|---|
| | | | | | | |

---

## 6. Bloque 3 · Coste (T13)

| Campo | Contenido | Guía |
|---|---|---|
| Coste recurrente real frente a presupuesto y frente al estimado en G3 | | Desviación y explicación (R6.03). |
| Coste por transacción o por unidad de resultado | | IND-COS-05. |
| Activaciones y días en modo degradado por coste, por nivel | | N1–N4 (P63 §8). |
| Calidad medida durante el modo frente al mínimo de P25 | | OPE-18. |
| Más de un mes en N2 o superior | | Sí · No. Si es Sí, propuesta: suplemento, optimización o cambio del modelo principal. |

---

## 7. Bloque 4 · Estabilidad, rendimiento y calidad (P25)

| Métrica | Umbral de aviso | Umbral crítico | Valor del periodo | Alertas críticas | Acción |
|---|---|---|---|---|---|
| Disponibilidad | | | | | |
| Métrica principal del modelo o calidad de respuestas | | | | | |
| Deriva de datos o de uso (OPE-19) | | | | | |
| Sesgo, también en las respuestas (OPE-20) | | | | | |
| Ruido de alertas (OPE-16) **(Enterprise)** | | | | | |

---

## 8. Bloque 5 · Incidentes y cambios (P27, T08)

| Campo | Contenido | Guía |
|---|---|---|
| Incidentes por severidad | | S1 · S2 · S3 · S4, con contención y cierre. |
| Notificaciones regulatorias y plazo cumplido | | Según P26. |
| No conformidades abiertas y plazo | | NC-AAAA-NNN. |
| Cambios por clase | | Menor · Significativo · Sustancial; cambios del proveedor. |
| Cambios sustanciales y *gate* al que volvieron | | Sin *gate*: no conformidad mayor (52 §6.4). |
| Condiciones de *gates* anteriores | | Abiertas, cumplidas o vencidas (P29). |

---

## 9. Bloque 6 · Agentes (P25, T10)

Solo si hay agentes (A1–A3).

| Acciones bloqueadas por límites | Anomalías de intención detectadas y revisadas | Prueba del interruptor de parada (fecha y resultado) | Revisión de permisos y credenciales (fecha) |
|---|---|---|---|
| | | | |

---

## 10. Bloque 7 · Supervisión humana y adopción (documento 50)

| Campo | Contenido | Guía |
|---|---|---|
| Tasa de modificación humana | | Próxima a 0 % durante 30 días se revisa (52 §5.2). |
| Adopción frente al objetivo | | P20. |
| Supervisores designados y formados | | |
| Registros conservados y mecanismo de parada disponible | | R6.10. |

---

## 11. Bloque 8 · Riesgo y cumplimiento (P11, P12, T04, T07)

| Campo | Contenido | Guía |
|---|---|---|
| Riesgos nuevos o que suben de nivel y su aceptación | | Órgano según el nivel residual (P12 §6). |
| Vigencia de la clasificación regulatoria y de la intensidad | | T07, T04. |
| Vigencia de las evaluaciones de impacto | | P11. |
| Información a la representación de los trabajadores | | Actualizada tras cambios que afectan a condiciones de trabajo (52 §6.4). |
| Vigilancia posterior a la comercialización **(Enterprise)** | | Cuando la regulación la exige (52 §9). |

---

## 12. Bloque 9 · Continuidad (P19, P14)

| Campo | Contenido | Guía |
|---|---|---|
| Última prueba de reversión y resultado | | Anual en Lite, semestral en Enterprise (OPE-15). |
| Situación del proveedor | | Cambios de modelo, condiciones o subencargados; incidentes; obsolescencia anunciada (OPE-17). |

---

## 13. Comprobación de los criterios R6

Autoevaluación del equipo; no sustituye a la verificación con LV-R6.

| Código | Criterio (resumen) | Bloque | Estado |
|---|---|---|---|
| R6.01 | Revisión dentro de su periodicidad | Identificación | Cumple · No cumple · No aplica · Pendiente |
| R6.02 | Valor frente a hipótesis con estado y proporción validada | 1 | |
| R6.03 | Costes reales frente a estimados, con desviaciones explicadas | 3 | |
| R6.04 | Rendimiento en umbrales y cambios de modelo registrados | 4, 5 | |
| R6.05 | Sesgo en umbrales si afecta a personas | 4 | |
| R6.06 | Incidentes registrados y notificados en plazo | 5 | |
| R6.07 | Cambios significativos evaluados y, si procedía, por G4 y G5 | 5 | |
| R6.08 | Clasificación, evaluaciones de impacto e intensidad vigentes | 8 | |
| R6.09 | Registro de riesgos al día y aceptaciones al nivel correcto | 8 | |
| R6.10 | Controles críticos funcionando | 7 | |
| R6.11 | [AG] Permisos, intención, acciones anómalas e interruptor | 6 | |
| R6.12 | [TER] Cambios, incidentes y contrato del proveedor | 9 | |
| R6.13 | Vigilancia posterior a la comercialización cuando se exige | 8 | |
| R6.14 | Adopción frente al objetivo | 2, 7 | |
| R6.15 | Condiciones y no conformidades en plazo | 5 | |
| R6.16 | Evaluación de desviaciones que obligan a adelantar G7 | 10 | |

---

## 14. Bloque 10 · Desviaciones y propuesta

Desviaciones que obligan a adelantar G7 (21 §6.7):

| Desviación | ¿Concurre? (Sí · No) | Evidencia |
|---|---|---|
| Se ha alcanzado un criterio de parada. | | |
| El valor realizado queda por debajo del umbral de éxito en dos revisiones consecutivas. | | |
| Algún riesgo residual sube a Alto o Crítico sin aceptación al nivel que corresponde. | | |
| Incidente S1, o incidentes S2 recurrentes con la misma causa. | | |
| Cambia la clasificación regulatoria o la intensidad. | | |
| El proveedor deja de cumplir condiciones no condicionables o anuncia la retirada del servicio. | | |

| Campo | Contenido | Guía |
|---|---|---|
| Propuesta del equipo | | Continuar la operación · Continuar con condiciones · Adelantar G7 (01 §7.3). |
| Motivos | | Basados en los bloques 1 a 9. |
| Condiciones propuestas | | Solo desviaciones no críticas, con acción, plazo y responsable. No caben en controles críticos, cumplimiento legal ni supervisión humana. |
| Riesgo inaceptable detectado | | Si lo hay, no se espera a G7: procedimiento de incidentes y, si procede, parada (52 §8.3). |

*(Ejemplo ilustrativo)* Realización acumulada del 73,6 % con dos trimestres por debajo del 90 %; coste dentro del presupuesto; sin incidentes S1 o S2; propuesta: Continuar con condiciones (validar los trimestres pendientes y analizar la caída de realización antes de la siguiente R6).

---

## 15. Criterios de calidad

| # | Comprobación | Estado |
|---|---|---|
| 1 | Los diez bloques están completos o marcados *Sin dato* con motivo. | Cumple · No cumple · No aplica · Pendiente |
| 2 | Todos los datos corresponden al periodo revisado y enlazan su evidencia vigente. | |
| 3 | Cada criterio R6.01–R6.16 tiene estado y bloque de soporte. | |
| 4 | Consta la evaluación de las seis desviaciones que obligan a adelantar G7. | |
| 5 | La propuesta es un resultado permitido de R6 y es coherente con los bloques. | |
| 6 | El paquete se presentó antes de la solicitud de la revisión. | |

---

## 16. Aprobación y verificación

| Función | Rol en SEVEN-G | Nombre y cargo | Fecha | Firma o referencia |
|---|---|---|---|---|
| Prepara el paquete | Responsable de producto de IA y responsable de operación de IA | | | |
| Verifica (LV-R6) | Oficina de IA (Lite) · Auditor de IA (Enterprise) | | | |
| Decide y registra en P29 | Patrocinador de IA (Lite) · Comité de IA (Enterprise) | | | |

Separación de funciones: quien prepara el paquete no lo verifica ni decide; el verificador no forma parte del equipo que construye u opera el sistema.

---

## 17. Control de versiones

**Documento cumplimentado**

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| | | | |

**Plantilla**

| Versión | Fecha | Cambios |
|---|---|---|
| 0.1 | 19-09-2026 | Primera versión. Ordena los diez bloques del paquete de R6 de 52 §8.2 con los criterios R6.01–R6.16 del documento 21 y las desviaciones que obligan a adelantar G7. |
