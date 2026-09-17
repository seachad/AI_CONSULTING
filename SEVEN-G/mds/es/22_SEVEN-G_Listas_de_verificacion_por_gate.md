# Listas de verificación por gate

**Controles binarios para verificar y auditar cada puerta de decisión**

| | |
|---|---|
| Documento | Documento 22 · Listas de verificación por *gate* |
| Versión | 0.1 (borrador de trabajo) |
| Fecha | 16-09-2026 |
| Autor | Fernando García · SEACHAD |
| Estado | Borrador para revisión. Los códigos coinciden con los criterios del documento 21. |

<!-- cifras: 8 | listas por puerta ; 128 | controles de gate ; 14 | controles de evidencia ; 21 | controles para agentes -->

---

> **Aviso legal y exención de responsabilidad.** SEVEN-G es un marco metodológico de referencia que se ofrece «tal cual» y con fines exclusivamente informativos. No constituye asesoramiento jurídico, regulatorio, financiero ni profesional, ni garantiza el cumplimiento de ninguna norma. Las referencias a regulación general (como el Reglamento Europeo de IA, el RGPD, DORA o NIS2), a normas técnicas y a regulación específica de cada sector o jurisdicción pueden ser incompletas, no aplicar a un caso concreto o quedar desactualizadas por cambios normativos, interpretaciones o criterios de las autoridades posteriores a su fecha de consulta. **Cada organización que use SEVEN-G es la única responsable de identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio**, con el asesoramiento cualificado que corresponda. El autor y SEACHAD no asumen responsabilidad alguna por el uso que se haga de este contenido ni por las decisiones que se adopten con él. Los datos, cifras, compañías y casos de los ejemplos son ficticios o ilustrativos.

## 1. Objeto y alcance

Este documento convierte los criterios del documento 21 en **controles binarios verificables**. Contiene:

- Una lista por puerta: **LV-G0, LV-G1, LV-G2, LV-G3, LV-G4, LV-G5, LV-R6 y LV-G7**.
- Una lista transversal de validación de evidencias: **LV-EV**.
- Una lista para agentes: **LV-AG**, alineada con la herramienta T10.

Cada ítem lleva el **código del criterio** del documento 21 (G3.07, R6.11…) o de la regla de evidencia (EV.05…). Si un criterio cambia, se modifica primero el documento 21 y después la lista. Las listas no añaden requisitos: si hay discrepancia, prevalece el documento 21, y este, a su vez, no puede contradecir el documento 01.

---

## 2. Instrucciones de uso

### 2.1 Quién usa las listas

| Usuario | Cuándo | Para qué |
|---|---|---|
| **Verificador** (01 §7.5: oficina de IA en Lite; auditor de IA en Enterprise) | Tras la solicitud del *gate* y antes de la decisión. | Comprobar criterios y evidencias y emitir la opinión de verificación. |
| **Auditor de IA** | En la auditoría posterior, sobre la muestra (21 §10.3). | Reejecutar la verificación y contrastarla con lo registrado. |
| **Equipo de la iniciativa** | Antes de solicitar el *gate*. | Autoevaluarse. Su autoevaluación no sustituye a la verificación. |

### 2.2 Cómo verificar

1. **Delimitar el ámbito.** Anotar intensidad, nivel de ambición, tecnología, nivel de autonomía, proveedores y, en G7, resultado propuesto. Marcar *No aplica* los ítems fuera de ámbito, con su justificación.
2. **Validar las evidencias** con LV-EV antes de revisar la lista de la puerta.
3. **Responder cada ítem** solo con lo que muestra la evidencia. "Parcialmente" es *no*. Cada ítem exige a la vez resultado (**R**) y documentación (**D**) (21 §3.1).
4. **Registrar el estado** en el gestor de *gates* (T03): respuesta *sí* con R y D → **Cumple**; *no* → **No cumple**; falta evidencia o verificación → **Pendiente**; fuera de ámbito justificado → **No aplica**.
5. **Aplicar la regla de bloqueo** (2.4) y calcular el grado de cumplimiento (21 §5.1).
6. **Emitir la opinión**: Conforme · Conforme con observaciones · No conforme (21 §10.2), y firmar.

### 2.3 Leyenda

| Columna | Valores |
|---|---|
| **☐** | Casilla. Se marca ☒ solo si la respuesta es *sí* con resultado y documentación. |
| **Código** | Criterio del documento 21 o regla EV. |
| **Pregunta** | Formulada para responder sí o no. |
| **Dónde mirar** | Plantilla (P), herramienta (T) o registro donde está la evidencia. |
| **Tipo** | **Sí ◆** no condicionable y control crítico de seguridad, cumplimiento legal o supervisión humana · **Sí** no condicionable · **Cond.** condicionable · **Rec.** recomendado. |
| **L · E** | Aplicación en Lite y Enterprise: **Sí** · **Simpl.** (plantilla simplificada) · **Rec.** · **—** (no aplica). |
| **Etiquetas** | **[GEN]** IA generativa y agentes · **[AG]** agentes (A1–A3) · **[TER]** IA de terceros. |

### 2.4 Regla de bloqueo

