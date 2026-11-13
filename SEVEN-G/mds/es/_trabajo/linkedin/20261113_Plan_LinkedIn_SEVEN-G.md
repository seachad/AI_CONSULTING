# Plan de publicaciones en LinkedIn · SEVEN-G y marca personal del autor

Documento de trabajo. No se publica. Fecha: 13-11-2026. Estado: **propuesta, pendiente de aprobación del autor**.

Ficheros de esta carpeta:

- `linkedin_calendario.json`: fuente del calendario (104 publicaciones, con el texto completo de las 20 primeras).
- `linkedin_calendario.csv`: la misma tabla para hoja de cálculo (separador `;`).

**Regla principal: nada se publica sin aprobación expresa del autor.** Cada publicación tiene un campo `estado`. Solo el autor lo cambia de `borrador` a `aprobado`.

## 0. Avisos antes de leer

1. **No se pudo leer el perfil de LinkedIn del autor.** LinkedIn bloquea el acceso automático (respuesta 999). No se ha inventado su estilo. La sección 1 dice qué hace falta.
2. **La decisión D169 y el fichero `SEVEN-G/build/preguntas.json` no están en el repositorio** (rama `main`, 13-11-2026). La entrada publicada tiene una historia de **nueve** capítulos (D139), no de ocho. Este plan usa los nueve capítulos publicados. Si la historia pasa a ocho pasos, se quita una publicación de la serie (ver sección 2.3).
3. Los textos usan «usted», como el sitio. No llevan emojis ni etiquetas. Es una elección neutra hasta conocer el estilo del autor.
4. Ninguna publicación cita cifras de mercado. Las únicas cifras son recuentos del propio marco (seis preguntas, ocho señales, seis frenos).

## 1. Notas de estilo del autor

### 1.1 Qué falta

Para escribir con la voz del autor hacen falta sus publicaciones. Hay dos formas de darlas:

- Pegar en la sesión de 8 a 10 publicaciones suyas (texto completo, con sus emojis y etiquetas).
- Exportar su actividad: LinkedIn → Configuración → Privacidad de datos → «Obtener una copia de tus datos» → «Publicaciones». El fichero `Shares.csv` contiene los textos.

Con ese material se anotará: longitud media, primera línea, uso de preguntas, uso de «tú» o «usted», emojis, etiquetas, cierres y palabras frecuentes. Después se ajustan los 20 textos de la sección 6.

### 1.2 Lo que sí se conoce: cómo escribe el autor en el sitio

Estas notas salen de textos firmados por el autor en el repositorio. No son notas de su estilo en LinkedIn.

| Rasgo | Ejemplo en el sitio |
|---|---|
| Habla en primera persona cuando explica sus motivos | «He visto en primera persona la necesidad que tienen muchas empresas de poner orden» (documento 04, sección 6.1) |
| Trata al lector de «usted» | «¿Su compañía avanza con la IA, o solo la prueba?» (entrada) |
| Abre con una pregunta directa | «¿Me transformo o solo soy más eficiente?» |
| Contrapone dos ideas en una frase | «con cifras, no con entusiasmo»; «parar […] es un resultado, no un fracaso» |
| Usa comparaciones de negocio | «como un embudo de ventas»; «como registrar una oportunidad en un CRM» |
| Frases cortas de cierre, con valor de regla | «"Sin dato" nunca es cero.»; «Quien construye no audita.» |
| No promete; dice los límites | «No es una alternativa a ISO/IEC 42001 ni una certificación» |
| No busca contactos | «desde aquí nunca se envía un correo […] buscando captar clientes» |

Los 20 textos de la sección 6 siguen estos rasgos.

## 2. Estrategia

### 2.1 Posicionamiento

Una frase que debe poder repetir cualquier lector después de tres meses:

> «Fernando García Varela es quien explica cómo un consejo y una dirección gobiernan, miden y escalan la IA.»

Idea central, que se repite al menos una vez al mes con palabras distintas:

> La IA no es una tecnología ni un producto más. Es un activo estratégico. Sus decisiones son del consejo, del primer ejecutivo y de la dirección financiera, no solo de tecnología.

Qué no se trata: AECF_MCP, SPAD, modelos de trabajo de equipos de desarrollo, comparativas de modelos, noticias de producto.

### 2.2 Pilares

| Pilar | Qué aporta | Publicaciones | Fuente en el sitio |
|---|---|---|---|
| Historia «Usando la IA en su empresa» | El relato: de probar a gobernar | 10 | Entrada, `#historia` |
| Tres preguntas estratégicas | Dónde invertir, cómo escalar, cómo demostrar el valor | 4 | Entrada, `#para-que` |
| Seis preguntas del consejo, y «La pregunta incómoda» | El lenguaje del consejo | 19 | Entrada, `#preguntas`; documento 61, sección 9 |
| Doce áreas de actuación | Profundidad, un asunto cada vez | 43 | `areas/<id>.html` y documentos 13, 40, 42, 43, 50, 54, 60 |
| Mitos y errores de la dirección | Opinión, para abrir conversación | 10 | Documentos 54, 61 y 40 |
| Casos por sector | Cercanía a cada sector | 11 | Galería por sector |
| Idea central y cierres | Recordar el mensaje y los límites | 7 | Entrada, documentos 00, 04 y 95 |

Regla de reparto por sector (D165): ningún sector aparece más de una vez. Los once sectores son distintos.

### 2.3 Reparto por trimestre

| Trimestre | Semanas | Tema del trimestre | Público principal | Series |
|---|---|---|---|---|
| 1 | 1 a 13 | De probar la IA a gobernarla | Primer ejecutivo y consejo | Historia (9 martes), Tres preguntas (3 jueves), Mitos |
| 2 | 14 a 26 | Las preguntas del consejo y el dinero | Consejo y dirección financiera | Seis preguntas (6 martes), Valor para la dirección financiera (6 martes), La pregunta incómoda (jueves) |
| 3 | 27 a 39 | Organización, personas y transformación | Transformación, personas y negocio | Organización IA-first (4), Talento técnico (3), Transformación (4) |
| 4 | 40 a 52 | Riesgo, seguridad, normas e implantación | Riesgos, cumplimiento y consejo | Riesgo (5), Seguridad (4), Consejo (3), Implantar (4) |

Si la historia pasa a ocho pasos (D169): la serie ocupa los martes de las semanas 2 a 9 y el martes de la semana 10 pasa a ser el resumen en carrusel.

### 2.4 Series encadenadas

Una serie crea el hábito de volver. Reglas:

- Cada serie tiene un día fijo: la serie principal del trimestre va en martes.
- Cada entrega lleva su número («3 de 9») en la primera línea.
- Cada entrega se entiende sola. No obliga a leer la anterior.
- Al terminar una serie, un carrusel la resume (semanas 11, 26 y 52).
- El jueves es el día de la opinión: una pregunta incómoda, un mito o un sector.

«La pregunta incómoda» es la serie más larga (12 entregas). Sale del documento 61, sección 9: preguntas difíciles que un consejo hace de verdad, con una buena respuesta y una mala.

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

Inicio propuesto: martes 17-11-2026. Si empieza otro día, las fechas se desplazan; el orden no cambia. Las rutas de destino son relativas a la base del sitio (variable `base_url` del JSON; hoy `https://seachad.github.io/AI_CONSULTING/`, puede cambiar por D158). Todas las rutas y anclas se han comprobado contra los HTML generados del repositorio.

