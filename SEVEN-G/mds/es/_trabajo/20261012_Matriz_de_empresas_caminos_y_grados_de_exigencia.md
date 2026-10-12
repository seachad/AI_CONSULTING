# Matriz de empresas, caminos de implantación y grados de exigencia

| Campo | Valor |
|---|---|
| Fecha | 12-10-2026 |
| Estado | **Propuesta, a validar por el autor.** No cambia ningún documento publicado. |
| Pregunta del autor | Cómo se implanta SEVEN-G en empresas de distinto tamaño y sector (más o menos regulado) sin que resulte grande ni rígido; unos mínimos (inventario de IA en el cuadro de mando, con métricas mínimas); que todo lo que se pida se pueda discriminar entre mínimo, exigible y recomendable; la matriz de empresas, los caminos, de dónde se parte y la información exigible por documento. |
| Qué no se toca | El núcleo N-01 a N-14 (01 §14.1), la regla «el tamaño no decide el alcance» (90 §2.1), G3 por separado, el presupuesto de contenido hasta la 1.0 (D143: ni documentos ni herramientas nuevas). |
| Depende de | La intensidad Express (D144, D147) y el núcleo (D145), que están en la rama `claude/blissful-hypatia-tcfdft`, pendiente de integrar en `main`. Esta propuesta los da por integrados. |

---

## 1. Qué resuelve ya el marco y qué falta

**Ya existe, y se reutiliza tal cual:**

| Pieza | Dónde | Qué decide |
|---|---|---|
| Alcance de compañía Lite / Enterprise | 90 §2.1–§2.2 | Cómo se organizan los órganos y la verificación. Cinco criterios; el tamaño no es uno de ellos. |
| Intensidad por iniciativa Express / Lite / Enterprise | 01 §9 | Qué criterios se evalúan en cada puerta y quién decide. Basta un criterio Enterprise. |
| Nivel de obligatoriedad por documento | 94 §2.2 y §6–§8 | Siempre · Enterprise · Condicional · Recomendado · Consulta. |
| Núcleo | 01 §14.1 | Catorce reglas que no se rebajan nunca (N-01 a N-14). |
| Quince disparadores | 94 §4 | Qué módulo se activa y por qué. |
| Puntos de partida y recorrido | 96, T23 | Seis arquetipos PP-A…F, cinco modificadores MP1–MP5, 22 hitos con prioridad. |
| Ruta mínima en alcance Lite | 90 §2.4 | Qué es obligatorio desde el inicio y qué se añade solo con un criterio Enterprise. |
| Campos mínimos del inventario por tipo de uso | 32 §3.7, P05 | Qué bloques del inventario se rellenan según el uso. |

**Lo que falta, y es lo que pide el autor:**

1. **Un grado de exigencia por campo, criterio y métrica.** Hoy el único marcador dentro de una plantilla es binario: *(Enterprise)* sí o no. No se distingue, dentro de lo que una iniciativa Lite rellena, qué parte es el mínimo sin el cual no es SEVEN-G, qué parte es exigible por un disparador concreto y qué parte es recomendable. La línea base S0 lo mide: una iniciativa Lite pequeña rellena 33 plantillas y evalúa 90 criterios, el 92 % de un caso Enterprise, porque no hay manera de decir «de estos 30 campos, 8 son el mínimo».
2. **Una matriz de tipos de empresa que dé un camino.** El 96 clasifica por punto de partida tecnológico y el 90 por alcance, pero nadie cruza regulación × punto de partida × tamaño para decir «una empresa como la suya empieza por aquí, con esto, y en estos plazos».
3. **Un cuadro de mando mínimo con el inventario dentro.** El resumen de una página del 60 §4.2 es de cartera y valor; el inventario (N-01) no tiene hoy ninguna cifra en lo que ve la dirección, y es la primera regla del núcleo.

---

## 2. Tres grados de exigencia: mínimo, exigible, recomendable

### 2.1 Definición

Se propone un **grado de exigencia** que se aplica a cualquier cosa que SEVEN-G pida —un campo de plantilla, un criterio de puerta, una métrica, un rol, una sesión— y que es independiente del documento donde viva:

| Grado | Código | Qué significa | Quién lo fija | Se puede omitir |
|---|---|---|---|---|
| **Mínimo** | **M** | Sin esto no se está aplicando SEVEN-G. Es lo que sostiene el núcleo N-01…N-14. Es **igual para toda compañía y toda intensidad, Express incluida**. | El núcleo (01 §14.1). Cambia solo por decisión expresa del autor. | Nunca. |
| **Exigible** | **E** | Obligatorio cuando se da una condición verificable: la intensidad de la iniciativa (Lite o Enterprise), el alcance de la compañía o uno de los quince disparadores del 94 §4. **Cada elemento E lleva escrita su condición**; sin la condición, no aplica y se registra «no aplica». | El documento de origen, por su nivel del 94 y sus disparadores. | Solo si no se da la condición. |
| **Recomendable** | **R** | Mejora la calidad de la decisión o de la medición. Se omite con una justificación de una línea. | El documento de origen. | Sí, justificándolo. |

Lo que el 94 llama *Consulta* no es un grado: es material de lectura, no una exigencia.

### 2.2 Regla de asignación (sin juicio caso a caso)

Para que el grado no dependa de quién lo asigne, se deriva de lo que ya existe:

| Es **M** si… | Es **E** si… | Es **R** en el resto |
|---|---|---|
| Lo exige una regla del núcleo N-01…N-14, o | Es un criterio de puerta que no está en la lista Express pero sí en la Lite o la Enterprise (21 §2.1, §2.5), o | Campo, criterio o métrica de un documento *Recomendado*, o |
| Es un criterio de la **lista Express** del 21 §2.5 (todos los «Sí ◆» más los veinte que sostienen el núcleo), o | Es un campo de plantilla marcado hoy *(Enterprise)*, o | Campo de plantilla que ninguna regla ni criterio exige (texto de contexto, anexos, comparativas), o |
| Es un campo de plantilla que da la evidencia de un criterio Express, o | Lo activa uno de los quince disparadores del 94 §4 (y entonces lleva el número del disparador), o | Métrica del catálogo 41 que ningún criterio de puerta ni ningún campo del paquete del consejo (60 §4.2) usa. |
| Es una métrica que el núcleo obliga a informar al consejo (N-12, N-13) o que un criterio «Sí ◆» comprueba. | Lo exige el alcance Enterprise de compañía (90 §2.2; disparador 15). | |

Consecuencia que conviene tener presente: **M es lo mismo que «lo que Express pide»**. No es casual: Express se definió (D144, D147) como el recorrido que mantiene todo el núcleo y quita el resto, así que el conjunto M ya está calculado para los criterios de puerta (47 en el perfil A de S0, 41 en el B). Lo que falta es etiquetar con el mismo grado los **campos de las plantillas** y las **métricas**, para que la ficha viva de Express y los cuadros de mando salgan de esa etiqueta y no de una lista escrita a mano.

### 2.3 Cómo se relaciona con lo que ya hay

