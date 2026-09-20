# Catálogo de indicadores

**Indicadores con código, fórmula, fuente y responsable para medir la IA de la iniciativa al consejo**

| | |
|---|---|
| Documento | Documento 41 · Catálogo de indicadores |
| Versión | 0.1 (borrador de trabajo) |
| Fecha | 16-09-2026 |
| Autor | Fernando García Varela |
| Estado | Borrador para revisión. Catálogo vivo: los umbrales se fijan por cada compañía y se recalibran en C5. |

<!-- cifras: 159 | indicadores codificados ; 13 | familias ; 4 | niveles de uso ; 26 | indicadores del conjunto mínimo Lite -->

---

> **Aviso legal y exención de responsabilidad.** SEVEN-G es un marco metodológico de referencia que se ofrece «tal cual» y con fines exclusivamente informativos. No constituye asesoramiento jurídico, regulatorio, financiero ni profesional, ni garantiza el cumplimiento de ninguna norma. Las referencias a regulación general (como el Reglamento Europeo de IA, el RGPD, DORA o NIS2), a normas técnicas y a regulación específica de cada sector o jurisdicción pueden ser incompletas, no aplicar a un caso concreto o quedar desactualizadas por cambios normativos, interpretaciones o criterios de las autoridades posteriores a su fecha de consulta. **Cada organización que use SEVEN-G es la única responsable de identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio**, con el asesoramiento cualificado que corresponda. El autor no asume responsabilidad alguna por el uso que se haga de este contenido ni por las decisiones que se adopten con él. Los datos, cifras, compañías y casos de los ejemplos son ficticios o ilustrativos.

<!-- esencial: consulta | Catálogo de indicadores. No se implanta entero: la compañía elige en C2 un conjunto reducido (sección 19, conjunto mínimo para Lite; sección 20, selección para el consejo) y consulta el resto cuando lo necesita. -->

## 1. Objeto y alcance

Este documento establece el catálogo de indicadores de SEVEN-G. Cada indicador tiene un código persistente, una definición, una fórmula, una unidad, una fuente de datos, una periodicidad, un responsable, el nivel en que se usa, su aplicación en el ciclo y, cuando procede, un umbral orientativo.

El catálogo:

- Aplica las reglas de medición del documento 40 y usa sus fórmulas oficiales (F1–F10).
- Recoge las métricas del embudo del documento 03 §3.5 y las ocho señales del índice de transformación del documento 00 §5.3.
- Alimenta el registro de iniciativas (T01), el seguimiento de valor (T12), la calculadora de costes (T13), el índice de transformación (T14), el diagnóstico de madurez (T15) y el panel del consejo (T17).
- Marca un **conjunto mínimo recomendado para la intensidad Lite**.

Ninguna compañía necesita todos los indicadores. Se seleccionan en C2 según la tesis de IA, la cartera y la intensidad, y la selección se registra.

---

## 2. Reglas de uso

1. **Código persistente.** El código `IND-<FAMILIA>-NN` no se reutiliza. Un indicador retirado se marca como retirado y conserva su código.
2. **Toda fórmula es explícita.** Si un indicador no puede calcularse con su fórmula, se muestra como "sin dato" (regla 8 del documento 40). No se sustituye por una aproximación sin indicarlo.
3. **Los umbrales los fija la compañía.** "A fijar" significa que la compañía lo aprueba en C2 (documento 13). Los únicos umbrales que aparecen como valor son los que derivan de reglas del propio marco (por ejemplo, cero sistemas en producción sin *gate*) o los plazos orientativos de 03 §3.6. Ninguno es una referencia de mercado.
4. **Los indicadores de valor heredan el estado.** Todo indicador calculado sobre importes muestra su proporción validada o se calcula en dos versiones: total y solo validado.
5. **Segmentación.** Todos los indicadores de cartera se pueden segmentar por las etiquetas de la taxonomía controlada (03 §3.3): esfera, ambición, intensidad, tecnología, exposición, clasificación regulatoria, área y proveedor.
6. **Medianas antes que medias** en tiempos, con percentil 80.
7. **Lectura por pares.** Los indicadores de velocidad o de automatización se leen con los de calidad y riesgo que los equilibran (por ejemplo, contención con respuestas no fundamentadas y reclamaciones).
8. **Nuevos indicadores.** Se añaden con la ficha de la sección 5 y se aprueban por la oficina de IA con conformidad de control de gestión.

---

## 3. Leyenda

| Columna | Valores |
|---|---|
| **Per.** (periodicidad) | **M** mensual · **T** trimestral · **S** semestral · **A** anual · **G** en cada *gate* o evento |
| **Resp.** (responsable) | **PAT** patrocinador · **RN** responsable de negocio del beneficio · **RP** responsable de producto de IA · **RT** responsable técnico · **RO** responsable de operación · **RR** responsable de riesgos · **AUD** auditor de IA · **OIA** oficina de IA · **CG** control de gestión · **CIA** comité de IA · **SEG** seguridad de la información · **DAT** propietario de los datos · **PER** función de personas · **SEC** secretaría del consejo |
| **Nivel** | **I** iniciativa · **Ca** cartera · **Co** compañía · **Cj** consejo |
| **Aplicación** | Fases **F0–F7**, *gates* **G0–G7**, etapas **C1–C5**, esferas **E01–E09** y ambición **Opt** (Optimizar), **Aum** (Aumentar), **Tra** (Transformar). "Todas" si aplica en general. |
| **Fuente** | Herramienta del documento 03 (T01–T22) y, cuando existe, campo del panel del consejo (T17) entre comillas invertidas. |
| **Lite** | **●** forma parte del conjunto mínimo recomendado para Lite (sección 19). |
| **A definir por la compañía** | El documento de origen del indicador no fija ese dato; la compañía lo aprueba en C2 al seleccionar el indicador (sección 21). |

---

## 4. Familias

| Código | Familia | Indicadores |
|---|---|---|
| **VAL** | Valor | 18 |
| **COS** | Coste | 11 |
| **EMB** | Embudo | 13 |
| **AGI** | Agilidad | 6 |
| **RIE** | Riesgo y cumplimiento | 17 |
| **OPE** | Operación y calidad de modelos | 26 |
| **ADO** | Adopción y personas | 15 |
| **DAT** | Datos y conocimiento | 20 |
| **CLI** | Cliente y producto | 9 |
| **TRA** | Transformación | 9 |
| **MAD** | Madurez | 4 |
| **CON** | Consejo | 5 |
| **PRO** | Procesos y decisión | 6 |
| | **Total** | **159** |

---

## 5. Ficha de un indicador

Cada indicador del catálogo, y cualquier indicador propio que añada la compañía, se documenta con esta ficha. La selección de indicadores que aprueba la compañía en C2, con su meta, umbral, periodicidad, responsable y fuente, se registra en P35 §13.

| Campo | Contenido |
|---|---|
| Código | `IND-<FAMILIA>-NN` |
| Nombre y definición | Qué mide, en una frase comprensible. |
| Fórmula | Numerador, denominador, exclusiones y fórmula oficial del documento 40 que aplica. |
| Unidad | €, %, días, nº, puntos, índice. |
| Fuente | Herramienta, campo y sistema de origen. |
| Periodicidad | Frecuencia de cálculo y de revisión. |
| Responsable | Quién lo calcula y quién responde del resultado. |
| Nivel | Iniciativa, cartera, compañía o consejo. |
| Aplicación | Fase, etapa, esfera y ambición. |
| Umbral | Valor aprobado en C2 o "a fijar"; lectura de semáforo si procede. |
| Indicador de contraste | Indicador con el que debe leerse. |
| Estado | Activo, en pruebas o retirado; fecha de alta. |

---

## 6. Valor · VAL