### Trimestre 1

| Sem. | Fecha | Día | Pilar | Serie | Idea | Página de destino |
|---|---|---|---|---|---|---|
| 1 | 17-11-2026 | martes | Idea central | Apertura | La IA no es un proyecto de tecnología: es un activo estratégico y sus decisiones son del consejo, del primer ejecutivo y de la dirección financiera. | `SEVEN-G/html/es/entrada/index.html` |
| 1 | 19-11-2026 | jueves | Seis preguntas del consejo | Apertura | ¿Cuántos sistemas de IA tiene hoy en producción? Seis preguntas que su consejo acabará haciendo. | `SEVEN-G/html/es/entrada/index.html#preguntas` |
| 2 | 24-11-2026 | martes | Historia | Usando la IA en su empresa 1/9 | Todo empieza con entusiasmo: una docena de iniciativas que nadie decidió como conjunto. | `SEVEN-G/html/es/entrada/index.html#historia` |
| 2 | 26-11-2026 | jueves | Tres preguntas estratégicas | Tres preguntas 1/3 | Dónde invertir: ¿su inversión sigue a su estrategia o a quien pidió presupuesto primero? | `SEVEN-G/herramientas/T17_panel_consejo/ejemplo/salida/t01_Dashboard_Casos_Uso_IA_v8.html` |
| 3 | 01-12-2026 | martes | Historia | Usando la IA en su empresa 2/9 | Llega el consejo: «¿avanzamos con la IA o solo la probamos?». | `SEVEN-G/html/es/entrada/index.html#preguntas` |
| 3 | 03-12-2026 | jueves | Tres preguntas estratégicas | Tres preguntas 2/3 | Cómo escalar: seis frenos y por cuál se empieza. Una lista sin orden no es un plan. | `SEVEN-G/html/es/60_SEVEN-G_Paquete_para_el_consejo.html#10-4-que-frena-el-escalado-lectura-ejecutiva-y-donde-actuar-primero` |
| 4 | 08-12-2026 | martes | Historia | Usando la IA en su empresa 3/9 | Antes de correr, saber dónde está: más tecnología que gobierno no es una ventaja. | `SEVEN-G/herramientas/T15_diagnostico_madurez/madurez.html` |
| 4 | 10-12-2026 | jueves | Tres preguntas estratégicas | Tres preguntas 3/3 | Cómo demostrar el valor: las horas liberadas no son ahorro; solo suma lo validado. | `SEVEN-G/html/es/entrada/index.html#panel` |
| 5 | 15-12-2026 | martes | Historia | Usando la IA en su empresa 4/9 | Mirar qué hace su sector, no la lista de un proveedor. | `SEVEN-G/herramientas/T17_panel_consejo/galeria/index.html` |
| 5 | 17-12-2026 | jueves | Mitos y errores de la dirección | Mitos | Mito: «la IA es cosa de tecnología». Cuatro decisiones que tecnología no toma sola. | `SEVEN-G/html/es/54_SEVEN-G_Organizacion_de_la_compania_para_la_IA.html#3-1-que-trozo-de-ia-se-queda-cada-cargo-existente` |
| 6 | 22-12-2026 | martes | Historia | Usando la IA en su empresa 5/9 | Primero, ver la cartera entera: la IA como un embudo de ventas. | `SEVEN-G/html/es/entrada/index.html#embudo` |
| 6 | 24-12-2026 | jueves | Idea central | Fiestas | Una lectura de cinco minutos para estos días: qué es SEVEN-G, para quién sirve y para quién no. | `SEVEN-G/html/es/00_SEVEN-G_Que_es_y_para_que_sirve.html#inicio-rapido-quick-start` |
| 7 | 29-12-2026 | martes | Historia | Usando la IA en su empresa 6/9 | Cifras que el consejo puede creerse: «sin dato» nunca es cero. | `SEVEN-G/herramientas/T17_panel_consejo/ejemplo/salida/t01_Dashboard_Casos_Uso_IA_v8.html` |
| 7 | 31-12-2026 | jueves | Áreas de actuación | Estrategia | Un propósito para el consejo: aprobar una tesis de IA. | `SEVEN-G/html/es/13_SEVEN-G_Tesis_de_IA_ambicion_y_apetito_de_riesgo.html#tesis-de-ia` |
| 8 | 05-01-2027 | martes | Historia | Usando la IA en su empresa 7/9 | Gobernar sin frenar: una puerta antes de cada gran gasto. | `SEVEN-G/html/es/entrada/index.html#parar` |
| 8 | 07-01-2027 | jueves | Mitos y errores de la dirección | Mitos | Mito: «parar un proyecto de IA es un fracaso». Parar a tiempo, con motivo, es un resultado. | `SEVEN-G/html/es/61_SEVEN-G_Guia_de_conversacion_con_el_consejo.html#preguntas-dificiles-frecuentes` |
| 9 | 12-01-2027 | martes | Historia | Usando la IA en su empresa 8/9 | Mirar más lejos: ¿se transforma la compañía o solo ahorra? | `SEVEN-G/html/es/entrada/index.html#mas` |
| 9 | 14-01-2027 | jueves | Mitos y errores de la dirección | Mitos | Mito: «tenemos muchos pilotos, vamos bien». Decidir uno por uno: escalar o parar. | `SEVEN-G/herramientas/T23_recorrido_implantacion/recorrido.html` |
| 10 | 19-01-2027 | martes | Historia | Usando la IA en su empresa 9/9 | Compruébelo con un ejemplo completo y empiece desde donde está. | `SEVEN-G/html/es/entrada/index.html#quickcheck` |
| 10 | 21-01-2027 | jueves | Mitos y errores de la dirección | Mitos | Mito: «necesitamos un director de IA». En general, no: valor, capacidad y control. | `SEVEN-G/html/es/54_SEVEN-G_Organizacion_de_la_compania_para_la_IA.html#9-5-hace-falta-un-director-de-ia-en-general-no` |
| 11 | 26-01-2027 | martes | Historia | Resumen de la historia | De probar la IA a gobernarla: la historia completa en nueve pasos. | `SEVEN-G/html/es/entrada/index.html#historia` |
| 11 | 28-01-2027 | jueves | Seis preguntas del consejo | La pregunta incómoda | ¿Quién responde si la IA se equivoca? La responsabilidad no se traslada al sistema ni al proveedor. | `SEVEN-G/html/es/61_SEVEN-G_Guia_de_conversacion_con_el_consejo.html#preguntas-dificiles-frecuentes` |
| 12 | 02-02-2027 | martes | Áreas de actuación | Valor (dirección financiera) | Trece errores que inflan el valor de la IA. Empiece por tres: ¿cuál comete su compañía? | `SEVEN-G/html/es/40_SEVEN-G_Reglas_de_medicion_del_valor.html#errores-frecuentes-que-inflan-el-valor` |
| 12 | 04-02-2027 | jueves | Mitos y errores de la dirección | Mitos | Mito: «cumplimos el Reglamento de IA». Sin inventario completo, nadie puede afirmarlo. | `SEVEN-G/html/es/32_SEVEN-G_Inventario_y_clasificacion_regulatoria.html#que-se-inventaria` |
| 13 | 09-02-2027 | martes | Mitos y errores de la dirección | Errores | Seis señales de que la organización para la IA está mal montada. | `SEVEN-G/html/es/54_SEVEN-G_Organizacion_de_la_compania_para_la_IA.html#3-5-seis-senales-de-que-la-organizacion-esta-mal-montada` |
| 13 | 11-02-2027 | jueves | Idea central | Cierre de trimestre | Por qué SEVEN-G es gratuito y qué no es: no certifica, no sustituye a su asesoría, no capta contactos. | `SEVEN-G/html/es/04_SEVEN-G_Origenes_diferencias_y_por_que_es_abierto.html` |

