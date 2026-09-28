# Especificación · Puntos de partida, recorrido de implantación y madurez en tres lentes

Documento de trabajo (no publicable). 28-09-2026. Es la especificación de contenido. La ejecuta el encargo `20260928_Encargo_sesion_local_Recorrido_y_madurez.md`.

**Origen.** El autor pidió dos cosas: (1) un recorrido de implantación que dependa del punto de partida de cada compañía (sin IA, con ML, con RPA…), que diga qué se hace, en qué momento y quién lo hace (roles diferenciados, modelos y matrices de riesgo…), y (2) desarrollar la madurez: tener un panel para la dirección o el consejo, tener IA generativa además de ML, afectar a procesos o también a personas, optimizar o transformar. Ambas cosas, enlazadas desde la entrada. El 28-09-2026 pidió hacerlo todo con las recomendaciones de Claude: las decisiones de la sección 1 quedan tomadas (D119, D120).

---

## 1. Decisiones tomadas

| # | Decisión | Por qué |
|---|---|---|
| 1 | **Seis arquetipos de punto de partida (PP-A a PP-F) más cinco modificadores (MP1–MP5).** Cada compañía recibe un arquetipo principal y, si le aplican, los **rasgos** de otros arquetipos. | Con una lista cerrada, una compañía con ML en producción y muchos pilotos de IA generativa no encajaría en ninguno. |
| 2 | **El arquetipo cambia el orden, el énfasis y el calendario, nunca el destino.** Las siete condiciones de 01 §14 y las reglas del marco son las mismas para todos. | No se crea una SEVEN-G por tipo de empresa. El documento nuevo no crea reglas: ordena las que ya existen (como el 94). |
| 3 | **Documento nuevo 96 · Puntos de partida y recorrido de implantación** (bloque J, nivel **Recomendado**). El 90 sigue siendo la guía y remite al 96 para elegir el orden. | El 90 ya es largo y es de nivel «siempre». El 96 es la forma de recorrerlo. |
| 4 | **La tecnología no puntúa en la madurez.** La madurez se lee en **tres lentes**: capacidad de gobierno (11, D1–D7, 0–5, sin cambios), **huella tecnológica HT0–HT5** (nueva, descriptiva) y **alcance del impacto IM1–IM4** (nuevo, derivado de las preguntas del 12). | Sumar tecnología a la madurez premia adoptar por delante del gobierno, que es justo el fallo que SEVEN-G quiere evitar. Una compañía con ML bien gobernado es más madura que otra con IA generativa sin control. |
| 5 | **Alertas cruzadas**: «adopción por delante del gobierno», «gobierno sin uso» y «transformación sin personas». La huella fija el **gobierno mínimo exigible** por dimensión, como ya hace 11 §8 con la ambición. | La tecnología no sube el nivel, pero sí sube lo que se exige. |
| 6 | **Herramienta nueva T23 · Recorrido de implantación** y **vista «Tres lentes» en T15**. T17 muestra las tres lentes en la tarjeta de madurez. La entrada y la portada enlazan ambas. | Es lo que pidió el autor: paneles enlazados desde la entrada. Se reutilizan T01 y T15 (D100: T01 es la fuente de verdad). |
| 7 | Lo que ya existe se reutiliza: el panel del consejo cuenta ya como madurez (D7.04 dirección, nivel 2; D7.06 consejo, nivel 3; D1.09 revisión trimestral, nivel 4). | Los ejemplos del autor ya estaban en el cuestionario. Hay que hacerlos visibles, no duplicarlos. |

---

## 2. Arquetipos de punto de partida (documento 96 §2)

### 2.1 Los seis arquetipos

