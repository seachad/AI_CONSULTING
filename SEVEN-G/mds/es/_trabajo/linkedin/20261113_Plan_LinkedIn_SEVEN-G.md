# Plan de publicaciones en LinkedIn · SEVEN-G y marca personal del autor

Documento de trabajo. No se publica. Fecha: 13-11-2026; actualizado el 14-11-2026 (D183: dos líneas). Estado: **aprobado por el autor (D172 y D183); cada texto sigue en `borrador` hasta que el autor lo apruebe**.

Ficheros de esta carpeta:

- `linkedin_calendario.json`: fuente del calendario (104 publicaciones, con el texto completo de las 20 primeras y de 4 más).
- `editor_publicaciones.html`: editor para revisar, modificar y aprobar las publicaciones (D183). Ábralo con Edge, pulse «Abrir el calendario (JSON)» y elija `linkedin_calendario.json`; cada cambio se guarda en ese fichero.
- `linkedin_calendario.csv`: la misma tabla para hoja de cálculo (separador `;`).

**Regla principal: nada se publica sin aprobación expresa del autor.** Cada publicación tiene un campo `estado`. Solo el autor lo cambia de `borrador` a `aprobado`, con el editor o a mano. El editor no publica nada.

## 0. Avisos antes de leer

1. **El perfil de LinkedIn del autor se leyó el 13-11-2026** con el navegador del autor: la página del perfil y las 22 publicaciones de su actividad del último año. La sección 1 son las notas de estilo.
2. **La historia de la entrada tiene ocho pasos (D169).** La decisión D169 y `SEVEN-G/build/preguntas.json` están en `main` desde el 13-11-2026; la sesión en la nube trabajó sobre una copia anterior. La serie de la historia pasa a ocho entregas y un cierre (secciones 2.3 y 5). Las secciones `#parar` y `#mas` ya no están en la entrada: esas publicaciones enlazan ahora las páginas de pregunta (`html/es/preguntas/`).
3. Los textos usan «tú», como el autor en LinkedIn. No llevan emojis ni etiquetas (sección 1.3).
4. Ninguna publicación cita cifras de mercado. Las únicas cifras son recuentos del propio marco (seis preguntas, ocho pasos, seis frenos).
5. **Aprobado por el autor el 13-11-2026 (D172):** español para las 104 publicaciones, martes 08:15 y jueves 15:30 (hora de Madrid), inicio el martes 17-11-2026 y parámetros `utm` en los enlaces. El horario sigue siendo una hipótesis que se comprueba con la prueba de la sección 4.2. Cada texto sigue en `borrador` hasta que el autor cambie su `estado`.
7. **Dos líneas desde el 14-11-2026 (D183).** Martes: **SEVEN-G** (el método). Jueves: **El mundo de la IA** (estudios, fundamentos e historia, futuro y sectores), con una publicación al mes, el primer jueves, de «Lo que ha pasado este mes». Cada texto de esa línea termina con «Qué significa para tu consejo:». La historia en ocho pasos no cambia: todos sus pasos caen en martes. Las publicaciones de SEVEN-G pasan de 104 a 52; las ideas que no caben quedan para un segundo año.
6. **La publicación 1 fija el objetivo de la serie** (decisión del autor, D172): compartir conocimiento sobre la implantación estratégica de la IA, abrir debate y pedir participación activa. El feedback sirve para mejorar SEVEN-G, SPHERES y SPAD y vuelve a la comunidad. Es la única publicación que nombra SPHERES y SPAD; el resto del plan no los trata.

## 1. Notas de estilo del autor

Fuente: las 22 publicaciones de la actividad del perfil, de hace un mes a hace un año, leídas el 13-11-2026. Unas diez son textos propios y el resto son comentarios al compartir una publicación de otra persona. Las citas son literales. No se nombra a ninguna compañía ni a terceros (D17).

### 1.1 Rasgos observados

| Rasgo | Qué hace | Ejemplo literal |
|---|---|---|
| Tratamiento | «Tú» en singular y «vosotros» en plural. Nunca «usted». | «Si preguntas a una IA, pídele citas y evidencias.» · «Quiero compartir con vosotros un video» · «Si trabajas con IA sin ser experto en matemáticas, esto es para ti.» |
| Primera línea | Corta. Tres formas: una afirmación rotunda, una pregunta o un título de dos palabras. | «La IA nos obliga a saber decir NO.» · «¿Tiene sentido seguir aprendiendo a programar en la era de la IA?» · «El apagón» |
| Párrafos | De una o dos frases, con línea en blanco entre ellos. Frases sueltas que hacen de golpe. | «Ese 10% es el problema.» · «La idea central es contraintuitiva.» |
| Contraste | Niega una idea y afirma otra, en dos frases cortas. | «Estamos viviendo una transformación que ya no va de tecnología. Va de negocio, estrategia, organización, riesgos y liderazgo.» · «La IA no elimina trabajo; multiplica las posibilidades de trabajo.» |
| Primera persona | Cuenta lo que ha leído, escrito o visto. | «He leído un artículo muy interesante» · «He escrito este artículo de divulgación» · «Es una pregunta que cada vez escucho más» |
| Rótulos dentro del texto | Anuncia la parte con una palabra y dos puntos. | «La respuesta corta es: sí, y probablemente más que nunca.» · «Conclusión:» · «Consejo práctico:» · «Resultado:» |
| Listas | Con «•», «→», «-» o números. Elementos cortos. | «• aparecen más tareas nuevas» · «→ Legal: un informe con referencias a jurisprudencia real» · «1. Usa RAG para generar borradores» |
| Ejemplos y comparaciones | Explica con una historia o una imagen de la vida diaria. Es su recurso más propio. | «¿Sabías que una IA funciona como un turista perdido en una ciudad?» · «Tenemos el Ferrari y lo usamos para ir al supermercado.» · «parecidos a adoptar un cachorro y meterlo en tu casa» · «estamos usando el juguete más caro del mundo» |
| Pregunta dentro del texto | Se hace la pregunta y la responde. | «¿Qué significa esto?» · «La pregunta del millón ¿Por qué ocurre esto?» · «más bien la pregunta es: ¿en qué parte del gráfico estamos?» |
| Cierre | Cuatro formas: una pregunta al lector, la pregunta que debe hacerse un consejo, una frase con valor de regla o una invitación a comentar. A veces, una nota personal o un saludo. | «¿Tienes el proceso para verificar lo que se produce?» · «¿Que debe preguntarse un consejo?: ¿Tenemos asegurada la continuidad de servicio…?» · «La clave no es si […], sino cuándo» · «Se aceptan (y agradecen) comentarios» · «Feliz IA!» |
| Reto al lector | Propone una prueba concreta. | «Reto: asigna a una IA […] una tarea que a un humano tenga que dedicar un orden de 5 horas» |
| Exclamaciones | Solo el signo de cierre, a veces repetido. Más en los comentarios breves que en los textos largos. | «Siempre!» · «Impresionante!» · «Pues ya tengo libro para leer en Octubre!!!!» |
| Emojis | Ninguno. Una vez, un emoticono de texto. | «El los llamada "la banda" :-)» |
| Etiquetas | Irregular: de ninguna a siete, al final, en español e inglés. Una vez usó una etiqueta propia del marco. Las publicaciones de los últimos cinco meses no llevan ninguna. | «#InteligenciaArtificial #LLM #Divulgación #EspacioLatente #IA #AIGovernance» · «#IA #AECF_framework #SEVENG_framework» |
| Experiencia propia | Habla de su trabajo con empresas sin nombrar a ninguna, y de su casa. | «En mi trabajo habitual con empresas insisto mucho en…» · «ahí tengo a mis hijos aprendiendo a programar» |
| Fuentes | Las nombra en el texto o al final. | «(Harvard Business Review, febrero 2026)» · «Fuentes: […] y otras (12-13 jun. 2026).» |
| Vocabulario | Términos de negocio en español y términos técnicos en inglés sin traducir. | «consejo», «gobernanza», «continuidad», «liderazgo» · «fallback», «failover», «output», «RAG» |
| SEVEN-G | Lo cita como marco propio, dentro del razonamiento y no al principio. | «el caso ilustra algo que difiendo dentro del marco SEVEN-G» · «La metodología SEVEN-G parte de un principio claro» |
| Longitud | Los textos propios son largos: de unas 150 a unas 500 palabras. Los comentarios al compartir tienen de una a tres líneas. | — |

### 1.2 Lo que se mantiene del sitio

El autor escribe en el sitio con los mismos recursos: contraste («con cifras, no con entusiasmo»), comparación de negocio («como un embudo de ventas»), frase de cierre con valor de regla («"Sin dato" nunca es cero.») y límites dichos con claridad («No es una alternativa a ISO/IEC 42001 ni una certificación»). La diferencia es el tratamiento: el sitio usa «usted» y LinkedIn usa «tú».

### 1.3 Cómo se aplican a los textos del plan

1. **«Tú»** en todos los textos. La página enlazada usa «usted»: es un cambio de registro que el lector acepta entre una red social y un documento.
2. **Primera línea** en una de las tres formas del autor. Las entregas de una serie llevan además su número.
3. **Rótulos** del autor donde encajan: «Conclusión:», «La respuesta corta es:».
4. **Cierre** con una pregunta al lector o con la pregunta que debe hacer un consejo.
5. **Listas con «•»** o con números.
6. **Sin emojis y sin etiquetas**, como sus publicaciones recientes. Una exclamación como mucho, solo con signo de cierre.
7. **Longitud: de 60 a 120 palabras.** Es más corto que su costumbre. Es lo que pidió para este plan (dos publicaciones breves por semana). Punto débil: su publicación propia con más alcance de las leídas es un texto con artículo enlazado, pregunta inicial y una comparación; no hay datos para saber si el formato breve funciona igual. La prueba de la sección 4.2 lo mide.
8. **No se inventan experiencias del autor.** Un texto solo dice «he visto» o «he leído» si el autor lo confirma al aprobarlo.

Lo que no se toma: las faltas de tecleo de los originales («difiendo», «Mentre») y los términos técnicos en inglés, porque el público de este plan no es técnico.

## 2. Estrategia

### 2.1 Posicionamiento

Una frase que debe poder repetir cualquier lector después de tres meses:

> «Fernando García Varela es quien explica cómo un consejo y una dirección gobiernan, miden y escalan la IA.»

Idea central, que se repite al menos una vez al mes con palabras distintas:

> La IA no es una tecnología ni un producto más. Es un activo estratégico. Sus decisiones son del consejo, del primer ejecutivo y de la dirección financiera, no solo de tecnología.