| Código | Indicador y definición | Fórmula | Unidad | Fuente | Per. | Resp. | Nivel | Aplicación | Umbral orientativo | Lite |
|---|---|---|---|---|---|---|---|---|---|---|
| IND-VAL-01 | **Valor neto anual.** Valor que aporta el caso o la cartera tras restar su coste recurrente. | Eficiencias materializadas + retorno − coste recurrente (40 F2) | €/año | T01 · T12 · `economia` (neto) | T | PAT · OIA | I · Ca · Cj | F5–F7 · todas | ≥ 0 por caso en régimen | ● |
| IND-VAL-02 | **Eficiencias materializadas.** Menor coste real o coste evitado presupuestado. | Σ unidades incrementales × valor unitario (40 F1), sin capacidad no materializada | €/año | T12 · `economia.eficiencias[]` | T | RN | I · Ca | F5–F7 · Opt, Aum | A fijar | |
| IND-VAL-03 | **Retorno.** Más ingresos o margen atribuibles. | Σ unidades incrementales × margen o ingreso unitario (40 F1) | €/año | T12 · `economia.retorno[]` | T | RN | I · Ca | F5–F7 · E01, E02 · Aum, Tra | A fijar | |
| IND-VAL-04 | **Valor por estado.** Valor bruto realizado desglosado por estado. | Σ importes validados; Σ declarados; Σ estimados | € | T12 · `valor_por_estado` | T | CG | I · Ca · Cj | F6–F7 · C4 | — | |
| IND-VAL-05 | **Proporción validada.** Parte del valor bruto realizado validada por control de gestión o auditoría. | Validado ÷ (validado + declarado + estimado) (40 F6) | % | T12 · `valor_por_estado` | T | CG | Ca · Cj | C4, C5 | Siempre visible; objetivo a fijar | ● |
| IND-VAL-06 | **Valor neto validado.** Neto con solo valor validado y coste completo. | Eficiencias validadas + retorno validado − coste recurrente (40 F2v) | €/año | T12 · T13 | T | CG | Ca · Cj | C4 | A fijar | |
| IND-VAL-07 | **Capacidad liberada.** Horas netas liberadas y su valoración. | Volumen × (tiempo de referencia − tiempo con IA); × coste horario completo (40 F4) | h/año · €/año | T12 · `eficiencias[capacidad_liberada]` | T | RP | I · Ca | F5–F7 · E03, E04 · Opt, Aum | — | |
| IND-VAL-08 | **Tasa de materialización.** Parte de la capacidad liberada convertida en menor coste o coste evitado. | Horas materializadas ÷ horas liberadas netas (40 F5) | % | T12 · T20 | T | RN | I · Ca | F6–F7 · Opt | A fijar; en G7 Opt se exige ahorro materializado | ● |
| IND-VAL-09 | **Tasa de reasignación.** Capacidad reasignada de forma explícita a actividades nuevas. | Horas reasignadas ÷ horas liberadas netas (40 F5) | % | T20 | T | RN | I · Ca | F6–F7 · Aum | A fijar | |
| IND-VAL-10 | **Neto adicional por euro.** Neto anual que aporta cada euro de inversión adicional. | (Neto potencial − neto actual) ÷ inversión adicional (40 F3) | € por € | T01 · `economia.inversion.adicional_potencial` | G · T | OIA | I · Ca | F2, F3, F7 · C3 | Ordena la cartera; sin umbral | ● |
| IND-VAL-11 | **Valor actual neto.** Criterio económico único de viabilidad. | −I + Σ neto_t ÷ (1 + r)^t, t = 1…H (40 F7) | € | T11 | G | CG | I | G3, G7 · Opt, Aum | ≥ 0 con H y r de C2 | |
| IND-VAL-12 | **ROI.** Retorno sobre la inversión inicial, informativo. | (Σ neto_t − I) ÷ I (40 F8) | % | T11 | G | CG | I | G3, G7 | Sin umbral | |
| IND-VAL-13 | **Plazo de recuperación.** Años hasta recuperar la inversión inicial, informativo. | Primer año con neto acumulado ≥ I, interpolado (40 F9) | años | T11 | G | CG | I | G3, G7 | Sin umbral | |
| IND-VAL-14 | **Realización del valor.** Valor realizado frente al esperado en el plan. | Valor realizado del periodo ÷ valor esperado del periodo (40 F10) | % | T12 · P28 | T | RN | I · Ca | F6–F7 · R6 | Orientativo: ≥ 90 % verde; 70–90 % ámbar; < 70 % rojo (a fijar) | ● |
| IND-VAL-15 | **Casos con neto negativo.** Casos en producción cuyo coste supera su valor. | Nº de casos con F2 < 0, con lista nominal | nº | T01 | T | OIA | Ca · Cj | C4 · R6 | 0 sin plan aprobado | ● |
| IND-VAL-16 | **Casos sin dato de valor.** Casos en producción sin eficiencias, retorno o coste informados. | Nº de casos con algún bloque de F2 nulo | nº | T01 | T | OIA | Ca · Cj | C4 | 0 | |
| IND-VAL-17 | **Declarado pendiente de validar.** Valor declarado que superó el plazo de validación. | Declarado con antigüedad > plazo (40 §4.1) ÷ declarado total | % · € | T12 | T | CG | Ca | C4 | 0 % | |
| IND-VAL-18 | **Solapes con reparto declarado.** Casos con resultados compartidos que tienen clave de reparto aprobada. | Casos con solape y clave aprobada ÷ casos con solape | % | T12 · `comparte_valor_con` · `clave_reparto` | T | OIA | Ca | C4 | 100 % | |

---

## 7. Coste · COS

| Código | Indicador y definición | Fórmula | Unidad | Fuente | Per. | Resp. | Nivel | Aplicación | Umbral orientativo | Lite |
|---|---|---|---|---|---|---|---|---|---|---|
| IND-COS-01 | **Coste recurrente anual.** Coste completo anual del caso, directo y compartido repartido. | Σ partes recurrentes de las nueve categorías (42 §4) | €/año | T13 · `economia.inversion.recurrente_anual` | M · T | CG | I · Ca | F5–F7 | Presupuesto aprobado | ● |
| IND-COS-02 | **Inversión inicial.** Construcción más adopción inicial. | Coste de construcción + coste de adopción inicial (40 §8.2) | € | T13 · `economia.inversion.construccion` | G | CG | I · Ca | G3–G5 · Tra por etapa | Límite aprobado en G3 | |
| IND-COS-03 | **Coste total de propiedad.** Coste del caso en todo el horizonte. | I + Σ coste recurrente_t (t = 1…H) + coste de retirada (42 §5) | € | T13 | G · A | CG | I | G3, G7 | — | |
| IND-COS-04 | **Desviación presupuestaria.** Diferencia entre coste real y presupuesto. | (Coste real − presupuesto) ÷ presupuesto | % | T13 · contabilidad | M | CG | I · Ca | F3–F7 | A fijar | |
| IND-COS-05 | **Coste por unidad de resultado.** Coste de producir una unidad de resultado útil. | Coste recurrente del periodo ÷ unidades de resultado útil (42 §9) | € por unidad | T13 · sistema de origen | M | RP | I | F5–F7 | ≤ coste unitario de la línea base (Opt) | ● |
| IND-COS-06 | **Consumo frente a presupuesto.** Consumo de modelos y cómputo acumulado frente al presupuesto. | Consumo acumulado ÷ presupuesto del periodo | % | T13 · facturación del proveedor | M (diario en agentes) | RO | I · Ca | F5–F7 · IA generativa, agentes | Alertas al 50, 80 y 100 % (42 §8) | ● |
| IND-COS-07 | **Coste etiquetado.** Coste de nube e IA con etiqueta de iniciativa válida. | Coste con etiqueta válida ÷ coste total de nube e IA | % | Facturación de nube · T13 | M | OIA | Co | C4 | A fijar | |
| IND-COS-08 | **Coste no atribuido.** Coste de IA no imputado a casos ni a uso corporativo. | Coste no atribuido ÷ coste total de IA | % | T13 | T | CG | Co · Cj | C4 | A fijar | |
| IND-COS-09 | **Coste de licencias ociosas.** Licencias pagadas sin uso en el periodo. | Licencias asignadas sin uso × coste unitario | € | T21 · `adopcion` (licencias) | M | OIA | Co | C4 | A fijar | |
| IND-COS-10 | **Inversión evitada por paradas.** Presupuesto aprobado no comprometido de iniciativas paradas o retiradas. | Σ presupuesto aprobado − Σ comprometido, en iniciativas paradas (42 §10) | € | T01 · T13 | T | OIA | Ca · Cj | C4, C5 | Informativo; no suma en valor | |
| IND-COS-11 | **Coste de IA de la compañía.** Coste total de IA, incluido el uso corporativo. | Σ coste recurrente + Σ inversión del ejercicio de todos los sistemas | €/año | T13 | T | CG | Co · Cj | C1, C4 | Presupuesto marco de C2 | ● |

---

## 8. Embudo · EMB

| Código | Indicador y definición | Fórmula | Unidad | Fuente | Per. | Resp. | Nivel | Aplicación | Umbral orientativo | Lite |
|---|---|---|---|---|---|---|---|---|---|---|
| IND-EMB-01 | **Tiempo en fase.** Días en cada fase sin contar la espera. | Fecha de salida − fecha de entrada − días en espera; mediana y P80 | días | T01 (eventos) | M | OIA | Ca | F0–F5, F7 | Plazos de 03 §3.6 | |
| IND-EMB-02 | **Iniciativas estancadas.** Iniciativas que superan el plazo de referencia de su fase. | Nº con tiempo en fase > plazo de referencia | nº | T01 | M | OIA | Ca | Todas | 0 sin revisión del comité | ● |
| IND-EMB-03 | **Conversión por gate.** Proporción de decisiones favorables en cada *gate*. | (Continuar + Continuar con condiciones) ÷ decisiones del *gate* | % | T03 | T | OIA | Ca | G0–G7 | Informativo | |
| IND-EMB-04 | **Iteraciones por gate.** Iteraciones medias antes de la decisión. | Σ iteraciones ÷ nº de decisiones del *gate* | nº | T03 | T | OIA | Ca | G0–G7 | ≤ 2 (01 §7.4) | |
| IND-EMB-05 | **Tiempo en espera.** Días detenida por causa externa, por motivo. | Σ días en estado En espera, por motivo | días | T01 | M | OIA | Ca | Todas | Informativo | |
| IND-EMB-06 | **Motivos de parada y retirada.** Distribución de motivos codificados. | Paradas y retiradas por motivo ÷ total de paradas y retiradas | % | T01 | S | CIA | Ca | C5 | Informativo | |
| IND-EMB-07 | **Cumplimiento de gates.** Criterios que se cumplen sobre los aplicables. | Criterios Cumple ÷ (criterios aplicables) | % | T03 | G | AUD | I · Ca | G0–G7 | 100 % de obligatorios para Continuar | |
| IND-EMB-08 | **Condiciones vencidas.** Condiciones abiertas fuera de plazo. | Nº de condiciones abiertas con fecha límite superada | nº | T03 | M | CIA | Ca · Cj | G0–G7 | 0 | ● |
| IND-EMB-09 | **Valor por fase.** Valor neto anual esperado de las iniciativas en cada fase. | Σ valor neto anual esperado por fase | € | T01 | T | OIA | Ca · Cj | C3, C4 | Informativo | |
| IND-EMB-10 | **Valor ponderado.** Valor esperado ajustado por la probabilidad histórica de llegar a producción. | Σ valor esperado × probabilidad histórica desde la fase actual (IND-EMB-12) | € | T01 | T | OIA | Cj | C4 | Solo con historial suficiente | |
| IND-EMB-11 | **Mezcla de ambición por fase.** Distribución de la ambición en cada fase. | Iniciativas de cada nivel en la fase ÷ iniciativas en la fase | % | T01 | T | OIA | Ca · Cj | C3, C4 | Informativo (señal 7) | |
| IND-EMB-12 | **Probabilidad histórica de llegar a producción.** Tasa histórica de paso a G5 desde cada fase. | Iniciativas que alcanzaron G5 desde la fase f ÷ iniciativas que pasaron por f (cohortes cerradas) | % | T01 | S | OIA | Ca | C3, C5 | Informativo | |
| IND-EMB-13 | **Capacidad de parar.** Iniciativas que se paran o retiran con motivo codificado frente a las que reciben decisión de *gate*. | Iniciativas paradas o retiradas con motivo codificado en 12 meses ÷ iniciativas con decisión de *gate* en 12 meses | % | T01 · T03 | A definir por la compañía | A definir por la compañía | Ca · Cj | C4, C5 · E09 | A definir por la compañía | |

