# Casos de aplicación

**Ocho compañías ficticias recorren el ciclo corporativo y el ciclo de vida de sus iniciativas**

| | |
|---|---|
| Documento | Documento 92 · Casos de aplicación |
| Versión | 0.1 (borrador de trabajo) |
| Fecha | 16-09-2026 |
| Autor | Fernando García Varela |
| Estado | Borrador para revisión. Todos los casos, compañías, personas y cifras son ficticios. |

<!-- cifras: 8 | casos ficticios ; 21 | iniciativas con recorrido de gates ; 7 | paradas fundamentadas ; 5 | retiradas registradas -->

---

> **Aviso legal y exención de responsabilidad.** SEVEN-G es un marco metodológico de referencia que se ofrece «tal cual» y con fines exclusivamente informativos. No constituye asesoramiento jurídico, regulatorio, financiero ni profesional, ni garantiza el cumplimiento de ninguna norma. Las referencias a regulación general (como el Reglamento Europeo de IA, el RGPD, DORA o NIS2), a normas técnicas y a regulación específica de cada sector o jurisdicción pueden ser incompletas, no aplicar a un caso concreto o quedar desactualizadas por cambios normativos, interpretaciones o criterios de las autoridades posteriores a su fecha de consulta. **Cada organización que use SEVEN-G es la única responsable de identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio**, con el asesoramiento cualificado que corresponda. El autor no asume responsabilidad alguna por el uso que se haga de este contenido ni por las decisiones que se adopten con él. Los datos, cifras, compañías y casos de los ejemplos son ficticios o ilustrativos.

> **AVISO: TODO EL CONTENIDO DE ESTE DOCUMENTO ES FICTICIO.**
> Las compañías, sus órganos, personas, sistemas, iniciativas, decisiones, fechas y cifras son **inventados** para ilustrar cómo se aplica SEVEN-G. No describen a ninguna organización real, no proceden de trabajos con clientes y **no son referencias de mercado, benchmarks ni resultados esperables**. Los casos son coherentes con los sectores de las demostraciones del panel del consejo (energía, logística, sanidad, retail, sector público, agroalimentación, hospitality e industria), pero no reproducen sus datos. Cualquier parecido con una organización real es casual.

---

<!-- esencial: consulta | Casos de aplicación ficticios, de compañías grandes y medianas, con iniciativas Lite y Enterprise. Se leen como ejemplo; no crean reglas. -->

## 1. Objeto y alcance

Este documento muestra, con ocho casos ficticios, cómo se aplican en la práctica las piezas de SEVEN-G: diagnóstico de madurez, índice de transformación, decisiones del consejo, recorrido de las iniciativas por sus *gates*, medición del valor con fórmulas y estados, paradas y retiradas.

Se usa para:

- Formar a consejos, comités de IA y oficinas de IA.
- Explicar el marco con ejemplos completos y verificables en sus cálculos.
- Preparar talleres (sección 11).

Convenciones de los casos:

- **Periodo ficticio:** 2027–2028. Los trimestres se indican como 1T27, 2T27…
- **Códigos:** cada compañía tiene su propia numeración (IA-AAAA-NNN, DEC-AAAA-NNN, REC-AAAA-NNN, INC-AAAA-NNN, NC-AAAA-NNN); los códigos no se relacionan entre casos.
- **Madurez:** nivel global = media de las siete dimensiones redondeada hacia abajo y limitada al nivel más bajo de D1 o D6 más uno (especificación común §5.2), con pesos iguales.
- **Índice de transformación:** ocho señales puntuadas de 0 a 3; los umbrales del documento 12 están pendientes de calibrar, por lo que las puntuaciones son ilustrativas.
- **Valor:** neto anual = eficiencias + retorno − coste recurrente; la capacidad liberada no materializada se informa aparte y no suma.

---

## 2. Resumen de los casos

| Caso | Compañía ficticia | Madurez global inicial | Perfil inicial | Iniciativas del caso | Resultados de *gate* destacados |
|---|---|---|---|---|---|
| **1** | Grupo energético E | 2 | Eficiencia táctica | 3 | Escalar · Parar en G3 (Transformar) · Retirar |
| **2** | Operador logístico L | 2 | Eficiencia a escala | 3 | Escalar · Parar en G5 (Transformar) · Iterar en G3 |
| **3** | Grupo hospitalario H | 2 | Transformación declarada, no evidenciada | 3 | Iterar en G7 · Retirar por sesgo · Parar en G3 por regulación |
| **4** | Grupo de distribución R | 3 | Transformación en curso | 3 | Escalar (Transformar) · Parar en G3 por datos · Retirar |
| **5** | Administración territorial P | 1 | Exploración dispersa | 3 | Retirar tras no conformidad crítica · Continuar · Parar en G3 |
| **6** | Cooperativa agroalimentaria A | 1 | Eficiencia operativa y logística | 2 | Continuar · Parar en G5 por datos insuficientes |
| **7** | Grupo hotelero regional T | 2 | Mejora de experiencia y operación | 2 | Continuar · Iterar en G3 |
| **8** | Fabricante industrial M | 3 | Mejora de servicio y prevención | 2 | Escalar · Parar en G5 por riesgo de cumplimiento |

---

## 3. Caso 1 · Grupo energético E (ficticio)

### 3.1 Situación inicial

Grupo ficticio con distribución eléctrica, generación renovable, comercializadora y servicios de campo. Usa IA desde hace años en la operación de la red, con buenos equipos técnicos. El consejo recibe cada año una lista de proyectos con un "valor generado" de 9,8 M€ que nadie ha validado. Al hacer el inventario aparecen 19 sistemas de IA, siete más de los que tenía registrados tecnología, dos de ellos embebidos en software de proveedores.

### 3.2 Diagnóstico (C1, 1T27)

| Dimensión | Nivel | Evidencia principal |
|---|---|---|
| D1 · Estrategia y gobierno | 2 | Comité de datos con actas, sin mandato sobre IA ni tesis aprobada. |
| D2 · Valor y cartera | 2 | Lista de proyectos con valor declarado por las áreas; sin priorización ni criterios de retirada. |
| D3 · Datos y conocimiento | 3 | Responsables de datos de red y de clientes nombrados; catálogo con linaje en los dominios principales. |
| D4 · Tecnología y operación | 3 | Plataforma común de modelos con monitorización de la degradación en la mayoría de los casos en producción. |
| D5 · Personas y adopción | 2 | Formación puntual; sin planes de adopción. |
| D6 · Riesgo, seguridad y cumplimiento | 2 | Ciberseguridad de la red de control sólida, pero sin inventario de IA completo ni clasificación regulatoria. |
| D7 · Medición y evidencia | 1 | Valor declarado sin línea base ni método de atribución. |

**Nivel global:** media 15 ÷ 7 = 2,14 → 2; límite: mínimo de D1 y D6 (2) + 1 = 3. **Nivel global 2.**

**Índice de transformación:** composición de la inversión 1 · composición del valor 1 · materialización 1 · profundidad del cambio 1 · modelo operativo 0 · ingresos habilitados 0 · paso a producción 1 · decisión del consejo 0. **Perfil: Eficiencia táctica.**

### 3.3 Decisiones del consejo

