<#
.SYNOPSIS
  Prepara la copia pública del sitio AI Consulting (portada + SEVEN-G + SPHERES + SPAD) para GitHub Pages.

.DESCRIPTION
  El repositorio AI_CONSULTING es privado y contiene material interno. Este script copia SOLO lo publicable
  en la carpeta local de un repositorio público (por defecto C:\SEACHAD\ai-consulting), conservando las rutas
  para que la portada y los enlaces funcionen igual que en local:

    index.html                      portada en español (entrada del sitio)
    en/index.html                   portada en inglés
    SEVEN-G/html/<idioma>/...       documentos e índice de la biblioteca SEVEN-G
    SEVEN-G/pdf/<idioma>/...        PDF de SEVEN-G
    SEVEN-G/herramientas/...        herramientas sin servidor (T01…)
    SPHERES/html/<idioma>/...       documentos e índice de la biblioteca SPHERES
    SPHERES/pdf/<idioma>/...        PDF de SPHERES
    SPAD/html/<idioma>/...          documentos e índice de la biblioteca SPAD
    SPAD/pdf/<idioma>/...           PDF de SPAD
    LICENSE, LICENCIA_CONTENIDOS.md, .nojekyll, README.md

  Nunca copia `_trabajo`, `_legacy`, `.claude`, `build/`, las fuentes Markdown (salvo -ConFuentes), SPAD/Documents ni ficheros que empiezan por `_`.
  Se detiene si encuentra textos internos (`_trabajo`, `notas_internas`, `OneDrive`, rutas `C:\SEACHAD`) o
  cualquiera de los términos prohibidos de la lista privada -TerminosProhibidos (un término por línea; p. ej.,
  nombres de clientes). Esa lista NO debe estar en ningún repositorio.

  No hace commit ni push.

.EXAMPLE
  pwsh -File SEVEN-G/build/publicar.ps1                      # genera todo y prepara la copia
  pwsh -File SEVEN-G/build/publicar.ps1 -SinGenerar          # usa las salidas ya generadas
  pwsh -File SEVEN-G/build/publicar.ps1 -ConFuentes          # incluye también <metodología>/mds/es y en (sin _trabajo)
#>
param(
  [string]$Destino = 'C:\SEACHAD\ai-consulting',
  [string]$TerminosProhibidos = (Join-Path $env:USERPROFILE '.seveng\terminos_prohibidos.txt'),
  [switch]$SinGenerar,
  [switch]$ConFuentes
)

$ErrorActionPreference = 'Stop'
$sevenG = Split-Path -Parent $PSScriptRoot          # ...\AI_CONSULTING\SEVEN-G
$raiz   = Split-Path -Parent $sevenG                # ...\AI_CONSULTING
$marca  = '.sitio-ai-consulting'

