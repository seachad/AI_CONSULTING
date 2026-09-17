# SEVEN-G · Análisis del estado actual, huecos y plan documental

| | |
|---|---|
| Tipo | Documento de trabajo interno |
| Fecha | 16-09-2026 |
| Versión | 0.2 |
| Objetivo | Inventariar lo que existe, identificar incoherencias y huecos, y proponer la biblioteca completa de documentos de SEVEN-G para su uso por cualquier empresa. |

> Documento interno. No incluye datos de clientes. Las experiencias reales se citan de forma anonimizada.

---

## 1. Inventario de lo que existe

### 1.1 Materiales de SEVEN-G en este repositorio

Desde el 16-09-2026 todos estos materiales están en `SEVEN-G/_legacy/`.

| Material | Idioma | Contenido real | Aprovechamiento |
|---|---|---|---|
| `SEVEN-G_Document_1_Foundational_Methodology.pdf` | EN | Resumen sustantivo (~600 palabras): 6 principios, ciclo Stage-Gate, fases 0–7, 6 roles, separación de funciones, 7 categorías de riesgo, versiones Lite/Enterprise, madurez 0–5. | **Base conceptual canónica.** Desarrollar. |
| `SEVEN-G_Document_9_Phase_Gate_and_Audit_Criteria` (normal y *Expanded*) | EN | Sustantivo: criterios por fase, 21 artefactos obligatorios, validación dual, reglas de aprobación. | **Base del ciclo de vida.** Fusionar ambas versiones. |
| Documents 2, 3, 4, 5, 6, 10, 11, 12 | EN | Esqueletos de una página (1,8–2,1 KB): solo alcance e índice. | Estructura aprovechable; contenido por escribir. |
| Documents 7 y 8 | — | No existen en PDF. El índice del Master Pack los nombra (Charter y Engagement Guide). | Existen versiones `.md` con otro modelo de fases. |
| `SEVEN-G_Master_Print_Pack.pdf` | EN | Portada e índice de 12 documentos. | Sustituir por el índice de la nueva biblioteca. |
| `SEVEN-G_IA_for_Hypergrowth.pdf` | ES | 15 diapositivas generadas con NotebookLM que resumen los docs 1, 9, 11, 12. Contiene defectos visibles (instrucciones de estilo impresas, erratas). No trata de hipercrecimiento. | No entregable. Rehacer como presentación del marco. |
| `Documents Framework/*.md` (8 ficheros) | EN | Plantillas largas con ejemplos ficticios (empresa manufacturera de EE. UU., caso de predicción de abandono). Usan un modelo distinto: acrónimo Strategy-Exploration-Validation-Execution-Navigation-Governance. Numerosas incoherencias numéricas. | Material reutilizable **tras reescritura**: Risk Matrix (el más sólido), GO/NO-GO Decision Record, Charter, Maturity Report, Runbook. Value Hypothesis Canvas es un esqueleto. |
| `SPHERES/_legacy/SEVENG - Marco_Esferas_IA_v2.pptx` | ES | 9 esferas × 3 niveles, preguntas al consejo, guion de 60 minutos, plan de 90 días. No menciona SEVEN-G. | **Componente A del marco.** Integrar. |
| `SPAD/` | ES/EN | Metodología de ingeniería de software asistida por IA, con roles de IA, fases y política de validación. Se declara "skill fundacional de SEVEN-G". | Pieza complementaria para las fases 4–5 cuando la solución se construye con IA. Enlaces internos rotos. |

### 1.2 Materiales externos relacionados

| Material | Aprovechamiento |
|---|---|
| Repositorio `AI_en_el_consejo` (motor de panel, 11 demostraciones sectoriales, registro de recomendaciones, esquema JSON, licencias MIT / CC BY 4.0) | **Componente D.** Aporta las reglas de medición, la etiqueta de ambición, la separación eficiencias / retorno, la agilidad por riesgo y ambición, la exposición a IA ofensiva y los controles de agentes. |
| Aplicación práctica en un consejo asesor de tecnología de un grupo asegurador (2026) | Validó el uso de esferas × niveles como lente de análisis sobre documentos reales, y generó artefactos reutilizables: hipótesis de valor por caso, 4 *gates* con decisor y evidencia, firma multinivel de puesta en producción con veto, criterios de control de intención de agentes, exigencia a terceros en 3 niveles, riesgo residual P×I, madurez por dimensiones con evidencia, semáforo de programas. **No trasladar datos, nombres, cifras ni rasgos reconocibles del cliente.** |
| Nota interna sobre publicación (15-09-2026) | Criterios para publicar cada pieza: responde a una decisión concreta de un consejo, tiene un artefacto usable, se prueba con datos ficticios en menos de 10 minutos y no exige contratar al autor. Riesgo de dispersión de marca. |
| AECF (`C:\SEACHAD\AECF_MCP`) | Asociado a gobierno ágil de la IA y a AIFlow. Relación con SEVEN-G por definir. |