| Código | Arquetipo | Cómo se reconoce | Riesgo típico | Por dónde empieza | Qué puede esperar |
|---|---|---|---|---|---|
| **PP-A** | **Punto cero** | No hay IA propia en producción ni contratada de forma consciente. Suele haber uso no autorizado de asistentes generativos. | Uso no autorizado con datos de la compañía; ideas sin dueño. | Mandato y patrocinador; inventario del uso no autorizado; política de uso aceptable y alfabetización básica; ficha de caso (P01) y registro T01 para las primeras ideas. | Regularización (no hay nada que regularizar); seguridad de agentes y operación hasta que haya un caso en fase 4. |
| **PP-B** | **Usuario de IA de terceros** | Asistentes en la suite ofimática, SaaS con IA incluida o IA contratada; no desarrolla. | IA que entra sin pasar por ninguna puerta (54 §5); coste de licencias sin adopción medida. | Inventario de la IA incluida en lo contratado (36 §8, P55 anexo A); proveedores N1–N3 (36, P14); política de uso aceptable; medir el asistente como iniciativa transversal con escalera por unidad (40 §7.2). | Construcción propia (53) y parte del ciclo técnico hasta que construya algo. |
| **PP-C** | **Automatizador** | Automatización con reglas o RPA en producción, con un centro de excelencia o equipo de automatización; poca o ninguna IA que aprenda. | Confundir automatización con IA; paso de bots a agentes (A2/A3) sin los controles del 35. | Convertir el centro de excelencia en el embrión de la oficina de IA (30); inventario que separa lo que es IA de lo que no lo es (32); cartera de casos que sustituyen reglas por IA con su ficha. | Su disciplina de procesos es un activo: rediseño de proceso (IT-P2) más fácil. |
| **PP-D** | **Analítica y ML clásico** | Modelos predictivos en producción, equipo de datos y, a veces, validación de modelos (banca, seguros). | Modelos en producción sin revisión de continuidad; IA generativa que entra por fuera del gobierno de modelos. | **Regularización** de lo que está en producción (90 §5, revisión equivalente a G7); llevar la validación de modelos existente a G5 y R6; deriva y monitorización (52); inventario con clasificación regulatoria (decisiones sobre personas). | El hueco es la IA generativa: fuentes de conocimiento (51, D3.08), evaluación con conjuntos de prueba (D4.08) y sesgo contrafactual (52 §4.2.7). |
| **PP-E** | **Muchos pilotos** | Varias pruebas de concepto de IA generativa (orientativamente, tres o más) y ninguna o una en producción. | «Purgatorio de pilotos»: coste sin valor, sin decisión de parar. | Registrar todos los pilotos en T01 y situarlos en su fase real; **G3 como puerta de parada** y el embudo para parar o escalar; hipótesis de valor y línea base (40, P08, P09) antes de más presupuesto. | Estructura completa de órganos: primero la decisión sobre la cartera, luego el resto. |
| **PP-F** | **A escala** | Al menos dos de estas tres cosas en producción: ML, IA generativa integrada en procesos y agentes que actúan (A2/A3). | Exposición regulatoria y de seguridad ya real; gobierno detrás del uso. | Roles separados y auditor de IA de inmediato; inventario completo con clasificación; seguridad de agentes (35) y proveedores (36); regularización priorizada por riesgo; panel del consejo e índice de transformación. | Nada: todo es obligatorio y urgente. |

> **Por qué importa.** Si una compañía sin IA empieza por la estructura de órganos, se queda en burocracia sin casos. Si una compañía con agentes en producción empieza por la ficha de caso, deja sin control lo que ya actúa. El arquetipo decide qué se hace primero, no qué se exige al final.

### 2.2 Regla de asignación

Se aplica en este orden y se asigna el **primer arquetipo** cuyas condiciones se cumplen. Los arquetipos posteriores que también se cumplan se añaden como **rasgos**; sus hitos prioritarios se suman al recorrido.

1. **PP-F**: al menos dos de {ML predictivo, IA generativa integrada en procesos, agentes A2/A3} en producción.
2. **PP-E**: tres o más pilotos de IA generativa en curso y como mucho uno en producción.
3. **PP-D**: ML predictivo (o visión, u optimización con aprendizaje) en producción.
4. **PP-C**: reglas o RPA en producción, sin IA que aprenda en producción.
5. **PP-B**: IA de terceros incluida en productos o asistentes corporativos, sin construcción propia.
6. **PP-A**: ninguna de las anteriores.

Ejemplo: una compañía con ML en producción, cuatro pilotos generativos y RPA recibe **PP-E con rasgos PP-D y PP-C**.

### 2.3 Modificadores