- Un ítem **Sí** o **Sí ◆** sin marcar impide **Continuar** y **Continuar con condiciones**.
- Un ítem **Cond.** sin marcar permite como máximo **Continuar con condiciones**, con plazo, responsable y forma de verificación.
- Un ítem **Rec.** sin marcar exige justificación registrada; sin ella, es una observación.
- Las reglas EV.05 (anterioridad) y EV.09 (separación) no admiten excepción.

### 2.5 Uso por el auditor

- Repite la verificación sobre la muestra y compara sus respuestas con los estados registrados en T03.
- Aplica, cuando proceda, pruebas de trazabilidad temporal, reejecución y observación (21 §10.4).
- Clasifica cada discrepancia como observación o no conformidad menor, mayor o crítica (21 §10.5) y la registra en T08 con código NC-AAAA-NNN.
- En Lite, cuando G0–G2 o G4–G5 se deciden en una sola sesión, comprueba que se ha completado cada lista por separado.

### 2.6 Cierre de cada lista

Al final de cada lista se anota: **criterios aplicables · grado de cumplimiento · bloqueantes · condicionables abiertos · opinión (☐ Conforme ☐ Conforme con observaciones ☐ No conforme) · verificador · fecha**.

---

## 3. LV-G0 · Autorización

Verifica: oficina de IA (Lite) · auditor de IA (Enterprise). Decide: patrocinador (Lite) · comité de IA (Enterprise).

| ☐ | Código | Pregunta | Dónde mirar | Tipo | L | E |
|---|---|---|---|---|---|---|
| ☐ | G0.01 | ¿La carta define problema, alcance y presupuesto de las fases 1 a 3, y está firmada por el patrocinador? | P01 | Sí | Simpl. | Sí |
| ☐ | G0.02 | ¿Se referencia la tesis de IA, la esfera y la prioridad en la cartera aprobada? | P01 · cartera C3 | Cond. | Sí | Sí |
| ☐ | G0.03 | ¿Constan las restricciones regulatorias, éticas, de datos, presupuestarias y de plazo? | P02 | Cond. | Simpl. | Sí |
| ☐ | G0.04 | ¿El cribado preliminar descarta prácticas prohibidas? | P02 | Sí ◆ | Sí | Sí |
| ☐ | G0.05 | ¿Están asignados con nombre los roles exigidos por la intensidad? | P03 | Sí | Sí | Sí |
| ☐ | G0.06 | ¿Se respetan las incompatibilidades de 01 §8.2 y el auditor no depende del patrocinador? | P03 · organigrama | Sí | Sí | Sí |
| ☐ | G0.07 | ¿Están respondidos y justificados los ocho criterios Enterprise? | P04 · T04 | Sí | Sí | Sí |
| ☐ | G0.08 | ¿Tiene código IA-AAAA-NNN y sus sistemas figuran en el inventario? | T01 · T02 · P05 | Sí | Sí | Sí |
| ☐ | G0.09 | ¿Los eventos confirman que no hubo gasto de construcción ni acceso a datos de producción antes de G0? | T01 (eventos) · accesos | Sí | Sí | Sí |
| ☐ | G0.10 | ¿Se ha informado a protección de datos si se prevén datos personales? | P02 | Cond. | Rec. | Sí |

## 4. LV-G1 · Oportunidad

Verifica: oficina de IA (Lite) · auditor de IA (Enterprise). Decide: patrocinador (en Enterprise, informando al comité).

| ☐ | Código | Pregunta | Dónde mirar | Tipo | L | E |
|---|---|---|---|---|---|---|
| ☐ | G1.01 | ¿Están descritos el proceso o decisión afectada, el área responsable y el problema de negocio? | P06 | Sí | Sí | Sí |
| ☐ | G1.02 | ¿La ficha de caso de uso es comprensible para un no especialista? | P31 | Cond. | Simpl. | Sí |
| ☐ | G1.03 | ¿Se analizaron alternativas sin IA y se justifica qué aporta la IA? | P06 | Sí | Sí | Sí |
| ☐ | G1.04 | ¿Constan las oportunidades descartadas con su motivo? | P06 · notas de filtrado | Cond. | Simpl. | Sí |
| ☐ | G1.05 | ¿El valor potencial tiene orden de magnitud, supuestos y estado "estimado"? | P06 | Cond. | Sí | Sí |
| ☐ | G1.06 | ¿Esfera y ambición se propusieron con las cinco preguntas del clasificador? | P07 · T05 | Sí | Sí | Sí |
| ☐ | G1.07 | ¿Se descartan prácticas prohibidas y se revisó la intensidad ante nuevos criterios Enterprise? | P07 · P04 | Sí ◆ | Sí | Sí |
| ☐ | G1.08 | ¿Se confirmó que los datos existen, tienen propietario y su uso es plausiblemente lícito? | P06 | Cond. | Sí | Sí |
| ☐ | G1.09 | [TER] ¿Se identifica el proveedor candidato y su nivel de exigencia preliminar? | P06 | Cond. | Rec. | Sí |
| ☐ | G1.10 | ¿Se identifican los roles y equipos afectados? (Optimizar: recomendado) | P06 | Cond. | Sí | Sí |

## 5. LV-G2 · Hipótesis

Verifica: oficina de IA (Lite) · auditor de IA (Enterprise). Decide: patrocinador (Lite) · comité de IA (Enterprise) · consejo en Transformar.