### Trimestre 2

| Sem. | Fecha | Día | Pilar | Serie | Idea | Página de destino |
|---|---|---|---|---|---|---|
| 14 | 16-02-2027 | martes | Seis preguntas del consejo | Seis preguntas 1/6 | ¿Estoy avanzando con la IA? Cuántas entran, cuántas llegan y dónde se atascan. | `SEVEN-G/html/es/entrada/index.html#embudo` |
| 14 | 18-02-2027 | jueves | Seis preguntas del consejo | La pregunta incómoda | ¿Cuánto nos ahorra la IA? Una cifra única sin estado no es una respuesta. | `SEVEN-G/html/es/61_SEVEN-G_Guia_de_conversacion_con_el_consejo.html#preguntas-dificiles-frecuentes` |
| 15 | 23-02-2027 | martes | Seis preguntas del consejo | Seis preguntas 2/6 | ¿Son rentables mis casos de uso? Coste completo frente a eficiencias y retorno. | `SEVEN-G/html/es/entrada/index.html#panel` |
| 15 | 25-02-2027 | jueves | Casos por sector | Sector: banca | Banca: qué casos de uso están consolidados y cuáles llegan. Panel de una entidad ficticia. | `SEVEN-G/herramientas/T17_panel_consejo/galeria/index.html#es-banca` |
| 16 | 02-03-2027 | martes | Seis preguntas del consejo | Seis preguntas 3/6 | ¿Puede hacer más mi compañía? Nueve esferas y tres niveles de ambición. | `SEVEN-G/html/es/10_SEVEN-G_Mapa_de_esferas_y_niveles_de_ambicion.html#el-mapa-de-impacto` |
| 16 | 04-03-2027 | jueves | Seis preguntas del consejo | La pregunta incómoda | ¿Vamos por detrás de la competencia? La comparación fiable es con uno mismo en el tiempo. | `SEVEN-G/html/es/61_SEVEN-G_Guia_de_conversacion_con_el_consejo.html#preguntas-dificiles-frecuentes` |
| 17 | 09-03-2027 | martes | Seis preguntas del consejo | Seis preguntas 4/6 | ¿Me transformo o solo soy más eficiente? Ocho señales lo separan. | `SEVEN-G/html/es/12_SEVEN-G_Indice_de_transformacion.html#4-4-las-ocho-senales` |
| 17 | 11-03-2027 | jueves | Seis preguntas del consejo | La pregunta incómoda | ¿Cuántos empleos va a eliminar la IA? Primero, la posición aprobada: sustituir, aumentar o reorganizar. | `SEVEN-G/html/es/50_SEVEN-G_Personas_y_organizacion.html` |
| 18 | 16-03-2027 | martes | Seis preguntas del consejo | Seis preguntas 5/6 | ¿Sé parar a tiempo? Cinco salidas en cada puerta, y parar es una de ellas. | `SEVEN-G/html/es/entrada/index.html#parar` |
| 18 | 18-03-2027 | jueves | Casos por sector | Sector: seguros | Seguros: hacia dónde se mueven los casos de uso. Panel de una aseguradora ficticia. | `SEVEN-G/herramientas/T17_panel_consejo/galeria/index.html#es-seguros` |
| 19 | 23-03-2027 | martes | Seis preguntas del consejo | Seis preguntas 6/6 | ¿Tengo el riesgo bajo control? Inventario, una sola escala y roles separados. | `SEVEN-G/html/es/areas/riesgo.html` |
| 19 | 25-03-2027 | jueves | Áreas de actuación | Consejo | Lectura tranquila: guion de una sesión de consejo de 60 minutos sobre IA. | `SEVEN-G/html/es/61_SEVEN-G_Guia_de_conversacion_con_el_consejo.html#guion-de-una-sesion-de-60-minutos` |
| 20 | 30-03-2027 | martes | Áreas de actuación | Valor (dirección financiera) | Tres estados de una cifra: estimada, declarada, validada. Solo la última suma. | `SEVEN-G/html/es/40_SEVEN-G_Reglas_de_medicion_del_valor.html#estados-del-importe` |
| 20 | 01-04-2027 | jueves | Seis preguntas del consejo | La pregunta incómoda | ¿Cuánto cuesta de verdad la IA? Las licencias son solo una parte. | `SEVEN-G/html/es/42_SEVEN-G_Costes_de_IA.html#componentes-del-coste-de-un-caso` |
| 21 | 06-04-2027 | martes | Áreas de actuación | Valor (dirección financiera) | Un solo criterio económico de viabilidad; el resto de ratios informan, no deciden. | `SEVEN-G/html/es/40_SEVEN-G_Reglas_de_medicion_del_valor.html#horizonte-descuento-y-criterio-economico-unico` |
| 21 | 08-04-2027 | jueves | Casos por sector | Sector: industria | Industria: casos de uso consolidados y emergentes. Panel de una compañía ficticia. | `SEVEN-G/herramientas/T17_panel_consejo/galeria/index.html#es-industria` |
| 22 | 13-04-2027 | martes | Áreas de actuación | Valor (dirección financiera) | Invierta por tramos: cada tramo se libera en una puerta, con una condición de paso. | `SEVEN-G/html/es/14_SEVEN-G_Gestion_de_cartera.html#capacidad-y-presupuesto-por-etapas` |
| 22 | 15-04-2027 | jueves | Seis preguntas del consejo | La pregunta incómoda | ¿Por qué es tan bajo el valor validado? Qué falta para validar y con qué fechas. | `SEVEN-G/html/es/43_SEVEN-G_Realizacion_de_beneficios.html#del-valor-esperado-al-valor-validado` |
| 23 | 20-04-2027 | martes | Áreas de actuación | Valor (dirección financiera) | Todo beneficio necesita un responsable de negocio con nombre y un plan de realización. | `SEVEN-G/html/es/43_SEVEN-G_Realizacion_de_beneficios.html#plan-de-realizacion-de-beneficios` |
| 23 | 22-04-2027 | jueves | Seis preguntas del consejo | La pregunta incómoda | ¿Por qué hemos parado esto después de invertir? Inversión consumida, evitada y lo aprendido. | `SEVEN-G/html/es/42_SEVEN-G_Costes_de_IA.html#coste-de-las-decisiones-de-parar` |
| 24 | 27-04-2027 | martes | Áreas de actuación | Valor (dirección financiera) | Tres perspectivas sin fusionar: valor económico, resultado operativo y exposición al riesgo. | `SEVEN-G/html/es/40_SEVEN-G_Reglas_de_medicion_del_valor.html#11-1-reglas` |
| 24 | 29-04-2027 | jueves | Casos por sector | Sector público | Sector público: casos de uso y panel de un organismo ficticio. | `SEVEN-G/herramientas/T17_panel_consejo/galeria/index.html` |
| 25 | 04-05-2027 | martes | Áreas de actuación | Valor (dirección financiera) | El asistente de la suite ofimática: una sola iniciativa, medida unidad por unidad. | `SEVEN-G/html/es/40_SEVEN-G_Reglas_de_medicion_del_valor.html#7-2-iniciativas-transversales-y-plataformas-habilitadoras` |
| 25 | 06-05-2027 | jueves | Seis preguntas del consejo | La pregunta incómoda | ¿Podemos acelerar si relajamos los controles? Sí con una condición; no en tres casos. | `SEVEN-G/html/es/61_SEVEN-G_Guia_de_conversacion_con_el_consejo.html#preguntas-dificiles-frecuentes` |
| 26 | 11-05-2027 | martes | Áreas de actuación | Gobierno | Gobernar también cuesta: mida las horas de gobierno y manténgalas proporcionadas. | `SEVEN-G/html/es/01_SEVEN-G_Metodologia_fundacional.html#principios` |
| 26 | 13-05-2027 | jueves | Tres preguntas estratégicas | Cierre de semestre | Qué frena el escalado: los seis frenos y qué hacer con cada uno. | `SEVEN-G/html/es/60_SEVEN-G_Paquete_para_el_consejo.html#10-4-que-frena-el-escalado-lectura-ejecutiva-y-donde-actuar-primero` |