| Código | Órgano | Decisión |
|---|---|---|
| DEC-2027-002 | Pleno (C2, 2T27) | Tesis de IA: Optimizar en 04 Operaciones; Aumentar en 01 Cliente; explorar Transformar en 02 Producto y servicio con un límite por etapa. Apetito de riesgo: no se aceptan sistemas con actuación autónoma (A3) sobre la operación de la red o sobre el mercado sin aprobación expresa del consejo. Umbral de inversión para intensidad Enterprise: 300.000 €. |
| REC-2027-001 | Comisión delegada | Validar por control de gestión el valor de los cinco casos de mayor valor declarado antes del cierre del ejercicio. |
| DEC-2027-004 | Pleno (2T27) | Autorizar la etapa 1 de IA-2027-007 con límite de 250.000 €. |
| DEC-2027-009 | Pleno (3T27) | Tomar conocimiento de la parada de IA-2027-007 en G3. |

### 3.4 Iniciativas

**IA-2027-003 · Predicción de averías en transformadores.** Optimizar · Enterprise (función crítica) · Autonomía A1: el sistema recomienda qué transformadores sustituir y planificación decide.

| *Gate* | Momento | Resultado | Decide | Motivo |
|---|---|---|---|---|
| G0 | 1T27 | Continuar | Comité de IA | Encaje con la tesis; roles sin incompatibilidades. |
| G1 | 1T27 | Continuar | Patrocinador, informando al comité | Las averías no planificadas son el mayor coste evitable del mantenimiento. |
| G2 | 2T27 | Continuar | Comité de IA | Línea base medida: 118 averías no planificadas al año en la zona piloto; zona de control comparable. |
| G3 | 2T27 | Continuar | Comité de IA | Datos de telemetría suficientes; riesgo residual Medio. |
| G4 | 3T27 | Continuar | Comité de IA | Plan de reversión: volver al calendario de sustitución por antigüedad. |
| G5 | 4T27 | Continuar con condiciones | Comité de IA tras firma multinivel | Condición: medir doce meses frente a la zona de control (plazo 4T28; responsable: control de gestión). |
| R6 | Trimestral 2028 | Continuar | Comité de IA | Estable; sin incidentes. |
| G7 | 4T28 | **Escalar** | Comité de IA | Ahorro materializado y validado; nueva fase 0 para el resto de zonas. |

Valor tras doce meses en producción:

| Componente | Fórmula | Importe | Estado |
|---|---|---|---|
| Eficiencias | 36 averías evitadas (74 reales frente a 110 esperadas según la zona de control) × 31.000 € de diferencia entre avería no planificada y sustitución programada | 1.116.000 € | Validado por control de gestión |
| Coste recurrente | Licencias, cómputo y personas de operación | 210.000 € | Validado |
| **Neto anual** | 1.116.000 − 210.000 | **906.000 €** | Validado |
| Escalado | Neto adicional esperado 1.300.000 € ÷ inversión adicional 650.000 € | **2,0 € por euro** | Estimado |

**IA-2027-007 · Gestión autónoma de baterías con ofertas en el mercado eléctrico.** Transformar (nuevo servicio de flexibilidad) · Enterprise · Autonomía prevista A3.

| *Gate* | Momento | Resultado | Decide | Motivo |
|---|---|---|---|---|
| G0–G1 | 1T27 | Continuar | Comité de IA | Oportunidad alineada con la esfera 02. |
| G2 | 2T27 | Continuar | Comité de IA y **pleno** (DEC-2027-004) | Etapa 1 con límite de 250.000 €; criterio de parada: riesgo residual Crítico no aceptable dentro del apetito. |
| G3 | 3T27 | **Parar** | Comité de IA | Las órdenes ejecutadas en el mercado no se pueden revertir. Riesgo residual con controles: probabilidad 4 × impacto 4 = 16, **Crítico**, fuera del apetito aprobado. Motivo codificado: *Riesgo inaceptable*. |

Inversión consumida: 85.000 € de los 250.000 € de la etapa. La idea de optimizar la carga de baterías se registró como iniciativa distinta, IA-2027-014, de nivel Optimizar y autonomía A1 (el sistema recomienda y el operador decide), con otra hipótesis de valor y otro patrocinador.

**IA-2027-001 · Asistente conversacional de averías (versión 1).** Sistema en producción antes de adoptar el marco; regularizado con una revisión equivalente a G7 (01 §14).

| Dato | Valor |
|---|---|
| Conversaciones resueltas sin derivar a una persona | 18 % |
| Valor declarado por el área | 240.000 € de "llamadas evitadas", sin línea base (declarado) |
| Estimación de control de gestión con muestra | 9.500 llamadas evitadas × 4,20 € por llamada = 39.900 € (estimado) |
| Coste recurrente | 95.000 € (validado) |
| Neto anual con la estimación | 39.900 − 95.000 = **−55.100 €** |

| *Gate* | Momento | Resultado | Decide | Motivo |
|---|---|---|---|---|
| G7 | 2T27 | **Retirar** | Comité de IA | Motivo codificado: *Coste superior al valor*. Sustituto: reconocimiento del número de suministro en el canal telefónico (no es IA). Conversaciones conservadas según la política de retención y después suprimidas. Aviso en la web durante treinta días. |

### 3.5 Revisión anual (C5, 4T28)

| D1 | D2 | D3 | D4 | D5 | D6 | D7 | Media | Límite | Global |
|---|---|---|---|---|---|---|---|---|---|
| 3 | 3 | 3 | 3 | 2 | 3 | 3 | 20 ÷ 7 = 2,86 → 2 | 3 + 1 = 4 | **2** |

D1, D2 y D6 suben un nivel y D7 sube dos, pero el nivel global no cambia por la regla de redondeo hacia abajo: D5 sigue en 2. El perfil pasa a **Eficiencia a escala**: valor validado en los principales casos y ahorro materializado.

### 3.6 Lecciones

1. **Parar una apuesta de Transformar en G3 es un resultado del método.** Se consumieron 85.000 € y se evitó comprometer el resto; la parte viable siguió como otra iniciativa.
2. **Regularizar lo heredado revela valores negativos.** El asistente de averías solo parecía rentable porque su valor era declarado.
3. **El nivel global se lee junto a las dimensiones.** Un global que no se mueve puede esconder avances reales y una dimensión rezagada.

---

## 4. Caso 2 · Operador logístico L (ficticio)

### 4.1 Situación inicial

Operador ficticio con transporte por carretera, almacenes, reparto de última milla y aduanas. Tiene una cultura de eficiencia muy asentada: rutas, almacenes y mantenimiento de flota se miden con rigor. El consejo quiere saber si la IA puede abrir una línea de crecimiento, no solo reducir costes.

### 4.2 Diagnóstico (C1, 1T27)

| Dimensión | Nivel | Evidencia principal |
|---|---|---|
| D1 · Estrategia y gobierno | 3 | Comité de operaciones digitales con mandato y actas; cartera aprobada. |
| D2 · Valor y cartera | 3 | Casos priorizados con valor y coste; criterios de retirada documentados. |
| D3 · Datos y conocimiento | 2 | Datos de telemetría buenos; datos comerciales dispersos. |
| D4 · Tecnología y operación | 3 | Monitorización y planes de reversión en los sistemas de planificación. |
| D5 · Personas y adopción | 2 | Formación de planificadores; sin posición sobre el efecto en conductores. |
| D6 · Riesgo, seguridad y cumplimiento | 2 | Inventario completo; clasificación regulatoria pendiente en sistemas que afectan a empleados. |
| D7 · Medición y evidencia | 3 | Pilotos con centros de control; validación por control de gestión. |

**Nivel global:** media 18 ÷ 7 = 2,57 → 2; límite: mínimo de D1 y D6 (2) + 1 = 3. **Nivel global 2.** D6 condiciona el resultado.

**Índice de transformación:** 1 · 1 · 2 · 2 · 1 · 0 · 1 · 1. **Perfil: Eficiencia a escala.**

### 4.3 Decisiones del consejo