| ☐ | Código | Pregunta | Dónde mirar | Tipo | L | E |
|---|---|---|---|---|---|---|
| ☐ | G2.01 | ¿La hipótesis indica qué resultado la refutaría? | P08 · T11 | Sí | Sí | Sí |
| ☐ | G2.02 | ¿Cada métrica tiene definición, fórmula, fuente y responsable? | P08 | Sí | Simpl. | Sí |
| ☐ | G2.03 | ¿La línea base está medida con datos reales, o su estimación está justificada y aprobada? | P09 | Cond. | Sí | Sí |
| ☐ | G2.04 | ¿El objetivo y el umbral de éxito están cuantificados? | P08 | Sí | Sí | Sí |
| ☐ | G2.05 | ¿El método de atribución está justificado (en Enterprise, grupo de control o motivo)? | P08 | Cond. | Sí | Sí |
| ☐ | G2.06 | ¿El valor esperado tiene fórmula, es incremental y separa eficiencias, retorno y coste recurrente? | P08 · T11 | Sí | Sí | Sí |
| ☐ | G2.07 | ¿La capacidad liberada figura aparte del ahorro, con modo de materializarla o reasignarla? | P08 | Cond. | Sí | Sí |
| ☐ | G2.08 | ¿Los criterios de parada tienen umbral y fecha o hito, con fecha anterior a la inversión? | P08 · T01 | Sí | Sí | Sí |
| ☐ | G2.09 | ¿La ambición está confirmada y se explica cualquier cambio desde G1? | P07 · T05 | Sí | Sí | Sí |
| ☐ | G2.10 | ¿Hay objetivo de adopción con usuarios, uso y frecuencia? (Optimizar: recomendado) | P08 · P20 | Cond. | Sí | Sí |
| ☐ | G2.11 | Transformar: ¿hay hitos de aprendizaje, límite de inversión y criterios de parada por etapa? | P08 | Sí | — | Sí |
| ☐ | G2.12 | Transformar: ¿consta la aprobación expresa del consejo o de su comisión delegada? | P29 · acta | Sí | — | Sí |
| ☐ | G2.13 | ¿Están calculados la inversión hasta G5 y el neto adicional por euro preliminar? | P08 · T11 | Cond. | Simpl. | Sí |

## 6. LV-G3 · Viabilidad

Verifica: oficina de IA (Lite) · auditor de IA (Enterprise). Decide: patrocinador con conformidad de riesgos (Lite) · comité de IA (Enterprise). Principal puerta de parada.

| ☐ | Código | Pregunta | Dónde mirar | Tipo | L | E |
|---|---|---|---|---|---|---|
| ☐ | G3.01 | ¿La viabilidad técnica se demostró con datos reales de la compañía? | P10 · resultados de la prueba técnica | Sí | Sí | Sí |
| ☐ | G3.02 | ¿Está evaluada la calidad de los datos y tienen propietario? | P10 | Cond. | Simpl. | Sí |
| ☐ | G3.03 | ¿Protección de datos confirma la base legal y la minimización? | P11 | Sí ◆ | Sí | Sí |
| ☐ | G3.04 | ¿Están estimados los costes de construcción, recurrentes y de adopción por categoría? | P10 · T13 | Sí | Simpl. | Sí |
| ☐ | G3.05 | ¿El neto esperado es coherente con el apetito y el horizonte de C2 según la ambición? | P10 · P08 · tesis C2 | Sí | Sí | Sí |
| ☐ | G3.06 | ¿Los criterios de parada son los aprobados en G2 o su cambio está aprobado? | P08 (versiones) · P29 | Sí | Sí | Sí |
| ☐ | G3.07 | ¿La clasificación regulatoria está fechada, firmada con criterio jurídico e indica el rol de la compañía? | P11 · T07 | Sí ◆ | Sí | Sí |
| ☐ | G3.08 | ¿Se descarta cualquier práctica prohibida? (Si no: Parar) | P11 | Sí ◆ | Sí | Sí |
| ☐ | G3.09 | ¿Están determinadas las evaluaciones de impacto y hechas o iniciadas las exigibles antes del tratamiento? | P11 | Sí ◆ | Sí | Sí |
| ☐ | G3.10 | ¿Cada obligación aplicable tiene fase, rol y evidencia? | P11 | Cond. | Simpl. | Sí |
| ☐ | G3.11 | ¿Los riesgos tienen probabilidad, impacto y nivel inherente y residual con la escala del documento 33? | P12 · T06 | Sí | Simpl. | Sí |
| ☐ | G3.12 | ¿Todo riesgo residual Crítico tiene aprobación del consejo y los Altos y Medios la aceptación que corresponde? | P12 · P29 | Sí ◆ | Sí | Sí |
| ☐ | G3.13 | ¿Cada riesgo residual Alto o Crítico tiene control, responsable y plazo? | P13 | Sí | Sí | Sí |
| ☐ | G3.14 | ¿Cada riesgo Medio tiene respuesta decidida y responsable? | P13 | Cond. | Simpl. | Sí |
| ☐ | G3.15 | ¿Se revisó la intensidad con la información de la fase 3? | P04 · T04 | Sí | Sí | Sí |
| ☐ | G3.16 | ¿Está valorado el impacto en las personas según la ambición? | P10 · P20 | Cond. | Simpl. | Sí |
| ☐ | G3.17 | [GEN] ¿Están valorados inyección de instrucciones, fuga de información, contenido erróneo, permisos excesivos y acciones no autorizadas? | P12 (RT-GEN, RT-SEG) | Sí ◆ | Sí | Sí |
| ☐ | G3.18 | [GEN] ¿El nivel de autonomía está justificado y la intensidad es coherente con él (A2 o A3 con efecto sobre terceros, dinero, datos personales o sistemas de producción → Enterprise)? | P04 · P12 | Sí ◆ | Sí | Sí |
| ☐ | G3.19 | [GEN] ¿Hay conjuntos de prueba, métricas y umbrales de evaluación definidos? | P10 | Cond. | Simpl. | Sí |
| ☐ | G3.20 | [TER] ¿El proveedor está evaluado al nivel N1–N3 que le corresponde, incluida la dependencia? | P14 · T09 | Sí | Simpl. | Sí |
| ☐ | G3.21 | [TER] ¿Las condiciones contractuales mínimas figuran como requisito de contratación? | P14 | Sí ◆ | Sí | Sí |
| ☐ | G3.22 | [TER] ¿El proveedor aporta o se compromete a aportar la documentación regulatoria necesaria? | P14 · P11 | Cond. | Rec. | Sí |