### Trimestre 3

| Sem. | Fecha | Día | Pilar | Serie | Idea | Página de destino |
|---|---|---|---|---|---|---|
| 27 | 18-05-2027 | martes | Áreas de actuación | Organización IA-first 1/4 | IA-first: IA por defecto, persona donde importa. Qué es y qué no es. | `SEVEN-G/html/es/54_SEVEN-G_Organizacion_de_la_compania_para_la_IA.html#9-1-que-significa-ser-ia-first` |
| 27 | 20-05-2027 | jueves | Áreas de actuación | Organización IA-first 2/4 | Seis pruebas para saber si una compañía es IA-first. ¿Cuántas cumple hoy? | `SEVEN-G/html/es/54_SEVEN-G_Organizacion_de_la_compania_para_la_IA.html#9-2-seis-pruebas-para-saber-si-una-compania-lo-es` |
| 28 | 25-05-2027 | martes | Áreas de actuación | Organización IA-first 3/4 | Por qué el organigrama por funciones frena la IA: el caso cruza direcciones y nadie es su dueño. | `SEVEN-G/html/es/54_SEVEN-G_Organizacion_de_la_compania_para_la_IA.html#9-3-por-que-el-organigrama-por-funciones-frena` |
| 28 | 27-05-2027 | jueves | Casos por sector | Sector: comercio | Comercio minorista: casos de uso consolidados, en adopción y emergentes. | `SEVEN-G/herramientas/T17_panel_consejo/galeria/index.html#es-retail` |
| 29 | 01-06-2027 | martes | Áreas de actuación | Organización IA-first 4/4 | Cinco opciones de organización y una recomendación por fases. | `SEVEN-G/html/es/54_SEVEN-G_Organizacion_de_la_compania_para_la_IA.html#9-7-recomendacion-combinacion-por-fases` |
| 29 | 03-06-2027 | jueves | Seis preguntas del consejo | La pregunta incómoda | ¿Por qué no usamos agentes como hacen otros? La autonomía es una decisión de negocio. | `SEVEN-G/html/es/35_SEVEN-G_Seguridad_de_IA_y_agentes.html#niveles-de-autonomia` |
| 30 | 08-06-2027 | martes | Áreas de actuación | Casos de uso | Ocho fuentes de casos de uso y una sola puerta de entrada. | `SEVEN-G/html/es/areas/casos.html` |
| 30 | 10-06-2027 | jueves | Mitos y errores de la dirección | Errores | Tres formas de IA que entran sin pasar por la puerta: la incluida en productos, la no autorizada y la prueba regalada. | `SEVEN-G/html/es/31_SEVEN-G_Politica_corporativa_y_uso_aceptable.html#la-ia-que-no-es-un-proyecto` |
| 31 | 15-06-2027 | martes | Áreas de actuación | Talento técnico 1/3 | El talento técnico se va cuando no hay carrera técnica: una carrera paralela a la de gestión. | `SEVEN-G/html/es/50_SEVEN-G_Personas_y_organizacion.html#4-3-atraer-desarrollar-y-retener-el-talento-tecnico` |
| 31 | 17-06-2027 | jueves | Casos por sector | Sector: energía | Energía: hacia dónde se mueven los casos de uso de IA. | `SEVEN-G/herramientas/T17_panel_consejo/galeria/index.html#es-energia` |
| 32 | 22-06-2027 | martes | Áreas de actuación | Talento técnico 2/3 | Lo que más retiene a un perfil técnico: que su trabajo llegue a producción. | `SEVEN-G/html/es/50_SEVEN-G_Personas_y_organizacion.html#4-3-atraer-desarrollar-y-retener-el-talento-tecnico` |
| 32 | 24-06-2027 | jueves | Seis preguntas del consejo | La pregunta incómoda | ¿Usan sus empleados IA no autorizada? «Está prohibido» no es una respuesta. | `SEVEN-G/html/es/31_SEVEN-G_Politica_corporativa_y_uso_aceptable.html#modelo-de-politica-de-uso-aceptable-de-ia` |
| 33 | 29-06-2027 | martes | Áreas de actuación | Talento técnico 3/3 | Cinco preguntas sobre talento técnico para su comité de dirección. | `SEVEN-G/html/es/areas/organizacion.html` |
| 33 | 01-07-2027 | jueves | Áreas de actuación | Personas | El valor de la IA depende de la adopción: lo que no se usa no devuelve nada. | `SEVEN-G/html/es/23_SEVEN-G_Adopcion_y_cambio.html#por-que-el-valor-depende-de-la-adopcion` |
| 34 | 06-07-2027 | martes | Áreas de actuación | Madurez | Madurez en tres lentes: la tecnología no puntúa, pero fija el gobierno mínimo. | `SEVEN-G/html/es/11_SEVEN-G_Modelo_de_madurez.html#7-6-lectura-en-tres-lentes` |
| 34 | 08-07-2027 | jueves | Casos por sector | Sector: sanidad | Sanidad: casos de uso consolidados y emergentes, con sus fuentes. | `SEVEN-G/herramientas/T17_panel_consejo/galeria/index.html#es-sanidad` |
| 35 | 13-07-2027 | martes | Áreas de actuación | Transformación | Índice de transformación: ocho señales que el consejo puede pedir. | `SEVEN-G/html/es/12_SEVEN-G_Indice_de_transformacion.html#4-4-las-ocho-senales` |
| 35 | 15-07-2027 | jueves | Mitos y errores de la dirección | Errores | «Transformación declarada, no evidenciada»: el perfil que nadie quiere ver en su panel. | `SEVEN-G/herramientas/T14_indice_transformacion/indice.html` |
| 36 | 20-07-2027 | martes | Áreas de actuación | Transformación | Optimizar, aumentar, transformar. Optimizar está bien; llamarlo transformación, no. | `SEVEN-G/html/es/10_SEVEN-G_Mapa_de_esferas_y_niveles_de_ambicion.html#los-tres-niveles-de-ambicion` |
| 36 | 22-07-2027 | jueves | Áreas de actuación | Transformación | Cinco preguntas para clasificar una iniciativa en la propia sala del consejo. | `SEVEN-G/html/es/12_SEVEN-G_Indice_de_transformacion.html#3-1-las-cinco-preguntas` |
| 37 | 27-07-2027 | martes | Áreas de actuación | Organización (hipótesis) | Qué le pasará a cada silo cuando la IA esté implantada. Una hipótesis, con sus señales. | `SEVEN-G/html/es/54_SEVEN-G_Organizacion_de_la_compania_para_la_IA.html#8-2-que-le-pasa-a-cada-silo` |
| 37 | 29-07-2027 | jueves | Casos por sector | Sector: logística | Logística: hacia dónde se mueven los casos de uso de IA. | `SEVEN-G/herramientas/T17_panel_consejo/galeria/index.html#es-logistica` |
| 38 | 03-08-2027 | martes | Idea central | Verano | Lectura de verano: el curso de SEVEN-G, de dos a cuatro horas, por perfil. | `SEVEN-G/html/es/curso/M00_SEVEN-G_Curso_Guia_del_curso.html` |
| 38 | 05-08-2027 | jueves | Áreas de actuación | Consejo | Una pregunta de verano para su comité: ¿quién es dueño de un proceso de punta a punta? | `SEVEN-G/html/es/54_SEVEN-G_Organizacion_de_la_compania_para_la_IA.html#9-9-que-existe-y-que-falta-lista-de-comprobacion` |
| 39 | 10-08-2027 | martes | Áreas de actuación | Organización (hipótesis) | Lo que la IA no va a cambiar en una compañía. | `SEVEN-G/html/es/54_SEVEN-G_Organizacion_de_la_compania_para_la_IA.html#8-5-lo-que-no-va-a-cambiar` |
| 39 | 12-08-2027 | jueves | Áreas de actuación | Implantar | Seis puntos de partida. El destino es el mismo; el camino cambia. ¿Cuál es el suyo? | `SEVEN-G/herramientas/T23_recorrido_implantacion/recorrido.html` |