---

## 9. Agilidad · AGI

Definiciones de los tramos en el documento 40 §9. Todos se segmentan por nivel de riesgo residual, ambición e intensidad.

| Código | Indicador y definición | Fórmula | Unidad | Fuente | Per. | Resp. | Nivel | Aplicación | Umbral orientativo | Lite |
|---|---|---|---|---|---|---|---|---|---|---|
| IND-AGI-01 | **Idea → aprobación.** Tiempo desde el registro hasta la decisión favorable de G3. | Fecha de decisión favorable de G3 − fecha de registro − días en espera; mediana y P80 | días | T01 · `agilidad.tia_dias_por_tier` | T | OIA | Ca · Cj | F0–F3 | Lite 70 · Enterprise 125 (orientativo) | ● |
| IND-AGI-02 | **Aprobación → producción.** Tiempo desde G3 hasta G5. | Fecha de G5 favorable − fecha de G3 favorable − días en espera; mediana y P80 | días | T01 · `agilidad.ttp_dias_por_tier` | T | OIA | Ca · Cj | F4–F5 | Lite 80 · Enterprise 135 (orientativo) | ● |
| IND-AGI-03 | **Idea → producción.** Tiempo total hasta producción. | Fecha de G5 favorable − fecha de registro − días en espera; mediana y P80 | días | T01 | T | OIA | Ca · Cj | F0–F5 | Lite 150 · Enterprise 260 (orientativo) | |
| IND-AGI-04 | **Tiempo de decisión.** Días entre la solicitud y la decisión de un *gate*. | Fecha de decisión − fecha de solicitud; mediana y P80 | días hábiles | T03 | M | CIA | Ca · Cj | G0–G7 | Lite 5 · Enterprise 10 | |
| IND-AGI-05 | **Decisiones en plazo.** Decisiones de *gate* tomadas dentro del plazo aprobado. | Decisiones en plazo ÷ decisiones | % | T03 · `agilidad.sla_dias_por_tier` | T | CIA | Cj | G0–G7 | A fijar | |
| IND-AGI-06 | **Pendientes de análisis de riesgo.** Iniciativas registradas sin evaluación de riesgos iniciada dentro del plazo. | Nº de iniciativas con días desde registro > plazo y sin evaluación iniciada | nº | T01 · T06 · `agilidad.backlog_sin_analisis` | M | RR | Ca · Cj | F0–F3 | 0 fuera de plazo | |

---

## 10. Riesgo y cumplimiento · RIE

| Código | Indicador y definición | Fórmula | Unidad | Fuente | Per. | Resp. | Nivel | Aplicación | Umbral orientativo | Lite |
|---|---|---|---|---|---|---|---|---|---|---|
| IND-RIE-01 | **Cobertura del inventario.** Sistemas inventariados con clasificación regulatoria, intensidad y responsable. | Sistemas con los tres campos ÷ sistemas inventariados | % | T02 | T | OIA | Co · Cj | F0 · C1, C4 | 100 % | ● |
| IND-RIE-02 | **Sistemas en producción sin gate.** Sistemas operando sin G5 aprobado ni regularización. | Nº de sistemas en producción sin G5 ni revisión equivalente a G7 (01 §14) | nº | T02 · T03 | M | AUD | Co · Cj | F6 · C4 | 0 (no conformidad crítica) | ● |
| IND-RIE-03 | **Riesgos residuales altos y críticos.** Riesgos abiertos con nivel residual Alto o Crítico. | Nº de riesgos con P × I residual ≥ 10, por nivel (especificación §5.1) | nº | T06 | M | RR | I · Ca · Cj | F3–F7 | Crítico: 0 sin aprobación del consejo | |
| IND-RIE-04 | **Evaluaciones de impacto pendientes.** Evaluaciones exigidas no completadas. | Evaluaciones requeridas no completadas ÷ requeridas | % | T07 | M | RR | Ca · Cj | F3–F4 · E08 | 0 antes de G5 | |
| IND-RIE-05 | **No conformidades abiertas.** No conformidades por tipo. | Nº abiertas por tipo: menor, mayor, crítica | nº | T08 | M | AUD | Ca · Cj | Todas | Informativo | |
| IND-RIE-06 | **No conformidades fuera de plazo.** Contención o plan de acción vencidos. | Nº de no conformidades con plazo de contención o de plan superado (01 §12) | nº | T08 | M | AUD | Ca · Cj | Todas | 0 | |
| IND-RIE-07 | **Incidentes por severidad.** Incidentes del periodo por sistema y severidad. | Nº de incidentes S1, S2, S3 y S4 | nº | T08 · `seguimiento.incidentes` | M | RO | I · Ca · Cj | F6 | A fijar; S1 se informa siempre | ● |
| IND-RIE-08 | **Detección y contención.** Rapidez de respuesta a incidentes. | Mediana de horas inicio → detección y detección → contención | horas | T08 · `horas_detectar` · `horas_contener` | T | RO | Ca · Cj | F6 | A fijar | |
| IND-RIE-09 | **Revisiones de continuidad caducadas.** Sistemas en producción con R6 vencida. | Sistemas con R6 vencida ÷ sistemas en producción | % | T03 | M | OIA | Ca · Cj | F6 · R6 | 0 | ● |
| IND-RIE-10 | **Uso no autorizado.** Herramientas o usos de IA sin aprobación detectados y regularizados. | Nº detectados en el periodo; regularizados ÷ detectados | nº · % | T21 · `adopcion.shadow_ai_detectada` | T | SEG | Co · Cj | C4 · E09 | A fijar | ● |
| IND-RIE-11 | **Proveedores críticos evaluados.** Proveedores de nivel N3 con evaluación y estrategia de salida vigentes. | Proveedores N3 con evaluación vigente y estrategia de salida ÷ proveedores N3 | % | T09 · `proveedor_dora` | S | RR | Co · Cj | F3 · C4 | 100 % | |
| IND-RIE-12 | **Análisis de cambios regulatorios en plazo.** Cambios regulatorios relevantes con análisis de impacto dentro del plazo fijado. | Cambios regulatorios relevantes con análisis de impacto dentro del plazo fijado ÷ cambios regulatorios relevantes identificados | % | A definir por la compañía | A definir por la compañía | A definir por la compañía | Co · Cj | C4 · E08 | A definir por la compañía | |
| IND-RIE-13 | **Adaptación anticipada.** Obligaciones de aplicación futura con plan de adaptación aprobado. | Obligaciones con fecha de aplicación futura con plan de adaptación aprobado ÷ obligaciones con fecha de aplicación en los próximos 24 meses | % | A definir por la compañía | A definir por la compañía | A definir por la compañía | Co · Cj | C2, C4 · E08 | A definir por la compañía | |
| IND-RIE-14 | **Revisión ética aplicada.** Iniciativas que requieren revisión ética y la tienen registrada antes de G3. | Iniciativas que requieren revisión ética y la tienen registrada antes de G3 ÷ iniciativas que la requieren | % | A definir por la compañía | A definir por la compañía | A definir por la compañía | Ca · Cj | F3 · G3 · E08 | A definir por la compañía | |
| IND-RIE-15 | **Capacidad efectiva de veto.** Iniciativas modificadas o paradas por decisión del órgano ético. | Nº de iniciativas modificadas o paradas por decisión del órgano ético en los últimos 12 meses, informado junto al número de iniciativas revisadas | nº | A definir por la compañía | A definir por la compañía | A definir por la compañía | Co · Cj | C4, C5 · E08 | A definir por la compañía | |
| IND-RIE-16 | **Transparencia pública.** Sistemas con exposición directa a personas descritos en la información pública de la compañía. | Sistemas con exposición directa a personas descritos en la información pública de la compañía ÷ sistemas con exposición directa | % | A definir por la compañía | A definir por la compañía | A definir por la compañía | Co · Cj | C4 · E08 | A definir por la compañía | |
| IND-RIE-17 | **Concentración en el proveedor principal de modelos.** Peso del proveedor principal en el gasto en modelos. | Gasto en el proveedor principal de modelos ÷ gasto total en modelos | % | A definir por la compañía | A definir por la compañía | A definir por la compañía | Co · Cj | C3, C4 · E09 | A definir por la compañía | |

---

## 11. Operación y calidad de modelos · OPE

### 11.1 Comunes

| Código | Indicador y definición | Fórmula | Unidad | Fuente | Per. | Resp. | Nivel | Aplicación | Umbral orientativo | Lite |
|---|---|---|---|---|---|---|---|---|---|---|
| IND-OPE-01 | **Rendimiento dentro de umbral.** Sistemas cuya métrica principal cumple el umbral aprobado en G5. | Sistemas con métrica principal dentro de umbral ÷ sistemas en producción | % | P25 · monitorización | M | RO | I · Ca | F6 | 100 % | ● |
| IND-OPE-02 | **Disponibilidad.** Tiempo en servicio frente al comprometido. | Tiempo disponible ÷ tiempo de servicio comprometido | % | Monitorización | M | RO | I | F6 | Nivel de servicio acordado | |
| IND-OPE-16 | **Cobertura de monitorización.** Sistemas en producción con plan de monitorización vigente y alertas probadas. | Sistemas en producción con P25 vigente y alertas probadas ÷ sistemas en producción | % | P25 | T | A definir por la compañía | Ca | F6 | 100 % | |
| IND-OPE-17 | **Cambios sustanciales sin gate.** Cambios sustanciales aplicados sin volver al *gate* que corresponde. | Cambios sustanciales aplicados sin volver al *gate* ÷ cambios sustanciales | % | Registro de cambios (documento 52 §6) | T | A definir por la compañía | I · Ca | F6 | 0 % | |
| IND-OPE-18 | **Tasa de cambios fallidos.** Cambios revertidos o que originan un incidente. | Cambios revertidos o que originan un incidente ÷ cambios aplicados | % | Registro de cambios (documento 52 §6) · T08 | T | A definir por la compañía | I · Ca | F6 | Tendencia decreciente | |
| IND-OPE-21 | **Reversión probada.** Sistemas con prueba del plan de reversión en plazo. | Sistemas con prueba de reversión en plazo ÷ sistemas en producción | % | P19 | S | A definir por la compañía | I · Ca | F5–F6 | 100 % | |
| IND-OPE-22 | **Ruido de alertas.** Alertas que se cierran sin acción. | Alertas cerradas sin acción ÷ alertas generadas | % | Monitorización · P25 | M | A definir por la compañía | I · Ca | F6 | Tendencia decreciente | |
| IND-OPE-23 | **Versiones de proveedor en riesgo.** Sistemas con versión de modelo de proveedor con obsolescencia anunciada y sin plan de migración. | Sistemas cuya versión de modelo de proveedor tiene obsolescencia anunciada sin plan de migración ÷ sistemas con modelo de proveedor | % | A definir por la compañía | M | A definir por la compañía | Ca | F6 | 0 % | |
| IND-OPE-26 | **Modo degradado por coste.** Días en que el sistema funciona degradado por agotar el presupuesto de consumo y calidad durante el modo. | Días del periodo en N1 o superior de la cascada (documento 52 §10.3), por nivel; y calidad medida en el modo ÷ calidad mínima de P25 | días · % | P27 · P25 | M | RO | I · Ca | F6 · IA generativa, agentes | Tendencia decreciente; calidad ≥ 100 % del mínimo | |

