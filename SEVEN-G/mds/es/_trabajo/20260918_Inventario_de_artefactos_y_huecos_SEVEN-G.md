# SEVEN-G · Inventario de artefactos de trabajo y huecos

**Qué documentos, plantillas y herramientas describe el marco, cuáles existen de verdad y qué hay que crear para que una compañía pueda trabajar con él**

| | |
|---|---|
| Documento | Documento de trabajo (no publicable) |
| Fecha | 18-09-2026 |
| Alcance | Documentos 00–93, plantillas P01–P31, herramientas T01–T22 y material de `_legacy` (versión española, fuente de redacción) |
| Método | Lectura de los documentos para localizar cada artefacto que la compañía tiene que producir, rellenar, aprobar o custodiar, y comprobación de su respaldo real: plantilla P, aplicación en `SEVEN-G/herramientas/`, sección de documento usable tal cual o nada |
| Estado | Base para planificar la creación de los artefactos que faltan. Las decisiones de la sección 9 son del autor. |

---

## 1. Conclusión

1. **El material del ciclo de vida de la iniciativa existe.** Las 31 plantillas P01–P31 cubren una a una las evidencias de 01 §6.10 (D21) y son sustantivas (10–18 KB cada una, con instrucciones, campos, guía, ejemplo ilustrativo, criterios de calidad y firmas). En particular, los dos ejemplos citados por el autor ya existen en la versión vigente:
   - *Risk Matrix* y *Risk Register* del material antiguo → **P12 · Matriz y registro de riesgos** (escalas 5×5, matriz de calor, inherente y residual, aceptación por nivel) con el método del documento 33.
   - *GO/NO-GO Decision Record* → **P29 · Registro de decisión de gate** (evidencias, criterios del documento 21, verificación, decisión, condiciones, iteraciones), complementada por P23 (firma de puesta en producción) y P30 (escalado o retirada).
2. **Lo que no existe es de otra naturaleza.** Hay cuatro huecos:
   - **A. Formato de trabajo.** Todas las plantillas existen solo como Markdown → HTML/PDF de lectura. No hay ningún fichero rellenable (`.docx`, `.xlsx`) en todo el repositorio, aunque el documento 03 promete «plantilla de hoja de cálculo» para T06, T11 y T13 y «plantilla» para T19 y T20.
   - **B. Herramientas.** De las 22 herramientas del catálogo solo tienen aplicación T01 (con T02–T05 como módulos), T14, T17 y T18 (esta última como página generada por el conector de T17). T06–T13, T15, T16 y T19–T22 «se aplican con» una plantilla o un documento, y varios documentos atribuyen a T01, T15 o T17 funciones que las aplicaciones no tienen.
   - **C. Artefactos de compañía, consejo, cumplimiento y auditoría.** Las plantillas son casi todas *por iniciativa*. Los artefactos del ciclo corporativo C1–C5, de los órganos de gobierno, del cumplimiento regulatorio profundo (EIPD, FRIA, notificaciones), de terceros, de auditoría y de implantación del marco están descritos en los documentos, pero **no tienen plantilla**. Se han identificado **unos 60**.
   - **D. Referencias rotas.** Varios documentos dicen que un contenido «forma parte de» o es «anexo de» una plantilla que no lo contiene.
3. **Hay además piezas que ya están completas dentro de un documento** y solo necesitan extraerse como plantilla o formato rellenable (por ejemplo, la decisión C2 en 13 §15, el cuestionario de madurez en 11 §3, las políticas de 31 §3–§4 o las listas LV del documento 22).

---

## 2. Qué existe hoy