Qué no se trata: AECF_MCP, SPAD, modelos de trabajo de equipos de desarrollo, comparativas de modelos, noticias de producto sueltas. Las noticias solo entran en «Lo que ha pasado este mes», con su lectura para el consejo.

### 2.2 Pilares

| Línea · pilar | Qué aporta | Publicaciones | Fuente |
|---|---|---|---|
| SEVEN-G · Historia en ocho pasos, «Del entusiasmo a la transformación gobernada» | El relato: de probar a gobernar | 10 (ocho pasos, cierre y carrusel) | Entrada, `#historia` |
| SEVEN-G · Tres preguntas estratégicas | Dónde invertir, cómo escalar, cómo demostrar el valor | 3 | Entrada, `#para-que` |
| SEVEN-G · Seis preguntas del consejo | El lenguaje del consejo | 8 | Páginas `preguntas/`; documento 61, sección 9 |
| SEVEN-G · Áreas de actuación | Profundidad, un asunto cada vez | 25 | `areas/<id>.html` y documentos del marco |
| SEVEN-G · Mitos y errores, idea central | Opinión y límites del marco | 6 | Documentos 00, 04, 54 y 61 |
| El mundo de la IA · Estudio | Lo que dice un estudio relevante, leído para un consejo | 8 | Fuente primaria verificada en el registro de referencias |
| El mundo de la IA · Fundamentos e historia | Conceptos que un consejero debe distinguir | 12 | Sin cifras; si hay una, con fuente |
| El mundo de la IA · Futuro | Qué vigilar y qué decidir antes | 9 | Fuente primaria o página del marco |
| El mundo de la IA · Sector | Cercanía a cada sector | 11 | Galería por sector (fuentes verificadas) |
| El mundo de la IA · Lo que ha pasado este mes | Estar al día sin ruido | 12 | Fuentes primarias; se escribe la semana anterior |

Regla de reparto por sector (D165): ningún sector aparece más de una vez. Los once sectores son distintos.

### 2.3 Reparto por trimestre

| Trimestre | Semanas | Tema del trimestre | Público principal | Series |
|---|---|---|---|---|
| 1 | 1 a 13 | De probar la IA a gobernarla | Primer ejecutivo y consejo | Historia (8 martes, cierre y carrusel), Tres preguntas (martes) |
| 2 | 14 a 26 | Las preguntas del consejo y el dinero | Consejo y dirección financiera | Seis preguntas (6 martes), Valor para la dirección financiera (martes) |
| 3 | 27 a 39 | Organización, personas y transformación | Transformación, personas y negocio | Organización IA-first (4), Talento técnico (3), Transformación (4) |
| 4 | 40 a 52 | Riesgo, seguridad, normas e implantación | Riesgos, cumplimiento y consejo | Riesgo (5), Seguridad (4), Consejo (3), Implantar (4) |

La historia tiene ocho pasos en dos actos (D169). La serie ocupa los martes de las semanas 2 a 9, un paso por semana. El martes de la semana 10 es el cierre («El camino es el mismo. El punto de partida, no.»), que en la entrada es la banda final y no un paso. El martes de la semana 11 es el carrusel con los ocho pasos.

| Semana | Paso | Título en la entrada | Página de destino |
|---|---|---|---|
| 2 | 1 | Todo empieza con entusiasmo | Entrada, `#historia` |
| 3 | 2 | El consejo empieza a preguntar | Entrada, `#preguntas` |
| 4 | 3 | Primero, saber qué tiene | Diagnóstico de madurez (T15) |
| 5 | 4 | Mirar fuera y decidir cuánto quiere | Galería por sector |
| 6 | 5 | Poner la cartera en movimiento | Entrada, `#embudo` |
| 7 | 6 | Cifras que el consejo puede creerse | Panel del consejo de ejemplo |
| 8 | 7 | Gobernar sin frenar | Página «¿Sé parar a tiempo?» |
| 9 | 8 | Con la casa en orden, ir a más | Página «¿Puede hacer más mi compañía?» |
| 10 | Cierre | El camino es el mismo. El punto de partida, no. | Entrada, `#partida` |

La serie «Seis preguntas» (martes de las semanas 14 a 19) enlaza la página propia de cada pregunta (`html/es/preguntas/<id>.html`, D169).

### 2.4 Series encadenadas

Una serie crea el hábito de volver. Reglas:

- Cada serie tiene un día fijo: la serie principal del trimestre va en martes.
- Cada entrega lleva su número («3 de 8») en la primera línea.
- Cada entrega se entiende sola. No obliga a leer la anterior.
- Al terminar una serie, un carrusel la resume (semanas 11, 26 y 52).
- El jueves es «El mundo de la IA»: estudio, fundamentos, futuro o sector, y el primer jueves de cada mes, «Lo que ha pasado este mes». Rota para no repetir formato dos jueves seguidos.

«La pregunta incómoda» se queda en dos entregas de martes (semanas 23 y 25); el resto de sus ideas queda para un segundo año.

## 3. Idioma

**Recomendación: español para las 104 publicaciones. Inglés solo como adaptación mensual de lo que mejor funcione, a partir del segundo trimestre. No se duplica cada publicación.**

Motivos:

1. El objetivo es que le contraten compañías. Su mercado natural es España y Latinoamérica, y su público decide en español.
2. Una publicación duplicada divide las reacciones entre dos textos. Además, parte de su red vería dos veces lo mismo.
3. Publicar en dos idiomas con dos por semana deja una publicación semanal por idioma. Es poco para crear hábito en cualquiera de los dos.
4. El sitio ya existe en inglés. Un lector internacional que llegue al sitio cambia de idioma con un clic.

Cómo usar el inglés sin duplicar:

- Desde la semana 14, una vez al mes, tome la publicación en español con mejores resultados del mes anterior.
- Escríbala de nuevo en inglés (no una traducción literal) y enlace la página equivalente de `SEVEN-G/html/en/`.
- Publíquela un tercer día (miércoles), para no ocupar los dos huecos en español.
- Son 9 o 10 publicaciones más al año. Solo se adapta lo que ya ha demostrado interés.

Revise la decisión a los seis meses. Si más de una cuarta parte de quienes reaccionan trabaja fuera de España y Latinoamérica, suba a dos adaptaciones al mes.

## 4. Cuándo publicar

### 4.1 Propuesta de partida

No hay una fuente oficial de LinkedIn con «la mejor hora» para este público. La propuesta sale de los husos horarios y es una hipótesis. Se comprueba con las estadísticas propias (sección 4.2).

| Día | Hora (Madrid) | Por qué |
|---|---|---|
| Martes | 08:15 | Inicio de jornada en España. La dirección revisa el teléfono antes de la primera reunión. |
| Jueves | 15:30 | Son las 08:30 en Ciudad de México y las 09:30 en Bogotá y Lima. En España es la sobremesa. Alcanza a los dos lados. |

Notas:

- La diferencia con México es de 7 horas. En el verano europeo es de 8 horas. Con Bogotá y Lima es de 6 horas, y de 7 en verano.
- Se evitan el lunes (arranque de semana) y el viernes por la tarde.
- Semanas de baja actividad: Navidad (semanas 6 y 7), Semana Santa de 2027 (semana 19) y agosto (semanas 38 a 40). El calendario pone ahí publicaciones ligeras. No ponga ahí una serie importante.

### 4.2 Cómo comprobarlo con sus estadísticas

Haga la prueba durante las ocho primeras semanas:

1. Semanas 1 a 4: publique con el horario de la tabla.
2. Semanas 5 a 8: cambie el jueves a las 08:15 y el martes a las 15:30.
3. Anote de cada publicación, a los siete días: impresiones, reacciones, comentarios, veces compartida y clics en el enlace.
4. Compare la mediana de cada combinación de día y hora. No compare la media: una sola publicación viral la falsea.

Dónde mirar:

- En cada publicación: «Ver análisis». Da impresiones, interacciones y los datos de quien la vio: cargo, sector, ubicación y tamaño de empresa.
- En su perfil: «Análisis» → «Publicaciones». Permite exportar un periodo a una hoja de cálculo.
- En el sitio: Umami muestra las visitas por página y su origen. Si añade a cada enlace los parámetros `utm_source=linkedin&utm_campaign=p001`, verá qué publicación trajo cada visita. El calendario ya lleva ese campo (`utm`). Es una medición agregada; no identifica a nadie.

El indicador que importa no es el número de reacciones. Son dos:

- **Quién reacciona**: proporción de cargos de dirección y consejo entre quienes ven y comentan.
- **Visitas al sitio** desde LinkedIn, por página.

Una publicación con 30 reacciones de directivos vale más para su objetivo que una con 300 de otro público.

## 5. Calendario de 52 semanas

Inicio propuesto: martes 17-11-2026. Si empieza otro día, las fechas se desplazan; el orden no cambia. Las rutas de destino son relativas a la base del sitio (variable `base_url` del JSON; hoy `https://seachad.github.io/AI_CONSULTING/`, puede cambiar por D158). Las 104 rutas y sus anclas se comprobaron el 13-11-2026 contra los HTML del repositorio con D169 ya integrada. Las ideas de las semanas 11 a 52 son notas internas y conservan «su»; el texto de cada una se escribe con «tú».

### Trimestre 1