| Lo que ya existe | Grado que le corresponde |
|---|---|
| Nivel *Siempre* de un documento (94) | El documento contiene elementos M y, normalmente, también E y R. El nivel dice cuándo se aplica el documento; el grado, qué parte de él. |
| Nivel *Enterprise* o *Condicional* | Sus elementos son E, con la condición escrita (intensidad, alcance o disparador). |
| Nivel *Recomendado* | Sus elementos son R, salvo los que una regla M ya recoja en otro sitio. |
| Intensidad Express | Solo M. |
| Intensidad Lite | M + los E cuya condición se cumple (disparadores 9 a 14 son los habituales en Lite). |
| Intensidad Enterprise | M + todos los E cuya condición se cumple, incluidos los de los disparadores 1 a 8 y, si hay alcance Enterprise, el 15. |
| Campos *(Enterprise)* de las plantillas | Pasan a E con su condición explícita; deja de existir el marcador binario. |

---

## 3. La matriz de empresas

### 3.1 Tres ejes, no una tipología cerrada

Clasificar empresas por sector produce listas largas e inútiles (dos aseguradoras pueden estar en puntos opuestos). Se proponen **tres ejes**, cada uno ya definido en el marco, de los que se derivan los perfiles:

| Eje | Valores | De dónde sale | Qué decide |
|---|---|---|---|
| **1 · Exposición regulatoria y a personas** | **Baja**: sin supervisión sectorial, sin decisiones sobre personas, sin exposición directa a clientes con IA, sin datos especiales. **Media**: datos personales o exposición directa a clientes o decisiones que afectan a personas, sin supervisión prudencial. **Alta**: supervisión prudencial o sectorial (DORA, NIS2, sanidad, sector público, energía), sistemas de alto riesgo o función crítica. | Criterios 1–3 de 90 §2.2 y disparadores 1–6 del 94; modificadores MP1 y MP2 del 96. | El **alcance** de compañía (Alta → Enterprise) y qué módulos E se activan desde el primer día (34, 50, 51, P11 completo, P47, P48). |
| **2 · Punto de partida tecnológico** | PP-A punto cero · PP-B IA de terceros · PP-C automatizador · PP-D IA propia · PP-E muchos pilotos · PP-F a escala. | 96 §2 y cuestionario Q01–Q12 (T23). | El **orden** de los hitos y qué hay que regularizar antes de empezar nada nuevo. |
| **3 · Tamaño y complejidad organizativa** | **Pequeña**: una sociedad, sin funciones separadas de riesgos ni auditoría interna (orientativamente menos de 250 personas). **Mediana**: una o pocas sociedades, con alguna segunda línea (riesgos, cumplimiento o control de gestión) y auditoría interna o externa. **Grande o grupo**: varias sociedades o países, segunda y tercera línea constituidas. | Criterio 4 de 90 §2.2 (grupo) y 90 §7 (roles mínimos en una organización pequeña). | **Quién ocupa cada rol** y cómo se constituyen los órganos (30 §11, 90 §7). **No decide qué se exige**: una pequeña regulada sigue en alcance Enterprise. |

Regla de lectura: el eje 1 fija **cuánto** se exige, el eje 2 fija **por dónde se empieza**, el eje 3 fija **quién lo hace**. Los tres son verificables con el cuestionario de T23 (Q07, Q08 y Q09 para el eje 1; Q01–Q03 para el 2; Q05, Q10 y Q12 más la estructura societaria para el 3).

### 3.2 Siete perfiles de empresa

De las 3 × 6 × 3 = 54 combinaciones posibles, siete cubren lo que se encuentra en la práctica. El resto se asigna al perfil más cercano por el eje 1 (que es el que manda) y toma del 96 el orden de hitos de su arquetipo.

| Perfil | Nombre | Eje 1 | Eje 2 típico | Eje 3 | Ejemplos (genéricos) | Alcance | Intensidad habitual de sus iniciativas |
|---|---|---|---|---|---|---|---|
| **EM-1** | Pequeña no regulada que empieza | Baja | PP-A, PP-B | Pequeña | Despacho profesional, empresa de servicios, comercio, pyme industrial sin IA propia | Lite | Express; alguna Lite |
| **EM-2** | Mediana no regulada con pilotos o automatización | Baja | PP-C, PP-E, PP-D | Mediana | Industria, logística, distribución, hostelería, construcción | Lite | Lite; Express en lo interno; Enterprise solo por Transformar o inversión |
| **EM-3** | Mediana con clientes y datos personales | Media | PP-B, PP-D, PP-E | Mediana | Comercio electrónico, servicios a consumidores, educación privada, medios, agencias | Lite | Lite con disparadores 3 y 12 casi siempre; Enterprise cuando decide sobre personas |
| **EM-4** | Pequeña o mediana regulada | Alta | PP-B, PP-D | Pequeña o mediana | Entidad financiera pequeña, aseguradora, clínica u hospital, gestora, operador de infraestructura crítica pequeño | **Enterprise** (por el eje 1, aunque sea pequeña) | Enterprise en todo lo que toca clientes o decisiones; Express solo en uso interno reversible |
| **EM-5** | Grande o grupo no regulado | Baja o media | PP-D, PP-F, PP-E | Grupo | Grupo industrial, retail, agroalimentario, turístico, tecnológico | Enterprise si es grupo con marco común (criterio 4); si no, Lite federado | Mezcla: muchas Lite y Express, varias Enterprise por exposición directa o Transformar |
| **EM-6** | Grupo regulado a escala | Alta | PP-F, PP-D | Grupo | Banca, seguros, energía, telecomunicaciones, sanidad privada en grupo | Enterprise | Enterprise como norma; Express solo bajo el umbral de C2 y uso interno |
| **EM-7** | Sector público y entidades con misión pública | Alta | PP-A, PP-B, PP-E | Cualquiera | Administración territorial, organismo autónomo, empresa pública, universidad | Enterprise | Enterprise en todo lo que afecta a ciudadanos (anexo III, puntos 5 y 8); Express en gestión interna |

> **Por qué siete y no más.** Cada perfil cambia al menos una de estas tres cosas respecto del anterior: el alcance, el conjunto de módulos E que se activan desde el día uno o quién ocupa los roles. Un perfil que no cambie ninguna de las tres no merece existir. EM-7 existe aparte de EM-4/EM-6 porque cambia dos cosas que ningún otro perfil tiene: la contratación pública como vía de entrada de la IA (36 §8, P55 desde el pliego) y la transparencia frente al ciudadano como obligación general, no como disparador.

### 3.3 Cómo se asigna

1. Responder el cuestionario de T23 (Q01–Q12). Añadir una pregunta de estructura societaria (**Q13 propuesta**: una sociedad · pocas sociedades con marco común · grupo con varias sociedades o países).
2. **Eje 1** con Q07, Q08 y Q09: cualquier «sí» en Q07 o alto riesgo o función crítica → Alta; si no, datos personales, exposición directa o decisiones sobre personas → Media; si no, Baja. «No se sabe» cuenta como el valor más exigente hasta que se sepa (regla ya establecida en 96 §2.4).
3. **Eje 2** con la regla de asignación de 96 §2.2.
4. **Eje 3** con Q13, Q05 y Q12.
5. El perfil EM se lee en la tabla 3.2. Si hay dos candidatos, manda el eje 1.

T23 puede hacerlo sin cambiar su interfaz: la clasificación EM es una lectura más del mismo cuestionario.

---

## 4. Los caminos

Cada camino dice de dónde se parte, qué se hace en las primeras cuatro semanas, qué es el mínimo del cuadro de mando al terminar el primer trimestre, qué se activa después y quién ocupa los roles. Los meses son los del documento 90 (Lite: 6–12; Enterprise: 12–18); el camino solo ordena dentro de esos límites.