---

## 2. Incoherencias que hay que resolver

### 2.1 Qué es SEVEN-G (cuatro definiciones)

| Fuente | Definición |
|---|---|
| Doc 1 y Master Pack | *Seven-Phase Enterprise Value & Governance Framework for AI*, con 8 fases (0–7). |
| Engagement Guide y Charter | Acrónimo **S**trategy, **E**xploration, **V**alidation, **E**xecution, **N**avigation + **G**overnance (6 o 5 fases). |
| Presentación NotebookLM | Marco de Gobernanza y Valor Empresarial para IA. |
| SPAD (landing) | Marco de ingeniería basado en *skills*. |

**Propuesta adoptada en el documento 00 (pendiente de confirmar):** SEVEN-G = *Seven-phase Enterprise Value & Governance*. La fase 0 es habilitante (autorización) y las fases 1–7 son las siete fases de valor; la G expresa el gobierno transversal. Se abandona el acrónimo S-E-V-E-N-G, pero sus contenidos útiles (modelos de engagement, criterios de priorización, KPIs) se reubican.

### 2.2 Otras incoherencias

| Tema | Variantes encontradas | Propuesta |
|---|---|---|
| Número y nombre de fases | 8 (0–7), 6, 5 con meses; *Validation* = PoC o MVP según documento; *Navigation* = optimización o despliegue. | Fases 0–7 del Doc 1 en español (tabla del documento 00). |
| Resultados de *gate* | Validate/Iterate/Pivot/Stop; GO/ITERATE/STOP; GO/GO with conditions/DEFER/NO-GO; Pass/Conditional/Fail; APPROVED/…; GO/ITERATE/NO-GO. | Continuar / Continuar con condiciones / Iterar / Pivotar / Parar; en fase 7 Escalar / Iterar / Retirar. Auditoría: Conforme / Conforme con observaciones / No conforme. |
| Madurez | 0–5 con 4 o 5 métricas (Doc 1, Doc 5); 1–5 con 7 dimensiones y nombres CMMI (Maturity Report); 1–5 por esfera (plan de 90 días). | Escala 0–5 con rúbrica y evidencia por dimensión; nivel global = mínimo ponderado, no media simple. Por decidir las dimensiones definitivas. |
| Categorías de riesgo | 7, 6, 4 y 5 según documento. | 7 del Doc 1 + extensión específica de IA generativa, agentes y seguridad. |
| Roles | 6 roles normativos; roles de consultora; en SPAD "AI Auditor" es un modelo de lenguaje. | 6 roles normativos + órganos corporativos. En SPAD renombrar el rol de IA (p. ej. "IA revisora") para no colisionar con el Auditor de IA humano. |
| ROI | Cuatro umbrales y dos fórmulas distintas. | Sustituir por las reglas de medición (neto anual, neto adicional por euro). Si se usa ROI, fórmula única sobre beneficio neto. |
| Esferas 08 y 09 | Usan otros niveles; en la aplicación práctica se mezclaron. | Regla explícita (documento 00, §4.1). |
| Ámbito geográfico | Plantillas con dólares, CCPA, HIPAA. | Euros, normativa europea y española como referencia; anexos para otras jurisdicciones. |
| Nombres de marca | SEVEN-G, SevenG, SEVENG, SPHERES, Marco de Esferas. | Paraguas único **SEVEN-G**; "Mapa de esferas" como componente. SPAD y AECF como piezas relacionadas, no marcas paralelas. |
| Idioma | PDFs normativos en inglés, material de consejo en español. | Por decidir: español como versión maestra y traducción posterior al inglés. |
| Cifras sin respaldo | "50+ engagements", "benchmark de 200+ organizaciones", "↓70 % retrabajo", porcentajes de ROI. | Eliminar todas las afirmaciones no demostrables. |

---

## 3. Huecos detectados

### 3.1 Huecos estructurales (fases y niveles)