# ---- Salvaguardas del destino ----
$destinoAbs = [IO.Path]::GetFullPath($Destino)
if ($destinoAbs.TrimEnd('\') -eq $raiz.TrimEnd('\') -or $destinoAbs.StartsWith($raiz + '\')) { throw 'El destino no puede ser el repositorio privado AI_CONSULTING ni una carpeta suya.' }
if (Test-Path $destinoAbs) {
  $contenido = Get-ChildItem $destinoAbs -Force | Where-Object Name -notin '.git', $marca
  if ($contenido -and -not (Test-Path (Join-Path $destinoAbs $marca))) { throw "El destino ya tiene contenido que no ha creado este script: $destinoAbs" }
} else {
  New-Item -ItemType Directory -Force $destinoAbs | Out-Null
}

if (-not $SinGenerar) {
  Write-Host 'Generando HTML y PDF de SEVEN-G, SPHERES y SPAD...'
  & pwsh -NoProfile -File (Join-Path $PSScriptRoot 'build.ps1')
  if ($LASTEXITCODE) { throw 'La generación ha fallado.' }
}

# ---- Copia limpia (se conserva .git) ----
Get-ChildItem $destinoAbs -Force | Where-Object Name -ne '.git' | Remove-Item -Recurse -Force -Confirm:$false
Set-Content -Path (Join-Path $destinoAbs $marca) -Value 'Carpeta generada por SEVEN-G/build/publicar.ps1. No editar a mano.' -Encoding utf8

$excluir = '[\\/](_trabajo|_legacy|\.claude|build)([\\/]|$)|[\\/]_[^\\/]*$'
$copiados = 0
function Copiar([string]$origen, [string]$relDestino) {
  $dst = Join-Path $destinoAbs $relDestino
  New-Item -ItemType Directory -Force (Split-Path $dst) | Out-Null
  Copy-Item $origen $dst
  $script:copiados++
}
foreach ($f in @('index.html', 'en\index.html', 'LICENSE', 'LICENCIA_CONTENIDOS.md')) {
  $o = Join-Path $raiz $f
  if (Test-Path $o) { Copiar $o $f } else { Write-Warning "No existe $f" }
}
$publicables = @{ 'SEVEN-G' = @('html', 'pdf', 'herramientas'); 'SPHERES' = @('html', 'pdf'); 'SPAD' = @('html', 'pdf') }
foreach ($metodologia in $publicables.Keys) {
  $carpetas = $publicables[$metodologia]; if ($ConFuentes) { $carpetas += 'mds' }
  foreach ($c in $carpetas) {
    $origen = Join-Path $raiz "$metodologia\$c"
    if (-not (Test-Path $origen)) { continue }
    foreach ($f in (Get-ChildItem $origen -Recurse -File)) {
      $rel = [IO.Path]::GetRelativePath($raiz, $f.FullName)
      if ("\$rel" -match $excluir) { continue }
      Copiar $f.FullName $rel
    }
  }
}
Set-Content -Path (Join-Path $destinoAbs '.nojekyll') -Value '' -Encoding utf8
$readme = @'
# AI Consulting · SEACHAD

Sitio público con las metodologías de inteligencia artificial de SEACHAD: **SEVEN-G** (marco principal), **SPHERES** y **SPAD** (metodologías de apoyo, en construcción).

- Entrada del sitio: `index.html` (español) · `en/index.html` (English).
- Contenido generado automáticamente desde un repositorio de trabajo privado. No se edita aquí.

**Aviso legal y exención de responsabilidad.** Estos contenidos y herramientas se ofrecen «tal cual» y con fines exclusivamente informativos. No constituyen asesoramiento jurídico, regulatorio, financiero ni profesional, ni garantizan el cumplimiento de ninguna norma. Las referencias a regulación general y sectorial pueden quedar desactualizadas. Cada organización que los use es la única responsable de identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio. El autor y SEACHAD no asumen responsabilidad alguna por su uso. Los datos de ejemplo son ficticios.

© 2026 Fernando García · SEACHAD. Contenidos: CC BY 4.0 (`LICENCIA_CONTENIDOS.md`). Código: MIT (`LICENSE`).
'@
Set-Content -Path (Join-Path $destinoAbs 'README.md') -Value $readme -Encoding utf8

# ---- Verificaciones ----
$errores = [Collections.Generic.List[string]]::new()
$patronesInternos = @('_trabajo', 'notas_internas', 'OneDrive', 'C:\SEACHAD', 'C:/SEACHAD')
$legibles = Get-ChildItem $destinoAbs -Recurse -File -Include *.html, *.md, *.json, *.csv, *.txt | Where-Object { $_.FullName -notmatch '[\\/]\.git[\\/]' }
foreach ($t in $legibles) {
  $texto = [IO.File]::ReadAllText($t.FullName)
  foreach ($p in $patronesInternos) {
    if ($texto.IndexOf($p, [StringComparison]::OrdinalIgnoreCase) -ge 0) { $errores.Add("Texto interno '$p' en $([IO.Path]::GetRelativePath($destinoAbs, $t.FullName))") }
  }
}
if (Test-Path $TerminosProhibidos) {
  $terminos = Get-Content $TerminosProhibidos -Encoding utf8 | Where-Object { $_.Trim() -and -not $_.StartsWith('#') } | ForEach-Object { $_.Trim() }
  foreach ($t in (Get-ChildItem $destinoAbs -Recurse -File | Where-Object { $_.FullName -notmatch '[\\/]\.git[\\/]' })) {
    $texto = if ($t.Extension -in '.html', '.md', '.json', '.csv', '.txt') { [IO.File]::ReadAllText($t.FullName) } else { $null }
    foreach ($term in $terminos) {
      # una línea «re:<expresión>» es una expresión regular (igual que en verificar_coherencia.ps1); el resto, texto literal
      $hay = if ($term.StartsWith('re:')) { $rx = [regex]::new($term.Substring(3), 'IgnoreCase'); $rx.IsMatch($t.Name) -or ($texto -and $rx.IsMatch($texto)) }
             else { $t.Name.IndexOf($term, [StringComparison]::OrdinalIgnoreCase) -ge 0 -or ($texto -and $texto.IndexOf($term, [StringComparison]::OrdinalIgnoreCase) -ge 0) }
      if ($hay) {
        $errores.Add("Término prohibido en $([IO.Path]::GetRelativePath($destinoAbs, $t.FullName))")
      }
    }
  }
  Write-Host "Términos prohibidos comprobados: $($terminos.Count) (los PDF se comprueban a través de sus HTML de origen)."
} else {
  Write-Warning "No existe la lista privada de términos prohibidos ($TerminosProhibidos). Créala antes de publicar."
}

# Enlaces relativos de la portada
foreach ($p in @('index.html', 'en\index.html')) {
  $ruta = Join-Path $destinoAbs $p
  $texto = [IO.File]::ReadAllText($ruta)
  foreach ($m in [regex]::Matches($texto, 'href="([^"#:]+)"')) {
    if (-not (Test-Path (Join-Path (Split-Path $ruta) $m.Groups[1].Value))) { $errores.Add("Enlace roto en $p -> $($m.Groups[1].Value)") }
  }
}

Write-Host "Ficheros copiados: $copiados en $destinoAbs"
if ($errores.Count) {
  $errores | Select-Object -Unique | ForEach-Object { Write-Warning $_ }
  throw "Verificación fallida: $($errores.Count) problemas. No publiques hasta resolverlos."
}
Write-Host 'Verificación correcta. Revisa `git status` en el repositorio público antes de hacer commit y push.'
