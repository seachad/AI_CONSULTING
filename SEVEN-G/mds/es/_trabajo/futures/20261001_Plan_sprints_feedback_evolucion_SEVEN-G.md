# Plan por sprints · Respuesta al feedback «Informe de recomendaciones para la evolución de SEVEN-G»

| Campo | Valor |
|---|---|
| Fecha | 01-10-2026 |
| Origen | [Feedback externo del 01-10-2026](20261001_Feedback_evolucion_SEVEN-G.md) |
| Estado | **Aceptado por el autor el 01-10-2026** (D143); S3 con la opción C (D144) |
| Ámbito | SEVEN-G (y SPHERES donde toque esferas o niveles, D42) |

---

## 1. Valoración del feedback

El informe es bueno porque no pide más contenido: pide **demostrar que el marco es proporcionado, interoperable y útil en la práctica**. Coincide con lo que ya se veía venir (alertas «gobierno sin uso» de 11 §7.6, umbrales «a calibrar» en casi todas las decisiones, D58 hasta la 1.x). Antes de planificar he contrastado cada punto con lo que el marco ya tiene, porque varias recomendaciones están **parcialmente resueltas** y conviene no rehacerlas.

| # | Recomendación | Qué hay hoy | Hueco real | Peso |
|---|---|---|---|---|
| 1 | No añadir contenido; consolidar | 42 documentos, 74 plantillas, 7 aplicaciones; cada sesión añade algo | No hay ninguna regla que frene el crecimiento | **Alto** (es la condición de todo lo demás) |
| 2 | Riesgo de sobregobierno · nivel **Express** | Lite agrupa G0–G2 y G4–G5, pero 94 §3 regla 4 «ninguna fase ni puerta se salta», regla 5 «G3 siempre por separado» y 01 §14 condición 4 «todas las iniciativas nuevas recorren el ciclo» | Lite reduce profundidad, **no recorrido**. Una iniciativa de 25 h paga casi el mismo circuito que una de 400 h. El único camino «ligero» es el uso corporativo de herramientas generales (31 §5), que no es una iniciativa | **Alto** · exige decisión del autor: toca reglas del núcleo |
| 3 | Referenciar evidencia, no reproducirla | D31 (compatibilidad con marcos propios); 96 «convalidar» órganos y procesos (prioridad C); 21 EV.01 admite «registro de origen» y EV.14 evidencias de terceros; T01 `evidencias[]` ya tiene `enlace`, `version`, `autor`, `fecha` | No está dicho como principio; EV.10 exige «campos obligatorios de la plantilla», lo que empuja a copiar. No hay tabla de equivalencias (DPIA corporativa → P47, business case → P08…). T01 no distingue evidencia propia de evidencia referenciada | **Alto** · barato y de gran efecto en grandes compañías |
| 4 | Crosswalk riguroso y versionado | 34 §5.3–§5.5 (CSF, AI RMF 72 subcategorías), P74 (42001 anexo A, 38 controles), 34 mapeo del Reglamento de IA; 33 cita 23894; 34 cita 42005 como referencia de P11 | Faltan **42001 cláusulas 4–10** (el sistema de gestión, no solo el anexo A), **38507**, **23894** y **42005** con detalle; no hay escala común de cobertura (directo / parcial / control externo / no cubierto); no es un dato único y versionado, son tablas repartidas | **Medio-alto** · da credibilidad y sostiene el posicionamiento |
| 5 | Núcleo obligatorio vs. práctica vs. instrumento | 94 §2.2 (cinco niveles de obligatoriedad), 94 §3 (doce reglas), 01 §14 (siete condiciones para declarar) | **Dos listas de «lo mínimo» que no coinciden** (94 §3 y 01 §14). La clasificación de 94 es por documento, no por regla. No hay un «núcleo» estable con su propia versión | **Alto** · base de Express y de la 1.0 |
| 6 | Medir el coste del gobierno | IND-COS-11 cuenta el coste de gobierno solo a nivel compañía; T01 guarda fechas de evento (permite tiempo en *gate*) | No hay horas de gobierno por iniciativa, ni tiempo por *gate* como indicador, ni % de evidencia reutilizada, ni ratio gobierno/coste total, ni objetivos de proporcionalidad | **Medio-alto** · sin esto Express y Lite no se pueden calibrar |
| 7 | Validación empírica | 92 tiene 8 casos **ficticios**; comunidad en servicio (D80); galería por sector (D136) con datos ficticios | Ningún caso real; ningún protocolo de piloto | **Alto, pero no lo puede hacer Claude**: depende del autor y de compañías reales |
| 8 | Calibrar el índice de transformación | 12 y T14 marcan «umbrales v0.1, a calibrar» | Sin datos reales no se puede | **Bajo ahora**, depende del 7 |
| 9 | Valor, rendimiento y riesgo separados | 40 regla 7 (valor no cuantificado, nunca en euros), D135 (`no_cuantificado[]`, niveles 0–3), panel con riesgo y semáforos | Está casi resuelto. Falta presentarlo siempre como **tres columnas paralelas** por iniciativa (ficha T01, ficha del panel, paquete del consejo) y dejar explícito que no se fusionan | **Bajo** · ajuste de presentación |
| 10 | Simplicidad como requisito de diseño · posicionamiento como *operating model* | D31; 04 dice en qué se diferencia; la entrada habla de «tres respuestas» (D129) | No hay principio de diseño escrito («ninguna evidencia dos veces…») ni prueba que lo vigile; el posicionamiento frente a ISO/NIST no está formulado como «capa operativa» | **Medio** |