1. **Falta el nivel compañía.** Todo el material existente gobierna *iniciativas*. No hay un ciclo en el que el consejo y la dirección diagnostiquen, fijen la ambición y el apetito de riesgo, gestionen la cartera, supervisen y revisen. **Propuesto en el documento 00 como ciclo corporativo C1–C5.**
2. **Falta la distinción entre eficiencia y transformación.** Ningún documento normativo la aborda; el Charter incluso excluye la transformación de su alcance y los filtros de ROI de las fases 1 y 3 penalizan las apuestas transformadoras. Solo el Mapa de esferas y el panel del consejo la esbozan. **Propuesto en el documento 00: clasificación de ambición con 5 preguntas, criterios de gate diferenciados e índice de transformación con 8 señales y 5 perfiles.** Faltan umbrales y calibración.
3. **La retirada no tiene procedimiento.** Existe como resultado de la fase 7, pero no hay criterios, responsables ni registro de retiradas (con sustituto y lecciones aprendidas).
4. **No hay criterios para elegir Lite o Enterprise.** Propuestos de forma preliminar en el documento 00.
5. **No hay tratamiento de la IA que no es un proyecto**: IA embebida en software de terceros, suites de productividad con IA, uso individual por empleados y *shadow AI*. Hoy quedan fuera del ciclo 0–7 y son una parte creciente del riesgo y del gasto.
6. **Falta una fase o subproceso de adopción y cambio.** La fase 5 valida el valor, pero no hay un tratamiento explícito de la adopción real, la reasignación de capacidad liberada y la formación, que son condición para que el valor se materialice.

### 3.2 Huecos temáticos

| Tema | Situación actual | Por qué importa |
|---|---|---|
| **IA generativa y agentes** | El material existente está pensado para ML clásico (precisión, deriva). | Evaluaciones, alucinaciones, inyección de instrucciones, identidad y permisos de agentes, control de intención, interruptor de parada, validación humana de acciones. |
| **Seguridad e IA ofensiva** | Solo en el panel del consejo. | Ataques que usan IA y agentes propios manipulados son ya una fuente real de brechas notificadas. |
| **Inventario y clasificación regulatoria** | No existe. | Obligación de facto para aplicar el Reglamento de IA. |
| **Mapeo regulatorio** | Doc 12 es un esqueleto; solo una mención al Reglamento de IA en todo el framework. | Falta: artículos del Reglamento de IA (incluida alfabetización, art. 4; transparencia, art. 50; incidentes graves), ISO/IEC 42001, NIST AI RMF, RGPD, DORA, NIS2, normativa sectorial. |
| **Terceros y proveedores de IA** | Menciones sueltas. | Dependencia tecnológica, contratos, uso de datos por el proveedor, registro de terceros críticos. |
| **Costes de IA (FinOps)** | No existe. | Coste por caso con reparto analítico de licencias, consumo de modelos y cómputo; es necesario para calcular el neto. |
| **Datos y conocimiento** | Esferas 05 y 06 sin indicadores. | La preparación de los datos es la principal causa de retraso y fracaso. |
| **Personas** | Esfera 03 sin indicadores; riesgo de desplazamiento mencionado de pasada. | Reasignación de capacidad, nuevos roles, formación, relaciones laborales, comunicación. |
| **Indicadores por esfera** | Hay métricas fuertes para gobierno, regulación y decisión; faltan para cliente, producto, conocimiento y datos. | Sin ellas el mapa de esferas no se puede medir. |
| **Madurez** | Sin rúbrica, sin cuestionario, sin evidencias por nivel. | Es el primer entregable de cualquier implantación. |
| **Guía de conversación con el consejo** | Existe en material de candidatura, no generalizada. | Lenguaje, formato de respuesta ("Sí, con una condición"; "Todavía no, porque falta X"), número de casos a presentar. |
| **Casos de aplicación** | Solo ejemplos ficticios incoherentes. | Credibilidad del marco. Deben ser anonimizados o ficticios coherentes con las demostraciones. |
| **Uso del marco por terceros** | No definido. | Licencia de contenidos, condiciones de uso por consultoras, posible certificación. |

---

## 4. Biblioteca documental propuesta

Estado: **Nuevo** (no existe), **Reescribir** (existe material aprovechable), **Integrar** (existe fuera de SEVEN-G), **Hecho v0.1**.

### A · Fundamentos