## 7. LV-G4 · Diseño

Verifica: oficina de IA (Lite) · auditor de IA (Enterprise). Decide: patrocinador con conformidad de riesgos (Lite) · comité de IA (Enterprise).

| ☐ | Código | Pregunta | Dónde mirar | Tipo | L | E |
|---|---|---|---|---|---|---|
| ☐ | G4.01 | ¿El registro de arquitectura recoge componentes, integraciones, entornos, terceros y decisiones? | P15 | Cond. | Simpl. | Sí |
| ☐ | G4.02 | ¿Está diseñado el registro automático de entradas, salidas, versiones y decisiones, con conservación definida? | P15 | Sí ◆ | Simpl. | Sí |
| ☐ | G4.03 | ¿El linaje cubre datos, versiones de modelo y modelos de base de terceros? | P16 | Cond. | Simpl. | Sí |
| ☐ | G4.04 | ¿Está fijado qué decide el sistema, qué valida una persona, qué no se delega y quién interviene? | P17 | Sí ◆ | Sí | Sí |
| ☐ | G4.05 | ¿Están diseñados los avisos de transparencia y la revisión humana de decisiones automatizadas? | P17 | Sí ◆ | Sí | Sí |
| ☐ | G4.06 | ¿Cada riesgo Medio o superior tiene un control diseñado y trazable? | P12 · P18 | Sí | Sí | Sí |
| ☐ | G4.07 | ¿El diseño de seguridad cubre accesos, cifrado, entornos, secretos y amenazas específicas de IA? | P18 | Sí ◆ | Simpl. | Sí |
| ☐ | G4.08 | ¿La monitorización tiene métricas, umbrales, alertas y responsable de operación asignado? | P15 · P03 | Cond. | Simpl. | Sí |
| ☐ | G4.09 | ¿Existe mecanismo de parada con responsable y tiempo objetivo? | P19 | Sí ◆ | Sí | Sí |
| ☐ | G4.10 | ¿El plan de reversión tiene criterios, procedimiento, responsable, alternativa y prueba prevista? | P19 | Sí | Simpl. | Sí |
| ☐ | G4.11 | ¿El plan de adopción cubre formación, comunicación, apoyo, medición y lo propio de la ambición? | P20 · T20 | Cond. | Simpl. | Sí |
| ☐ | G4.12 | ¿El plan de pruebas y el diseño del piloto tienen criterios de aceptación y el método de atribución aprobado? | P22 | Cond. | Simpl. | Sí |
| ☐ | G4.13 | ¿Las evaluaciones de impacto exigibles están cerradas y sus medidas incorporadas? | P11 | Sí ◆ | Sí | Sí |
| ☐ | G4.14 | Alto riesgo: ¿están planificadas con responsable las obligaciones de la compañía según su rol? | P11 · P15 | Sí ◆ | — | Sí |
| ☐ | G4.15 | [AG] ¿El agente tiene identidad propia con credenciales gestionadas, rotadas y revocables? | P18 · T10 | Sí ◆ | Sí | Sí |
| ☐ | G4.16 | [AG] ¿Están definidos permisos mínimos y límites de herramientas, operaciones, importes, destinatarios y volúmenes? | P18 · T10 | Sí ◆ | Sí | Sí |
| ☐ | G4.17 | [AG] ¿Cada acción queda vinculada a su instrucción y finalidad, y las sensibles se contrastan antes de ejecutarse? | P18 · T10 | Sí ◆ | Sí | Sí |
| ☐ | G4.18 | [AG] ¿Hay interruptor de parada que detiene al agente y revoca credenciales, con responsable y prueba prevista? | P18 · P19 | Sí ◆ | Sí | Sí |
| ☐ | G4.19 | [AG] ¿Las acciones sensibles o irreversibles exigen validación humana previa según la autonomía? | P17 | Sí ◆ | Sí | Sí |
| ☐ | G4.20 | [GEN] ¿Hay defensas frente a inyección de instrucciones y fuga de información? | P18 · T10 | Sí ◆ | Sí | Sí |
| ☐ | G4.21 | [GEN] ¿El conjunto de evaluación y sus umbrales están aprobados antes de construir? | P22 | Cond. | Simpl. | Sí |
| ☐ | G4.22 | [TER] ¿Las cláusulas de G3.21 están en el contrato o borrador y la integración documentada? | P14 · P15 | Cond. | Sí | Sí |

