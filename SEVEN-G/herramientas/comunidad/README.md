# Comunidad SEVEN-G · incidencias y peticiones con votos

*English version: [README_en.md](README_en.md).*

Página pública donde cualquier persona puede **enviar una incidencia o una petición de mejora** de SEVEN-G, SPHERES o SPAD, **ver las que ya existen y votarlas**, sin cuenta de GitHub, sin correo y sin seguimiento. La regla está a la vista: **solo se abordan las peticiones que reúnen un número relevante de votos de la comunidad**; las incidencias se corrigen según su gravedad.

> **Aviso legal.** Se ofrece «tal cual», sin garantía. Enviar o votar una petición no obliga al autor a atenderla ni crea ninguna relación de servicio. Cada organización que use SEVEN-G es la única responsable de su propio cumplimiento regulatorio.

## Por qué importa

Un marco abierto mejora con quien lo usa, pero pedir un correo para opinar convierte la opinión en captación de contactos. Aquí la persona elige un **identificador** (un apodo), que se guarda solo en su navegador, no se vuelve a pedir y puede cambiar cuando quiera. **El contacto con el autor lo decide siempre la persona usuaria**, nunca al revés.

## Cómo funciona

| Pieza | Qué hace |
|---|---|
| `index.html` | Página (ES/EN, sin dependencias ni recursos de terceros): reglas, identificador, lista con filtros y votos, y formulario de envío. |
| `worker/worker.js` | Intermediario mínimo (Cloudflare Worker, plan gratuito). Guarda el token de GitHub como secreto y crea los issues y registra los votos **con la cuenta del autor**. Un token nunca puede ir en una página: cualquiera lo leería. |
| Repositorio público de issues | Por defecto `seachad/seven-g-feedback`. Ahí responde y cierra el autor. Todo es público y auditable. |

- **Datos.** El identificador de quien envía y la lista de votantes van en el propio issue, en un bloque oculto al final del texto (`<!-- seveng:{…} -->`), junto a un recuento visible. No hay base de datos.
- **Reconocimiento de contribuciones.** Cuando una incidencia o petición se incorpora a la metodología, el autor cita en ella a quien la aportó, por su identificador. No implica titularidad ni coautoría ni modifica la propiedad intelectual, que sigue siendo del autor bajo las licencias publicadas. La página lo dice junto al formulario.
- **Un voto por identificador** (sin distinguir mayúsculas), que se puede retirar. Quien envía cuenta como primer voto. Los issues cerrados no admiten votos.
- **Qué issues se muestran.** Solo los que llevan la etiqueta `comunidad` (el intermediario la pone, con `peticion` o `incidencia`). Las demás etiquetas que añada el autor (por ejemplo `planificada`) se muestran como chapas. Un issue cerrado como *not planned* aparece como «No previsto»; los demás cierres, como «Resuelto».
- **Protecciones.** Las menciones (`@nombre`) se neutralizan para que nadie pueda avisar a terceros con la cuenta del autor; no se admite HTML de comentario en el texto; campo trampa contra robots; límite de envíos y votos por hora y dirección (la IP solo se usa resumida con SHA-256, durante una hora como máximo, y no se guarda); las escrituras solo se aceptan desde los orígenes configurados.
- **Límites conocidos (versión 0.1).** El identificador no es una cuenta: alguien puede usar el de otra persona o votar con varios. Es un compromiso consciente a cambio de no pedir datos; el autor valora los votos con ese criterio y puede cerrar o editar envíos abusivos en GitHub. Si el abuso creciera, el siguiente paso es añadir una prueba anti-robots sin seguimiento en el intermediario.

## Puesta en marcha (una sola vez, unos 15 minutos)

Hasta completar estos pasos la página funciona en **solo lectura** y avisa de que el envío no está activado. En el sitio de SEVEN-G ya están hechos (en servicio desde el 21-09-2026); se conservan para quien reutilice la página y para renovar el token cuando caduque. Conviene desactivar los registros (*Logs*) del Worker, que vienen activados por defecto, para no guardar metadatos de las peticiones.

1. **Repositorio.** Crear en GitHub el repositorio **público** `seachad/seven-g-feedback`, con *Issues* activado. Conviene un README breve que enlace a la página de comunidad.
2. **Token.** En GitHub → *Settings → Developer settings → Personal access tokens → Fine-grained tokens*: token con acceso **solo a ese repositorio** y el permiso **Issues: Read and write**. Ningún otro permiso. Anotar la fecha de caducidad para renovarlo.
3. **Intermediario.** En Cloudflare (cuenta gratuita) → *Workers & Pages → Create → Worker*: pegar el contenido de `worker/worker.js` y desplegar. En *Settings → Variables and Secrets*:
   - `GITHUB_TOKEN` (tipo **Secret**): el token del paso 2.
   - `REPO`: `seachad/seven-g-feedback`
   - `ORIGENES`: `https://seachad.github.io,http://localhost:8765`
   - opcionales: `LIMITE_ENVIOS` (por defecto 5 por hora) y `LIMITE_VOTOS` (por defecto 60 por hora).
4. **Página.** En `index.html`, bloque `<script id="config">`: poner en `endpoint` la URL del Worker (por ejemplo `https://seven-g-comunidad.<cuenta>.workers.dev`, sin barra final) y, si se quiere mostrar, `umbralVotos`. Publicar.
5. **Comprobar.** Abrir la página, elegir un identificador, enviar una petición de prueba y votarla; después cerrarla en GitHub.

El token solo vive en Cloudflare. **Nunca** se escribe en este repositorio ni en la página; `verificar_coherencia.ps1` comprueba que no aparece ninguno.

## Pruebas

Con `pwsh -File SEVEN-G/build/servidor.ps1`:

- `/SEVEN-G/herramientas/comunidad/_pruebas/prueba_worker.html`: ejecuta el intermediario en el navegador contra un GitHub simulado en memoria (validaciones, votos, caché, límites, neutralización de menciones).
- `/SEVEN-G/herramientas/comunidad/_pruebas/prueba_pagina.html`: abre la página real conectada a ese intermediario simulado, con casos ficticios, para probar envío y voto sin salir a la red.

La carpeta `_pruebas` no se publica.

## Licencia

Código MIT · textos CC BY 4.0 · © 2026 Fernando García Varela.