| Nº | Documento | Fuente | Estado |
|---|---|---|---|
| 00 | Qué es SEVEN-G y para qué sirve | Todo el material | Hecho v0.1 (ES/EN) |
| 01 | Metodología fundacional (modelo completo, principios, niveles, componentes) | Doc 1, Doc 9 | Hecho v0.1 (ES/EN) |
| 02 | Glosario y convenciones (términos, escalas, resultados de *gate*, nomenclatura) | Todos | Hecho v0.1 (ES/EN) |
| 03 | Herramientas y registro de iniciativas (catálogo, modelo de datos, embudo) | Panel del consejo, experiencia práctica | Hecho v0.1 (ES/EN) |

### B · Estrategia y cartera (nivel compañía)

| Nº | Documento | Fuente | Estado |
|---|---|---|---|
| 10 | Mapa de esferas y niveles de ambición (con indicadores por esfera) | Marco de Esferas v2 | Hecho v0.1 (ES/EN) |
| 11 | Modelo de madurez: dimensiones, rúbrica 0–5, cuestionario, evidencias | Doc 5, Maturity Report | Hecho v0.1 (ES/EN) |
| 12 | Índice de transformación: criterios de ambición, señales, perfiles, umbrales | Documento 00, panel del consejo | Hecho v0.1 (ES/EN) |
| 13 | Tesis de IA, ambición y apetito de riesgo (plantilla para el consejo) | — | Hecho v0.1 (ES/EN) |
| 14 | Gestión de cartera: priorización, equilibrio de ambición, revisión y retirada | Engagement Guide (priorización), panel | Hecho v0.1 (ES/EN) |

### C · Ciclo de vida de la iniciativa

| Nº | Documento | Fuente | Estado |
|---|---|---|---|
| 20 | Manuales de fase 0–7 (objetivo, entradas, actividades, roles, evidencias, errores frecuentes) | Doc 3, Doc 9, Engagement Guide | Hecho v0.1 (ES/EN) |
| 21 | Criterios de *gate* y de auditoría, con variantes Lite/Enterprise y por nivel de ambición | Doc 9 (ambas versiones), GO/NO-GO Record | Hecho v0.1 (ES/EN) |
| 22 | Listas de verificación por *gate* | Doc 10 | Hecho v0.1 (ES/EN) |
| 23 | Adopción y cambio en la iniciativa (capacidad liberada, formación, comunicación) | Engagement Guide (ADKAR) | Hecho v0.1 (ES/EN) |

### D · Gobierno, riesgo y cumplimiento

| Nº | Documento | Fuente | Estado |
|---|---|---|---|
| 30 | Modelo de gobierno: órganos, roles, separación de funciones, RACI por fase, escalado | Doc 1, Doc 4, Charter | Hecho v0.1 (ES/EN) |
| 31 | Política corporativa de IA y política de uso aceptable (incluye *shadow AI* y alfabetización) | — | Hecho v0.1 (ES/EN) |
| 32 | Inventario de sistemas de IA y clasificación regulatoria | Panel (esquema) | Hecho v0.1 (ES/EN) |
| 33 | Metodología de riesgos de IA: matriz, registro, riesgos tipo (incluye generativa y agentes) | Risk Matrix, Risk Register | Hecho v0.1 (ES/EN) |
| 34 | Mapeo regulatorio: Reglamento de IA, ISO/IEC 42001, NIST AI RMF, RGPD, DORA, NIS2 | Doc 12 | Hecho v0.1 (ES/EN) |
| 35 | Seguridad de IA y agentes: IA ofensiva, identidad, permisos, control de intención, interruptor de parada | Panel, experiencia práctica | Hecho v0.1 (ES/EN) |
| 36 | Terceros y proveedores de IA: selección, contratos, exigencia en 3 niveles, dependencia | Experiencia práctica | Hecho v0.1 (ES/EN) |
| 37 | No conformidades, incidentes de IA y remediación | Doc 11, Runbook (incidentes) | Hecho v0.1 (ES/EN) |
| 38 | Marco de auditoría de IA | Doc 2 | Hecho v0.1 (ES/EN) |

### E · Medición y valor

| Nº | Documento | Fuente | Estado |
|---|---|---|---|
| 40 | Reglas de medición del valor | Panel del consejo | Hecho v0.1 (ES/EN) |
| 41 | Catálogo de indicadores con fórmula (por esfera, fase, nivel de ambición y compañía) | Charter, Maturity Report, panel | Hecho v0.1 (ES/EN) |
| 42 | Costes de IA y reparto por caso | Experiencia práctica | Hecho v0.1 (ES/EN) |
| 43 | Realización de beneficios: seguimiento, atribución, revisión posterior | Charter, Doc 9 (Value Realization Tracker) | Hecho v0.1 (ES/EN) |

### F · Personas, datos y operación