### 11.2 Aprendizaje automático predictivo

| Código | Indicador y definición | Fórmula | Unidad | Fuente | Per. | Resp. | Nivel | Aplicación | Umbral orientativo | Lite |
|---|---|---|---|---|---|---|---|---|---|---|
| IND-OPE-03 | **Métrica principal del modelo.** Discriminación o error del modelo en producción. | Métrica aprobada en G5 (por ejemplo, AUC o error absoluto medio) en la ventana de producción | según métrica | Monitorización · `operacion.auc` | M | RT | I | F5–F6 · ML predictivo | Umbral de G5 | |
| IND-OPE-04 | **Deriva de datos.** Cambio en la distribución de las variables respecto a la referencia. | PSI = Σ (% actual − % referencia) × ln(% actual ÷ % referencia), por tramos | índice | Monitorización · `operacion.psi` | M | RT | I | F6 · ML predictivo | A fijar por modelo | |
| IND-OPE-05 | **Tratamiento directo.** Casos resueltos sin intervención manual. | Casos resueltos sin intervención ÷ casos elegibles | % | Sistema de origen · `operacion.stp_pct` | M | RP | I | F6 · E04 · Opt | A fijar | |
| IND-OPE-06 | **Diferencia de resultados entre grupos.** Indicador de sesgo en decisiones sobre personas. | Máxima diferencia de tasa de resultado favorable entre los grupos definidos en la evaluación de impacto | puntos porcentuales | Pruebas de sesgo · P22 | S | RR | I | F5–F6 · decisiones sobre personas | A fijar (documento 33) | |
| IND-OPE-19 | **Deriva sin tratar.** Modelos con deriva en nivel crítico sin acción registrada en plazo. | Modelos con deriva en nivel crítico sin acción registrada en el plazo de P25 ÷ modelos monitorizados | % | Monitorización · P25 | M | A definir por la compañía | I · Ca | F6 · ML predictivo | 0 % | |

### 11.3 IA generativa

| Código | Indicador y definición | Fórmula | Unidad | Fuente | Per. | Resp. | Nivel | Aplicación | Umbral orientativo | Lite |
|---|---|---|---|---|---|---|---|---|---|---|
| IND-OPE-07 | **Exactitud en evaluación.** Respuestas correctas y fundamentadas en el conjunto de evaluación. | Respuestas correctas y fundamentadas ÷ respuestas evaluadas | % | Evaluaciones · `operacion.evals_fecha` (fecha) | M y en cada cambio | RT | I | F5–F6 · IA generativa | Umbral de G5 | |
| IND-OPE-08 | **Respuestas no fundamentadas.** Respuestas con afirmaciones no respaldadas por las fuentes. | Respuestas no fundamentadas ÷ respuestas revisadas en la muestra de revisión humana | % | Revisión muestral · `operacion.qa_humano_pct` | M | RP | I | F6 · IA generativa | A fijar | |
| IND-OPE-09 | **Contención.** Conversaciones resueltas sin derivación a una persona. | Conversaciones sin derivación ÷ conversaciones | % | Registros · `operacion.contencion_pct` | M | RP | I | F6 · E01 · IA generativa | A fijar; leer con OPE-08 y CLI-03 | |
| IND-OPE-10 | **Éxito de inyección de instrucciones en pruebas.** Ataques de prueba que logran alterar el comportamiento. | Ataques con éxito ÷ ataques ejecutados | % | T10 · `ia_ofensiva` | S y en cada cambio | SEG | I · Cj | F5–F6 · IA generativa, agentes | 0 en acciones con efecto | |
| IND-OPE-24 | **Consultas fuera del alcance validado.** Deriva de uso: consultas que no corresponden a los temas o tareas validados en G5. | Consultas clasificadas fuera del alcance validado ÷ consultas del periodo | % | Clasificación de consultas o muestreo · P25 | M | RO | I | F6 · IA generativa, agentes | Según referencia de G5 (documento 52 §4.2.6) | |
| IND-OPE-25 | **Respuestas desiguales en pares contrafactuales.** Sesgo en las respuestas: pares de casos idénticos salvo en un atributo protegido con resultado materialmente distinto. | Pares con diferencia material ÷ pares evaluados | % | Evaluaciones · P25 | En cada evaluación de regresión y periódica | RR | I · Cj | F5–F6 · IA generativa con decisiones, comunicaciones o exposición directa a personas | Umbral de P17 (documento 52 §4.2.7) | |

### 11.4 Agentes

| Código | Indicador y definición | Fórmula | Unidad | Fuente | Per. | Resp. | Nivel | Aplicación | Umbral orientativo | Lite |
|---|---|---|---|---|---|---|---|---|---|---|
| IND-OPE-11 | **Mínimo privilegio.** Identidades de agente con permisos revisados y limitados a lo necesario. | Identidades con revisión vigente de mínimo privilegio ÷ identidades de agente | % | T10 · `agente.minimo_privilegio` | T | SEG | I · Co · Cj | F4–F6 · A2, A3 | 100 % | |
| IND-OPE-12 | **Trazabilidad de acciones.** Acciones registradas con identidad, intención y resultado. | Acciones registradas completas ÷ acciones ejecutadas | % | Registros · `agente.logging_acciones_pct` | M | RO | I | F6 · agentes | 100 % | |
| IND-OPE-13 | **Validación humana de acciones sensibles.** Acciones sensibles validadas por una persona antes de ejecutarse. | Acciones sensibles con validación previa ÷ acciones sensibles | % | Registros · `agente.validacion_humana_escrituras` | M | RO | I | F6 · A1, A2 | 100 % donde el diseño lo exige | |
| IND-OPE-14 | **Prueba del interruptor de parada.** Días desde la última prueba satisfactoria. | Fecha de cálculo − fecha de la última prueba satisfactoria | días | T10 · `agente.kill_switch` | T | RO | I · Cj | F5–F6 · agentes | Según plan de prueba (P19, P24) | |
| IND-OPE-15 | **Finalización de tareas.** Tareas del agente completadas correctamente sin intervención. | Tareas completadas correctamente ÷ tareas iniciadas | % | Registros | M | RP | I | F6 · agentes | Umbral de G5 | |
| IND-OPE-20 | **Acciones de agente bloqueadas.** Acciones bloqueadas por los límites del agente y revisión de las anomalías de intención. | Acciones bloqueadas por límites ÷ acciones intentadas; y anomalías de intención revisadas ÷ detectadas | % | Registros | M | A definir por la compañía | I | F6 · agentes | 100 % de anomalías revisadas | |

---

## 12. Adopción y personas · ADO