| Pieza | Estado real |
|---|---|
| Documentos 00–93 (ES/EN) | Markdown, HTML y PDF generados. |
| Plantillas P01–P31 (ES/EN) | Markdown, HTML y PDF. **Sin versión rellenable.** |
| T01 Registro de iniciativas (+ T02 inventario, T03 gestor de *gates* con 128 criterios, T04 intensidad, T05 ambición) | Aplicación HTML + JSON (esquema 0.3). |
| T14 Índice de transformación | Aplicación HTML + JSON. |
| T17 Panel del consejo (completo y móvil) | Conector `t01_a_panel.py` + motor v8. |
| T18 Registro de recomendaciones | Página generada por el conector de T17 (`t01_Registro_Recomendaciones.html`); no tiene carpeta propia. |
| T06–T13, T15, T16, T19–T22 | **Sin aplicación.** «Se aplica con» P o documento. |
| `.docx` / `.xlsx` / `.csv` | **Ninguno** en el repositorio. |

### 2.1 Correspondencia con el material antiguo (`SEVEN-G/_legacy`)

| Material antiguo | Equivalente vigente | Observación |
|---|---|---|
| AI Initiative Charter | P01 · Carta de la iniciativa | Cubierto. |
| GO/NO-GO Decision Record | P29 (+ P23, P30) | Cubierto. |
| Risk Matrix | P12 §3 y §5 + documento 33 | Cubierto. |
| Risk Register | P12 §4 (T06 sin aplicación) | Cubierto como plantilla; falta formato de hoja de cálculo o módulo de T01. |
| Value Hypothesis Canvas | P08 (+ P09 línea base) | Cubierto. |
| AI Ops Runbook | P24 (+ P25, P26, P27) | Cubierto. |
| Maturity Assessment Report | Documento 11 §6 (estructura) | **Hueco**: no hay plantilla de informe ni herramienta T15. |
| Engagement Guide | Documento 91 | Cubierto como guía; faltan propuesta, carta de encargo y plan de transferencia (sección 5.10). |

---

## 3. Hueco A · Formato de trabajo

Una compañía no rellena un HTML ni un PDF. Hoy, para usar P12 o P29, tiene que copiar el Markdown o rehacer la tabla en su herramienta.

| Promesa del marco | Dónde | Realidad |
|---|---|---|
| T06 «plantilla de hoja de cálculo» (riesgos) | 03 §5.2 | No existe. P12 incluye la fórmula de nivel para hoja de cálculo, pero no la hoja. |
| T11 «HTML y plantilla de hoja de cálculo» (hipótesis de valor, VAN/ROI/plazo) | 03 §5.3; 40 §8; 41 IND-VAL-11/12/13 | No existe. P08 y P10 solo calculan el neto anual. **El criterio económico de G3 y G7 (40 §8) no tiene dónde calcularse.** |
| T13 «plantilla de hoja de cálculo» (costes por caso, con exportación a T01 y T17) | 03 §5.3; 42 §12 | No existe. |
| T19 «plantilla de documento» (tesis y apetito de riesgo) | 03 §5.4 | Solo como anexo de 13 §15. |
| T20 «plantilla y módulo de T01» | 03 §5.5 | P20 existe; el módulo no. |
| Hoja de cálculo de respaldo del registro de recomendaciones | 62 (l. 349) | No existe. |
| Exportación de T01 «a hoja de cálculo» | 03 §2 principio 5 | T01 exporta JSON. |

---

## 4. Hueco B · Herramientas sin aplicación y funciones atribuidas que no existen

### 4.1 Herramientas sin aplicación

