<#
.SYNOPSIS
  Genera HTML y PDF de los documentos SEVEN-G en español e inglés a partir de las fuentes Markdown.

.DESCRIPTION
  Fuentes:      SEVEN-G/mds/<idioma>/**/*.md          (idiomas: es, en)
  Salidas:      SEVEN-G/html/<idioma>/**/<nombre>.html (un solo fichero, con barra de herramientas)
                SEVEN-G/html/<idioma>/index.html       (índice de la biblioteca por bloques A–J; sin PDF; excluye _trabajo)
                SEVEN-G/pdf/<idioma>/**/<nombre>.pdf   (impreso con Edge o Chrome sin ventana)
  Diseño:       build/plantilla.html + build/estilo.css (periódico económico en tonos salmón)
  Componentes:  build/componentes/<idioma>/<nombre>.html
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
    <!-- grafico: Título | Subtítulo -->      -> título y subtítulo del diagrama Mermaid que va justo debajo
    ```mermaid ... ```                        -> diagrama Mermaid con los colores del tema activo

  Requisitos: PowerShell 7+ (ConvertFrom-Markdown) y Microsoft Edge o Google Chrome.

.EXAMPLE
  pwsh -File build/build.ps1                     # todos los documentos, ambos idiomas
  pwsh -File build/build.ps1 -Filter 00_*        # solo los que coinciden
  pwsh -File build/build.ps1 -Idiomas es         # solo un idioma
  pwsh -File build/build.ps1 -SinPdf             # solo HTML
#>
param(
  [string]$Filter = '*.md',
  [string[]]$Idiomas = @('es', 'en'),
  [switch]$SinPdf
)

$ErrorActionPreference = 'Stop'
$root     = Split-Path -Parent $PSScriptRoot
$template = Get-Content (Join-Path $PSScriptRoot 'plantilla.html') -Raw -Encoding utf8
$css      = Get-Content (Join-Path $PSScriptRoot 'estilo.css') -Raw -Encoding utf8
$todos    = @('es', 'en')