### 4.1 EM-1 · Pequeña no regulada que empieza

| | |
|---|---|
| **De dónde parte** | Casi siempre PP-A o PP-B: uso no autorizado de asistentes generativos con datos de la empresa y, quizá, IA incluida en el software que ya paga. Sin oficina de IA, sin segunda línea. |
| **Lo primero (semanas 1–4)** | HI-01 patrocinador y mandato (P32, una página); HI-02 inventario del uso corporativo y no autorizado (T01/T02, campos M del §6); HI-03 política de uso aceptable (P43, versión breve) y alfabetización básica (P45). Diagnóstico C1 con T15 en modo autoevaluación (**propuesta**: el 11 admite hoy evaluación verificada como mínimo en Lite; en EM-1 la verificación la hace el gestor externo o el asesor, no una tercera línea que no existe). |
| **Mínimo del cuadro de mando al cierre del trimestre** | Las diez métricas M del §5: inventario con responsable y clasificación provisional, casos registrados, neto anual (sin estimar: será cero o «sin dato» y está bien que lo diga), riesgo abierto, puertas en plazo. |
| **Órganos y roles** | Consejo o propietario con punto de IA trimestral; comité = comité de dirección con punto mensual; oficina de IA = una persona a tiempo parcial; conformidad de riesgos = alguien independiente del que construye (el responsable financiero, el de cumplimiento o un externo); auditor de IA = externo por muestreo anual. Tres personas distintas como mínimo (N-06). |
| **Intensidad de sus iniciativas** | Express casi siempre (uso interno, reversible, A0–A1, bajo el umbral). La primera iniciativa que salga de ahí pasa a Lite y arrastra los módulos E de su disparador. |
| **Qué se activa después** | Solo por disparador: proveedor de IA (36, P14) en cuanto contrate algo; datos personales (51, P47) en cuanto una iniciativa los toque; personas (50, 23) en cuanto cambie el trabajo de alguien. |
| **Calendario** | C1 en el mes 1, C2 en el mes 3 (tesis de una página con umbral Express y apetito), primer paquete al consejo en el mes 3, declaración de aplicación entre el mes 6 y el 12. |
| **Lo que no hace** | No constituye comité de IA propio, no hace índice de transformación con las ocho señales (sí las condiciones de base y las señales que T14 calcula solo desde T01), no hace auditoría del marco hasta el mes 12 y con un externo. |

### 4.2 EM-2 · Mediana no regulada con pilotos o automatización

| | |
|---|---|
| **De dónde parte** | PP-E (pilotos generativos sin decisión), PP-C (centro de automatización) o PP-D (algún modelo propio). Hay control de gestión y, a menudo, un comité de dirección activo. |
| **Lo primero** | HI-04 registrar **todos** los pilotos y modelos en T01 en su fase real; HI-13 decidir parar o escalar cada uno con G3; HI-06 C1 completo (T15 verificada, T14, huella); HI-12 regularizar lo que está en producción (90 §5). Con PP-C: convertir el centro de automatización en oficina de IA (MP4, convalidar). |
| **Mínimo del cuadro de mando** | Las diez M más las E de cartera que ya aplican: embudo con motivos de parada, hipótesis de valor con línea base en todo lo que pasa G2, neto anual validado frente a declarado. |
| **Órganos y roles** | Comité de dirección con sesión mensual de IA; oficina de IA de una persona a tiempo parcial o completo según la cartera; riesgos independiente (control de gestión o cumplimiento); auditor interno o externo por muestreo semestral. |
| **Intensidad** | Lite como norma; Express en asistentes internos; Enterprise solo cuando una iniciativa es Transformar o supera el umbral de inversión de C2. Una apuesta de Transformar no cambia el alcance (D66). |
| **Qué se activa después** | 40 completo y 43 (realización) en cuanto haya producción; 35 y P18 en el primer agente A1; 36 en el primer proveedor de modelo; 53 si construye con código generado. |
| **Calendario** | 90 §4: C1 mes 1, riesgos y oportunidades mes 2, C2 y órganos mes 3; declaración entre el mes 6 y el 12. |

### 4.3 EM-3 · Mediana con clientes y datos personales

| | |
|---|---|
| **De dónde parte** | PP-B o PP-D con exposición directa: asistentes de atención, recomendadores, segmentación. El riesgo ya está en la calle antes de que exista gobierno. |
| **Lo primero** | Como EM-2, pero HI-05 (inventario con clasificación regulatoria) y HI-10 (riesgos independiente) pasan a prioridad 1 (MP2). Clasificación provisional con el árbol del 32 §5 de **todo** lo expuesto a clientes en el primer mes; lo que toque el anexo III se trata como alto riesgo mientras se resuelve (32 §5.3, regla 3). |
| **Mínimo del cuadro de mando** | Las M más: sistemas con obligaciones de transparencia (art. 50) y si las cumplen; evaluaciones de impacto exigidas y su estado; incidentes con efecto en clientes. |
| **Órganos y roles** | Como EM-2 más protección de datos en el comité cuando se trata una iniciativa con datos personales; conformidad de riesgos con criterio jurídico accesible (interno o externo). |
| **Intensidad** | Lite con disparadores 3 (exposición directa) y 12 (datos personales) activos en casi todo; Enterprise cuando el sistema decide o influye sobre personas (disparador 2). |
| **Qué se activa desde el día uno** | 34 (RGPD y Reglamento de IA), P49 avisos de transparencia, P47 cuando el tratamiento lo exige, P53 pruebas adversarias en lo expuesto, 51. |
| **Calendario** | Lite (6–12 meses), pero la regularización de lo expuesto a clientes no espera al mes 6: se hace en el trimestre 1. |

### 4.4 EM-4 · Pequeña o mediana regulada

| | |
|---|---|
| **De dónde parte** | PP-B o PP-D, casi siempre con gobierno previo reutilizable (validación de modelos, función de cumplimiento, gestión de riesgos tecnológicos exigida por el supervisor): MP1 y MP4 a la vez. |
| **Lo primero** | HI-01, HI-05 e HI-10 en el mes 1 (MP1); **convalidar** el gobierno existente documentando la correspondencia (96 §4.3, regla 3; D31): el comité de riesgos existente es la comisión delegada, la validación de modelos se lleva a G5 y R6, el registro de riesgos operacionales incorpora la escala del 33. Mapeo regulatorio (34) con el supervisor sectorial en el centro (DORA, Solvencia II, normativa sanitaria). |
| **Mínimo del cuadro de mando** | Las M más las E regulatorias: sistemas de alto riesgo y su estado de evaluación de conformidad, proveedores N2–N3 con diligencia vigente, incidentes notificables y plazos, función crítica con continuidad probada. |
| **Órganos y roles** | **Alcance Enterprise con órganos mínimos** (90 §7): comité de IA puede ser el comité de riesgos con sesión propia; comisión delegada = la de riesgos o auditoría con mandato expreso; oficina de IA de una persona; auditor de IA en cada puerta Enterprise, externo si no hay nadie independiente dentro. Madurez independiente cada dos años. |
| **Intensidad** | Enterprise en todo lo que toca clientes, decisiones, dinero o función crítica; Express solo en uso interno reversible bajo el umbral (un asistente de redacción interno sigue siendo Express aunque la compañía sea un banco). |
| **Calendario** | Enterprise (12–18 meses), con la regularización de lo que el supervisor ya mira en los primeros seis. |

