# AI_CONSULTING

Metodologías de IA de Fernando García Varela: **SEVEN-G** (marco principal), **SPHERES** y **SPAD** (metodologías de apoyo). Repositorio público; sitio publicado en <https://seachad.github.io/AI_CONSULTING/>.

Licencias: código MIT ([LICENSE](LICENSE)); contenidos CC BY 4.0 ([LICENCIA_CONTENIDOS.md](LICENCIA_CONTENIDOS.md)). SEVEN-G es una marca registrada a nombre de Fernando García Varela; no existe certificación oficial ni programa de socios.

## Descargar e instalar en un servidor propio

Todo lo que hay en el sitio funciona sin servidor de aplicaciones: los documentos son ficheros estáticos y las herramientas son un único HTML cada una que guarda los datos **solo en el navegador de quien los introduce** (nunca en el servidor; el autor no puede verlos). Una consultora, un *partner* o un consultor independiente puede descargar este repositorio, alojarlo en su propio servidor y montar una instalación separada por cliente.

- **Descarga**: `git clone https://github.com/seachad/AI_CONSULTING.git` o el ZIP <https://github.com/seachad/AI_CONSULTING/archive/refs/heads/main.zip>.
- **Instalar tal cual**: copiar lo publicable (`index.html`, `en/`, licencias, `SEVEN-G/html|pdf|docx|pptx|herramientas`, `SPHERES/html|pdf`, `SPAD/html|pdf`, sin las carpetas que empiezan por `_`) a cualquier servidor de ficheros estáticos y servirlo por http o https. `pwsh -File SEVEN-G/build/publicar.ps1 -SinGenerar -Destino <carpeta>` prepara esa copia.
- **Adaptar y regenerar**: editar el Markdown y ejecutar `pwsh -File SEVEN-G/build/build.ps1` (PowerShell 7 y Microsoft Edge). El panel del consejo se regenera solo en el navegador; el generador en Python (T17, Python 3.11 con `uv`) es opcional, para publicarlo como ficheros estáticos.
- **Una instalación por cliente**: un origen web distinto por cliente (subdominio, dominio o puerto) y, en su copia, la carpeta `SEVEN-G/herramientas/datos/` con el registro exportado del cliente (`T01_registro.json`): las herramientas y el panel del consejo lo cargan en lugar de los datos de ejemplo.

El procedimiento completo —cómo funciona el sitio, dónde están los datos, qué sale del navegador, copia de seguridad, instalación, lista de comprobación por cliente y actualización— está en el documento 95: [Dónde están sus datos y cómo instalar SEVEN-G en un servidor propio](https://seachad.github.io/AI_CONSULTING/SEVEN-G/html/es/95_SEVEN-G_Datos_en_local_e_instalacion_propia.html) ([English](https://seachad.github.io/AI_CONSULTING/SEVEN-G/html/en/95_SEVEN-G_Datos_en_local_e_instalacion_propia.html)). Las condiciones de uso por terceros están en el documento 93 y las reglas para consultores en el 91.

## SEVEN-G

Marco de valor, gobierno y transformación con IA. Proyecto vivo.

| Carpeta | Contenido |
|---|---|
| `SEVEN-G/mds/es/` · `SEVEN-G/mds/en/` | Fuentes Markdown en español (redacción) e inglés (traducción): documentos 00–95, plantillas P01–P74 y curso M00–M09 |
| `SEVEN-G/html/` · `SEVEN-G/pdf/` | Documentos generados en HTML (con índice de la biblioteca por idioma y el índice de códigos `codigos.js`) y en PDF |
| `SEVEN-G/docx/` · `SEVEN-G/pptx/` | Plantillas editables en Word y cursos en presentación |
| `SEVEN-G/herramientas/` | Herramientas sin servidor: T01 registro de iniciativas (con T02–T06 y T18 como vistas), T11 calculadora de valor (con T13), T14 índice de transformación, T15 diagnóstico de madurez, T17 generador del panel del consejo (Python) y la página de comunidad |
| `SEVEN-G/build/` | Generador común (SEVEN-G, SPHERES y SPAD), plantilla, estilo, componentes gráficos, índice de códigos, guía de traducción, servidor local de revisión y pruebas de coherencia |
| `SEVEN-G/_legacy/` | Materiales anteriores, no vigentes; solo como fuente de consulta |

## SPHERES y SPAD

Metodologías de apoyo de SEVEN-G (en construcción). SPHERES: nueve esferas de impacto y tres niveles de ambición de la IA. SPAD: ingeniería guiada por instrucciones estructuradas para construir con IA. Misma jerarquía de carpetas que SEVEN-G (`mds`, `html`, `pdf`, `build/componentes`, `_legacy`); los componentes comunes están en `SEVEN-G/build/componentes/`.

## Generación y revisión

Generar todos los documentos de las tres metodologías (requiere PowerShell 7 y Microsoft Edge):

```
pwsh -File SEVEN-G/build/build.ps1
```

Solo una metodología: `pwsh -File SEVEN-G/build/build.ps1 -Metodologias SPHERES`; un documento: `-Filter '03_*.md'`. Revisión local del sitio completo: `pwsh -File SEVEN-G/build/servidor.ps1` y abrir `http://localhost:8765/`. Pruebas de coherencia antes de publicar: `pwsh -File SEVEN-G/build/verificar_coherencia.ps1`.

Empieza por la portada del sitio, `index.html` (español) o `en/index.html` (inglés), que presenta SEVEN-G (marco principal) y las metodologías de apoyo SPHERES y SPAD.

## Publicación (GitHub Pages)

El repositorio contiene material de trabajo (`_trabajo`, `_legacy`, `.claude`, fuentes de trabajo de SPAD) que **no se publica** en el sitio. El flujo `.github/workflows/pages.yml` copia solo lo publicable (portada, licencias, `SEVEN-G/html|pdf|docx|pptx|herramientas`, `SPHERES/html|pdf` y `SPAD/html|pdf`), comprueba que no haya textos internos y lo despliega en GitHub Pages en cada *push* a `main`, con *Settings → Pages → Source: GitHub Actions*. Un *fork* hereda el flujo. Alternativa manual: `pwsh -File SEVEN-G/build/publicar.ps1` prepara la misma copia limpia en otra carpeta.

Antes de publicar, `verificar_coherencia.ps1` pasa también la lista privada de términos prohibidos del autor (`%USERPROFILE%\.seveng\terminos_prohibidos.txt`, fuera de cualquier repositorio), cuando existe.