$textos = @{
  es = @{
    T_BARRA = 'Herramientas del documento'; T_BUSCAR = 'Buscar en el documento'; T_ANTERIOR = 'Resultado anterior'; T_SIGUIENTE = 'Resultado siguiente'
    T_INDICE = 'Índice'; T_INDICE_CORTO = 'Índice'; T_CERRAR = 'Cerrar'; T_FILTRAR = 'Filtrar secciones'; T_TEMA = 'Tema'
    T_INICIO = 'Inicio'; T_BIBLIOTECA = 'Biblioteca'; T_HISTORIAL = 'Historial'; T_DOCUMENTOS = 'Documentos'
    T_HISTORIAL_TITULO = 'Historial de navegación'; T_FILTRAR_DOCUMENTOS = 'Filtrar documentos'; T_HISTORIAL_VACIO = 'Todavía no hay navegación registrada.'
    T_CERRAR_PANEL = 'Cerrar panel'; T_HORA = 'Hora'; T_DESCARGAS = 'Descargas'
    T_TT_INICIO = 'Ir al documento 00: Qué es SEVEN-G y para qué sirve'
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
function BloqueNavegacion([string]$rel) {
  if ($rel -eq 'index.md') { return 'A' }
  if ($rel -like 'plantillas/*') { return 'H' }
  if ($rel -match '^([0-9])') {
    return @{ '0'='A'; '1'='B'; '2'='C'; '3'='D'; '4'='E'; '5'='F'; '6'='G'; '9'='J' }[$Matches[1]]
  }
  return 'J'
}

# ---- Índice de la biblioteca (sustituye al antiguo Master Print Pack) ----
# Se genera como Markdown temporal y pasa por el mismo proceso que el resto: html/<idioma>/index.html (sin PDF).
$bloquesIndice = @{
  es = [ordered]@{ A = 'A · Fundamentos'; B = 'B · Estrategia y cartera'; C = 'C · Ciclo de vida de la iniciativa'; D = 'D · Gobierno, riesgo y cumplimiento'; E = 'E · Medición y valor'; F = 'F · Personas, datos y operación'; G = 'G · Consejo'; H = 'H · Plantillas'; I = 'I · Herramientas'; J = 'J · Adopción del marco' }
  en = [ordered]@{ A = 'A · Foundations'; B = 'B · Strategy and portfolio'; C = 'C · Initiative lifecycle'; D = 'D · Governance, risk and compliance'; E = 'E · Measurement and value'; F = 'F · People, data and operations'; G = 'G · Board'; H = 'H · Templates'; I = 'I · Tools'; J = 'J · Framework adoption' }
}
function Nuevo-Indice([string]$lang) {
  $en = $lang -eq 'en'
  $dir = Join-Path $root "mds\$lang"
  $grupos = [ordered]@{}; foreach ($k in $bloquesIndice[$lang].Keys) { $grupos[$k] = [Collections.Generic.List[string]]::new() }
  $nDocs = 0; $nPlant = 0; $nHerr = 0
  foreach ($d in (Get-ChildItem $dir -Recurse -File -Filter '*.md' | Where-Object { $_.FullName -notmatch '[\\/]_trabajo[\\/]' } | Sort-Object FullName)) {
    $rel = [IO.Path]::GetRelativePath($dir, $d.FullName) -replace '\\', '/'
    $b = if ($rel -like 'plantillas/*') { 'H' } elseif ($rel -match '^(\d)\d_') { @{ '0'='A'; '1'='B'; '2'='C'; '3'='D'; '4'='E'; '5'='F'; '6'='G'; '9'='J' }[$Matches[1]] } else { $null }
    if (-not $b) { continue }
    $base = $rel -replace '\.md$', ''
    $h1 = Select-String -Path $d.FullName -Pattern '^#\s+(.+)$' -List -Encoding utf8
    $tit = if ($h1) { $h1.Matches[0].Groups[1].Value.Trim() } else { $base }
    $num = if ($base -match '^(?:plantillas/)?(P?\d+)_') { $Matches[1] } else { '' }
    $grupos[$b].Add("| $num | [$tit]($base.html) | [HTML]($base.html) · [PDF](../../pdf/$lang/$base.pdf) |")
    if ($b -eq 'H') { $nPlant++ } else { $nDocs++ }
  }
  $herrDir = Join-Path $root 'herramientas'
  if (Test-Path $herrDir) {
    foreach ($h in (Get-ChildItem $herrDir -Directory | Sort-Object Name)) {
      $app = Get-ChildItem $h.FullName -File -Filter '*.html' | Where-Object Name -notlike '_*' | Select-Object -First 1
      if (-not $app) { continue }
      $readme = Join-Path $h.FullName $(if ($en -and (Test-Path (Join-Path $h.FullName 'README_en.md'))) { 'README_en.md' } else { 'README.md' })
      $tit = $h.Name
      if (Test-Path $readme) { $l = Select-String -Path $readme -Pattern '^#\s+(.+)$' -List -Encoding utf8; if ($l) { $tit = $l.Matches[0].Groups[1].Value.Trim() } }
      $grupos['I'].Add("| $(($h.Name -split '_')[0]) | [$tit](../../herramientas/$($h.Name)/$($app.Name)) | HTML |")
      $nHerr++
    }
  }
  $sb = [Text.StringBuilder]::new()
  if ($en) {
    [void]$sb.AppendLine("# SEVEN-G Library`n`n**Documents, templates and tools of the framework for value, governance and transformation with AI**`n")
    [void]$sb.AppendLine("| | |`n|---|---|`n| Document | Library index |`n| Date | $(Get-Date -Format 'dd-MM-yyyy') |`n| Author | Fernando García · SEACHAD |`n| Status | Living project. The index is regenerated with every build. |`n")
    [void]$sb.AppendLine("<!-- cifras: $nDocs | documents ; $nPlant | templates ; $nHerr | tools ; 2 | languages -->`n`n---`n")
  } else {
    [void]$sb.AppendLine("# Biblioteca SEVEN-G`n`n**Documentos, plantillas y herramientas del marco de valor, gobierno y transformación con IA**`n")
    [void]$sb.AppendLine("| | |`n|---|---|`n| Documento | Índice de la biblioteca |`n| Fecha | $(Get-Date -Format 'dd-MM-yyyy') |`n| Autor | Fernando García · SEACHAD |`n| Estado | Proyecto vivo. El índice se regenera en cada generación. |`n")
    [void]$sb.AppendLine("<!-- cifras: $nDocs | documentos ; $nPlant | plantillas ; $nHerr | herramientas ; 2 | idiomas -->`n`n---`n")
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
  $tmp = Join-Path $env:TEMP "seveng-indice\$lang\index.md"
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

  $herrDir = Join-Path $root 'herramientas'
  if (Test-Path $herrDir) {
    foreach ($h in (Get-ChildItem $herrDir -Directory | Sort-Object Name)) {
      $app = Get-ChildItem $h.FullName -File -Filter '*.html' | Where-Object Name -notlike '_*' | Select-Object -First 1
      if (-not $app) { continue }
      $map[$h.Name.Split('_')[0]] = "../../herramientas/$($h.Name)/$($app.Name)"
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
  $patron = '(?<!\])(?<!\w)(?:(?<doc>documento\s+\d{2})|(?<tool>T\d{2})|(?<plt>P\d{2}))(?!(?:[A-Za-z0-9]))'
  return [regex]::Replace($md, $patron, {
    param($m)
    $valor = $m.Value.Trim()
    $clave = $null
    $href = $null

    if ($valor -match '(?i)^documento\s+(\d{2})$') {
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
  })
}

foreach ($lang in $Idiomas) {
  $t       = $textos[$lang]
  $mdsDir  = Join-Path $root "mds\$lang"
  $htmlDir = Join-Path $root "html\$lang"
  $pdfDir  = Join-Path $root "pdf\$lang"
  $compDir = Join-Path $PSScriptRoot "componentes\$lang"
  if (-not (Test-Path $mdsDir)) { Write-Warning "No existe $mdsDir"; continue }

  $files = @(Get-ChildItem $mdsDir -Recurse -File -Filter $Filter | Where-Object Extension -eq '.md')
  $indiceMd = Nuevo-Indice $lang
  $files += Get-Item $indiceMd

  $catalogo = [Collections.Generic.List[object]]::new()
  foreach ($fNav in $files) {
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
  $herrRaiz = Join-Path $root 'herramientas'
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
  $aliasHerr = @{ T02 = 'T01'; T03 = 'T01'; T04 = 'T01'; T05 = 'T01'; T18 = 'T17' }

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
    $md   = EnlazarReferenciasMarkdown $md $mapaReferencias
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
  <div class="cabecera"><div class="marca"><i></i>SEVEN-G</div><div class="cabecera-dato">$(Enc $docCorto)$(if ($fecha) { ' · ' + (Enc $fecha) })</div></div>
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
    $body = [regex]::Replace($body, '<blockquote>(\s*<p><strong>(?:Aviso legal|Legal notice))', '<blockquote class="aviso-legal">$1')
    $body = [regex]::Replace($body, '<!--\s*figura:\s*([\w-]+)\s*-->', {
      param($c)
      $ruta = Join-Path $compDir "$($c.Groups[1].Value).html"
      if (Test-Path $ruta) { Get-Content $ruta -Raw -Encoding utf8 } else { Write-Warning "Componente no encontrado: $ruta"; $c.Value }
    })
    $script:hayMermaid = $false
    $body = [regex]::Replace($body, '(?s)(?:<!--\s*grafico:\s*(.*?)-->\s*)?(?:<pre><code class="language-mermaid">(.*?)</code></pre>|<pre class="mermaid">(.*?)</pre>)', {
      param($c); $script:hayMermaid = $true
      $cab = ''; $fuente = ''
      if ($c.Groups[1].Success) {
        $partes = $c.Groups[1].Value -split '\|', 2
        $cab = "<div class=""g-titulo"">$(Enc $partes[0].Trim())</div>"
        if ($partes.Count -gt 1 -and $partes[1].Trim()) { $cab += "<div class=""g-sub"">$(Enc $partes[1].Trim())</div>" }
        $fuente = "<div class=""g-fuente"">$(if ($lang -eq 'en') { 'Source' } else { 'Fuente' }): SEVEN-G · SEACHAD</div>"
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

    $homeHtml = Join-Path $htmlDir '00_SEVEN-G_Que_es_y_para_que_sirve.html'
    $homeHref = [IO.Path]::GetRelativePath((Split-Path $htmlOut), $homeHtml).Replace('\\', '/').Replace('\', '/')

    # ---- Zona de descargas y herramientas (visible bajo la portada y en el panel) ----
    $en = $lang -eq 'en'
    $pdfLabel  = if ($en) { 'This document · English' } else { 'Este documento · español' }
    $otroLabel = if ($en) { 'Spanish version' } else { 'Versión en inglés' }
    $otroHtmlHref = if (Test-Path $otroHtml) { [IO.Path]::GetRelativePath((Split-Path $htmlOut), $otroHtml).Replace('\', '/') } elseif ($esIndice) { "../$otroLang/index.html" } else { $null }
    $enlacesDoc = [Collections.Generic.List[string]]::new()
    if (-not $esIndice) {
      $enlacesDoc.Add("<a class=""dz-item"" href=""$pdfSameHref"" target=""_blank"" rel=""noopener""><span class=""dz-tipo"">PDF</span><b>$pdfLabel</b></a>")
      if ($pdfOtroHref) { $enlacesDoc.Add("<a class=""dz-item"" href=""$pdfOtroHref"" target=""_blank"" rel=""noopener""><span class=""dz-tipo"">PDF</span><b>$otroLabel</b></a>") }
    }
    if ($otroHtmlHref) { $enlacesDoc.Add("<a class=""dz-item"" href=""$otroHtmlHref"" hreflang=""$otroLang""><span class=""dz-tipo html"">HTML</span><b>$otroLabel</b></a>") }

    $codigosHerr = if ($esIndice -or $rel -like '03_*') { @($herramientas.Keys) } else {
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

    $pie = $(if ($titulo -match 'SEVEN-G') { $titulo } else { "SEVEN-G · $titulo" }).Replace('"', "'")
    $html = $template
    foreach ($k in $t.Keys) { if ($k -like 'T_*') { $html = $html.Replace("{{$k}}", (Enc $t[$k])) } }
    $html = $html.Replace('{{LANG}}', $lang).
                  Replace('{{TITLE}}', (Enc $titulo)).
                  Replace('{{CSS}}', $css).
                  Replace('{{PIE}}', $pie).
                  Replace('{{IDIOMAS}}', $idiomasHtml).
                  Replace('{{HOME_HREF}}', $homeHref).
                  Replace('{{NAV_ITEMS}}', $navItemsJson).
                  Replace('{{PORTADA}}', $portada).
                  Replace('{{INDICE}}', $indiceHtml).
                  Replace('{{DESCARGAS_PANEL}}', ($descargasPanel -join '')).
                  Replace('{{DESCARGAS_ZONA}}', $zonaDescargas).
                  Replace('{{BODY}}', $body).
                  Replace('{{SCRIPTS}}', $(if ($script:hayMermaid) { $mermaidScript } else { '' })).
                  Replace('{{GENERATED}}', (Get-Date -Format 'dd-MM-yyyy'))
    Set-Content -Path $htmlOut -Value $html -Encoding utf8 -NoNewline
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