### 4.5 EM-5 · Grande o grupo no regulado

| | |
|---|---|
| **De dónde parte** | PP-D o PP-F con varias unidades que han avanzado por su cuenta: inventario disperso, iniciativas transversales (asistente ofimático) sin medir por unidad, algún agente A2 en producción sin gobierno. |
| **Lo primero** | HI-01 con **perímetro** explícito (90 §2.3: puede empezarse por una unidad o país, pero el inventario cubre todo el grupo desde el principio); HI-02/HI-05 inventario consolidado; HI-12 regularización priorizada por riesgo; iniciativas transversales medidas con escalera por unidad (40 §7.2, D63); umbral Express y de inversión en C2. |
| **Mínimo del cuadro de mando** | Las M más: neto con y sin transversales, adopción por unidad, mapa de impacto esferas × ambición (T16), frenos de escalado. |
| **Órganos y roles** | Si es grupo con marco común, alcance Enterprise (criterio 4) con comité de IA propio y oficina de IA de equipo; si son sociedades independientes, Lite federado con un marco común y una oficina por sociedad. Segunda y tercera línea ya existen: se les asignan los roles de IA. |
| **Intensidad** | Mezcla: muchas Express y Lite internas, varias Enterprise por exposición directa, agentes A2/A3 o Transformar. El panel del consejo distingue agregado (Lite) y por iniciativa (Enterprise). |
| **Calendario** | Enterprise si es grupo; Lite en cada sociedad si es federado. |

### 4.6 EM-6 · Grupo regulado a escala

| | |
|---|---|
| **De dónde parte** | PP-F: todo está ya en producción y el gobierno va por detrás del uso. MP1, MP2, MP3 y MP4. |
| **Lo primero** | Todo lo de 96 §4.2 para PP-F en prioridad 1: roles separados y auditor de IA de inmediato, inventario con clasificación, seguridad de agentes y proveedores, regularización por riesgo, panel e índice. Convalidar el sistema de gestión existente (42001, modelos, riesgo operacional) con correspondencia verificada. |
| **Mínimo del cuadro de mando** | Todo el paquete del 60 §4.2 más el bloque de inventario del §5. |
| **Órganos y roles** | Enterprise completo: comité de IA específico, comisión delegada con mandato, oficina de IA de equipo, tercera línea con auditores de IA, madurez independiente. |
| **Intensidad** | Enterprise como norma. Express existe igualmente para lo interno y reversible bajo el umbral: es lo que evita que los casos pequeños no se registren. |
| **Calendario** | Enterprise, 12–18 meses, con hitos regulatorios antes (fechas del Reglamento de IA y de la normativa sectorial mandan sobre el calendario de SEVEN-G). |

### 4.7 EM-7 · Sector público y entidades con misión pública

| | |
|---|---|
| **De dónde parte** | PP-A, PP-B o PP-E: pilotos financiados por programas, IA incluida en lo contratado, poca construcción propia. Exposición alta por definición (anexo III, puntos 5 y 8, y transparencia frente al ciudadano). |
| **Lo primero** | HI-01 con mandato del órgano de gobierno; HI-05 inventario con clasificación de todo lo que afecta a ciudadanos; **contratación como puerta de entrada**: P55 y P56 desde el pliego, N2–N3 a proveedores (36 §8); transparencia activa (P49) como obligación general; P48 (derechos fundamentales) en todo lo del anexo III. |
| **Mínimo del cuadro de mando** | Las M más: sistemas que afectan a ciudadanos con su clasificación y evaluación de impacto, contratos con IA incluida y cláusulas vigentes, reclamaciones y recursos relacionados con decisiones automatizadas. |
| **Órganos y roles** | Alcance Enterprise con órganos adaptados: comité de IA puede ser la comisión de transformación digital con mandato expreso; conformidad de riesgos en la asesoría jurídica o la unidad de protección de datos; auditor de IA en la intervención o control interno, o externo. |
| **Intensidad** | Enterprise en todo lo que afecta a ciudadanos o personal; Express en gestión interna reversible. |
| **Calendario** | Enterprise, condicionado por los ciclos presupuestarios y de contratación. |

### 4.8 Lo común a los siete caminos

- **HI-01 va antes que todo** y MP5 bloquea (96 §4.3).
- **El inventario con los campos M se termina en el primer mes** en todos los perfiles: es N-01 y es la cifra que primero ve la dirección.
- **El destino es el mismo**: la declaración de aplicación (01 §14.2) se hace contra el núcleo, igual para EM-1 que para EM-6. Cambia el plazo y cuántos elementos E se activan, nunca el M.
- **Ningún perfil hace estimaciones**: el cuadro de mando del primer trimestre de EM-1 dirá «sin dato» en casi todo el valor, y eso es correcto (D56, D100).

---

## 5. Cuadro de mando mínimo, con el inventario dentro

### 5.1 Principio

El cuadro de mando mínimo es **una página** que cualquier perfil puede producir al cierre del primer trimestre con lo que T01 ya contiene; no exige ninguna herramienta nueva. Se organiza en cinco bloques, y el **primero es el inventario**, porque N-01 es la primera regla del núcleo y hoy no tiene ninguna cifra en el 60 §4.2. Cada métrica lleva su grado; las **M son diez** y no dependen de la intensidad ni del perfil.

### 5.2 Las métricas

| Bloque | Métrica | Grado | Condición (si E) | Fuente en T01 | Regla del núcleo o criterio que la exige |
|---|---|---|---|---|---|
| **Inventario** | Sistemas de IA inventariados, por tipo de uso (iniciativa · terceros integrada · uso corporativo · no autorizado) | **M** | | T02 | N-01 |
| | Sistemas **con responsable** nombrado (número y %) | **M** | | T02 | N-01 |
| | Sistemas **con clasificación regulatoria** (provisional o definitiva) y **pendientes fuera del plazo de C2** | **M** | | T02 | N-01, N-10; 32 §5.3 regla 5 |
| | Usos no autorizados detectados y **abiertos** (sin regularizar ni retirar) | **M** | | T02 | N-01; 32 §2.1 |
| | Sistemas de alto riesgo o prohibidos, con estado | E | Disparador 1 o eje 1 Alta | T02 | 32 §5 |
| | Sistemas con obligaciones de transparencia (art. 50) y si están cumplidas | E | Disparador 3 | T02 | 32 §3.4 |
| | Proveedores de IA por nivel N1–N3 y diligencia (P55) vigente | E | Disparador 11 | T02, T09 | 36 |
| | Declaración de completitud del inventario firmada y fecha de la última revisión | R (M en la declaración de aplicación) | | P32 | 90 §2.4 |
| **Cartera** | Iniciativas por fase y estado; en producción; paradas y retiradas del periodo **con motivo codificado** | **M** | | T01 embudo | N-02, N-04 |
| | Iniciativas **estancadas** (fuera del plazo de referencia de C2) | **M** | | T01 | 01 §6.11 |
| | Pilotos sin decisión de G3 a los X meses | E | PP-E o más de dos pilotos | T01 | 96 HI-13 |
| | Tiempo mediano por puerta y por fase | R | | T01 | IND-AGI-04 |
| **Valor** | **Neto anual** (eficiencias + retorno − coste recurrente), separando **validado** por control de gestión de **declarado**; «sin dato» nunca es cero | **M** | | T01 valores | N-13; 40 |
| | Inversión ejecutada frente a la aprobada | **M** | | T01 | N-12, N-13 |
| | Hipótesis de valor con línea base en el 100 % de lo que pasó G2 | E | Lite o Enterprise (en Express lo garantiza G2.03) | T01 gates | N-09 |
| | Neto con y sin transversales; adopción por unidad | E | Hay iniciativas transversales (40 §7.2) | T01 alcance | D63 |
| | Realización frente a la curva de referencia (F10) | R (E en Enterprise con plan de realización) | | T01 plan_realizacion | 43; IND-VAL-14 |
| | Resultado operativo y valor no cuantificado (tres perspectivas) | R | | T01 | 40 §11.1 |
| **Riesgo** | Riesgos residuales **Crítico y Alto** abiertos; incidentes **S1 y S2**; no conformidades mayores y críticas abiertas | **M** | | T06, T01 | N-10, N-14 |
| | Riesgo Crítico sin aprobación del consejo (debe ser cero) | **M** | | T06 | N-10 |
| | Evaluaciones de impacto exigidas y su estado | E | Disparadores 1, 2, 5, 12 | T01 evidencias | 32 §6 |
| | Agentes A2/A3 con interruptor de parada y reversión probada | E | Disparador 4 | T01 | 35 |
| **Gobierno** | Puertas decididas **con evidencia verificada anterior a la decisión** (debe ser 100 %) y **R6 vigente** en todo lo que está en producción | **M** | | T01 gates | N-07, N-11 |
| | Decisiones del consejo registradas (DEC) y recomendaciones abiertas y vencidas | E | Desde el primer paquete al consejo | T18 | N-12; 62 |
| | Coste del gobierno por intensidad frente al objetivo | R | | T01 horas_gobierno | IND-COS-13 |
| | Madurez D1–D7 y huella tecnológica, con fecha | R (M en C1 y C5) | | T15 | 11 |

