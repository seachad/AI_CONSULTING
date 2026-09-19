<#
.SYNOPSIS
  Genera HTML y PDF de las metodologías SEVEN-G, SPHERES y SPAD en español e inglés a partir de las fuentes Markdown.

.DESCRIPTION
  Metodologías: SEVEN-G (marco principal), SPHERES y SPAD (metodologías de apoyo). Cada una vive en su carpeta de la raíz
                del repositorio (<M> = SEVEN-G, SPHERES o SPAD) con la misma jerarquía; este generador es común a todas.
  Fuentes:      <M>/mds/<idioma>/**/*.md          (idiomas: es, en)
  Salidas:      <M>/html/<idioma>/**/<nombre>.html (un solo fichero, con barra de herramientas)
                <M>/html/<idioma>/index.html       (índice de la biblioteca por bloques; sin PDF; excluye _trabajo)
                <M>/pdf/<idioma>/**/<nombre>.pdf   (impreso con Edge o Chrome sin ventana)
  Diseño:       build/plantilla.html + build/estilo.css (periódico económico en tonos salmón), comunes
  Componentes:  <M>/build/componentes/<idioma>/<nombre>.html y, si no existe ahí, build/componentes/<idioma>/<nombre>.html
  Herramientas: SEVEN-G/herramientas/ (SPHERES y SPAD enlazan las de SEVEN-G)
  Traducción:   build/guia_traduccion_en.md (reglas y glosario obligatorio)

  Regla: todo documento existe en español y en inglés con el mismo nombre de fichero.
  El generador avisa si falta la versión en algún idioma.

  Regla operativa del repositorio:
    - La fuente de verdad es el Markdown; HTML y PDF son artefactos generados.
    - HTML y PDF deben estar sincronizados con la fuente y entre sí.
    - Cada HTML incluye una zona de descargas con los enlaces a los PDFs equivalentes de su idioma y, cuando exista, a la versión paralela del otro idioma.
    - Todo cambio en un idioma se replica en la versión equivalente del otro idioma en la misma entrega.

  Convenciones del Markdown:
    # Título                                  -> portada
    Primer párrafo tras el título             -> entradilla
    Primera tabla tras el título (ficha)      -> datos de portada
                                                 es: Documento, Versión, Fecha, Autor, Estado, Tipo, Objetivo
                                                 en: Document, Version, Date, Author, Status, Type, Objective
    <!-- cifras: 9 | texto ; 3 | texto -->    -> cifras destacadas de la portada (justo después de la ficha)
    ## 1. Sección                             -> sección numerada con antetítulo, índice y navegador
    <!-- figura: nombre -->                   -> inserta build/componentes/<idioma>/nombre.html
    <!-- esencial: nivel | texto -->          -> recuadro «Lo esencial» (D75): nivel = siempre, enterprise, condicional, recomendado o consulta
                                                 (la palabra clave no se traduce); enlaza con la matriz de obligatoriedad (documento 94)
    <!-- grafico: Título | Subtítulo -->      -> título y subtítulo del diagrama Mermaid que va justo debajo
    ```mermaid ... ```                        -> diagrama Mermaid con los colores del tema activo

  Requisitos: PowerShell 7+ (ConvertFrom-Markdown) y Microsoft Edge o Google Chrome.

.EXAMPLE
  pwsh -File build/build.ps1                          # ambas metodologías, todos los documentos, ambos idiomas
  pwsh -File build/build.ps1 -Metodologias SPHERES    # solo una metodología
  pwsh -File build/build.ps1 -Filter 00_*             # solo los que coinciden
  pwsh -File build/build.ps1 -Idiomas es              # solo un idioma
  pwsh -File build/build.ps1 -SinPdf                  # solo HTML
#>
param(
  [ValidateSet('SEVEN-G', 'SPHERES', 'SPAD')]
  [string[]]$Metodologias = @('SEVEN-G', 'SPHERES', 'SPAD'),
  [string]$Filter = '*.md',
  [string[]]$Idiomas = @('es', 'en'),
  [switch]$SinPdf
)

$ErrorActionPreference = 'Stop'
$repo     = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
$template = Get-Content (Join-Path $PSScriptRoot 'plantilla.html') -Raw -Encoding utf8
$css      = Get-Content (Join-Path $PSScriptRoot 'estilo.css') -Raw -Encoding utf8
$todos    = @('es', 'en')
$herrRaiz = Join-Path $repo 'SEVEN-G\herramientas'

# ---- Configuración de cada metodología ----
# bloques: bloques del índice y del panel de documentos; Bloque: bloque de un documento (ruta relativa) o $null si no entra en el índice.
$configuracion = @{
  'SEVEN-G' = @{
    marca = 'SEVEN-G'
    inicio = '00_SEVEN-G_Que_es_y_para_que_sirve'
    todasHerramientas = '03_*'
    es = @{ T_TT_INICIO = 'Ir al documento 00: Qué es SEVEN-G y para qué sirve'; T_METODOLOGIA = 'Metodología SEVEN-G'
            Indice = 'Biblioteca SEVEN-G'; IndiceSub = 'Documentos, plantillas y herramientas del marco de valor, gobierno y transformación con IA' }
    en = @{ T_TT_INICIO = 'Go to document 00: What SEVEN-G is and how it helps companies'; T_METODOLOGIA = 'SEVEN-G methodology'
            Indice = 'SEVEN-G Library'; IndiceSub = 'Documents, templates and tools of the framework for value, governance and transformation with AI' }
    bloques = @{
      es = [ordered]@{ A = 'A · Fundamentos'; B = 'B · Estrategia y cartera'; C = 'C · Ciclo de vida de la iniciativa'; D = 'D · Gobierno, riesgo y cumplimiento'; E = 'E · Medición y valor'; F = 'F · Personas, datos y operación'; G = 'G · Consejo'; H = 'H · Plantillas'; I = 'I · Herramientas'; J = 'J · Adopción del marco'; K = 'K · Curso' }
      en = [ordered]@{ A = 'A · Foundations'; B = 'B · Strategy and portfolio'; C = 'C · Initiative lifecycle'; D = 'D · Governance, risk and compliance'; E = 'E · Measurement and value'; F = 'F · People, data and operations'; G = 'G · Board'; H = 'H · Templates'; I = 'I · Tools'; J = 'J · Framework adoption'; K = 'K · Course' }
    }
    Bloque = {
      param([string]$rel)
      if ($rel -like 'plantillas/*') { return 'H' }
      if ($rel -like 'curso/*') { return 'K' }   # curso de SEVEN-G (D75): módulos que enlazan a los documentos, no cuentan como documentos
      if ($rel -match '^(\d)\d_') { return @{ '0'='A'; '1'='B'; '2'='C'; '3'='D'; '4'='E'; '5'='F'; '6'='G'; '9'='J' }[$Matches[1]] }
      return $null
    }
  }
  'SPHERES' = @{
    marca = 'SPHERES'
    inicio = '00_SPHERES_Que_es_y_para_que_sirve'
    todasHerramientas = $null
    es = @{ T_TT_INICIO = 'Ir al documento 00: Qué es SPHERES y para qué sirve'; T_METODOLOGIA = 'Metodología SPHERES'
            Indice = 'Biblioteca SPHERES'; IndiceSub = 'Documentos de la metodología de esferas de impacto y niveles de ambición de la IA' }
    en = @{ T_TT_INICIO = 'Go to document 00: What SPHERES is and how it helps'; T_METODOLOGIA = 'SPHERES methodology'
            Indice = 'SPHERES Library'; IndiceSub = 'Documents of the methodology of AI impact spheres and ambition levels' }
    bloques = @{
      es = [ordered]@{ A = 'A · Fundamentos'; B = 'B · Las esferas'; C = 'C · Consejo' }
      en = [ordered]@{ A = 'A · Foundations'; B = 'B · The spheres'; C = 'C · Board' }
    }
    Bloque = {
      param([string]$rel)
      if ($rel -match '^(\d{2})_') { $n = [int]$Matches[1]; if ($n -le 1) { return 'A' } elseif ($n -le 4) { return 'B' } else { return 'C' } }
      return $null
    }
  }
  'SPAD' = @{
    marca = 'SPAD'
    inicio = '00_SPAD_Que_es_y_para_que_sirve'
    todasHerramientas = $null
    es = @{ T_TT_INICIO = 'Ir al documento 00: Qué es SPAD y para qué sirve'; T_METODOLOGIA = 'Metodología SPAD'
            Indice = 'Biblioteca SPAD'; IndiceSub = 'Documentos del marco de desarrollo de software con IA secuencial, bloqueante y auditable' }
    en = @{ T_TT_INICIO = 'Go to document 00: What SPAD is and how it helps'; T_METODOLOGIA = 'SPAD methodology'
            Indice = 'SPAD Library'; IndiceSub = 'Documents of the sequential, blocking and auditable framework for AI-assisted software development' }
    bloques = @{
      es = [ordered]@{ A = 'A · Fundamentos'; B = 'B · Método'; C = 'C · Aplicación' }
      en = [ordered]@{ A = 'A · Foundations'; B = 'B · Method'; C = 'C · Application' }
    }
    Bloque = {
      param([string]$rel)
      if ($rel -match '^(\d{2})_') { $n = [int]$Matches[1]; if ($n -le 1) { return 'A' } elseif ($n -le 5) { return 'B' } else { return 'C' } }
      return $null
    }
  }
}

