# T23 · Recorrido de implantación

Aplica el **documento 96** (Puntos de partida y recorrido de implantación): un **cuestionario de doce preguntas** (Q01 a Q12) asigna el **punto de partida** de la compañía —arquetipo principal PP-A a PP-F con la regla de 96 §2.2, **rasgos** y **modificadores** MP1 a MP5— y explica por qué; después muestra el **recorrido** de los **22 hitos** HI-01 a HI-22 en las cinco etapas E1 a E5, ordenados por su prioridad para ese punto de partida, con quién, evidencia, pregunta del documento 11 que los acredita y mes base (Lite o Enterprise), el **estado** de cada hito, la **vista por rol** de 96 §5 y un **plan imprimible** con exportación CSV.

**Por qué importa.** Las compañías no parten del mismo sitio: una sin IA que empieza por constituir todos los órganos se queda en burocracia sin casos, y una con agentes en producción que empieza por la ficha de caso deja sin control lo que ya actúa. La herramienta aplica siempre la misma regla del documento 96 para decidir **qué se hace primero**, sin rebajar lo que se exige al final (01 §14), y enlaza cada hito con la pregunta del documento 11 que lo acredita: avanzar en el recorrido es subir de madurez con evidencia.

## Cómo se usa

1. Abra `recorrido.html` en el navegador (no necesita servidor ni instalación). Arranca con el ejemplo de la compañía ficticia del registro T01, que resulta **PP-F · A escala** con rasgos PP-E, PP-D y PP-B y modificadores MP2, MP3 y MP4. En «Datos» puede cargar el **ejemplo PP-B** (empresa de servicios de 96 §6.3), volver al ejemplo PP-F o empezar en blanco.
2. **Punto de partida**: responda las doce preguntas. Q01 admite varias respuestas; si marca IA generativa, indique si hay uno o más sistemas en producción (lo necesita la condición de PP-E en 96 §2.2). La tabla «Por qué este resultado» recorre la regla en su orden (PP-F, PP-E, PP-D, PP-C, PP-B, PP-A) con las respuestas usadas; la de modificadores dice qué respuesta activa cada uno (Q07 → MP1, Q08 sí o no se sabe → MP2, Q09 → MP3, Q05 parcial o formal → MP4, Q10 no → MP5).
3. **Recorrido**: los hitos de cada etapa ordenados por prioridad (1, 2, C, D, 3, ·). La prioridad de un hito es la más urgente entre el arquetipo principal y sus rasgos (96 §4.3, regla 5) y se ajusta con 96 §4.2: MP1 o MP2 pasan HI-05 y HI-10 a 1; MP2 pasa HI-19 a 1; con MP4, los hitos cubiertos por el gobierno existente (por defecto HI-08 y HI-20; se puede marcar cualquiera) pasan a C; Q04 en «sí» o «no se sabe» pasa HI-02 y HI-03 a 1 (96 §2.4). Con MP5 el recorrido queda bloqueado hasta cumplir HI-01 (condición previa, no un hito más). Cada hito explica de dónde sale su prioridad.
4. **Estado de cada hito**: pendiente, en curso, cumplido o convalidado (C). Si hay en este navegador un diagnóstico de T15 con una evaluación **verificada** (o independiente), un hito cuyas preguntas del documento 11 están todas en «Sí» en la más reciente aparece **«cumplido según T15»** (96 §4.3, regla 4). Un estado marcado a mano **no se pisa nunca** (D100, D102): se muestra junto a lo que dice T15 y puede quitarse para volver al automático. Un autodiagnóstico se muestra, pero no marca hitos.
5. **Con el registro T01** (D100): servida desde el sitio, T23 encuentra el registro que T01 tiene guardado y ofrece **«Proponer respuestas desde el registro T01»** para Q01 a Q03: tipos de sistemas de las iniciativas en uso (fase 6 o 7, sin parar ni retirar) según `clasificacion.tecnologia` y `clasificacion.autonomia`, y pilotos en curso (fases 1 a 5) y cuántos son de IA generativa. Las respuestas propuestas se marcan «desde T01» y se pueden editar; una respuesta manual no se sustituye.
6. **Por rol** y **Plan**: la tabla de 96 §5 con la prioridad y el estado de cada hito; el plan para el comité de IA y la dirección se imprime o se guarda como PDF desde el navegador. «Exportar el recorrido (CSV)» (separador «;», UTF-8).
7. **Datos**: exportar e importar el JSON de T23 (respuestas, estados, notas y el resultado calculado).

