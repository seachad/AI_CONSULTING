# AI_CONSULTING
Metodologías de AI: SEVEN_G, SPAD y AECF

## SEVEN-G

Marco de valor, gobierno y transformación con IA. Proyecto vivo.

| Carpeta | Contenido |
|---|---|
| `SEVEN-G/mds/es/` · `SEVEN-G/mds/en/` | Fuentes Markdown en español (redacción) e inglés (traducción): documentos 00–93 y plantillas P01–P31 |
| `SEVEN-G/html/` | Documentos generados en HTML, con índice de la biblioteca por idioma |
| `SEVEN-G/pdf/` | Documentos generados en PDF |
| `SEVEN-G/herramientas/` | Herramientas sin servidor (T01 · Registro de iniciativas) |
| `SEVEN-G/build/` | Generador, plantilla, estilo, componentes gráficos, guía de traducción y servidor local de revisión |
| `SEVEN-G/_legacy/` | Materiales anteriores, no vigentes; solo como fuente de consulta |

Generar todos los documentos (requiere PowerShell 7 y Microsoft Edge o Google Chrome):

```
pwsh -File SEVEN-G/build/build.ps1
```

Empieza por la portada del sitio, `index.html` (español) o `en/index.html` (inglés), que presenta SEVEN-G (marco principal) y las metodologías de apoyo SPHERES y SPAD (en construcción).

## Publicación (GitHub Pages)

Este repositorio es privado y contiene material de trabajo (`_trabajo`, `_legacy`, `.claude`, fuentes de SPAD y Espheres) que **no se publica**. Solo se publican la portada (`index.html`, `en/index.html`), las licencias y `SEVEN-G/html`, `SEVEN-G/pdf` y `SEVEN-G/herramientas`.

**Opción A · Desde este repositorio (recomendada).** El flujo `.github/workflows/pages.yml` copia solo lo publicable, comprueba que no haya textos internos y lo despliega en GitHub Pages en cada *push* a `main`. Pasos: (1) generar y confirmar las salidas (`pwsh -File SEVEN-G/build/build.ps1`, `git add`, `git commit`, `git push`); (2) en GitHub, *Settings → Pages → Source: GitHub Actions*. El sitio queda en `https://seachad.github.io/AI_CONSULTING/` (público, aunque el repositorio sea privado; Pages en repositorios privados requiere plan Pro, Team o Enterprise).

**Opción B · Copia a un repositorio público aparte.** Si el plan de GitHub no admite Pages en repositorios privados, `pwsh -File SEVEN-G/build/publicar.ps1` prepara una copia limpia y verificada en otra carpeta (parámetro `-Destino`) para subirla a un repositorio público.

En ambos casos, antes de publicar, pasar la lista privada de términos prohibidos (`%USERPROFILE%\.seveng\terminos_prohibidos.txt`, fuera de cualquier repositorio) con `publicar.ps1`, que la comprueba.

Licencias: código MIT ([LICENSE](LICENSE)); contenidos CC BY 4.0 ([LICENCIA_CONTENIDOS.md](LICENCIA_CONTENIDOS.md)).