| Nº | Documento | Fuente | Estado |
|---|---|---|---|
| 50 | Personas y organización: roles, capacidades, reasignación, relaciones laborales | Esfera 03 | Hecho v0.1 (ES/EN) |
| 51 | Datos y conocimiento para IA: gobierno del dato, preparación, linaje | Esferas 05 y 06 | Hecho v0.1 (ES/EN) |
| 52 | Manual de operación de IA (ML clásico, generativa, agentes) | AI Ops Runbook | Hecho v0.1 (ES/EN) |
| 53 | Construcción de soluciones con IA (relación con SPAD) | SPAD | Hecho v0.1 (ES/EN) |

### G · Consejo

| Nº | Documento | Fuente | Estado |
|---|---|---|---|
| 60 | Paquete para el consejo: contenido, periodicidad, formato de decisión | Doc 6 | Hecho v0.1 (ES/EN) |
| 61 | Guía de conversación con el consejo: preguntas por esfera, lenguaje, guion de 60 minutos | Marco de Esferas, experiencia práctica | Hecho v0.1 (ES/EN) |
| 62 | Registro de recomendaciones y decisiones | Panel del consejo | Hecho v0.1 (ES/EN) |

### H · Plantillas (por iniciativa)

Carta de la iniciativa · Declaración de contexto y restricciones · Registro de asignación de roles · Cartera de oportunidades y notas de filtrado · Clasificación de ambición · Lienzo de hipótesis de valor · Línea base · Evaluación de viabilidad · Clasificación regulatoria y evaluaciones de impacto · Matriz y registro de riesgos · Plan de mitigación y contingencia · Registro de arquitectura · Linaje de datos y modelos · Diseño de gobierno y supervisión humana · Plan de reversión · Informe de entrega · Resultados de validación · Registro de decisión de *gate* · Firma de puesta en producción · Manual de operación · Configuración de monitorización · Plan de respuesta a incidentes · Seguimiento de realización de valor · Registro de decisión de escalado o retirada · Ficha de caso de uso.

Formato: Markdown como fuente, publicado en PDF y HTML. Las plantillas que lo requieran (por ejemplo, registros o calculadoras) se generarán además en Excel o PowerPoint cuando se indique expresamente.

### I · Herramientas

El catálogo completo de herramientas (22), el diseño del registro de iniciativas como embudo gestionado y el orden de construcción están en el **documento 03 · Herramientas y registro de iniciativas**. Existen ya, y hay que adaptarlas para alimentarse del registro, el panel de IA para el consejo (T17) y el registro de recomendaciones (T18) del repositorio `AI_en_el_consejo`.

### J · Adopción del marco

| Nº | Documento | Fuente | Estado |
|---|---|---|---|
| 90 | Guía de implantación de SEVEN-G: Lite y Enterprise, primeros 90 días | Doc 1, Marco de Esferas | Hecho v0.1 (ES/EN) |
| 91 | Guía para consultores y modelos de acompañamiento | Engagement Guide | Hecho v0.1 (ES/EN) |
| 92 | Casos de aplicación (ficticios coherentes o anonimizados) | Demostraciones | Hecho v0.1 (ES/EN) |
| 93 | Licencia, uso por terceros y citación | Licencias de `AI_en_el_consejo` | Hecho v0.1 (ES/EN) |

---

## 5. Decisiones adoptadas (16-09-2026)