### 1.1 Dónde discrepo o matizo

- **Express no puede ser un atajo.** Si el «bajo coste» lo declara el propio patrocinador, Express se convierte en la vía para no pasar por G3. Recomiendo que la elegibilidad la confirme la función de riesgos (o la oficina de IA en compañías pequeñas), que cualquier disparador de 94 §4 saque automáticamente a la iniciativa de Express, que la ficha viva siga siendo una iniciativa del registro T01 (regla 2) y que la reversión y una revisión de continuidad (anual) sigan siendo obligatorias.
- **«No añadir contenido» y a la vez Express y crosswalk** suenan contradictorios. Propuesta: regla de **presupuesto de contenido** para el camino a la 1.0 —ningún documento numerado nuevo; Express va dentro de 01 §9 y 94; el crosswalk vive como datos (JSON) que generan las tablas de 34 y P74, no como documento nuevo— y cada sprint debe dejar el marco igual o más corto en lo que se exige a una iniciativa Lite.
- **Medir horas de gobierno también es carga.** Si se pide imputar horas en cada *gate*, se añade burocracia para medir la burocracia. Recomiendo: horas **declaradas y opcionales** por *gate* (un campo, sin desglose), tiempo por *gate* **calculado** de las fechas que T01 ya guarda, y % de evidencia referenciada **calculado** del tipo de evidencia. Nada se estima (D100): sin dato es «sin dato».
- **Crosswalk con normas ISO de pago.** Solo puede citarse el número de cláusula o control y un resumen propio (como ya hace P74), con enlace a la ficha oficial de ISO (D41, D114). No se reproduce texto de la norma.
- **La validación empírica no la puede hacer Claude.** Lo que sí se puede preparar es el protocolo, los instrumentos de recogida y la forma de publicar casos reales anonimizados sin romper D17.

---

## 2. Principios del plan

1. **Primero decidir el núcleo, después aligerar el recorrido, después medir, después demostrar.** Express sin núcleo claro es una excepción más; métricas sin Express no tienen nada que comparar.
2. **Presupuesto de contenido**: ningún documento numerado nuevo hasta la 1.0 salvo decisión expresa del autor. Las novedades van dentro de documentos existentes o como datos que generan tablas.
3. **No romper nada hacia atrás** (D53): Express es una intensidad más; los registros T01 actuales siguen siendo válidos (campos opcionales, esquema 0.9 o el que toque).
4. **ES/EN en la misma entrega** (D12), verificación en verde y commit y push al cerrar cada sprint (D52); cada regla nueva comprobable entra en `verificar_coherencia.ps1`.
5. Cada sprint cabe en **una o dos sesiones**; si crece, se parte.