| Código | Modificador | Efecto en el recorrido |
|---|---|---|
| **MP1** | Sector regulado (financiero, seguros, sanidad, energía, sector público…) | Adelanta el inventario con clasificación (HI-05), el mapeo regulatorio (34) y la resiliencia (DORA/NIS2 si aplican). |
| **MP2** | Decisiones sobre personas, alto riesgo o exposición directa a clientes | Adelanta la evaluación de impacto (P11, P47, P48), la supervisión humana (P17) y el responsable de riesgos independiente (HI-10). |
| **MP3** | Alcance Enterprise de compañía (90 §2.2) | Calendario Enterprise de 90 §6.2. Sin MP3, calendario Lite y ruta mínima de 90 §2.4. |
| **MP4** | Gobierno previo reutilizable (validación de modelos, comité de datos, centro de excelencia, sistema de gestión ISO) | Los hitos correspondientes se **convalidan**: se adapta lo existente y se documenta la correspondencia en lugar de crearlo de nuevo (D31). |
| **MP5** | Sin patrocinador en la alta dirección | **Bloquea**: antes de cualquier otro hito hay que cumplir los requisitos previos de 90 §3. La herramienta lo muestra como condición previa, no como un hito más. |

### 2.4 Cuestionario de clasificación (T23 y documento 96 §2.4)

Doce preguntas. Cada respuesta dice qué arquetipo o modificador activa.

| # | Pregunta | Respuestas | Alimenta |
|---|---|---|---|
| Q01 | ¿Qué tipos de sistemas hay **en producción** hoy? (varias) | Ninguno · reglas o RPA · IA de terceros incluida en productos o asistentes · ML predictivo, visión u optimización · IA generativa integrada en procesos · agentes que ejecutan acciones | PP-A…F; HT |
| Q02 | ¿Cuántos pilotos o pruebas de concepto de IA hay en curso? | 0 · 1–2 · 3–5 · más de 5 | PP-E |
| Q03 | ¿Cuántos de ellos son de IA generativa? | Ninguno · alguno · la mayoría | PP-E |
| Q04 | ¿Hay constancia de uso no autorizado de asistentes de IA con datos de la compañía? | Sí · No · No se sabe | HI-02 (prioridad) |
| Q05 | ¿Qué gobierno existe hoy sobre modelos, automatización o datos? | Ninguno · parcial (validación de modelos, centro de excelencia, comité de datos) · sistema formal (p. ej., ISO/IEC 42001 o equivalente) | MP4 |
| Q06 | ¿Existe un inventario de los sistemas de IA? | No · parcial · completo con responsable | HI-05 |
| Q07 | ¿Está la compañía en un sector regulado? | Sí · No | MP1 |
| Q08 | ¿Toma o apoya la IA decisiones sobre personas, está expuesta a clientes o puede ser de alto riesgo? | Sí · No · No se sabe | MP2 |
| Q09 | ¿Se cumple algún criterio de alcance Enterprise de 90 §2.2? | Sí · No | MP3 |
| Q10 | ¿Hay un miembro de la alta dirección con responsabilidad escrita sobre la IA? | Sí · No | MP5 (si No) · D1.01 |
| Q11 | ¿Recibe la dirección o el consejo un informe o panel periódico sobre la IA? | Ninguno · dirección · consejo | HI-15 · D7.04/D7.06 |
| Q12 | ¿Tiene la compañía equipo propio de datos o de desarrollo de IA? | Sí · No · a través de terceros | PP-B/PP-D; HI-20 |

---

## 3. El recorrido: etapas e hitos (documento 96 §3–§4)

### 3.1 Cinco etapas

| Etapa | Objetivo | Referencia del 90 |
|---|---|---|
| **E1 · Arrancar** | Hay patrocinador y mandato, y se sabe qué IA hay. | Semana 1 y mes 1 (90 §4.2) |
| **E2 · Ordenar** | Todo está en el registro y en el inventario, y se decide sobre la cartera. | Meses 1–3 (90 §4.2–§4.3) |
| **E3 · Gobernar** | Órganos, roles separados, riesgos y ciclo de vida funcionando. | Meses 3–6 (90 §4.4, §6.1) |
| **E4 · Medir** | Valor medido, panel en la dirección y en el consejo, operación bajo control. | Meses 4–12 (90 §6.1) |
| **E5 · Escalar y revisar** | Auditoría, C5, índice recalculado y declaración de aplicación. | Meses 12–18 (90 §6.1–§6.2) |

### 3.2 Catálogo de hitos

Cada hito indica qué hay que tener, quién lo hace, con qué plantilla o herramienta, qué pregunta del documento 11 lo acredita (así el recorrido y la madurez hablan el mismo idioma) y su **prioridad por arquetipo**:

- **1**: arrancar ya (meses 1–2);
- **2**: en la etapa (meses 3–6);
- **3**: más adelante (meses 7–18);
- **C**: convalidar lo que ya existe;
- **D**: cuando aparezca el disparador (primera iniciativa en esa fase, primer agente…);
- **·**: no aplica todavía.