| Código | Herramienta | Se aplica hoy con | Qué falta para que sea operativa |
|---|---|---|---|
| T06 | Matriz y registro de riesgos | P12, P13 | Hoja o módulo de T01 con cálculo de nivel, matriz de calor y vista de cartera (concentración, 33 §10–12). |
| T07 | Clasificador regulatorio | P11 | Cuestionario guiado; P11 §3–8 es completo y sirve de contenido. |
| T08 | Registro de NC e incidentes | P26, P27 | **No existe registro de no conformidades (NC-)**: ni plantilla ni aplicación. |
| T09 | Registro de proveedores | P14 | Registro de cartera de proveedores (36 §9). |
| T10 | Seguridad de agentes | P18 + LV-AG (22 §12) | Estado de cada control SEG-01–20 / AG-01–20. |
| T11 | Hipótesis de valor y calculadora | P08, P09 | Calculadora VAN/ROI/plazo (40 §8, F7–F9). |
| T12 | Seguimiento de realización | P28 | Módulo por periodo y por caso. |
| T13 | Costes por caso | Documento 42 | TCO, vista incremental, reparto, consumo, conciliación, hoja de decisión (42 §12). |
| T15 | Diagnóstico de madurez | Documento 11 | Hoja de respuestas y evidencias, cálculo (11 §5), informe (11 §6). |
| T16 | Mapa de esferas | Documento 10 | Mapa de calor esferas × ambición (10 §8.1). **No está en T17** (solo en `PROPUESTA_MOTOR.md`). |
| T19 | Tesis de IA y apetito | Documento 13 §15 | Plantilla propia y versión con umbrales. |
| T20 | Adopción y capacidad | P20 | Registro de capacidad liberada y de formación. |
| T21 | Monitor de uso corporativo | Documento 31 | Catálogo de herramientas autorizadas y vista de licencias. |
| T22 | Gestor de retiradas | P30 | Registro de retiradas (campos en 14 §10.9). |

### 4.2 Funciones atribuidas a una herramienta que no las tiene

| El documento dice | Dónde | Realidad |
|---|---|---|
| T01 calcula la puntuación de priorización, los carriles y los tramos | 14 §13 | T01 no tiene priorización ni carriles. |
| T01 muestra el semáforo de programas | 14 §13; 60 §9–10 | No está en T01 ni en T17; se calcula a mano. |
| La ficha de indicador se documenta en T01 | 41 §5 | T01 no tiene entidad de indicadores. |
| T01 registra excepciones y conflictos de interés | 30 §13 | El registro no los contempla. |
| T15 genera el informe de madurez | 11 §10 | T15 no existe. |
| T16 es una vista del panel del consejo | 03 §5.4; 10 §8 | El motor de T17 no tiene mapa de calor. |
| T17 está «pendiente de adaptación para alimentarse de T01» | 60 §10.3 | Texto desfasado: el conector existe (D43). |
| T18 recoge los campos de 62 §4 | 62 §4–9 | Faltan criterio de cumplimiento, valoración, reprogramaciones, historial y órgano (lo reconoce 62 §12.2). **No existe registro de decisiones del consejo (DEC)**, 62 §10. |

---

## 5. Hueco C · Artefactos sin plantilla

Leyenda de respaldo: **Doc** = contenido completo en el documento, usable tal cual pero no extraído como plantilla · **Parcial** = una plantilla lo toca de forma insuficiente · **Nada** = solo mencionado o descrito.

### 5.1 Ciclo corporativo C1–C5

| Artefacto | Dónde se exige | Respaldo | Hueco |
|---|---|---|---|
| Informe de diagnóstico C1 (madurez, mapa actual, índice, inventario, valor y coste) | 01 §5.1; 11 D1.05; 13 §15.A; 90 §4.2; 91 §4.2 | Nada | Entregable central del primer mes sin estructura. |
| Cuestionario de madurez (7 dimensiones × 12 preguntas) | 11 §3 | Doc | Sin hoja de respuestas ni cálculo. |
| Informe de madurez | 11 §6 | Doc (7 secciones descritas) | Sin plantilla. |
| Guion de entrevistas de diagnóstico | 11 §4.4 | Parcial (esquema) | — |
| Mapa de riesgos y oportunidades por esfera (mes 2) | 01 §5.3; 00; 10 | Nada | — |
| Decisión C2: tesis, ambición por esfera, apetito, umbrales, horizontes, líneas rojas, presupuesto marco | 13 §15 | Doc (T19) | Extraer como plantilla y versionar umbrales. |
| Selección de indicadores aprobada en C2 | 41 §1, §19–20 | Nada | — |
| Plan de cartera C3 (sobres, capacidad, límites, calendario) | 01 §5.1; 14 §2.1 | Nada | — |
| Tabla o calculadora de priorización (6 criterios, pesos por carril) | 14 §4 | Doc (método) | Sin calculadora. |
| Plan de capacidad de perfiles escasos | 14 §6.3 | Nada | — |
| Registro de límites de cartera y concentración | 14 §5.2, §9 | Parcial | — |
| Registro de calibración de umbrales (mapa, semáforo, pesos) | 12 §8; 13 §13 | Parcial (T14 solo sus umbrales) | — |
| Plan de datos por señal sin dato | 12 §6 | Nada | Menor. |
| Informe o revisión anual C5 (tesis cumplida, lecciones, ajustes) | 01 §5.1; 13 §13; 11 D1.11 | Nada | — |
| Registro consolidado de lecciones aprendidas | 14 §10.8; 43 §8.3 | Parcial (P30 por iniciativa) | — |

