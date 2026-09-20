# Análisis de la metodología SPAD: completitud y cambios propuestos

**Revisión de los documentos de trabajo de SPAD (`SPAD/Documents`) con los criterios de SEVEN-G, para decidir qué se mantiene, qué se corrige y qué falta antes de publicar la biblioteca completa**

| | |
|---|---|
| Documento | Documento de trabajo · Análisis de SPAD |
| Versión | 0.1 |
| Fecha | 18-09-2026 |
| Autor | Fernando García Varela (análisis preparado con asistencia de IA) |
| Estado | Aplicado el 19-09-2026 con las recomendaciones de Claude (D69): biblioteca 00–08 publicada; documentos de trabajo en `SPAD/_legacy/`. Quedan las decisiones de la sección 7 que solo el autor puede tomar (láminas e ilustraciones en inglés). No se publica. |

---

## 1. Conclusión

**El núcleo de SPAD está completo y es sólido**: separación entre pensar, validar, ejecutar y corregir; fases bloqueantes con artefactos; IA revisora independiente de la constructora; persona orquestadora con la última palabra; política de validación que descarta respuestas fuera de fase; contextos global y de proyecto; temas (*TOPIC*) para la trazabilidad; ciclos de legado, depuración, corrección urgente y seguridad; contratos de entrada y salida en JSON para agentes; y autoevaluación de conformidad.

**No está completo como metodología publicable**. Tiene tres tipos de carencias:

1. **Incoherencias internas** entre documentos (numeración de fases, nombre, veredictos, bucle de corrección, autoevaluación).
2. **Contenido que contradice decisiones registradas** de SEVEN-G (cifras sin respaldo, "certificación", SPAD presentado como parte de SEVEN-G u obligatorio dentro de él, dos idiomas mezclados, tono comercial).
3. **Huecos de método** que importan precisamente en los casos para los que SPAD se recomienda: validación humana sin registro propio, sistemas que incluyen IA en producción (no solo código escrito por IA), trazabilidad del modelo usado, cadena de suministro y licencias, datos enviados a proveedores de modelos, versión reducida (Lite) y métricas del propio proceso.

La página de entrada publicada (documento 00) ya aplica las correcciones de los tipos 1 y 2 en lo que presenta; el resto se propone en la sección 5. **Actualización del 19-09-2026:** se ha aplicado todo lo propuesto en las secciones 3, 4, 5 y 6 salvo el hueco 12 (validador de artefactos: especificado en el documento 07 §6, herramienta pendiente) y las decisiones 6 de la sección 7 (regenerar láminas e ilustraciones en inglés), que requieren al autor.

---

## 2. Material revisado

| Documento | Contenido | Valoración |
|---|---|---|
| `0 - SPAD_Metodologia_Operativa.md` (ES) | Fases 0–10, roles, ciclos, contextos, temas, validación, habilidades, diagramas, reglas. | **Base canónica.** Numeración coherente con su diagrama. |
| `00_SPAD_Executive_Summary.md` (EN) | Resumen comercial. | Tono de venta; cifras ya matizadas como hipótesis; sectores "ideales" sin fuente. |
| `01_SPAD_Prompt_Pack.md` y `06 _SPAD_02_Prompt_Pack.md` (EN) | Instrucciones por fase. | **Duplicados** (v2 y v1.0). Conservar uno. |
| `02_SPAD_Agent_Ready_IO.md` (EN) | Contratos JSON de cada fase. | Muy útil; convertir en esquemas JSON validables (herramienta). |
| `03_SPAD_Skills_Map.md` y `09_SPAD_Derived_Skills.md` (EN) | Habilidades derivadas (agentes, riesgo, FinOps). | **Solapados.** Unificar; hoy son listas sin método. |
| `04_SPAD_Context_Management.md` (EN) | Contextos, temas, numeración de artefactos. | Bueno. Un punto a corregir (sección 3, fila 6). |
| `05_SEVENG_SPAD_Validation_Policy.md` (EN) | Política de validación. | **El mejor documento.** Nombre de fichero a corregir (no es de SEVEN-G). |
| `05_SPAD_Skill_Methodology_Seachad.pdf` | PDF breve antiguo. | Sustituido por los anteriores. Pasar a `_legacy`. |
| `07_SPAD_03_Flow_Diagram.md` (EN) | Diagramas Mermaid. | Correcto; integrar en la guía operativa. |
| `08_SPAD_Skill_Official_EN.md` (EN) | Definición de la habilidad oficial. | **Numeración de fases errónea** (sección 3, fila 1). |
| `10_SPAD_Web_Landing.md` (EN) | Textos para una web. | Presenta SPAD como "habilidad central de SEVEN-G" (contra D09). Sustituido por el documento 00. |
| `11_SPAD_Compliant_Certification.md` (EN) | Autoevaluación de conformidad. | Bien reformulada; requisitos desfasados (sección 3, fila 5). |
| `SPAD_AI_Engineering.pdf` | Presentación ilustrada (14 láminas). | Nueve láminas se publican en el documento 00; cinco no (sección 4). |

