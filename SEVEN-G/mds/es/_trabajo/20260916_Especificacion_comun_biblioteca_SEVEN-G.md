# SEVEN-G · Especificación común para redactar la biblioteca

| | |
|---|---|
| Tipo | Documento de trabajo interno |
| Fecha | 16-09-2026 |
| Versión | 0.1 |
| Objetivo | Fijar las convenciones, parámetros y códigos comunes que deben respetar todos los documentos y plantillas de SEVEN-G para que sean coherentes entre sí. |

> Documento interno. Lo que aquí se fija se aplica a todos los documentos. Si un documento necesita cambiar un parámetro, se cambia aquí primero y se registra en `.claude/seveng_decisiones.md`.

---

## 1. Fuentes normativas que no se pueden contradecir

1. `SEVEN-G/mds/es/00_SEVEN-G_Que_es_y_para_que_sirve.md` (presentación, reglas de medición §6, índice de transformación §5).
2. `SEVEN-G/mds/es/01_SEVEN-G_Metodologia_fundacional.md` (modelo, fases, *gates*, roles, intensidad, riesgos, no conformidades, regulación). **Es la referencia normativa.**
3. `SEVEN-G/mds/es/03_SEVEN-G_Herramientas_y_registro_de_iniciativas.md` (registro, taxonomía, eventos, métricas, modelo de datos, herramientas T01–T22).
4. `.claude/seveng_decisiones.md` (registro de decisiones).
5. `SEVEN-G/build/guia_traduccion_en.md` (glosario ES/EN obligatorio: los términos en español de ese glosario son los términos oficiales).
6. Este documento.

`SEVEN-G/_legacy/` solo se usa como fuente de ideas. Sus cifras, fases, escalas y nombres **no** son vigentes.

## 2. Reglas de redacción