$textos = @{
  es = @{
    T_BARRA = 'Herramientas del documento'; T_BUSCAR = 'Buscar en el documento'; T_ANTERIOR = 'Resultado anterior'; T_SIGUIENTE = 'Resultado siguiente'
    T_INDICE = 'Índice'; T_INDICE_CORTO = 'Índice'; T_CERRAR = 'Cerrar'; T_FILTRAR = 'Filtrar secciones'; T_TEMA = 'Tema'
    T_INICIO = 'Inicio'; T_BIBLIOTECA = 'Biblioteca'; T_HISTORIAL = 'Historial'; T_DOCUMENTOS = 'Documentos'
    T_HISTORIAL_TITULO = 'Historial de navegación'; T_FILTRAR_DOCUMENTOS = 'Filtrar documentos'; T_HISTORIAL_VACIO = 'Todavía no hay navegación registrada.'
    T_CERRAR_PANEL = 'Cerrar panel'; T_HORA = 'Hora'; T_DESCARGAS = 'Descargas'
    T_TT_INICIO = 'Ir al documento 00: Qué es SEVEN-G y para qué sirve'
    T_PORTADA = 'Portada'; T_TT_PORTADA = 'Ir a la portada de AI Consulting · SEACHAD (todas las metodologías)'
    T_TT_BIBLIOTECA = 'Abrir biblioteca de documentos del idioma actual'
    T_TT_HISTORIAL = 'Ver historial de navegación de este idioma'
    T_TT_INDICE = 'Abrir índice de secciones del documento actual'
    T_TT_TEXTO_MENOS = 'Reducir tamaño del texto'
    T_TT_TEXTO_MAS = 'Aumentar tamaño del texto'
    T_GENERADO_IA = 'Contenido generado y maquetado con apoyo de IA bajo supervisión editorial de SEACHAD.'
    T_TEMA_SALMON = 'Salmón'; T_TEMA_CLARO = 'Salmón claro'; T_TEMA_NOCHE = 'Noche'; T_IDIOMA = 'Idioma'
    T_SIN_RESULTADOS = 'Sin resultados'; T_METODOLOGIA = 'Metodología SEVEN-G'; T_GENERADO = 'Generado el'
    EnEsteDocumento = 'En este documento'; Version = 'Versión'; NoDisponible = 'Versión no disponible'
    Ficha = @{ Documento = 'Documento'; Version = 'Versión'; Fecha = 'Fecha'; Autor = 'Autor'; Estado = 'Estado'; Tipo = 'Tipo'; Objetivo = 'Objetivo' }
  }
  en = @{
    T_BARRA = 'Document tools'; T_BUSCAR = 'Search this document'; T_ANTERIOR = 'Previous result'; T_SIGUIENTE = 'Next result'
    T_INDICE = 'Contents'; T_INDICE_CORTO = 'Contents'; T_CERRAR = 'Close'; T_FILTRAR = 'Filter sections'; T_TEMA = 'Theme'
    T_INICIO = 'Home'; T_BIBLIOTECA = 'Library'; T_HISTORIAL = 'History'; T_DOCUMENTOS = 'Documents'
    T_HISTORIAL_TITULO = 'Navigation history'; T_FILTRAR_DOCUMENTOS = 'Filter documents'; T_HISTORIAL_VACIO = 'No navigation recorded yet.'
    T_CERRAR_PANEL = 'Close panel'; T_HORA = 'Time'; T_DESCARGAS = 'Downloads'
    T_TT_INICIO = 'Go to document 00: What SEVEN-G is and how it helps companies'
    T_PORTADA = 'Home'; T_TT_PORTADA = 'Go to the AI Consulting · SEACHAD home page (all methodologies)'
    T_TT_BIBLIOTECA = 'Open the document library for the current language'
    T_TT_HISTORIAL = 'View navigation history for this language'
    T_TT_INDICE = 'Open section index for the current document'
    T_TT_TEXTO_MENOS = 'Decrease text size'
    T_TT_TEXTO_MAS = 'Increase text size'
    T_GENERADO_IA = 'Content generated and typeset with AI support under SEACHAD editorial supervision.'
    T_TEMA_SALMON = 'Salmon'; T_TEMA_CLARO = 'Light salmon'; T_TEMA_NOCHE = 'Night'; T_IDIOMA = 'Language'
    T_SIN_RESULTADOS = 'No results'; T_METODOLOGIA = 'SEVEN-G methodology'; T_GENERADO = 'Generated on'
    EnEsteDocumento = 'In this document'; Version = 'Version'; NoDisponible = 'Version not available'
    Ficha = @{ Documento = 'Document'; Version = 'Version'; Fecha = 'Date'; Autor = 'Author'; Estado = 'Status'; Tipo = 'Type'; Objetivo = 'Objective' }
  }
}

$browser = @(
  "${env:ProgramFiles(x86)}\Microsoft\Edge\Application\msedge.exe",
  "$env:ProgramFiles\Microsoft\Edge\Application\msedge.exe",
  "$env:ProgramFiles\Google\Chrome\Application\chrome.exe"
) | Where-Object { Test-Path $_ } | Select-Object -First 1
if (-not $SinPdf -and -not $browser) { throw 'No se encuentra Edge ni Chrome para generar PDF.' }

$mermaidScript = @'
<script type="module">
import mermaid from 'https://cdn.jsdelivr.net/npm/mermaid@11/dist/mermaid.esm.min.mjs';
const bloques = [...document.querySelectorAll('pre.mermaid')];
bloques.forEach(b => { b.dataset.fuente = b.textContent; });
let ronda = 0;
async function dibujar() {
  const v = n => getComputedStyle(document.documentElement).getPropertyValue(n).trim();
  mermaid.initialize({
    startOnLoad: false, securityLevel: 'strict', theme: 'base',
    flowchart: { curve: 'basis', padding: 14, nodeSpacing: 36, rankSpacing: 46 },
    themeVariables: {
      fontFamily: '"Libre Franklin","Segoe UI",sans-serif', fontSize: '15px',
      background: v('--papel'), primaryColor: v('--papel-2'), primaryBorderColor: v('--oxford'), primaryTextColor: v('--tinta'),
      secondaryColor: v('--papel-3'), tertiaryColor: v('--papel'), lineColor: v('--tinta-2'), textColor: v('--tinta'),
      clusterBkg: v('--papel-2'), clusterBorder: v('--regla'), edgeLabelBackground: v('--papel'),
      cScale0: v('--oxford'), cScaleLabel0: '#ffffff', cScale1: v('--teal'), cScaleLabel1: '#ffffff',
      cScale2: v('--velvet'), cScaleLabel2: '#ffffff', cScale3: v('--claret'), cScaleLabel3: '#ffffff'
    }
  });
  ronda++;
  for (let i = 0; i < bloques.length; i++) {
    const { svg } = await mermaid.render('diagrama-' + ronda + '-' + i, bloques[i].dataset.fuente);
    bloques[i].innerHTML = svg;
  }
  document.body.dataset.diagramas = 'listos';
}
window.sevengDiagramas = dibujar;
await dibujar();
</script>
'@