**Las diez M**, en una línea: sistemas por tipo de uso · con responsable · clasificados y pendientes fuera de plazo · no autorizados abiertos · iniciativas por fase con paradas y motivo · estancadas · neto anual validado/declarado · inversión frente a aprobada · Crítico/Alto, S1/S2 y NC abiertas (con Crítico sin aprobación = 0) · puertas con evidencia verificada y R6 vigente.

### 5.3 Dónde vive

- **60 §4.2**: el resumen de una página gana un campo «Inventario» antes de «Cartera», con las cuatro M de ese bloque. Es una fila más de una tabla existente, no un documento.
- **T17**: tarjeta «Inventario» en «Cartera y valor» con las cuatro M y, por disparador, las E; el conector ya recibe el inventario de T01 (32 §3.8).
- **T01, vista Consejo**: el cuadro mínimo imprimible con las diez M, para los perfiles EM-1 y EM-2, que pueden no generar el panel completo cada trimestre.

---

## 6. Inventario mínimo por campo

Grado de cada campo de P05 / 32 §3, para los cuatro tipos de uso. Lo que 32 §3.7 llama «Completo» se desglosa aquí. **Los M son trece** y son los mismos para los cuatro tipos de uso salvo donde se indica.

| Bloque | Campo | Grado | Condición (si E) |
|---|---|---|---|
| Identificación | Código SIA, nombre, **qué es y para qué se usa** (una frase comprensible) | **M** | |
| | Tipo de uso (los cuatro de 01 §1.2) | **M** | |
| | Área responsable y **responsable del sistema** (persona) | **M** | |
| | Fecha y origen del alta | **M** | |
| | Iniciativas vinculadas | **M** | solo tipos iniciativa y terceros integrada (32 §3.2) |
| | Sociedad del grupo | E | Eje 3 grupo |
| | Patrocinador, responsable técnico, de operación | E | Según fase (32 §3.2) |
| | Responsable de riesgos | **M** desde la clasificación provisional | |
| Descripción | Estado (idea · piloto · producción · retirado) | **M** | |
| | Tecnología (taxonomía), **exposición** (interna · clientes · terceros), **autonomía A0–A3** | **M** | |
| | Licencias y categoría del proveedor | E | Uso corporativo o terceros integrada |
| | Descripción técnica (modelo, versión, arquitectura) | E | En desarrollo o producción |
| Clasificación | **Es IA según el art. 3.1** (sí · no · en revisión) | **M** | |
| | **Clasificación regulatoria** (provisional en fase 0, con fecha límite; definitiva en G3) | **M** | |
| | Apartados del art. 50, rol de la compañía, modelo de uso general, posible asunción del rol de proveedor | E | Disparadores 1, 3, 11; eje 1 Media o Alta |
| Evaluaciones | Evaluaciones exigidas y estado (EIPD, FRIA, conformidad) | E | Según clasificación (32 §6.4) |
| Datos y terceros | **Trata datos personales** (sí · no) e **información tratada** por categoría | **M** | |
| | Proveedor y nivel N1–N3 | **M** si hay proveedor; nivel E con disparador 11 | |
| | Uso de los datos por el proveedor, localización, cláusulas (P56) | E | Disparadores 11 y 12 |
| | Linaje de datos y modelos | E | Fase 4 en adelante (P16) |
| Riesgo y ciclo | Riesgo residual principal | **M** desde la fase 3 | |
| | Fecha de la próxima R6 y reversión probada (sí · no · fecha) | **M** en producción | |
| | Coste de licencias y adopción (licencias activas / asignadas) | R (E si es transversal, 40 §7.2) | |
| Uso no autorizado | Información expuesta, proveedor, no conformidad abierta, responsable de la regularización | **M** para ese tipo de uso | |

Con los trece M, una compañía EM-1 inventaría un sistema en diez minutos; la columna «Completo» de 32 §3.7 sigue siendo el objetivo para las iniciativas y los terceros integrados, pero se llega por disparadores, no de golpe.

---

## 7. Información exigible por documento y evidencia

Para cada evidencia del ciclo de vida (P01–P31) y cada artefacto de compañía que es *Siempre*, qué es M, qué es E (con su condición) y qué es R. Las plantillas conservan todos sus campos; lo que cambia es que cada campo lleva el grado y la herramienta muestra solo los que aplican.

### 7.1 Ciclo de vida de la iniciativa