| Sem. | Fecha | Día | Pilar | Serie | Idea | Página de destino |
|---|---|---|---|---|---|---|
| 1 | 17-11-2026 | martes | Idea central | Apertura | Objetivo de la serie, público, qué se va a publicar, qué son SEVEN-G y SPHERES y por qué se crearon, y mensaje principal: el error es tratar la IA como una tecnología más. Se busca participación activa: el feedback mejora SEVEN-G, SPHERES y SPAD y vuelve a la comunidad. | `SEVEN-G/html/es/entrada/index.html` |
| 1 | 19-11-2026 | jueves | El mundo de la IA | Estudio | McKinsey, «The agentic organization» (septiembre de 2025): la IA como el mayor cambio de paradigma organizativo desde las revoluciones industrial y digital. Cuatro eras y qué cambia en la de la IA. | `https://www.mckinsey.com/capabilities/people-and-organization/our-insights/the-agentic-organization-contours-of-the-next-paradigm-for-the-ai-era` |
| 2 | 24-11-2026 | martes | Historia | Historia en ocho pasos 1/8 | Todo empieza con entusiasmo: una docena de iniciativas de IA y nadie las gobierna. | `SEVEN-G/html/es/entrada/index.html#historia` |
| 2 | 26-11-2026 | jueves | El mundo de la IA | Fundamentos e historia | Qué es (y qué no es) un agente de IA. Un asistente propone; un agente actúa. Tres preguntas antes de aprobar uno. | `SEVEN-G/html/es/35_SEVEN-G_Seguridad_de_IA_y_agentes.html#niveles-de-autonomia` |
| 3 | 01-12-2026 | martes | Historia | Historia en ocho pasos 2/8 | El consejo empieza a preguntar: «¿esto produce algo?». Nadie tiene una respuesta única. | `SEVEN-G/html/es/entrada/index.html#preguntas` |
| 3 | 03-12-2026 | jueves | El mundo de la IA | Lo que ha pasado este mes | Lo que ha pasado en IA en noviembre: tres o cuatro noticias con su lectura para el consejo. Solo fuentes primarias (anuncio de la compañía, regulador o estudio original). Se escribe la semana anterior. | `` |
| 4 | 08-12-2026 | martes | Historia | Historia en ocho pasos 3/8 | Primero, saber qué tienes: inventario y primera lectura de madurez. Más tecnología que gobierno no es una ventaja. | `SEVEN-G/herramientas/T15_diagnostico_madurez/madurez.html` |
| 4 | 10-12-2026 | jueves | El mundo de la IA | Fundamentos e historia | La IA no es nueva; lo nuevo es lo que hace. Tres etapas (reglas, aprendizaje, generación y acción) y lo que cada una pidió a la dirección. | `SEVEN-G/html/es/11_SEVEN-G_Modelo_de_madurez.html#7-6-lectura-en-tres-lentes` |
| 5 | 15-12-2026 | martes | Historia | Historia en ocho pasos 4/8 | Mirar fuera y decidir cuánto quieres: el sector como referencia, y la primera decisión del consejo sobre ambición y riesgo. | `SEVEN-G/herramientas/T17_panel_consejo/galeria/index.html` |
| 5 | 17-12-2026 | jueves | El mundo de la IA | Futuro | Foro Económico Mundial, «Future of Jobs Report 2025»: la barrera para transformar el negocio no es la tecnología, son las competencias. | `https://www.weforum.org/publications/the-future-of-jobs-report-2025/` |
| 6 | 22-12-2026 | martes | Historia | Historia en ocho pasos 5/8 | Poner la cartera en movimiento: aquí empieza el método. El embudo muestra qué avanza, qué se atasca y qué sale. | `SEVEN-G/html/es/entrada/index.html#embudo` |
| 6 | 24-12-2026 | jueves | El mundo de la IA | Fundamentos e historia | Lectura corta para las fiestas: IA predictiva, generativa y agéntica. Tres palabras que no son lo mismo y se gobiernan distinto. | `SEVEN-G/html/es/02_SEVEN-G_Glosario_y_convenciones.html` |
| 7 | 29-12-2026 | martes | Historia | Historia en ocho pasos 6/8 | Cifras que el consejo puede creerse: «sin dato» nunca es cero. | `SEVEN-G/herramientas/T17_panel_consejo/ejemplo/salida/t01_Dashboard_Casos_Uso_IA_v8.html` |
| 7 | 31-12-2026 | jueves | El mundo de la IA | Futuro | Tres cosas que vigilaría en 2027 desde un consejo: agentes en procesos reales, el coste de la IA y la regulación en aplicación. | `https://eur-lex.europa.eu/eli/reg/2024/1689/oj/spa` |
| 8 | 05-01-2027 | martes | Historia | Historia en ocho pasos 7/8 | Gobernar sin frenar: una puerta antes de cada gran gasto. | `SEVEN-G/html/es/preguntas/parar.html` |
| 8 | 07-01-2027 | jueves | El mundo de la IA | Lo que ha pasado este mes | Lo que ha pasado en IA en diciembre: tres o cuatro noticias con su lectura para el consejo. Solo fuentes primarias (anuncio de la compañía, regulador o estudio original). Se escribe la semana anterior. | `` |
| 9 | 12-01-2027 | martes | Historia | Historia en ocho pasos 8/8 | Con la casa en orden, ir a más: la ambición de transformación solo es real con un gobierno serio debajo. | `SEVEN-G/html/es/preguntas/mas.html` |
| 9 | 14-01-2027 | jueves | El mundo de la IA | Estudio | OCDE, «Employment Outlook 2023»: la IA rinde más donde se forma a las personas para trabajar con ella. | `https://www.oecd.org/content/dam/oecd/en/publications/reports/2023/07/oecd-employment-outlook-2023_904bcef3/08785bba-en.pdf` |
| 10 | 19-01-2027 | martes | Historia | Cierre de la historia | El camino es el mismo; el punto de partida, no. Cierre de la historia y por dónde empieza cada compañía. | `SEVEN-G/html/es/entrada/index.html#partida` |
| 10 | 21-01-2027 | jueves | El mundo de la IA | Sector | Banca: el sector que más IA anuncia y el que menos la mide. Evident AI Outcomes Report 2025 y tres tendencias del sector. | `SEVEN-G/herramientas/T17_panel_consejo/galeria/index.html#es-banca` |
| 11 | 26-01-2027 | martes | Historia | Resumen de la historia | Del entusiasmo a la transformación gobernada: la historia completa en ocho pasos. | `SEVEN-G/html/es/entrada/index.html#historia` |
| 11 | 28-01-2027 | jueves | El mundo de la IA | Estudio | Harvard Business School, «The Cybernetic Teammate» (2025): con IA, una persona igualó a un equipo sin IA y la IA redujo los silos entre funciones. | `https://www.hbs.edu/faculty/Pages/item.aspx?num=67197` |
| 12 | 02-02-2027 | martes | Tres preguntas estratégicas | Tres preguntas 1/3 | Dónde invertir: ¿su inversión sigue a su estrategia o a quien pidió presupuesto primero? | `SEVEN-G/herramientas/T17_panel_consejo/ejemplo/salida/t01_Dashboard_Casos_Uso_IA_v8.html` |
| 12 | 04-02-2027 | jueves | El mundo de la IA | Lo que ha pasado este mes | Lo que ha pasado en IA en enero: tres o cuatro noticias con su lectura para el consejo. Solo fuentes primarias (anuncio de la compañía, regulador o estudio original). Se escribe la semana anterior. | `` |
| 13 | 09-02-2027 | martes | Tres preguntas estratégicas | Tres preguntas 2/3 | Cómo escalar: seis frenos y por cuál se empieza. Una lista sin orden no es un plan. | `SEVEN-G/html/es/60_SEVEN-G_Paquete_para_el_consejo.html#10-4-que-frena-el-escalado-lectura-ejecutiva-y-donde-actuar-primero` |
| 13 | 11-02-2027 | jueves | El mundo de la IA | Fundamentos e historia | Por qué la IA generativa se equivoca con tanta seguridad. Qué es una «alucinación» y qué controles pide a la dirección. | `SEVEN-G/html/es/52_SEVEN-G_Manual_de_operacion_de_IA.html` |

### Trimestre 2

| Sem. | Fecha | Día | Pilar | Serie | Idea | Página de destino |
|---|---|---|---|---|---|---|
| 14 | 16-02-2027 | martes | Tres preguntas estratégicas | Tres preguntas 3/3 | Cómo demostrar el valor: las horas liberadas no son ahorro; solo suma lo validado. | `SEVEN-G/html/es/entrada/index.html#panel` |
| 14 | 18-02-2027 | jueves | El mundo de la IA | Sector | Seguros: hacia dónde se mueven los casos de uso de IA, con sus fuentes. | `SEVEN-G/herramientas/T17_panel_consejo/galeria/index.html#es-seguros` |
| 15 | 23-02-2027 | martes | Áreas de actuación | Valor (dirección financiera) | Trece errores que inflan el valor de la IA. Empiece por tres: ¿cuál comete su compañía? | `SEVEN-G/html/es/40_SEVEN-G_Reglas_de_medicion_del_valor.html#errores-frecuentes-que-inflan-el-valor` |
| 15 | 25-02-2027 | jueves | El mundo de la IA | Futuro | El cliente con su propio agente de IA: compara, cambia de producto y mueve saldos. Qué pasa con la distribución. | `SEVEN-G/herramientas/T17_panel_consejo/galeria/index.html#es-banca` |
| 16 | 02-03-2027 | martes | Seis preguntas del consejo | Seis preguntas 1/6 | ¿Estoy avanzando con la IA? Cuántas entran, cuántas llegan y dónde se atascan. | `SEVEN-G/html/es/preguntas/avanzo.html` |
| 16 | 04-03-2027 | jueves | El mundo de la IA | Lo que ha pasado este mes | Lo que ha pasado en IA en febrero: tres o cuatro noticias con su lectura para el consejo. Solo fuentes primarias (anuncio de la compañía, regulador o estudio original). Se escribe la semana anterior. | `` |
| 17 | 09-03-2027 | martes | Seis preguntas del consejo | Seis preguntas 2/6 | ¿Son rentables mis casos de uso? Coste completo frente a eficiencias y retorno. | `SEVEN-G/html/es/preguntas/rentable.html` |
| 17 | 11-03-2027 | jueves | El mundo de la IA | Estudio | Eurostat: cuántas empresas europeas usan IA y para qué. Lo que dice la estadística oficial frente al ruido. | `https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Use_of_artificial_intelligence_in_enterprises` |
| 18 | 16-03-2027 | martes | Seis preguntas del consejo | Seis preguntas 3/6 | ¿Puede hacer más mi compañía? Nueve esferas y tres niveles de ambición. | `SEVEN-G/html/es/preguntas/mas.html` |
| 18 | 18-03-2027 | jueves | El mundo de la IA | Fundamentos e historia | Sin datos propios, la IA es la misma para todos. Por qué los datos son la ventaja que no se compra. | `SEVEN-G/html/es/areas/operacion.html` |
| 19 | 23-03-2027 | martes | Seis preguntas del consejo | Seis preguntas 4/6 | ¿Me transformo o solo soy más eficiente? Ocho señales lo separan. | `SEVEN-G/html/es/preguntas/transformo.html` |
| 19 | 25-03-2027 | jueves | El mundo de la IA | Sector | Industria: casos de uso de IA consolidados y emergentes, con sus fuentes. | `SEVEN-G/herramientas/T17_panel_consejo/galeria/index.html#es-industria` |
| 20 | 30-03-2027 | martes | Seis preguntas del consejo | Seis preguntas 5/6 | ¿Sé parar a tiempo? Cinco salidas en cada puerta, y parar es una de ellas. | `SEVEN-G/html/es/preguntas/parar.html` |
| 20 | 01-04-2027 | jueves | El mundo de la IA | Lo que ha pasado este mes | Lo que ha pasado en IA en marzo: tres o cuatro noticias con su lectura para el consejo. Solo fuentes primarias (anuncio de la compañía, regulador o estudio original). Se escribe la semana anterior. | `` |
| 21 | 06-04-2027 | martes | Seis preguntas del consejo | Seis preguntas 6/6 | ¿Tengo el riesgo bajo control? Inventario, una sola escala y roles separados. | `SEVEN-G/html/es/preguntas/riesgo.html` |
| 21 | 08-04-2027 | jueves | El mundo de la IA | Futuro | Empleo e IA: sustituir, aumentar o reorganizar. Una posición que el consejo debe aprobar antes de que se la pregunten. | `SEVEN-G/html/es/50_SEVEN-G_Personas_y_organizacion.html` |
| 22 | 13-04-2027 | martes | Mitos y errores de la dirección | Mitos | Mito: «tenemos muchos pilotos, vamos bien». Decidir uno por uno: escalar o parar. | `SEVEN-G/herramientas/T23_recorrido_implantacion/recorrido.html` |
| 22 | 15-04-2027 | jueves | El mundo de la IA | Estudio | Microsoft, «Work Trend Index 2025»: la compañía de frontera y los equipos de personas y agentes. | `https://blogs.microsoft.com/blog/2025/04/23/the-2025-annual-work-trend-index-the-frontier-firm-is-born/` |
| 23 | 20-04-2027 | martes | Seis preguntas del consejo | La pregunta incómoda | ¿Quién responde si la IA se equivoca? La responsabilidad no se traslada al sistema ni al proveedor. | `SEVEN-G/html/es/61_SEVEN-G_Guia_de_conversacion_con_el_consejo.html#preguntas-dificiles-frecuentes` |
| 23 | 22-04-2027 | jueves | El mundo de la IA | Sector | Sector público: casos de uso de IA y cómo los gobierna la Administración, con sus fuentes. | `SEVEN-G/herramientas/T17_panel_consejo/galeria/index.html` |
| 24 | 27-04-2027 | martes | Áreas de actuación | Valor (dirección financiera) | Tres estados de una cifra: estimada, declarada, validada. Solo la última suma. | `SEVEN-G/html/es/40_SEVEN-G_Reglas_de_medicion_del_valor.html#estados-del-importe` |
| 24 | 29-04-2027 | jueves | El mundo de la IA | Fundamentos e historia | Qué es un modelo fundacional y por qué casi todos dependemos de pocos proveedores. | `SEVEN-G/html/es/36_SEVEN-G_Terceros_y_proveedores_de_IA.html#dependencia-tecnologica-y-concentracion` |
| 25 | 04-05-2027 | martes | Seis preguntas del consejo | La pregunta incómoda | ¿Cuánto cuesta de verdad la IA? Las licencias son solo una parte. | `SEVEN-G/html/es/42_SEVEN-G_Costes_de_IA.html#componentes-del-coste-de-un-caso` |
| 25 | 06-05-2027 | jueves | El mundo de la IA | Lo que ha pasado este mes | Lo que ha pasado en IA en abril: tres o cuatro noticias con su lectura para el consejo. Solo fuentes primarias (anuncio de la compañía, regulador o estudio original). Se escribe la semana anterior. | `` |
| 26 | 11-05-2027 | martes | Áreas de actuación | Valor (dirección financiera) | Invierta por tramos: cada tramo se libera en una puerta, con una condición de paso. | `SEVEN-G/html/es/14_SEVEN-G_Gestion_de_cartera.html#capacidad-y-presupuesto-por-etapas` |
| 26 | 13-05-2027 | jueves | El mundo de la IA | Futuro | El nuevo mando intermedio: personas que supervisan agentes. Qué cambia en la estructura de la compañía. | `https://www.mckinsey.com/capabilities/people-and-organization/our-insights/the-agentic-organization-contours-of-the-next-paradigm-for-the-ai-era` |