---

## 3. Sprints

Resumen del orden y de las dependencias:

| Sprint | Tema | Recomendaciones del feedback | Depende de | Decisión previa del autor | Tamaño |
|---|---|---|---|---|---|
| **S0** | Medir la carga actual y concretar el presupuesto de contenido | 1, 2, 6 | — | Presupuesto aceptado (D143); confirmar el perfil Express | 1 sesión |
| **S1** | Núcleo normativo y principio de proporcionalidad | 3, 7, 10 | S0 | Sí: lista del núcleo | 1–2 sesiones |
| **S2** | Referenciar evidencia antes que reproducirla | 4 | S1 | Ligera | 1–2 sesiones |
| **S3** | Intensidad Express (opción C) | 2, 3 | S1, S2 | Decidido (D144): cambia solo la regla 4 de 94 §3; G3 sigue por separado | 2–3 sesiones |
| **S4** | Métricas del coste del gobierno | 6, 8 | S3 | Sí: objetivos de proporcionalidad | 1–2 sesiones |
| **S5** | Crosswalk versionado con ISO, NIST y Reglamento de IA | 5, 6 | S1 | Ligera | 2–3 sesiones |
| **S6** | Tres perspectivas: valor, resultado operativo y riesgo | 9 | — (puede ir en paralelo) | No | 1 sesión |
| **S7** | Posicionamiento como modelo operativo de IA | 5, 10 | S1, S5 | Sí: textos | 1 sesión |
| **S8** | Programa de validación en organizaciones reales | 7, 8 | S4 | Sí: todo el programa | 1 sesión de preparación + meses de campo |
| **S9** | Calibración y criterios de salida a la 1.0 | 7, 8 | S8 con datos | Sí | Cuando haya datos |

Orden recomendado: **S0 → S1 → S2 → S3 → S4**, con **S6** intercalable en cualquier hueco; **S5 → S7** tras S1; **S8** se prepara en cuanto esté S4, y **S9** queda a la espera de datos reales.

---

### S0 · Medir la carga actual y fijar el presupuesto de contenido

**Objetivo.** Tener una línea base honesta de cuánto pide hoy SEVEN-G a una iniciativa antes de cambiar nada. Sin esa cifra, «Lite es ligero» es una opinión.

**Alcance.**
- Recuento, desde `catalogo_criterios.json` y los documentos 20, 21, 22 y 94, de lo que exige el recorrido completo de **tres perfiles tipo**: (a) asistente interno de bajo coste, reversible, sin datos sensibles (candidato a Express); (b) caso Lite típico; (c) caso Enterprise (agente A2 o Transformar). Para cada uno: sesiones de decisión, criterios evaluados, criterios «Sí ◆», plantillas que deben rellenarse, campos obligatorios, personas distintas que intervienen y riesgos tipo propuestos por T06 (D106 ya detectó 49 para un A2 Enterprise).
- Estimación **ilustrativa y marcada como tal** de horas de gobierno por perfil, con supuestos explícitos (minutos por criterio, por plantilla, por sesión), solo como orden de magnitud para conversar con el autor.
- Lista de **evidencias pedidas más de una vez** (mismo dato en dos plantillas; por ejemplo, valor en P08, P10 y P28 según EV.11) y de **participantes que podrían sobrar** en cada decisión Lite.
- Propuesta de **presupuesto de contenido** hasta la 1.0.

**Entregable.** `_trabajo/futures/S0_Linea_base_carga_de_gobierno.md` (no publicado) con tablas por perfil, duplicidades detectadas y propuesta de presupuesto de contenido.

**Decisión del autor al cerrar.** El presupuesto de contenido ya está aceptado (D143); al cerrar S0 se confirma el perfil que define Express y la propuesta de lista de criterios Express para S3 (D144).

**Hecho cuando.** Las cifras salen de los ficheros (no a mano) con un script reproducible en `_trabajo/futures/`, y el autor ha decidido.