El mes base (Lite / Enterprise) es el del 90. La prioridad solo adelanta o retrasa ese mes: **no se salta ningún hito exigible**.

| Hito | Etapa | Qué hay que tener | Quién | Evidencia | Pregunta 11 | Mes base L / E | A | B | C | D | E | F |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| **HI-01** | E1 | Patrocinador en la alta dirección y mandato de implantación con perímetro | Consejo o CEO; patrocinador | P32 | D1.01 | Sem. 1 | 1 | 1 | 1 | 1 | 1 | 1 |
| **HI-02** | E1 | Inventario del uso corporativo y del uso no autorizado de IA | Oficina de IA; seguridad | P05; T01 (T02); T21 | D6.03 | 1 / 1 | 1 | 1 | 1 | 1 | 1 | 1 |
| **HI-03** | E1 | Política de uso aceptable y alfabetización básica | Oficina de IA; personas | 31; P43; P45 | D1.04; D5.03 | 3 / 3 | 1 | 1 | 2 | 2 | 1 | 1 |
| **HI-04** | E2 | Ficha de caso y registro de iniciativas con todas las ideas y pilotos en su fase real | Oficina de IA; responsables de producto | P01; T01 | D2.01; D2.03 | 1–3 / 1–3 | 1 | 2 | 1 | 1 | 1 | 1 |
| **HI-05** | E2 | Inventario completo con clasificación regulatoria, intensidad y responsable, incluida la IA de terceros | Oficina de IA; riesgos; jurídico | P04; P05; P07; 32; 36 §8 | D6.05 | 6 / 9 | 2 | 1 | 2 | 1 | 2 | 1 |
| **HI-06** | E2 | Diagnóstico C1: madurez verificada, índice de transformación y huella tecnológica | Oficina de IA; evaluador independiente | P33; P34; T15; T14 | D7.08 | 1–2 / 1–2 | 1 | 1 | 1 | 1 | 1 | 1 |
| **HI-07** | E2 | Tesis, ambición por esfera y apetito de riesgo aprobados por el consejo (C2) | Patrocinador; consejo | P35; 13 | D1.05 | 3 / 3–4 | 2 | 2 | 2 | 2 | 2 | 2 |
| **HI-08** | E3 | Comité de IA, oficina de IA y comisión delegada constituidos | Comité de dirección; consejo | P38; 30 | D1.07 | 3 / 4 | 2 | 2 | C | C | 2 | 1 |
| **HI-09** | E3 | **Roles separados** en cada iniciativa: responsable de producto, técnico y de operación, responsable de riesgos independiente y **auditor de IA** (en Enterprise, en todos los *gates*) | Comité de IA | P03; P41; 01 §8 | D1.08 | 3 / 4 | 2 | 2 | 2 | 1 | 2 | 1 |
| **HI-10** | E3 | Responsable de riesgos de IA independiente y **registro de riesgos con la escala del 33** desde la fase 3 | Comité de IA; riesgos | 33; P12; P13; T06 | D6.04; D6.06 | 6 / 9 | D | 2 | 2 | 1 | 1 | 1 |
| **HI-11** | E3 | Ciclo de vida con *gates* registrados para toda iniciativa nueva | Oficina de IA; decisores de *gate* | 20; 21; 22; P29; T03 | D2.06 | 4 / 6 | 2 | 2 | 2 | 2 | 1 | 1 |
| **HI-12** | E3 | **Regularización** de lo que está en producción (revisión equivalente a G7, primero lo de más riesgo) | Responsables de operación; auditor de IA | 90 §5; 14 §11; P30 | D4.07 | 6–12 / 6–12 | · | 2 | 2 | 1 | 2 | 1 |
| **HI-13** | E2 | Decisión de **parar o escalar** cada piloto: G3 como puerta de parada y embudo en T01 | Comité de IA | 21 §6 (G3); T01 | D2.04; D2.09 | 4 / 6 | D | D | 2 | 2 | 1 | 2 |
| **HI-14** | E4 | Reglas de medición del valor, línea base e hipótesis falsable en cada iniciativa desde G2 | Control de gestión; responsables de negocio | 40; P08; P09; T11 | D2.08; D7.03; D7.05 | 6 / 9 | 2 | 2 | 2 | 2 | 1 | 2 |
| **HI-15** | E4 | **Panel de la dirección** (informe periódico) y **panel del consejo** | Oficina de IA; comisión delegada | 60; P67; T17 | D7.04 (dirección); D7.06 (consejo); D1.09 | 3 (dirección) · 6 / 9–12 (consejo) | 2 | 2 | 2 | 2 | 2 | 1 |
| **HI-16** | E3 | Seguridad de agentes y exigencia a proveedores N1–N3 | Seguridad; compras; riesgos | 35; 36; P14; P18; P55 | D6.08 | Antes de G5 | D | 1 | D | 2 | D | 1 |
| **HI-17** | E4 | Operación bajo control: manual, monitorización y deriva, reversión probada, R6 vigente | Responsables de operación | 52; P24; P25; P65 | D4.05; D4.06; D4.07 | 9 / 12–15 | D | · | D | 1 | D | 1 |
| **HI-18** | E4 | No conformidades e incidentes con el proceso de 01 §12 | Riesgos; auditoría | 37; P50; P26 | D6.07 | 6 / 9 | 3 | 2 | 2 | 2 | 2 | 1 |
| **HI-19** | E4 | Adopción y personas: plan de adopción, capacidad liberada separada del ahorro e información a la representación | Personas; responsables de negocio | 23; 50; P20; T20 | D5.07; D5.08; D5.09 | Antes de G4 | D | 1 | 2 | 2 | 2 | 1 |
| **HI-20** | E3 | Datos y conocimiento con propietario, base legal y vigencia (también las fuentes de la IA generativa) | Propietarios de datos; protección de datos | 51; P64 | D3.03; D3.05; D3.08 | 6 / 9 | D | · | 2 | C | 2 | 1 |
| **HI-21** | E5 | Primera auditoría del marco por la tercera línea o un externo | Auditoría interna | 38; P58–P61 | D6.10 | 12 / 12 | 3 | 3 | 3 | 3 | 3 | 3 |
| **HI-22** | E5 | C5: madurez recalculada con el mismo cuestionario, índice, tesis revisada y declaración de aplicación | Comité de IA; consejo | P37; P61; 01 §14 | Preguntas (§14) | 6–12 / 13–18 | 3 | 3 | 3 | 3 | 3 | 3 |