| Código | Órgano | Decisión |
|---|---|---|
| DEC-2027-011 | Pleno (C2, 2T27) | Tesis: Optimizar en 04 Operaciones; Transformar en 02 Producto y servicio con un servicio de contratación de capacidad de transporte. Apetito: agentes con actuación supervisada (A2) con límite económico por operación aprobado por el comité; sin A3 en operaciones con dinero de terceros. |
| REC-2027-012 | Pleno | Presentar la posición de la compañía sobre el uso de telemetría para evaluar a conductores antes de ampliar cualquier sistema que lo haga. |
| DEC-2027-015 | Pleno (2T27) | Autorizar la etapa 1 de IA-2027-015 con límite de 180.000 € y criterios de parada. |
| DEC-2028-003 | Pleno (1T28) | Tomar conocimiento de la parada de IA-2027-015; no relajar los criterios de parada. |

### 4.4 Iniciativas

**IA-2027-012 · Optimización de rutas de última milla.** Optimizar · Lite · Autonomía A1.

| *Gate* | Momento | Resultado | Decide | Motivo |
|---|---|---|---|---|
| G0–G2 (agrupados) | 1T27 | Continuar | Patrocinador | Línea base de kilómetros y horas en dos centros piloto y dos de control. |
| G3 | 1T27 | Continuar | Patrocinador con conformidad de riesgos | Riesgo residual Bajo. |
| G4–G5 (agrupados) | 3T27 | Continuar | Patrocinador con conformidad de riesgos | Piloto supera el umbral; reversión probada al plan manual. |
| R6 | 1T28 | Continuar | Patrocinador | Estable. |
| G7 | 3T28 | **Escalar** | Patrocinador | Nueva fase 0 para seis centros más. |

Valor tras doce meses:

| Componente | Fórmula | Importe | Estado |
|---|---|---|---|
| Eficiencias (kilómetros) | 610.000 km evitados × 0,62 € por km | 378.200 € | Validado |
| Eficiencias (horas materializadas) | 6.200 h menos de horas extra y subcontratación × 24 € por hora | 148.800 € | Declarado por operaciones; validación prevista |
| Capacidad liberada no materializada | 17.500 h liberadas − 6.200 h materializadas | 11.300 h | Informada aparte; **no suma** |
| Coste recurrente | Licencias, cómputo y soporte | 120.000 € | Validado |
| **Neto anual** | 378.200 + 148.800 − 120.000 | **407.000 €** | Proporción validada: 378.200 ÷ 527.000 = 71,8 % |
| Escalado | Neto adicional esperado 1.100.000 € ÷ inversión adicional 280.000 € | **3,9 € por euro** | Estimado |

**IA-2027-015 · Agente de contratación de cargas en bolsas de transporte.** Transformar (nuevo servicio de capacidad bajo demanda para clientes) · Enterprise · Autonomía A2 con límite de 2.500 € por carga; por encima, decide una persona.

| *Gate* | Momento | Resultado | Decide | Motivo |
|---|---|---|---|---|
| G0–G1 | 1T27 | Continuar | Comité de IA | Encaje con la tesis. |
| G2 | 2T27 | Continuar | Comité de IA y **pleno** (DEC-2027-015) | Hito de aprendizaje: 400 cargas. Criterios de parada: mejora del margen por carga inferior a 1,0 punto frente al grupo de control, o más del 2 % de cargas con errores en las condiciones. |
| G3 | 2T27 | Continuar con condiciones | Comité de IA | Condición no crítica: acuerdos firmados con dos bolsas de carga antes de G5. |
| G4 | 3T27 | Continuar | Comité de IA | Límite por carga, registro de acciones e interruptor de parada diseñados. |
| G5 | 1T28 | **Parar** | Comité de IA | Piloto con asignación aleatoria: 520 cargas con el agente y 510 de control. Mejora del margen: 0,6 puntos (por debajo de 1,0). Errores: 0,8 %. Motivo codificado: *Hipótesis refutada*. |

Retorno medido en el piloto: 520 cargas × 1.900 € de ingreso medio × 0,6 % = 5.928 € (validado). Inversión consumida: 165.000 €. El equipo pidió una iteración más con un umbral de 0,5 puntos; el comité lo elevó al pleno porque los criterios de parada solo puede relajarlos el órgano que autorizó la iniciativa (01 §7.4, regla 6), y el pleno decidió no relajarlos (DEC-2028-003).

**IA-2027-018 · Evaluación de conducción de riesgo con telemetría.** Aumentar · Enterprise (decisiones sobre personas) · Autonomía A1: recomienda formación, sin sanciones.

| *Gate* | Momento | Resultado | Decide | Motivo |
|---|---|---|---|---|
| G0–G2 | 2T27 | Continuar | Comité de IA | Línea base: 212 accidentes con daños propios al año en la flota piloto. |
| G3 | 3T27 | **Iterar** | Comité de IA | Faltaban la clasificación regulatoria con criterio jurídico (posible alto riesgo por evaluar a trabajadores), la evaluación de impacto en protección de datos y la información a la representación de los trabajadores. No se admite continuar con condiciones sobre cumplimiento legal. |
| G3 (2.ª) | 4T27 | Continuar | Comité de IA | Evaluaciones completas; posición aprobada en respuesta a REC-2027-012. |
| G4 | 1T28 | Continuar | Comité de IA | Sin sanciones automáticas; el jefe de tráfico decide. |
| G5 | 2T28 | Continuar | Comité de IA tras firma multinivel | Piloto con resultado dentro del umbral. |

Valor declarado a seis meses, anualizado: 29 accidentes menos × 3.400 € de coste medio de reparación = 98.600 € (declarado por flota); coste recurrente 80.000 € (validado); neto 18.600 € (declarado). Validación prevista a doce meses.

### 4.5 Lecciones

1. **Los criterios de parada fijados antes protegen al consejo de su propio entusiasmo.** La apuesta de crecimiento se paró con 165.000 € y un aprendizaje documentado.
2. **Una compañía eficiente no necesita parecer transformadora.** Eficiencia a escala es un buen perfil; la transformación se intenta de forma consciente y con límites.
3. **Iterar en G3 es más rápido que corregir en producción.** Un trimestre de iteración evitó poner en marcha un sistema de evaluación de empleados sin sus evaluaciones.

---

## 5. Caso 3 · Grupo hospitalario H (ficticio)

### 5.1 Situación inicial

Grupo hospitalario privado ficticio con un hospital de referencia, una red de clínicas y un laboratorio. Su comunicación externa habla de un "hospital transformado por la IA". Tiene una cultura de seguridad del paciente y de cumplimiento muy fuerte, pero casi no mide el valor.

### 5.2 Diagnóstico (C1, 1T27)

| Dimensión | Nivel | Evidencia principal |
|---|---|---|
| D1 · Estrategia y gobierno | 3 | Comité de IA clínica con facultativos y ética; mandato aprobado. |
| D2 · Valor y cartera | 2 | Cartera sin valor en dinero ni criterios de retirada. |
| D3 · Datos y conocimiento | 3 | Gobierno del dato clínico con responsables y controles de acceso. |
| D4 · Tecnología y operación | 3 | Monitorización y reversión en los sistemas clínicos. |
| D5 · Personas y adopción | 3 | Planes de adopción con formación clínica. |
| D6 · Riesgo, seguridad y cumplimiento | 4 | Inventario completo, clasificación con criterio jurídico, evaluaciones de impacto y simulacros. |
| D7 · Medición y evidencia | 1 | Beneficios clínicos y económicos declarados, sin línea base ni grupo de control. |

**Nivel global:** media 19 ÷ 7 = 2,71 → 2; límite: mínimo de D1 y D6 (3) + 1 = 4. **Nivel global 2.**

