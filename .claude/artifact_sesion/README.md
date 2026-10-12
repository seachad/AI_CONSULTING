# Informe de sesión (artifact) · estándar

El informe es **la guía para continuar la sesión**. Toda sesión de Claude en AI_CONSULTING lo crea **en su primera respuesta, sin que el autor lo pida**, y lo vuelve a publicar a la misma dirección **en cada petición**. Todo lo que haya que hacer con Claude, incluidas las preguntas que el autor debe responder, está en el informe con su botón para enviar a Claude. Si en la sesión se pide algo nuevo, se añade al informe; la sesión termina cuando el informe no tiene nada pendiente. Mismo layout que GEMA.

## Ficheros

| Fichero | Para qué |
|---|---|
| `generar.py` | Genera el HTML desde el JSON de la sesión: `python .claude/artifact_sesion/generar.py .claude/sesiones/AAAA-MM-DD_tema.json` |
| `estilo.css`, `informe.js` | Estilo y comportamiento comunes; el generador los incrusta (la página es un solo fichero). No se copian a mano. |
| `modelo.json` / `modelo.html` | Ejemplo completo (el informe del Asistente SEVEN-G). |

## Cómo se hace

1. Copiar `modelo.json` a `.claude/sesiones/AAAA-MM-DD_<tema>.json` y escribir el contenido de la sesión.
2. Generar el HTML y publicarlo con la herramienta Artifact: `icon: "checklist"` y **`capabilities: {"comments": {}}`** (sin esa capacidad los botones solo copian el mensaje). Poner en el JSON `url` (dirección del artifact) y `sesion_url` (`https://claude.ai/code/<id de sesión>`), regenerar y volver a publicar. Dar el enlace al autor.
3. **En cada petición**: añadir el pedido (cita literal) y lo hecho (con commit) a `tl`; pasar lo terminado a `done`; añadir, quitar o reordenar `steps`; cambiar `act` (hora de Madrid); regenerar y publicar a la misma dirección.
4. **Cuando llega un comentario enviado desde el informe** (empieza por `[Informe de sesión · …]`): hacer lo que pide o responder la pregunta, contestar en el hilo del comentario y actualizar el informe.
5. Subir el JSON y el HTML con el resto del trabajo de la sesión. `.claude/` no se publica en el sitio.

## Qué lleva el JSON

- Cabecera: `title`, `h1`, `lead`, `hilo`, `inicio`, `act`, `rama`, `url`, `sesion_url`, `key` (clave única para el almacenamiento del navegador), `persona` (rótulo de terceros), `rapidos` (botones rápidos de «Hablar con Claude»).
- `tl`: «Lo pedido y lo hecho» (`k`: pedido, hecho, decision, prueba). `tests`: estado de las pruebas.
- `done`: lo ya hecho. `flow` (opcional): recorrido de 3–4 pasos.
- `steps`: cada paso con `id`, `who` (tu, claude, persona), `tags` (tu, tudec, claude, persona), `h`, `p`, `why` (**Por qué hace falta** y **Desbloquea**), `nota`, `more` (pasos concretos) y una de estas dos:
  - `accion`: `{boton, msg}` → botón que envía `msg` a Claude (por ejemplo, «Seguir con esto»).
  - `preguntas`: `[{id, q, opciones, recomendada}]` y `boton` → el autor elige o escribe y envía todas las respuestas juntas.

Todo paso que dependa de Claude lleva `accion`; toda decisión o pregunta al autor lleva `preguntas`. Arriba, «Hablar con Claude» sirve para pedir algo nuevo.

## Cómo llega a la sesión

Los botones usan `sendToClaude` de la capacidad `comments`: se publica un comentario en el informe y se avisa a la sesión que vigila el artifact (la que lo publicó). Si nadie lo escucha o no hay permiso, el botón copia el mensaje para pegarlo en la sesión. La primera vez el navegador pide permiso para escribir comentarios.