### Trimestre 3

| Sem. | Fecha | Día | Pilar | Serie | Idea | Página de destino |
|---|---|---|---|---|---|---|
| 27 | 18-05-2027 | martes | Áreas de actuación | Valor (dirección financiera) | Todo beneficio necesita un responsable de negocio con nombre y un plan de realización. | `SEVEN-G/html/es/43_SEVEN-G_Realizacion_de_beneficios.html#plan-de-realizacion-de-beneficios` |
| 27 | 20-05-2027 | jueves | El mundo de la IA | Sector | Comercio minorista: casos de uso de IA consolidados, en adopción y emergentes. | `SEVEN-G/herramientas/T17_panel_consejo/galeria/index.html#es-retail` |
| 28 | 25-05-2027 | martes | Áreas de actuación | Valor (dirección financiera) | Tres perspectivas sin fusionar: valor económico, resultado operativo y exposición al riesgo. | `SEVEN-G/html/es/40_SEVEN-G_Reglas_de_medicion_del_valor.html#11-1-reglas` |
| 28 | 27-05-2027 | jueves | El mundo de la IA | Fundamentos e historia | El Reglamento Europeo de IA en cinco ideas para un consejero. Sin promesas de cumplimiento. | `https://eur-lex.europa.eu/eli/reg/2024/1689/oj/spa` |
| 29 | 01-06-2027 | martes | Mitos y errores de la dirección | Mitos | Mito: «necesitamos un director de IA». En general, no: valor, capacidad y control. | `SEVEN-G/html/es/54_SEVEN-G_Organizacion_de_la_compania_para_la_IA.html#9-5-hace-falta-un-director-de-ia-en-general-no` |
| 29 | 03-06-2027 | jueves | El mundo de la IA | Lo que ha pasado este mes | Lo que ha pasado en IA en mayo: tres o cuatro noticias con su lectura para el consejo. Solo fuentes primarias (anuncio de la compañía, regulador o estudio original). Se escribe la semana anterior. | `` |
| 30 | 08-06-2027 | martes | Áreas de actuación | Organización IA-first 1/4 | IA-first: IA por defecto, persona donde importa. Qué es y qué no es. | `SEVEN-G/html/es/54_SEVEN-G_Organizacion_de_la_compania_para_la_IA.html#9-1-que-significa-ser-ia-first` |
| 30 | 10-06-2027 | jueves | El mundo de la IA | Estudio | Stack Overflow, encuesta a desarrolladores 2025: qué piensan de la IA quienes la usan cada día. | `https://survey.stackoverflow.co/2025/ai` |
| 31 | 15-06-2027 | martes | Áreas de actuación | Organización IA-first 2/4 | Seis pruebas para saber si una compañía es IA-first. ¿Cuántas cumple hoy? | `SEVEN-G/html/es/54_SEVEN-G_Organizacion_de_la_compania_para_la_IA.html#9-2-seis-pruebas-para-saber-si-una-compania-lo-es` |
| 31 | 17-06-2027 | jueves | El mundo de la IA | Sector | Energía: hacia dónde se mueven los casos de uso de IA. | `SEVEN-G/herramientas/T17_panel_consejo/galeria/index.html#es-energia` |
| 32 | 22-06-2027 | martes | Áreas de actuación | Organización IA-first 3/4 | Por qué el organigrama por funciones frena la IA: el caso cruza direcciones y nadie es su dueño. | `SEVEN-G/html/es/54_SEVEN-G_Organizacion_de_la_compania_para_la_IA.html#9-3-por-que-el-organigrama-por-funciones-frena` |
| 32 | 24-06-2027 | jueves | El mundo de la IA | Fundamentos e historia | Sesgo: la IA aprende lo que le das. Por qué es un riesgo de negocio y no solo técnico. | `SEVEN-G/html/es/52_SEVEN-G_Manual_de_operacion_de_IA.html` |
| 33 | 29-06-2027 | martes | Áreas de actuación | Organización IA-first 4/4 | Cinco opciones de organización y una recomendación por fases. | `SEVEN-G/html/es/54_SEVEN-G_Organizacion_de_la_compania_para_la_IA.html#9-7-recomendacion-combinacion-por-fases` |
| 33 | 01-07-2027 | jueves | El mundo de la IA | Lo que ha pasado este mes | Lo que ha pasado en IA en junio: tres o cuatro noticias con su lectura para el consejo. Solo fuentes primarias (anuncio de la compañía, regulador o estudio original). Se escribe la semana anterior. | `` |
| 34 | 06-07-2027 | martes | Áreas de actuación | Casos de uso | Ocho fuentes de casos de uso y una sola puerta de entrada. | `SEVEN-G/html/es/areas/casos.html` |
| 34 | 08-07-2027 | jueves | El mundo de la IA | Futuro | IA física: sensores, robots y drones. Qué llega a la operación y qué sigue siendo demostración. Fuente por verificar al escribir. | `` |
| 35 | 13-07-2027 | martes | Mitos y errores de la dirección | Errores | Tres formas de IA que entran sin pasar por la puerta: la incluida en productos, la no autorizada y la prueba regalada. | `SEVEN-G/html/es/31_SEVEN-G_Politica_corporativa_y_uso_aceptable.html#la-ia-que-no-es-un-proyecto` |
| 35 | 15-07-2027 | jueves | El mundo de la IA | Sector | Sanidad: casos de uso de IA consolidados y emergentes, con sus fuentes. | `SEVEN-G/herramientas/T17_panel_consejo/galeria/index.html#es-sanidad` |
| 36 | 20-07-2027 | martes | Áreas de actuación | Talento técnico 1/3 | El talento técnico se va cuando no hay carrera técnica: una carrera paralela a la de gestión. | `SEVEN-G/html/es/50_SEVEN-G_Personas_y_organizacion.html#4-3-atraer-desarrollar-y-retener-el-talento-tecnico` |
| 36 | 22-07-2027 | jueves | El mundo de la IA | Fundamentos e historia | El marco de gestión de riesgos de IA del NIST en cuatro verbos: gobernar, mapear, medir y gestionar. | `https://www.nist.gov/publications/artificial-intelligence-risk-management-framework-ai-rmf-10` |
| 37 | 27-07-2027 | martes | Áreas de actuación | Personas | El valor de la IA depende de la adopción: lo que no se usa no devuelve nada. | `SEVEN-G/html/es/23_SEVEN-G_Adopcion_y_cambio.html#por-que-el-valor-depende-de-la-adopcion` |
| 37 | 29-07-2027 | jueves | El mundo de la IA | Sector | Logística: hacia dónde se mueven los casos de uso de IA. | `SEVEN-G/herramientas/T17_panel_consejo/galeria/index.html#es-logistica` |
| 38 | 03-08-2027 | martes | Áreas de actuación | Madurez | Madurez en tres lentes: la tecnología no puntúa, pero fija el gobierno mínimo. | `SEVEN-G/html/es/11_SEVEN-G_Modelo_de_madurez.html#7-6-lectura-en-tres-lentes` |
| 38 | 05-08-2027 | jueves | El mundo de la IA | Lo que ha pasado este mes | Lo que ha pasado en IA en julio: tres o cuatro noticias con su lectura para el consejo. Solo fuentes primarias (anuncio de la compañía, regulador o estudio original). Se escribe la semana anterior. | `` |
| 39 | 10-08-2027 | martes | Áreas de actuación | Transformación | Índice de transformación: ocho señales que el consejo puede pedir. | `SEVEN-G/html/es/12_SEVEN-G_Indice_de_transformacion.html#4-4-las-ocho-senales` |
| 39 | 12-08-2027 | jueves | El mundo de la IA | Fundamentos e historia | Lectura de verano: la historia de la IA en cinco momentos. Fechas y fuentes por verificar al escribir. | `` |