| Código | Indicador y definición | Fórmula | Unidad | Fuente | Per. | Resp. | Nivel | Aplicación | Umbral orientativo | Lite |
|---|---|---|---|---|---|---|---|---|---|---|
| IND-ADO-01 | **Licencias activas.** Licencias de IA con uso en el periodo. | Licencias con uso ÷ licencias asignadas | % | T21 · `adopcion` (licencias activas y asignadas) | M | OIA | Co · Cj | C4 · uso corporativo | A fijar | |
| IND-ADO-02 | **Usuarios activos.** Usuarios con uso semanal frente a los usuarios objetivo. | Usuarios activos semanales ÷ usuarios objetivo | % | T20 · `adopcion` (usuarios activos semanales) | M | RP | I | F5–F7 · Aum | Objetivo de adopción de G2 | |
| IND-ADO-03 | **Tasa de uso en el proceso.** Transacciones en que se usa la IA. | Transacciones con IA ÷ transacciones elegibles | % | Sistema de origen | M | RP | I | F5–F7 | Hipótesis de G2 | ● |
| IND-ADO-04 | **Aceptación de propuestas.** Propuestas del sistema aceptadas sin cambios. | Propuestas aceptadas sin cambios ÷ propuestas | % | Registros | M | RP | I | F6 · A1 | Informativo; valores extremos se analizan con OPE-08 | |
| IND-ADO-05 | **Alfabetización en IA.** Personas del colectivo obligado con formación completada. | Personas formadas ÷ personas del colectivo obligado | % | T20 · función de personas | T | PER | Co · Cj | C2, C4 · E03 | 100 % del colectivo obligado antes del acceso o del ejercicio del rol; renovación vigente de PER-PC ≥ 90 % (umbral de alerta, a calibrar) | ● |
| IND-ADO-06 | **Roles rediseñados.** Puestos con funciones rediseñadas formalmente por la IA. | Puestos rediseñados ÷ puestos afectados por iniciativas en producción | % | T20 · función de personas | S | PER | I · Co | F6–F7 · E03 · Aum, Tra | Informativo (señal 5) | |
| IND-ADO-07 | **Capacidades críticas de IA cubiertas.** Puestos críticos de IA cubiertos. | Puestos críticos cubiertos ÷ puestos críticos necesarios | % | Función de personas · `adopcion` (vacantes) | S | PER | Co | C1, C4 | A fijar | |
| IND-ADO-08 | **Iniciativas promovidas por empleados.** Peso de las propuestas de empleados en el registro y su paso por G1. | Iniciativas registradas originadas en propuestas de empleados ÷ iniciativas registradas; e iniciativas de origen empleado que superan G1 ÷ iniciativas de origen empleado registradas | % | T01 (campo de origen) | S | A definir por la compañía | Ca · Co | F1 · G1 · E03 | Tendencia | |
| IND-ADO-09 | **Cobertura de la evaluación de efecto.** Iniciativas con evaluación del efecto sobre el trabajo registrada. | Iniciativas en fase 3 o posterior con evaluación de efecto registrada ÷ iniciativas en fase 3 o posterior | % | T01 · T20 | T | A definir por la compañía | Ca | F3–F7 · E03 | 100 % | |
| IND-ADO-10 | **Supervisores cualificados.** Sistemas cuyos supervisores designados tienen registrada la formación de supervisión. | Sistemas A1–A3 en producción cuyos supervisores designados tienen formación PER-PD registrada ÷ sistemas A1–A3 en producción | % | T02 · sistema de formación | T | A definir por la compañía | I · Co | F5–F6 · A1–A3 | 100 % | |
| IND-ADO-11 | **Capacidad liberada sin decisión.** Horas liberadas sin destino decidido fuera del plazo de C2. | Horas en PER-D5 con antigüedad superior al plazo de C2 ÷ horas liberadas medidas | % | T20 | T | A definir por la compañía | I · Ca | F6–F7 · E03 · Opt, Aum | Tendencia decreciente | |
| IND-ADO-12 | **Información previa a la representación.** Sistemas con efecto en condiciones de trabajo o empleo informados antes de su uso. | Sistemas con efecto en condiciones de trabajo o empleo informados antes de su uso ÷ sistemas con ese efecto | % | Registro de información (documento 50 §7.2) | T | A definir por la compañía | Co · Cj | F4–F5 · G5 · E03 | 100 % | |
| IND-ADO-13 | **Revisión humana en decisiones sobre personas.** Decisiones sobre personas asistidas por IA con revisión humana documentada. | Decisiones sobre personas asistidas por IA con revisión humana documentada ÷ decisiones sobre personas asistidas por IA | % | Registros del sistema | M | A definir por la compañía | I | F6 · decisiones sobre personas | 100 % en A1 | |
| IND-ADO-14 | **Impugnaciones de decisiones asistidas.** Solicitudes de revisión o reclamaciones sobre decisiones asistidas por IA. | Solicitudes de revisión o reclamaciones ÷ decisiones comunicadas; y proporción de estimadas | % | Canal de reclamaciones | T | A definir por la compañía | I · Co | F6 · decisiones sobre personas | Tendencia y causas | |
| IND-ADO-15 | **Percepción de los colectivos afectados.** Respuestas favorables sobre utilidad, confianza, apoyo, carga y autonomía en la encuesta de pulso (P44). | Respuestas favorables en las preguntas de utilidad, confianza, apoyo, carga y autonomía (P44) ÷ respuestas válidas | % | Encuesta de pulso | G (fase 5, a los 3 meses y en R6 Enterprise) | A definir por la compañía | I · Co | F5–F6 · R6 · E03 | Tendencia; acción si empeora | |

---

## 13. Datos y conocimiento · DAT

| Código | Indicador y definición | Fórmula | Unidad | Fuente | Per. | Resp. | Nivel | Aplicación | Umbral orientativo | Lite |
|---|---|---|---|---|---|---|---|---|---|---|
| IND-DAT-01 | **Datos con propietario.** Conjuntos usados por sistemas de IA con propietario asignado. | Conjuntos con propietario ÷ conjuntos usados por sistemas de IA | % | Catálogo de datos · P16 | T | DAT | Co | F3–F4 · E05 | 100 % | |
| IND-DAT-02 | **Calidad de datos críticos.** Conjuntos críticos que cumplen sus umbrales de calidad. | Conjuntos críticos dentro de umbral de completitud, exactitud y actualidad ÷ conjuntos críticos | % | Monitorización de calidad | M | DAT | I · Co | F3–F6 · E05 | A fijar por conjunto | |
| IND-DAT-03 | **Base legal verificada.** Conjuntos con datos personales con base legal y finalidad verificadas para el uso de IA. | Conjuntos verificados ÷ conjuntos con datos personales usados por IA | % | Registro de tratamientos · P11 | T | RR | Co · Cj | F3 · E05, E08 | 100 % | |
| IND-DAT-04 | **Linaje documentado.** Sistemas en producción con linaje de datos y modelos. | Sistemas con linaje documentado ÷ sistemas en producción | % | P16 | T | RT | Co | F4–F6 | 100 % en Enterprise | |
| IND-DAT-05 | **Vigencia de la base de conocimiento.** Documentos revisados en plazo en las bases que usan los asistentes. | Documentos revisados dentro de su plazo ÷ documentos de la base | % | Gestor documental | M | DAT | I | F6 · E06 · IA generativa | A fijar | |
| IND-DAT-06 | **Conocimiento crítico disponible.** Procesos críticos con conocimiento documentado y accesible. | Procesos críticos con conocimiento documentado ÷ procesos críticos identificados | % | Mapa de conocimiento (documento 51) | S | DAT | Co | C1, C5 · E06 | A fijar | |
| IND-DAT-07 | **Cobertura de catálogo.** Conjuntos usados por IA con ficha completa. | Conjuntos usados por IA con ficha completa ÷ conjuntos usados por IA | % | Catálogo de datos | T | A definir por la compañía | Co | F3–F6 · E05 | 100 % en Enterprise | |
| IND-DAT-08 | **Calidad por dimensión.** Registros que superan las reglas de cada dimensión de calidad. | Registros que superan las reglas de la dimensión ÷ registros evaluados, por conjunto y dimensión | % | Monitorización de calidad | Según frecuencia de carga | A definir por la compañía | I | F3–F6 · E05 | Umbral fijado por caso en fase 3 | |
| IND-DAT-09 | **Cumplimiento de retención.** Conjuntos con plazo de retención definido y aplicado. | Conjuntos con plazo de retención definido y aplicado ÷ conjuntos usados por IA | % | Catálogo de datos | S | A definir por la compañía | Co | F4–F7 · E05 | 100 % | |
| IND-DAT-10 | **Incidentes con causa en datos.** Incidentes de IA cuya causa raíz está en los datos. | Incidentes de IA cuya causa raíz es de datos ÷ incidentes de IA cerrados | % | T08 | T | A definir por la compañía | Ca · Co | F6 · E05 | Tendencia decreciente | |
| IND-DAT-11 | **Tiempo de acceso a los datos.** Días hasta disponer de los datos que solicita una iniciativa. | Mediana de días entre la solicitud de acceso a datos de una iniciativa y su disponibilidad en el entorno autorizado | días | T01 (eventos) · solicitudes de acceso | T | A definir por la compañía | Ca · Co | F2–F4 · E05 | Tendencia decreciente | |
| IND-DAT-12 | **Datos sintéticos validados.** Conjuntos sintéticos en uso con validación de utilidad y privacidad. | Conjuntos sintéticos en uso con validación de utilidad y privacidad registrada ÷ conjuntos sintéticos en uso | % | Catálogo de datos | S | A definir por la compañía | I · Co | F4–F6 · E05 | 100 % | |
| IND-DAT-13 | **Fuentes de conocimiento con responsable.** Fuentes conectadas a IA con responsable de contenido. | Fuentes de conocimiento conectadas a IA con responsable de contenido ÷ fuentes conectadas | % | Inventario de fuentes | T | A definir por la compañía | Co | F4–F6 · E06 · IA generativa | 100 % | |
| IND-DAT-14 | **Uso de contenido caducado.** Respuestas que citan documentos fuera de vigencia. | Respuestas muestreadas que citan documentos fuera de vigencia ÷ respuestas muestreadas con cita | % | Evaluación continua | M | A definir por la compañía | I | F6 · E06 · IA generativa | Próximo a 0 % | |
| IND-DAT-15 | **Exposición indebida de conocimiento.** Accesos a contenido sin permiso detectados en pruebas o en producción. | Hallazgos de acceso a contenido sin permiso detectados en pruebas o en producción, por periodo | nº | Pruebas de permisos · T08 | T | A definir por la compañía | I · Co | F5–F6 · E06 · IA generativa | 0 | |
| IND-DAT-16 | **Dependencia de conocimiento crítico.** Dominios críticos que dependen de pocas personas y no tienen documentación utilizable. | Dominios críticos con dos personas o menos que los dominan y sin documentación utilizable ÷ dominios críticos | % | Mapa de dependencia (documento 51 §10.6) | A | A definir por la compañía | Co | C1, C5 · E06 | Tendencia decreciente | |
| IND-DAT-17 | **Cobertura de captura.** Dominios críticos dependientes con contenido capturado y validado. | Dominios críticos dependientes con contenido capturado y validado ÷ dominios críticos dependientes | % | Plan de captura | S | A definir por la compañía | Co | C4, C5 · E06 | Según plan | |
| IND-DAT-18 | **Consultas sin fuente pertinente.** Consultas en las que no se recupera ningún documento pertinente. | Consultas sin documento pertinente recuperado ÷ consultas evaluadas | % | Evaluación continua | M | A definir por la compañía | I | F6 · E06 · IA generativa | Tendencia decreciente | |
| IND-DAT-19 | **Resolución útil.** Consultas resueltas según el usuario y confirmadas en muestra. | Consultas marcadas como resueltas por el usuario y confirmadas en muestra ÷ consultas totales | % | Telemetría del asistente | A definir por la compañía | A definir por la compañía | I | F6 · E06 · IA generativa | A definir por la compañía | |
| IND-DAT-20 | **Tiempo hasta la autonomía.** Días hasta que una persona incorporada alcanza autonomía en su rol. | Mediana de días hasta que una persona incorporada alcanza autonomía en su rol, frente a la línea base | días | Función de personas | A definir por la compañía | A definir por la compañía | I · Co | F6–F7 · E06 | A definir por la compañía | |