| # | Tema | Decisión | Motivo |
|---|---|---|---|
| 1 | **Significado del nombre** | SEVEN-G = *Seven-phase Enterprise Value & Governance*: fase 0 habilitante, siete fases de valor y gobierno transversal. Se abandona el acrónimo Strategy-Exploration-Validation-Execution-Navigation-Governance. | Es la definición del documento fundacional y la única compatible con el ciclo de fases 0–7 y sus *gates*. |
| 2 | **Idiomas** | **Todos los documentos se generan siempre en español e inglés.** El español es la versión de redacción; la inglesa se actualiza en la misma entrega. | Decisión del autor (16-09-2026) para ofrecer el marco a compañías y consejos internacionales desde el principio. |
| 3 | **Formato y estilo** | Fuentes Markdown en `SEVEN-G/mds/es` y `SEVEN-G/mds/en`; salida en HTML (`SEVEN-G/html/<idioma>`) y PDF (`SEVEN-G/pdf/<idioma>`) con `SEVEN-G/build/build.ps1`, estilo de periódico económico en tonos salmón. Los HTML incluyen selector de tema, buscador de términos, navegador de secciones y selector de idioma. Diagramas propios de SEVEN-G como componentes reutilizables en `build/componentes/`; diagramas puntuales en Mermaid. PowerPoint o Excel solo cuando se pida expresamente. | Una sola fuente, dos salidas coherentes y diagramas consistentes entre documentos. |
| 4 | **Materiales antiguos** | Movidos a `SEVEN-G/_legacy/` (historial de git conservado). Se consultan como fuente al reescribir cada documento, pero no forman parte del marco vigente. | Evita que convivan dos modelos de fases, escalas y resultados de *gate*. |
| 5 | **Licencia** | Contenidos (documentos, plantillas, criterios, componentes gráficos): **CC BY 4.0** (`LICENCIA_CONTENIDOS.md`). Código (scripts de generación): **MIT** (`LICENSE`). Autoría: © 2026 Fernando García · SEACHAD, metodología SEVEN-G. | Coherente con `AI_en_el_consejo` y con el criterio de publicación "no exige contratar al autor para usarlo". Una cláusula no comercial (NC) generaría dudas precisamente en las empresas usuarias. El valor diferencial está en la aplicación y el acompañamiento, no en el texto. |
| 6 | **Relación con SPAD y AECF** | Se mantienen como metodologías independientes y se referencian desde SEVEN-G: SPAD en el documento 53 (construcción de soluciones con IA, fases 4–5); AECF como referencia de gobierno ágil. No se presentan como marcas paralelas en los documentos de SEVEN-G. | Reduce la dispersión de marca: un paraguas (SEVEN-G) y piezas especializadas referenciadas. |
| 7 | **Dimensiones del modelo de madurez** | Propuesta de trabajo, a validar en el documento 11: 1) Estrategia y gobierno · 2) Valor y cartera · 3) Datos y conocimiento · 4) Tecnología y operación · 5) Personas y adopción · 6) Riesgo, seguridad y cumplimiento · 7) Medición y evidencia. Escala 0–5 con rúbrica y evidencia por nivel. | Cubre las métricas del documento fundacional, las siete dimensiones del informe de madurez antiguo y los huecos detectados (valor, seguridad, medición). |

**Aspectos a revisar si cambia el contexto**

- Si el repositorio `AI_CONSULTING` pasa a ser público, excluir `mds/_trabajo/`, `html/_trabajo/` y `pdf/_trabajo/` en `.gitignore` antes del primer *push* público.
- Si se decide restringir la reutilización comercial por terceros, la licencia solo puede endurecerse para versiones futuras; las versiones ya publicadas bajo CC BY 4.0 conservan esa licencia.

## 6. Orden de trabajo recomendado

1. **01 Metodología fundacional** (hecho) y **02 Glosario**: fijan el modelo y el vocabulario para todo lo demás.
   - Tras el 02: **ola 1 de herramientas** (registro de iniciativas T01 con inventario, gestor de *gates*, intensidad y ambición, y conexión del panel del consejo). Ver documento 03.
2. **10 Mapa de esferas**, **12 Índice de transformación** y **40 Reglas de medición**: son lo más diferencial y lo que conecta con el panel del consejo.
3. **21 Criterios de gate** y **20 Manuales de fase**, con sus plantillas del bloque H.
4. **30 Modelo de gobierno**, **32 Inventario**, **33 Riesgos**, **34 Mapeo regulatorio**, **35 Seguridad de agentes**.
5. **11 Madurez** con cuestionario.
6. Bloques G, E restantes, F y J.
7. Actualización del panel del consejo para reflejar esferas, madurez e índice de transformación.

---

## 7. Resolución del análisis (16-09-2026, versión 0.2)

Todo lo indicado en este análisis se ha resuelto con las recomendaciones que se detallan a continuación. Las decisiones nuevas están en `.claude/seveng_decisiones.md` (D19–D27); los parámetros comunes, en `_trabajo/20260916_Especificacion_comun_biblioteca_SEVEN-G.md`, y los ajustes cruzados entre documentos, en `_trabajo/20260916_Ajustes_de_coherencia_SEVEN-G.md`.

### 7.1 Incoherencias