### Trimestre 4

| Sem. | Fecha | Día | Pilar | Serie | Idea | Página de destino |
|---|---|---|---|---|---|---|
| 40 | 17-08-2027 | martes | Áreas de actuación | Transformación | Optimizar, aumentar, transformar. Optimizar está bien; llamarlo transformación, no. | `SEVEN-G/html/es/10_SEVEN-G_Mapa_de_esferas_y_niveles_de_ambicion.html#los-tres-niveles-de-ambicion` |
| 40 | 19-08-2027 | jueves | El mundo de la IA | Sector | Turismo: casos de uso de IA consolidados y emergentes. | `SEVEN-G/herramientas/T17_panel_consejo/galeria/index.html#es-turismo` |
| 41 | 24-08-2027 | martes | Áreas de actuación | Estrategia | Un propósito para el consejo: aprobar una tesis de IA. | `SEVEN-G/html/es/13_SEVEN-G_Tesis_de_IA_ambicion_y_apetito_de_riesgo.html#tesis-de-ia` |
| 41 | 26-08-2027 | jueves | El mundo de la IA | Futuro | La factura de la IA crece con el éxito. Por qué el coste de uso es una decisión de dirección. | `SEVEN-G/html/es/42_SEVEN-G_Costes_de_IA.html` |
| 42 | 31-08-2027 | martes | Áreas de actuación | Riesgo | El apetito de riesgo en IA es una decisión del consejo, no un anexo técnico. | `SEVEN-G/html/es/13_SEVEN-G_Tesis_de_IA_ambicion_y_apetito_de_riesgo.html#apetito-de-riesgo` |
| 42 | 02-09-2027 | jueves | El mundo de la IA | Lo que ha pasado este mes | Lo que ha pasado en IA en agosto: tres o cuatro noticias con su lectura para el consejo. Solo fuentes primarias (anuncio de la compañía, regulador o estudio original). Se escribe la semana anterior. | `` |
| 43 | 07-09-2027 | martes | Áreas de actuación | Riesgo | Líneas rojas: ¿qué no hará nunca su compañía con IA? Escríbalo antes de que haga falta. | `SEVEN-G/html/es/13_SEVEN-G_Tesis_de_IA_ambicion_y_apetito_de_riesgo.html#lineas-rojas` |
| 43 | 09-09-2027 | jueves | El mundo de la IA | Estudio | Los principios de IA de la OCDE: qué piden a una compañía y por qué siguen siendo la referencia. | `https://legalinstruments.oecd.org/en/instruments/OECD-LEGAL-0449` |
| 44 | 14-09-2027 | martes | Áreas de actuación | Riesgo | El inventario es la primera obligación: lo que no está inventariado no está gobernado. | `SEVEN-G/html/es/32_SEVEN-G_Inventario_y_clasificacion_regulatoria.html#que-se-inventaria` |
| 44 | 16-09-2027 | jueves | El mundo de la IA | Sector | Farmacéutica: hacia dónde se mueven los casos de uso de IA. | `SEVEN-G/herramientas/T17_panel_consejo/galeria/index.html#es-farmaceutica` |
| 45 | 21-09-2027 | martes | Áreas de actuación | Seguridad y agentes | Un agente que actúa necesita un dueño humano con nombre y un interruptor de parada. | `SEVEN-G/html/es/35_SEVEN-G_Seguridad_de_IA_y_agentes.html#requisitos-esenciales-de-un-agente` |
| 45 | 23-09-2027 | jueves | El mundo de la IA | Fundamentos e historia | ISO/IEC 42001: qué es un sistema de gestión de IA y qué certifica (y qué no). | `https://www.iso.org/standard/42001` |
| 46 | 28-09-2027 | martes | Áreas de actuación | Seguridad | ¿Dependemos demasiado de un proveedor? Una estrategia de salida probada, no solo escrita. | `SEVEN-G/html/es/36_SEVEN-G_Terceros_y_proveedores_de_IA.html#dependencia-tecnologica-y-concentracion` |
| 46 | 30-09-2027 | jueves | El mundo de la IA | Futuro | IA abierta o cerrada: una decisión de dirección, no de tecnología. Fuentes por verificar al escribir. | `` |
| 47 | 05-10-2027 | martes | Áreas de actuación | Normas | Los estándares dicen qué debe existir; hace falta una capa que lo haga funcionar. SEVEN-G no certifica. | `SEVEN-G/html/es/34_SEVEN-G_Mapeo_regulatorio.html#9-1-crosswalk-de-cobertura-normas-y-regulacion-seven-g` |
| 47 | 07-10-2027 | jueves | El mundo de la IA | Lo que ha pasado este mes | Lo que ha pasado en IA en septiembre: tres o cuatro noticias con su lectura para el consejo. Solo fuentes primarias (anuncio de la compañía, regulador o estudio original). Se escribe la semana anterior. | `` |
| 48 | 12-10-2027 | martes | Áreas de actuación | Gobierno | Quien construye no se audita a sí mismo: las separaciones que no se negocian. | `SEVEN-G/html/es/30_SEVEN-G_Modelo_de_gobierno.html#incompatibilidades` |
| 48 | 14-10-2027 | jueves | El mundo de la IA | Sector | Pymes y despachos profesionales: casos de IA realistas para empresas sin equipo de sistemas. | `SEVEN-G/herramientas/T17_panel_consejo/galeria/index.html#es-pymes` |
| 49 | 19-10-2027 | martes | Áreas de actuación | Consejo | El informe de IA para el consejo cabe en una página. | `SEVEN-G/html/es/60_SEVEN-G_Paquete_para_el_consejo.html#4-2-resumen-de-una-pagina` |
| 49 | 21-10-2027 | jueves | El mundo de la IA | Fundamentos e historia | Supervisión humana de verdad o decorativa: cómo distinguirlas. | `SEVEN-G/html/es/35_SEVEN-G_Seguridad_de_IA_y_agentes.html` |
| 50 | 26-10-2027 | martes | Mitos y errores de la dirección | Mitos | Mito: «el gobierno de la IA es para grandes compañías». El tamaño no decide la exigencia. | `SEVEN-G/html/es/90_SEVEN-G_Guia_de_implantacion.html#elegir-el-alcance-de-implantacion` |
| 50 | 28-10-2027 | jueves | El mundo de la IA | Estudio | Foro Económico Mundial, «Global Lighthouse Network 2026»: qué hacen las fábricas que más avanzan con IA. | `https://reports.weforum.org/docs/WEF_Global_Lighthouse_Network_2026.pdf` |
| 51 | 02-11-2027 | martes | Áreas de actuación | Implantar | Catorce reglas que nunca se omiten. Lo demás es proporcional. | `SEVEN-G/html/es/01_SEVEN-G_Metodologia_fundacional.html#14-1-el-nucleo-de-seven-g` |
| 51 | 04-11-2027 | jueves | El mundo de la IA | Lo que ha pasado este mes | Lo que ha pasado en IA en octubre: tres o cuatro noticias con su lectura para el consejo. Solo fuentes primarias (anuncio de la compañía, regulador o estudio original). Se escribe la semana anterior. | `` |
| 52 | 09-11-2027 | martes | Idea central | Resumen del año | Diez ideas de un año sobre cómo gobernar, medir y escalar la IA. | `SEVEN-G/html/es/entrada/index.html#areas` |
| 52 | 11-11-2027 | jueves | El mundo de la IA | Futuro | Un año de IA: lo que ha cambiado y lo que no. Cierre de la línea y petición de ideas para el año siguiente. | `SEVEN-G/herramientas/comunidad/index.html` |

## 6. Textos completos ya escritos

Veinte publicaciones listas para revisar. Cada una tiene un gancho en la primera línea, una sola idea, una llamada a la acción y el enlace. Todas tienen entre 60 y 120 palabras. `{BASE}` es la base del sitio.

**Son borradores ajustados a la voz del autor** según las notas de la sección 1. Siguen en `estado: borrador` hasta que el autor los apruebe.

### 1. Semana 1, martes 17-11-2026 · Idea central

Destino: `SEVEN-G/html/es/entrada/index.html` · 242 palabras · texto

```text
El error más común con la IA: tratarla como una tecnología más.

Y, por tanto, dejarla en manos de tecnología.

La IA ya no va de tecnología. Va de negocio, estrategia, organización, riesgos y liderazgo. Es un activo estratégico, y sus decisiones son del consejo, del primer ejecutivo y de la dirección financiera.

Durante un año publicaré aquí dos veces por semana. Escribo para miembros de consejos de administración, ejecutivos (dirección general, finanzas, riesgos, transformación y negocio) y consultores que les acompañan.

Qué voy a publicar:
• Las preguntas que un consejo debe hacer sobre la IA.
• Cómo decidir dónde invertir y cuándo parar un caso.
• Cómo medir el valor real, no el prometido.
• Cómo gobernar el riesgo sin frenar a la compañía.

Todo sale de dos marcos abiertos y gratuitos que he creado:
→ SEVEN-G: cómo implantar, gobernar y medir la IA para saber si la compañía se transforma o solo se hace más eficiente.
→ SPHERES: dónde genera valor la IA y con qué ambición: optimizar, aumentar o transformar.

¿Por qué? Porque la adopción habitual de la IA falla en lo mismo: pilotos que no escalan, valor que nadie demuestra y decisiones que no llegan al consejo.

Y busco participación activa. Todo esto es discutible: en este campo estamos todos aprendiendo a la vez. Todo feedback es bienvenido. Servirá para mejorar SEVEN-G, SPHERES y SPAD (su marco para construir software con IA), y todo vuelve a la comunidad.

Se aceptan (y agradecen) comentarios!

{BASE}SEVEN-G/html/es/entrada/index.html
```