### Trimestre 4

| Sem. | Fecha | Día | Pilar | Serie | Idea | Página de destino |
|---|---|---|---|---|---|---|
| 40 | 17-08-2027 | martes | Áreas de actuación | Riesgo | El apetito de riesgo en IA es una decisión del consejo, no un anexo técnico. | `SEVEN-G/html/es/13_SEVEN-G_Tesis_de_IA_ambicion_y_apetito_de_riesgo.html#apetito-de-riesgo` |
| 40 | 19-08-2027 | jueves | Áreas de actuación | Riesgo | Lo que no se delega nunca en un sistema de IA. | `SEVEN-G/html/es/13_SEVEN-G_Tesis_de_IA_ambicion_y_apetito_de_riesgo.html#11-2-lo-que-no-se-delega-nunca-en-ia` |
| 41 | 24-08-2027 | martes | Áreas de actuación | Riesgo | Líneas rojas: ¿qué no hará nunca su compañía con IA? Escríbalo antes de que haga falta. | `SEVEN-G/html/es/13_SEVEN-G_Tesis_de_IA_ambicion_y_apetito_de_riesgo.html#lineas-rojas` |
| 41 | 26-08-2027 | jueves | Casos por sector | Sector: turismo | Turismo: casos de uso consolidados y emergentes. | `SEVEN-G/herramientas/T17_panel_consejo/galeria/index.html#es-turismo` |
| 42 | 31-08-2027 | martes | Áreas de actuación | Estrategia | Vuelta al curso: la tesis de IA en pocas páginas. Qué debe decir. | `SEVEN-G/html/es/13_SEVEN-G_Tesis_de_IA_ambicion_y_apetito_de_riesgo.html#3-2-estructura` |
| 42 | 02-09-2027 | jueves | Seis preguntas del consejo | La pregunta incómoda | ¿Cumplimos el Reglamento de IA? Se responde sistema a sistema, con fecha. | `SEVEN-G/html/es/32_SEVEN-G_Inventario_y_clasificacion_regulatoria.html#arbol-de-clasificacion-regulatoria` |
| 43 | 07-09-2027 | martes | Áreas de actuación | Riesgo | El inventario es la primera obligación: lo que no está inventariado no está gobernado. | `SEVEN-G/html/es/32_SEVEN-G_Inventario_y_clasificacion_regulatoria.html#que-se-inventaria` |
| 43 | 09-09-2027 | jueves | Áreas de actuación | Seguridad | La IA que ya compró sin saberlo: la que viene dentro del software contratado. | `SEVEN-G/html/es/36_SEVEN-G_Terceros_y_proveedores_de_IA.html#ia-embebida-en-software-ya-contratado` |
| 44 | 14-09-2027 | martes | Áreas de actuación | Seguridad y agentes | Un agente que actúa necesita un dueño humano con nombre y un interruptor de parada. | `SEVEN-G/html/es/35_SEVEN-G_Seguridad_de_IA_y_agentes.html#requisitos-esenciales-de-un-agente` |
| 44 | 16-09-2027 | jueves | Seis preguntas del consejo | La pregunta incómoda | ¿Qué pasa si el sistema falla o nos atacan? «No puede ocurrir» no es una respuesta. | `SEVEN-G/html/es/52_SEVEN-G_Manual_de_operacion_de_IA.html#continuidad-y-reversion` |
| 45 | 21-09-2027 | martes | Áreas de actuación | Seguridad | ¿Dependemos demasiado de un proveedor? Una estrategia de salida probada, no solo escrita. | `SEVEN-G/html/es/36_SEVEN-G_Terceros_y_proveedores_de_IA.html#dependencia-tecnologica-y-concentracion` |
| 45 | 23-09-2027 | jueves | Casos por sector | Sector: farmacéutica | Farmacéutica: hacia dónde se mueven los casos de uso de IA. | `SEVEN-G/herramientas/T17_panel_consejo/galeria/index.html#es-farmaceutica` |
| 46 | 28-09-2027 | martes | Áreas de actuación | Normas | Los estándares dicen qué debe existir; hace falta una capa que lo haga funcionar. SEVEN-G no certifica. | `SEVEN-G/html/es/34_SEVEN-G_Mapeo_regulatorio.html#9-1-crosswalk-de-cobertura-normas-y-regulacion-seven-g` |
| 46 | 30-09-2027 | jueves | Áreas de actuación | Gobierno | Quien construye no se audita a sí mismo: las separaciones que no se negocian. | `SEVEN-G/html/es/30_SEVEN-G_Modelo_de_gobierno.html#incompatibilidades` |
| 47 | 05-10-2027 | martes | Áreas de actuación | Consejo | El informe de IA para el consejo cabe en una página. | `SEVEN-G/html/es/60_SEVEN-G_Paquete_para_el_consejo.html#4-2-resumen-de-una-pagina` |
| 47 | 07-10-2027 | jueves | Mitos y errores de la dirección | Errores | Llevar diez casos al consejo es no decidir ninguno: tres en detalle, el resto en el panel. | `SEVEN-G/html/es/61_SEVEN-G_Guia_de_conversacion_con_el_consejo.html#cuantos-casos-presentar` |
| 48 | 12-10-2027 | martes | Áreas de actuación | Consejo | Cuatro formas de responder al consejo. «Depende» no es una de ellas. | `SEVEN-G/html/es/61_SEVEN-G_Guia_de_conversacion_con_el_consejo.html#formato-de-respuesta-al-consejo` |
| 48 | 14-10-2027 | jueves | Casos por sector | Pymes y despachos | Pymes y despachos profesionales: casos realistas para empresas sin equipo de sistemas. | `SEVEN-G/herramientas/T17_panel_consejo/galeria/index.html#es-pymes` |
| 49 | 19-10-2027 | martes | Áreas de actuación | Implantar | Noventa días para empezar: qué se hace primero y qué puede esperar. | `SEVEN-G/html/es/90_SEVEN-G_Guia_de_implantacion.html#plan-de-90-dias` |
| 49 | 21-10-2027 | jueves | Mitos y errores de la dirección | Mitos | Mito: «el gobierno de la IA es para grandes compañías». El tamaño no decide la exigencia. | `SEVEN-G/html/es/90_SEVEN-G_Guia_de_implantacion.html#elegir-el-alcance-de-implantacion` |
| 50 | 26-10-2027 | martes | Áreas de actuación | Implantar | Catorce reglas que nunca se omiten. Lo demás es proporcional. | `SEVEN-G/html/es/01_SEVEN-G_Metodologia_fundacional.html#14-1-el-nucleo-de-seven-g` |
| 50 | 28-10-2027 | jueves | Áreas de actuación | Gobierno | Referenciar antes que reproducir: no pida dos veces una evidencia que la compañía ya tiene. | `SEVEN-G/html/es/21_SEVEN-G_Criterios_de_gate_y_auditoria.html#4-3-referenciar-antes-que-reproducir` |
| 51 | 02-11-2027 | martes | Áreas de actuación | Implantar | Lo que ya está en producción también se gobierna: cómo regularizarlo sin parar el negocio. | `SEVEN-G/html/es/90_SEVEN-G_Guia_de_implantacion.html#regularizacion-de-iniciativas-y-sistemas-existentes` |
| 51 | 04-11-2027 | jueves | Idea central | Confianza | Por qué el sitio no le pide nada: sus datos se quedan en su navegador. | `SEVEN-G/html/es/95_SEVEN-G_Datos_en_local_e_instalacion_propia.html` |
| 52 | 09-11-2027 | martes | Idea central | Resumen del año | Diez ideas de un año sobre cómo gobernar, medir y escalar la IA. | `SEVEN-G/html/es/entrada/index.html#areas` |
| 52 | 11-11-2027 | jueves | Idea central | Cierre | ¿Qué echa en falta en SEVEN-G? Las mejoras las decide la comunidad con sus votos. | `SEVEN-G/herramientas/comunidad/index.html` |