---

## 14. Cliente y producto · CLI

| Código | Indicador y definición | Fórmula | Unidad | Fuente | Per. | Resp. | Nivel | Aplicación | Umbral orientativo | Lite |
|---|---|---|---|---|---|---|---|---|---|---|
| IND-CLI-01 | **Satisfacción incremental.** Diferencia de satisfacción en interacciones con IA. | Satisfacción con IA − satisfacción del grupo de control o línea base | puntos | Encuestas | T | RN | I | F5–F7 · E01 | ≥ 0 (sin deterioro) | |
| IND-CLI-02 | **Tiempo de resolución.** Cambio en el tiempo para resolver la petición del cliente. | Mediana con IA − mediana de referencia | horas | Sistema de atención | M | RP | I | F6 · E01, E04 | A fijar | |
| IND-CLI-03 | **Reclamaciones relacionadas con IA.** Reclamaciones atribuidas a respuestas o decisiones del sistema. | Reclamaciones atribuidas ÷ interacciones × 10.000 | por 10.000 | Gestión de reclamaciones | M | RN | I · Cj | F6 · exposición directa | A fijar | |
| IND-CLI-04 | **Conversión incremental.** Diferencia de conversión frente al grupo de control. | Tasa de conversión con IA − tasa del grupo de control | puntos porcentuales | Prueba A/B · sistema comercial | M | RN | I | F5–F7 · E01, E02 · Aum, Tra | Hipótesis de G2 | |
| IND-CLI-05 | **Retención incremental.** Diferencia de retención frente al grupo de control. | Tasa de retención con IA − tasa del grupo de control | puntos porcentuales | Sistema de clientes | T | RN | I | F5–F7 · E01 | Hipótesis de G2 | |
| IND-CLI-06 | **Uso de funcionalidades con IA.** Usuarios activos del producto que usan funciones con IA. | Usuarios activos que usan funciones con IA en el periodo ÷ usuarios activos del producto | % | Telemetría del producto | A definir por la compañía | A definir por la compañía | I | F6–F7 · E02 | A definir por la compañía | |
| IND-CLI-07 | **Reducción del tiempo de lanzamiento.** Reducción de la mediana de días de idea a lanzamiento frente a la línea base. | (Mediana de días de idea a lanzamiento en la línea base − mediana actual) ÷ mediana de la línea base | % | Gestión de producto | A definir por la compañía | A definir por la compañía | I · Co | F6–F7 · E02 · Aum, Tra | A definir por la compañía | |
| IND-CLI-08 | **Margen de la oferta con IA.** Margen de la oferta con IA después de sus costes directos, incluido el de IA. | (Ingresos de la oferta con IA − costes directos, incluido el coste de IA imputado) ÷ ingresos de la oferta con IA | % | Control de gestión | A definir por la compañía | A definir por la compañía | I · Co | F6–F7 · E02 · Aum, Tra | A definir por la compañía | |
| IND-CLI-09 | **Defectos contenidos antes del lanzamiento.** Defectos detectados en pruebas sobre el total de defectos. | Defectos detectados en pruebas ÷ (defectos detectados en pruebas + defectos detectados en producción) | % | Gestión de calidad | A definir por la compañía | A definir por la compañía | I | F5–F7 · E02 | A definir por la compañía | |

---

## 15. Transformación · TRA

Las ocho señales del documento 00 §5.3. La puntuación 0–3 de cada señal, sus umbrales iniciales "a calibrar" y la determinación del perfil se definen en el documento 12.

| Código | Indicador y definición | Fórmula | Unidad | Fuente | Per. | Resp. | Nivel | Aplicación | Umbral orientativo | Lite |
|---|---|---|---|---|---|---|---|---|---|---|
| IND-TRA-01 | **Señal 1 · Composición de la inversión.** Peso de Aumentar y Transformar en el gasto de IA. | (Coste recurrente + inversión) de Aum y Tra ÷ (coste recurrente + inversión) total | % | T01 · T13 | A | OIA | Co · Cj | C1, C5 | Documento 12 | ● |
| IND-TRA-02 | **Señal 2 · Composición del valor.** Peso del retorno en el valor validado. | Retorno validado ÷ (eficiencias validadas + retorno validado) | % | T12 | A | CG | Co · Cj | C1, C5 | Documento 12 | ● |
| IND-TRA-03 | **Señal 3 · Materialización.** Capacidad liberada convertida en ahorro o reasignada. | (Horas materializadas + horas reasignadas) ÷ horas liberadas netas de la cartera | % | T12 · T20 | A | OIA | Co · Cj | C1, C5 | Documento 12 | |
| IND-TRA-04 | **Señal 4 · Profundidad del cambio.** Iniciativas que rediseñan procesos de extremo a extremo. | Iniciativas en producción con rediseño de extremo a extremo ÷ iniciativas en producción | % | T05 (pregunta 2) | A | OIA | Co · Cj | C1, C5 | Documento 12 | |
| IND-TRA-05 | **Señal 5 · Modelo operativo.** Iniciativas con cambio verificado de roles, estructura o decisiones. | Iniciativas Aum y Tra en producción con cambio verificado y supervisión definida ÷ iniciativas Aum y Tra en producción | % | T05 (pregunta 3) · T20 | A | OIA | Co · Cj | C1, C5 | Documento 12 | |
| IND-TRA-06 | **Señal 6 · Ingresos habilitados por IA.** Ingresos que no existirían sin IA. | Ingresos de productos, servicios o canales que no existirían sin IA ÷ ingresos totales | % | Contabilidad · T01 | A | CG | Co · Cj | C1, C5 · E02 | Documento 12 | |
| IND-TRA-07 | **Señal 7 · Paso a producción.** Llegada a producción de las apuestas de mayor ambición. | Iniciativas Aum y Tra que alcanzan G5 ÷ las que superaron G2 (cohorte cerrada); y mediana idea → producción Aum y Tra ÷ mediana de Opt | % · ratio | T01 | A | OIA | Co · Cj | C1, C5 | Documento 12 | |
| IND-TRA-08 | **Señal 8 · Decisión del consejo.** Decisiones de transformación adoptadas y seguidas. | Nº de decisiones de Tra adoptadas por el consejo con seguimiento en el registro | nº | T18 | A | SEC | Cj | C2, C5 | Documento 12 | |
| IND-TRA-09 | **Perfil de transformación.** Posición de la compañía entre eficiencia y transformación. | Puntuación 0–3 de cada señal y perfil resultante (documento 12) | perfil | T14 | A | OIA | Co · Cj | C1, C5 | — | |

---

## 16. Madurez · MAD

| Código | Indicador y definición | Fórmula | Unidad | Fuente | Per. | Resp. | Nivel | Aplicación | Umbral orientativo | Lite |
|---|---|---|---|---|---|---|---|---|---|---|
| IND-MAD-01 | **Nivel global de madurez.** Nivel de la compañía con la limitación por gobierno y riesgo. | Mínimo entre ⌊media ponderada de D1–D7⌋ y (mínimo de D1 y D6) + 1 | nivel 0–5 | T15 | A | OIA | Co · Cj | C1, C5 | Objetivo de C2 | ● |
| IND-MAD-02 | **Nivel por dimensión.** Nivel más alto con todos sus criterios y los inferiores cumplidos con evidencia. | Máximo n tal que se cumplen los criterios de los niveles 1…n | nivel 0–5 | T15 | A | OIA | Co | C1, C5 | Objetivo de C2 | |
| IND-MAD-03 | **Brecha de madurez.** Distancia al objetivo por dimensión. | Nivel objetivo de C2 − nivel actual | niveles | T15 | A | OIA | Cj | C2, C5 | 0 al final del plan | |
| IND-MAD-04 | **Criterios con evidencia verificada.** Solidez de la autoevaluación. | Criterios con evidencia verificada ÷ criterios declarados cumplidos | % | T15 | A | AUD | Co | C1, C5 | 100 % | |

---

## 17. Consejo · CON

| Código | Indicador y definición | Fórmula | Unidad | Fuente | Per. | Resp. | Nivel | Aplicación | Umbral orientativo | Lite |
|---|---|---|---|---|---|---|---|---|---|---|
| IND-CON-01 | **Recomendaciones abiertas.** Recomendaciones del consejo sin cerrar, por estado. | Nº de recomendaciones abiertas por estado | nº | T18 | T | SEC | Cj | C4 | Informativo | |
| IND-CON-02 | **Recomendaciones vencidas.** Recomendaciones con fecha comprometida superada. | Abiertas con fecha superada ÷ abiertas | % | T18 | T | SEC | Cj | C4 | 0 % | ● |
| IND-CON-03 | **Cierres con valoración independiente.** Cierres respaldados por evidencia y valoración independiente. | Cerradas con evidencia y valoración independiente ÷ cerradas | % | T18 | T | AUD | Cj | C4 | 100 % | |
| IND-CON-04 | **Cobertura de la información al consejo.** Indicadores del paquete del consejo con dato. | Indicadores con dato ÷ indicadores del paquete | % | T17 | T | OIA | Cj | C4 | A fijar; "sin dato" siempre visible | |
| IND-CON-05 | **Casos presentados en detalle.** Número de casos tratados en detalle por sesión. | Nº de casos presentados en detalle en la sesión | nº | Orden del día · T18 | T | OIA | Cj | C4 | ≤ 3 | |

---

## 18. Procesos y decisión · PRO

Indicadores de resultado de las esferas 04 (Operaciones) y 07 (Decisión) procedentes del documento 10. Se leen con IND-OPE-05, IND-TRA-04 e IND-ADO-04.