## 8. LV-G5 · Puesta en producción

Verifica: oficina de IA (Lite) · auditor de IA (Enterprise). Decide: patrocinador con conformidad de riesgos (Lite) · comité de IA tras firma multinivel (Enterprise).

| ☐ | Código | Pregunta | Dónde mirar | Tipo | L | E |
|---|---|---|---|---|---|---|
| ☐ | G5.01 | ¿El informe de entrega recoge lo construido y las desviaciones aprobadas respecto a G4? | P21 | Cond. | Simpl. | Sí |
| ☐ | G5.02 | ¿Las pruebas funcionales y de rendimiento cumplen los criterios de aceptación? | P22 | Sí | Sí | Sí |
| ☐ | G5.03 | Si afecta a personas, ¿las pruebas de sesgo están dentro de umbrales? | P22 | Sí ◆ | Sí | Sí |
| ☐ | G5.04 | ¿Las pruebas de robustez y seguridad no dejan vulnerabilidades críticas o altas abiertas? | P22 | Sí ◆ | Simpl. | Sí |
| ☐ | G5.05 | [GEN] ¿Las evaluaciones alcanzan umbrales y se superaron las pruebas de inyección y de fuga? | P22 · T10 | Sí ◆ | Sí | Sí |
| ☐ | G5.06 | [AG] ¿Las pruebas demuestran que límites, control de intención e interruptor de parada funcionan? | P22 · P19 · T10 | Sí ◆ | Sí | Sí |
| ☐ | G5.07 | [AG] ¿El nivel de autonomía autorizado es el que se probó? | P18 · P23 | Sí ◆ | Sí | Sí |
| ☐ | G5.08 | ¿El piloto, con el método de atribución aprobado, alcanza el umbral según la ambición o con condiciones aceptadas? | P22 · T11 | Cond. | Sí | Sí |
| ☐ | G5.09 | ¿No se ha alcanzado ningún criterio de parada, o hay decisión expresa del órgano que autorizó? | P22 · P29 | Sí | Sí | Sí |
| ☐ | G5.10 | ¿Hay plan con responsable y fecha para materializar o reasignar la capacidad liberada? | P20 | Cond. | Sí | Sí |
| ☐ | G5.11 | ¿Se probó la reversión y el tiempo real cumple el objetivo? | P19 | Sí | Sí | Sí |
| ☐ | G5.12 | ¿El registro de riesgos incorpora los resultados de las pruebas y las aceptaciones al nivel correcto? | P12 · T06 | Sí ◆ | Sí | Sí |
| ☐ | G5.13 | ¿Los controles críticos están activos y comprobados en producción? | P22 · P25 | Sí ◆ | Sí | Sí |
| ☐ | G5.14 | ¿Quienes supervisan están designados, formados y con autoridad y medios para intervenir? | P17 · P20 | Sí ◆ | Sí | Sí |
| ☐ | G5.15 | ¿Están cumplidas las obligaciones regulatorias previas a la puesta en servicio según el rol? | P11 | Sí ◆ | Sí | Sí |
| ☐ | G5.16 | ¿La monitorización y las alertas están configuradas y probadas? | P25 | Sí | Simpl. | Sí |
| ☐ | G5.17 | ¿El plan de incidentes define S1–S4, escalado y notificaciones regulatorias con plazos? | P26 · T08 | Sí ◆ | Simpl. | Sí |
| ☐ | G5.18 | ¿El manual de operación está aceptado por el responsable de operación? | P24 | Cond. | Simpl. | Sí |
| ☐ | G5.19 | ¿Hay evidencia de formación de usuarios y alfabetización en IA de quien usa o supervisa? | P20 | Cond. | Sí | Sí |
| ☐ | G5.20 | [TER] ¿El contrato está firmado con las cláusulas exigidas y el proveedor registrado? | P14 · T09 | Sí ◆ | Sí | Sí |
| ☐ | G5.21 | ¿El seguimiento de valor está configurado y los resultados del piloto tienen estado? | P28 · T12 | Cond. | Simpl. | Sí |
| ☐ | G5.22 | ¿Las condiciones anteriores están cerradas o, si no son críticas, en plazo? | P29 · T03 | Sí | Sí | Sí |
| ☐ | G5.23 | ¿Consta la conformidad de riesgos (Lite) o las cuatro firmas sin veto vigente (Enterprise)? | P23 · T03 | Sí ◆ | Sí | Sí |

**Firma multinivel (Enterprise).** Antes de marcar G5.23, comprobar para cada firmante (técnico, riesgos y cumplimiento, seguridad de la información, protección de datos): ☐ firma registrada con fecha y versión del sistema · ☐ sentido (favorable, con reservas o veto) · ☐ ningún firmante participó en la construcción · ☐ los vetos anteriores están levantados por quien los emitió (21 §9.2).

## 9. LV-R6 · Revisión de continuidad

Verifica: oficina de IA (Lite) · auditor de IA (Enterprise). Decide: patrocinador (Lite) · comité de IA (Enterprise). Periodicidad: semestral (Lite) · trimestral (Enterprise). Resultados (01 §7.3): Continuar la operación · Continuar con condiciones · Adelantar G7.