### 5.2 Órganos de gobierno

| Artefacto | Dónde | Respaldo | Hueco |
|---|---|---|---|
| Reglamento o mandato del comité de IA, oficina de IA y comisión | 30 §3; 01 §8.3; 90 §4.4 | Doc (tablas «modelo para adaptar») | Sin texto aprobable por artículos (convocatoria, quórum, votación, actas). |
| Nombramiento del responsable de IA | 11 D1.03 | Nada | — |
| Acta y orden del día del consejo y del comité | 30 §3; 11 D1.02–D1.09; 21 (G2.12, G7.09) | Nada | **Evidencia obligatoria** en madurez y en *gates* de Transformar. |
| Revisión mensual del comité / trimestral de cartera | 14 §7 | Parcial (puntos del orden del día) | — |
| RACI de etapas corporativas | 30 §6.3 | Doc | P03 solo cubre la iniciativa. |
| Solicitud y registro de excepciones | 30 §7.4; 31 §3.8 | Nada | — |
| Declaración anual de conflictos de interés de miembros de órganos | 30 §12 | Parcial (P03 §8, por iniciativa) | — |
| Informe trimestral de segunda línea (riesgos, incidentes, NC) a la comisión | 30 §6.3; 33 §12; 37 §9 | Nada | — |
| Autoevaluación de los órganos y plan de mejora | 11 D1.12 | Nada | — |

### 5.3 Política y uso corporativo

| Artefacto | Dónde | Respaldo | Hueco |
|---|---|---|---|
| Política corporativa de IA | 31 §3 | **Doc, lista para adaptar** | Solo falta formato editable. |
| Política de uso aceptable y aceptación del empleado | 31 §4 | **Doc, lista para adaptar** | Ídem. |
| Catálogo de herramientas autorizadas | 31 §4.2 | Nada | — |
| Solicitud de herramienta nueva | 31 §4.2.5 | Nada | — |
| Canal o formulario de comunicación de incidentes por empleados | 31 §4.8 | Nada | — |
| Encuesta anual de uso (*shadow AI*) | 31 §5.2 | Nada | — |
| Plan anual y registro de alfabetización (F1–F8, PER-PA…PF) | 31 §6; 50 §5.2; 90 §9 | Nada | Indicador de 90 sin fuente. |

### 5.4 Inventario, clasificación y cumplimiento regulatorio

