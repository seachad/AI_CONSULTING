# Informe de sesión (artifact) · estándar

Toda sesión de Claude en AI_CONSULTING crea **su propio informe de sesión** como artifact de claude.ai **en su primera respuesta, sin que el autor lo pida**, y lo actualiza (republicando a la misma dirección) **en cada petición**. Es el mismo estándar que el proyecto GEMA.

## Cómo se hace

1. Copiar `modelo.html` a `.claude/sesiones/AAAA-MM-DD_<tema-corto>.html` y cambiar solo el contenido; el CSS, la barra, el tema y el script no se tocan.
2. Publicar con la herramienta Artifact (`icon: "checklist"`, sin `capabilities`: es una página estática). Guardar la dirección en la línea `meta` («Artifact: abrir en el panel») y decírsela al autor.
3. En cada petición: añadir el pedido y lo hecho al Resumen, mover lo terminado a «Ya está hecho», ajustar «Ahora», cambiar «Última actualización» (hora de Madrid) y republicar el mismo fichero.
4. Hacer commit del fichero junto con el resto del trabajo de la sesión. `.claude/` no se publica en el sitio.

## Estructura obligatoria

- **Barra fija** con las pestañas **Resumen · Qué falta** y el selector de tema **Sistema · Claro · Oscuro** (se recuerda en el navegador).
- **Cabecera**: título (nombre del hilo, dos a cuatro palabras), una frase de qué se busca y el **anillo** «n de m pasos hechos».
- **Línea meta**: hilo, empezado, última actualización, rama, enlace al artifact, «Hora de Madrid».
- **Resumen**: «Lo pedido y lo hecho» por fecha, con etiquetas *Pedido* (cita literal del autor), *Hecho* (con commit), *Decisión* y *Prueba real*; y «Tests» (lo que pasó, lo no ejecutado y por qué, lo pendiente de prueba humana).
- **Qué falta**: filtros por quién lo hace (Todo · Lo mío · Lo que hace Claude · terceros), un recorrido de 3–4 pasos si ayuda, «Ya está hecho» y «Ahora, en este orden»: cada paso con casilla, qué es, **Por qué hace falta** y **Desbloquea**, etiquetas de quién y estado, y «Ver cómo» con los pasos concretos cuando los haya.
- Pie: las casillas se guardan solo en este navegador y dónde está el detalle completo.

Colores: verde = hecho, ámbar = te toca, violeta = Claude, rosa = terceros.