- Español de España, serio, neutro, claro, sin jerga innecesaria ni tono comercial. Frases cortas. Tablas cuando ordenen mejor que el texto.
- **Confidencialidad (D17):** ningún dato, nombre, cifra ni rasgo reconocible de clientes. Está prohibido abrir o citar carpetas de clientes (en particular `F:\OneDrive_Seachad_Recuperado\`, `E:\OneDrive_Seachad_Recuperado\` o cualquier carpeta con nombre de compañía). Los ejemplos son genéricos o ficticios y se marcan como *ilustrativos*.
- **Sin cifras sin respaldo:** nada de "50+ engagements", "benchmarks de 200 organizaciones", porcentajes de mejora o de ROI de mercado. Si se cita un dato externo, debe ser verificable y con fuente; si no, no se pone.
- Normas y regulación: citar solo artículos y requisitos que existan. Cuando haya fechas de aplicación o cambios en tramitación, indicar la fecha de consulta (septiembre de 2026) y la necesidad de verificar la vigencia. Añadir siempre: *"Este documento no constituye asesoramiento jurídico."* en documentos con contenido regulatorio.
- Vocabulario normativo de 01 §1.3: **debe** (obligatorio), **debería** (recomendado), **puede** (opcional).
- No crear marcas paralelas: SEVEN-G es el paraguas; SPAD y AECF se citan como metodologías relacionadas (D09).
- Nada de diagramas en texto ni arte ASCII (D13). Para diagramas: componentes existentes (`<!-- figura: arquitectura -->`, `ciclo`, `embudo`, `esferas`, `espectro`, `intensidad`, `no-conformidades`) o bloques Mermaid precedidos de `<!-- grafico: Título | Subtítulo -->`, con las `classDef` de la paleta (ver 01 §7.1). Máximo 2–3 diagramas por documento, solo si aportan.
- Cada vez que se introduce un concepto nuevo (incluidas plantillas, documentos y herramientas), el texto **debe** incorporar una zona explícita de explicación con el rótulo **"Por qué importa"**, conectada a decisión, riesgo, cumplimiento o medición.

## 3. Estructura de cada documento

```
# Título sin "SEVEN-G ·" delante

**Subtítulo en negrita (una línea)**

| | |
|---|---|
| Documento | Documento NN · Nombre corto |
| Versión | 0.1 (borrador de trabajo) |
| Fecha | 16-09-2026 |
| Autor | Fernando García · SEACHAD |
| Estado | Borrador para revisión. <frase opcional> |

<!-- cifras: N | texto ; N | texto ; N | texto ; N | texto -->   (4 cifras que describan el documento, no cifras de mercado)

> Aviso legal (D33)

<!-- esencial: nivel | texto -->   (D75: siempre, enterprise, condicional, recomendado o consulta; el mismo nivel en EN y en la tabla del documento 94 §6)

---

## 1. Objeto y alcance
...
## N-2. Herramientas y plantillas asociadas   (códigos T y P)
## N-1. Documentos relacionados              (tabla Documento | Relación)
## N. Control de versiones                   (tabla Versión | Fecha | Cambios; 0.1 | 16-09-2026 | Primera versión. ...)
```

- Secciones de nivel 2 numeradas `## 1.`, `## 2.`…; subsecciones `### 2.1`.
- Separar secciones principales con `---`.
- Las plantillas (bloque H) usan la misma portada con `Documento | Plantilla PNN · Nombre` y la estructura de la sección 7 de este documento.

## 4. Nombres de fichero

Ruta de redacción: `SEVEN-G/mds/es/`. La traducción usa **el mismo nombre de fichero** en `SEVEN-G/mds/en/`.

| Nº | Fichero |
|---|---|
| 02 | `02_SEVEN-G_Glosario_y_convenciones.md` |
| 04 | `04_SEVEN-G_Origenes_diferencias_y_por_que_es_abierto.md` |
| 10 | `10_SEVEN-G_Mapa_de_esferas_y_niveles_de_ambicion.md` |
| 11 | `11_SEVEN-G_Modelo_de_madurez.md` |
| 12 | `12_SEVEN-G_Indice_de_transformacion.md` |
| 13 | `13_SEVEN-G_Tesis_de_IA_ambicion_y_apetito_de_riesgo.md` |
| 14 | `14_SEVEN-G_Gestion_de_cartera.md` |
| 20 | `20_SEVEN-G_Manuales_de_fase.md` |
| 21 | `21_SEVEN-G_Criterios_de_gate_y_auditoria.md` |
| 22 | `22_SEVEN-G_Listas_de_verificacion_por_gate.md` |
| 23 | `23_SEVEN-G_Adopcion_y_cambio.md` |
| 30 | `30_SEVEN-G_Modelo_de_gobierno.md` |
| 31 | `31_SEVEN-G_Politica_corporativa_y_uso_aceptable.md` |
| 32 | `32_SEVEN-G_Inventario_y_clasificacion_regulatoria.md` |
| 33 | `33_SEVEN-G_Metodologia_de_riesgos_de_IA.md` |
| 34 | `34_SEVEN-G_Mapeo_regulatorio.md` |
| 35 | `35_SEVEN-G_Seguridad_de_IA_y_agentes.md` |
| 36 | `36_SEVEN-G_Terceros_y_proveedores_de_IA.md` |
| 37 | `37_SEVEN-G_No_conformidades_e_incidentes.md` |
| 38 | `38_SEVEN-G_Marco_de_auditoria_de_IA.md` |
| 40 | `40_SEVEN-G_Reglas_de_medicion_del_valor.md` |
| 41 | `41_SEVEN-G_Catalogo_de_indicadores.md` |
| 42 | `42_SEVEN-G_Costes_de_IA.md` |
| 43 | `43_SEVEN-G_Realizacion_de_beneficios.md` |
| 50 | `50_SEVEN-G_Personas_y_organizacion.md` |
| 51 | `51_SEVEN-G_Datos_y_conocimiento.md` |
| 52 | `52_SEVEN-G_Manual_de_operacion_de_IA.md` |
| 53 | `53_SEVEN-G_Construccion_de_soluciones_con_IA.md` |
| 60 | `60_SEVEN-G_Paquete_para_el_consejo.md` |
| 61 | `61_SEVEN-G_Guia_de_conversacion_con_el_consejo.md` |
| 62 | `62_SEVEN-G_Registro_de_recomendaciones_y_decisiones.md` |
| 90 | `90_SEVEN-G_Guia_de_implantacion.md` |
| 91 | `91_SEVEN-G_Guia_para_consultores.md` |
| 92 | `92_SEVEN-G_Casos_de_aplicacion.md` |
| 93 | `93_SEVEN-G_Licencia_uso_y_citacion.md` |
| 94 | `94_SEVEN-G_Matriz_de_obligatoriedad_y_lectura_por_capas.md` |
| Curso | `curso/M00_SEVEN-G_Curso_Guia_del_curso.md` y `curso/MNN_SEVEN-G_Curso_<Nombre>.md` (M01–M09); sin directiva «esencial» |
| P01–P71 | `plantillas/PNN_SEVEN-G_<Nombre_con_guiones_bajos>.md` |

## 5. Parámetros comunes

### 5.1 Riesgo (documento 33; lo usan 13, 14, 21, 35, 36, P12, P13, T06)

| Probabilidad | Nombre | Referencia orientativa |
|---|---|---|
| 1 | Rara | Menos de una vez en 5 años o < 5 % en el horizonte de la iniciativa |
| 2 | Improbable | Una vez cada 2–5 años o 5–20 % |
| 3 | Posible | Una vez cada 1–2 años o 20–50 % |
| 4 | Probable | Varias veces al año o 50–80 % |
| 5 | Casi segura | Mensual o más, o > 80 % |

| Impacto | Nombre |
|---|---|
| 1 | Insignificante |
| 2 | Menor |
| 3 | Moderado |
| 4 | Grave |
| 5 | Crítico |

El impacto se valora en cinco ejes (económico, personas y derechos, regulatorio, operativo, reputacional) y se toma el **mayor**. Los umbrales económicos los fija cada compañía en C2 (documento 13) en proporción a su tamaño; los documentos solo dan ejemplos ilustrativos.

**Nivel = Probabilidad × Impacto**: **Bajo** 1–4 · **Medio** 5–9 · **Alto** 10–15 · **Crítico** 16–25. Se calcula **inherente** (sin controles) y **residual** (con controles eficaces).

Respuestas: **Evitar · Mitigar · Transferir · Aceptar**.

Aceptación del riesgo residual: Bajo → responsable de producto, con registro · Medio → patrocinador con conformidad del responsable de riesgos · Alto → comité de IA · Crítico → no se acepta; excepcionalmente, solo el consejo o su comisión delegada, dentro del apetito de riesgo aprobado en C2. Un riesgo residual Crítico sin esa aprobación bloquea G3 y G5.

Códigos de riesgos tipo: `RT-<CAT>-NN` con CAT = EST (estratégico), TEC (técnico), DAT (datos), ECO (económico), LEG (legal y cumplimiento), ORG (organizativo), REP (reputacional), GEN (IA generativa y agentes), SEG (seguridad e IA ofensiva), TER (terceros).

### 5.2 Madurez (documento 11; lo usan 90, 60, T15) — decisión D10 confirmada

Dimensiones: **D1** Estrategia y gobierno · **D2** Valor y cartera · **D3** Datos y conocimiento · **D4** Tecnología y operación · **D5** Personas y adopción · **D6** Riesgo, seguridad y cumplimiento · **D7** Medición y evidencia.

Niveles: **0 Inexistente · 1 Inicial · 2 En desarrollo · 3 Definido · 4 Gestionado · 5 Optimizado**.

Reglas: niveles acumulativos (para estar en 3 se cumplen todos los criterios de 1, 2 y 3); cada criterio exige evidencia observable; el **nivel global** es la media ponderada de las dimensiones redondeada hacia abajo y **limitada al nivel más bajo de D1 o D6 más uno**. Pesos iguales por defecto; la compañía puede fijar otros en C2 y debe declararlos.

### 5.3 Índice de transformación (documento 12; lo usan 10, 14, 60, T14)

Ocho señales de 00 §5.3, cada una puntuada **0–3** (0 sin dato o exploración · 1 eficiencia · 2 intermedio · 3 transformación) con umbrales numéricos iniciales definidos en el documento 12 y marcados "a calibrar". Cinco perfiles de 00 §5.3. "Sin dato" puntúa 0 y se muestra como sin dato.

### 5.4 Autonomía de sistemas y agentes (documento 35; lo usan 01 §9.2, 20, 21, 22, P17, P18, T10)

| Nivel | Nombre | Qué hace el sistema | Papel humano |
|---|---|---|---|
| **A0** | Asistencia | Informa, resume o genera contenido. | La persona decide y ejecuta. |
| **A1** | Recomendación | Propone una decisión o acción concreta. | La persona valida cada acción antes de ejecutarla. |
| **A2** | Actuación supervisada | Ejecuta acciones dentro de límites definidos. | Supervisa, puede interrumpir y revisa a posteriori. |
| **A3** | Actuación autónoma | Ejecuta secuencias de acciones sin revisión individual dentro de límites estrictos. | Fija límites, supervisa agregados y dispone de interruptor de parada. |

Criterio Enterprise "agentes con capacidad de actuar" (01 §9.2) = nivel **A2 o A3** cuando las acciones tienen efecto sobre terceros, dinero, datos personales o sistemas de producción.

### 5.5 Incidentes (documento 37; lo usan 52, 35, 60, P26, P27, T08)

Severidad: **S1 Crítica · S2 Alta · S3 Media · S4 Baja**. S1 incluye cualquier posible "incidente grave" según el Reglamento Europeo de IA y los incidentes graves de DORA o NIS2 cuando apliquen. Las no conformidades mantienen su escala propia: **menor · mayor · crítica** (01 §12).

### 5.6 Terceros (documento 36; lo usan 33, 34, P14, T09)

Niveles de exigencia: **N1 Estándar · N2 Reforzado · N3 Crítico**, según criticidad del servicio, datos tratados, autonomía y sustituibilidad.

### 5.7 Valor y costes (documentos 40–43; lo usan 13, 14, 60, P08, P09, P28, T11–T13)

- Reglas de medición: las diez de 00 §6, sin cambiar su numeración.
- Estados del importe: **validado · declarado · estimado**.
- Tipos: **eficiencias · retorno · coste recurrente**; además, *riesgo evitado* y *cumplimiento* como tipos de valor no sumables salvo que se traduzcan a dinero con fórmula.
- **Valor neto anual = eficiencias + retorno − coste recurrente.**
- **Neto adicional por euro = neto anual adicional esperado ÷ inversión adicional necesaria** (criterio de priorización).
- Categorías de coste (documento 42): licencias · consumo de modelos · cómputo e infraestructura · datos · personas de construcción · personas de operación · proveedores y servicios · control y cumplimiento · adopción y formación.
- Alinear definiciones con `C:\SEACHAD\AI_en_el_consejo\motor\economia.py` y `motor\ESQUEMA.md` (solo lectura).

### 5.8 Respuesta al consejo (documentos 60, 61)

Formatos de respuesta: **"Sí"** · **"Sí, con una condición: …"** · **"Todavía no, porque falta …"** · **"No, porque …"**. Máximo de casos a presentar por sesión: 3 en detalle.

### 5.9 Códigos

| Código | Uso |
|---|---|
| C1–C5 | Etapas del ciclo corporativo |
| G0–G5, R6, G7 | Puertas de decisión |
| `G3.01`… | Criterios de *gate* (documento 21). Formato `G<n>.<nn>`; `R6.<nn>` para la revisión de continuidad |
| `LV-G3`… · `LV-EV` · `LV-AG` | Listas de verificación por *gate*, de validación de evidencias y de agentes (documento 22) |
| `EV.01`… | Controles de validación de evidencias (documento 22) |
| `IE01.01`… | Indicadores por esfera (documento 10; consolidados en el catálogo del documento 41) |
| `IND-<FAM>-NN` | Indicadores del catálogo (documento 41; 156 en 13 familias): VAL, COS, EMB, AGI, RIE, OPE, ADO, DAT, CLI, TRA, MAD, CON (consejo) y **PRO** (procesos y decisión, familia nueva que recoge los indicadores de las esferas 04 y 07) |
| PER-NN · DAT-NN · **CNC-NN** · OPE-NN | Indicadores provisionales de los documentos 50, 51 y 52. **CNC-** (conocimiento, documento 51) sustituye a CON- para no confundirse con la familia IND-CON (consejo). Código definitivo en la tabla de correspondencia de 41 §21 |
| T01–T22 | Herramientas (documento 03) |
| P01–P71 | Plantillas (bloque H): P01–P31 por iniciativa; P32–P71 de compañía, consejo, cumplimiento, terceros, auditoría e implantación (§6.1) |
| D1–D7 | Dimensiones de madurez |
| S1–S4 | Severidad de incidentes |
| A0–A3 | Autonomía |
| N1–N3 | Exigencia a terceros |
| RT-XXX-NN | Riesgos tipo (70 en el documento 33) |
| IA-AAAA-NNN | Iniciativas |
| IA-AAAA-NNN · Rnn | Riesgo concreto dentro de una iniciativa (documento 33) |
| SIA-AAAA-NNN | Sistemas de IA del inventario (documento 32) |
| SEG-NN · AG-NN | Controles de seguridad de IA y de agentes (documento 35) |
| REC-AAAA-NNN | Recomendaciones del consejo (verificar formato existente en `AI_en_el_consejo/motor/ESQUEMA.md` y respetarlo si ya existe uno) |
| NC-AAAA-NNN · INC-AAAA-NNN | No conformidades · incidentes |
| DEC-AAAA-NNN · AUD-AAAA-NNN · H-NN | Decisiones del consejo (62) · informes de auditoría y sus hallazgos (38) |
| EXC-AAAA-NNN · DCI-AAAA-NNN | Excepciones (P40) · declaraciones de independencia y conflictos (P41) |
| PRV-AAAA-NNN | Relación con un proveedor de IA en el registro de proveedores (P57, T09) |
| SOL-AAAA-NNN · COM-AAAA-NNN · INF-AAAA-NNN | Solicitudes de herramienta y comunicaciones de empleados (P43) · información a la representación (P46) |
| PA-AAAA-NNN · IDN-AAAA-NNN | Campañas de pruebas adversarias (P53) · identidades no humanas (P54) |

## 6. Plantillas del bloque H (alineadas con 01 §6.10)

| Código | Plantilla | Fase | Evidencia de 01 §6.10 | Herramienta |
|---|---|---|---|---|
| P01 | Carta de la iniciativa | 0 | Carta de la iniciativa | T01 |
| P02 | Declaración de contexto y restricciones | 0 | Declaración de contexto y restricciones | T01 |
| P03 | Registro de asignación de roles | 0 | Registro de asignación de roles | T01 |
| P04 | Determinación de intensidad | 0, G3, R6 | Determinación de intensidad | T04 |
| P05 | Ficha de inventario del sistema de IA | 0 | Alta en el inventario | T02 |
| P06 | Cartera de oportunidades y notas de filtrado | 1 | Cartera de oportunidades · Alternativas sin IA | T01 |
| P07 | Clasificación de esfera y ambición | 1, 2, 7 | Esfera y nivel de ambición · Confirmación de ambición | T05 |
| P08 | Lienzo de hipótesis de valor | 2 | Lienzo · Método de atribución · Criterios de parada | T11 |
| P09 | Línea base | 2 | Métricas de línea base | T11 |
| P10 | Evaluación de viabilidad | 3 | Evaluación de viabilidad | — |
| P11 | Clasificación regulatoria y evaluaciones de impacto | 3 | Clasificación regulatoria · Evaluaciones de impacto | T07 |
| P12 | Matriz y registro de riesgos | 3, 5, 6 | Matriz y registro de riesgos | T06 |
| P13 | Plan de mitigación y contingencia | 3 | Plan de mitigación y contingencia | T06 |
| P14 | Evaluación de proveedor de IA | 3 | Evaluación de proveedores | T09 |
| P15 | Registro de arquitectura | 4 | Registro de arquitectura | — |
| P16 | Linaje de datos y modelos | 4 | Linaje de datos y modelos | — |
| P17 | Diseño de gobierno y supervisión humana | 4 | Diseño de gobierno y supervisión humana | — |
| P18 | Diseño de seguridad (incluye agentes) | 4 | Diseño de seguridad | T10 |
| P19 | Plan de reversión y prueba | 4, 5 | Plan de reversión · Prueba de reversión | — |
| P20 | Plan de adopción y capacidad | 4–7 | Plan de adopción | T20 |
| P21 | Informe de entrega | 5 | Informe de entrega | — |
| P22 | Resultados de validación y del piloto | 5 | Resultados de validación y pruebas · Resultados del piloto | T11 |
| P23 | Firma de puesta en producción | 5 | Firma de puesta en producción | T03 |
| P24 | Manual de operación | 6 | Manual de operación | — |
| P25 | Configuración de monitorización y alertas | 6 | Monitorización y alertas | — |
| P26 | Plan de respuesta a incidentes | 6 | Plan de respuesta a incidentes | T08 |
| P27 | Registro de incidentes y cambios | 6 | Registro de incidentes y cambios | T08 |
| P28 | Seguimiento de realización de valor | 6, 7 | Seguimiento de valor | T12 |
| P29 | Registro de decisión de *gate* | Todas | Registro de decisión de *gate* (01 §7.4) | T03 |
| P30 | Decisión de escalado o retirada | 7 | Decisión de escalado o retirada · Lecciones aprendidas · Plan de retirada | T22 |
| P31 | Ficha de caso de uso | 1–7 | Descripción comprensible del caso (regla 10 de medición) | T01 |

### 6.1 Plantillas de compañía, consejo, cumplimiento, terceros, auditoría e implantación (D68, 19-09-2026)

No son evidencias de una fase de la iniciativa: son los registros, informes y decisiones que el marco pide a la compañía. Siguen la misma estructura (sección 7) y añaden «Por qué importa» tras el aviso legal (D30). Todas tienen versión editable en Word (D67).

| Código | Plantilla | Ámbito | Documento fuente | Herramienta |
|---|---|---|---|---|
| P32 | Mandato de implantación de SEVEN-G (con declaración de completitud del inventario) | Implantación | 90 §3–§4 | — |
| P33 | Informe de diagnóstico C1 | C1 | 01 §5, 11 §6, 10 §8, 12 §10 | T14, T15 |
| P34 | Cuestionario e informe de madurez | C1, C5 | 11 | T15 |
| P35 | Tesis de IA y apetito de riesgo (con selección de indicadores) | C2 | 13 §15, 41 §19–20 | T19 |
| P36 | Plan de cartera C3 (priorización, semáforo, regularización) | C3 | 14 | T01 |
| P37 | Revisión anual C5 (con autoevaluación de los órganos) | C5 | 01 §5, 13 §13, 11 D1 | T01, T14, T15 |
| P38 | Reglamento de los órganos de gobierno de IA | Gobierno | 30 §3–§7 | — |
| P39 | Orden del día y acta de órgano de gobierno | Gobierno | 30 §3, 14 §7 | — |
| P40 | Solicitud y registro de excepciones | Gobierno | 30 §7.4, 31 §3.8 | — |
| P41 | Declaraciones de independencia y conflictos de interés | Gobierno, auditoría, consultoría | 30 §12, 38 §3.1, 91 §5.5 | — |
| P42 | Informe trimestral de segunda línea | C4 | 30 §6.3, 32 §9, 33 §10–12, 37 §9 | T06, T08 |
| P43 | Catálogo de herramientas autorizadas y solicitudes | Uso corporativo | 31 §4–§5 | T21 |
| P44 | Encuesta de uso y percepción de la IA | Uso corporativo, adopción | 31 §5.2, 23 §10, 50 §9–10 | T20 |
| P45 | Plan y registro de alfabetización y formación | Personas | 31 §6, 50 §5 | T20 |
| P46 | Información a los trabajadores y a su representación | Personas | 50 §7, 23 §9.3 | — |
| P47 | Evaluación de impacto en protección de datos | Cumplimiento | 32 §6.1, 34 §6.1 | T07 |
| P48 | Evaluación de impacto en derechos fundamentales | Cumplimiento | 32 §6.2, 34 §3.10 | T07 |
| P49 | Avisos de transparencia e instrucciones de uso | Cumplimiento | 34 §3.7, §3.11, 50 §7 | — |
| P50 | Registro de no conformidades | Cumplimiento | 37 §3 | T08 |
| P51 | Notificaciones y comunicaciones de incidentes | Incidentes | 37 §5, §10 | T08 |
| P52 | Análisis de causa raíz y plan de acción correctiva | Incidentes, no conformidades | 37 §3.5–3.6, §4.5 | T08 |
| P53 | Plan e informe de pruebas adversarias | Seguridad | 35 §8, §9.2 | T10 |
| P54 | Inventario de identidades no humanas y componentes | Seguridad | 35 §4.1, §7, 53 §7.4 | T10, T02 |
| P55 | Cuestionario de diligencia debida a proveedores de IA | Terceros | 36 §4.3, §8.1 | T09 |
| P56 | Cláusulas contractuales tipo de IA | Terceros | 36 §6, §8.1 | T09 |
| P57 | Registro de proveedores y plan de salida | Terceros | 36 §4.2, §5, §7, §9 | T09 |
| P58 | Plan anual de auditoría de IA | Auditoría | 38 §5 | — |
| P59 | Papeles de trabajo de auditoría | Auditoría | 38 §6–§7 | — |
| P60 | Informe de auditoría y fichas de hallazgo | Auditoría | 38 §9, 21 §10.7, 43 §12 | — |
| P61 | Declaración de aplicación de SEVEN-G | Auditoría, implantación | 01 §14, 38 §11 | — |
| P62 | Plan de realización de beneficios | Valor (G3–G7) | 43 §4, 40 §7.2 | T12 |
| P63 | Presupuesto de consumo y conciliación de costes | Costes (G5, fase 6, C3) | 42 §6–§11, 52 §10.3 | T13 |
| P64 | Ficha de conjunto de datos e inventario de fuentes de conocimiento | Datos | 51 §4.2, §10 | T02 |
| P65 | Paquete de revisión de continuidad R6 | Operación (R6) | 52 §8.2 | T03 |
| P66 | Anexos de construcción con SPAD | Construcción | 53 §4.1, §6 | — |
| P67 | Paquete trimestral para el consejo | C4 | 60 | T17, T18 |
| P68 | Nota previa y nota de conclusiones de la sesión del consejo | Consejo | 61 §8 | — |
| P69 | Registro de decisiones del consejo | Consejo | 62 §4–§10 | T18 |
| P70 | Propuesta y carta de encargo | Consultoría | 91 §4 | — |
| P71 | Plan de transferencia y nota de salida | Consultoría | 91 §4.6, §7.3 | — |

## 7. Estructura de cada plantilla

```
# Nombre de la plantilla
**Para qué sirve (una línea)**
| | |  (ficha: Documento = Plantilla PNN · Nombre; Versión; Fecha; Autor; Estado)
---
## 1. Instrucciones de uso        (cuándo se usa, quién la rellena, quién la verifica, en qué gate se revisa, Lite frente a Enterprise)
## 2. Identificación              (tabla de campos con código de iniciativa, versión, autor, fecha…)
## 3…N. Bloques de contenido       (tablas con columnas "Campo | Contenido | Guía" o tablas de registro con filas vacías y una fila de ejemplo ilustrativo marcada)
## N-2. Criterios de calidad      (qué comprueba el verificador; enlaza con criterios G<n>.<nn> del documento 21)
## N-1. Aprobación y verificación (autor, verificador, decisor, fechas; separación de funciones)
## N. Control de versiones
```

Versión Lite: indicar en cada bloque con **(Enterprise)** los campos que Lite puede omitir.