**Reglas del recorrido.**

1. **HI-01 va antes que todo.** Con MP5 activo, el recorrido no empieza.
2. **Ningún hito exigible desaparece.** «·» solo significa «todavía no aplica»: aparece cuando se activa el disparador (01 §9; disparadores del 94).
3. **Convalidar (C)** exige documentar la correspondencia entre lo existente y lo que pide SEVEN-G (D31) y verificarla. No es un «ya lo tenemos» declarado.
4. **Un hito está cumplido cuando su pregunta del 11 está en «Sí» en una evaluación verificada.** Hasta entonces se puede marcar como «en curso». Por eso el recorrido y la madurez comparten evidencia.
5. **Rasgos:** cuando hay rasgos, cada hito toma la prioridad más urgente entre el arquetipo principal y sus rasgos.
6. La **declaración de aplicación** (01 §14) exige lo mismo a todos los arquetipos.

> **Por qué importa.** El recorrido responde a «qué hago el lunes» sin rebajar lo que se exige. Como cada hito se acredita con una pregunta del documento 11, avanzar en el recorrido **es** subir de madurez con evidencia, no con una lista de tareas paralela.

### 3.3 Qué le toca a cada rol

Documento 96 §5: una tabla de roles (patrocinador, oficina de IA, comité de IA, responsable de riesgos, auditor de IA, responsables de producto, técnico y de operación, responsable de negocio del beneficio, control de gestión, personas, protección de datos, consejo) × etapas, con los hitos que lidera cada uno. Se genera a partir de la columna «Quién» del catálogo, sin información nueva.

### 3.4 Ejemplos ilustrativos (ficticios)

Documento 96 §6: tres recorridos narrados, marcados como ficticios (D17):
- una empresa industrial mediana PP-A con MP5 resuelto en la semana 1;
- una aseguradora PP-D con rasgo PP-E y modificadores MP1, MP2 y MP4 (validación de modelos convalidada);
- una empresa de servicios PP-B que despliega un asistente en la suite ofimática y mide la adopción por unidad.

---

## 4. Madurez en tres lentes (documentos 11 §7.6 y 12 §3.7)

### 4.1 Las tres lentes