| Tema (§2) | Resolución | Dónde |
|---|---|---|
| Qué es SEVEN-G | *Seven-phase Enterprise Value & Governance* (D02). | 00, 01, 02 |
| Número y nombre de fases | Fases 0–7 con *gates* G0–G5, R6 y G7. | 01, 20, 21 |
| Resultados de *gate* | Continuar / Continuar con condiciones / Iterar / Pivotar / Parar; G7: Escalar / Iterar / Retirar; **R6: Continuar la operación / Continuar con condiciones / Adelantar G7** (añadido a 01 §7.3). Auditoría: Conforme / Conforme con observaciones / No conforme. | 01, 21, 22, 38, P29 |
| Madurez | 7 dimensiones D1–D7, niveles 0–5 con rúbrica, cuestionario de 84 preguntas y nivel global limitado por D1 y D6 (D20). | 11 |
| Categorías de riesgo | 7 categorías más los ámbitos GEN, SEG y TER (terceros añadido a 01 §10); escala 5×5; 70 riesgos tipo. | 01, 33 |
| Roles | 6 roles y órganos; en SPAD el rol de IA pasa a "IA revisora" (D23). Separación de funciones reforzada en Lite: la oficina de IA verifica G3–G5 y el patrocinador decide con conformidad de riesgos. | 01, 30, 53, SPAD |
| ROI | Único criterio económico de viabilidad: VAN ≥ 0 sobre beneficio neto con horizonte y tasa de C2; ROI y plazo de recuperación solo informativos; fórmulas F1–F10. | 40, 01 §7.6 |
| Esferas 08 y 09 | Grados propios (Ausente, Básico, Sistemático, Avanzado); solo esfera secundaria si la finalidad es el cumplimiento o el gobierno; banda de inversión aparte. | 10 |
| Ámbito geográfico | Euros y normativa europea y española; otras jurisdicciones en anexo orientativo. | 34 |
| Nombres de marca | Paraguas único SEVEN-G; SPAD y AECF como metodologías relacionadas; SPAD corregido. | 53, SPAD |
| Idioma | Español e inglés siempre (D12). | Toda la biblioteca |
| Cifras sin respaldo | Eliminadas; ejemplos ficticios marcados. SPAD conserva cifras propias que debe revisar el autor. | Toda la biblioteca |

### 7.2 Huecos estructurales

| Hueco (§3.1) | Resolución | Dónde |
|---|---|---|
| 1. Nivel compañía | Ciclo C1–C5 desarrollado: tesis, ambición y apetito, cartera, madurez, índice, consejo e implantación. | 01, 11–14, 60–62, 90 |
| 2. Eficiencia frente a transformación | Diez reglas de clasificación, condiciones de base B1–B3, umbrales iniciales de las 8 señales (a calibrar) y detección de "transformación declarada, no evidenciada"; priorización en tres grupos por ambición con presupuesto propio. | 12, 14 |
| 3. Retirada | Procedimiento de 10 pasos, registro de retiradas y plantilla P30; herramienta T22. | 14, P30 |
| 4. Lite o Enterprise | Criterios de 01 §9 con el de agentes precisado (A2/A3 con efecto externo, D22); plantilla P04; alcance de implantación de la compañía distinto de la intensidad. | 01, P04, 90 |
| 5. IA que no es un proyecto | Política corporativa y de uso aceptable; IA embebida, suites de productividad, uso individual y *shadow AI*; inventario de los cuatro tipos de uso. | 31, 32, 36 |
| 6. Adopción y cambio | Plan de adopción, capacidad liberada con cinco destinos, formación y alfabetización, indicadores y criterios de G5 y G7. | 23, 50, P20 |

### 7.3 Huecos temáticos

| Hueco (§3.2) | Resolución |
|---|---|
| IA generativa y agentes | Autonomía A0–A3, controles SEG-01–20 y AG-01–20, lista LV-AG y criterios [GEN] y [AG] en los *gates* (35, 21, 22, 52). |
| Seguridad e IA ofensiva | Documento 35, con exposición a ataques que usan IA e indicadores para el consejo. |
| Inventario y clasificación regulatoria | Documento 32; plantillas P05 y P11. |
| Mapeo regulatorio | Documento 34 verificado a 16-09-2026, incluido el Reglamento (UE) 2026/1744 (anexo III aplazado al 2-12-2027 y anexo I al 2-08-2028). **Pendiente de cotejo con el DOUE y de revisión jurídica.** |
| Terceros y proveedores | Documento 36 con niveles N1–N3 y 16 cláusulas clave; plantilla P14. |
| Costes de IA | Documento 42 con nueve categorías y reparto analítico. |
| Datos y conocimiento | Documento 51 con indicadores DAT y CNC. |
| Personas | Documento 50 con indicadores PER y autonomía máxima en decisiones sobre personas. |
| Indicadores por esfera | 60 indicadores IE en el 10 y catálogo de 156 indicadores en 13 familias con tabla de correspondencia en el 41. |
| Madurez | Rúbrica, cuestionario y método de evaluación verificada (11). |
| Guía de conversación con el consejo | Documento 61 con guion de 60 minutos y formato de respuesta. |
| Casos de aplicación | Cinco casos ficticios coherentes con las demostraciones (92). |
| Uso del marco por terceros | Documentos 91 y 93; sin certificación oficial en la versión 0.x (D25). |

