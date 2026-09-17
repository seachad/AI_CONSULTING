# SEVEN-G · Ajustes de coherencia entre documentos

| | |
|---|---|
| Tipo | Documento de trabajo interno |
| Fecha | 16-09-2026 |
| Objetivo | Registrar los ajustes transversales detectados al redactar la biblioteca y dónde deben propagarse. |

## Ajustes aplicados a los documentos normativos (01, 03)

| # | Ajuste | Motivo | Documentos a revisar |
|---|---|---|---|
| A1 | Criterio Enterprise "agentes con capacidad de actuar" = autonomía A2/A3 con efecto sobre terceros, dinero, datos personales o sistemas de producción (01 §9.2). | D22. | 04 (P04), 20, 21, 22, 35, T01 |
| A2 | Separación de funciones en Lite: G3, G4 y G5 los verifica la oficina de IA y los decide el patrocinador con conformidad de riesgos; el responsable técnico ya no decide G4 en Lite (01 §7.5, §8.1). | El responsable técnico forma parte del equipo; el responsable de riesgos no puede verificar y dar conformidad a la vez. | 20, 21, 22, 30, P23, P29, T01 |
| A3 | Resultados de R6: Continuar la operación · Continuar con condiciones · Adelantar G7 (01 §7.3). En G7, mantener sin cambios = Iterar con vuelta a la fase 6. | 01 no definía resultados de R6. | 20, 21, 22, 52, P29, T01 |
| A4 | Estados de criterio: Cumple · No cumple · No aplica · Pendiente (03 §3.1 corregido). | Coherencia con 03 §3.4. | — |

## Decisiones de redacción a respetar en todos los documentos

