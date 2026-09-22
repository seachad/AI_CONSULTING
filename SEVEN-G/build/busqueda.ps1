<#
.SYNOPSIS
  Genera el índice de búsqueda de términos de todo el sitio (D104): SEVEN-G/html/<idioma>/busqueda.json

.DESCRIPTION
  El buscador de términos de la barra de cada página busca «en esta página» (sobre el propio documento, sin índice) o «en todas
  las páginas» (D104). Para lo segundo hace falta el texto de todas las páginas publicadas: este script lo extrae, en cada
  compilación, de los HTML ya generados de SEVEN-G, SPHERES y SPAD (documentos, plantillas, módulos del curso e índices de las
  bibliotecas; no las carpetas _trabajo ni _legacy, que no se publican, ni las páginas sin la barra de los documentos, como la
  entrada ligera o las herramientas), sección por sección (h2 y h3 con su id) y lo escribe en SEVEN-G/html/<idioma>/busqueda.json.

  Formato: { lang, paginas: [ { h (ruta relativa a esta carpeta, como en codigos.js), m (metodología), c (código), t (título),
  s: [ { id, h (título de la sección), x (texto) } ] } ] }. No lleva texto normalizado: lo normaliza el navegador al cargarlo.
  La página lo descarga solo la primera vez que se elige «Todo el sitio» (plantilla.html); la búsqueda se hace en el
  navegador y no sale nada de él. Abierto por file:// el navegador no permite descargarlo y la página lo dice.
  build.ps1 lo ejecuta tras codigos.ps1. El índice no se edita a mano.

.EXAMPLE
  pwsh -File SEVEN-G/build/busqueda.ps1
#>
param([string[]]$Idiomas = @('es', 'en'))

$ErrorActionPreference = 'Stop'
$repo = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)

# texto plano de un fragmento de HTML: las etiquetas en línea (énfasis, enlaces, código) desaparecen sin partir la frase, las de bloque
# separan palabras, se decodifican las entidades y se compacta el espacio
function Texto([string]$html) {
  $t = [regex]::Replace($html, '</?(?:em|strong|b|i|a|code|span|sup|sub|mark|abbr|small|u|s|kbd|var|cite|q)\b[^>]*>', '')
  $t = [regex]::Replace($t, '<[^>]+>', ' ')
  ([Net.WebUtility]::HtmlDecode($t) -replace '\s+', ' ').Trim()
}

foreach ($lang in $Idiomas) {
  $base = Join-Path $repo "SEVEN-G\html\$lang"
  if (-not (Test-Path $base)) { Write-Warning "No existe $base"; continue }
  $paginas = [Collections.Generic.List[object]]::new()
  $nSec = 0
  foreach ($met in 'SEVEN-G', 'SPHERES', 'SPAD') {
    $dir = Join-Path $repo "$met\html\$lang"
    if (-not (Test-Path $dir)) { continue }
    foreach ($f in (Get-ChildItem $dir -Recurse -File -Filter *.html | Where-Object { $_.FullName -notmatch '[\\/]_' } | Sort-Object FullName)) {
      $html = [IO.File]::ReadAllText($f.FullName)
      $m = [regex]::Match($html, '(?s)<main class="contenido"[^>]*>(.*?)</main>')
      if (-not $m.Success) { continue }    # páginas sin la barra de los documentos (entrada ligera): no llevan el buscador
      $cuerpo = [regex]::Replace($m.Groups[1].Value, '(?s)<(script|style|svg)\b[^>]*>.*?</\1>|<pre class="mermaid">.*?</pre>', ' ')
      $h1 = [regex]::Match($html, '(?s)<h1[^>]*>(.*?)</h1>')
      $titulo = if ($h1.Success) { Texto $h1.Groups[1].Value } else { $f.BaseName }
      $rel = [IO.Path]::GetRelativePath($base, $f.FullName).Replace('\', '/')
      $cod = if ($f.Name -match '^([PM]?\d{2})_') { $Matches[1] } elseif ($f.Name -eq 'index.html') { 'index' } else { '' }
      # una sección por encabezado con id (h2, h3); el texto anterior al primero va como sección sin id (portada del contenido)
      $secciones = [Collections.Generic.List[object]]::new()
      $id = ''; $rotulo = ''; $desde = 0
      foreach ($e in [regex]::Matches($cuerpo, '(?s)<h([23]) id="([^"]+)"[^>]*>(.*?)</h\1>')) {
        $txt = Texto $cuerpo.Substring($desde, $e.Index - $desde)
        if ($txt) { $secciones.Add([ordered]@{ id = $id; h = $rotulo; x = $txt }) }
        $id = $e.Groups[2].Value
        $rotulo = Texto ($e.Groups[3].Value -replace '</span>', '</span> ')    # «1 Qué significa…»: el antetítulo numérico separado del título
        $desde = $e.Index + $e.Length
      }
      $txt = Texto $cuerpo.Substring($desde)
      if ($txt -or -not $secciones.Count) { $secciones.Add([ordered]@{ id = $id; h = $rotulo; x = $txt }) }
      $nSec += $secciones.Count
      $paginas.Add([ordered]@{ h = $rel; m = $met; c = $cod; t = $titulo; s = $secciones })
    }
  }
  $json = [ordered]@{ lang = $lang; paginas = $paginas } | ConvertTo-Json -Depth 8 -Compress
  $salida = Join-Path $base 'busqueda.json'
  [IO.File]::WriteAllText($salida, $json, [Text.UTF8Encoding]::new($false))
  Write-Host "busqueda [$lang]: $($paginas.Count) páginas y $nSec secciones -> $salida ($([math]::Round((Get-Item $salida).Length / 1MB, 1)) MB)"
}