### 7.4 Bloques H, I y J

- **H · Plantillas:** 31 plantillas P01–P31 alineadas con 01 §6.10 (D21), en español e inglés.
- **I · Herramientas:** T01 (registro de iniciativas con T02–T05 integrados) en `SEVEN-G/herramientas/T01_registro_iniciativas/`. La adaptación de T17 y T18 se hace en el proyecto privado de origen del motor (D26).
- **J · Adopción del marco:** documentos 90–93 hechos. `SEVEN-G_IA_for_Hypergrowth.pdf` no se rehace (D24).

### 7.5 Pendiente para el autor

1. Validar las decisiones marcadas "a validar" (D19, D20, D22, D25) y los umbrales iniciales marcados "a calibrar" (índice de transformación, apetito y materialidad, priorización, semáforo, caducidad de estados, alertas de consumo, tamaños de muestra de auditoría).
2. Revisión jurídica del documento 34 y de las citas regulatorias de 31, 32, 37 y 50–52, en particular el texto del Reglamento (UE) 2026/1744 en el DOUE, la transposición española de NIS2 y el proyecto de Ley Orgánica de IA.
3. ~~Incorporar a 33 los tres riesgos tipo propuestos en 50 (información y consulta, conflicto laboral, bienestar); dar código IND- a unos 60 indicadores provisionales del 41; resolver la colisión de prefijos CON- (conocimiento, 51) e IND-CON (consejo, 41).~~ **Resuelto (16-09-2026):** riesgos RT-ORG-07 (incumplimiento de información y consulta), RT-ORG-08 (conflicto laboral) y RT-ORG-09 (deterioro del bienestar) incorporados al catálogo de 33 (70 riesgos tipo) y enlazados desde 50 §12; los 50 códigos provisionales sin equivalente tienen código IND- en 41 §21 (47 indicadores nuevos, porque IE03.06 y PER-14, IE05.05 y DAT-10, e IE06.02 y CNC-06 comparten código), en las familias EMB, RIE, OPE, ADO, DAT y CLI y en la nueva familia PRO · Procesos y decisión (catálogo de 156 indicadores en 13 familias; conjunto Lite sin cambios, 26); los indicadores de conocimiento del 51 pasan de CON- a CNC- en 41, 50, 51, 52, 02 y la especificación común (§5.9).
4. ~~SPAD: revisar las afirmaciones con cifras de retorno y certificación.~~ **Resuelto (16-09-2026):** cifras sin respaldo sustituidas por objetivos a medir, "certificación" por autoevaluación de conformidad y aviso legal en todos los ficheros. Queda corregir en origen el PDF `05_SPAD_Skill_Methodology_Seachad.pdf`.
5. ~~Adaptar T17 y T18.~~ **Resuelto sin tocar el motor (16-09-2026):** conector `SEVEN-G/herramientas/T17_panel_consejo/` con demo en `ejemplo/salida/`. Pendiente en el proyecto privado de origen del motor: renombrar claves heredadas (`estimado_cati`, `aap`) y añadir bloques de esferas, madurez, índice y embudo (propuesta en `PROPUESTA_MOTOR.md` de esa carpeta). **Actualizado (17-09-2026, D43–D45):** T01 se genera desde JSON (`build_registro.ps1`) y es la única entrada de datos del panel; el motor pasa a la versión 8 y el embudo ya llega al panel (etapas por fase en `config_panel.json` e historial de estados desde los eventos de T01); esquema 0.2 con los campos opcionales que el panel necesita. Siguen pendientes las claves heredadas y los bloques de esferas, madurez e índice.
7. **Aviso legal (D33):** incluido en todos los documentos, plantillas, herramientas, paneles, demos y SPAD. Publicación preparada con `SEVEN-G/build/publicar.ps1` desde el propio repositorio `AI_CONSULTING` con `.github/workflows/pages.yml`, con portada en la raíz (D37); antes de publicar, crear la lista privada de términos prohibidos y pasar la verificación del proyecto de origen del motor.
6. Construir las olas 2 y 3 de herramientas (documento 03 §6).