| ☐ | Código | Pregunta | Dónde mirar | Tipo | L | E |
|---|---|---|---|---|---|---|
| ☐ | R6.01 | ¿La revisión se hace dentro de su periodicidad? | T01 · P29 anterior | Sí | Sí | Sí |
| ☐ | R6.02 | ¿El valor realizado se compara con la hipótesis, con estado y proporción validada? | P28 · T12 | Sí | Simpl. | Sí |
| ☐ | R6.03 | ¿Se explican las desviaciones entre costes reales y estimados? | P28 · T13 | Cond. | Simpl. | Sí |
| ☐ | R6.04 | ¿El rendimiento está en umbrales y los cambios de modelo están registrados? | P25 · P27 | Cond. | Sí | Sí |
| ☐ | R6.05 | Si afecta a personas, ¿el sesgo monitorizado está en umbrales? | P25 | Sí ◆ | Sí | Sí |
| ☐ | R6.06 | ¿Los incidentes tienen severidad, contención y cierre, y los notificables se notificaron en plazo? | P27 · T08 | Sí ◆ | Sí | Sí |
| ☐ | R6.07 | ¿Los cambios significativos se evaluaron y pasaron por G4 y G5 cuando procedía? | P27 · P29 | Sí | Sí | Sí |
| ☐ | R6.08 | ¿Siguen vigentes la clasificación regulatoria, las evaluaciones de impacto y la intensidad? | P11 · P04 | Sí ◆ | Sí | Sí |
| ☐ | R6.09 | ¿El registro de riesgos está al día y los riesgos nuevos aceptados al nivel correcto? | P12 · T06 | Cond. | Simpl. | Sí |
| ☐ | R6.10 | ¿Hay evidencia de supervisión humana ejercida, registros conservados y mecanismo de parada disponible? | P25 · P17 · registros | Sí ◆ | Sí | Sí |
| ☐ | R6.11 | [AG] ¿Se revisaron permisos, credenciales, registros de intención y acciones anómalas, y se probó el interruptor? | P18 · P27 · T10 | Sí ◆ | Sí | Sí |
| ☐ | R6.12 | [TER] ¿Se revisaron cambios, incidentes y cumplimiento contractual del proveedor? | P14 · T09 | Cond. | Simpl. | Sí |
| ☐ | R6.13 | ¿Se realiza la vigilancia posterior a la comercialización exigida? | P25 · P11 | Sí ◆ | — | Sí |
| ☐ | R6.14 | ¿La adopción se mide frente al objetivo? (Optimizar: recomendado) | P20 · P28 | Cond. | Sí | Sí |
| ☐ | R6.15 | ¿Las condiciones y no conformidades abiertas están en plazo? | P29 · T08 | Sí | Sí | Sí |
| ☐ | R6.16 | ¿Consta la evaluación de desviaciones que obligan a adelantar G7 (21 §6.7)? | P29 | Sí | Sí | Sí |

## 10. LV-G7 · Escalado o retirada

Verifica: oficina de IA (Lite) · auditor de IA (Enterprise). Decide: patrocinador (Lite) · comité de IA (Enterprise) · consejo para escalar en Transformar. Marcar *No aplica* los ítems del resultado no propuesto. Mantener el sistema sin cambios se verifica como *Iterar* con vuelta a la fase 6 (21 §5.3).

| ☐ | Código | Pregunta | Dónde mirar | Tipo | L | E |
|---|---|---|---|---|---|---|
| ☐ | G7.01 | ¿El valor realizado está consolidado con estado y, para escalar, validado según la ambición? | P28 · T12 | Sí | Sí | Sí |
| ☐ | G7.02 | ¿Hay conclusión explícita sobre la hipótesis frente al umbral y los criterios de parada? | P30 | Sí | Sí | Sí |
| ☐ | G7.03 | ¿Se revisó la ambición real y se registraron las diferencias con la declarada? | P07 · T05 | Sí | Sí | Sí |
| ☐ | G7.04 | ¿Se evaluaron riesgos acumulados, incidentes y no conformidades del periodo? | P12 · P27 | Sí | Simpl. | Sí |
| ☐ | G7.05 | ¿Constan costes reales, neto anual real y, si se escala, neto adicional por euro? | P28 · P30 | Cond. | Simpl. | Sí |
| ☐ | G7.06 | ¿Están registradas las lecciones aprendidas? | P30 | Cond. | Simpl. | Sí |
| ☐ | G7.07 | Escalar: ¿están descritos alcance, inversión y riesgos nuevos, con nueva fase 0 prevista? | P30 | Sí | Sí | Sí |
| ☐ | G7.08 | Escalar: ¿no hay incidentes S1 o S2 abiertos y la operación soporta el nuevo volumen? | P24 · P27 | Cond. | Sí | Sí |
| ☐ | G7.09 | Escalar en Transformar: ¿consta la aprobación expresa del consejo? | P29 · acta | Sí | — | Sí |
| ☐ | G7.10 | Iterar: ¿están definidos la fase de retorno, el motivo y el plazo? | P30 | Sí | Sí | Sí |
| ☐ | G7.11 | Retirar: ¿el plan recoge fecha, motivo codificado, órgano, sustituto, datos y modelos, accesos, comunicación e inventario? | P30 · T22 | Sí ◆ | Sí | Sí |
| ☐ | G7.12 | [TER] Retirar: ¿se prevé devolución o borrado certificado de datos y baja de accesos del proveedor? | P14 · P30 | Sí ◆ | Sí | Sí |