### 2. Semana 1, jueves 19-11-2026 · El mundo de la IA

Destino: `https://www.mckinsey.com/capabilities/people-and-organization/our-insights/the-agentic-organization-contours-of-the-next-paradigm-for-the-ai-era` · 164 palabras · texto

```text
McKinsey publicó en septiembre de 2025 un artículo que conviene leer en un consejo: «The agentic organization».

Su tesis: la IA abre el mayor cambio de paradigma organizativo desde las revoluciones industrial y digital.

Lo explican con cuatro eras: artesanal, industrial, digital e IA. En cada una cambian a la vez el modelo de negocio, la organización, el gobierno, las personas y la tecnología.

En la era de la IA, según McKinsey:
• equipos pequeños, dueños de un resultado de punta a punta, que supervisan agentes;
• un gobierno integrado en el propio proceso, en tiempo real;
• y la responsabilidad final, siempre en una persona.

Lo que más me gusta de su tabla es la última fila, la de los ejemplos. En la era de la IA, el liderazgo todavía está abierto.

Qué significa para tu consejo: si el cambio es organizativo, no se resuelve comprando tecnología. Se resuelve decidiendo cómo se organiza la compañía.

¿Cuál de esos cinco elementos está cambiando ya en la tuya?

https://www.mckinsey.com/capabilities/people-and-organization/our-insights/the-agentic-organization-contours-of-the-next-paradigm-for-the-ai-era
```

### 3. Semana 2, martes 24-11-2026 · Historia

Destino: `SEVEN-G/html/es/entrada/index.html#historia` · 84 palabras · texto

```text
Todo empieza con entusiasmo. (1 de 8)

Un equipo prueba un asistente. Otro automatiza un informe. Un proveedor regala una prueba de concepto.

En pocos meses hay una docena de iniciativas de IA. Y nadie las gobierna.

El entusiasmo no es el problema. El problema es que la IA se trata como una tecnología más, y nadie mira el conjunto.

Durante ocho martes voy a contar esta historia paso a paso: del entusiasmo a la transformación gobernada.

Si prefieres leerla entera hoy, está aquí:

{BASE}SEVEN-G/html/es/entrada/index.html#historia
```

### 4. Semana 2, jueves 26-11-2026 · El mundo de la IA

Destino: `SEVEN-G/html/es/35_SEVEN-G_Seguridad_de_IA_y_agentes.html#niveles-de-autonomia` · 115 palabras · lista

```text
Todo el mundo habla de agentes de IA. Pocos explican qué son.

La respuesta corta es: un agente no solo contesta. Actúa.

• Un asistente te propone un correo. Tú lo envías.
• Un agente lo envía. Y quizá también actualiza el pedido y avisa al almacén.

Esa diferencia lo cambia todo para un consejo. Cuando la IA actúa, la pregunta deja de ser «¿acierta?». Pasa a ser «¿quién responde si se equivoca?».

Antes de aprobar un agente, conviene saber tres cosas:
1. Qué puede hacer sin que una persona lo valide.
2. Quién es su dueño, con nombre.
3. Cómo se para.

Consejo práctico: pide que te enseñen el interruptor de parada antes que la demostración.

{BASE}SEVEN-G/html/es/35_SEVEN-G_Seguridad_de_IA_y_agentes.html#niveles-de-autonomia
```

### 5. Semana 3, martes 01-12-2026 · Historia

Destino: `SEVEN-G/html/es/entrada/index.html#preguntas` · 81 palabras · pregunta

```text
El consejo empieza a preguntar. (2 de 8)

Tarde o temprano, un consejero lo dice: «¿Esto produce algo?»

Después llegan más preguntas. ¿Avanzamos? ¿Son rentables los casos de uso? ¿Está el riesgo controlado?

Y nadie tiene una respuesta única. Cada respuesta es una hoja de cálculo y una opinión.

El consejo no necesita entender los modelos. Necesita la misma disciplina que exige a cualquier inversión: cartera, valor validado y riesgo.

¿Qué pregunta sobre IA hizo tu consejo en la última sesión?

{BASE}SEVEN-G/html/es/entrada/index.html#preguntas
```

### 7. Semana 4, martes 08-12-2026 · Historia

Destino: `SEVEN-G/herramientas/T15_diagnostico_madurez/madurez.html` · 97 palabras · texto

```text
Primero, saber qué tienes. (3 de 8)

El primer trabajo no es comprar nada. Es un inventario: qué IA hay en uso, quién responde de ella y a qué afecta.

Con el inventario llega una primera lectura de madurez.

Y cuidado: la madurez no se mide por la tecnología que tienes. Una compañía con modelos sencillos y bien gobernados es más madura que otra con IA generativa sin control.

Tener más tecnología que gobierno no es una ventaja. Es un riesgo sin dueño.

El diagnóstico es gratuito, y los datos que introduces se quedan en tu navegador.

{BASE}SEVEN-G/herramientas/T15_diagnostico_madurez/madurez.html
```

### 8. Semana 4, jueves 10-12-2026 · El mundo de la IA

Destino: `SEVEN-G/html/es/11_SEVEN-G_Modelo_de_madurez.html#7-6-lectura-en-tres-lentes` · 123 palabras · lista

```text
La IA no es nueva. Lo nuevo es lo que hace.

En tres etapas, muy simplificadas:

1. Reglas. Una persona escribía, una a una, las reglas que seguía el sistema. Funcionaba en problemas cerrados.
2. Aprendizaje. El sistema aprende de los datos a predecir: fraude, demanda, abandono de clientes. Muchas compañías llevan años aquí sin llamarlo IA.
3. Generación y acción. El sistema escribe, resume, conversa y, cada vez más, actúa.

Cada etapa pidió algo distinto a la dirección. Las reglas pedían expertos. El aprendizaje pedía datos. La generación y la acción piden gobierno: quién decide, quién supervisa y quién responde.

Conclusión: la tecnología avanza por etapas. La organización tiene que avanzar con ella.

¿En qué etapa está tu compañía? ¿Y su gobierno?

{BASE}SEVEN-G/html/es/11_SEVEN-G_Modelo_de_madurez.html#7-6-lectura-en-tres-lentes
```

### 9. Semana 5, martes 15-12-2026 · Historia

Destino: `SEVEN-G/herramientas/T17_panel_consejo/galeria/index.html` · 98 palabras · texto

```text
Mirar fuera y decidir cuánto quieres. (4 de 8)

«¿Qué casos de uso nos convienen?» tiene una mala respuesta: copiar la lista de un proveedor.

Una respuesta mejor empieza por tu sector: qué está ya consolidado, qué se está adoptando y qué llega después.

Con el inventario y esa referencia, el consejo toma su primera decisión: cuánta ambición quiere y cuánto riesgo acepta.

La galería de SEVEN-G recoge varios sectores, con sus fuentes, y el panel del consejo de cuatro compañías ficticias.

No es una recomendación de compra. Es un punto de partida para una conversación de dirección.

{BASE}SEVEN-G/herramientas/T17_panel_consejo/galeria/index.html
```

### 10. Semana 5, jueves 17-12-2026 · El mundo de la IA

Destino: `https://www.weforum.org/publications/the-future-of-jobs-report-2025/` · 136 palabras · lista

```text
El Foro Económico Mundial pregunta a los empleadores cómo va a cambiar el trabajo. Su informe «Future of Jobs Report 2025» deja tres datos que un consejo debería tener delante:

• El 63 % de los empleadores dice que la falta de competencias es la mayor barrera para transformar su negocio entre 2025 y 2030.
• «IA y datos masivos» es la competencia que más crece.
• El 85 % prevé dar prioridad a la formación de su plantilla.

Lo que leo yo: la barrera no es la tecnología. Es la gente que sabe usarla. Y, sobre todo, la gente que sabe decidir con ella.

Qué significa para tu consejo: un plan de IA sin plan de formación es medio plan. Y la formación empieza por el propio consejo.

¿Cuántas horas de formación en IA ha tenido tu consejo este año?

https://www.weforum.org/publications/the-future-of-jobs-report-2025/
```

### 11. Semana 6, martes 22-12-2026 · Historia

Destino: `SEVEN-G/html/es/entrada/index.html#embudo` · 82 palabras · texto + imagen (embudo)

```text
Poner la cartera en movimiento. (5 de 8)

Aquí empieza el método.

Un listado de proyectos esconde lo importante. Un embudo lo enseña.

SEVEN-G trata cada iniciativa de IA como una oportunidad en un CRM: se registra y avanza por etapas hasta producción.

El embudo muestra la velocidad de la transformación:

• qué avanza, y cuántos días lleva en su etapa
• qué se atasca
• qué sale, y por qué

Tu dirección comercial ya gestiona así las ventas. La IA merece la misma disciplina.

{BASE}SEVEN-G/html/es/entrada/index.html#embudo
```

### 12. Semana 6, jueves 24-12-2026 · El mundo de la IA

Destino: `SEVEN-G/html/es/02_SEVEN-G_Glosario_y_convenciones.html` · 92 palabras · texto breve

```text
Una lectura corta para estos días.

Tres palabras que se usan como si fueran lo mismo, y no lo son:

→ IA predictiva: aprende de datos pasados para estimar lo que va a pasar. Fraude, demanda, abandono.
→ IA generativa: crea contenido nuevo. Texto, imagen, código, resúmenes.
→ IA agéntica: encadena pasos y actúa en otros sistemas, con más o menos supervisión.

Cada una tiene un riesgo distinto y se gobierna de forma distinta. Mezclarlas en la misma conversación del consejo es la forma más rápida de no decidir nada.

Felices fiestas, y Feliz IA! :-)

{BASE}SEVEN-G/html/es/02_SEVEN-G_Glosario_y_convenciones.html
```

### 13. Semana 7, martes 29-12-2026 · Historia

Destino: `SEVEN-G/herramientas/T17_panel_consejo/ejemplo/salida/t01_Dashboard_Casos_Uso_IA_v8.html` · 101 palabras · texto + imagen (panel)

```text
Cifras que el consejo puede creerse. (6 de 8)

El mismo registro que dibuja el embudo alimenta el panel del consejo.

El panel muestra, caso a caso, el coste completo frente al valor. Y dice qué parte de ese valor está validada.

Dos reglas lo hacen creíble:

• «sin dato» nunca es cero
• lo estimado no se presenta como validado

Con esas cifras se habla de presupuesto y de aspiraciones con seriedad. Un consejo que ve cada cifra con su estado pregunta mejor, y decide mejor dónde poner o quitar el dinero.

Míralo en un panel de ejemplo, con una compañía ficticia:

{BASE}SEVEN-G/herramientas/T17_panel_consejo/ejemplo/salida/t01_Dashboard_Casos_Uso_IA_v8.html
```