| Artefacto | Dónde | Respaldo | Hueco |
|---|---|---|---|
| Evaluación de impacto en protección de datos (EIPD, art. 35 RGPD) | 32 §6.1; 34 §6.1 | Parcial (P11 §9.1 solo decide si hace falta) | Sin plantilla de la evaluación. |
| Evaluación de impacto en derechos fundamentales (FRIA, art. 27) y notificación | 32 §6.2; 34 §3.10 | Parcial (P11 §9.2) | Sin plantilla. |
| Expediente de proveedor de alto riesgo: documentación técnica del anexo IV, sistema de gestión de la calidad (art. 17), declaración UE de conformidad, marcado CE | 32 §6.3; 34 §3.7–3.8 | Nada (una línea en P21) | Solo aplica si la compañía actúa como proveedor. |
| Plan de vigilancia posterior a la comercialización | 34 §3.14; 52 §9 | Parcial (una fila en P24) | — |
| Información a trabajadores y su representación (art. 26.7; ET 64.4.d) | 32 §3.5; 34 §3.9; 23 §11.1; 50 §7.3 | Parcial (un campo Enterprise en P20) | Sin ficha ni registro; 23 lo exige también en Lite. |
| Textos modelo de avisos de transparencia (art. 50) e instrucciones de uso | 34 §3.7, §3.11 | Parcial (P17 §8, P24) | — |
| Registro interno de sistemas que afectan a empleados | 50 §7.4 | Nada (derivable de T02) | — |
| Informe trimestral de conciliación del inventario | 32 §9 | Nada | — |
| Registro de cambios del mapeo regulatorio y nota de impacto | 34 §10.3 | Nada | — |
| Declaración de aplicabilidad ISO/IEC 42001 | 34 §4.1 | Nada | — |

### 5.5 Riesgo y seguridad

| Artefacto | Dónde | Respaldo | Hueco |
|---|---|---|---|
| Catálogo de riesgos tipo RT- (70) en formato estructurado | 33 §9 | Doc | Sin JSON o hoja importable por T01/T06. |
| Informe de riesgo de cartera e indicadores de riesgo clave | 33 §10–12 | Parcial (P12 §7) | — |
| Plan e informe de campaña de *red teaming* e inyección | 35 §8 | Parcial (P18 §11, registro de pruebas) | Sin reglas de enfrentamiento ni informe. |
| Inventario de identidades no humanas y actas de revisión AG-20 | 35 §4.1, §7 | Nada | — |
| Inventario de componentes (SBOM) | 35 (SEG-09/AG-13); 53 §7.4 | Nada | — |
| Evaluación anual de IA ofensiva, simulacro *deepfake*, verificación fuera de banda | 35 §9.2 | Nada | — |

### 5.6 Terceros y proveedores

| Artefacto | Dónde | Respaldo | Hueco |
|---|---|---|---|
| Cuestionario de diligencia debida | 36 §4.3 (12 bloques) | Parcial (P14 §4, 5 bloques) | Incompleto y desalineado. |
| Cláusulas contractuales tipo, anexo de IA, adenda de IA embebida | 36 §6, §8.1 | Parcial (lista de verificación en P14 §5) | Sin redacción de cláusulas. |
| Registro de proveedores | 36 §9 | Nada | T09. |
| Plan de salida y prueba de portabilidad | 36 §4.2, §7.1 | Parcial (un campo en P14) | — |
| Cuestionario de IA embebida para proveedores existentes | 36 §8.1 | Nada | — |
| Actas de revisión del proveedor, certificado de borrado, registro DORA | 36 §5, §6.2 | Parcial (P30 §8) | — |

### 5.7 No conformidades e incidentes

| Artefacto | Dónde | Respaldo | Hueco |
|---|---|---|---|
| **Registro de no conformidades (NC-)** | 37 §3.2 | **Nada** | Proceso central sin soporte. |
| Formularios de notificación a autoridades (art. 73 RIA, brecha RGPD 72 h, DORA, NIS2) y decisión motivada de no notificar | 37 §5 | Parcial (casillas en P26 §8) | — |
| Plantillas de comunicación de incidentes | 37 §10 (dice que están en P26) | **Nada** | Referencia rota. |
| Hoja de análisis de causa raíz y plan de acción correctiva | 37 §3.5–3.6, §4.5 | Doc (método) | — |

### 5.8 Auditoría