---

### S1 · Núcleo normativo y principio de proporcionalidad

**Objetivo.** Un núcleo pequeño y estable que diga qué hay que cumplir para decir que se aplica SEVEN-G, separado de las prácticas recomendadas y de los instrumentos opcionales.

**Alcance.**
- **Unificar 94 §3 (doce reglas) y 01 §14 (siete condiciones)** en una sola lista: el **núcleo SEVEN-G**, con código propio (por ejemplo, N-01…N-12) y versión independiente de la de los documentos. Hoy no coinciden: 94 §3 incluye inventario, separación de funciones, «Sí ◆», reversión; 01 §14 incluye C1/C2, panel y no conformidades. Propuesta: el núcleo son **principios de control** (qué debe ser cierto), no pasos (qué documento rellenar).
- Clasificar cada regla, documento, plantilla y herramienta en **Principio obligatorio · Práctica recomendada · Instrumento opcional**, aprovechando los cinco niveles de 94 §2.2 (se añade la columna, no se rehace la matriz).
- Redactar el **principio de proporcionalidad y simplicidad** (recomendación 10 del feedback): *ninguna evidencia se pide dos veces, ninguna decisión necesita más participantes de los necesarios y ninguna iniciativa soporta un coste de gobierno desproporcionado a su riesgo y materialidad*. Va en 01 (principios) y en 94 §3.
- Reformular la regla 4 de 94 §3 para que sea un principio («toda iniciativa supera los controles del núcleo antes de cada compromiso de recursos») y no un recorrido («ninguna fase se salta»), **sin cambiar todavía Lite ni Enterprise**: deja la puerta abierta a S3.
- 01 §14 y P61 (declaración de aplicación) pasan a remitir al núcleo.

**Afecta.** 00 (inicio rápido, «qué exige a cambio»), 01 §2 y §14, 02 (glosario: núcleo, principio, práctica, instrumento), 94 §2–§3, P61, curso M09, `guia_traduccion_en.md`. ES/EN.

**Verificación nueva.** Cada elemento del núcleo existe en ES y EN con el mismo código; 01 §14 y 94 §3 remiten al mismo núcleo; cada fila de 94 §6–§8 tiene categoría.

**Decisión del autor.** Lista final del núcleo (D-nnn). Es la decisión más importante del plan.

---

### S2 · Referenciar evidencia antes que reproducirla

**Objetivo.** Que una gran compañía pueda aplicar SEVEN-G apoyándose en lo que ya tiene (business case, DPIA, vendor risk, Jira, arquitectura, change management), sin copiar a plantillas.

**Alcance.**
- **Principio** en 21 §4 (y en el núcleo de S1): una evidencia corporativa existente satisface un criterio si se identifica con **sistema de origen, referencia, responsable, versión y fecha** y cubre lo que pide el criterio; la plantilla P es entonces una **lista de comprobación de cobertura**, no un documento que rellenar. Ajustar EV.10 («campos obligatorios de la plantilla») para que admita «cubierto por referencia».
- **Tabla de equivalencias** evidencia SEVEN-G ↔ artefacto corporativo habitual (business case → P08/P10; EIPD corporativa → P47; evaluación de proveedores → P55; registro de cambios → evidencia de G5; ficha de arquitectura → P15/P16…), con qué campos debe tener el artefacto externo para valer. Va en 21 (nueva subsección) o en 90 (implantación), no en documento nuevo.
- **T01, esquema siguiente (opcional, D53)**: en `evidencias[]`, campos `origen` (`plantilla` · `referencia_externa`), `sistema_origen` y `criterios_cubiertos[]`; la ficha distingue evidencia propia y referenciada; el panel y T14 no cambian. Ayuda (D123) en ES/EN.
- Conectar con 96 (prioridad «C · convalidar») para que la convalidación de órganos y procesos y la de evidencias sigan la misma lógica.

**Afecta.** 21, 22 (LV-EV), 90, 96, 03 §4, esquema y plantilla de T01, `mapa_datos.json`, `datos_demo.json` (dos o tres evidencias referenciadas de ejemplo), README de T01. ES/EN.