---

## 3. Incoherencias internas

| # | Incoherencia | Dónde | Propuesta |
|---|---|---|---|
| 1 | **Numeración de fases distinta.** La guía operativa: 0 Contexto, 1 PLAN, 2 revisión del plan, 3 guía de código, 4 estrategia de pruebas, 5 implementación, 6 pruebas, 7 revisión de pruebas, 8 revisión de código, 9 correcciones, 10 versión. La habilidad oficial repite "IMPLEMENTATION" en las fases 4 y 6, pone la estrategia de pruebas después de implementar y termina en la 11. La autoevaluación usa la numeración antigua (4 implementación, 5 revisión de código, 6 correcciones). | 0, 08, 11 | **Numeración canónica = guía operativa** (la que usan el documento 00 y la lámina del flujo bloqueante). Corregir 08 y 11. |
| 2 | **Nombre.** "Structured Prompt-Driven Engineering" frente a "Structured Prompt-Driven AI Engineering". | README, 00 frente a 0, 08, SEVEN-G 53 | Fijar **Structured Prompt-Driven Engineering** (lo usan la guía, la habilidad y SEVEN-G). |
| 3 | **Tres vocabularios de veredicto**: GO / GO+CHANGES / NO-GO (plan), GO / NO-GO (pruebas), OK / ISSUES (código). | 0, 02 | Un único vocabulario **GO · GO con cambios · NO-GO** en todas las revisiones, con la fase de retorno definida para cada una. |
| 4 | **Bucle de corrección**: el diagrama devuelve las correcciones a la implementación; el contrato JSON de correcciones indica volver a la revisión de código. | 0, 07, 02 | Correcciones → **revisión de código** (y de pruebas si cambian), no reimplementación completa: es coherente con "correcciones mínimas". |
| 5 | **Autoevaluación** exige solo los artefactos 0–6 antiguos: no pide estrategia de pruebas, pruebas, revisión de pruebas, versión ni revisión de seguridad. | 11 | Alinear la lista de artefactos obligatorios con el ciclo canónico y con los ciclos complementarios aplicados. |
| 6 | **Excepciones al contexto global aprobadas por una IA** ("AI Reviewer approval needed"), cuando el principio es que la persona tiene la última palabra. | 04 | La IA revisora **evalúa** la excepción; la **aprueba** la persona orquestadora (y, en SEVEN-G, queda en la evidencia de la fase). |
| 7 | La **guía de código** (CODE_PRIMER) no aparece en la habilidad `new_feature`. | 0, 08 | Incluirla. |
| 8 | **Roles no listados**: IA analista, IA de operación (SRE) e IA revisora de seguridad aparecen en los ciclos pero no en la tabla de roles. | 0, 08 | Tabla de roles completa, con la regla de separación aplicada también a ellos. |
| 9 | **Dos idiomas mezclados** y ficheros con nombres irregulares (`0 - `, `06 _`, `05_SEVENG_`). | Todos | Reescribir como biblioteca ES/EN con la convención de SEVEN-G (`NN_SPAD_<Titulo>.md`). |

---

## 4. Contenido que contradice decisiones registradas