| Evidencia | Mínimo (M) | Exigible (E) · condición | Recomendable (R) |
|---|---|---|---|
| **P01 Carta / ficha viva** | Código, nombre, problema en una frase, patrocinador, responsable de producto, esfera, ambición propuesta, intensidad, estado y fase, fecha de alta (G0.01, G0.07, G0.08). En Express, la ficha viva entera (P01 §14) es la evidencia única. | Alternativas consideradas y contexto ampliado · Lite y Enterprise. Dependencias de plataforma · hay plataforma habilitadora. | Antecedentes, referencias de mercado. |
| **P02 Contexto y restricciones** | Restricciones legales y de datos conocidas en una lista (alimenta la clasificación provisional). | Restricciones de arquitectura y de proveedor · disparadores 11 y 14. Restricciones sectoriales · eje 1 Alta. | Supuestos y escenarios. |
| **P03 Roles** | Responsable de producto, técnico, de riesgos (independiente) y verificador, con las incompatibilidades de 01 §8.2 comprobadas (G0.05, G0.06). | Responsable de operación · desde fase 4. Auditor de IA asignado · Enterprise. Responsable de negocio del beneficio · desde G2 en Lite y Enterprise. Declaración de independencia P41 · Enterprise. | Suplentes. |
| **P04 Intensidad** | Los ocho criterios Enterprise respondidos y la intensidad resultante; en Express, las seis condiciones de elegibilidad y quién de riesgos la confirma (P04 §5.1). Revisión en G3 y en cada R6 (N-03). | Bloque de cambio de intensidad · cuando cambia. | Justificación extensa de cada criterio. |
| **P05 Inventario** | Los trece campos M del §6 (G0.09). | El resto según §6. | Según §6. |
| **P06–P07 Cartera y alternativas** | Necesidad de negocio y **alternativa sin IA considerada** (G1.01, G1.03); esfera y ambición propuestas. | Notas de filtrado con los criterios de 14 §3.3 · Lite y Enterprise. Comparativa de alternativas con coste · Enterprise. | Encaje con la tesis por esfera (si no hay tesis aún, no aplica). |
| **P08 Hipótesis de valor** | Hipótesis **falsable**, objetivo medible, fórmula del valor con sus variables, **criterio de parada** (G2.01, G2.04, G2.06, G2.08). | Método de atribución y tipo de valor según 40 · Lite y Enterprise. Valor no cuantificado con nivel y métrica · 40 regla 7. Escalera por unidad · transversal. | Sensibilidad, escenarios. |
| **P09 Línea base** | Valor actual de la métrica objetivo, fecha y fuente (G2.03). | Línea base por unidad · transversal. Línea base con diferencias en diferencias · despliegue escalonado. | Serie histórica. |
| **P10 Viabilidad** | Conclusión de viabilidad técnica y de datos con la decisión propuesta; **criterio de parada vigente** (G3.06). | Evaluación de datos con propietario y base legal · disparador 12. Prueba de concepto documentada · Enterprise. Coste completo F1–F4 · Lite y Enterprise. | Comparativa de modelos. |
| **P11 Clasificación regulatoria** | Los siete pasos del árbol del 32 §5 con conclusión motivada; definitiva en G3 (N-10). | Rol de la compañía y evaluaciones derivadas · eje 1 Media o Alta, disparadores 1, 3, 5, 12. EIPD (P47) y FRIA (P48) · cuando la clasificación las exige. Obligaciones del proveedor de alto riesgo · disparador 1 con rol proveedor. | Seguimiento de directrices pendientes. |
| **P12–P13 Riesgos** | Riesgos identificados con probabilidad × impacto en la escala del 33, residual principal, **plan para los Altos y Críticos**, aceptación por el órgano del nivel (G3.11, G3.13). | Registro completo por las diez categorías, eficacia de controles y contingencia · Lite y Enterprise. Riesgos tipo GEN, AG, TER · disparadores 9, 10, 11. Concentración de cartera · Enterprise. | Indicadores de riesgo clave (33 §11). |
| **P14 Proveedores** | — (no es M: sin proveedor no aplica). | Diligencia debida de 12 bloques (P55), cláusulas (P56), nivel N1–N3 y regla de no uso con datos de producción si falta cláusula · disparador 11. En Express, proveedor ya homologado es condición de elegibilidad. | Plan de salida (P57) en N1. |
| **P15–P16 Arquitectura y linaje** | Componentes y modelo usados, versión, dónde viven los datos (lo imprescindible para reversión y auditoría). | Registro de arquitectura y linaje completos · Lite y Enterprise. Conjuntos de prueba versionados y modelo de respaldo · disparador 9. SBOM e identidades no humanas (P54) · disparador 4. | Diagramas detallados. |
| **P17 Supervisión humana** | Quién supervisa qué y cómo se interviene o para (criterio «Sí ◆»; en A0–A1 basta una línea). | Diseño completo de supervisión, umbrales de sesgo por segmento · disparadores 2, 3. Pares contrafactuales · IA generativa sobre personas (52 §4.2.7). | Formación específica del supervisor. |
| **P18 Seguridad** | Controles «Sí ◆» que apliquen al perfil (inyección de instrucciones si es generativa, acceso, secretos). | P18 completo con catálogo SEG · Enterprise. Bloque de agentes y lista LV-AG · disparadores 4 y 10. Pruebas adversarias (P53) · disparador 3. | Modelo de amenazas extendido. |
| **P19 Reversión** | Plan de reversión **y su prueba** antes de producción (G5.11, N-11). | Reversión con plazo objetivo y continuidad reforzada · disparador 6. | Simulacros periódicos. |
| **P20 Adopción** | Quién usa el sistema y qué alfabetización necesita antes del acceso (G5.19). | Plan de adopción, capacidad liberada separada del ahorro, información a la representación · disparador 13. | Encuesta de pulso (23). |
| **P21–P22 Entrega y pruebas** | Resultados de validación frente a la hipótesis y al criterio de parada (G5.09). | Informe de entrega completo y resultados del piloto por segmento · Lite y Enterprise. Evaluación de comportamiento con conjuntos versionados · disparador 9. | Métricas de proceso de construcción (53). |
| **P23 Firma de puesta en producción** | Conformidad de riesgos registrada y condiciones cerradas (G5.22). | Firma multinivel con veto · Enterprise. | — |
| **P24–P25 Operación y monitorización** | Manual mínimo (quién opera, qué se vigila, cómo se para) y fecha de la próxima R6. | Monitorización de deriva (datos, uso, sesgo), presupuesto de consumo y cascada de degradación · disparador 9 y producción. R6 trimestral · Enterprise. | Paquete R6 (P65). |
| **P26 Incidentes** | Registro de incidentes con severidad S1–S4 y vía de notificación interna (N-14). | Notificaciones externas y plazos (P51) · disparadores 1, 6, 12 y sector. Causa raíz (P52) · S1 y S2. | Tendencias. |
| **P28 Seguimiento de valor** | Valor realizado por periodo frente a la hipótesis, con estado (validado · declarado) y «sin dato» cuando no se mide (N-13). | Realización frente a la curva (F10) y plan de realización (P62) · Lite y Enterprise desde G3.05. Valor por unidad · transversal. | Tres perspectivas del caso. |
| **P29 Decisión de puerta** | Puerta, fecha, decisor, verificador, resultado, criterios evaluados con estado, condiciones con plazo (N-04, N-07). | Horas de gobierno declaradas · cuando se miden (IND-COS-12). Acta de sesión · Enterprise. | — |
| **P30 Retirada** | Motivo codificado, qué lo sustituye, lecciones (D55). | Plan de retirada con datos y contratos · producción. | Valoración independiente. |

### 7.2 Artefactos de compañía