| # | Tema | Regla | Origen |
|---|---|---|---|
| R1 | Esferas 08 y 09 | Se evalúan con grados propios (Ausente, Básico, Sistemático, Avanzado); solo pueden ser esfera secundaria si la finalidad de la iniciativa es el cumplimiento o el gobierno; su inversión va en banda aparte y no cuenta en las señales 1, 2 y 7 del índice. Inversión y valor se imputan solo a la esfera principal. | Documento 10 |
| R2 | Indicadores por esfera | Códigos provisionales IE01.01–IE09.09, consolidados en el catálogo del documento 41. | Documento 10 |
| R3 | Índice de transformación | Condiciones de base B1–B3 y "declaración de transformación"; aviso de baja fiabilidad si D7 < 2. | Documentos 12 y 11 |
| R4 | Apetito de riesgo | Grados Averso · Cauteloso · Moderado · Abierto; solo endurecen la regla de aceptación; Crítico nunca aceptable en LEG ni SEG. Umbral Enterprise y materialidad ilustrativos en % del EBITDA, fijados por la compañía. | Documento 13 |
| R5 | Criterios de gate | "Sí ◆" = control crítico no condicionable que fundamenta veto en G5; etiquetas [GEN], [AG], [TER]; el grado de cumplimiento es informativo y nunca compensa un criterio bloqueante; un veto de G5 solo lo levanta quien lo emitió. | Documento 21 |
| R6 | Madurez | Niveles enteros; solo evaluaciones verificadas sirven para C1, C5 y la declaración de 01 §14; recomendación de no aprobar Transformar en G2 con D1 o D6 < 2. | Documento 11 |
| R7 | Cartera | Priorización en tres grupos por ambición con presupuesto propio; financiación por tramos *gate* a *gate*; semáforo con el peor color de seis ejes, sin dato nunca es verde. | Documento 14 |
| R8 | Implantación | "Alcance de implantación Lite/Enterprise" de la compañía, distinto de la intensidad de cada iniciativa. | Documento 90 |
| R9 | Medición | Fórmulas F1–F10 del documento 40. Único criterio económico de viabilidad: VAN ≥ 0 con horizonte y tasa fijados en C2, sobre beneficio neto; ROI y plazo de recuperación solo informativos. Caducidad orientativa de estados: validado 12 meses, declarado y estimado 6. La capacidad reasignada solo suma si evita un coste presupuestado; si va a una actividad nueva, cuenta por el resultado de esa actividad. | Documento 40 (01 §7.6 ajustado) |
| R10 | Riesgos y seguridad | 70 riesgos tipo RT (incluidos RT-ORG-07 a RT-ORG-09, procedentes de 50); controles SEG-01–20 y AG-01–20 con mínimos por autonomía; riesgos concretos `IA-AAAA-NNN · Rnn`; ámbito TER añadido a 01 §10. | Documentos 33, 35, 36 |
| R11 | Regulación | Reglamento (UE) 2026/1744 (ómnibus digital de IA, DOUE 24-07-2026): anexo III aplazado al 2-12-2027 y anexo I al 2-08-2028; art. 50 aplicable desde 2-08-2026; art. 73 sin cambios. Pendiente de cotejo con el texto del DOUE. | Documentos 34, 37 (consulta web 16-09-2026) |
| R12 | Personas, datos y operación | Indicadores provisionales PER, DAT, CNC (conocimiento, antes CON) y OPE consolidados en 41 con código IND- (tabla de correspondencia de 41 §21); riesgos RT-ORG y RT-DAT alineados con 33, que incorpora RT-ORG-07 a RT-ORG-09. Autonomía máxima en decisiones sobre personas: A1 en selección y evaluación, A0 en disciplina y despido. Cambios menor · significativo · sustancial con vuelta a *gate* (52). Tiempos de respuesta S1–S4 a confirmar en 37. Artículos del Reglamento citados en 50–52 sin verificar: contrastar con 34 y con el calendario de R11. | Documentos 50, 51, 52 |
| R13 | Viabilidad económica | Único criterio económico de viabilidad en G3: VAN ≥ 0 con horizonte y tasa fijados en C2 (40 §8.3; 01 §7.6). Los plazos de recuperación de 18 y 30 meses de 13 §7 son referencias informativas junto al horizonte de evaluación del VAN, no umbrales de G3. En 14 §4.3 el neto adicional por euro (y su múltiplo en el horizonte) es criterio de priorización y no impide pasar G3. Término único "vigilancia posterior a la comercialización" (EN: post-market monitoring). | Documentos 13, 14, 40; 01, 20, 32, 34, 36, 52 |
| R14 | Verificación No conforme y reincidencia | Si la verificación de un *gate* es No conforme, la solicitud vuelve al equipo sin decisión (01 §7.4, regla 2; 21 §10.2); el órgano no decide Iterar, Pivotar ni Parar sobre evidencias no verificadas, salvo que el equipo retire la solicitud y proponga parar (38 §8.2). Reincidencia: una no conformidad menor que se repite tres veces en doce meses en la misma iniciativa o proceso pasa a mayor (37 §3.3; 21 §10.5; 38 §8.1). Severidad S2 y S3 de 52 §7.2 alineada con 37 §4.2–4.3. | Documentos 21, 37, 38, 52 |
| R15 | Códigos con prefijo | En 12: preguntas IT-P1–IT-P5, señales IT-S1–IT-S8 y condiciones de declaración IT-D1–IT-D3. En 50: destinos de la capacidad liberada PER-D1–PER-D5 y perfiles de alfabetización PER-PA–PER-PF. Se mantienen S1–S4 (severidad), D1–D7 (madurez) y P01–P31 (plantillas). 23 §7.1 remite a la correspondencia de 23 §10.5 entre los tres estados de la capacidad y los cinco destinos. En inglés: "materialisation" para la señal 3 y F5, "realisation" para F10. | Documentos 02, 12, 13, 23, 40, 50 |
| R16 | Compatibilidad y modularidad | Todos los documentos que describan método, herramienta o práctica deben explicitar que SEVEN-G es compatible con marcos y consultoría preexistentes, y que puede adoptarse completo o por componentes sin perder coherencia si se mantienen trazabilidad, verificación y responsabilidades. | Documentos 00, 01, 02 y sucesivos |