| Contenido | Decisión | Tratamiento |
|---|---|---|
| Cifras de mejora y retorno: "60–80 % de retrabajo", "−70 % retrabajo", "−60 % incidentes", "+200 % cobertura", "30–40 % más rápido", *break-even* en 3–4 semanas. | D35, D41 | **Retiradas.** Se formulan como hipótesis a medir por cada organización (documento 00, sección 10). Las láminas 2 (solo se publica su gráfica conceptual) y 12 no se usan. |
| "Certificación SPAD-Compliant™", "estándar de oro", "obligatorio para entornos financieros y de salud", "evidencia para SOC 2, PCI-DSS o HIPAA". | D25, D41 | **Retirado.** Solo autoevaluación de conformidad. Lámina 13 no se usa. |
| SPAD como "habilidad central" o "metodología SPAD de SEVEN-G"; "SPAD es obligatorio dentro de SEVEN-G cuando…". | D09, SEVEN-G 53 §2 | **Corregido**: metodología independiente; SEVEN-G recomienda SPAD u otro método equivalente (53 §2.3). Lámina 1 no se usa; corregir 08 §3 y 10. |
| Tiempos fijos: "PLAN simplificado 15–30 min", "vigilancia 30 min", "2–5 horas", rutas de implantación por semanas. | D35 | **Retirados** del texto publicado. Proponer que sean **parámetros del contexto global** (plazos máximos de la corrección urgente y de la vigilancia posterior). Láminas 10 y 14 no se usan. |
| Umbrales fijos: cobertura del 80 %, tasa de invalidación > 30 %, tres intentos, vigencia de doce meses. | Criterio de SEVEN-G ("a calibrar") | Presentarlos como **valores de partida del contexto global, a calibrar**. |
| "IA-Auditor" en las láminas 5 y 6. | D23 | Se publican con una nota: en la ilustración, «IA-Auditor» es la IA revisora. **Propuesta:** regenerar esas láminas con el nombre correcto. |
| "Generated with assistance from ChatGPT / GitHub Copilot"; marca de NotebookLM en las láminas. | Estilo SEVEN-G | Pie común del sitio ("Contenido generado y maquetado con apoyo de IA bajo supervisión editorial de SEACHAD"). Marca recortada de las láminas. |
| Licencia: "propiedad intelectual de Seachad; la redistribución pública requiere permiso". | D07 y decisión del autor (18-09-2026) | **Sustituida** por la de SEVEN-G: CC BY 4.0 y MIT (README y documento 00). |

---

## 5. Huecos de método y cambios propuestos

| # | Hueco | Por qué importa | Propuesta |
|---|---|---|---|
| 1 | **La validación humana no deja registro propio.** La política de validación es el control clave, pero no existe un artefacto que diga quién validó cada salida, cuándo y con qué resultado. | Sin ese registro, la trazabilidad solo prueba lo que hizo la IA, no el control humano; en SEVEN-G las evidencias exigen autor humano, fecha y versión (01 §7.2). | **Registro de validación por fase** (persona, fecha, resultado, invalidaciones y motivo), dentro del tema. Añadirlo a los contratos JSON y a la autoevaluación. |
| 2 | **Trazabilidad del modelo.** No se registra qué modelo, versión, parámetros ni instrucciones produjeron cada artefacto. | Sin ello no se puede reproducir un resultado ni explicar un cambio de comportamiento cuando cambia el proveedor. | Campo obligatorio `modelo` (proveedor, nombre, versión, fecha, instrucciones usadas) en todos los artefactos. |
| 3 | **Revisión humana del código.** SPAD confía la revisión técnica a una IA y la validación de proceso a una persona. SEVEN-G 53 §7.1 exige revisión humana significativa del código en ciertos casos. | Sin revisión humana, dos IA pueden coincidir en el mismo error. | Regla: en intensidad Enterprise, código sensible o cambios con efecto sobre personas, dinero o producción, **revisión humana del código** además de la IA revisora. |
| 4 | **Sistemas que contienen IA** (no solo código escrito con IA): instrucciones en producción, agentes, recuperación de información, evaluación del comportamiento del modelo, inyección de instrucciones. | Es el caso de mayor riesgo y SPAD solo lo trata como "habilidad derivada" sin método. | **Ciclo o fase de evaluación del comportamiento de la IA** (conjuntos de prueba, criterios de aceptación, pruebas adversarias) y revisión de seguridad con el OWASP Top 10 para aplicaciones con modelos de lenguaje; nivel de autonomía A0–A3 del agente en el plan (SEVEN-G 35). |
| 5 | **Datos y confidencialidad frente al proveedor del modelo.** No se regula qué código, datos o secretos pueden enviarse al modelo. | Riesgo de fuga de datos personales, secretos o propiedad intelectual. | Sección obligatoria en el contexto global: clasificación de lo que puede enviarse a cada proveedor y entorno autorizado (SEVEN-G 53 §7.6). |
| 6 | **Cadena de suministro y licencias.** No se revisan dependencias añadidas ni el origen o la licencia del código generado. | Vulnerabilidades heredadas y riesgos de propiedad intelectual. | En la revisión de código: dependencias nuevas justificadas, análisis de vulnerabilidades y licencias, e inventario de componentes (SEVEN-G 53 §7.5). |
| 7 | **Despliegue y operación.** La versión incluye reversión y vigilancia como notas, pero no hay entrega a operación. | El código "estable" no es un sistema operado. | Fase o salida de **entrega a operación**: plan de despliegue, reversión probada, vigilancia y responsable (enlaza con SEVEN-G 52 y P19). |
| 8 | **Escala de severidades propia** (CRITICAL/HIGH/MEDIUM/LOW) y **aceptación de riesgo residual** sin decir quién acepta. | Choca con el riesgo P×I y las severidades S1–S4 de SEVEN-G; aceptar riesgos no puede decidirlo una IA. | Tabla de correspondencia con SEVEN-G y regla: el riesgo residual lo acepta la persona con autoridad según el nivel (SEVEN-G 33). |
| 9 | **Versión reducida (Lite).** SPAD aplica todas las fases siempre; SEVEN-G 53 §4.3 ya define una versión reducida. | Sin ella, los equipos se saltan SPAD en los casos pequeños. | **SPAD Lite** en la guía: fases fusionables y artefactos mínimos para iniciativas Lite, sin perder la revisión independiente. |
| 10 | **Métricas del propio proceso.** No hay indicadores para saber si SPAD funciona. | Las mejoras que SPAD promete deben medirse, no afirmarse. | Indicadores: tasa de invalidación por fase y modelo, tasa de NO-GO, iteraciones hasta GO, tiempo por fase, defectos escapados a producción, cobertura real frente a la exigida. |
| 11 | **Habilidades derivadas sin método** (agentes, riesgo, FinOps). | Hoy son listas de temas. | Mantener solo la de diseño de agentes, desarrollada con el hueco 4; las de riesgo y FinOps se cubren con SEVEN-G (33, 42). |
| 12 | **Herramientas.** Los contratos JSON no se validan automáticamente. | La validación de "artefactos incompletos" puede automatizarse. | Herramienta sin servidor, al estilo de T01: validador de artefactos SPAD frente a sus esquemas JSON y generador del registro del tema. |