### 14. Semana 7, jueves 31-12-2026 · El mundo de la IA

Destino: `https://eur-lex.europa.eu/eli/reg/2024/1689/oj/spa` · 90 palabras · lista

```text
Tres cosas que vigilaría en 2027 desde un consejo:

1. Agentes en procesos reales. Pasarán de las demostraciones a la operación. La pregunta será quién los supervisa.
2. El coste de la IA. El gasto de uso crece con el éxito. Lo que no se mide se descontrola.
3. La regulación en aplicación. El Reglamento Europeo de IA entra en aplicación por fases. Ya no es un tema de futuro.

Ninguna de las tres es una cuestión técnica. Las tres son decisiones de dirección.

¿Qué añadirías tú a la lista?

https://eur-lex.europa.eu/eli/reg/2024/1689/oj/spa
```

### 15. Semana 8, martes 05-01-2027 · Historia

Destino: `SEVEN-G/html/es/preguntas/parar.html` · 105 palabras · lista

```text
Gobernar sin frenar. (7 de 8)

El gobierno de la IA tiene mala fama. Se asocia a comités y a retrasos.

Bien hecho es justo lo contrario: es lo que permite escalar con confianza.

En SEVEN-G cada iniciativa cruza una puerta de decisión antes de cada gran gasto. La compañía sabe qué valor busca, lo mide, y decide qué se hace y qué no.

Tres reglas sencillas:

• quien construye no se audita a sí mismo
• el riesgo se mide con la misma escala en toda la compañía
• ninguna puerta se cruza sin evidencia

Y parar a tiempo, con motivo, es un resultado. No un fracaso.

{BASE}SEVEN-G/html/es/preguntas/parar.html
```

### 17. Semana 9, martes 12-01-2027 · Historia

Destino: `SEVEN-G/html/es/preguntas/mas.html` · 84 palabras · pregunta

```text
Con la casa en orden, ir a más. (8 de 8)

Con la cartera gobernada, el riesgo acotado y el consumo de IA bajo control, llega la pregunta grande: ¿qué más puede hacer la compañía?

Optimizar está bien. El error es llamar transformación a una automatización.

Ahora sí: la ambición de transformación es real, porque hay un gobierno serio debajo. A este paso no se llega sin él.

¿Qué evidencia tienes de que tu compañía hace algo distinto, y no lo mismo más barato?

{BASE}SEVEN-G/html/es/preguntas/mas.html
```

### 18. Semana 9, jueves 14-01-2027 · El mundo de la IA

Destino: `https://www.oecd.org/content/dam/oecd/en/publications/reports/2023/07/oecd-employment-outlook-2023_904bcef3/08785bba-en.pdf` · 110 palabras · lista

```text
La OCDE preguntó a más de 2.000 empleadores y 5.300 trabajadores de industria y finanzas, en siete países, cómo les está cambiando la IA.

Su informe «Employment Outlook 2023» deja tres ideas:

• Dos de cada cinco empleadores dicen que la falta de competencias de IA les frena para usarla.
• La IA hace más importantes las competencias especializadas y, sobre todo, las humanas.
• Los resultados son mejores donde los trabajadores han recibido formación para trabajar con la IA.

El estudio es de 2023, antes de la ola de agentes. Pero su mensaje ha envejecido bien.

Qué significa para tu consejo: invertir en IA e invertir en personas son la misma decisión.

https://www.oecd.org/content/dam/oecd/en/publications/reports/2023/07/oecd-employment-outlook-2023_904bcef3/08785bba-en.pdf
```

### 19. Semana 10, martes 19-01-2027 · Historia

Destino: `SEVEN-G/html/es/entrada/index.html#partida` · 102 palabras · pregunta

```text
El camino es el mismo. El punto de partida, no.

Durante ocho martes he contado una historia: del entusiasmo por la IA a la transformación gobernada.

Tu compañía puede estar en el paso 1 o en el 6. Los pasos para poner orden son los mismos, y van en el mismo orden.

Y no hace falta creerse un marco. Se puede comprobar: en el sitio hay un ejemplo completo, con una compañía ficticia.

Conclusión: la IA deja de ser una colección de pilotos. Pasa a ser una cartera que la dirección gobierna, mide y escala con evidencia.

¿Por dónde empieza la tuya?

{BASE}SEVEN-G/html/es/entrada/index.html#partida
```

### 20. Semana 10, jueves 21-01-2027 · El mundo de la IA

Destino: `SEVEN-G/herramientas/T17_panel_consejo/galeria/index.html#es-banca` · 123 palabras · lista

```text
Banca es el sector que más IA anuncia. Y no el que más la mide.

Según el «Evident AI Outcomes Report 2025», 47 de los 50 mayores bancos anunciaron 173 nuevos casos de uso de IA en doce meses. Solo el 30 % publica métricas de impacto.

Tres tendencias que se ven en el sector:
• El aprendizaje automático ya es rutina: fraude, riesgo de crédito, prevención del blanqueo.
• Los agentes entran primero por cumplimiento y operaciones, con supervisión humana.
• El supervisor mira el gobierno: política de IA, explicabilidad y dependencia de terceros.

Qué significa para tu consejo, sea o no de banca: anunciar casos es fácil. Demostrar su valor es lo que separa a los que avanzan.

Más casos por sector, con sus fuentes:

{BASE}SEVEN-G/herramientas/T17_panel_consejo/galeria/index.html#es-banca
```

### 23. Semana 12, martes 02-02-2027 · Tres preguntas estratégicas

Destino: `SEVEN-G/herramientas/T17_panel_consejo/ejemplo/salida/t01_Dashboard_Casos_Uso_IA_v8.html` · 104 palabras · texto + imagen (mapa de impacto)

```text
¿Tu inversión en IA sigue a tu estrategia, o a quien pidió presupuesto primero?

Para saberlo basta un mapa.

• En las filas, las áreas donde la IA crea valor: cliente, producto, personas, operaciones, datos, conocimiento y decisión.
• En las columnas, la ambición: optimizar, aumentar o transformar.
• En cada celda, la inversión y el neto anual.

El mapa enseña dos cosas: dónde se concentra el dinero, y dónde la compañía dijo que iba a jugar y no juega.

Conclusión: decidir dónde invertir es una decisión de dirección. No se delega en una lista de proyectos.

Míralo en un panel de ejemplo, con una compañía ficticia:

{BASE}SEVEN-G/herramientas/T17_panel_consejo/ejemplo/salida/t01_Dashboard_Casos_Uso_IA_v8.html
```

### 25. Semana 13, martes 09-02-2027 · Tres preguntas estratégicas

Destino: `SEVEN-G/html/es/60_SEVEN-G_Paquete_para_el_consejo.html#10-4-que-frena-el-escalado-lectura-ejecutiva-y-donde-actuar-primero` · 94 palabras · texto

```text
«Tenemos muchos pilotos y ninguno escala.»

Si esta frase te suena, la causa casi nunca es técnica.

SEVEN-G ordena seis frenos del escalado:

1. El valor no está demostrado.
2. Los casos no avanzan.
3. El riesgo y el cumplimiento están sin cerrar.
4. Las personas no lo adoptan.
5. Los datos y la tecnología no están listos.
6. Falta dirección y gobierno.

El trabajo de la dirección es decidir por cuál se empieza, quién actúa y qué valor hay detrás de cada uno.

Una lista de problemas sin orden no es un plan.

{BASE}SEVEN-G/html/es/60_SEVEN-G_Paquete_para_el_consejo.html#10-4-que-frena-el-escalado-lectura-ejecutiva-y-donde-actuar-primero
```

### 27. Semana 14, martes 16-02-2027 · Tres preguntas estratégicas

Destino: `SEVEN-G/html/es/entrada/index.html#panel` · 98 palabras · texto + imagen (panel)

```text
Las horas liberadas no son ahorro.

Un asistente puede ahorrar tiempo a cada persona. Pero la cuenta de resultados no cambia por eso. Cambia cuando esa capacidad se convierte en algo: menos coste, más ingresos o trabajo reasignado.

Por eso cada cifra de valor debe llevar su estado: estimada, declarada o validada por control de gestión.

Solo lo validado suma.

Un porcentaje validado bajo y honesto es mejor que uno alto sin respaldo.

¿Qué debe preguntar un consejo a su dirección financiera?: ¿qué parte del valor de la IA ha comprobado alguien ajeno al equipo que lo produce?

{BASE}SEVEN-G/html/es/entrada/index.html#panel
```

### 43. Semana 22, martes 13-04-2027 · Mitos y errores de la dirección

Destino: `SEVEN-G/herramientas/T23_recorrido_implantacion/recorrido.html` · 80 palabras · lista

```text
Mito: «Tenemos muchos pilotos, así que vamos bien.»

Muchos pilotos y casi nada en producción es un punto de partida. No es un avance.

Se reconoce por tres síntomas:

• nadie sabe cuántos pilotos hay
• ninguno tiene criterio de parada
• todos piden «un poco más de tiempo»

La salida no es lanzar más pilotos. Es decidir, uno por uno: escalar o parar.

SEVEN-G describe seis puntos de partida y ordena los primeros pasos de cada uno.

¿En cuál está tu compañía?

{BASE}SEVEN-G/herramientas/T23_recorrido_implantacion/recorrido.html
```

### 57. Semana 29, martes 01-06-2027 · Mitos y errores de la dirección

Destino: `SEVEN-G/html/es/54_SEVEN-G_Organizacion_de_la_compania_para_la_IA.html#9-5-hace-falta-un-director-de-ia-en-general-no` · 83 palabras · texto

```text
Mito: «Necesitamos un director de IA.»

La respuesta corta es: en general, no.

La IA cruza toda la compañía. Una dirección vertical para algo horizontal crea un silo más: el director de IA acaba siendo dueño de los casos de uso, y los procesos siguen sin dueño.

Lo que sí hace falta son tres responsabilidades claras: valor, capacidad y control.

Y ante el consejo responde el primer ejecutivo.

Es una propuesta razonada, no una regla. Lee los argumentos y las cautelas, y decide:

{BASE}SEVEN-G/html/es/54_SEVEN-G_Organizacion_de_la_compania_para_la_IA.html#9-5-hace-falta-un-director-de-ia-en-general-no
```

### 81. Semana 41, martes 24-08-2027 · Áreas de actuación

Destino: `SEVEN-G/html/es/13_SEVEN-G_Tesis_de_IA_ambicion_y_apetito_de_riesgo.html#tesis-de-ia` · 82 palabras · pregunta