---

## 11. LV-EV · Validación de evidencias

Se aplica a **cada evidencia** enlazada en la solicitud del *gate*, antes de revisar la lista de la puerta. Desarrolla 21 §4. Aplica igual en Lite y Enterprise, salvo EV.10, que en Lite exige solo los campos no marcados *(Enterprise)*.

| ☐ | Código | Pregunta | Dónde mirar | Si la respuesta es no |
|---|---|---|---|---|
| ☐ | EV.01 | ¿La evidencia identifica la iniciativa, la plantilla o registro de origen y el título? | Portada de la evidencia | Pendiente |
| ☐ | EV.02 | ¿Consta el autor con su rol? | Ficha de la evidencia | Pendiente |
| ☐ | EV.03 | ¿Constan la fecha de elaboración y la de última modificación? | Ficha · historial del repositorio | Pendiente |
| ☐ | EV.04 | ¿La versión enlazada en la solicitud es la versión revisada? | T03 · repositorio | Pendiente |
| ☐ | EV.05 | ¿La fecha es anterior a la solicitud del *gate* y la actividad descrita anterior a la decisión? | Historial del repositorio · eventos de T01 | No válida · no conformidad mayor |
| ☐ | EV.06 | ¿Está en el repositorio con historial de versiones y enlace accesible desde T01 o T03? | Repositorio · T03 | Pendiente |
| ☐ | EV.07 | ¿Corresponde a esta iniciativa, su alcance y la versión del sistema, o se justifica su reutilización? | Contenido · P15 (versión) | No válida |
| ☐ | EV.08 | Si acredita resultados, ¿tiene fuente, periodo, método reproducible y, en importes, fórmula y estado? | Contenido · T11 · T12 | No válida |
| ☐ | EV.09 | ¿Está aprobada por quien corresponde, y autor, verificador y decisor son personas distintas? | Ficha · P03 · P29 | No válida · no conformidad mayor si hay autoaprobación |
| ☐ | EV.10 | ¿Están completos los campos obligatorios, con "sin dato" explícito donde falte información? | Plantilla | Pendiente |
| ☐ | EV.11 | ¿Sus cifras y afirmaciones coinciden con las de las demás evidencias? | P08 · P10 · P12 · P18 · P28 | No cumple hasta aclarar |
| ☐ | EV.12 | ¿Evita datos personales innecesarios y tiene el acceso restringido que corresponde? | Contenido · permisos del repositorio | Observación o no conformidad |
| ☐ | EV.13 | Si la generó un sistema, ¿es una exportación fechada o un enlace con marca temporal? | Registros · paneles · resultados de pruebas | No válida |
| ☐ | EV.14 | Si procede de un tercero, ¿tiene emisor identificable, vigencia y alcance que cubre el servicio? | P14 · documentación del proveedor | No válida |

Una evidencia con EV.05 o EV.09 en *no* no puede usarse para ningún criterio. Con carencias en EV.01–EV.04, EV.06 o EV.10 puede aceptarse solo si no sostiene un criterio *Sí* o *Sí ◆* y se corrige antes de la decisión (21 §4.2).

---

## 12. LV-AG · Agentes

Reúne los controles para sistemas que ejecutan acciones o las preparan para validación humana. Es el contenido de la herramienta T10 (evaluación de seguridad de agentes) y complementa, sin sustituir, las listas de cada puerta. Aplica igual en Lite y Enterprise; las columnas indican qué exige cada nivel de autonomía (21 §8.2): **Sí** obligatorio · **Rec.** recomendado · **—** no aplica. Varios ítems pueden remitir al mismo criterio.