**Índice de transformación:** composición de la inversión 1 · composición del valor **sin dato** (puntúa 0 y se muestra como sin dato) · materialización 0 · profundidad del cambio 1 · modelo operativo 1 · ingresos habilitados 0 · paso a producción 1 · decisión del consejo 0. **Perfil: Transformación declarada, no evidenciada.**

### 5.3 Decisiones del consejo

| Código | Órgano | Decisión |
|---|---|---|
| DEC-2027-021 | Pleno (C2, 2T27) | Tesis: Aumentar en 03 Personas y en 01 Cliente (paciente). No se aprueban apuestas de Transformar en diagnóstico clínico hasta que D7 alcance el nivel 3. La comunicación externa se ajusta a lo evidenciado. |
| REC-2027-020 | Comisión delegada | Medir con grupo de control el valor de la documentación clínica automática y validar las horas reasignadas. |
| REC-2027-022 | Comisión delegada | Muestreo semanal de notas generadas, revisadas por un segundo médico, con tasa de corrección informada al comité. |
| DEC-2027-025 | Pleno (3T27) | Autorizar la etapa 1 de IA-2027-026 con límite de 150.000 €, como excepción acotada a la tesis por no ser diagnóstico clínico. |

### 5.4 Iniciativas

**IA-2027-021 · Documentación clínica automática en consulta.** Aumentar · Enterprise (datos de salud) · Autonomía A0: el sistema redacta la nota; el médico la revisa y la firma. Clasificación regulatoria realizada con criterio jurídico.

| *Gate* | Momento | Resultado | Decide | Motivo |
|---|---|---|---|---|
| G0–G2 | 1T27 | Continuar | Comité de IA | Línea base: 7,5 minutos de documentación por consulta. |
| G3 | 2T27 | Continuar | Comité de IA | Evaluaciones de impacto completas; riesgo residual Medio. |
| G4 | 2T27 | Continuar | Comité de IA | Firma médica obligatoria; interruptor de parada que vuelve a la redacción manual. |
| G5 | 3T27 | Continuar con condiciones | Comité de IA tras firma multinivel | Condición no crítica: plan de reasignación de la capacidad aprobado por dirección médica en 90 días. |
| R6 | 4T27 | Continuar | Comité de IA | INC-2027-006 (S3): un borrador atribuía una medicación a otro paciente; detectado en la revisión antes de la firma. Acción: verificación de la identidad del paciente al iniciar la grabación. |
| G7 | 3T28 | **Iterar** | Comité de IA | No se escala sin retorno validado: vuelta a la fase 5 para medir con grupo de control en cuatro clínicas. |

Valor tras doce meses:

| Componente | Fórmula | Importe | Estado |
|---|---|---|---|
| Capacidad liberada | 3,4 minutos × 310.000 consultas = 17.567 h × 52 € | 913.484 € | **No suma** |
| Eficiencias | 2.100 h de horas extra de documentación eliminadas × 52 € | 109.200 € | Validado |
| Retorno | 6.400 h reasignadas × 4 consultas por hora × 22 € de margen de contribución | 563.200 € | Declarado por dirección médica; falta demostrar que las consultas son adicionales |
| Capacidad no materializada | 17.567 − 2.100 − 6.400 | 9.067 h | Informada aparte |
| Coste recurrente | Licencias, consumo de modelos, soporte y revisión | 480.000 € | Validado |
| **Neto anual** | 109.200 + 563.200 − 480.000 | **192.400 €** | Proporción validada: 109.200 ÷ 672.400 = 16,2 % |
| Neto solo con importes validados | 109.200 − 480.000 | **−370.800 €** | Validado |

**IA-2027-002 · Predicción de riesgo de reingreso (versión 1).** Sistema anterior a la adopción del marco · Enterprise · Autonomía A1.

| *Gate* | Momento | Resultado | Decide | Motivo |
|---|---|---|---|---|
| R6 | 2T27 | Adelanta G7 | Comité de IA | Primera prueba de sesgo: sensibilidad de 0,71 en el conjunto, pero de 0,52 en pacientes mayores de 80 años, el grupo con más reingresos. |
| G7 | 2T27 | **Retirar** | Comité de IA | Motivo codificado: *Riesgo inaceptable*. Sustituto temporal: seguimiento telefónico por criterio de enfermería. Modelo archivado sin posibilidad de reutilización. Comunicación a las unidades clínicas. Nueva iniciativa IA-2027-024 en fase 2 con la prueba de sesgo por edad como criterio de G5. |

El valor que se atribuía al sistema (1,4 M€ de reingresos evitados) nunca tuvo grupo de control y figuraba como declarado.

**IA-2027-026 · Orientación de síntomas para pacientes antes de la cita.** Transformar (nuevo servicio digital al paciente) · Enterprise · Exposición directa.

| *Gate* | Momento | Resultado | Decide | Motivo |
|---|---|---|---|---|
| G0–G1 | 2T27 | Continuar | Comité de IA | Demanda de pacientes identificada. |
| G2 | 3T27 | Continuar | Comité de IA y **pleno** (DEC-2027-025) | Etapa 1 con límite de 150.000 €. |
| G3 | 4T27 | **Parar** | Comité de IA | La asesoría jurídica concluyó que el servicio podría tener la consideración de producto sanitario, con una evaluación de la conformidad incompatible con el plazo y el límite de la etapa; además, riesgo residual Alto para la seguridad del paciente por derivaciones erróneas. Motivo codificado: *Regulación*. |

Inversión consumida: 40.000 €.

### 5.5 Lecciones

1. **Un cumplimiento excelente no sustituye a la medición.** D6 en nivel 4 y D7 en nivel 1 dan un nivel global 2 y un perfil que el consejo no esperaba.
2. **La capacidad liberada no es valor.** Con solo los importes validados, la documentación automática tiene un neto negativo; la reasignación de horas es la que decide si merece escalarse.
3. **La revisión de continuidad debe poder retirar.** El modelo de reingreso llevaba años en uso y solo una prueba de sesgo lo puso en cuestión.
4. **G3 es la principal puerta de parada.** La cuestión regulatoria se resolvió antes de construir.

---

## 6. Caso 4 · Grupo de distribución R (ficticio)

### 6.1 Situación inicial

Grupo ficticio de distribución alimentaria con supermercados, tienda online y logística propia. Lleva dos años con un gobierno de IA formal. El consejo quiere comprobar si su apuesta por un servicio nuevo está funcionando y dónde invertir el siguiente euro.

### 6.2 Diagnóstico (C1, 1T27)

| Dimensión | Nivel | Evidencia principal |
|---|---|---|
| D1 · Estrategia y gobierno | 3 | Tesis de IA aprobada; comité de IA con decisiones registradas. |
| D2 · Valor y cartera | 3 | Cartera priorizada con neto adicional por euro. |
| D3 · Datos y conocimiento | 3 | Datos de ventas y clientes gobernados; datos de compras incompletos. |
| D4 · Tecnología y operación | 3 | Monitorización, reversión y gestión de incidentes. |
| D5 · Personas y adopción | 3 | Planes de adopción en tiendas y centrales. |
| D6 · Riesgo, seguridad y cumplimiento | 3 | Inventario, clasificación y evaluaciones al día. |
| D7 · Medición y evidencia | 3 | Grupos de control en los principales casos. |

**Nivel global:** media 21 ÷ 7 = 3; límite: 3 + 1 = 4. **Nivel global 3.**

**Índice de transformación:** 2 · 2 · 2 · 2 · 2 · 2 · 2 · 3. **Perfil: Transformación en curso.**

### 6.3 Decisiones del consejo

