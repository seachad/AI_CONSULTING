<#
.SYNOPSIS
  Genera el PDF único del curso completo de SEVEN-G, con el contenido de los diez módulos (guía + M01–M09).

.DESCRIPTION
  Fuente:  SEVEN-G/html/<idioma>/curso/M00..M09_*.html (ya generados por build.ps1)
  Salida:  SEVEN-G/pdf/<idioma>/curso/SEVEN-G_Curso_completo.pdf

  Reutiliza la cabecera (head, estilos) de M00 y concatena la portada y el contenido de cada módulo, con salto de
  página entre ellos, en un fichero temporal dentro de html/<idioma>/curso (para que los enlaces relativos del
  contenido sigan resolviendo) que se imprime con Edge sin ventana, igual que el resto de PDF de la biblioteca.
  El temporal se borra al terminar. Requiere que build.ps1 se haya ejecutado antes (necesita el HTML de los módulos).

.EXAMPLE
  pwsh -File SEVEN-G/build/curso_pdf.ps1
#>
param(
  [string[]]$Idiomas = @('es', 'en')
)

$ErrorActionPreference = 'Stop'
$repo = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)

$browserPaths = @(
  "${env:ProgramFiles(x86)}\Microsoft\Edge\Application\msedge.exe",
  "$env:ProgramFiles\Microsoft\Edge\Application\msedge.exe",
  "${env:ProgramFiles(x86)}\Google\Chrome\Application\chrome.exe",
  "$env:ProgramFiles\Google\Chrome\Application\chrome.exe"
)
$browser = $browserPaths | Where-Object { Test-Path $_ } | Select-Object -First 1
if (-not $browser) { throw 'No se encuentra Edge ni Chrome para generar el PDF del curso.' }

$titulos = @{ es = 'Curso de SEVEN-G · Guía y nueve módulos'; en = 'SEVEN-G course · Guide and nine modules' }

foreach ($lang in $Idiomas) {
  $cursoDir = Join-Path $repo "SEVEN-G\html\$lang\curso"
  if (-not (Test-Path $cursoDir)) { Write-Warning "No existe $cursoDir (ejecute build.ps1 antes)"; continue }
  $m00 = Get-ChildItem $cursoDir -Filter 'M00_*.html' | Select-Object -First 1
  if (-not $m00) { Write-Warning "No hay M00 en $cursoDir"; continue }
  $modulos = Get-ChildItem $cursoDir -Filter 'M*.html' | Where-Object { $_.Name -notlike '_CURSO_COMPLETO*' } | Sort-Object Name

  $plantilla = Get-Content -LiteralPath $m00.FullName -Raw -Encoding utf8

  $bloques = @()
  $primero = $true
  foreach ($f in $modulos) {
    $html = Get-Content -LiteralPath $f.FullName -Raw -Encoding utf8
    $mHeader = [regex]::Match($html, '(?s)<header class="portada">.*?</header>')
    $mMain = [regex]::Match($html, '(?s)<main class="contenido" id="contenido">.*?</main>')
    if (-not $mHeader.Success -or -not $mMain.Success) { Write-Warning "No se pudo extraer contenido de $($f.Name)"; continue }
    $salto = if ($primero) { '' } else { '<div style="page-break-before:always"></div>' }
    $bloques += "$salto`n$($mHeader.Value)`n$($mMain.Value)"
    $primero = $false
  }
  $cuerpoCompleto = $bloques -join "`n"

  # sustituye la portada + el contenido de M00 por la concatenación de los diez módulos
  # (MatchEvaluator, no una cadena de reemplazo: el cuerpo puede contener '$' que .NET interpretaría como referencia de grupo)
  $combinado = [regex]::Replace($plantilla, '(?s)<header class="portada">.*?</header>\s*<section class="descargas-zona".*?</section>\s*<nav class="indice">.*?</nav>\s*<main class="contenido" id="contenido">.*?</main>', { param($x) $cuerpoCompleto }, 1)
  $combinado = $combinado -replace '(?s)<title>.*?</title>', "<title>$([System.Security.SecurityElement]::Escape($titulos[$lang]))</title>"

  $tmpHtml = Join-Path $cursoDir '_CURSO_COMPLETO_temp.html'
  [System.IO.File]::WriteAllText($tmpHtml, $combinado, [System.Text.UTF8Encoding]::new($false))

  $pdfDir = Join-Path $repo "SEVEN-G\pdf\$lang\curso"
  New-Item -ItemType Directory -Force $pdfDir | Out-Null
  $pdfOut = Join-Path $pdfDir 'SEVEN-G_Curso_completo.pdf'
  $perfil = Join-Path $env:TEMP "seveng-curso-pdf-$PID"
  $uri = ([Uri]$tmpHtml).AbsoluteUri
  $argumentos = @('--headless=new', '--disable-gpu', '--no-first-run', '--no-pdf-header-footer',
                  '--virtual-time-budget=20000', "--user-data-dir=`"$perfil`"", "--print-to-pdf=`"$pdfOut`"", $uri)
  Start-Process -FilePath $browser -ArgumentList $argumentos -Wait -WindowStyle Hidden
  Remove-Item $tmpHtml -Force -ErrorAction SilentlyContinue
  Remove-Item $perfil -Recurse -Force -ErrorAction SilentlyContinue
  if (Test-Path $pdfOut) { Write-Host "$lang : $($modulos.Count) módulos -> $pdfOut" }
  else { Write-Warning "$lang : no se generó $pdfOut" }
}