| Lente | Pregunta | Escala | Dónde | Cómo se obtiene |
|---|---|---|---|---|
| **1 · Capacidad de gobierno** | ¿Lo hace con control? | 0–5 por dimensión D1–D7 y global (sin cambios) | 11 | T15 (cuestionario verificado) |
| **2 · Huella tecnológica** | ¿Qué IA tiene **en uso** y cuánta exigencia de gobierno supone? | **HT0–HT5**, descriptiva (no es una nota) | 11 §7.6 (nuevo) | Desde T01: tecnología y autonomía de las iniciativas en uso (fases 6–7, sin cerrar). Sin registro, desde Q01 de T23 |
| **3 · Alcance del impacto** | ¿A qué afecta: tarea, proceso, personas y organización, modelo de negocio? ¿Optimiza o transforma? | **IM1–IM4** por iniciativa y distribución en la compañía, junto con el perfil del índice | 12 §3.7 (nuevo) | Desde T01: ambición real y verificación de IT-P1 a IT-P4 (esquema 0.5) |

### 4.2 Huella tecnológica HT0–HT5

El orden es de **exigencia de gobierno creciente**, no de «mejor tecnología». Se informa el **nivel más alto en uso** y la **amplitud** (número de tipos y de sistemas en uso). Los pilotos se muestran aparte como «en exploración».

| Nivel | Nombre | Qué hay en uso | Correspondencia con la tecnología de T01 |
|---|---|---|---|
| **HT0** | Sin IA en uso | Nada en producción (puede haber uso no autorizado) | Sin iniciativas en fases 6–7 |
| **HT1** | Automatización sin aprendizaje | Reglas o RPA. **No es IA** a efectos del inventario (32), pero se registra como contexto | `reglas` |
| **HT2** | IA de terceros incluida | Asistentes corporativos, SaaS o productos con IA; la compañía no construye | `ia_terceros_embebida` |
| **HT3** | Modelos predictivos propios | ML predictivo, visión, optimización con aprendizaje | `ml_predictivo`, `vision`, `optimizacion` |
| **HT4** | IA generativa en procesos | Lenguaje, documentos, generación y recuperación integradas en procesos; agentes que solo proponen (A0–A1) | `ia_generativa`, `lenguaje_documentos`; `agente` con A0–A1 |
| **HT5** | Agentes que actúan | Agentes con autonomía A2 o A3 sobre terceros, dinero, datos personales o producción (D22) | `agente` con A2–A3 |

### 4.3 Alcance del impacto IM1–IM4

Se deriva de las cinco preguntas del documento 12 §3.1. No añade preguntas.

| Nivel | Alcance | Condición (con evidencia verificada, 12 §3.4) | Ambición típica |
|---|---|---|---|
| **IM1** | Tarea | Mejora una tarea dentro de un proceso que no cambia | Optimizar |
| **IM2** | Proceso | IT-P2 = sí: proceso rediseñado de extremo a extremo | Optimizar o Aumentar |
| **IM3** | Personas y organización | IT-P3 = sí: cambian roles, estructura o quién decide | Aumentar o Transformar |
| **IM4** | Modelo de negocio | IT-P1 o IT-P4 = sí: cambia la propuesta de valor o hay ingresos nuevos | Transformar |

Se toma el nivel más alto que se cumpla. En la compañía se muestra la distribución de las iniciativas en uso por nivel, junto con el perfil del índice (Exploración dispersa · Eficiencia táctica · Eficiencia a escala · Transformación en curso). Así queda visible, sin un número nuevo, lo que el autor describía: «afecta a procesos, o a procesos y personas; optimiza o transforma».

### 4.4 Gobierno mínimo exigible por huella y alertas

La huella **no sube ni baja** el nivel de madurez. Fija un **mínimo exigible** por dimensión, con el mismo espíritu que 11 §8. Valores iniciales, **a calibrar en C5**:

| Huella en uso | Mínimo exigible |
|---|---|
| HT1–HT2 | D1 ≥ 1 · D6 ≥ 2 (inventario iniciado y responsable de riesgos) |
| HT3 | D1 ≥ 2 · D3 ≥ 2 · D4 ≥ 2 · D6 ≥ 2 |
| HT4 | D1 ≥ 2 · D3 ≥ 3 (D3.08, fuentes de conocimiento) · D4 ≥ 3 (D4.08, evaluación antes de cada cambio) · D6 ≥ 3 |
| HT5 | D1 ≥ 3 · D4 ≥ 3 · D6 ≥ 3 (D6.08, controles de agentes) · D5 ≥ 3 |