## 6. Textos completos de las semanas 1 a 10

Veinte publicaciones listas para revisar. Cada una tiene un gancho en la primera línea, una sola idea, una llamada a la acción y el enlace. Todas tienen entre 60 y 120 palabras. `{BASE}` es la base del sitio.

**Son borradores con voz neutra.** Se ajustan cuando el autor aporte sus publicaciones (sección 1.1).

### 1. Semana 1, martes 17-11-2026 · Idea central

Destino: `SEVEN-G/html/es/entrada/index.html` · 95 palabras · texto

```text
La IA no es un proyecto de tecnología.

Es un activo estratégico. Cambia dónde compite la compañía, cuánto riesgo asume y en qué invierte.

Por eso sus decisiones no son solo de sistemas. Son del consejo, del primer ejecutivo y de la dirección financiera.

Durante un año publicaré aquí dos ideas breves por semana sobre cómo gobernar, medir y escalar la IA en una empresa. Todas salen de SEVEN-G, un marco abierto, gratuito y sin registro.

Empiece por la pregunta que lo ordena todo: ¿su compañía avanza con la IA, o solo la prueba?

{BASE}SEVEN-G/html/es/entrada/index.html
```

### 2. Semana 1, jueves 19-11-2026 · Seis preguntas del consejo

Destino: `SEVEN-G/html/es/entrada/index.html#preguntas` · 90 palabras · pregunta

```text
¿Cuántos sistemas de IA tiene hoy su compañía en producción?

Si la respuesta tarda más de una semana, el problema es de gobierno, no de tecnología.

Su consejo acabará haciendo seis preguntas:
1. ¿Avanzamos con la IA?
2. ¿Son rentables los casos de uso?
3. ¿Podemos hacer más?
4. ¿Nos transformamos o solo ahorramos?
5. ¿Sabemos parar a tiempo?
6. ¿Tenemos el riesgo bajo control?

Casi todas las compañías tienen pilotos. Pocas responden a las seis sin abrir seis hojas de cálculo.

¿Cuál de las seis no sabría responder hoy?

{BASE}SEVEN-G/html/es/entrada/index.html#preguntas
```

### 3. Semana 2, martes 24-11-2026 · Historia

Destino: `SEVEN-G/html/es/entrada/index.html#historia` · 85 palabras · texto

```text
Todo empieza con entusiasmo. (1 de 9)

Un equipo prueba un asistente. Otro automatiza un informe. Un proveedor regala una prueba de concepto.

En pocos meses hay una docena de iniciativas de IA. Nadie las ha decidido como conjunto.

Entonces la dirección hace tres preguntas: dónde invertir, cómo escalar y cómo demostrar el valor.

El entusiasmo no es el problema. El problema es que nadie mira la cartera entera.

Durante nueve martes contaré esta historia, paso a paso. Si prefiere leerla hoy, dura tres minutos:

{BASE}SEVEN-G/html/es/entrada/index.html#historia
```

### 4. Semana 2, jueves 26-11-2026 · Tres preguntas estratégicas

Destino: `SEVEN-G/herramientas/T17_panel_consejo/ejemplo/salida/t01_Dashboard_Casos_Uso_IA_v8.html` · 103 palabras · texto + imagen (mapa de impacto)

```text
¿Su inversión en IA sigue a su estrategia, o a quien pidió presupuesto primero?

Para saberlo basta un mapa.

En las filas, las áreas donde la IA crea valor: cliente, producto, personas, operaciones, datos, conocimiento y decisión. En las columnas, la ambición: optimizar, aumentar o transformar. En cada celda, la inversión y el neto anual.

El mapa enseña dos cosas: dónde se concentra el dinero y dónde la compañía dijo que iba a jugar y no juega.

Decidir dónde invertir es una decisión de dirección. No se delega en una lista de proyectos.

Véalo en un panel de ejemplo, con una compañía ficticia:

{BASE}SEVEN-G/herramientas/T17_panel_consejo/ejemplo/salida/t01_Dashboard_Casos_Uso_IA_v8.html
```

### 5. Semana 3, martes 01-12-2026 · Historia

Destino: `SEVEN-G/html/es/entrada/index.html#preguntas` · 86 palabras · pregunta

```text
Llega el consejo. (2 de 9)

Tarde o temprano, un consejero pregunta: «¿Estamos avanzando con la IA, o solo la probamos?»

Después llegan más preguntas. ¿Son rentables los casos de uso? ¿Sabemos parar a tiempo? ¿Tenemos el riesgo bajo control?

Sin un método, cada respuesta es una hoja de cálculo distinta y una opinión.

El consejo no necesita entender los modelos. Necesita la misma disciplina que exige a cualquier inversión: cartera, valor validado y riesgo.

¿Qué pregunta sobre IA hizo su consejo en la última sesión?

{BASE}SEVEN-G/html/es/entrada/index.html#preguntas
```

### 6. Semana 3, jueves 03-12-2026 · Tres preguntas estratégicas