| Código | Indicador y definición | Fórmula | Unidad | Fuente | Per. | Resp. | Nivel | Aplicación | Umbral orientativo | Lite |
|---|---|---|---|---|---|---|---|---|---|---|
| IND-PRO-01 | **Reducción del tiempo de ciclo.** Reducción del tiempo de ciclo del proceso frente a la línea base. | (Tiempo de ciclo de la línea base − tiempo de ciclo actual) ÷ tiempo de ciclo de la línea base | % | Sistemas del proceso | A definir por la compañía | A definir por la compañía | I · Ca | F5–F7 · E04 · Opt, Aum | A definir por la compañía | |
| IND-PRO-02 | **Variación del coste unitario.** Cambio del coste por unidad procesada frente a la línea base. | (Coste total del proceso ÷ unidades procesadas) − coste unitario de la línea base | € por unidad | Control de gestión | A definir por la compañía | A definir por la compañía | I · Ca | F5–F7 · E04 · Opt | A definir por la compañía | |
| IND-PRO-03 | **Tasa de error o retrabajo.** Unidades con error o retrabajo, frente a la línea base. | Unidades con error o retrabajo ÷ unidades procesadas, frente a la línea base | % | Gestión de calidad | A definir por la compañía | A definir por la compañía | I | F5–F7 · E04 | A definir por la compañía | |
| IND-PRO-04 | **Decisiones con autonomía asignada.** Tipos de decisión con IA que tienen nivel de autonomía asignado y documentado. | Tipos de decisión en los que interviene IA con nivel A0–A3 asignado y documentado ÷ tipos de decisión en los que interviene IA | % | T02 · P17 | A definir por la compañía | A definir por la compañía | Ca · Co | F4–F6 · E07 | A definir por la compañía | |
| IND-PRO-05 | **Mejora de la calidad de la decisión.** Diferencia de resultado de las decisiones con IA frente al grupo de control, en dinero. | Resultado medio de las decisiones con IA − resultado medio del grupo de control, traducido a dinero (por ejemplo, pérdida evitada) | € | T12 | A definir por la compañía | A definir por la compañía | I | F5–F7 · E07 · Aum, Tra | A definir por la compañía | |
| IND-PRO-06 | **Latencia de decisión.** Tiempo desde que se dispone de la información hasta que se ejecuta la decisión. | Mediana del tiempo desde que se dispone de la información hasta que se ejecuta la decisión, frente a la línea base | horas o días | Registros del proceso | A definir por la compañía | A definir por la compañía | I | F5–F7 · E07 | A definir por la compañía | |

---

## 19. Conjunto mínimo recomendado para Lite

Una compañía que aplica SEVEN-G con intensidad Lite debería empezar con estos 26 indicadores. Cubren las diez reglas de medición, el control del embudo, los riesgos que generan no conformidades críticas y las dos primeras señales de transformación.

| Familia | Indicadores | Pregunta que responden |
|---|---|---|
| Valor | IND-VAL-01, 05, 08, 10, 14, 15 | ¿Aporta valor neto, cuánto está validado, se materializa, dónde invertir y qué casos no se sostienen? |
| Coste | IND-COS-01, 05, 06, 11 | ¿Cuánto cuesta cada caso y la IA en su conjunto, y está controlado el consumo? |
| Embudo | IND-EMB-02, 08 | ¿Hay iniciativas atascadas o condiciones sin cumplir? |
| Agilidad | IND-AGI-01, 02 | ¿Cuánto tardamos en aprobar y en llevar a producción? |
| Riesgo y cumplimiento | IND-RIE-01, 02, 07, 09, 10 | ¿Sabemos qué IA tenemos, está toda aprobada, qué incidentes hay, se revisa y hay uso no autorizado? |
| Operación | IND-OPE-01 | ¿Los sistemas funcionan dentro de lo aprobado? |
| Adopción y personas | IND-ADO-03, 05 | ¿Se usa y está formada la plantilla? |
| Transformación | IND-TRA-01, 02 | ¿Invertimos y obtenemos valor más allá de la eficiencia? |
| Madurez | IND-MAD-01 | ¿Dónde estamos? |
| Consejo | IND-CON-02 | ¿Se cumplen las recomendaciones del consejo? |

Cuando una iniciativa pasa a Enterprise se añaden, como mínimo, los indicadores de riesgo IND-RIE-03, 04 y 11 y, según la tecnología, los de las secciones 11.2 a 11.4.

---

## 20. Selección para el panel del consejo

El panel del consejo (T17) no muestra todo el catálogo. La selección se aprueba en C2 y debería incluir:

1. **Valor:** IND-VAL-01, 04, 05, 06, 07 y 15, con la proporción validada junto a cada total (documento 40 §11).
2. **Coste:** IND-COS-11 y, por caso, IND-COS-01.
3. **Agilidad:** IND-AGI-01, 02 y 04, segmentados por riesgo y ambición.
4. **Riesgo:** IND-RIE-02, 03, 07, 09 y 10.
5. **Agentes:** IND-OPE-11 a 14 cuando haya agentes A2 o A3.
6. **Adopción:** IND-ADO-01 y 05.
7. **Transformación:** IND-TRA-01 a 09 una vez al año.
8. **Consejo:** IND-CON-01 a 03.

---

## 21. Correspondencia de códigos provisionales

Los documentos 10, 50, 51 y 52 usan códigos provisionales de indicadores. Esta tabla los relaciona con el código `IND-` del catálogo. "Complementario" indica que el indicador del catálogo mide lo contrario (por ejemplo, vencidas frente a en plazo); "relacionado" indica que lo cubre en parte; "incorporado" indica que el indicador, que no tenía equivalente, se ha añadido al catálogo con el nombre, la fórmula, la fuente, la periodicidad y el umbral de su documento de origen, y con "A definir por la compañía" en los datos que ese documento no fija. Cuando dos códigos provisionales miden lo mismo (IE03.06 y PER-14, IE05.05 y DAT-10, IE06.02 y CNC-06) comparten código. Los códigos provisionales de conocimiento del documento 51 usan el prefijo `CNC-` para no confundirse con la familia `IND-CON` (consejo).

### 21.1 Indicadores por esfera (documento 10)

| Código provisional | Indicador | Equivalente en el catálogo |
|---|---|---|
| IE01.01 | Cobertura de IA en la relación con clientes | IND-ADO-03 (relacionado) |
| IE01.02 | Resolución efectiva sin derivación | IND-OPE-09 (relacionado) |
| IE01.03 | Diferencial de satisfacción | IND-CLI-01 |
| IE01.04 | Retención incremental en dinero | IND-CLI-05 (en tasa; valoración con IND-VAL-03) |
| IE01.05 | Conversión incremental en dinero | IND-CLI-04 (en tasa; valoración con IND-VAL-03) |
| IE01.06 | Reclamaciones atribuibles a IA | IND-CLI-03 |
| IE02.01 | Ingresos habilitados por IA | IND-TRA-06 |
| IE02.02 | Uso de funcionalidades con IA | IND-CLI-06 (incorporado) |
| IE02.03 | Reducción del tiempo de lanzamiento | IND-CLI-07 (incorporado) |
| IE02.04 | Coste de IA por unidad de servicio | IND-COS-05 |
| IE02.05 | Margen de la oferta con IA | IND-CLI-08 (incorporado) |
| IE02.06 | Defectos contenidos antes del lanzamiento | IND-CLI-09 (incorporado) |
| IE03.01 | Adopción efectiva | IND-ADO-02 |
| IE03.02 | Capacidad liberada materializada | IND-VAL-08 |
| IE03.03 | Capacidad liberada reasignada | IND-VAL-09 |
| IE03.04 | Alfabetización en IA por rol | IND-ADO-05 |
| IE03.05 | Roles rediseñados | IND-ADO-06 |
| IE03.06 | Iniciativas promovidas por empleados | IND-ADO-08 (incorporado) |
| IE04.01 | Reducción del tiempo de ciclo | IND-PRO-01 (incorporado) |
| IE04.02 | Variación del coste unitario | IND-PRO-02 (incorporado) |
| IE04.03 | Procesamiento directo | IND-OPE-05 |
| IE04.04 | Tasa de error o retrabajo | IND-PRO-03 (incorporado) |
| IE04.05 | Procesos rediseñados de extremo a extremo | IND-TRA-04 |
| IE04.06 | Ahorro materializado validado | IND-VAL-02 en su versión solo validado (regla 4) |
| IE05.01 | Cobertura del catálogo | IND-DAT-01 (relacionado) |
| IE05.02 | Calidad de los datos críticos | IND-DAT-02 |
| IE05.03 | Base legal documentada | IND-DAT-03 |
| IE05.04 | Linaje documentado | IND-DAT-04 |
| IE05.05 | Tiempo de acceso a los datos | IND-DAT-11 (incorporado) |
| IE05.06 | Iniciativas bloqueadas por datos | IND-EMB-05 e IND-EMB-06 (relacionado, motivo datos) |
| IE06.01 | Cobertura del conocimiento crítico | IND-DAT-06 |
| IE06.02 | Concentración del conocimiento | IND-DAT-16 (incorporado) |
| IE06.03 | Exactitud verificada | IND-OPE-07 |
| IE06.04 | Resolución útil | IND-DAT-19 (incorporado) |
| IE06.05 | Vigencia de las fuentes | IND-DAT-05 |
| IE06.06 | Tiempo hasta la autonomía | IND-DAT-20 (incorporado) |
| IE07.01 | Decisiones con autonomía asignada | IND-PRO-04 (incorporado) |
| IE07.02 | Trazabilidad de decisiones | IND-OPE-12 (relacionado, solo agentes) |
| IE07.03 | Tasa de anulación humana | IND-ADO-04 (complementario) |
| IE07.04 | Interruptor de parada probado | IND-OPE-14 (relacionado: antigüedad de la prueba) |
| IE07.05 | Mejora de la calidad de la decisión | IND-PRO-05 (incorporado) |
| IE07.06 | Latencia de decisión | IND-PRO-06 (incorporado) |
| IE08.01 | Sistemas clasificados | IND-RIE-01 (relacionado) |
| IE08.02 | Evaluaciones exigidas completadas en plazo | IND-RIE-04 (complementario) |
| IE08.03 | No conformidades regulatorias fuera de plazo | IND-RIE-06 (relacionado, origen regulatorio) |
| IE08.04 | Análisis de cambios regulatorios en plazo | IND-RIE-12 (incorporado) |
| IE08.05 | Adaptación anticipada | IND-RIE-13 (incorporado) |
| IE08.06 | Uso no autorizado regularizado | IND-RIE-10 |
| IE08.07 | Revisión ética aplicada | IND-RIE-14 (incorporado) |
| IE08.08 | Capacidad efectiva de veto | IND-RIE-15 (incorporado) |
| IE08.09 | Transparencia pública | IND-RIE-16 (incorporado) |
| IE09.01 | Cobertura del registro | IND-RIE-01 (relacionado) |
| IE09.02 | Continuidad vigente | IND-RIE-09 (complementario) |
| IE09.03 | Recomendaciones del consejo cerradas en plazo | IND-CON-02 (relacionado) |
| IE09.04 | Tiempo de decisión de *gate* | IND-AGI-04 |
| IE09.05 | Tiempo hasta producción | IND-AGI-03 |
| IE09.06 | Capacidad de parar | IND-EMB-13 (incorporado) |
| IE09.07 | Concentración en el proveedor principal de modelos | IND-RIE-17 (incorporado) |
| IE09.08 | Estrategia de salida | IND-RIE-11 |
| IE09.09 | Coste de IA imputado | IND-COS-08 (complementario) |