| Alerta | Cuándo salta | Color | Qué pide |
|---|---|---|---|
| **Adopción por delante del gobierno** | Alguna dimensión por debajo del mínimo exigible por la huella en uso | Rojo si es D6 o D1; ámbar en las demás | Plan de mejora prioritario en P34 §6.6. Ninguna iniciativa nueva de ese nivel de huella pasa G5 mientras D6 esté por debajo |
| **Gobierno sin uso** | Nivel global ≥ 3 y huella ≤ HT2, o ninguna iniciativa en uso doce meses después de C2 | Ámbar | Revisar la cartera y el embudo (14; D2.09): el marco no debe convertirse en burocracia sin valor |
| **Transformación sin personas** | Alguna iniciativa en uso en IM3 o IM4 con D5 ≤ 2 | Rojo | Plan de adopción y de personas (23, 50; D5.07, D5.08) antes del siguiente *gate* |

La lectura cruzada con el índice (12 §5.3, «Transformación declarada, no evidenciada») se mantiene y se muestra junto a estas alertas.

> **Por qué importa.** Al consejo le interesa si la compañía tiene más IA, pero sobre todo si esa IA está bajo control y si cambia algo más que tareas. Tres lentes juntas lo contestan sin inflar la madurez: una compañía con agentes y D6 = 2 no aparece como «más madura», aparece con una alerta roja.

### 4.5 Qué cambia en el documento 11 §1.1

La fila «Cuánta IA usa la compañía ni lo avanzada que es su tecnología» de la columna «no mide» se mantiene. Se añade una nota: «se muestra aparte como huella tecnológica (§7.6), que no puntúa pero fija el gobierno mínimo exigible».

---

## 5. Paneles y herramientas

### 5.1 T23 · Recorrido de implantación (herramienta nueva)

- **Ubicación y construcción:** `SEVEN-G/herramientas/T23_recorrido_implantacion/`. Se genera con `build_recorrido.ps1` desde `recorrido.json` (arquetipos, modificadores, preguntas Q01–Q12, hitos con sus columnas) y `_fuentes/recorrido.plantilla.html`. `recorrido.json` se **extrae del documento 96** (§2.1, §2.3, §2.4, §3.2; ES/EN) con `-ActualizarRecorrido`, y cada construcción comprueba que coincide, con el mismo patrón que `perfiles_nist.json` y el documento 34.
- **Funciones:**
  1. cuestionario Q01–Q12, que da el arquetipo, los rasgos y los modificadores, con la explicación de por qué;
  2. el recorrido por etapas: hitos ordenados por prioridad, con quién, evidencia, pregunta del 11 y enlaces;
  3. el estado de cada hito (pendiente, en curso, cumplido, convalidado). Si hay una evaluación de T15 en el navegador, un hito cuyas preguntas están en «Sí» aparece «cumplido según T15», y el resto es manual;
  4. vista por rol (§3.3);
  5. impresión o PDF del plan y exportación CSV.
- **Datos:** almacenamiento local `seveng-t23-datos-v1`; módulo `datos_locales.js` incrustado (D103); lee T01 (Q01 propuesta desde la tecnología en uso) y T15. Es opcional y nada se pisa sin marcarlo (D100, D102). Fichero de compañía `herramientas/datos/T23_recorrido.json` (D103).
- **Requisitos del sitio:** ES/EN, tema salmón, barra del sitio (D87), `codigos.js` con `data-ir-codigo` y `data-enlazar-codigos` (D99), aviso legal con la exención (D113), sin dependencias (D27).
- **Demostración:** la compañía ficticia de T01, que con sus datos resulta PP-F (hay ML, IA generativa y agentes). Se añade un segundo ejemplo cargable PP-B para enseñar un recorrido distinto.

### 5.2 T15 · vista «Tres lentes»

- Nueva vista en T15 con tres bloques:
  - lente 1: niveles D1–D7 y global, sin cambios;
  - lente 2: huella HT desde T01, con amplitud y pilotos «en exploración»;
  - lente 3: distribución IM desde T01 y perfil de T14 si existe (`seveng-t14-resumen-v1`).