| ☐ | Código | Pregunta | Dónde mirar | Puerta | A1 | A2 | A3 |
|---|---|---|---|---|---|---|---|
| | | **Riesgo y autonomía** | | | | | |
| ☐ | G3.17 | ¿Están valorados en el registro de riesgos los riesgos RT-GEN y RT-SEG del agente? | P12 · T06 | G3 | Sí | Sí | Sí |
| ☐ | G3.18 | ¿El nivel de autonomía está aprobado y la intensidad es coherente con él? | P04 · P12 | G3 | Sí | Sí | Sí |
| ☐ | G5.07 | ¿El nivel de autonomía configurado en producción es el probado y aprobado en G5? | P23 · configuración del agente | G5 | Sí | Sí | Sí |
| | | **Identidad** | | | | | |
| ☐ | G4.15 | ¿El agente tiene identidad técnica propia, no compartida con personas ni con otros agentes? | P18 · directorio de identidades | G4 | Sí | Sí | Sí |
| ☐ | G4.15 | ¿Las credenciales están en un gestor de secretos, se rotan y pueden revocarse de inmediato? | P18 · gestor de secretos | G4 | Sí | Sí | Sí |
| ☐ | G4.15 | ¿Consta un responsable humano del agente en el inventario? | P05 · T02 | G4 | Sí | Sí | Sí |
| | | **Permisos y límites** | | | | | |
| ☐ | G4.16 | ¿Los permisos reales en los sistemas coinciden con los mínimos aprobados? (comprobar la configuración, no solo el documento) | P18 · configuración de accesos | G4, G5 | Sí | Sí | Sí |
| ☐ | G4.16 | ¿Hay límites cuantitativos (importes, volúmenes, destinatarios, frecuencia) que bloquean las acciones que los superan? | P18 | G4 | — | Sí | Sí |
| ☐ | G5.06 | ¿Las pruebas demuestran que los límites bloquean acciones no autorizadas? | P22 | G5 | — | Sí | Sí |
| | | **Control de intención** | | | | | |
| ☐ | G4.17 | ¿Cada acción registra la instrucción, el objetivo y el usuario o proceso que la origina? | P18 · registros | G4 | Rec. | Sí | Sí |
| ☐ | G4.17 | ¿Las acciones sensibles se contrastan con la finalidad autorizada y se bloquean si no coinciden? | P18 · P22 | G4, G5 | Rec. | Sí | Sí |
| | | **Validación humana** | | | | | |
| ☐ | G4.19 | ¿Están enumeradas las acciones que requieren validación previa (A1: todas; A2: sensibles o irreversibles; A3: fuera de límites) y el sistema no puede ejecutarlas sin ella? | P17 · P22 | G4, G5 | Sí | Sí | Sí |
| | | **Interruptor de parada** | | | | | |
| ☐ | G4.18 | ¿Hay interruptor de parada documentado con responsable, sustituto y tiempo objetivo? | P18 · P19 | G4 | Rec. | Sí | Sí |
| ☐ | G5.06 | ¿Se probó que el interruptor detiene al agente y revoca credenciales dentro del tiempo objetivo? | P22 · P19 | G5 | Rec. | Sí | Sí |
| ☐ | R6.11 | ¿Se ha probado el interruptor en el periodo de revisión? | P27 · registro de pruebas | R6 | — | Rec. | Sí |
| | | **Inyección de instrucciones y fuga de información** | | | | | |
| ☐ | G4.20 | ¿El contenido externo (documentos, correos, web, respuestas de herramientas) se trata como no confiable y no puede alterar instrucciones ni permisos? | P18 | G4 | Sí | Sí | Sí |
| ☐ | G5.05 | ¿Se superaron pruebas de inyección directa e indirecta dentro de umbral? | P22 · T10 | G5 | Sí | Sí | Sí |
| ☐ | G5.05 | ¿Se superaron pruebas de fuga de datos personales, secretos e instrucciones del sistema? | P22 · T10 | G5 | Sí | Sí | Sí |
| | | **Operación** | | | | | |
| ☐ | R6.11 | ¿Se revisan las acciones bloqueadas, anómalas o fuera de patrón y se actúa sobre ellas? | P27 · registros | R6 | Rec. | Sí | Sí |
| ☐ | R6.11 | ¿Se revisaron permisos y credenciales en el periodo y se retiraron los que sobran? | P18 · configuración de accesos | R6 | Sí | Sí | Sí |
| | | **Retirada** | | | | | |
| ☐ | G7.11 | ¿Al retirar el agente se revocan identidad, credenciales y permisos y se conservan los registros el periodo definido? | P30 · T22 | G7 | Sí | Sí | Sí |

Un ítem obligatorio sin marcar en LV-AG equivale a *No cumple* en el criterio al que remite, con los efectos de 2.4.

---

## 13. Herramientas y plantillas asociadas

| Código | Nombre | Uso |
|---|---|---|
| **T03** | Gestor de *gates* | Carga las listas, registra el estado de cada ítem, calcula el grado de cumplimiento y aplica la regla de bloqueo. |
| **T10** | Evaluación de seguridad de agentes | Implementa LV-AG dentro de T03. |
| **T01 · T08** | Registro de iniciativas · No conformidades e incidentes | Eventos para comprobar la anterioridad; registro de hallazgos. |
| **P29** | Registro de decisión de *gate* | Recoge el resultado de las listas y la opinión de verificación. |
| **P23** | Firma de puesta en producción | Comprobación de firmas de LV-G5. |
| **P01–P31** | Plantillas del bloque H | Dónde mirar cada evidencia. |

---

## 14. Documentos relacionados

| Documento | Relación |
|---|---|
| **01 · Metodología fundacional** | Puertas, reglas de decisión, roles e intensidad. |
| **03 · Herramientas y registro de iniciativas** | Estados de los criterios y herramientas T03 y T10. |
| **21 · Criterios de *gate* y de auditoría** | Criterios, reglas de evidencia, firma multinivel y criterios de auditoría a los que remiten todos los códigos. |
| **35 · Seguridad de IA y agentes** | Controles de agentes que desarrolla LV-AG. |
| **37 · No conformidades e incidentes** | Tratamiento de los hallazgos. |
| **38 · Marco de auditoría de IA** | Plan de auditoría y muestreo. |

---

## 15. Control de versiones

| Versión | Fecha | Cambios |
|---|---|---|
| 0.1 | 16-09-2026 | Primera versión. Sustituye a las listas de verificación del material anterior: 128 controles binarios en ocho listas por puerta con los códigos del documento 21, lista LV-EV de validación de evidencias (14 controles), lista LV-AG para agentes alineada con T10 (21 controles) e instrucciones para el verificador y el auditor. Ajustes de coherencia con 01 (separación de funciones en Lite, resultados de R6, criterio de agentes) y con 34 y 37. |