| Artefacto | Mínimo (M) | Exigible (E) · condición | Recomendable (R) |
|---|---|---|---|
| **P32 Mandato** | Patrocinador en la alta dirección, perímetro, fecha; declaración de completitud del inventario cuando se alcance (HI-01). | Perímetro por sociedades · eje 3 grupo. | Hoja de ruta a 18 meses. |
| **P33–P34 Diagnóstico C1** | Madurez D1–D7 con el cuestionario del 11, evaluación **verificada**; condiciones de base del índice (IT-D1…D3) y huella tecnológica. | Las ocho señales del índice · hay producción. Evaluación independiente · alcance Enterprise, cada dos años. Perfiles NIST (P72, P73) · la compañía usa esos marcos. | Lectura cruzada y tres lentes completas. |
| **P35 Tesis C2** | Aprobada por el consejo: ambición objetivo por esfera, apetito de riesgo, **umbral Express**, **umbral de inversión Enterprise**, plazos de referencia por fase y de clasificación pendiente (N-12). | Sobres presupuestarios (13 §6) · Lite y Enterprise. Coste por hora de gobierno y objetivos por intensidad · se mide el coste del gobierno. | Escenarios de ambición. |
| **P36 Plan de cartera C3** | Lista priorizada con fase, intensidad y ambición de cada iniciativa (sale de T01). | Semáforo de programas y regularización planificada · Lite y Enterprise. | Priorización multicriterio. |
| **P37 Revisión C5** | Madurez recalculada, tesis revisada, decisión sobre el alcance (90 §2.2). | Coste del gobierno frente al objetivo, calibración de umbrales · se miden. | Autoevaluación de los órganos. |
| **P38 Órganos** | Quién es consejo, comité, oficina, riesgos independiente y auditor de IA, con la separación de N-06 (tres personas distintas como mínimo). | Reglamento del comité de IA, comisión delegada con mandato · alcance Enterprise. | Calendario anual detallado. |
| **P43 Uso aceptable** | Qué se puede y qué no con asistentes de IA y datos de la compañía; a quién avisar (HI-03). | Política corporativa completa (31) · Lite y Enterprise. Información a la representación · disparador 13. | Guías por colectivo. |
| **P50 No conformidades** | Registro con severidad, responsable, plazo y estado (N-14). | Plazos de 01 §12 y escalado · Lite y Enterprise. | Análisis de tendencia. |
| **P61 Declaración de aplicación** | Las catorce reglas del núcleo con su evidencia, perímetro, versión del núcleo (01 §14.2). | Auditoría de la declaración (38 §11) · alcance Enterprise. | Crosswalk con normas (34 §9.1). |
| **P67 Paquete al consejo** | El cuadro de mando mínimo del §5 (diez M) y las decisiones solicitadas; «si no hay decisiones, se dice». | Resumen de una página completo del 60 §4.2, frenos de escalado, casos en detalle · desde que hay producción o alcance Enterprise. | Mapa de impacto, tres perspectivas. |

---

## 8. Cómo entra en el marco sin engordarlo

Todo cabe en el presupuesto de contenido de D143 (ni documentos ni herramientas nuevas; lo nuevo son datos que generan tablas):

| Cambio | Dónde | Tipo | Qué produce |
|---|---|---|---|
| **Grado M/E/R por criterio de puerta** | `catalogo_criterios.json`: columna `grado` derivada (M = columna Express `x`; E = resto con su condición; R no existe en criterios, todos son M o E) | Dato | 21 y 22 muestran el grado; T03 filtra por intensidad como ya hace. |
| **Grado M/E/R por campo de plantilla** | Las 74 plantillas (ES/EN): el marcador *(Enterprise)* se sustituye por **(M)**, **(E: condición)** o **(R)**. `docx.ps1` y `build.ps1` lo leen. | Edición de plantillas, sin añadir ninguna | La ficha viva de Express (P01 §14) deja de ser una lista escrita a mano: son los campos M de cada plantilla. Los `.docx` pueden generarse solo con M, con M+E o completos. |
| **Grado por métrica** | `SEVEN-G/herramientas/T17_panel_consejo/motor/` o un `scorecard_minimo.json` leído por T01, T17 y `entrada_datos.ps1` | Dato | Cuadro de mando mínimo del §5 en T01 (vista Consejo, imprimible) y tarjeta «Inventario» en T17; 60 §4.2 gana la fila «Inventario». |
| **Perfil EM en T23** | `recorrido.json` gana `perfiles_em` (siete filas) y Q13; T23 muestra el perfil y su camino (§4) junto al arquetipo | Dato | El autor no escribe la matriz en un documento: el 96 §2 la genera desde `recorrido.json` como ya hace con los arquetipos (`build_recorrido.ps1 -ActualizarRecorrido`). |
| **Matriz en el 94** | 94 §2.2 gana el grado como tercera lectura (nivel del documento · disparador · grado del elemento) y una sección «Perfiles de empresa» que remite al 96 | Texto breve en documento existente | La capa 1 «Esencial» pasa a definirse como «los elementos M», que es más preciso que «documentos de nivel Siempre». |
| **Verificación** | `verificar_coherencia.ps1`: (a) todo criterio Express es M y todo M de plantilla da evidencia a un criterio M; (b) ninguna plantilla tiene campos sin grado; (c) el perfil B de S0 no sube de 78 criterios; (d) las diez métricas M salen de T01 con los datos de demostración | Comprobación | Evita que el grado se degrade con el tiempo. |

Orden propuesto: primero los criterios y las métricas (son datos, una sesión), después las plantillas (74 × 2 idiomas, es la parte larga, y conviene hacerla cuando la rama de Express esté en `main` para no tocar P01 y P04 dos veces), por último T23 y los textos del 94 y el 96.

---

## 9. Lo que necesita decidir el autor

1. **Los tres grados y sus nombres**: Mínimo · Exigible · Recomendable (M/E/R). Alternativa considerada y descartada: cuatro grados con «obligatorio» entre mínimo y exigible; no añade nada que la condición escrita del E no diga ya.
2. **La regla de asignación de §2.2** (M = núcleo + lista Express; E = condición escrita; R = resto). Es lo que permite que el grado no dependa de opiniones.
3. **Los tres ejes y los siete perfiles EM** de §3, en especial que **el tamaño solo decide quién ocupa los roles** (coherente con 90 §2.1) y que EM-7 (sector público) exista aparte.
4. **Las diez métricas M del cuadro de mando** (§5.2) y que el inventario sea el primer bloque del resumen de una página del 60.
5. **Los trece campos M del inventario** (§6).
6. **Si los `.docx` de las plantillas se generan en tres versiones** (M · M+E · completa) o solo la completa con los grados marcados.
7. **Umbrales orientativos que aparecen aquí** y no están en el marco: 250 personas como frontera de «pequeña» (solo para el eje 3, no decide exigencias); «X meses» para pilotos sin G3. Se proponen como valores de partida a calibrar en C5, como el resto.
8. **Cuándo**: si se hace antes o después de integrar la rama de Express en `main`. Recomendación: después, porque P01, P04, 21 y 94 cambian en las dos.
9. **Los bloques «Organización» y «Aspiración» del cuestionario de entrada** (§10): las nueve preguntas, el modificador MP6 y que la organización no puntúe madurez.

---

## 10. Cuestionario de entrada: dónde está, cómo está organizada y dónde quiere estar

Petición del autor (12-10-2026): preguntar también por la organización (equipo dedicado, negocios separados por P&L que impiden la visión 360 del cliente y de los procesos) para medir la madurez actual y la aspiracional y el camino entre ambas; y que la herramienta sea autoconsumible, atractiva y breve, porque se libera en abierto.

### 10.1 Qué se mide ya y qué no

