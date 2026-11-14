# Presentaciones del sitio · especificación común

Este fichero es el contrato entre quien escribe el contenido (un JSON por presentación) y el generador
(`presentaciones/build_presentaciones.ps1`), que produce el PPTX y el PDF en español e inglés.
Nadie escribe un PPTX a mano. No se publica (`presentaciones/` es fuente de trabajo).

## 1. Qué se genera

| Conjunto | Claves | Título ES / EN |
|---|---|---|
| SEVEN-G, SPHERES, SPAD | `1`, `5`, `10`, `20` | «SEVEN-G en 1 slide», «SEVEN-G en 5 slides»… / «SEVEN-G in 1 slide», «SEVEN-G in 5 slides»… |
| SEVEN-G, SPHERES, SPAD | `curso` | «Curso completo de SEVEN-G» / «SEVEN-G complete course» |
| 12 áreas de actuación en IA (ids de `SEVEN-G/build/temas.json`) | `<id>_1`, `<id>_10` | «Estrategia e inversión en 1 slide», «… en 10 slides» / «Strategy and investment in 1 slide»… |

Fuentes: `presentaciones/fuentes/<seven-g|spheres|spad|areas>/<clave>.json`.
El curso puede partirse: `curso.json` (cabecera y primeras slides) y `curso.part02.json`, `curso.part03.json`…,
cada uno con solo `{ "slides": [ … ] }`; el generador los une por orden de nombre.

Salidas (las escribe el generador):
- `<MARCO>/pptx/<idioma>/presentaciones/<nombre>.pptx` y `<MARCO>/pdf/<idioma>/presentaciones/<nombre>.pdf`
- áreas: `SEVEN-G/pptx/<idioma>/areas/<nombre>.pptx` y `SEVEN-G/pdf/<idioma>/areas/<nombre>.pdf`
- `<nombre>`: el título sin acentos ni signos y con `_` por espacio (`SEVEN-G_en_5_slides`, `SEVEN-G_in_5_slides`,
  `Curso_completo_de_SEVEN-G`, `SEVEN-G_complete_course`, `Estrategia_e_inversion_en_10_slides`).
- `presentaciones/manifiesto.json`: lista de todo lo generado (lo leen las páginas y la verificación).

## 2. Público, tono y reglas de contenido (obligatorias)

- Público: alumnos y profesores de escuelas de negocio y directivos. No son técnicos. Es también material de difusión.
- Didáctico, concreto y exhaustivo. Frases cortas y directas (espíritu de ASD-STE100). Sin jerga sin explicar.
  Cada concepto nuevo dice **por qué importa** para decidir, medir o controlar el riesgo.
- **Nombre primero, código después**: «la puerta de viabilidad (G3)», «el registro de iniciativas (T01)».
- Español neutro y de usted («su compañía»). Inglés según `SEVEN-G/build/guia_traduccion_en.md` y el glosario
  (documento 02). ES y EN dicen lo mismo, con la misma estructura.
- **El número de slides es exacto**: «en 5 slides» tiene 5 slides. No hay portada ni cierre aparte en 1 y 5.
  En 10 y 20, la slide 1 puede ser `portada` y cuenta. El curso: SEVEN-G 36 a 44 slides; SPHERES y SPAD 26 a 32.
- **Profundidad creciente**: 1 = la idea completa de un vistazo; 5 = problema, modelo, cómo funciona, qué se obtiene,
  cómo empezar; 10 = añade gobierno, medición y relación con los otros marcos; 20 = añade ejemplos, herramientas,
  errores frecuentes y preguntas para el aula; curso = módulos con objetivo, conceptos, ejemplo, ejercicio y
  autocomprobación. Lo que dice una versión corta no se contradice en una larga: se amplía.
- **Conocimiento cruzado**: cada marco explica cómo se apoya en los otros dos y enlaza a ellos.
  SEVEN-G es el marco principal (gobierno, valor y medición de la IA); SPHERES es la capa explicativa de las nueve
  esferas y los tres niveles de ambición (Optimizar, Aumentar, Transformar); SPAD es la metodología de construcción
  de software con IA (*Structured Prompt-Driven Engineering*). Son metodologías independientes que se referencian.
- **Solo se afirma lo que el sitio afirma.** Lea las fuentes Markdown (`<MARCO>/mds/es/` y `mds/en/`) antes de
  escribir. No invente reglas, cifras, casos ni nombres. Las cifras de ejemplo del sitio son ficticias: dígalo.
- Prohibido: nombres o rasgos de clientes; la palabra «SEACHAD» en mayúsculas; «marca registrada»; «certificación»
  de SEVEN-G (no existe); «alternativa a ISO/IEC 42001»; «no difundir»; «previsto» o «en construcción» referido a
  SEVEN-G; cifras de mercado sin fuente del registro. Autor: Fernando García Varela. Licencia: CC BY 4.0 (contenidos)
  y MIT (código); usar el marco es gratuito.