Los datos se guardan solo en el navegador que se usa (almacenamiento local, clave `seveng-t23-datos-v1`). No se envía nada a terceros. El botón **«Datos: …»** de la barra dice dónde están (ejemplo, este navegador, un fichero del equipo o el servidor de la compañía) y abre el diálogo «Dónde están mis datos» (documento 03 §2.1): guardado automático en un **fichero JSON del equipo** (Edge o Chrome; el mismo que descarga «Exportar») o, en una copia del sitio servida por http en la compañía, el fichero `herramientas/datos/T23_recorrido.json`, que sustituye a los datos de ejemplo.

## Correspondencia de T01 con Q01

| `clasificacion.tecnologia` de una iniciativa en uso | Respuesta de Q01 |
|---|---|
| `reglas` | reglas o RPA |
| `ia_terceros_embebida` | IA de terceros incluida en productos o asistentes |
| `ml_predictivo`, `vision`, `optimizacion`, `lenguaje_documentos` | ML predictivo, visión u optimización |
| `ia_generativa`, o `agente` con autonomía A0 o A1 | IA generativa integrada en procesos |
| `agente` con autonomía A2 o A3, o cualquier iniciativa en uso con autonomía A2 o A3 | agentes que ejecutan acciones (A2/A3) |

## Ficheros

| Fichero | Qué es |
|---|---|
| `recorrido.html` | La herramienta. **Generada**: no se edita a mano. |
| `_fuentes/recorrido.plantilla.html` | Aplicación (HTML, CSS y JavaScript) sin datos. Es lo único que se edita. |
| `recorrido.json` | Arquetipos, regla de asignación, modificadores, cuestionario, etapas, hitos con su prioridad por arquetipo y roles (ES/EN) extraídos del documento 96. **No se edita a mano.** |
| `datos_demo.json` | Ejemplo PP-F (compañía ficticia del registro T01). |
| `ejemplo_pp_b.json` | Segundo ejemplo, PP-B (empresa de servicios ficticia). |
| `build_recorrido.ps1` | Genera `recorrido.html`: `pwsh -File SEVEN-G/herramientas/T23_recorrido_implantacion/build_recorrido.ps1` (con `-Datos <fichero>` arranca con otro JSON de T23; con `-Salida <fichero>` escribe en otra ruta; con `-ActualizarRecorrido` vuelve a extraer `recorrido.json` del documento 96). |

En cada construcción, el script comprueba que `recorrido.json` coincide con el documento 96 en español e inglés (si el documento cambia, la construcción falla hasta regenerarlo con `-ActualizarRecorrido`), que la estructura es la del documento (6 arquetipos, regla en el orden PP-F…PP-A, 5 modificadores, 12 preguntas con el número de respuestas esperado, 5 etapas, 22 hitos con prioridades 1, 2, 3, C, D o ·), que cada pregunta del documento 11 citada existe en el cuestionario de T15 y que los datos de ejemplo usan preguntas, respuestas, hitos y estados válidos.

Para la prueba de humo: `#arquetipo` lleva `data-arquetipo` (en el ejemplo, `PP-F`), `data-rasgos`, `data-modificadores` y `data-bloqueo`; cada fila del cuestionario es `tr[data-pregunta="Q01"]`…; cada hito del recorrido, `tr[data-hito="HI-09"]` con `data-prioridad`, `data-estado` y `data-fuente`; y `window.T23.resultado()` devuelve el arquetipo, los rasgos, los modificadores, el número de preguntas y de hitos, el bloqueo y la prioridad y el estado de cada hito.

## Pendiente

- Validar con el autor los umbrales de asignación y las prioridades por arquetipo (96 §4.2, «a validar»).
- La herramienta no escribe nada en T01 ni en T15.

---

Código MIT · Contenidos CC BY 4.0 · © 2026 Fernando García Varela · Metodología SEVEN-G. La herramienta se ofrece «tal cual», no es asesoramiento y cada organización es responsable de sus datos y decisiones (aviso legal completo en la propia herramienta).