| Pregunta de una compañía | ¿Se pregunta hoy? | Dónde |
|---|---|---|
| ¿Qué tengo en producción: reglas, IA de terceros, ML, generativa, agentes? | Sí | T23 Q01; huella HT0–HT5 (11 §7.6) |
| ¿Cuántos pilotos tengo y de qué tipo? | Sí | T23 Q02–Q03 |
| ¿Hago eficiencia o me transformo? | Sí | Índice IM1–IM4 (12); ambición por iniciativa |
| ¿Tengo equipo propio? | Parcial | T23 Q12 (propio o por terceros; no distingue dedicado) |
| ¿Tengo equipo **dedicado** a la IA, o personas a ratos? | **No** | — |
| ¿Mis negocios están separados por P&L? | **No** | — (54 §3 lo describe, sin pregunta) |
| ¿Tengo visión 360 del cliente entre unidades? | **No** | — |
| ¿Tienen mis procesos un dueño de extremo a extremo? | **No** | IT-P2 lo mide por iniciativa, no para la compañía |
| ¿Comparto datos y plataforma entre unidades? | **No** | D3.11 y D4.11 lo miden en nivel 5, como resultado, no como situación de partida |
| ¿Dónde quiero estar en 12 y 24 meses? | Parcial | 11 §8 da objetivos por ambición; P34 §6.6 los recoge a mano; nadie los pregunta ni los calcula |

### 10.2 Un solo cuestionario de entrada, tres bloques, una página

T23 ya tiene las doce preguntas de situación. Se le añaden dos bloques y una salida, sin herramienta nueva (D143):

| Bloque | Preguntas | Alimenta |
|---|---|---|
| **A · Dónde está** | Q01–Q12 actuales + **Q13** estructura societaria (§3.3) | Arquetipo PP, perfil EM (ejes 1 y 2), huella |
| **B · Cómo está organizada** (nuevo) | **Q14** Equipo de IA: ninguno · personas a tiempo parcial · equipo dedicado · varios equipos por unidad. **Q15** ¿Los negocios se gestionan con P&L separados? sí · no · parcialmente. **Q16** ¿Comparten las unidades los datos del cliente (visión 360)? no · parcial · sí. **Q17** ¿Tienen los procesos principales un dueño de extremo a extremo? ninguno · alguno · la mayoría. **Q18** ¿Datos y plataforma de IA son comunes a las unidades? no · parcial · sí. **Q19** ¿Quién decide la inversión en IA? cada unidad · central · mixto. | Eje 3 (quién ocupa los roles); **modificador MP6**; prioridad de hitos; lectura de la madurez D3 y D5 |
| **C · Dónde quiere estar** (nuevo) | **Q20** Ambición predominante a 24 meses: optimizar · aumentar · transformar. **Q21** Alcance del impacto que busca: tarea · proceso · personas y organización · modelo de negocio (IM1–IM4). **Q22** Huella objetivo: hasta IA de terceros · modelos propios · IA generativa en procesos · agentes que actúan (HT2–HT5). | Objetivo por dimensión D1–D7 (tabla de 11 §8 y mínimos por huella de 11 §7.6) → **madurez aspiracional**; brecha con la actual; camino |

**Salida, en una pantalla:** perfil EM y arquetipo · madurez actual (de T15 si existe; si no, «sin diagnóstico», nunca estimada) · madurez aspiracional por dimensión (calculada de Q20–Q22 con 11 §8, marcada «objetivo de referencia, a aprobar en C2») · brecha · los tres hitos por los que empezar · lo que la organización frena (§10.3). Se imprime como el plan actual de T23.

### 10.3 Modificador MP6 · negocios en silos

Se propone un sexto modificador en el 96 §2.3, derivado de Q15–Q18:

| Condición | Efecto en el recorrido |
|---|---|
| P&L separados (Q15 sí) **y** sin visión 360 (Q16 no) o sin dueño de proceso (Q17 ninguno) | **IM3 e IM4 no son alcanzables con la organización actual**: toda iniciativa de Transformar sobre cliente o proceso lleva una condición organizativa en G2 (dueño de proceso nombrado o acuerdo de datos entre unidades) antes de invertir en viabilidad. Las iniciativas transversales se miden por unidad desde el principio (40 §7.2). HI-20 (datos y conocimiento) y HI-19 (personas) suben a prioridad 2; el camino incluye el hito organizativo como condición de la ambición, no como hito nuevo. |
| Varios equipos por unidad (Q14) sin plataforma común (Q18 no) | Inventario consolidado (HI-05) a prioridad 1; plataforma habilitadora como primera decisión de cartera (10 §4.1). |
| Inversión decidida por cada unidad (Q19) | Umbrales de C2 y sobres (13 §6) se aprueban antes que cualquier iniciativa nueva; el panel distingue por unidad. |

**La organización no puntúa madurez.** Igual que la huella tecnológica (D120), Q14–Q19 no suben ni bajan el nivel D1–D7: fijan qué ambición es alcanzable y qué hitos van antes. Si se sumaran, una compañía centralizada parecería más madura que una federada bien gobernada.

### 10.4 Madurez aspiracional

Hoy el objetivo por dimensión se fija a mano en C2 (P34 §6.6). Con Q20–Q22 se calcula un **objetivo de referencia** desde la tabla de 11 §8 (por ambición, a 12 y 24 meses) y los mínimos por huella de 11 §7.6 (por la huella objetivo), y se muestra junto al nivel actual de T15:

| Dimensión | Actual (T15) | Objetivo 12 m | Objetivo 24 m | Brecha | Qué la cierra (hitos) |
|---|---|---|---|---|---|

La fila se rellena sola; la compañía la aprueba o la cambia en C2 y queda en `madurez[].objetivos` de T01 (campo opcional, D53). T15 lo muestra en su informe y el panel T17 en la tarjeta de madurez («actual · objetivo · brecha»). Un objetivo por debajo del mínimo exigible por la huella objetivo se marca en rojo: no se puede aspirar a agentes con D6 en 2.

### 10.5 Autoconsumible y breve

Reglas para esta pantalla, que valen para todo lo que se libere en abierto:

1. **Una pantalla, 22 preguntas, respuestas cerradas**, ninguna exige leer un documento antes. Cada pregunta lleva un «?» de una línea (D123), no un párrafo.
2. **El resultado cabe en una tarjeta**: perfil, actual, aspiracional, brecha, tres hitos. Lo demás (el recorrido completo, el plan por rol) está a un clic, como ya hace T23.
3. **Sin cuenta, sin envío, datos en el navegador** (D103). Se imprime o se exporta JSON.
4. **Sin vocabulario interno en la pantalla**: «¿Los negocios se gestionan con cuentas de resultados separadas?» en lugar de «P&L por unidad». Los códigos (PP, EM, HI) aparecen en la tarjeta de resultado, enlazados (D99), no en las preguntas.
5. Lo que no se sabe se responde «no se sabe» y cuenta como el valor más exigente (regla de 96 §2.4).

### 10.6 Prototipo

`_trabajo/20261012_Prototipo_cuestionario_de_entrada_T23.html` (una página, sin dependencias; publicado también como artifact privado) implementa el cuestionario de §10.2 con las reglas de asignación del 96 §2.2, los modificadores MP1–MP6, las prioridades de 96 §4.2 con los ajustes de §10.3, los objetivos de 11 §8 y los mínimos por huella de `lentes.json`. Q07 gana la opción «sector público», sin la cual EM-7 no se puede asignar. El nivel actual de madurez se introduce a mano si existe un diagnóstico de T15; sin él, la tarjeta dice «sin diagnóstico» y no estima. Es la referencia funcional para implantarlo en T23 (`recorrido.json` + `build_recorrido.ps1`), con la ayuda «?» de D123 y los dos idiomas.