### 21.2 Personas, datos, conocimiento y operación (documentos 50, 51 y 52)

| Código provisional | Documento | Indicador | Equivalente en el catálogo |
|---|---|---|---|
| PER-01 | 50 | Cobertura de la evaluación de efecto | IND-ADO-09 (incorporado) |
| PER-02 | 50 | Alfabetización por perfil | IND-ADO-05 |
| PER-03 | 50 | Supervisores cualificados | IND-ADO-10 (incorporado) |
| PER-04 | 50 | Capacidad liberada materializada | IND-VAL-08 |
| PER-05 | 50 | Capacidad liberada reasignada | IND-VAL-09 |
| PER-06 | 50 | Capacidad liberada sin decisión | IND-ADO-11 (incorporado) |
| PER-07 | 50 | Adopción efectiva | IND-ADO-02 |
| PER-08 | 50 | Información previa a la representación | IND-ADO-12 (incorporado) |
| PER-09 | 50 | Revisión humana en decisiones sobre personas | IND-ADO-13 (incorporado) |
| PER-10 | 50 | Tasa de modificación humana | IND-ADO-04 (complementario) |
| PER-11 | 50 | Ratio de impacto adverso | IND-OPE-06 (relacionado: diferencia, no ratio) |
| PER-12 | 50 | Impugnaciones de decisiones asistidas | IND-ADO-14 (incorporado) |
| PER-13 | 50 | Roles rediseñados | IND-ADO-06 |
| PER-14 | 50 | Propuestas de empleados | IND-ADO-08 (incorporado) |
| PER-15 | 50 | Percepción de los colectivos afectados | IND-ADO-15 (incorporado) |
| DAT-01 | 51 | Cobertura de propiedad | IND-DAT-01 |
| DAT-02 | 51 | Cobertura de catálogo | IND-DAT-07 (incorporado) |
| DAT-03 | 51 | Cobertura de base legal | IND-DAT-03 |
| DAT-04 | 51 | Calidad por dimensión | IND-DAT-08 (incorporado) |
| DAT-05 | 51 | Conjuntos críticos en umbral | IND-DAT-02 |
| DAT-06 | 51 | Cobertura de linaje | IND-DAT-04 |
| DAT-07 | 51 | Decisiones de G3 por datos | IND-EMB-06 (relacionado, motivo datos) |
| DAT-08 | 51 | Cumplimiento de retención | IND-DAT-09 (incorporado) |
| DAT-09 | 51 | Incidentes con causa en datos | IND-DAT-10 (incorporado) |
| DAT-10 | 51 | Tiempo de acceso a datos | IND-DAT-11 (incorporado) |
| DAT-11 | 51 | Datos sintéticos validados | IND-DAT-12 (incorporado) |
| CNC-01 | 51 | Fuentes con responsable | IND-DAT-13 (incorporado) |
| CNC-02 | 51 | Vigencia del contenido | IND-DAT-05 |
| CNC-03 | 51 | Uso de contenido caducado | IND-DAT-14 (incorporado) |
| CNC-04 | 51 | Fidelidad a las fuentes | IND-OPE-08 (complementario) |
| CNC-05 | 51 | Exposición indebida | IND-DAT-15 (incorporado) |
| CNC-06 | 51 | Dependencia de conocimiento crítico | IND-DAT-16 (incorporado) |
| CNC-07 | 51 | Cobertura de captura | IND-DAT-17 (incorporado) |
| CNC-08 | 51 | Consultas sin fuente pertinente | IND-DAT-18 (incorporado) |
| OPE-01 | 52 | Disponibilidad | IND-OPE-02 |
| OPE-02 | 52 | Cobertura de monitorización | IND-OPE-16 (incorporado) |
| OPE-03 | 52 | Tiempo medio de detección | IND-RIE-08 (relacionado: mediana, no media) |
| OPE-04 | 52 | Tiempo medio de contención | IND-RIE-08 (relacionado: mediana, no media) |
| OPE-05 | 52 | Incidentes por severidad | IND-RIE-07 |
| OPE-06 | 52 | Cambios sustanciales sin *gate* | IND-OPE-17 (incorporado) |
| OPE-07 | 52 | Tasa de cambios fallidos | IND-OPE-18 (incorporado) |
| OPE-08 | 52 | Deriva sin tratar | IND-OPE-19 (incorporado) |
| OPE-09 | 52 | Respuestas con afirmaciones no soportadas | IND-OPE-08 |
| OPE-10 | 52 | Coste por transacción y desviación | IND-COS-05 e IND-COS-06 |
| OPE-11 | 52 | Acciones de agente bloqueadas | IND-OPE-20 (incorporado) |
| OPE-12 | 52 | Interruptor de parada probado | IND-OPE-14 (relacionado: antigüedad de la prueba) |
| OPE-13 | 52 | Permisos de agentes revisados | IND-OPE-11 |
| OPE-14 | 52 | R6 en plazo | IND-RIE-09 (complementario) |
| OPE-15 | 52 | Reversión probada | IND-OPE-21 (incorporado) |
| OPE-16 | 52 | Ruido de alertas | IND-OPE-22 (incorporado) |
| OPE-17 | 52 | Versiones de proveedor en riesgo | IND-OPE-23 (incorporado) |
| OPE-18 | 52 | Modo degradado por coste | IND-OPE-26 (incorporado) |
| OPE-19 | 52 | Consultas fuera del alcance validado | IND-OPE-24 (incorporado) |
| OPE-20 | 52 | Respuestas desiguales en pares contrafactuales | IND-OPE-25 (incorporado) |

---

## 22. Herramientas y plantillas asociadas

| Código | Nombre | Uso en este documento |
|---|---|---|
| **T01** | Registro de iniciativas | Fuente principal: fases, eventos, etiquetas, valor. |
| **T02 · T03** | Inventario · Gestor de *gates* | Cobertura, *gates*, condiciones, revisiones de continuidad. |
| **T06 · T07 · T08 · T09 · T10** | Riesgos · clasificador regulatorio · no conformidades e incidentes · proveedores · seguridad de agentes | Indicadores RIE y OPE de agentes. |
| **T11 · T12 · T13** | Hipótesis de valor · seguimiento de valor · costes por caso | Indicadores VAL y COS. |
| **T14 · T15** | Índice de transformación · diagnóstico de madurez | Indicadores TRA y MAD. |
| **T17 · T18** | Panel del consejo · registro de recomendaciones | Presentación e indicadores CON. |
| **T20 · T21** | Plan de adopción y capacidad · monitor de uso corporativo | Indicadores ADO, materialización y reasignación. |
| **P09 · P22 · P25 · P28** | Línea base · resultados del piloto · monitorización · seguimiento de valor | Umbrales de G5 y medición periódica. |

---

## 23. Documentos relacionados

| Documento | Relación |
|---|---|
| **00 · Qué es SEVEN-G y para qué sirve** | Reglas de medición y ocho señales de transformación. |
| **03 · Herramientas y registro de iniciativas** | Métricas del embudo, plazos de referencia y fuentes. |
| **10, 50, 51 y 52 · Esferas, personas, datos y operación** | Códigos provisionales IE, PER, DAT, CNC y OPE (sección 21). |
| **11 · Modelo de madurez** | Criterios y cálculo del nivel. |
| **12 · Índice de transformación** | Puntuación de las señales y perfiles. |
| **13 · Tesis de IA y apetito de riesgo** | Aprobación de umbrales y selección de indicadores. |
| **33 · Metodología de riesgos de IA** | Niveles de riesgo y umbrales de sesgo. |
| **35 · Seguridad de IA y agentes** | Controles medidos por los indicadores de agentes. |
| **40 · Reglas de medición del valor** | Fórmulas oficiales F1–F10 y estados. |
| **42 · Costes de IA** | Definición de coste recurrente, inversión y coste por unidad. |
| **43 · Realización de beneficios** | Uso de los indicadores de valor en el seguimiento. |
| **60 · Paquete para el consejo** | Selección de indicadores para el consejo. |

---

## 24. Control de versiones

| Versión | Fecha | Cambios |
|---|---|---|
| 0.1 | 16-09-2026 | Primera versión. Catálogo de 156 indicadores en 13 familias con código, fórmula, unidad, fuente, periodicidad, responsable, nivel, aplicación y umbral orientativo; conjunto mínimo Lite de 26 indicadores; selección orientativa para el panel del consejo. Ajustes de coherencia con 01 (separación de funciones en Lite, resultados de R6, criterio de agentes) y con 34 y 37; correspondencia de códigos provisionales de los documentos 10, 50, 51 y 52 (sección 21). Incorporados al catálogo los 47 indicadores provisionales que no tenían equivalente (familias EMB, RIE, OPE, ADO, DAT y CLI, y nueva familia PRO · Procesos y decisión, sección 18); prefijo provisional de conocimiento del documento 51 renombrado de CON- a CNC-. |
| 0.1 | 18-09-2026 | Tres indicadores nuevos de operación (159 en total): IND-OPE-24 consultas fuera del alcance validado (deriva de uso), IND-OPE-25 respuestas desiguales en pares contrafactuales (sesgo en IA generativa) e IND-OPE-26 modo degradado por coste; correspondencia con OPE-18 a OPE-20 del documento 52. |