- **Enlaces**: cada concepto que se explica enlaza a su material dentro del sitio (documento y sección, plantilla,
  herramienta o página de área). Las fuentes externas solo pueden ser URL que ya están, con `"estado": "verificado"`,
  en `SEVEN-G/build/referencias/*.json` (campos `url_es`, `url_en`). Si no está ahí, no se cita.

## 3. Formato del JSON

Todo texto visible es un objeto `{ "es": "…", "en": "…" }`. UTF-8 sin BOM. Sin comentarios.

```json
{
  "marco": "SEVEN-G",
  "clave": "5",
  "titulo": { "es": "SEVEN-G en 5 slides", "en": "SEVEN-G in 5 slides" },
  "descripcion": { "es": "Una frase para la tarjeta de descarga (máx. 160).", "en": "…" },
  "basado_en": [ "SEVEN-G/mds/es/00_SEVEN-G_Que_es_y_para_que_sirve.md", "SEVEN-G/mds/es/01_SEVEN-G_Metodologia_fundacional.md" ],
  "slides": [ { "tipo": "…", "…": "…" } ]
}
```

- `marco`: `SEVEN-G`, `SPHERES`, `SPAD`; en las áreas, `SEVEN-G` y además `"area": "<id>"`.
- `basado_en`: **todas** las fuentes Markdown en español (ruta desde la raíz del repositorio) de las que sale el
  contenido. Es la base de la regla de coherencia: si una de ellas cambia, la presentación debe revisarse.

### Campos comunes de toda slide

| Campo | Obligatorio | Regla |
|---|---|---|
| `tipo` | sí | uno de los de la sección 4 |
| `titulo` | sí | máx. 80 caracteres |
| `sub` | no | máx. 150 |
| `destacado` | no | frase de cierre en banda de color, máx. 170 |
| `enlaces` | sí, 1 a 3 | botones de enlace en la slide: `{ "texto": {es,en} (máx. 42), "href": … }`. Material del sitio. |
| `notas` | sí | texto explicativo que no cabe en la slide. 700 a 2.600 caracteres por idioma (en las de 1 slide, 2.500 a 5.000). Párrafos separados por `\n\n`; una línea que empieza por `- ` es una viñeta. Sin Markdown. Explica cada concepto de la slide, da un ejemplo, dice por qué importa y, cuando proceda, una pregunta para el aula. |
| `fuentes` | sí, 1 a 6 | enlaces que salen en las notas y en el PDF: `{ "texto": {es,en} (máx. 90), "href": … }`. Documentos del sitio y fuentes externas del registro. |

El generador añade solo, en cada slide: el pie con el marco, «Versión 0.x, en revisión», la licencia, el número de
slide y el enlace al sitio; y en las notas de la última slide, el aviso legal. No los escriba.

### `href`

- **Dentro del sitio**: ruta desde la raíz del repositorio al fichero **publicado**, con `{idioma}` donde va `es` o `en`:
  `"SEVEN-G/html/{idioma}/21_SEVEN-G_Criterios_de_gate_y_auditoria.html"`. Los nombres de fichero son iguales en los
  dos idiomas; **las anclas no**: si enlaza a una sección, use
  `{ "es": "SEVEN-G/html/es/…html#ancla-es", "en": "SEVEN-G/html/en/…html#anchor-en" }` y copie cada ancla del
  atributo `id` del HTML generado (`Grep` de `id="…"` en el fichero). El generador falla si el fichero o el ancla no existen.
- Destinos útiles: `index.html` y `en/index.html` (portada), `SEVEN-G/html/{idioma}/entrada/index.html` (cabecera de
  SEVEN-G), `SEVEN-G/html/{idioma}/areas/<id>.html`, `SEVEN-G/html/{idioma}/preguntas/<id>.html`,
  `SEVEN-G/html/{idioma}/plantillas/…html`, `SEVEN-G/html/{idioma}/curso/…html`,
  `SPHERES/html/{idioma}/00_SPHERES_Que_es_y_para_que_sirve.html`, `SPAD/html/{idioma}/00_SPAD_Que_es_y_para_que_sirve.html`,
  herramientas en `SEVEN-G/herramientas/…` (`T01_registro_iniciativas/registro.html`, `T17_panel_consejo/index.html`,
  `T17_panel_consejo/galeria/index.html`, `T14_indice_transformacion/…`, `T15_diagnostico_madurez/…`, `T23…`; compruebe el nombre con `Glob`).
- **Externo**: URL `https://…` exacta del registro de referencias.

## 4. Tipos de slide y límites de texto (el generador falla si se superan)