| Artefacto | Dónde | Respaldo | Hueco |
|---|---|---|---|
| Plan anual de auditoría con puntuación de prioridad | 38 §5 | Doc (factores) | Sin plantilla ni cálculo. |
| Declaración de independencia del auditor | 38 §3.1 | Nada | — |
| Memorando de planificación, actas de apertura y cierre, papeles de trabajo, nota de seguimiento | 38 §6.1 | Parcial (programas de prueba 38 §6.2–6.3) | — |
| Informe de auditoría y ficha de hallazgo (AUD-) | 38 §9; 21 §10.7; 43 §12 | Doc (estructura) | Sin plantilla. |
| Calculadora de muestreo | 38 §7.2 | Doc (fórmulas) | — |
| Declaración de aplicación de SEVEN-G | 01 §14; 38 §11.3; 91 §6.3 | Doc (contenido mínimo) | Sin texto modelo. |

### 5.9 Valor, costes, personas, datos y operación

| Artefacto | Dónde | Respaldo | Hueco |
|---|---|---|---|
| Calculadora VAN / ROI / plazo | 40 §8 | Nada | Ver sección 3. |
| Calculadora de costes por caso y hoja de decisión | 42 §12 | Nada | Ver sección 3. |
| Registro de claves de reparto aprobadas en C3 | 42 §6, §11.2 | Doc (método) | — |
| Presupuesto de consumo por caso aprobado en G5 | 42 §8 | Parcial (P25, P18) | — |
| Informe de conciliación mensual de costes | 42 §11.3 | Nada | — |
| Coste de parar e inversión evitada | 42 §10 | Parcial (P30) | — |
| Registro de solapes y reparto entre casos (cartera) | 40 §4.2; 43 §6 | Parcial (P28 §8) | — |
| Plan de realización de beneficios | 43 §4.1; 02 (evidencia de G3 y G4) | **Nada** (43 dice que está en P28) | Referencia rota. |
| Informe de revisión de valor a 6 y 12 meses | 43 §8.3 | Nada | — |
| Evaluación de efecto sobre el trabajo (9 preguntas) | 50 §3.3–3.4 | Parcial (P20 §3) | — |
| Plan de capacidades y formación por colectivo | 50 §5.3 | Parcial (P20 §5) | — |
| Registro de capacidad liberada (PER-D1…D5) | 50 §6.4 | Parcial (P20 §7, sin PER-D4; P28 §6) | — |
| Encuesta de percepción / pulso | 23 §10.2; 50 §9–10 | Nada | Preguntas distintas en 23 y 50. |
| Descripciones de puesto de los roles nuevos | 50 §4.2 | Parcial (tabla) | — |
| Ficha de conjunto de datos para IA | 51 §4.2, §15 (dice «anexo de P16») | Parcial (P16 §3–4) | Referencia rota. |
| Inventario de fuentes de conocimiento | 51 §10.1, §15 (dice «anexo de P16») | **Nada** | Referencia rota. |
| Mapa de dependencia de conocimiento y plan de captura | 51 §10.6 | Nada | — |
| Paquete de revisión de continuidad R6 (10 bloques) | 52 §8.2 | Parcial (P24, P25, P29) | — |
| Anexos de construcción con SPAD (revisión del plan, reglas de implementación, estrategia de pruebas, registro de correcciones) | 53 §4.1, §6 (dice que están en P15, P21, P22) | **Nada** | Referencia rota. |

### 5.10 Consejo, implantación y consultoría

| Artefacto | Dónde | Respaldo | Hueco |
|---|---|---|---|
| Paquete trimestral C4 (índice y bloques) | 60 §3–4 | Doc (estructura) | Sin plantilla de documento ni de diapositivas. |
| Resumen de una página, ficha de decisión DEC, calendario D-20…D+5, lista de control de envío | 60 §4.2, §5.1, §7, §11 | **Doc, usable tal cual** | Extraer como plantillas. |
| Paquetes C2, C5 y extraordinarios | 60 §3.2–3.4 | Doc (contenidos mínimos) | — |
| Registro de decisiones del consejo (DEC) | 62 §10 | **Nada** | — |
| Nota previa (2 páginas) y nota de conclusiones de la sesión | 61 §8.2, §8.4 | Nada | — |
| Mandato de implantación del marco | 90 §3, §4.2 | Nada | — |
| Declaración de completitud del inventario por área | 90 §4.2, §4.5 | Nada | — |
| Plan de regularización | 90 §4.4–4.5; 14 §11 | Doc (procedimiento) | — |
| Hoja de ruta 6–18 meses | 90 §6 | Doc (etapas) | — |
| Propuesta, alcance y carta de encargo por modelo M1–M5 | 91 §4 | Nada | 91 §4 sirve de base. |
| Declaración de independencia e intereses del consultor | 91 §5.5; 61 §10.3 | Doc (lista) | — |
| Plan de transferencia y nota de salida | 91 §4.6, §7.3 | Nada | — |