**Verificación nueva.** Esquema nuevo admitido; la demostración contiene evidencias referenciadas; cada fila de la tabla de equivalencias apunta a una plantilla existente.

---

### S3 · Intensidad Express (opción C, decidida: D144)

**Objetivo.** Que el recorrido —no solo la profundidad— dependa de materialidad, riesgo y reversibilidad, **sin perder G3 como puerta de parada**.

**Por qué la opción C.** Medido en `catalogo_criterios.json` (01-10-2026): una iniciativa Lite evalúa hoy **97 de los 100 criterios** de G0–G5 (34 «Sí ◆») con **33 plantillas** distintas y 3 sesiones. La carga está en los criterios y las plantillas, que fija la regla 4 de 94 §3 («cada puerta conserva sus criterios»), no en la regla 5 (G3 por separado). Por eso Express **modifica solo la regla 4**; la regla 5 se mantiene. Se descartaron: la opción A (Express también junta G3 con G0–G2), porque debilita la puerta de parada y obliga a cambiar diagrama de flujo, mapa de uso, entrada, cursos, modelo de *gates* de T01 y medianas del embudo; y la opción B («Lite con decisión consolidada»), porque solo ahorra una reunión.

**Diseño.**
- **Elegibilidad** (todas a la vez): ningún disparador 1–8 de 94 §4 (criterios Enterprise); uso interno; reversible en días sin efecto residual; sin datos personales o solo de empleados con base legal ya existente; autonomía A0 o A1; inversión y coste anual bajo un **umbral Express fijado en C2**; proveedor ya homologado (P55 vigente) si lo hay. **Lo confirma la función de riesgos** (oficina de IA en compañías pequeñas), no el patrocinador.
- **Recorrido: tres decisiones, las mismas puertas.** *Entrada* (G0–G2 en una decisión), **G3 por separado** y *puesta en uso* (G4–G5 en una decisión). G3 en Express **puede resolverse por escrito, sin sesión**: decide el patrocinador con la conformidad de riesgos registrada en T01. Cada puerta sigue registrada con su resultado (no se salta ninguna), pero se evalúa con la **lista reducida de criterios Express**.
- **Lista reducida**: columna nueva en `catalogo_criterios.json` (por ejemplo `x`: `si` · `na`) que marca los criterios que aplican en Express; orden de magnitud a fijar en S0 (20–30 criterios en total), incluidos siempre los «Sí ◆» que correspondan al perfil (seguridad, cumplimiento, supervisión humana), la hipótesis falsable con línea base y criterio de parada (regla 9), la clasificación y el riesgo (regla 10) y la reversión probada (regla 11).
- **Ficha viva única** como evidencia (sección condensada de P01 o P29, no plantilla nueva, por el presupuesto de contenido de D143); evidencias corporativas por referencia (S2).
- **Revisión de continuidad anual**, que puede convertirse en G7.
- **Salida automática** a Lite si aparece cualquier disparador, si se supera el umbral o si la revisión anual no demuestra valor; T01 guarda el cambio de intensidad como evento y, desde ese momento, aplica la lista Lite.
- **Lo que no cambia**: reglas 1–3 y 5–12 de 94 §3 (inventario, registro, intensidad por iniciativa, **G3 por separado**, separación de funciones, «Sí ◆», evidencia anterior a la decisión, reversión, consejo).

