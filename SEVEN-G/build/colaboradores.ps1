# Hall of Fame de la portada (D121, D140, D142): la lista de personas vive en colaboradores.json (raíz del repositorio) y
# este script la escribe entre las marcas <!-- colaboradores:inicio --> y <!-- colaboradores:fin --> de index.html y
# en/index.html. Se edita el JSON a mano, nunca las tarjetas. Lo ejecuta build.ps1; también puede ejecutarse solo:
#   pwsh -File SEVEN-G/build/colaboradores.ps1            (escribe las dos portadas)
#   pwsh -File SEVEN-G/build/colaboradores.ps1 -Comprobar (sale con 1 si alguna portada no está al día; no escribe)
param([switch]$Comprobar)
$repoCol = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path

$papeles = @{
  creador  = @{ es = 'Creador y propietario de las metodologías'; en = 'Creator and owner of the methodologies' }
  revision = @{ es = 'Revisión y propuestas de mejora'; en = 'Review and suggestions for improvement' }
}

function Leer-Colaboradores([string]$repo) {
  $json = Get-Content (Join-Path $repo 'colaboradores.json') -Raw -Encoding utf8 | ConvertFrom-Json
  $personas = @($json.personas)
  if (-not $personas.Count) { throw 'colaboradores.json: la lista «personas» está vacía' }
  foreach ($p in $personas) {
    foreach ($c in 'nombre', 'empresa', 'linkedin', 'papel') {
      if (-not "$($p.$c)".Trim()) { throw "colaboradores.json: falta «$c» en $($p | ConvertTo-Json -Compress)" }
    }
    if ($p.linkedin -notmatch '^https://(www\.)?linkedin\.com/in/[^/\s"<>]+/?$') { throw "colaboradores.json: «linkedin» no es un perfil de LinkedIn: $($p.linkedin)" }
    if (-not $papeles.ContainsKey($p.papel) -and -not ($p.papel_es -and $p.papel_en)) { throw "colaboradores.json: papel «$($p.papel)» desconocido (creador o revision, o papel_es y papel_en)" }
  }
  # el creador va primero; el resto, en el orden del fichero
  @($personas | Where-Object papel -eq 'creador') + @($personas | Where-Object papel -ne 'creador')
}

function Html-Colaboradores($personas, [string]$lang) {
  $e = { param($s) "$s".Trim().Replace('&', '&amp;').Replace('<', '&lt;').Replace('>', '&gt;').Replace('"', '&quot;') }
  $pre = if ($lang -eq 'en') { 'LinkedIn profile of ' } else { 'Perfil de LinkedIn de ' }
  $filas = foreach ($p in $personas) {
    $papel = if ($p."papel_$lang") { $p."papel_$lang" } else { $papeles[$p.papel][$lang] }
    $clase = if ($p.papel -eq 'creador') { ' class="autor"' } else { '' }
    "      <li$clase><b><a href=""$(& $e $p.linkedin)"" target=""_blank"" rel=""noopener"" title=""$pre$(& $e $p.nombre)"">$(& $e $p.nombre)</a></b><span class=""empresa"">$(& $e $p.empresa)</span><span>$(& $e $papel)</span></li>"
  }
  "<!-- colaboradores:inicio (no editar: se genera desde colaboradores.json con SEVEN-G/build/colaboradores.ps1) -->`n" + ($filas -join "`n") + "`n      <!-- colaboradores:fin -->"
}

function Actualizar-Colaboradores([string]$repo, [switch]$Comprobar) {
  $personas = Leer-Colaboradores $repo
  $desfasadas = @()
  foreach ($lang in 'es', 'en') {
    $ruta = Join-Path $repo $(if ($lang -eq 'en') { 'en/index.html' } else { 'index.html' })
    $html = [IO.File]::ReadAllText($ruta)
    $re = '(?s)<!-- colaboradores:inicio.*?<!-- colaboradores:fin -->'
    if ($html -notmatch $re) { throw "$ruta`: faltan las marcas <!-- colaboradores:inicio --> y <!-- colaboradores:fin -->" }
    $nuevo = [regex]::Replace($html, $re, [Text.RegularExpressions.MatchEvaluator] { param($m) Html-Colaboradores $personas $lang })
    if ($nuevo -ne $html) {
      $desfasadas += $ruta
      if (-not $Comprobar) { [IO.File]::WriteAllText($ruta, $nuevo, [Text.UTF8Encoding]::new($false)) }
    }
  }
  $desfasadas
}

if ($MyInvocation.InvocationName -ne '.') {
  $ErrorActionPreference = 'Stop'
  $d = @(Actualizar-Colaboradores $repoCol -Comprobar:$Comprobar)
  if ($Comprobar) {
    if ($d.Count) { Write-Host "Hall of Fame sin actualizar desde colaboradores.json: $($d -join ', ')"; exit 1 }
    Write-Host 'Hall of Fame al día con colaboradores.json'
  } else { Write-Host "Hall of Fame: $(if ($d.Count) { 'actualizadas ' + ($d -join ', ') } else { 'sin cambios' })" }
}