---

## 6. Hueco D · Referencias rotas

Documentos que remiten a un contenido que la plantilla citada no tiene. Hay que corregirlos en cualquier caso, se creen o no las piezas.

| Documento | Dice | Realidad |
|---|---|---|
| 43 §4.1 | El plan de realización de beneficios «forma parte de la plantilla P28». | P28 no tiene curva de realización, habilitadores ni indicadores adelantados. |
| 50 §14 (l. 503) | La ficha informativa para la representación «se incorpora como anexo de P17». | P17 no tiene ese anexo. |
| 51 §15 (l. 485) | Ficha de conjunto de datos e inventario de fuentes son anexos de P16. | No existen. |
| 53 §4.1, §6 | Los artefactos SPAD se registran en P15, P21 y P22. | Esas plantillas no los mencionan. |
| 37 §10 | P26 incluye plantillas de comunicación. | No las incluye. |

---

## 7. Incoherencias detectadas durante el barrido

| # | Incoherencia | Documentos |
|---|---|---|
| 1 | P14 no coincide con el documento 36: 16 cláusulas distintas de las de 36 §6, 5 bloques de diligencia frente a 12, reglas de exigencia N1–N3 diferentes. | P14, 36 |
| 2 | Las preguntas de la encuesta de pulso difieren: «utilidad, carga y confianza» (23) frente a «apoyo, carga y autonomía» (50). | 23 §10.2, 50 |
| 3 | La información a la representación de los trabajadores es obligatoria en Lite y Enterprise (23 §13.2), pero P20 la marca Enterprise. | 23, P20 |
| 4 | P20 recoge 4 destinos de la capacidad liberada; 50 §6.4 define 5 (falta PER-D4). | 50, P20 |
| 5 | Funciones atribuidas a T01, T15, T16 y T17 que no existen (sección 4.2). | 11, 14, 30, 41, 60 |
| 6 | 60 §10.3 describe T17 como pendiente de conectarse a T01. | 60 |
| 7 | 92 remite a la «sección 8» para los talleres (son la §11) y la numeración vuelve a «§10» tras la §12. | 92 |
| 8 | 90 remite los campos de la hoja de cálculo a 03 §3.3 (l. 81) y a 03 §4 (l. 266). | 90 |

---

## 8. Propuesta de trabajo

### 8.1 Criterio

- **Primero lo que impide arrancar.** Una compañía que adopta SEVEN-G sigue el plan de 90 días del documento 90: mandato, diagnóstico C1, órganos, tesis C2, cartera C3. Hoy casi ninguno de esos entregables tiene plantilla.
- **Después lo que bloquea un *gate* o una obligación legal**: cálculo económico de G3/G7, registro de NC, notificaciones, EIPD y FRIA, cláusulas de proveedor.
- **Extraer antes que redactar.** Donde el contenido ya está completo en un documento (13 §15, 11 §3, 31 §3–4, 60 §4–5, 22), la plantilla se extrae y el documento remite a ella, sin duplicar.
- Cada pieza nueva, en ES/EN, con aviso legal, «Por qué importa» y entrada en el catálogo del documento 03.

### 8.2 Olas propuestas