**Alcance.**
- **Documentos (ES/EN)**: 94 §3 (regla 4 reformulada: «cada puerta conserva su registro y se evalúa con la lista de criterios de su intensidad»), §5 (columna Express) y §6–§8; 01 §9 (tercera intensidad, tabla 9.3 y figura `intensidad`) y §14 (condición 4 matizada); 21 §3.4 (puertas agrupadas en Lite y Express; G3 por escrito en Express); 20 (qué se hace en cada fase en Express); 22 (lista LV-EXP o filtro Express de las LV); 90 §2.4 (ruta mínima); 96 (prioridades por arquetipo: PP-A y PP-B empiezan con casi todo en Express); 02 y guía de traducción («Express» no se traduce); 00 (intensidades); curso M04 y M09; cursos en presentación (diapositiva de intensidades).
- **No cambian**: diagrama `flujo-uso`, mapa de uso del 00, sección de la puerta de parada de la entrada, modelo de *gates* de T01 y etapas del embudo de T17.
- **T01**: valor `express` de intensidad en el esquema (opcional, D53), lista de criterios Express en la pestaña del *gate*, ficha viva, G3 por escrito, alerta de salida de Express. **T17**: filtro y recuento por intensidad (conectores Python y JS a la vez, 19b). **T23**: el recorrido propone Express donde aplique. Ayuda ES/EN (27, 28). Demostración con una o dos iniciativas Express.
- **Verificación nueva**: todo criterio del catálogo tiene valor Express; los «Sí ◆» de seguridad, cumplimiento y supervisión humana aplican en Express cuando corresponden al perfil; 94 §3 regla 5 sigue sin excepción; la demostración contiene iniciativas Express con G3 registrado.

**Decisiones pendientes del autor dentro de S3.** Lista final de criterios Express (propuesta de Claude tras S0), umbral Express de partida para el ejemplo y si la elegibilidad la confirma riesgos u oficina de IA según el alcance de la compañía.

**Partir si crece.** S3a documentos y catálogo; S3b herramientas y panel.

---

### S4 · Métricas del coste del gobierno y objetivos de proporcionalidad

**Objetivo.** Medir el propio método, como pide el feedback, sin añadir carga relevante.

**Alcance.**
- Cuatro indicadores nuevos en el documento 41 (familia COS o una familia GOB): **horas de gobierno por iniciativa** (declaradas, opcionales), **tiempo para superar cada *gate*** (calculado: solicitud → decisión, desde eventos de T01), **% de evidencias referenciadas** (calculado, de S2) y **ratio coste de gobierno / coste total de la iniciativa** (si hay horas y coste/hora de C2; si no, «sin dato»).
- **Objetivos de proporcionalidad por intensidad** (por ejemplo, ratio máximo orientativo para Express, Lite y Enterprise), marcados «a calibrar en C5».
- **T01**: campo opcional `gates[].horas_gobierno` y `gates[].fecha_solicitud` si no existe; vista con los cuatro indicadores. **T17**: tarjeta «Coste del gobierno» (con su «?» y textos ES/EN en `ayuda_textos.py`), y su fila en «Qué frena el escalado» si los *gates* están parados (FE-2 ya lo cubre en parte: revisar para no duplicar).
- Conectar con IND-COS-11 (coste de gobierno de la compañía) para que cuadre.
- Ajustar la alerta «gobierno sin uso» de 11 §7.6 con estos datos.

**Decisión del autor.** Objetivos de partida de proporcionalidad y si las horas se declaran o no.

---

### S5 · Crosswalk versionado con ISO, NIST y el Reglamento de IA

**Objetivo.** Una sola matriz, versionada, que diga qué requisito, control o *outcome* de cada norma queda soportado por qué proceso y qué evidencia de SEVEN-G, con un nivel de cobertura honesto.

**Alcance.**
- **Fuente única de datos** `SEVEN-G/build/crosswalk/crosswalk.json` (versión, fecha, normas, filas): norma, cláusula/control/subcategoría/artículo (solo código y resumen propio), elemento del núcleo de S1, documento y sección, evidencia (P o campo de T01), cobertura **Directa · Parcial · Requiere control externo · No cubierto**, notas. Las tablas de 34 §5.4–§5.5 y P74 pasan a **generarse** desde ese fichero (como ya se hace con `perfiles_nist.json`), y la verificación falla si divergen.
- Normas: **ISO/IEC 42001** cláusulas 4–10 (nuevo) y anexo A (existente en P74); **ISO/IEC 38507** (nuevo, órganos de gobierno: encaja con 30, 60, 61, 62); **ISO/IEC 23894** (nuevo detalle, encaja con 33); **ISO/IEC 42005** (nuevo detalle, encaja con P11, P47, P48); **NIST AI RMF** (existente, 72 subcategorías); **Reglamento (UE) de IA** (existente en 34, se normaliza al mismo formato); CSF 2.0 se mantiene como está (y el Cyber AI Profile marcado borrador, D110).
- Vista navegable: tabla filtrable por norma y cobertura dentro del documento 34 o como vista de T15 (no herramienta nueva), con exportación CSV.
- Nota visible: el crosswalk **no es una certificación ni una declaración de conformidad** (D25, D113) y debe cotejarse con el texto adquirido de cada norma.
- Alta de las referencias nuevas en el registro con su ficha oficial en iso.org (D41, D114) y en `vigilancia_fuentes.json` si su estado puede cambiar.