- Muestra las alertas de §4.4 y la tabla del mínimo exigible frente al nivel actual.
- Sin T01 en el navegador, la huella y el alcance se introducen a mano, marcados «manual».
- **Esquema 0.8 de T01** (solo campos opcionales, D53): `madurez[].lentes` = `{huella: {nivel, amplitud, tipos[], sistemas_en_uso, pilotos}, alcance: {IM1, IM2, IM3, IM4}, alertas[]}`.
- **T17:** el conector (Python y JS, idénticos, 19b) pasa `lentes`, y la tarjeta «Madurez de la compañía» añade una fila con la huella, la distribución del alcance y las alertas. En el móvil, una línea por lente.

### 5.3 Entrada, portada y resto del sitio

- **Entrada ligera** (`SEVEN-G/build/entrada/<idioma>/index.html`): nueva sección **«¿Por dónde empieza su compañía?»** entre QUICK-CHECK y «Por dónde empezar», con dos tarjetas:
  - «Su punto de partida y su recorrido» → T23 y documento 96;
  - «Su madurez en tres lentes» → T15, vista tres lentes, y 11 §7.6.

  Cada tarjeta lleva «Qué está viendo» y «Cómo se llega», como las del QUICK-CHECK (D107).
- **Portada** (ES/EN): enlace en el bloque de SEVEN-G sin alterar el orden de D46 (tras la biblioteca o en una sección nueva «Empezar según su punto de partida»).
- **Documento 00:** fila del 96 en §10; en el inicio rápido, «formas de empezar» remite a T23 para quien quiera un plan a medida.
- **Curso M09** (implantar por capas, ES/EN): recorrido por T23 con un ejercicio con la demostración.
- **Cifras escritas a mano** (portada, entrada, README; D104, sección 22): +1 documento (96) y +1 aplicación (T23).

---

## 6. Qué documentos se tocan (ES y EN siempre)

| Documento | Cambio |
|---|---|
| **96** (nuevo) | Puntos de partida y recorrido de implantación: §1 objeto; §2 arquetipos, regla, modificadores y cuestionario; §3 etapas; §4 catálogo de hitos con reglas; §5 roles por etapa; §6 ejemplos ficticios; §7 relación con 90, 11, 12 y 94; herramientas; documentos relacionados; versiones. Directiva `esencial: recomendado`. «Por qué importa» en cada concepto nuevo |
| **90** | §1 y §2: remisión al 96 para el orden según el punto de partida; §5, regularización: remisión a HI-12; §10 herramientas: T23 |
| **11** | §1.1 nota; **§7.6 Lectura en tres lentes** (HT, mínimo exigible, alertas); §8 remisión; §10: T15 vista tres lentes |
| **12** | **§3.7 Alcance del impacto IM1–IM4**, derivado de IT-P1 a IT-P4 |
| **02** | Glosario: arquetipo de punto de partida (PP-A…F), modificador (MP1–MP5), hito de implantación (HI-nn), huella tecnológica (HT0–HT5), alcance del impacto (IM1–IM4), alertas; códigos en la tabla de §6; `guia_traduccion_en.md`: *starting point archetype*, *implementation milestone*, *technology footprint*, *impact reach* |
| **03** | Catálogo: **T23** con su estado; §4.1 mapa de datos (T23 lee T01 y T15; T15 escribe `lentes`); `mapa_datos.json` |
| **94** | §6: 96 como Recomendado; §7: T23 como Recomendado; disparadores si procede |
| **00** | §10 fila del 96; inicio rápido |
| **Curso M09** | Recorrido con T23 |
| Especificación común | §5.9 códigos PP-, HI-, HT, IM; §6 herramienta T23 |

**Comprobar colisiones de códigos:** PP-, HI-, HT0–HT5, IM1–IM4 y MP1–MP5 no aparecen hoy en la biblioteca (comprobado el 28-09-2026 fuera de `_trabajo`). Se descartó «M1–M5» porque colisiona en apariencia con los modelos de consultoría M1–M5 del documento 91 y con los módulos M01–M09 del curso. por eso los modificadores se llaman **MP1–MP5** (modificador de partida).

---

## 7. Límites y lo que queda a validar por el autor

- Umbrales de asignación: «tres o más pilotos» (PP-E) y «dos de tres tecnologías» (PP-F).
- Prioridades de la tabla de hitos por arquetipo.
- Mínimos exigibles por huella y colores de las alertas: valores de partida, **a calibrar en C5**.
- Los ejemplos del documento 96 §6 son ficticios.
- Nada de esto crea reglas nuevas del marco. Si el 96 discrepa del 90, del 01 o del 11, prevalecen ellos.