function Limpiar([string]$s) { ([regex]::Replace($s, '<[^>]+>', '')).Trim() }
function Slug([string]$s) {
  $n = (Limpiar $s).ToLowerInvariant().Normalize([Text.NormalizationForm]::FormD)
  $n = -join ($n.ToCharArray() | Where-Object { [Globalization.CharUnicodeInfo]::GetUnicodeCategory($_) -ne 'NonSpacingMark' })
  ([regex]::Replace($n, '[^a-z0-9]+', '-')).Trim('-')
}
function Enc([string]$s) { [Net.WebUtility]::HtmlEncode($s) }
function Set-ContentUtf8ConReintento([string]$Path, [string]$Value, [int]$Intentos = 8, [int]$EsperaMs = 200) {
  for ($i = 1; $i -le $Intentos; $i++) {
    try {
      Set-Content -Path $Path -Value $Value -Encoding utf8 -NoNewline
      return
    }
    catch [System.IO.IOException] {
      if ($i -eq $Intentos) { throw }
      [System.Threading.Thread]::Sleep($EsperaMs)
    }
  }
}
function BloqueNavegacion([string]$rel) {
  $claves = @($bloquesIndice.es.Keys)
  if ($rel -eq 'index.md') { return $claves[0] }
  $b = & $cfg.Bloque $rel
  if ($b) { return $b }
  return $claves[-1]
}

# ---- Recuentos de la biblioteca para los componentes ----
# Un componente puede escribir {{N_DOCUMENTOS}}, {{N_PLANTILLAS}} y {{N_HERRAMIENTAS}}: se sustituyen por los mismos recuentos
# que muestra el índice, para que no queden desfasados al añadir un documento, una plantilla o una herramienta.
function Recuentos-Biblioteca([string]$lang) {
  $dir = Join-Path $root "mds\$lang"
  $nDocs = 0; $nPlant = 0; $nHerr = 0
  foreach ($d in (Get-ChildItem $dir -Recurse -File -Filter '*.md' | Where-Object { $_.FullName -notmatch '[\\/]_trabajo[\\/]' })) {
    $b = & $cfg.Bloque ([IO.Path]::GetRelativePath($dir, $d.FullName) -replace '\\', '/')
    if (-not $b) { continue }
    if ($b -eq 'H') { $nPlant++ } elseif ($b -ne 'K') { $nDocs++ }
  }
  if (Test-Path $herrRaiz) {
    foreach ($h in (Get-ChildItem $herrRaiz -Directory)) {
      if (Get-ChildItem $h.FullName -File -Filter '*.html' | Where-Object Name -notlike '_*' | Select-Object -First 1) { $nHerr++ }
    }
  }
  @{ '{{N_DOCUMENTOS}}' = "$nDocs"; '{{N_PLANTILLAS}}' = "$nPlant"; '{{N_HERRAMIENTAS}}' = "$nHerr" }
}