| `tipo` | Campos propios | Límites |
|---|---|---|
| `poster` | `antetitulo`, `bloques[]` `{titulo, texto, color, href?}`, `imagen?` | solo en presentaciones de 1 slide. `antetitulo` 60; 4 a 6 bloques; bloque: `titulo` 34, `texto` 190 (150 si hay `imagen`). `enlaces` hasta 4. |
| `portada` | `publico` (línea «para quién»), `imagen?` | `titulo` 70, `sub` 170, `publico` 100 |
| `seccion` | `rotulo`, `texto` | separador de módulo. `rotulo` 30, `texto` 220 |
| `texto` | `bullets[]` `{rotulo?, texto, href?}` | 3 a 6 bullets; `rotulo` 30; `texto` 160 |
| `tarjetas` | `tarjetas[]` `{titulo, texto, color, href?}` | 2 a 6; `titulo` 36; `texto` 210 (150 con 5 o 6) |
| `imagen` | `imagen`, `bullets[]` (como `texto`) | 2 a 4 bullets de 140. La imagen ocupa unos dos tercios. |
| `tabla` | `cabecera[]`, `filas[][]` (celda `{es,en}` o `{texto:{es,en}, href}`) | 2 a 5 columnas; 2 a 7 filas; cabecera 26; celda 95 (65 con 5 columnas) |
| `proceso` | `pasos[]` `{rotulo, titulo, texto, color?}` | 3 a 8 pasos en fila con flechas; `rotulo` 10 (p. ej. «G3», «Fase 2»); `titulo` 28; `texto` 120 (80 con 7 u 8) |
| `comparacion` | `izquierda`, `derecha`: `{titulo, bullets[] (texto), color}` | `titulo` 42; 2 a 5 bullets de 120 |
| `cita` | `texto`, `apoyo` | mensaje grande. `texto` 230; `apoyo` 220 |

`color`: `claret`, `oxford`, `teal`, `velvet`, `oro`, `verde`, `negro`. Varíe los tipos: no más de dos slides seguidas
del mismo tipo. En 5 slides o más, al menos una de cada tres lleva gráfico (`imagen`) o estructura visual
(`proceso`, `tabla`, `comparacion`, `tarjetas`).

## 5. Catálogo de imágenes (`imagen`: clave)

El generador elige la versión del idioma. Puede ver cualquier imagen con `Read` antes de usarla.

| Clave | Qué muestra | Origen |
|---|---|---|
| `ciclo` | ciclo de vida de la iniciativa: fases 0 a 7 y sus puertas | componente SVG de SEVEN-G |
| `arquitectura` | los dos niveles (ciclo corporativo C1–C5 y ciclo de la iniciativa) y los cuatro componentes A–D | componente |
| `flujo-uso` | cómo fluye una iniciativa: continuar, iterar, pivotar, parar; bucle de operación | componente |
| `esferas` | las nueve esferas (01–04 de valor, 05–07 habilitadoras, 08 límites y 09 meta-esfera de gobierno) | componente |
| `espectro` | el espectro de perfiles del índice de transformación (de eficiencia a transformación); **no** son los niveles de ambición: para estos use `niveles` | componente |
| `niveles` | niveles de ambición explicados (SPHERES) | componente de SPHERES |
| `intensidad` | intensidad Express, Lite y Enterprise | componente |
| `embudo-cartera` | la cartera de IA como embudo: etapas, salidas, en uso y desenganchadas | componente |
| `no-conformidades` | circuito de no conformidades e incidentes | componente |
| `registro-t01` | captura del registro de iniciativas (T01), datos ficticios (en español) | `SEVEN-G/build/img_curso/registro-ejemplo.png` |
| `panel-consejo` | captura del panel del consejo (T17), datos ficticios (en español) | `SEVEN-G/build/img_curso/panel-consejo-ejemplo.png` |
| `mapa-impacto` | mapa de impacto esferas × ambición (T16), datos ficticios (en español) | `SEVEN-G/build/img_curso/mapa-impacto-ejemplo.png` |
| `ilustracion-01`, `-05`, `-06`, `-09`, `-13` | ilustraciones sin texto de la entrada de SEVEN-G | `SEVEN-G/build/entrada/SEVEN-G_NN.png` |
| `spad-01` … `spad-09` | láminas de SPAD (pensar-validar-ejecutar, ilusión de velocidad, IA tradicional frente a SPAD, reglas no negociables, separación de roles, flujo bloqueante, política de validación, contextos y tema, pruebas y seguridad); con texto en español | `SPAD/html/img/spad_NN_*.jpg` |

Las versiones PNG de los componentes están en `presentaciones/img/<clave>-<idioma>.png` y el catálogo completo en
`presentaciones/imagenes.json`. Si una imagen solo existe en español, en la slide inglesa dígalo en una viñeta
(«Screenshot in Spanish»).

## 6. Regla de coherencia (obligatoria)

**Todo cambio en el sitio se lleva a las presentaciones que lo explican, en la misma entrega.**
`manifiesto.json` guarda la huella SHA-256 de cada fichero de `basado_en` en la última revisión de cada presentación.
`verificar_coherencia.ps1` falla si una fuente ha cambiado y la presentación no se ha revisado
(`build_presentaciones.ps1 -Revisado <clave>` tras revisarla), si un PPTX o PDF no corresponde a su JSON, o si un
enlace no existe.