```text
Una decisión que tu consejo debería tener por escrito: una tesis de IA.

Una tesis de IA cabe en pocas páginas. Dice dónde quiere competir la compañía con IA, con qué ambición en cada área, cuánto riesgo acepta y qué no hará nunca.

Sin tesis, cada iniciativa se juzga sola. Con tesis, se juzga contra una decisión del consejo.

Para aprobarla no hace falta saber de modelos. Hace falta saber de estrategia y de riesgo.

¿Tiene tu compañía esta decisión por escrito?

{BASE}SEVEN-G/html/es/13_SEVEN-G_Tesis_de_IA_ambicion_y_apetito_de_riesgo.html#tesis-de-ia
```

Para el resto de las semanas, la línea de cada publicación está en la columna «Idea» del calendario (sección 5). Los textos completos se escriben por lotes de un mes, con el estilo ya ajustado.

## 7. Consejos prácticos

### 7.1 La primera línea

- LinkedIn corta el texto tras las primeras líneas y muestra «ver más». La primera línea decide si alguien sigue.
- Use una de estas cuatro formas: una pregunta incómoda, un mito entre comillas, una afirmación que contradice lo habitual o una regla corta.
- No empiece con «Hoy quiero hablar de…» ni con el nombre del marco.
- Una línea, sin enlace y sin etiquetas.

### 7.2 El enlace: en el texto o en el primer comentario

- Se dice a menudo que una publicación con enlace externo tiene menos alcance. LinkedIn no publica una regla oficial sobre esto. No lo dé por cierto.
- **Recomendación: enlace en el texto, al final.** Motivos: su objetivo es llevar lectores al sitio; el programador de LinkedIn no programa comentarios; y un enlace en un comentario se pierde cuando hay varios comentarios.
- Compruébelo: en las semanas 9 a 12 ponga el enlace en el primer comentario los jueves. Compare impresiones y visitas al sitio con las cuatro semanas anteriores. Quédese con lo que traiga más visitas, no más impresiones.

### 7.3 Imagen o carrusel

- Texto solo: válido para preguntas y mitos.
- Imagen: úsela cuando la publicación habla de algo que se ve. Hay capturas listas en el repositorio:
  - embudo de la cartera: `SEVEN-G/build/entrada/SEVEN-G_embudo.png`;
  - panel del consejo: `SEVEN-G/build/entrada/SEVEN-G_panel.png`;
  - mapa de impacto: `SEVEN-G/build/img_curso/mapa-impacto-ejemplo.png`;
  - registro de iniciativas: `SEVEN-G/build/img_curso/registro-ejemplo.png`.
- Toda captura lleva en el texto «compañía ficticia» o «datos ilustrativos».
- Carrusel (un PDF que se sube como documento): tres al año, para cerrar series (semanas 11, 26 y 52). Una idea por lámina, letra grande, última lámina con la dirección del sitio.
- La imagen del camino de la historia en pasos no está todavía en el repositorio. Cuando exista, sirve para la semana 11.
- Añada siempre el texto alternativo de la imagen.

### 7.4 Respuesta a los comentarios

- Responda en las primeras horas. Reserve 15 minutos después de cada publicación.
- Responda con una pregunta o con un dato del marco, no con «gracias».
- Si alguien discrepa, dé la razón en lo que la tenga y explique su criterio. La discrepancia educada da visibilidad.
- No pida datos de contacto. No envíe mensajes privados para ofrecer servicios. Si alguien pregunta por sus servicios, responda en privado a su pregunta.
- No hable de clientes ni de casos reconocibles, tampoco en los comentarios.
- No afirme que SEVEN-G certifica ni que garantiza el cumplimiento de una norma. Si alguien lo pregunta, la respuesta es: «No. Es un método de trabajo; la certificación la da una entidad acreditada.»

### 7.5 Reutilización

- Cada trimestre, un carrusel con las ideas más leídas.
- Las tres publicaciones con más visitas al sitio de cada trimestre se adaptan al inglés (sección 3).
- Una pregunta que reciba muchos comentarios se convierte en una publicación nueva con las respuestas, sin nombres.
- Las preguntas repetidas de los lectores son información para el sitio: lo que no se entiende se corrige en el documento.
- Pasados seis meses, una publicación buena se puede volver a publicar con otra primera línea.

### 7.6 Perfil

Antes de la semana 1, revise tres cosas del perfil:

1. Titular: que diga a quién ayuda y en qué. Ejemplo: «Gobierno y valor de la IA para consejos y direcciones · Autor de SEVEN-G». El titular leído el 13-11-2026 está en inglés, describe un cargo y no nombra SEVEN-G.
2. Sección «Acerca de»: la leída el 13-11-2026 está en inglés y habla de la trayectoria comercial del autor. No dice nada de IA, de consejos ni de SEVEN-G. Quien llegue al perfil desde una publicación no encontrará el mismo mensaje. Conviene reescribirla en español con la idea central (sección 2.1).
3. Sección «Destacado»: la entrada de SEVEN-G y el panel de ejemplo.
4. Active el «modo creador» si no lo tiene: da acceso a las estadísticas de publicaciones.

## 8. Automatización

### 8.1 Opciones reales

| Opción | Qué hace | Ventajas | Límites |
|---|---|---|---|
| **Programador propio de LinkedIn** (icono del reloj al escribir) | Programa una publicación para una fecha y hora | Gratuito. Sin dar acceso a terceros. Admite imagen y documento | Se programa una a una. Plazo máximo de unos meses. No programa el primer comentario |
| **Herramienta de terceros** (por ejemplo Buffer, Hootsuite o Metricool) | Programa en lote, a veces desde un CSV, con calendario y estadísticas | Carga un mes en minutos. Algunas programan el primer comentario | Tiene coste. Hay que darle permiso para publicar en su nombre. Revise sus condiciones |
| **API de LinkedIn** (Posts API) | Un programa propio publica en su nombre | Control total. Se puede conectar con el JSON del calendario | Ver 8.2 |

### 8.2 La API de LinkedIn: permisos y límites

Datos que debe comprobar en la documentación oficial (Microsoft Learn, «LinkedIn API») antes de construir nada; pueden haber cambiado:

- Hace falta crear una aplicación en el portal de desarrolladores de LinkedIn. La aplicación debe estar asociada a una página de empresa.
- El producto «Share on LinkedIn» da el permiso `w_member_social`: publicar en nombre del miembro que lo autoriza. Es de acceso abierto.
- La autorización es OAuth 2.0 con consentimiento del miembro. El testigo de acceso caduca a los 60 días. La renovación automática está reservada a socios aprobados; sin ella, el autor debe volver a autorizar cada dos meses.
- La API no programa. Publica en el momento de la llamada. La programación la hace el programa propio (una tarea con horario).
- Leer las estadísticas de las publicaciones de un perfil personal exige permisos restringidos, que LinkedIn concede a socios. No cuente con ello.
- Hay límites diarios de llamadas por miembro y por aplicación. Dos publicaciones por semana quedan muy por debajo.
- El testigo es un secreto. No se guarda nunca en el repositorio.

Valoración: para dos publicaciones por semana, la API da más trabajo de mantenimiento que el que ahorra. Además añade un riesgo: que un fallo publique algo no aprobado.

### 8.3 Propuesta concreta

**Fase 1 (semanas 1 a 12): programador propio de LinkedIn.**

1. Una vez al mes, Claude prepara los textos completos de las ocho o nueve publicaciones del mes siguiente en `linkedin_calendario.json`, con `estado: borrador`.
2. El autor los lee, los corrige y cambia `estado` a `aprobado`. Lo que no esté aprobado no se programa.
3. El autor programa las aprobadas en LinkedIn (unos 30 minutos al mes) y cambia `estado` a `programado`.
4. Después de publicar, anota las estadísticas a los siete días.

**Fase 2 (opcional, desde la semana 13): herramienta de terceros**, solo si la carga manual molesta o si la prueba de la sección 7.2 da ventaja al enlace en el primer comentario.

**No se recomienda la API** en el primer año.

Lo que Claude puede hacer en cada sesión, sin publicar nada: escribir los textos del mes, comprobar que cada enlace existe en el sitio, preparar las imágenes y los carruseles, y analizar las estadísticas que el autor exporte.

## 9. Reglas que cumple cada publicación

Lista de comprobación antes de aprobar un texto:

- [ ] No nombra a ningún cliente ni da un dato reconocible (D17, D57).
- [ ] No da cifras de mercado. Si da una, tiene fuente oficial comprobada y enlace (D41, D114).
- [ ] No promete certificación ni cumplimiento normativo (D25).
- [ ] No presenta SEVEN-G como alternativa a ISO/IEC 42001 (D151) ni como marca registrada (D157).
- [ ] No pide datos de contacto ni ofrece servicios.
- [ ] Martes: trata de SEVEN-G (gobernar, medir y aplicar la IA en la empresa). Jueves: trata del mundo de la IA y termina con «Qué significa para tu consejo:». Ninguna trata de SPAD ni de equipos de desarrollo.
- [ ] Una noticia o un estudio se cita por su fuente primaria (anuncio de la compañía, regulador o estudio original), nunca por el medio que la cuenta. No se suben gráficos ni tablas de terceros: se cuentan con palabras propias y se enlaza la fuente.
- [ ] Tiene una sola idea, entre 60 y 170 palabras (la publicación 1, hasta 250), y un enlace a una página concreta que existe.
- [ ] Si lleva captura, dice «compañía ficticia» o «datos ilustrativos».

## 10. Pendiente del autor

1. Leer los textos en `editor_publicaciones.html` y aprobarlos uno a uno. La publicación 1 sale el martes 17-11-2026 y la 2 (McKinsey) el jueves 19-11-2026.
2. Programar las aprobadas en LinkedIn. El enlace de cada una es `base_url` + `destino`, con «?» + `utm` antes del ancla.
3. Decidir si quiere etiquetas al final de cada publicación (sección 1.1: antes las usaba, ahora no).
4. Revisar el titular y la sección «Acerca de» del perfil (sección 7.6).

Aprobado el 13-11-2026 (D172): idioma, días y horas, fecha de inicio y parámetros `utm`. Aprobado el 14-11-2026 (D183): martes SEVEN-G y jueves «El mundo de la IA», y el editor de publicaciones.

Pendiente de Claude: «Lo que ha pasado este mes» de noviembre, para el jueves 03-12-2026, escrito la semana del 23-11-2026 con fuentes primarias; y cada mes, los textos del mes siguiente.

Hecho el 13-11-2026: lectura del perfil y notas de estilo; serie de la historia en ocho pasos (D169); enlaces de las seis preguntas a su página propia.