Destino: `SEVEN-G/html/es/60_SEVEN-G_Paquete_para_el_consejo.html#10-4-que-frena-el-escalado-lectura-ejecutiva-y-donde-actuar-primero` · 95 palabras · texto

```text
«Tenemos muchos pilotos y ninguno escala.»

Si esta frase le suena, la causa casi nunca es técnica.

SEVEN-G ordena seis frenos del escalado:
1. El valor no está demostrado.
2. Los casos no avanzan.
3. El riesgo y el cumplimiento están sin cerrar.
4. Las personas no lo adoptan.
5. Los datos y la tecnología no están listos.
6. Falta dirección y gobierno.

El trabajo de la dirección es decidir por cuáles se empieza, quién actúa y qué valor espera detrás de cada uno.

Una lista de problemas sin orden no es un plan.

{BASE}SEVEN-G/html/es/60_SEVEN-G_Paquete_para_el_consejo.html#10-4-que-frena-el-escalado-lectura-ejecutiva-y-donde-actuar-primero
```

### 7. Semana 4, martes 08-12-2026 · Historia

Destino: `SEVEN-G/herramientas/T15_diagnostico_madurez/madurez.html` · 96 palabras · texto

```text
Antes de correr, saber dónde está. (3 de 9)

La primera respuesta honesta es la madurez de la compañía en IA.

La madurez no se mide por la tecnología que se tiene. Una compañía con modelos sencillos y bien gobernados es más madura que otra con IA generativa sin control.

SEVEN-G la mide en siete dimensiones, con evidencias. Y avisa cuando la adopción va por delante del gobierno.

Tener más tecnología que gobierno no es una ventaja. Es un riesgo sin dueño.

El diagnóstico es gratuito. Los datos que introduce se quedan en su navegador.

{BASE}SEVEN-G/herramientas/T15_diagnostico_madurez/madurez.html
```

### 8. Semana 4, jueves 10-12-2026 · Tres preguntas estratégicas

Destino: `SEVEN-G/html/es/entrada/index.html#panel` · 94 palabras · texto + imagen (panel)

```text
Las horas liberadas no son ahorro.

Un asistente puede ahorrar tiempo a cada persona. La cuenta de resultados no cambia por eso. Cambia cuando esa capacidad se convierte en algo: menos coste, más ingresos o trabajo reasignado.

Por eso cada cifra de valor debe llevar su estado: estimada, declarada o validada por control de gestión.

Solo lo validado suma.

Un porcentaje validado bajo y honesto es mejor que uno alto sin respaldo.

Una pregunta para su dirección financiera: ¿qué parte del valor de la IA ha comprobado alguien ajeno al equipo que lo produce?

{BASE}SEVEN-G/html/es/entrada/index.html#panel
```

### 9. Semana 5, martes 15-12-2026 · Historia

Destino: `SEVEN-G/herramientas/T17_panel_consejo/galeria/index.html` · 89 palabras · texto

```text
Mirar qué hace su sector. (4 de 9)

La pregunta «¿qué casos de uso nos convienen?» tiene una mala respuesta: copiar la lista de un proveedor.

Una respuesta mejor empieza por su sector: qué está ya consolidado, qué se está adoptando y qué llega después.

La galería de SEVEN-G lo recoge para varios sectores, con sus fuentes. Incluye el panel del consejo de cuatro compañías ficticias: banca, seguros, industria y sector público.

No es una recomendación de compra. Es un punto de partida para una conversación de dirección.

{BASE}SEVEN-G/herramientas/T17_panel_consejo/galeria/index.html
```

### 10. Semana 5, jueves 17-12-2026 · Mitos y errores de la dirección

Destino: `SEVEN-G/html/es/54_SEVEN-G_Organizacion_de_la_compania_para_la_IA.html#3-1-que-trozo-de-ia-se-queda-cada-cargo-existente` · 84 palabras · lista

```text
Mito: «La IA es cosa de tecnología.»

Tecnología construye y opera. Pero no decide sola cuatro cosas:
- dónde quiere competir la compañía con IA;
- cuánto riesgo acepta;
- cuánto invierte y qué retorno exige;
- qué decisiones no se delegan nunca en un sistema.

Las cuatro son del consejo y del primer ejecutivo. La dirección financiera valida las cifras.

Cuando todo cuelga de tecnología, el consejo ve demostraciones de producto. No ve cartera, riesgo ni valor validado.

¿De quién cuelga hoy la IA en su compañía?

{BASE}SEVEN-G/html/es/54_SEVEN-G_Organizacion_de_la_compania_para_la_IA.html#3-1-que-trozo-de-ia-se-queda-cada-cargo-existente
```

### 11. Semana 6, martes 22-12-2026 · Historia

Destino: `SEVEN-G/html/es/entrada/index.html#embudo` · 85 palabras · texto + imagen (embudo)

```text
Primero, ver la cartera entera. (5 de 9)

Un listado de proyectos esconde lo importante. Un embudo lo enseña.

SEVEN-G trata cada iniciativa de IA como una oportunidad en un CRM. Hay etapas obligatorias hasta llegar a producción.

El embudo muestra tres cosas:
- qué está en curso y cuántos días lleva en su etapa;
- qué se quedó por el camino, y por qué;
- qué llegó a usarse y cuánto devuelve.

Su dirección comercial ya gestiona así las ventas. La IA merece la misma disciplina.

{BASE}SEVEN-G/html/es/entrada/index.html#embudo
```

### 12. Semana 6, jueves 24-12-2026 · Idea central

Destino: `SEVEN-G/html/es/00_SEVEN-G_Que_es_y_para_que_sirve.html#inicio-rapido-quick-start` · 86 palabras · texto breve

```text
Una lectura de cinco minutos para estos días.

Si su compañía va a invertir más en IA el año que viene, conviene decidir antes cómo la va a gobernar y cómo la va a medir.

El inicio rápido de SEVEN-G explica en cinco minutos qué es el marco, para quién sirve y para quién no sirve.

Es gratuito. No pide registro ni correo. Puede adaptarlo a su forma de trabajar.

No es una certificación ni un asesoramiento jurídico. Es un método de trabajo.

Felices fiestas.

{BASE}SEVEN-G/html/es/00_SEVEN-G_Que_es_y_para_que_sirve.html#inicio-rapido-quick-start
```

### 13. Semana 7, martes 29-12-2026 · Historia

Destino: `SEVEN-G/herramientas/T17_panel_consejo/ejemplo/salida/t01_Dashboard_Casos_Uso_IA_v8.html` · 95 palabras · texto + imagen (panel)

```text
Después, cifras que el consejo puede creerse. (6 de 9)

El mismo registro que dibuja el embudo alimenta el panel del consejo.

El panel muestra, caso a caso, el coste completo frente a las eficiencias y el retorno. Y dice qué parte del valor ha validado control de gestión.

Dos reglas lo hacen creíble:
- «sin dato» nunca es cero;
- lo estimado no se presenta como validado.

Un consejo que ve cada cifra con su estado pregunta mejor. Y decide mejor dónde poner o quitar el dinero.

Vea un panel de ejemplo, con una compañía ficticia:

{BASE}SEVEN-G/herramientas/T17_panel_consejo/ejemplo/salida/t01_Dashboard_Casos_Uso_IA_v8.html
```

### 14. Semana 7, jueves 31-12-2026 · Áreas de actuación