| Ola | Piezas | Motivo |
|---|---|---|
| **0 · Correcciones** | Referencias rotas (sección 6) e incoherencias (sección 7), incluida la alineación P14 ↔ 36. | Coste bajo; el marco dice hoy cosas que no son ciertas. |
| **1 · Arranque de la compañía** | Mandato de implantación · Informe de diagnóstico C1 · Cuestionario e informe de madurez (T15) · Reglamento del comité de IA · Acta y orden del día de los órganos · Plantilla de tesis y apetito C2 (T19) · Plan de cartera C3 con calculadora de priorización · Informe anual C5. | Son los entregables del plan de 90 días y evidencias de madurez (D1) y de G2/G7 de Transformar. |
| **2 · Económico** | Calculadora de valor VAN/ROI/plazo (T11) · Calculadora de costes por caso (T13) · Plan de realización de beneficios · Informe de conciliación de costes. | Sin ellas, los criterios económicos de G3 y G7 no se pueden aplicar. |
| **3 · Cumplimiento y control** | Registro de NC (T08) · Notificaciones a autoridades y comunicaciones de incidente · EIPD · FRIA · Información a trabajadores · Avisos de transparencia · Registro de excepciones · Registro de decisiones del consejo (DEC). | Obligaciones legales y de segunda línea. |
| **4 · Terceros y auditoría** | Cuestionario de diligencia completo · Cláusulas contractuales tipo · Plan de salida · Registro de proveedores (T09) · Kit de auditoría (plan anual, independencia, papeles, informe, hallazgos, muestreo) · Declaración de aplicación. | Tercera línea y contratación. |
| **5 · Consejo y consultoría** | Paquete trimestral C4 (documento y diapositivas) · Plantillas extraídas de 60 (una página, ficha DEC, lista de envío) · Notas previa y de conclusiones · Propuesta y carta de encargo · Plan de transferencia. | Presentación y venta del servicio. |
| **6 · Personas, datos y seguridad** | Encuesta de pulso · Registro de formación y alfabetización · Registro de capacidad liberada (T20) · Ficha de conjunto de datos · Inventario de fuentes de conocimiento · Catálogo de herramientas autorizadas y solicitud (T21) · Plan e informe de *red teaming* · Inventario de identidades no humanas · SBOM · Registro de retiradas (T22) · Catálogo RT- en JSON · Mapa de calor T16 en el panel. | Completan el marco. |

---

## 9. Decisiones que necesito del autor antes de crear

1. **Formato de las piezas rellenables.** Hoy todo es Markdown → HTML/PDF de lectura, y D11 dice que PowerPoint o Excel solo se hacen cuando el autor lo pide. Opciones:
   - (a) Mantener Markdown → HTML/PDF y añadir **`.docx` y `.xlsx` descargables** generados desde la misma fuente (recomendado para plantillas documentales y calculadoras: es lo que una compañía usa).
   - (b) Solo aplicaciones HTML sin servidor con JSON (D27), como T01 y T14.
   - (c) Mixto: plantillas documentales en `.docx`; registros y calculadoras como módulos de T01 o aplicaciones HTML con exportación a `.xlsx`.
   - Restricción técnica: el equipo no tiene Python, Node ni pandoc (solo PowerShell 7 y Edge; `uv` para el conector de T17). Generar `.docx`/`.xlsx` desde PowerShell es posible (son ZIP con XML), pero hay que confirmar la vía.
2. **Codificación de las plantillas nuevas.** P01–P31 son por iniciativa y se alinean con 01 §6.10 (D21). Recomendación: continuar con **P32 en adelante** agrupadas por bloque (compañía, consejo, cumplimiento, terceros, auditoría, implantación) en un único catálogo, en vez de abrir una serie paralela.
3. **Alcance del expediente de proveedor de alto riesgo** (anexo IV, sistema de calidad, declaración UE de conformidad). Recomendación: fuera de v0.x; indicar en 32 y 34 que la compañía que actúe como proveedor sigue las normas armonizadas y su propio sistema de calidad.
4. **Orden de las olas** de la sección 8.2 y si se empieza por la ola 0 (correcciones) en la misma entrega.