**Afecta.** 34 (§4–§5 y nueva sección del crosswalk), 33 §1, 38 §12, P11, P74, 02, `guia_traduccion_en.md`, registro de referencias, `build_madurez.ps1` si se usa T15. ES/EN.

**Partir si crece.** S5a: formato, 42001 cláusulas y migración de P74 y 34 §5.4; S5b: 38507, 23894, 42005 y Reglamento de IA.

---

### S6 · Tres perspectivas: valor económico, resultado operativo y exposición al riesgo

**Objetivo.** Que ninguna pantalla ni informe fuerce a traducir a euros lo que no tiene conversión defendible.

**Alcance.**
- 40: hacer explícita la regla de presentación «tres columnas paralelas, no se fusionan» (ya implícita en la regla 7 y en D135).
- T01 (ficha, pestaña Valor) y T17 (ficha del caso, inventario, paquete): bloque de tres columnas —valor económico (validado/declarado/estimado), resultado operativo (indicadores físicos de 41 con línea base y actual) y exposición al riesgo (residual principal, incidentes abiertos)—; usa datos que ya existen.
- 60 §4.2 (resumen de una página) y 61 (pregunta sobre valor no monetario).
- Ayuda ES/EN, conectores a la vez, regenerar ejemplo, galería y capturas si cambian (D132, D134, D136).

**Puede hacerse en cualquier momento**: no depende de los demás sprints.

---

### S7 · Posicionamiento como modelo operativo de IA

**Objetivo.** Decir con claridad qué es SEVEN-G frente a los estándares: *los estándares dicen qué debe existir; SEVEN-G es la capa operativa que lo hace funcionar iniciativa a iniciativa y cartera a cartera, con disciplina de inversión y valor.*

**Alcance.**
- 00 (inicio rápido y §1), 04 (en qué se diferencia: nueva tabla «qué aporta cada norma / qué añade SEVEN-G» que remite al crosswalk de S5), entrada (D91, D129) y portada (ES/EN), README, cursos (diapositiva de posicionamiento) y 91 (qué decir y qué no prometer).
- Mensajes a evitar: «alternativa a ISO 42001», «equivalente a certificación».

**Depende de S5** para poder remitir a la evidencia del crosswalk, y de **S1** para hablar del núcleo. Textos a validar por el autor.

---

### S8 · Programa de validación en organizaciones reales

**Objetivo.** Preparar lo necesario para que el autor pueda aplicar SEVEN-G en compañías reales y publicar lo aprendido.

**Lo que puede preparar Claude.**
- **Protocolo de piloto** (`_trabajo/futures/S8_Protocolo_piloto.md`): perfiles de compañía buscados (tamaño, sector, punto de partida PP-A…PP-F), duración (un ciclo C1–C2 y dos o tres iniciativas hasta G5), qué se mide (indicadores de S4, madurez T15, recorrido T23, satisfacción con el método), cómo se recoge (exportación JSON de T01 anonimizada) y criterios de éxito del propio método.
- **Instrumentos**: cuestionario breve de fricción por *gate* (5 preguntas) y plantilla de «caso real anonimizado» para el documento 92 (o para la galería), con reglas de anonimización compatibles con D17 y D57.
- **Canal de vuelta**: etiqueta «piloto» en la comunidad (D80) o formulario equivalente, y registro de cambios del marco originados en pilotos (cita a quien aportó, D89).