Destino: `SEVEN-G/html/es/13_SEVEN-G_Tesis_de_IA_ambicion_y_apetito_de_riesgo.html#tesis-de-ia` · 79 palabras · pregunta

```text
Un propósito de IA para su consejo: aprobar una tesis.

Una tesis de IA cabe en pocas páginas. Dice dónde quiere competir la compañía con IA, con qué ambición en cada área, cuánto riesgo acepta y qué no hará nunca.

Sin tesis, cada iniciativa se juzga sola. Con tesis, se juzga contra una decisión del consejo.

Para aprobarla no hace falta saber de modelos. Hace falta saber de estrategia y de riesgo.

¿Tiene su compañía esta decisión por escrito?

{BASE}SEVEN-G/html/es/13_SEVEN-G_Tesis_de_IA_ambicion_y_apetito_de_riesgo.html#tesis-de-ia
```

### 15. Semana 8, martes 05-01-2027 · Historia

Destino: `SEVEN-G/html/es/entrada/index.html#parar` · 89 palabras · lista

```text
Gobernar sin frenar. (7 de 9)

El gobierno de la IA tiene mala fama. Se asocia a comités y a retrasos.

Bien hecho, es lo contrario: es lo que permite escalar con confianza.

En SEVEN-G cada iniciativa cruza una puerta de decisión antes de cada gran gasto. La puerta de viabilidad y riesgo llega antes de la inversión fuerte.

Tres reglas sencillas:
- quien construye no se audita a sí mismo;
- el riesgo se mide con la misma escala en toda la compañía;
- ninguna puerta se cruza sin evidencia.

{BASE}SEVEN-G/html/es/entrada/index.html#parar
```

### 16. Semana 8, jueves 07-01-2027 · Mitos y errores de la dirección

Destino: `SEVEN-G/html/es/61_SEVEN-G_Guia_de_conversacion_con_el_consejo.html#preguntas-dificiles-frecuentes` · 91 palabras · pregunta

```text
Mito: «Parar un proyecto de IA es un fracaso.»

Parar a tiempo, con motivo, es un resultado.

Un consejero preguntará: «¿Por qué hemos parado esto después de invertir?» Hay una buena respuesta: «Porque no cumplió el criterio de parada que fijamos antes de invertir.»

Y tres datos: la inversión consumida, la inversión evitada y lo aprendido.

Una señal de alarma: en su compañía ninguna iniciativa se ha parado nunca por criterio. Solo por falta de presupuesto o de personas.

¿Fija su compañía el criterio de parada antes de aprobar la inversión?

{BASE}SEVEN-G/html/es/61_SEVEN-G_Guia_de_conversacion_con_el_consejo.html#preguntas-dificiles-frecuentes
```

### 17. Semana 9, martes 12-01-2027 · Historia

Destino: `SEVEN-G/html/es/entrada/index.html#mas` · 94 palabras · pregunta

```text
Mirar más lejos. (8 de 9)

Con la cartera en orden llega la pregunta estratégica: ¿la compañía se transforma, o solo ahorra?

Las dos cosas son legítimas. Optimizar está bien. El error es llamar transformación a una automatización.

SEVEN-G usa un índice con ocho señales. Separa la transformación demostrada de la que solo está declarada en una presentación.

Si la compañía cree que se transforma y no es verdad, no toma las decisiones que la transformación exige.

¿Qué evidencia tiene de que su compañía hace algo distinto, y no lo mismo más barato?

{BASE}SEVEN-G/html/es/entrada/index.html#mas
```

### 18. Semana 9, jueves 14-01-2027 · Mitos y errores de la dirección

Destino: `SEVEN-G/herramientas/T23_recorrido_implantacion/recorrido.html` · 89 palabras · lista

```text
Mito: «Tenemos muchos pilotos, así que vamos bien.»

Muchos pilotos y casi nada en producción es un punto de partida. No es un avance.

Se reconoce por tres síntomas:
- nadie sabe cuántos pilotos hay;
- ninguno tiene criterio de parada;
- todos piden «un poco más de tiempo».

La salida no es lanzar más pilotos. Es decidir, uno por uno: escalar o parar.

SEVEN-G describe seis puntos de partida y ordena los primeros pasos de cada uno. El destino es el mismo; el camino cambia.

¿En cuál está su compañía?

{BASE}SEVEN-G/herramientas/T23_recorrido_implantacion/recorrido.html
```

### 19. Semana 10, martes 19-01-2027 · Historia

Destino: `SEVEN-G/html/es/entrada/index.html#quickcheck` · 97 palabras · texto

```text
Compruébelo, y empiece desde donde está. (9 de 9)

No hace falta creerse un marco. Se puede comprobar.

En el sitio de SEVEN-G hay un ejemplo completo con una compañía ficticia: el embudo de la cartera, el panel del consejo, la matriz de riesgos de un caso y el índice de transformación.

Ábralos sin leer nada antes. Cada uno explica qué muestra y cómo se llega a él.

El resultado de la historia: la IA deja de ser una colección de pilotos. Pasa a ser una cartera que la dirección gobierna, mide y escala con evidencia.

{BASE}SEVEN-G/html/es/entrada/index.html#quickcheck
```

### 20. Semana 10, jueves 21-01-2027 · Mitos y errores de la dirección

Destino: `SEVEN-G/html/es/54_SEVEN-G_Organizacion_de_la_compania_para_la_IA.html#9-5-hace-falta-un-director-de-ia-en-general-no` · 78 palabras · texto

```text
Mito: «Necesitamos un director de IA.»

En general, no.

La IA cruza toda la compañía. Una dirección vertical para algo horizontal crea un silo más: el director de IA acaba siendo dueño de los casos de uso, y los procesos siguen sin dueño.

Lo que sí hace falta son tres responsabilidades claras: valor, capacidad y control.

Ante el consejo responde el primer ejecutivo.

Es una propuesta razonada, no una regla. Lea los argumentos y las cautelas, y decida:

{BASE}SEVEN-G/html/es/54_SEVEN-G_Organizacion_de_la_compania_para_la_IA.html#9-5-hace-falta-un-director-de-ia-en-general-no
```

Para las semanas 11 a 52, la línea de cada publicación está en la columna «Idea» del calendario (sección 5). Los textos completos se escriben por lotes de un mes, con el estilo ya ajustado.

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

1. Titular: que diga a quién ayuda y en qué. Ejemplo: «Gobierno y valor de la IA para consejos y direcciones · Autor de SEVEN-G».
2. Sección «Destacado»: la entrada de SEVEN-G y el panel de ejemplo.
3. Active el «modo creador» si no lo tiene: da acceso a las estadísticas de publicaciones.

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
- [ ] Trata de SEVEN-G: gobernar, medir y aplicar la IA en la empresa. No trata de SPAD ni de equipos de desarrollo.
- [ ] Tiene una sola idea, entre 60 y 120 palabras, y un enlace a una página concreta que existe.
- [ ] Si lleva captura, dice «compañía ficticia» o «datos ilustrativos».

## 10. Pendiente del autor

1. Pegar de 8 a 10 publicaciones suyas o exportar su actividad (sección 1.1).
2. Confirmar si la historia tiene nueve pasos (publicado) u ocho (D169, no encontrada en el repositorio).
3. Aprobar o corregir: idioma (sección 3), días y horas (sección 4), fecha de inicio y los 20 textos.
4. Decidir si quiere los parámetros `utm` en los enlaces.