| Código | Órgano | Decisión |
|---|---|---|
| DEC-2027-031 | Pleno (C2) | Tesis: Transformar en 02 Producto y servicio (cesta recurrente por suscripción); Optimizar en 04 Operaciones (reposición y merma); Aumentar en 03 Personas. Apetito: precios con mínimos por categoría y revisión humana de cambios superiores al 10 %. |
| DEC-2027-032 | Pleno (1T27) | Autorizar la etapa 1 de IA-2027-031 con límite de 600.000 €. |
| REC-2027-035 | Comisión delegada | Crear una iniciativa de datos para estructurar las condiciones de los acuerdos con proveedores antes de proponer nuevos agentes de compras. |
| DEC-2028-030 | Pleno (4T28) | Escalar IA-2027-031 a todas las regiones y ampliar la previsión de demanda de frescos, en ese orden de ejecución. |

### 6.4 Iniciativas

**IA-2027-031 · Cesta recurrente personalizada por suscripción.** Transformar · Enterprise · Autonomía A1: el sistema propone la cesta y el cliente la confirma.

| *Gate* | Momento | Resultado | Decide | Motivo |
|---|---|---|---|---|
| G2 | 1T27 | Continuar | Comité de IA y **pleno** (DEC-2027-032) | Hitos: 10.000 suscriptores activos a nueve meses; margen incremental ≥ 4 € por pedido frente al grupo de control. Parada: menos de 5.000 suscriptores o margen inferior a 2 €. |
| G3 | 2T27 | Continuar | Comité de IA | Riesgo residual Medio (protección de datos y personalización). |
| G4 | 2T27 | Continuar | Comité de IA | Grupo de control del 5 % de clientes diseñado. |
| G5 | 4T27 | Continuar | Comité de IA tras firma multinivel | Evidencia de mercado: 12.300 suscriptores activos a nueve meses. |
| R6 | Trimestral 2028 | Continuar | Comité de IA | Sin incidentes relevantes. |
| G7 | 4T28 | **Escalar** | Comité de IA y **pleno** (DEC-2028-030) | Retorno medido y validado. |

Valor en 2028:

| Componente | Fórmula | Importe | Estado |
|---|---|---|---|
| Retorno | 18.400 suscriptores activos medios × 11,2 pedidos al año × 6,10 € de margen incremental por pedido, descontada la canibalización frente al grupo de control | 1.257.088 € | Validado |
| Coste recurrente | Plataforma, consumo, personas de operación y atención | 390.000 € | Validado |
| **Neto anual** | 1.257.088 − 390.000 | **867.088 €** | Validado |
| Escalado | Neto adicional esperado 1.500.000 € ÷ inversión adicional 1.200.000 € | **1,25 € por euro** | Estimado |

La ampliación de la previsión de demanda de frescos (IA-2027-036) ofrecía 3,1 € por euro (estimado). El consejo aprobó ambas y ejecutar primero la de frescos: el neto adicional por euro ordena la ejecución, y la cesta recurrente se mantuvo por su papel en la tesis. La decisión y su motivo quedaron registrados.

**IA-2027-034 · Agente de renegociación con proveedores.** Aumentar · Enterprise · Autonomía A2 prevista: registraría condiciones en el sistema de compras.

| *Gate* | Momento | Resultado | Decide | Motivo |
|---|---|---|---|---|
| G0–G2 | 2T27 | Continuar | Comité de IA | Hipótesis de mejora de condiciones con línea base de las últimas negociaciones. |
| G3 | 3T27 | **Parar** | Comité de IA | Solo el 22 % de los acuerdos de los tres últimos años tiene condiciones estructuradas; el agente negociaría con un histórico incompleto. Riesgo residual Alto de acuerdos fuera de la política de compras. Motivo codificado: *Datos insuficientes*. |

Inversión consumida: 60.000 €. En respuesta a REC-2027-035 se registró IA-2027-039, de nivel Optimizar en la esfera 05, para estructurar las condiciones de los acuerdos.

**IA-2027-029 · Precio dinámico de frescos próximos a caducidad (versión 1).** Sistema anterior a la adopción · Optimizar · Enterprise en la regularización: cambia precios de venta sin revisión individual (autonomía A2).

| Dato | Valor |
|---|---|
| Merma evitada declarada por el área | 420.000 € (declarado) |
| Merma evitada medida con tiendas de control | 60.000 € (validado) |
| Coste recurrente | 230.000 € (validado) |
| Neto anual validado | 60.000 − 230.000 = **−170.000 €** |
| Reclamaciones de clientes por cambios de precio durante la compra | 1.150 en el año |

| *Gate* | Momento | Resultado | Decide | Motivo |
|---|---|---|---|---|
| R6 | 1T27 | Adelanta G7 | Comité de IA | Neto negativo y efecto reputacional. |
| G7 | 2T27 | **Retirar** | Comité de IA | Motivo codificado: *Coste superior al valor*. Sustituto: reglas fijas de rebaja por fecha de caducidad (no es IA). Etiquetas electrónicas reutilizadas. Aviso en tienda. |

### 6.5 Lecciones

1. **Transformar con hitos y grupo de control produce retorno defendible.** El escalado se aprobó sobre importes validados, no sobre promesas.
2. **El neto adicional por euro ordena, pero no sustituye a la tesis.** El consejo decidió conscientemente y dejó registrado el motivo.
3. **Los agregados esconden negativos.** El precio dinámico parecía rentable dentro del total de la cartera.
4. **Un agente sin datos es un riesgo, no una oportunidad.** La parada generó una iniciativa de datos.

---

## 7. Caso 5 · Administración territorial P (ficticia)

### 7.1 Situación inicial

Administración territorial ficticia con atención ciudadana, tributos, urbanismo y servicios sociales. En este caso, el papel del consejo lo asume su **órgano colegiado de gobierno**, y el del comité de IA, una comisión de transformación digital con el mandato ampliado. El inventario inicial encuentra once herramientas con IA; cuatro las habían contratado distintos servicios sin conocimiento del área de tecnología, entre ellas un asistente conversacional en la web.

### 7.2 Diagnóstico (C1, 2T27, primer mes de la implantación de 90 días)

| Dimensión | Nivel | Evidencia principal |
|---|---|---|
| D1 · Estrategia y gobierno | 1 | Iniciativas aisladas por servicio; sin órgano con mandato sobre IA. |
| D2 · Valor y cartera | 1 | Sin cartera. |
| D3 · Datos y conocimiento | 2 | Responsables de datos en tributos y padrón. |
| D4 · Tecnología y operación | 2 | Operación de sistemas propios estable; herramientas de proveedores sin control. |
| D5 · Personas y adopción | 1 | Sin formación en IA. |
| D6 · Riesgo, seguridad y cumplimiento | 1 | Sin inventario previo ni clasificación. |
| D7 · Medición y evidencia | 0 | Ningún valor medido. |

**Nivel global:** media 8 ÷ 7 = 1,14 → 1; límite: mínimo de D1 y D6 (1) + 1 = 2. **Nivel global 1.**

**Índice de transformación:** composición de la inversión **sin dato** · composición del valor **sin dato** · materialización 0 · profundidad del cambio 1 · modelo operativo 0 · ingresos habilitados 0 (señal a adaptar para el sector público en el documento 12) · paso a producción 0 · decisión del órgano de gobierno 0. **Perfil: Exploración dispersa.**

### 7.3 Decisiones del órgano de gobierno

