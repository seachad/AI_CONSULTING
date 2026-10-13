# S9 · Calibración y criterios de salida a la versión 1.0

| Campo | Valor |
|---|---|
| Fecha | 01-10-2026 |
| Plan | [20261001_Plan_sprints_feedback_evolucion_SEVEN-G.md](20261001_Plan_sprints_feedback_evolucion_SEVEN-G.md), sprint S9 |
| Estado | **Propuesta** a validar por el autor; la calibración espera a los datos de S8 |

## 1. Umbrales a calibrar con datos de pilotos

| Umbral | Dónde vive | Valor de partida | Con qué dato se calibra |
|---|---|---|---|
| Índice de transformación (señales y perfiles) | 12 §4.5; T14 (versión de umbrales 0.1) | v0.1 | Cálculos de T14 de las compañías piloto |
| Umbral Express | 13 §6; `meta.configuracion.umbral_express` | Ilustrativo | Inversión de las iniciativas Express del piloto |
| Objetivos de coste del gobierno | 13 §6; `objetivo_coste_gobierno_pct` | 5 / 10 / 15 % | IND-COS-13 por intensidad |
| Mínimos exigibles por huella | 11 §7.6; `lentes.json` (D133) | v0.4 | Diagnósticos T15 y huella T01 |
| Umbral de adopción de transversales | 40 §7.2 (D63) | 60 % | Informes de uso de los pilotos |
| Frenos de escalado | 60 §10.4; `frenos_escalado` (D126) | Madurez ≤ 2; 12 meses | Lectura del panel frente a lo que el consejo decidió |
| Realización | IND-VAL-14 (D135) | 90 / 70 % | Planes de realización con valor realizado |
| Renovación de la alfabetización | IND-ADO (D69) | ≥ 90 % | Registros de formación |

Regla: un umbral recalibrado es una **versión nueva** del umbral, con fecha y motivo; los cálculos anteriores conservan la versión con la que se hicieron (como T14).

## 2. Criterios de salida a la 1.0 (propuesta)

| # | Criterio | Cómo se comprueba |
|---|---|---|
| 1 | **Núcleo estable**: N-01 a N-14 sin cambios en dos revisiones C5 consecutivas | Versión del núcleo (01 §14.1) sin cambio en el registro de decisiones |
| 2 | **Proporcionalidad demostrada**: Express y Lite con coste del gobierno dentro de su objetivo en al menos **3** iniciativas reales cada una | IND-COS-13 de los registros anonimizados |
| 3 | **Crosswalk revisado por un tercero** (auditor de ISO/IEC 42001 o jurista) | Nota de revisión archivada; versión de `crosswalk.json` actualizada |
| 4 | **Revisión jurídica** de P47, P48, P49, P51, P56 y P74 y de 93 §11 | Pendientes ya registrados (D68, D112, D113) cerrados |
| 5 | **Casos reales publicados**: al menos **2** casos anonimizados en el documento 92 o en la galería | Plantilla de S8_Instrumentos §2 con autorización |
| 6 | **Umbrales calibrados**: todos los de la sección 1 con al menos una recalibración con datos reales | Versión de cada umbral distinta de la de partida, o decisión expresa de mantenerla |
| 7 | **Sin pendientes críticos** en la verificación de coherencia y en la vigilancia de fuentes (D117) | `verificar_coherencia.ps1` en verde; ninguna fuente «corregir» |
| 8 | **Decisiones «a validar» resueltas** (D19, D20, D22, D25 y las que el registro marque así) | Estado «Vigente» sin la marca «a validar» |

Las cifras en negrita (3 y 2) son una propuesta: el autor decide si se mantienen.

## 3. Al pasar a la 1.x

1. Retirar «Versión en revisión: no difundir» (D58) de la portada (ES/EN), de los documentos 00 de SEVEN-G y SPHERES, del índice que escribe `build.ps1` y su comprobación de `verificar_coherencia.ps1` (lista completa en CLAUDE.md, «Pendientes»).
2. Cambiar la versión del marco en el documento 04 §2.3 y en las portadas.
3. Revisar el presupuesto de contenido (D143): deja de aplicar o se renueva con otra regla.
4. Registrar la decisión de salida en el registro de decisiones con la evidencia de cada criterio.