# ---- Índice de la biblioteca (sustituye al antiguo Master Print Pack) ----
# Se genera como Markdown temporal y pasa por el mismo proceso que el resto: html/<idioma>/index.html (sin PDF).
function Nuevo-Indice([string]$lang) {
  $en = $lang -eq 'en'
  $dir = Join-Path $root "mds\$lang"
  $grupos = [ordered]@{}; foreach ($k in $bloquesIndice[$lang].Keys) { $grupos[$k] = [Collections.Generic.List[string]]::new() }
  $nDocs = 0; $nPlant = 0; $nHerr = 0
  foreach ($d in (Get-ChildItem $dir -Recurse -File -Filter '*.md' | Where-Object { $_.FullName -notmatch '[\\/]_trabajo[\\/]' } | Sort-Object FullName)) {
    $rel = [IO.Path]::GetRelativePath($dir, $d.FullName) -replace '\\', '/'
    $b = & $cfg.Bloque $rel
    if (-not $b) { continue }
    $base = $rel -replace '\.md$', ''
    $h1 = Select-String -Path $d.FullName -Pattern '^#\s+(.+)$' -List -Encoding utf8
    $tit = if ($h1) { $h1.Matches[0].Groups[1].Value.Trim() } else { $base }
    $num = if ($base -match '^(?:plantillas/|curso/)?([PM]?\d+)_') { $Matches[1] } else { '' }
    $grupos[$b].Add("| $num | [$tit]($base.html) | [HTML]($base.html) · [PDF](../../pdf/$lang/$base.pdf) |")
    if ($b -eq 'H') { $nPlant++ } elseif ($b -ne 'K') { $nDocs++ }
  }
  if ($grupos.Contains('I') -and (Test-Path $herrRaiz)) {
    foreach ($h in (Get-ChildItem $herrRaiz -Directory | Sort-Object Name)) {
      $app = Get-ChildItem $h.FullName -File -Filter '*.html' | Where-Object Name -notlike '_*' | Select-Object -First 1
      if (-not $app) { continue }
      $readme = Join-Path $h.FullName $(if ($en -and (Test-Path (Join-Path $h.FullName 'README_en.md'))) { 'README_en.md' } else { 'README.md' })
      $tit = $h.Name
      if (Test-Path $readme) { $l = Select-String -Path $readme -Pattern '^#\s+(.+)$' -List -Encoding utf8; if ($l) { $tit = $l.Matches[0].Groups[1].Value.Trim() } }
      $hrefApp = [IO.Path]::GetRelativePath((Join-Path $root "html\$lang"), $app.FullName).Replace('\', '/')
      $grupos['I'].Add("| $(($h.Name -split '_')[0]) | [$tit]($hrefApp) | HTML |")
      $nHerr++
    }
  }
  $ti = $cfg[$lang]
  $cifrasIndice = if ($cfg.marca -eq 'SEVEN-G') {
    if ($en) { "$nDocs | documents ; $nPlant | templates ; $nHerr | tools ; 2 | languages" } else { "$nDocs | documentos ; $nPlant | plantillas ; $nHerr | herramientas ; 2 | idiomas" }
  } elseif ($cfg.marca -eq 'SPAD') {
    if ($en) { "$nDocs | documents ; 11 | main-cycle phases ; 5 | work cycles ; 2 | languages" } else { "$nDocs | documentos ; 11 | fases del ciclo principal ; 5 | ciclos de trabajo ; 2 | idiomas" }
  } else {
    if ($en) { "$nDocs | documents ; 9 | spheres ; 3 | ambition levels ; 2 | languages" } else { "$nDocs | documentos ; 9 | esferas ; 3 | niveles de ambición ; 2 | idiomas" }
  }
  $sb = [Text.StringBuilder]::new()
  if ($en) {
    [void]$sb.AppendLine("# $($ti.Indice)`n`n**$($ti.IndiceSub)**`n")
    [void]$sb.AppendLine("| | |`n|---|---|`n| Document | Library index |`n| Date | $(Get-Date -Format 'dd-MM-yyyy') |`n| Author | Fernando García · SEACHAD |`n| Status | Living project. The index is regenerated with every build. |`n")
    [void]$sb.AppendLine("<!-- cifras: $cifrasIndice -->`n`n---`n")
    # aviso de versión en revisión (D58): se retira cuando el marco pase a la versión 1.x
    [void]$sb.AppendLine("> **Version under review: please do not circulate.** The current state of $($cfg.marca) (version 0.x) is not meant to be shared widely. It is public so that a small number of people can review it, give feedback and help improve it. Documents and tools are being adapted to make them reusable; this notice will disappear when the framework reaches version 1.x.`n")
    [void]$sb.AppendLine("> **Legal notice and disclaimer.** These contents and tools are provided 'as is' and for information purposes only. They do not constitute legal, regulatory, financial or professional advice, nor do they guarantee compliance with any regulation. Each organisation that uses them is solely responsible for identifying the regulation that applies to it, verifying that it is current and certifying its own regulatory compliance. The author and SEACHAD accept no liability whatsoever for their use.`n")
  } else {
    [void]$sb.AppendLine("# $($ti.Indice)`n`n**$($ti.IndiceSub)**`n")
    [void]$sb.AppendLine("| | |`n|---|---|`n| Documento | Índice de la biblioteca |`n| Fecha | $(Get-Date -Format 'dd-MM-yyyy') |`n| Autor | Fernando García · SEACHAD |`n| Estado | Proyecto vivo. El índice se regenera en cada generación. |`n")
    [void]$sb.AppendLine("<!-- cifras: $cifrasIndice -->`n`n---`n")
    [void]$sb.AppendLine("> **Versión en revisión: no difundir.** El estado actual de $($cfg.marca) (versión 0.x) no está pensado para compartirse de forma general. Se mantiene en público para que un número reducido de personas pueda revisarlo, dar su opinión y ayudar a mejorarlo. Se está trabajando en la adecuación de los documentos y las herramientas para que sean reutilizables; este aviso desaparecerá cuando el marco pase a la versión 1.x.`n")
    [void]$sb.AppendLine("> **Aviso legal y exención de responsabilidad.** Estos contenidos y herramientas se ofrecen «tal cual» y con fines exclusivamente informativos. No constituyen asesoramiento jurídico, regulatorio, financiero ni profesional, ni garantizan el cumplimiento de ninguna norma. Cada organización que los use es la única responsable de identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio. El autor y SEACHAD no asumen responsabilidad alguna por su uso.`n")
  }
  $i = 0
  foreach ($k in $grupos.Keys) {
    if ($grupos[$k].Count -eq 0) { continue }
    $i++
    [void]$sb.AppendLine("## $i. $($bloquesIndice[$lang][$k])`n")
    if ($k -eq 'I') { [void]$sb.AppendLine($(if ($en) { "Serverless tools: open them with a double click; data never leaves the computer.`n" } else { "Herramientas sin servidor: se abren con doble clic y los datos no salen del equipo.`n" })) }
    [void]$sb.AppendLine($(if ($en) { "| No. | Document | Formats |`n|---|---|---|" } else { "| Nº | Documento | Formatos |`n|---|---|---|" }))
    foreach ($fila in $grupos[$k]) { [void]$sb.AppendLine($fila) }
    [void]$sb.AppendLine()
  }
  # carpeta propia de cada proceso: dos generaciones simultáneas no deben leer el índice de la otra
  $tmp = Join-Path $env:TEMP "seveng-indice-$PID\$($cfg.marca)\$lang\index.md"
  New-Item -ItemType Directory -Force (Split-Path $tmp) | Out-Null
  Set-Content -Path $tmp -Value $sb.ToString() -Encoding utf8
  $tmp
}

function ObtenerMapaReferencias([string]$lang) {
  $map = @{}
  $dir = Join-Path $root "mds\$lang"
  foreach ($f in (Get-ChildItem $dir -Recurse -File -Filter '*.md' | Where-Object { $_.FullName -notmatch '[\\/]_trabajo[\\/]'})) {
    $rel = [IO.Path]::GetRelativePath($dir, $f.FullName).Replace('\', '/')
    $base = [IO.Path]::GetFileNameWithoutExtension($rel)
    $clave = if ($rel -like 'plantillas/*') { ($base -split '_')[0] } else { ($base -split '_')[0] }
    if (-not $clave) { continue }
    $map[$clave] = if ($rel -like 'plantillas/*') { "plantillas/$base.html" } else { "$base.html" }
  }

  if (Test-Path $herrRaiz) {
    foreach ($h in (Get-ChildItem $herrRaiz -Directory | Sort-Object Name)) {
      $app = Get-ChildItem $h.FullName -File -Filter '*.html' | Where-Object Name -notlike '_*' | Select-Object -First 1
      if (-not $app) { continue }
      $map[$h.Name.Split('_')[0]] = [IO.Path]::GetRelativePath((Join-Path $root "html\$lang"), $app.FullName).Replace('\', '/')
    }
  }

  # Ninguna herramienta citada queda sin enlace (D64). Los módulos de T01 enlazan a su vista del registro; el registro de
  # recomendaciones (T18) a la vista «Consejo» del registro (D71) o, sin registro, al documento 62, que lo define; y cada herramienta sin aplicación propia, al procedimiento con el que
  # «Se aplica» según la columna «Estado» del catálogo del documento 03 (la primera plantilla o documento que cita).
  $htmlSevenG = Join-Path $repo "SEVEN-G\html\$lang"
  $mdsSevenG = Join-Path $repo "SEVEN-G\mds\es"
  $destinoSevenG = {
    param([string]$clave)
    $f = Get-ChildItem $mdsSevenG -Recurse -File -Filter "${clave}_*.md" | Where-Object { $_.FullName -notmatch '[\\/]_trabajo[\\/]' } | Select-Object -First 1
    if (-not $f) { return $null }
    $relHtml = [IO.Path]::ChangeExtension([IO.Path]::GetRelativePath($mdsSevenG, $f.FullName), '.html')
    return [IO.Path]::GetRelativePath((Join-Path $root "html\$lang"), (Join-Path $htmlSevenG $relHtml)).Replace('\', '/')
  }
  if ($map['T01']) {
    foreach ($par in @(@('T02', '#/inventario'), @('T03', '#/gates'), @('T04', ''), @('T05', ''), @('T06', '#/riesgos'), @('T18', '#/consejo'))) {
      if (-not $map[$par[0]]) { $map[$par[0]] = $map['T01'] + $par[1] }
    }
  }
  # los costes por caso (T13) son un módulo de la calculadora de valor (T11), D68
  if ($map['T11'] -and -not $map['T13']) { $map['T13'] = $map['T11'] + '#/costes' }
  if (-not $map['T18']) { $d = & $destinoSevenG '62'; if ($d) { $map['T18'] = $d } }
  $catalogo03 = Get-ChildItem $mdsSevenG -File -Filter '03_*.md' | Select-Object -First 1
  if ($catalogo03) {
    foreach ($fila in [regex]::Matches([IO.File]::ReadAllText($catalogo03.FullName), '(?m)^\|\s*\*\*(T\d{2})\*\*\s*\|.*\|\s*Se aplica con ([^|]+)\|\s*$')) {
      $cod = $fila.Groups[1].Value
      if ($map[$cod]) { continue }
      $proc = [regex]::Match($fila.Groups[2].Value, '\b(P\d{2})\b|documento\s+(\d{2})')
      if (-not $proc.Success) { continue }
      $d = & $destinoSevenG ($(if ($proc.Groups[1].Success) { $proc.Groups[1].Value } else { $proc.Groups[2].Value }))
      if ($d) { $map[$cod] = $d }
    }
  }

  return $map
}

# ---- Fuentes externas verificadas (build/referencias/*.json) ----
# Solo se enlazan las referencias con estado "verificado" y URL en ambos idiomas (D41).
function CargarReferencias {
  $dir = Join-Path $PSScriptRoot 'referencias'
  $lista = [Collections.Generic.List[object]]::new()
  if (Test-Path $dir) {
    foreach ($j in (Get-ChildItem $dir -File -Filter '*.json' | Sort-Object Name)) {
      foreach ($r in @(Get-Content $j.FullName -Raw -Encoding utf8 | ConvertFrom-Json)) {
        if ($r.estado -eq 'verificado' -and $r.url_es -and $r.url_en) { $lista.Add($r) }
      }
    }
  }
  $lista
}

function EnlazarFuentes([string]$html, [string]$lang, $refs) {
  $resultado = @{ html = $html; citadas = [ordered]@{} }
  $porPatron = @{}
  foreach ($r in $refs) {
    $ps = if ($lang -eq 'en') { $r.patrones_en } else { $r.patrones_es }
    foreach ($p in @($ps)) {
      if (-not $p -or $p.Length -lt 3) { continue }
      $pe = $p.Replace('&', '&amp;')
      if (-not $porPatron.ContainsKey($pe)) { $porPatron[$pe] = $r }
    }
  }
  if ($porPatron.Count -eq 0) { return $resultado }
  $alt = ($porPatron.Keys | Sort-Object Length -Descending | ForEach-Object { [regex]::Escape($_) }) -join '|'
  $rx = [regex]::new("(?<![\p{L}\p{N}_])(?:$alt)(?![\p{L}\p{N}_])")
  $citadas = $resultado.citadas
  $enSeccion = @{}
  $saltar = 0
  $pilaCita = [Collections.Generic.Stack[bool]]::new()
  $sb = [Text.StringBuilder]::new()
  foreach ($tk in [regex]::Split($html, '(<[^>]+>)')) {
    if ($tk.StartsWith('<')) {
      $m = [regex]::Match($tk, '^<(/?)([a-zA-Z0-9]+)')
      if ($m.Success) {
        $cierre = $m.Groups[1].Value -eq '/'; $tag = $m.Groups[2].Value.ToLowerInvariant()
        if ($tag -eq 'h2' -and -not $cierre) { $enSeccion.Clear() }
        if ($tag -eq 'blockquote') {
          if ($cierre) { if ($pilaCita.Count -and $pilaCita.Pop()) { $saltar-- } }
          else { $s = $tk -match 'aviso-legal'; $pilaCita.Push($s); if ($s) { $saltar++ } }
        } elseif ($tag -in @('a', 'h1', 'h2', 'h3', 'h4', 'code', 'pre', 'svg', 'script', 'style', 'th', 'figure')) {
          if ($cierre) { if ($saltar -gt 0) { $saltar-- } } elseif (-not $tk.EndsWith('/>')) { $saltar++ }
        }
      }
      [void]$sb.Append($tk); continue
    }
    if ($saltar -gt 0 -or -not $tk.Trim()) { [void]$sb.Append($tk); continue }
    [void]$sb.Append($rx.Replace($tk, {
      param($mm)
      $r = $porPatron[$mm.Value]
      if (-not $r) { return $mm.Value }
      $citadas[$r.id] = $r
      if ($enSeccion.ContainsKey($r.id)) { return $mm.Value }
      $enSeccion[$r.id] = 1
      $url = $(if ($lang -eq 'en') { $r.url_en } else { $r.url_es }).Replace('&', '&amp;')
      $tit = [Net.WebUtility]::HtmlEncode($(if ($lang -eq 'en') { $r.titulo_en } else { $r.titulo_es }))
      "<a class=""ref-ext"" href=""$url"" target=""_blank"" rel=""noopener"" title=""$tit"">$($mm.Value)</a>"
    }))
  }
  $resultado.html = $sb.ToString()
  $resultado
}

function SeccionFuentes($citadas, [string]$lang) {
  if (-not $citadas -or $citadas.Count -eq 0) { return '' }
  $en = $lang -eq 'en'
  $orden = @{ 'norma-ue' = 1; 'norma-internacional' = 2; 'norma-es' = 3; 'jurisprudencia' = 4; 'autoridad' = 5; 'guia' = 6; 'norma-tecnica' = 7; 'marco' = 8; 'licencia' = 9; 'web' = 10 }
  $items = $citadas.Values | Sort-Object @{ e = { $o = $orden[$_.tipo]; if ($o) { $o } else { 99 } } }, @{ e = { if ($en) { $_.titulo_en } else { $_.titulo_es } } } | ForEach-Object {
    $url = $(if ($en) { $_.url_en } else { $_.url_es }).Replace('&', '&amp;')
    $tit = [Net.WebUtility]::HtmlEncode($(if ($en) { $_.titulo_en } else { $_.titulo_es }))
    $extra = @()
    if ($_.emisor) { $extra += [Net.WebUtility]::HtmlEncode($_.emisor) }
    if ($_.fecha -match '^(\d{4})-(\d{2})-(\d{2})$') { $extra += "$($Matches[3])-$($Matches[2])-$($Matches[1])" } elseif ($_.fecha) { $extra += $_.fecha }
    "<li><a href=""$url"" target=""_blank"" rel=""noopener"">$tit</a>$(if ($extra) { '<span> · ' + ($extra -join ' · ') + '</span>' })</li>"
  }
  $titulo = if ($en) { 'External sources cited' } else { 'Fuentes externas citadas' }
  $nota = if ($en) { 'Links to the official or primary source, checked before publication. Always verify the version in force on the date of use.' } else { 'Enlaces a la fuente oficial o primaria, comprobados antes de publicar. Verifique siempre la versión vigente en la fecha de uso.' }
  "<h2 id=""$(if ($en) { 'external-sources' } else { 'fuentes-externas' })"">$titulo</h2><p class=""fuentes-nota"">$nota</p><ul class=""fuentes-externas"">$($items -join '')</ul>"
}

function EnlazarReferenciasMarkdown([string]$md, [hashtable]$map) {
  # Solo se enlazan las menciones en texto corrido. Nunca dentro de un enlace ya escrito (ni en su texto ni en su dirección), de una URL,
  # de código, de una etiqueta HTML o de un comentario: «plantillas/P01_…html» o «herramientas/T01_…» contienen el código y, si se
  # tocaran, el enlace quedaría roto. El código tampoco puede ir seguido de «_» (nombre de fichero). Entre paréntesis sí se enlaza:
  # «(T05)» es texto corrido (D64); los enlaces escritos ya están protegidos enteros.
  # «documento NN» y, en los documentos en inglés, «document NN»
  $patron = '(?<![\w/\[\-])(?:(?<doc>documento?\s+\d{2})|(?<tool>T\d{2})|(?<plt>P\d{2}))(?![A-Za-z0-9_\]])'
  $protegido = '(?s)```.*?```|~~~.*?~~~|`[^`\n]*`|<!--.*?-->|!?\[[^\]\n]*\]\([^)\n]*\)|<[^>\n]+>|https?://[^\s)>\]]+'
  $partes = [regex]::Split($md, "($protegido)")
  $sustituir = {
    param($m)
    $valor = $m.Value.Trim()
    $clave = $null
    $href = $null

    if ($valor -match '(?i)^documento?\s+(\d{2})$') {
      $clave = $Matches[1]
      $href = $map[$clave]
      if ($href) { return "[$valor]($href)" }
    }

    if ($valor -match '^(T\d{2})$') {
      $clave = $Matches[1]
      $href = $map[$clave]
      if ($href) { return "[$valor]($href)" }
    }

    if ($valor -match '^(P\d{2})$') {
      $clave = $Matches[1]
      $href = $map[$clave]
      if ($href) { return "[$valor]($href)" }
    }

    return $valor
  }
  # [regex]::Split con un grupo de captura devuelve, alternados, el texto corrido (índices pares) y los tramos protegidos (impares)
  for ($i = 0; $i -lt $partes.Count; $i += 2) { $partes[$i] = [regex]::Replace($partes[$i], $patron, $sustituir) }
  return ($partes -join '')
}

foreach ($metodologia in $Metodologias) {
$cfg           = $configuracion[$metodologia]
$root          = Join-Path $repo $metodologia
$bloquesIndice = $cfg.bloques
Write-Host "== $metodologia =="
# versión editable en Word de las plantillas (D67), antes de los HTML para que la zona de descargas la enlace
if ($metodologia -eq 'SEVEN-G') { & (Join-Path $PSScriptRoot 'docx.ps1') -Idiomas $Idiomas }

foreach ($lang in $Idiomas) {
  $t       = $textos[$lang].Clone()
  foreach ($k in @('T_TT_INICIO', 'T_METODOLOGIA')) { $t[$k] = $cfg[$lang][$k] }
  $mdsDir  = Join-Path $root "mds\$lang"
  $htmlDir = Join-Path $root "html\$lang"
  $pdfDir  = Join-Path $root "pdf\$lang"
  $compDirs = @((Join-Path $root "build\componentes\$lang"), (Join-Path $PSScriptRoot "componentes\$lang")) | Select-Object -Unique
  if (-not (Test-Path $mdsDir)) { Write-Warning "No existe $mdsDir"; continue }

  $files = @(Get-ChildItem $mdsDir -Recurse -File -Filter $Filter | Where-Object Extension -eq '.md')
  $indiceMd = Nuevo-Indice $lang
  $files += Get-Item $indiceMd

  # el navegador de documentos se construye siempre con toda la biblioteca, aunque -Filter genere solo algunos documentos
  $catalogo = [Collections.Generic.List[object]]::new()
  foreach ($fNav in @(@(Get-ChildItem $mdsDir -Recurse -File -Filter '*.md') + @(Get-Item $indiceMd))) {
    if ($fNav.FullName -match '[\\/]_trabajo[\\/]') { continue }
    $esIndiceNav = $fNav.FullName -eq $indiceMd
    $relNav = if ($esIndiceNav) { 'index.md' } else { [IO.Path]::GetRelativePath($mdsDir, $fNav.FullName).Replace('\', '/') }
    $relBaseNav = [IO.Path]::ChangeExtension($relNav, $null).TrimEnd('.')
    $bloque = BloqueNavegacion $relNav
    $mdNav = Get-Content $fNav.FullName -Raw -Encoding utf8
    $h1Nav = [regex]::Match($mdNav, '(?m)^#\s+(.+)$')
    $tituloNav = if ($h1Nav.Success) { $h1Nav.Groups[1].Value.Trim() } else { $fNav.BaseName }
    $catalogo.Add([PSCustomObject]@{
      relMd = $relNav
      relBase = $relBaseNav
      blockCode = $bloque
      blockLabel = $bloquesIndice[$lang][$bloque]
      title = $tituloNav
    })
  }
  $catalogo = @($catalogo | Sort-Object relMd)

  $mapaReferencias = ObtenerMapaReferencias $lang
  $referencias = @(CargarReferencias)

  # Herramientas disponibles (carpeta herramientas/<código>_<nombre>/ con un HTML) y módulos que viven dentro de otra
  $herramientas = [ordered]@{}
  if (Test-Path $herrRaiz) {
    foreach ($h in (Get-ChildItem $herrRaiz -Directory | Sort-Object Name)) {
      $app = Get-ChildItem $h.FullName -File -Filter '*.html' | Where-Object Name -notlike '_*' | Select-Object -First 1
      if (-not $app) { continue }
      $cod = ($h.Name -split '_')[0]
      $titulos = @{}
      foreach ($par in @(@('es', 'README.md'), @('en', 'README_en.md'))) {
        $rd = Join-Path $h.FullName $par[1]; $tt = $h.Name
        if (Test-Path $rd) { $l = Select-String -Path $rd -Pattern '^#\s+(.+)$' -List -Encoding utf8; if ($l) { $tt = ($l.Matches[0].Groups[1].Value.Trim() -replace '^T\d{2}\s*·\s*', '') } }
        $titulos[$par[0]] = $tt
      }
      $herramientas[$cod] = @{ ruta = $app.FullName; es = $titulos.es; en = $titulos.en }
    }
  }
  $aliasHerr = @{ T02 = 'T01'; T03 = 'T01'; T04 = 'T01'; T05 = 'T01'; T06 = 'T01'; T13 = 'T11'; T18 = 'T01' }

  foreach ($f in $files) {
    $esIndice = $f.FullName -eq $indiceMd
    $rel     = if ($esIndice) { 'index.md' } else { [IO.Path]::GetRelativePath($mdsDir, $f.FullName) }
    $relBase = [IO.Path]::ChangeExtension($rel, $null).TrimEnd('.')
    $htmlOut = Join-Path $htmlDir "$relBase.html"
    $pdfOut  = Join-Path $pdfDir  "$relBase.pdf"
    New-Item -ItemType Directory -Force (Split-Path $htmlOut) | Out-Null

    $pdfSameHref = [IO.Path]::GetRelativePath((Split-Path $htmlOut), $pdfOut).Replace('\\', '/').Replace('\', '/')
    $pdfOtroHref = $null
    $otroLang = if ($lang -eq 'es') { 'en' } else { 'es' }
    $otroRel = if ($esIndice) { 'index.md' } else { $rel }
    $otroHtml = Join-Path $root "html\$otroLang\$([IO.Path]::ChangeExtension($otroRel, '.html'))"
    $otroPdf = Join-Path $root "pdf\$otroLang\$([IO.Path]::ChangeExtension($otroRel, '.pdf'))"
    if (Test-Path $otroPdf) { $pdfOtroHref = [IO.Path]::GetRelativePath((Split-Path $htmlOut), $otroPdf).Replace('\\', '/').Replace('\', '/') }

    $md   = Get-Content $f.FullName -Raw -Encoding utf8
    # el mapa de referencias es relativo a html/<idioma>/: para un documento de una subcarpeta (plantillas/, _trabajo/) se rehace
    # relativo a su propia carpeta, o los enlaces automáticos quedarían rotos
    $mapaDoc = $mapaReferencias
    $carpetaDoc = Split-Path $htmlOut
    if ($carpetaDoc.TrimEnd('\') -ne $htmlDir.TrimEnd('\')) {
      $mapaDoc = @{}
      foreach ($k in $mapaReferencias.Keys) { $mapaDoc[$k] = [IO.Path]::GetRelativePath($carpetaDoc, (Join-Path $htmlDir $mapaReferencias[$k])).Replace('\', '/') }
    }
    $md   = EnlazarReferenciasMarkdown $md $mapaDoc
    $body = (ConvertFrom-Markdown -InputObject $md).Html

    # ---- Portada: título, entradilla, ficha y cifras ----
    $m = [regex]::Match($body, '(?s)^\s*<h1[^>]*>(?<t>.*?)</h1>\s*(?:<p>(?<s>.*?)</p>\s*)?(?:<table>(?<f>.*?)</table>\s*)?(?:<!--\s*cifras:(?<c>.*?)-->\s*)?(?:<hr\s*/?>\s*)?')
    $titulo = if ($m.Success) { Limpiar $m.Groups['t'].Value } else { $f.BaseName }
    $ficha = @{}
    if ($m.Groups['f'].Success) {
      foreach ($r in [regex]::Matches($m.Groups['f'].Value, '(?s)<tr>\s*<td>(.*?)</td>\s*<td>(.*?)</td>\s*</tr>')) {
        $k = Limpiar $r.Groups[1].Value; if ($k) { $ficha[$k] = $r.Groups[2].Value.Trim() }
      }
    }
    function Campo([string]$clave) { $n = $t.Ficha[$clave]; if ($ficha.ContainsKey($n)) { Limpiar $ficha[$n] } else { '' } }
    $entradilla = if ($m.Groups['s'].Success) { Limpiar $m.Groups['s'].Value } else { Campo 'Objetivo' }
    $docRef = Campo 'Documento'; if (-not $docRef) { $docRef = Campo 'Tipo' }; if (-not $docRef) { $docRef = $t.Ficha.Documento }
    $docCorto = ($docRef -split ' · ')[0]
    $fecha = Campo 'Fecha'
    $autor = Campo 'Autor'; if (-not $autor) { $autor = 'Fernando García · SEACHAD' }
    $firma = @("<b>$(Enc $autor)</b>")
    $ver = Campo 'Version'; if ($ver) { $firma += "$($t.Version) $(Enc $ver)" }
    if ($fecha) { $firma += Enc $fecha }
    $estado = Campo 'Estado'; if ($estado) { $firma += Enc ((($estado -split '\.\s')[0]).TrimEnd('.')) }
    $cifrasHtml = ''
    if ($m.Groups['c'].Success) {
      $items = $m.Groups['c'].Value -split ';' | Where-Object { $_.Trim() } | ForEach-Object {
        $p = $_ -split '\|', 2; "<div class=""cifra""><b>$(Enc $p[0].Trim())</b><span>$(Enc $p[1].Trim())</span></div>"
      }
      $cifrasHtml = "<div class=""cifras"">$($items -join '')</div>"
    }
    $portada = @"
<header class="portada">
  <div class="cabecera"><div class="marca"><i></i>$($cfg.marca)</div><div class="cabecera-dato">$(Enc $docCorto)$(if ($fecha) { ' · ' + (Enc $fecha) })</div></div>
  <div class="portada-cuerpo">
    <p class="antetitulo">$(Enc $docRef)</p>
    <h1>$(Enc $titulo)</h1>
    $(if ($entradilla) { "<p class=""entradilla"">$(Enc $entradilla)</p>" })
    <div class="firma">$(($firma | ForEach-Object { "<span>$_</span>" }) -join '')</div>
    $cifrasHtml
  </div>
</header>
"@
    if ($m.Success) { $body = $body.Substring($m.Length) }

    # ---- Secciones numeradas, identificadores e índice ----
    $usados = @{}
    function IdUnico([string]$base) { $id = $base; $n = 2; while ($usados.ContainsKey($id)) { $id = "$base-$n"; $n++ }; $usados[$id] = 1; $id }
    $indice = [Collections.Generic.List[string]]::new()
    $body = [regex]::Replace($body, '(?s)<h([23])(?:\s+id="[^"]*")?>(.*?)</h\1>', {
      param($h)
      $nivel = $h.Groups[1].Value; $texto = $h.Groups[2].Value.Trim()
      if ($nivel -eq '3') { return "<h3 id=""$(IdUnico (Slug $texto))"">$texto</h3>" }
      $num = ''
      $nm = [regex]::Match($texto, '^(\d+)\.\s*(.*)$', 'Singleline')
      if ($nm.Success) { $num = '{0:D2}' -f [int]$nm.Groups[1].Value; $texto = $nm.Groups[2].Value }
      $id = IdUnico (Slug $texto)
      $indice.Add("<li><a href=""#$id""><span>$num</span>$(Limpiar $texto)</a></li>")
      $ante = if ($num) { "<span class=""antetitulo"">$num</span>" } else { '' }
      "<h2 id=""$id"">$ante$texto</h2>"
    })
    $indiceHtml = if ($indice.Count -ge 4) { "<nav class=""indice""><div class=""indice-in""><h2>$($t.EnEsteDocumento)</h2><ol>$($indice -join '')</ol></div></nav>" } else { '' }

    # ---- Tablas, componentes y Mermaid ----
    $body = $body -replace '<table>', '<div class="tabla"><table>' -replace '</table>', '</table></div>'
    $body = [regex]::Replace($body, '<blockquote>(\s*<p><strong>(?:Aviso legal|Legal notice|Versión en revisión|Version under review))', '<blockquote class="aviso-legal">$1')
    $body = [regex]::Replace($body, '<!--\s*figura:\s*([\w-]+)\s*-->', {
      param($c)
      $ruta = $compDirs | ForEach-Object { Join-Path $_ "$($c.Groups[1].Value).html" } | Where-Object { Test-Path $_ } | Select-Object -First 1
      if ($ruta) {
        $comp = (Get-Content $ruta -Raw -Encoding utf8).Replace('SEVEN-G · SEACHAD', "$($cfg.marca) · SEACHAD")
        if ($comp.Contains('{{N_')) { $rec = Recuentos-Biblioteca $lang; foreach ($k in $rec.Keys) { $comp = $comp.Replace($k, $rec[$k]) } }
        $comp
      } else { Write-Warning "Componente no encontrado: $($c.Groups[1].Value) en $($compDirs -join ' ; ')"; $c.Value }
    })
    # ---- Recuadro «Lo esencial» (D75): qué es obligatorio del documento; enlaza con la matriz de obligatoriedad (documento 94) ----
    $body = [regex]::Replace($body, '(?s)<!--\s*esencial:\s*(\w+)\s*\|(.*?)-->', {
      param($c)
      $nivel = $c.Groups[1].Value.ToLowerInvariant()
      $rotulos = if ($lang -eq 'en') { @{ siempre = 'Always mandatory'; enterprise = 'Mandatory in Enterprise'; condicional = 'Conditional: depends on a trigger'; recomendado = 'Recommended'; consulta = 'Reference' } }
                 else { @{ siempre = 'Obligatorio siempre'; enterprise = 'Obligatorio en Enterprise'; condicional = 'Condicional: depende de un disparador'; recomendado = 'Recomendado'; consulta = 'Consulta' } }
      if (-not $rotulos.ContainsKey($nivel)) { Write-Warning "Nivel de «esencial» desconocido en $rel`: $nivel"; return '' }
      $pieEs = if ($mapaDoc['94']) { "<p class=""es-pie""><a href=""$($mapaDoc['94'])"">$(if ($lang -eq 'en') { 'Obligation matrix and layered reading (document 94)' } else { 'Matriz de obligatoriedad y lectura por capas (documento 94)' })</a></p>" } else { '' }
      # el texto pasa por el mismo enlazador automático de códigos que el resto del documento, o «T01», «documento NN» o «P01» quedarían sin enlazar (D64)
      $textoEsencial = EnlazarReferenciasMarkdown (Enc $c.Groups[2].Value.Trim()) $mapaDoc
      $textoEsencial = [regex]::Replace($textoEsencial, '\[([^\]]+)\]\(([^)]+)\)', '<a href="$2">$1</a>')
      "<aside class=""esencial"" data-capa=""$nivel""><div class=""es-cab""><span class=""es-rotulo"">$(if ($lang -eq 'en') { 'The essentials' } else { 'Lo esencial' })</span><span class=""es-nivel"">$($rotulos[$nivel])</span></div><p>$textoEsencial</p>$pieEs</aside>"
    })
    $script:hayMermaid = $false
    $body = [regex]::Replace($body, '(?s)(?:<!--\s*grafico:\s*(.*?)-->\s*)?(?:<pre><code class="language-mermaid">(.*?)</code></pre>|<pre class="mermaid">(.*?)</pre>)', {
      param($c); $script:hayMermaid = $true
      $cab = ''; $fuente = ''
      if ($c.Groups[1].Success) {
        $partes = $c.Groups[1].Value -split '\|', 2
        $cab = "<div class=""g-titulo"">$(Enc $partes[0].Trim())</div>"
        if ($partes.Count -gt 1 -and $partes[1].Trim()) { $cab += "<div class=""g-sub"">$(Enc $partes[1].Trim())</div>" }
        $fuente = "<div class=""g-fuente"">$(if ($lang -eq 'en') { 'Source' } else { 'Fuente' }): $($cfg.marca) · SEACHAD</div>"
      }
      $codigo = if ($c.Groups[2].Success) { $c.Groups[2].Value } else { $c.Groups[3].Value }
      "<figure class=""grafico"">$cab<div class=""g-lienzo""><pre class=""mermaid"">$codigo</pre></div>$fuente</figure>"
    })

    # ---- Enlaces a fuentes externas verificadas y lista final ----
    $enlaceFuentes = EnlazarFuentes $body $lang $referencias
    $body = $enlaceFuentes.html + (SeccionFuentes $enlaceFuentes.citadas $lang)

    # ---- Selector de idioma ----
    $idiomasHtml = ($todos | ForEach-Object {
      $etq = $_.ToUpperInvariant()
      if ($_ -eq $lang) { "<span class=""activo"" aria-current=""true"">$etq</span>" }
      else {
        $otroMd = Join-Path $root "mds\$_\$rel"
        if ($esIndice) {
          "<a href=""../$_/index.html"" hreflang=""$_"" lang=""$_"">$etq</a>"
        } elseif (Test-Path $otroMd) {
          $destino = Join-Path $root "html\$_\$relBase.html"
          $href = [IO.Path]::GetRelativePath((Split-Path $htmlOut), $destino).Replace('\', '/')
          "<a href=""$href"" hreflang=""$_"" lang=""$_"">$etq</a>"
        } else {
          Write-Warning "Falta la versión '$_' de $rel"
          "<span class=""no-disponible"" title=""$($t.NoDisponible)"">$etq</span>"
        }
      }
    }) -join ''

    $homeHtml = Join-Path $htmlDir "$($cfg.inicio).html"
    $homeHref = [IO.Path]::GetRelativePath((Split-Path $htmlOut), $homeHtml).Replace('\\', '/').Replace('\', '/')
    # ⌂ lleva a la portada general del sitio (todas las metodologías), en el idioma del documento; la marca, al documento 00
    $portadaHtml = Join-Path $repo $(if ($lang -eq 'en') { 'en\index.html' } else { 'index.html' })
    $portadaHref = [IO.Path]::GetRelativePath((Split-Path $htmlOut), $portadaHtml).Replace('\', '/')

    # ---- Zona de descargas y herramientas (visible bajo la portada y en el panel) ----
    $en = $lang -eq 'en'
    $pdfLabel  = if ($en) { 'This document · English' } else { 'Este documento · español' }
    $otroLabel = if ($en) { 'Spanish version' } else { 'Versión en inglés' }
    $otroHtmlHref = if (Test-Path $otroHtml) { [IO.Path]::GetRelativePath((Split-Path $htmlOut), $otroHtml).Replace('\', '/') } elseif ($esIndice) { "../$otroLang/index.html" } else { $null }
    $enlacesDoc = [Collections.Generic.List[string]]::new()
    if (-not $esIndice) {
      $enlacesDoc.Add("<a class=""dz-item"" href=""$pdfSameHref"" target=""_blank"" rel=""noopener""><span class=""dz-tipo"">PDF</span><b>$pdfLabel</b></a>")
      if ($pdfOtroHref) { $enlacesDoc.Add("<a class=""dz-item"" href=""$pdfOtroHref"" target=""_blank"" rel=""noopener""><span class=""dz-tipo"">PDF</span><b>$otroLabel</b></a>") }
      # plantilla editable en Word, del mismo idioma (D67)
      $docxOut = Join-Path $root "docx\$lang\$relBase.docx"
      if (Test-Path $docxOut) {
        $docxHref = [IO.Path]::GetRelativePath((Split-Path $htmlOut), $docxOut).Replace('\', '/')
        $docxLabel = if ($en) { 'Editable template (Word)' } else { 'Plantilla editable (Word)' }
        $enlacesDoc.Insert(1, "<a class=""dz-item"" href=""$docxHref"" download><span class=""dz-tipo"">DOCX</span><b>$docxLabel</b></a>")
      }
    }
    if ($otroHtmlHref) { $enlacesDoc.Add("<a class=""dz-item"" href=""$otroHtmlHref"" hreflang=""$otroLang""><span class=""dz-tipo html"">HTML</span><b>$otroLabel</b></a>") }

    $todasHerr = $cfg.todasHerramientas -and ($esIndice -or $rel -like $cfg.todasHerramientas)
    $codigosHerr = if ($todasHerr) { @($herramientas.Keys) } else {
      @([regex]::Matches($md, '(?<![\w/])T\d{2}(?!\d)') | ForEach-Object { $c = $_.Value; if ($aliasHerr.ContainsKey($c)) { $aliasHerr[$c] } else { $c } } | Select-Object -Unique)
    }
    $enlacesHerr = [Collections.Generic.List[string]]::new()
    foreach ($c in ($codigosHerr | Sort-Object)) {
      if (-not $herramientas.Contains($c)) { continue }
      $hh = $herramientas[$c]
      $hrefH = [IO.Path]::GetRelativePath((Split-Path $htmlOut), $hh.ruta).Replace('\', '/')
      $titH = if ($en) { $hh.en } else { $hh.es }
      $enlacesHerr.Add("<a class=""dz-item"" href=""$hrefH"" target=""_blank"" rel=""noopener""><span class=""dz-tipo tool"">$c</span><b>$(Enc $titH)</b></a>")
    }
    $zonaDescargas = ''
    if ($enlacesDoc.Count -or $enlacesHerr.Count) {
      $zonaDescargas = "<section class=""descargas-zona"" aria-label=""$(if ($en) { 'Downloads and tools' } else { 'Descargas y herramientas' })""><div class=""dz-in"">"
      if ($enlacesDoc.Count) { $zonaDescargas += "<div class=""dz-bloque""><p class=""dz-titulo"">$(if ($en) { 'Downloads' } else { 'Descargas' })</p><div class=""dz-enlaces"">$($enlacesDoc -join '')</div></div>" }
      if ($enlacesHerr.Count) { $zonaDescargas += "<div class=""dz-bloque""><p class=""dz-titulo"">$(if ($en) { 'Related tools' } else { 'Herramientas relacionadas' })</p><div class=""dz-enlaces"">$($enlacesHerr -join '')</div></div>" }
      $zonaDescargas += '</div></section>'
    }
    $descargasPanel = @($enlacesDoc) + @($enlacesHerr)

    $navItems = @(
      foreach ($item in $catalogo) {
        $destino = Join-Path $htmlDir "$($item.relBase).html"
        $href = [IO.Path]::GetRelativePath((Split-Path $htmlOut), $destino).Replace('\', '/')
        [PSCustomObject]@{
          href = $href
          title = $item.title
          blockCode = $item.blockCode
          blockLabel = $item.blockLabel
          active = ($item.relBase -eq $relBase)
        }
      }
    )
    $navItemsJson = $navItems | ConvertTo-Json -Depth 4 -Compress

    $pie = $(if ($titulo -match [regex]::Escape($cfg.marca)) { $titulo } else { "$($cfg.marca) · $titulo" }).Replace('"', "'")
    $html = $template.Replace('{{MARCA}}', $cfg.marca)
    foreach ($k in $t.Keys) { if ($k -like 'T_*') { $html = $html.Replace("{{$k}}", (Enc $t[$k])) } }
    $html = $html.Replace('{{LANG}}', $lang).
                  Replace('{{TITLE}}', (Enc $titulo)).
                  Replace('{{CSS}}', $css).
                  Replace('{{PIE}}', $pie).
                  Replace('{{IDIOMAS}}', $idiomasHtml).
                  Replace('{{HOME_HREF}}', $homeHref).
                  Replace('{{PORTADA_HREF}}', $portadaHref).
                  Replace('{{NAV_ITEMS}}', $navItemsJson).
                  Replace('{{PORTADA}}', $portada).
                  Replace('{{INDICE}}', $indiceHtml).
                  Replace('{{DESCARGAS_PANEL}}', ($descargasPanel -join '')).
                  Replace('{{DESCARGAS_ZONA}}', $zonaDescargas).
                  Replace('{{BODY}}', $body).
                  Replace('{{SCRIPTS}}', $(if ($script:hayMermaid) { $mermaidScript } else { '' })).
                  Replace('{{GENERATED}}', (Get-Date -Format 'dd-MM-yyyy'))
    Set-ContentUtf8ConReintento -Path $htmlOut -Value $html
    Write-Host "HTML  [$lang] $rel"

    if (-not $SinPdf -and -not $esIndice) {
      New-Item -ItemType Directory -Force (Split-Path $pdfOut) | Out-Null
      $perfil = Join-Path $env:TEMP "seveng-pdf-$PID"
      $uri = ([Uri]$htmlOut).AbsoluteUri
      $argumentos = @('--headless=new', '--disable-gpu', '--no-first-run', '--no-pdf-header-footer',
                      '--virtual-time-budget=20000', "--user-data-dir=`"$perfil`"", "--print-to-pdf=`"$pdfOut`"", $uri)
      Start-Process -FilePath $browser -ArgumentList $argumentos -Wait -WindowStyle Hidden
      if (Test-Path $pdfOut) { Write-Host "PDF   [$lang] $rel" } else { Write-Warning "No se generó $pdfOut" }
    }
  }
}
}
# índices temporales de este proceso
Remove-Item -Recurse -Force (Join-Path $env:TEMP "seveng-indice-$PID") -ErrorAction SilentlyContinue