---

## 6. Biblioteca propuesta

Misma jerarquía y estilo que SEVEN-G y SPHERES (`SPAD/mds|html|pdf/<idioma>`), en español e inglés:

| Nº | Documento | Origen |
|---|---|---|
| 00 | Qué es SPAD y para qué sirve | **Publicado** (18-09-2026). |
| 01 | Guía operativa: fases, roles y veredictos | 0 (base), 07, 08 corregidos; SPAD Lite (hueco 9). |
| 02 | Contextos, temas y registro de artefactos | 04, con los huecos 1, 2 y 5. |
| 03 | Política de validación | 05, con el registro de validación (hueco 1). |
| 04 | Ciclos complementarios: legado, depuración, corrección urgente y seguridad | 0 §4.2–4.5, con los huecos 6, 7 y 8. |
| 05 | Sistemas que incluyen IA: evaluación de comportamiento y agentes | Nuevo (huecos 4 y 11). |
| 06 | Instrucciones por fase | 01 (se descarta 06 por duplicado). |
| 07 | Contratos de entrada y salida | 02, como esquemas JSON (hueco 12). |
| 08 | Autoevaluación de conformidad y métricas del proceso | 11 corregido (fila 5) y hueco 10. |

Documentos que pasan a `SPAD/_legacy/`: `00_SPAD_Executive_Summary.md`, `05_SPAD_Skill_Methodology_Seachad.pdf`, `06 _SPAD_02_Prompt_Pack.md`, `09_SPAD_Derived_Skills.md`, `10_SPAD_Web_Landing.md` y, una vez integrados, el resto.

---

## 7. Decisiones que se piden al autor

1. Confirmar la **numeración canónica** de fases (guía operativa, 0–10) y el nombre *Structured Prompt-Driven Engineering*.
2. Confirmar el **vocabulario único de veredictos** (GO · GO con cambios · NO-GO).
3. Aprobar la **revisión humana del código** obligatoria en los casos del hueco 3.
4. Decidir si SPAD incorpora un **ciclo para sistemas que incluyen IA** (hueco 4) o si se deja en SEVEN-G 35.
5. Aprobar la **biblioteca propuesta** (sección 6) y el paso de los documentos de trabajo a `_legacy`.
6. Decidir si se **regeneran las láminas 5 y 6** con «IA revisora» y si se crean versiones en inglés de las ilustraciones.