| Código | Órgano | Decisión |
|---|---|---|
| DEC-2027-041 | Órgano de gobierno (tercer mes, 3T27) | Tesis: Optimizar en 04 Operaciones (tramitación). No se despliegan sistemas que influyan en decisiones sobre personas hasta que D6 alcance el nivel 3, salvo con evaluación de impacto y motivación individual comprensible. Comisión de transformación digital con funciones de comité de IA. |
| REC-2028-004 | Órgano de gobierno | Incluir en los pliegos de contratación de sistemas con IA la obligación del proveedor de permitir explicar los resultados a cada persona afectada y de facilitar pruebas de sesgo. |

### 7.4 Iniciativas

**IA-2027-040 · Asistente conversacional de la web (versión 0).** Contratado por un servicio y en producción sin *gate*.

| Momento | Hecho | Decide |
|---|---|---|
| 2T27 | **NC-2027-001, crítica**: sistema en producción sin *gate* aprobado y sin aviso de que se habla con una IA. Contención en 48 horas: aviso visible y limitación a información general sin datos personales. | Comisión de transformación digital; informada la comisión delegada |
| 2T27 | Muestra de 400 conversaciones: 9 % de respuestas incorrectas sobre plazos de trámites. Contrato sin cláusulas sobre el uso de los datos por el proveedor. | Oficina de IA |
| 3T27 · G7 | **Retirar.** Motivo codificado: *Riesgo inaceptable*. Sustituto: preguntas frecuentes revisadas. Conversaciones suprimidas según la política de retención. Coste recurrente evitado: 70.000 € al año. Nueva iniciativa IA-2027-047 en fase 1, por el ciclo completo. | Comisión de transformación digital |

**IA-2027-041 · Clasificación y reparto de escritos del registro.** Optimizar · Lite · Autonomía A1: propone el servicio competente y el personal del registro lo confirma; los escritos de baja confianza se revisan uno a uno.

| *Gate* | Momento | Resultado | Decide | Motivo |
|---|---|---|---|---|
| G0–G2 (agrupados) | 3T27 | Continuar | Patrocinador | Línea base: servicio externo de clasificación y 1,7 minutos de revisión interna por escrito. |
| G3 | 3T27 | Continuar | Patrocinador con conformidad de riesgos | Riesgo residual Medio: un error retrasa un procedimiento con plazos legales; control de baja confianza. |
| G4–G5 (agrupados) | 4T27 | Continuar | Patrocinador con conformidad de riesgos | Piloto con precisión dentro del umbral; reversión al reparto manual probada. |
| R6 | 2T28 | Continuar | Patrocinador | Estable. |

Valor tras doce meses:

| Componente | Fórmula | Importe | Estado |
|---|---|---|---|
| Eficiencias | Contrato externo de clasificación no renovado | 145.000 € | Validado por la intervención |
| Capacidad liberada | 210.000 escritos × 1,7 minutos = 5.950 h | — | Aparte; **no suma** |
| Capacidad reasignada | 4.000 h asignadas expresamente a la tramitación de licencias | — | Aparte; efecto en plazos no cuantificado en dinero |
| Capacidad no materializada | 5.950 − 4.000 | 1.950 h | Aparte |
| Mejora del servicio | Plazo medio hasta el servicio competente: de 3,1 a 0,4 días | No cuantificado | Se indica que no se ha podido traducir a dinero (regla 7) |
| Coste recurrente | Licencia y soporte | 60.000 € | Validado |
| **Neto anual** | 145.000 − 60.000 | **85.000 €** | Validado |

**IA-2027-043 · Emparejamiento de demandantes y ofertas de empleo.** Aumentar · Enterprise (decisiones sobre personas) · Clasificado como alto riesgo con criterio jurídico en este caso ficticio.

| *Gate* | Momento | Resultado | Decide | Motivo |
|---|---|---|---|---|
| G0–G2 | 4T27 | Continuar | Comisión de transformación digital | Hipótesis: más personas colocadas por orientador. |
| G3 | 1T28 | **Parar** | Comisión de transformación digital | El producto del proveedor no permitía explicar a cada persona por qué se le proponía o no una oferta, ni acceder a los datos para probar sesgos. Riesgo residual: probabilidad 4 × impacto 5 (personas y derechos) = 20, **Crítico**. Motivo codificado: *Riesgo inaceptable*. |

Inversión consumida: 30.000 €. La parada dio lugar a REC-2028-004 sobre los pliegos de contratación.

### 7.5 Lecciones

1. **El inventario es el primer control.** Sin él, el asistente de la web habría seguido en producción sin aviso ni evaluación.
2. **Empezar por la tramitación es una decisión legítima.** Con un nivel global 1, la tesis prudente fue optimizar procesos internos antes de decidir sobre personas.
3. **No todo se traduce a dinero, pero se dice.** La mejora de plazos es real y se informa como no cuantificada, sin inventar un importe.
4. **Una parada puede cambiar la forma de contratar.** La lección de un proveedor se convirtió en una exigencia para todos.

---

## 8. Caso 6 · Cooperativa agroalimentaria A (ficticio)

### 8.1 Situación inicial

Cooperativa regional ficticia con 260 empleados, 11 centros de recepción, logística propia y 3 líneas de producción de fruta y verdura. Tiene un equipo de operaciones muy fuerte, pero poca especialización digital, y la dirección quiere decidir si la IA sirve para reducir la merma y mejorar la previsión sin crear dependencias externas complejas.

### 8.2 Diagnóstico (C1, 2T27)

| Dimensión | Nivel | Evidencia principal |
|---|---|---|
| D1 · Estrategia y gobierno | 2 | Tesis de la cooperativa sin mandato formal sobre IA. |
| D2 · Valor y cartera | 2 | Proyectos aislados con valor declarado; sin criterios de priorización. |
| D3 · Datos y conocimiento | 2 | Datos de compras y ventas en contabilidad y ERP con cierta dispersión. |
| D4 · Tecnología y operación | 2 | Sistemas de producción estables; poca automatización de datos. |
| D5 · Personas y adopción | 2 | Personal de almacén y producción con cultura de mejora continua. |
| D6 · Riesgo, seguridad y cumplimiento | 2 | Control de seguridad de producción aceptable; inventario de IA aún incompleto. |
| D7 · Medición y evidencia | 1 | Sin líneas base ni validación formal del valor. |

**Nivel global:** media 13 ÷ 7 = 1,85 → 1; límite: mínimo de D1 y D6 (2) + 1 = 3. **Nivel global 1.**

**Índice de transformación:** composición de la inversión 1 · composición del valor 0 · materialización 1 · profundidad del cambio 1 · modelo operativo 0 · ingresos habilitados 0 · paso a producción 1 · decisión del consejo 0. **Perfil: Eficiencia operativa y logística.**

### 8.3 Decisiones del consejo

| Código | Órgano | Decisión |
|---|---|---|
| DEC-2027-051 | Junta (C2) | Tesis: Optimizar en 04 Operaciones y en 05 Datos/logística; no se aprueba la IA en decisiones sobre compra ni sobre personas hasta tener línea base y controles. |
| DEC-2027-053 | Junta | Autorizar la etapa 1 de IA-2027-052 con límite de 90.000 €. |

### 8.4 Iniciativas

**IA-2027-052 · Predicción de demanda por centro y producto.** Optimizar · Lite · Autonomía A1.

| *Gate* | Momento | Resultado | Decide | Motivo |
|---|---|---|---|---|
| G0–G2 | 1T27 | Continuar | Patrocinador | Línea base de ventas y devoluciones por centro. |
| G3 | 2T27 | Continuar | Patrocinador con conformidad de riesgos | Riesgo residual Bajo; la decisión es de coordinación logística, no de compra. |
| G4 | 2T27 | Continuar | Junta | Reversión a la planificación manual probada. |
| G5 | 4T27 | **Parar** | Junta | Se detectó que los proveedores externos tenían varios patrones distintos de pedido y la serie histórica estaba incompleta; la precisión cayó por debajo del umbral en dos centros. Motivo codificado: *Datos insuficientes*. |