**Lo que hace el autor.** Conseguir las compañías, acordar confidencialidad y validar qué se publica. Decisión previa: si existe programa de pilotos y en qué condiciones (enlaza con el pendiente de D86 sobre programa de socios).

---

### S9 · Calibración y criterios de salida a la 1.0

**Objetivo.** Usar los datos de S8 para calibrar y decidir cuándo el marco deja de ser 0.x.

**Alcance (cuando haya datos).**
- Calibrar umbrales «a calibrar»: índice de transformación (12, T14), umbral Express, objetivos de proporcionalidad (S4), mínimos por huella (D133), adopción (D63), frenos (D126), realización (D135).
- **Criterios de salida a la 1.0** propuestos: núcleo estable sin cambios en dos revisiones; Express y Lite con ratio de gobierno dentro de objetivo en al menos N pilotos; crosswalk revisado por un tercero; P47, P48, P49, P51, P56 y P74 con revisión jurídica (pendientes ya registrados); al menos N casos reales publicados.
- Al pasar a 1.x: retirar «Versión en revisión: no difundir» (D58) donde indica CLAUDE.md.

---

## 4. Qué no recomiendo hacer ahora

- **Ningún documento numerado nuevo**, ni herramienta nueva (Txx): Express, crosswalk y métricas caben en lo existente.
- **No traducir a euros** el valor no cuantificado para «completar» indicadores (S6 va en sentido contrario).
- **No presentar el índice de transformación como comparable entre compañías** hasta S9; revisar ya los textos que lo sugieran (tarea menor que puede ir en S7).
- **No ampliar la galería a más sectores** (pendiente de D136) mientras dure este plan: es contenido nuevo.

## 5. Decisiones que el autor debe tomar, en orden

1. ~~¿Acepta el plan y el **presupuesto de contenido**?~~ Aceptado el 01-10-2026 (D143).
2. **Lista del núcleo** (al cerrar S1).
3. ~~**Express sí o no**~~ Sí, opción C (D144): modifica solo la regla 4 de 94 §3. Quedan la lista de criterios Express y el umbral de partida (dentro de S3).
4. **Objetivos de proporcionalidad** y si las horas de gobierno se declaran (S4).
5. **Programa de pilotos** y condiciones de publicación (S8).

## 6. Seguimiento

| Sprint | Estado | Sesión / fecha | Decisiones registradas |
|---|---|---|---|
| S0 | **Hecho** ([informe](S0_Linea_base_carga_de_gobierno.md)) | 01-10-2026 | Lista Express: todos los «Sí ◆» + 20 criterios del núcleo (47 en el perfil A, frente a 90) |
| S1 | **Hecho** | 01-10-2026 | D145: núcleo N-01 a N-14 (01 §14.1, 94 §3, P61), principio 11 de proporcionalidad, 94 §2.3 principio · práctica · instrumento. La clasificación se da por clase (94 §2.3) en lugar de una columna por fila: toda plantilla y herramienta es instrumento y todo documento es práctica con su nivel. |
| S2 | **Hecho** | 01-10-2026 | D146: 21 §4.3 con requisitos y tabla de equivalencias; EV.10 y LV-EV; T01 `evidencias[].origen` y `sistema_origen` (esquema 0.8, opcionales); 38 §11 auditado contra el núcleo |
| S3 | **Hecho** | 01-10-2026 | D147: 01 §9.4, 21 §2.5 (todos los «Sí ◆» + 20 del núcleo; 47 frente a 90 en el perfil A), P01 §14 ficha viva, P04 §5.1, columna `x` del catálogo, T01 (T04, lista reducida, alerta «Fuera de Express»), demostración IA-2026-006. No se tocó T23 ni el panel (no usan la intensidad); el filtro por intensidad del panel queda como mejora menor. |
| S4 | Pendiente | | |
| S5 | Pendiente | | |
| S6 | Pendiente | | |
| S7 | Pendiente | | |
| S8 | Pendiente | | |
| S9 | Pendiente (a la espera de datos) | | |