Valor estimado antes del cierre del piloto: 124.000 € de ahorro en margen perdido y merma evitada; coste recurrente previsión 55.000 €. La iniciativa se archivó y la cooperativa dedicó el siguiente trimestre a un proyecto de datos de compra y logística para homogeneizar los flujos.

**IA-2027-055 · Asistente de trazabilidad de calidad y lote.** Aumentar · Lite · Autonomía A0.

| *Gate* | Momento | Resultado | Decide | Motivo |
|---|---|---|---|---|
| G0–G1 | 3T27 | Continuar | Junta | El personal de calidad tiene que consultar 18.000 lotes al año en varios formatos. |
| G2–G3 | 4T27 | Continuar | Junta | Control de revisión humana y pruebas sobre coincidencias de lote. |
| G4–G5 | 1T28 | Continuar | Junta | Hay una reducción de tiempo de respuesta y mejora en la trazabilidad; la reversión es simple. |

### 8.5 Lecciones

1. **Las medianas suelen tener buenos datos operativos, pero no siempre homogéneos.** La precisión no falló por técnica, sino por calidad del dato.
2. **Un proyecto de datos puede ser la iniciativa más valiosa.** La cooperativa aprendió que la previsión requiere ordenación antes de automatizar.
3. **La IA útil para una cooperativa no tiene por qué ser de gran escala.** Basta con un problema claro, una línea base y una reversión pronta.

---

## 9. Caso 7 · Grupo hotelero regional T (ficticio)

### 9.1 Situación inicial

Cadena ficticia de 7 hoteles, 4.000 camas y 600 empleados. Tiene un equipo pequeño de operaciones digitales y una dirección muy centrada en la experiencia del cliente. No tienen consultora externa ni un gran comité de IA, pero sí saben que la automatización de reservas y la asignación de personal tiene un impacto directo en los ingresos y la satisfacción.

### 9.2 Diagnóstico (C1, 2T27)

| Dimensión | Nivel | Evidencia principal |
|---|---|---|
| D1 · Estrategia y gobierno | 2 | Dirección con objetivos de experiencia, pero sin una tesis formal de IA. |
| D2 · Valor y cartera | 2 | Algunos pilotos aislados de marketing; sin cartera ni criterios de cierre. |
| D3 · Datos y conocimiento | 2 | Historial de reservas y ocupación bastante bueno; datos de clientes fragmentados. |
| D4 · Tecnología y operación | 2 | CRM y PMS con integración parcial. |
| D5 · Personas y adopción | 3 | Equipo de recepción y gestión con buena disposición. |
| D6 · Riesgo, seguridad y cumplimiento | 2 | Inventario incompleto de herramientas generativas; contratos de terceros revisados. |
| D7 · Medición y evidencia | 1 | Algunos indicadores de ocupación, pero sin validación de valor incremental. |

**Nivel global:** media 14 ÷ 7 = 2,0. **Nivel global 2.**

**Índice de transformación:** composición de la inversión 0 · composición del valor 0 · materialización 1 · profundidad del cambio 1 · modelo operativo 1 · ingresos habilitados 0 · paso a producción 1 · decisión del consejo 0. **Perfil: Mejora de experiencia y operación.**

### 9.3 Decisiones del consejo

| Código | Órgano | Decisión |
|---|---|---|
| DEC-2027-061 | Consejo de dirección | Tesis: Optimizar en 04 Operaciones y 03 Personas; Aumentar en 01 Cliente. No se automatizan decisiones sobre precios ni devoluciones sin revisión humana. |
| DEC-2027-062 | Consejo de dirección | Autorizar la etapa 1 de IA-2027-060 con límite de 65.000 €. |

### 9.4 Iniciativas

**IA-2027-060 · Optimización de precios y disponibilidad de habitaciones.** Optimizar · Lite · Autonomía A1.

| *Gate* | Momento | Resultado | Decide | Motivo |
|---|---|---|---|---|
| G0–G2 | 1T27 | Continuar | Dirección | La campaña de Black Friday y las fechas de alta demanda ya estaban medidas. |
| G3 | 2T27 | **Iterar** | Consejo de dirección | Faltaba una clasificación clara de los datos del cliente y se necesitaba un criterio de revisión humana para los cambios de tarifa. |
| G3 (2.ª) | 3T27 | Continuar | Consejo de dirección | Datos y políticas de uso clarificados. |
| G4–G5 | 4T27 | Continuar | Dirección | El aumento de margen estuvo por encima del umbral en un hotel piloto. |

Valor declarado tras seis meses: 212.000 € de incremento de ingresos por ocupación y margen horario; coste recurrente 92.000 €; neto estimado 120.000 €. El consejo no autorizó G7 hasta validar el efecto con un grupo de control.

**IA-2027-063 · Asistente para atención de clientes y gestión de incidencias.** Aumentar · Lite · Autonomía A0.

| *Gate* | Momento | Resultado | Decide | Motivo |
|---|---|---|---|---|
| G0–G1 | 3T27 | Continuar | Dirección | Reducción del tiempo de respuesta y de llamadas repetidas. |
| G2–G3 | 4T27 | Continuar | Dirección | Incidencias con revisión humana y transparencia de la respuesta. |

### 9.5 Lecciones

1. **La experiencia del cliente puede ser un primer caso sensato para medianas.** No requiere una estructura enorme ni una consultora externa.
2. **La iteración en G3 es una señal de madurez, no de fracaso.** El caso se reforzó con un criterio de revisión humana y clasificación de datos.
3. **Un hotel no necesita “transformar” para empezar.** Optimizar y aumentar ya tienen valor medible.

---

## 10. Caso 8 · Fabricante industrial M (ficticio)

### 10.1 Situación inicial

Fabricante ficticio de componentes metálicos para la industria del automóvil y de maquinaria agrícola, con 420 empleados y dos plantas de producción. Tiene un equipo técnico capaz, una dirección muy orientada a la calidad y una fuerte tensión entre el servicio a clientes y la carga operativa de mantenimiento y planificación.

### 10.2 Diagnóstico (C1, 2T27)

| Dimensión | Nivel | Evidencia principal |
|---|---|---|
| D1 · Estrategia y gobierno | 3 | Hay una agenda de mejora continua y un comité operativo con responsables. |
| D2 · Valor y cartera | 3 | Prioridades claras por línea de negocio. |
| D3 · Datos y conocimiento | 3 | Sensores y trazabilidad en producción con un ERP ordenado. |
| D4 · Tecnología y operación | 3 | Mantenimiento predictivo y monitorización ya instalados. |
| D5 · Personas y adopción | 2 | Algunos equipos con buena base; otros mostrando resistencia al cambio. |
| D6 · Riesgo, seguridad y cumplimiento | 2 | Identificación y control de proveedores, sin inventario de IA completo. |
| D7 · Medición y evidencia | 3 | Línea base y grupos de comparación en mantenimiento y servicio. |

**Nivel global:** media 19 ÷ 7 = 2,71 → 2; límite: mínimo de D1 y D6 (2) + 1 = 3. **Nivel global 2.**

**Índice de transformación:** composición de la inversión 1 · composición del valor 1 · materialización 1 · profundidad del cambio 2 · modelo operativo 1 · ingresos habilitados 0 · paso a producción 1 · decisión del consejo 1. **Perfil: Mejora de servicio y prevención.**

### 10.3 Decisiones del consejo

| Código | Órgano | Decisión |
|---|---|---|
| DEC-2027-071 | Consejo de dirección | Tesis: Optimizar en 04 Operaciones, Aumentar en 01 Cliente y en 09 Gobierno; no se automatizan decisiones de calidad ni de servicio sin revisión humana. |
| DEC-2027-072 | Consejo de dirección | Autorizar la etapa 1 de IA-2027-070 con límite de 180.000 €. |
| DEC-2028-010 | Consejo de dirección | Parar IA-2027-074 en G5 por riesgo de cumplimiento tributario y de gestión de pedidos. |

### 10.4 Iniciativas

**IA-2027-070 · Mantenimiento predictivo de equipos críticos.** Optimizar · Enterprise · Autonomía A1.

| *Gate* | Momento | Resultado | Decide | Motivo |
|---|---|---|---|---|
| G0–G2 | 1T27 | Continuar | Dirección | Grupos de control de maquinaria y fecha de avería registradas. |
| G3 | 2T27 | Continuar | Dirección | Riesgo residual Medio; revisión por mantenimiento. |
| G4 | 3T27 | Continuar | Dirección | Reversión por parada manual probada. |
| G5 | 1T28 | **Escalar** | Consejo de dirección | Alivio de averías y reducción del tiempo de respuesta verificadas. |

Valor con doce meses: 280.000 € de pérdidas evitadas; coste recurrente 120.000 €; neto anual validado 160.000 €.

**IA-2027-074 · Agente de gestión de incidencias de clientes y pedidos.** Aumentar · Enterprise · Autonomía A2 con límite de 2.500 € por caso.

| *Gate* | Momento | Resultado | Decide | Motivo |
|---|---|---|---|---|
| G0–G2 | 2T27 | Continuar | Dirección | Hipótesis de reducción del tiempo de respuesta y mejora del servicio. |
| G3 | 3T27 | Continuar con condiciones | Dirección | Condición: revisión humana y traabilidad de las decisiones sobre contratos y entregas. |
| G4 | 4T27 | Continuar | Dirección | Hito de margen previo al servicio. |
| G5 | 2T28 | **Parar** | Consejo | Se detectó un problema de trazabilidad y del tratamiento de proveedor, con riesgo de incumplimiento en el servicio más crítico. Motivo codificado: *Riesgo de cumplimiento*. |

Inversión consumida: 145.000 €. Se reformuló la iniciativa como un asistente de ayuda interna, no como un agente de decisión.

### 10.5 Lecciones

1. **La industria no necesita ser enorme para tener enfoque de riesgo y servicio.** El caso combina producción, calidad y atención a clientes.
2. **La IA útil en plantas suele empezar con mantenimiento y servicio.** Son dominios con datos claros y reversión simple.
3. **Una vez que se entra en decisiones sobre clientes o proveedores, la trazabilidad se vuelve crítica.** El caso lo demostró y reforzó el criterio de revisión.

---

## 11. Lecciones transversales y uso en talleres

### 11.1 Lecciones transversales

| Lección | Casos |
|---|---|
| Las paradas bien fundamentadas evitan inversión y generan aprendizaje registrado. | 1, 2, 3, 4, 5, 6, 8 |
| Regularizar los sistemas anteriores al marco suele revelar valor declarado sin base o riesgos no evaluados. | 1, 3, 4, 5, 6, 8 |
| La capacidad liberada solo es valor cuando se materializa o se reasigna expresamente. | 2, 3, 5, 6, 7 |
| El nivel global de madurez se limita por la dimensión de gobierno o de riesgo más débil y se lee junto a las dimensiones. | 1, 2, 3, 6, 8 |
| Las apuestas de Transformar necesitan hitos, límite por etapa y criterios de parada que solo relaja quien las autorizó. | 1, 2, 3, 4, 8 |
| En G3 no se continúa con condiciones sobre cumplimiento legal: se itera o se para. | 2, 3, 5, 7, 8 |
| En medianas, la primera decisión no suele ser “transformar”, sino “ordenar datos y poner controles”. | 6, 7, 8 |

### 11.2 Preguntas para trabajar los casos

| Caso | Pregunta para el debate |
|---|---|
| 1 | ¿Qué habría pasado si el consejo hubiera aceptado el riesgo Crítico de las baterías para no perder la oportunidad? ¿Qué debería constar en esa decisión? |
| 2 | El equipo del agente de cargas pedía rebajar el criterio de parada a 0,5 puntos. ¿Qué argumentos tendría el consejo a favor y en contra? |
| 3 | Con un neto validado negativo y un neto total positivo, ¿escalaría la documentación clínica automática? ¿Con qué condición? |
| 4 | ¿Es coherente financiar primero la iniciativa con menor neto adicional por euro? ¿Cómo se explica al mercado y a la plantilla? |
| 5 | ¿Cómo adaptaría la señal "ingresos habilitados por IA" del índice de transformación a una administración pública? |
| 6 | ¿Qué cambio de gobierno de datos haría falta antes de volver a intentar la previsión por centro? |
| 7 | ¿Qué umbral de revisión humana es razonable para una cadena hotelera sin gran estructura de IA? |
| 8 | ¿Cómo diferenciaría el error de servicio del riesgo de cumplimiento cuando el sistema interviene con clientes, proveedores y personas? |

---

## 12. Herramientas y plantillas asociadas

| Código | Nombre | Uso en los casos |
|---|---|---|
| T01 | Registro de iniciativas | Recorrido de *gates*, estados y motivos codificados. |
| T02 | Inventario de sistemas de IA | Hallazgos iniciales de los casos 1 y 5. |
| T03 | Gestor de *gates* | Decisiones y condiciones. |
| T05 | Clasificador de ambición | Nivel de ambición de cada iniciativa. |
| T12 | Seguimiento de realización de valor | Tablas de valor con estado. |
| T14 | Calculadora del índice de transformación | Perfiles de cada compañía. |
| T15 | Diagnóstico de madurez | Tablas D1–D7. |
| T18 | Registro de recomendaciones del consejo | Códigos REC y DEC. |
| T22 | Gestor de retiradas | Retiradas de los casos 1, 3, 4 y 5. |
| P29 | Registro de decisión de *gate* | Cada fila de las tablas de *gates*. |
| P30 | Decisión de escalado o retirada | Decisiones de G7. |

---

## 13. Documentos relacionados

| Documento | Relación |
|---|---|
| **00 · Qué es SEVEN-G y para qué sirve** | Reglas de medición, niveles de ambición y perfiles. |
| **01 · Metodología fundacional** | *Gates*, reglas de decisión, intensidad y regularización. |
| **11 · Modelo de madurez** | Regla de cálculo del nivel global. |
| **12 · Índice de transformación** | Señales y umbrales pendientes de calibrar. |
| **33 · Metodología de riesgos de IA** | Niveles de riesgo inherente y residual. |
| **40 · Reglas de medición del valor** | Fórmulas y estados. |
| **60 · Paquete para el consejo** | Cómo se presentarían estos casos al consejo. |
| **61 · Guía de conversación con el consejo** | Formato de respuesta y selección de casos. |
| **62 · Registro de recomendaciones y decisiones** | Códigos REC y DEC. |
| **91 · Guía para consultores** | Uso de casos ficticios en servicios de terceros. |

---

## 14. Control de versiones

| Versión | Fecha | Cambios |
|---|---|---|
| 0.1 | 16-09-2026 | Primera versión. Cinco casos ficticios (energía, logística, sanidad, retail y sector público) con diagnóstico de madurez, índice de transformación, decisiones del consejo, recorrido de quince iniciativas por sus *gates*, valor con fórmulas y estados, cinco paradas, cuatro retiradas y lecciones. Sustituye los casos de ejemplo del material anterior, que contenían resultados no demostrables. |
