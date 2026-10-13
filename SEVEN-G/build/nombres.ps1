# Lista única de nombres canónicos de SEVEN-G (D155): código → nombre, en español e inglés.
# Fuente de la regla «nombre primero, código después» (02 §2.4, R16): toda mención a un elemento con código
# se escribe con el nombre de esta lista y el código entre paréntesis. La lista no se edita a mano:
#   pwsh -File SEVEN-G/build/nombres.ps1            escribe SEVEN-G/build/nombres.json
#   pwsh -File SEVEN-G/build/nombres.ps1 -Comprobar  sale con 1 si el fichero no está al día
# De dónde sale cada nombre: documentos, plantillas, módulos del curso y herramientas, del índice de códigos
# (html/<idioma>/codigos.js, que genera codigos.ps1); fases y puertas, de 01 §6.1; ciclo corporativo, de 01 §5.1;
# dimensiones de madurez, de 11 §2.1; hitos, arquetipos y modificadores, de 96 §4.1, §2.1 y §2.3.
param([switch]$Comprobar)
$ErrorActionPreference = 'Stop'
$raiz = (Resolve-Path (Join-Path $PSScriptRoot '../..')).Path
$salida = Join-Path $PSScriptRoot 'nombres.json'

function Limpiar([string]$s) {
  $s = $s -replace '\*\*', '' -replace '\*', '' -replace '\[([^\]]+)\]\([^)]*\)', '$1' -replace '<[^>]+>', ''
  $s = [regex]::Replace($s, '\s*\((?:principal|main)[^)]*\)', '')   # «(principal puerta de parada)»
  $s = [regex]::Replace($s, '\s*\((?:periódica|periodic)\)', '')
  ($s -replace '\s+', ' ').Trim()
}
function Tabla([string]$md, [string]$desde, [string]$hasta) {
  $i = $md.IndexOf($desde); if ($i -lt 0) { return @() }
  $j = if ($hasta) { $md.IndexOf($hasta, $i + $desde.Length) } else { -1 }
  $seg = if ($j -gt $i) { $md.Substring($i, $j - $i) } else { $md.Substring($i) }
  @($seg -split "`n" | Where-Object { $_ -match '^\|' -and $_ -notmatch '^\|\s*-' })
}
function Celdas([string]$fila) { @(($fila.Trim() -replace '^\||\|$', '') -split '\|' | ForEach-Object { $_.Trim() }) }

$resultado = [ordered]@{ generado = (Get-Date -Format 'yyyy-MM-dd'); regla = 'Nombre primero, código entre paréntesis (02 §2.4, R16). Generado por SEVEN-G/build/nombres.ps1: no editar a mano.' }
foreach ($lang in 'es', 'en') {
  $en = $lang -eq 'en'
  $mds = Join-Path $raiz "SEVEN-G/mds/$lang"
  $nombres = [ordered]@{}
  function Poner([string]$codigo, [string]$tipo, [string]$nombre) {
    if (-not $nombre) { return }
    if (-not $nombres.Contains($codigo)) { $nombres[$codigo] = [ordered]@{ tipo = $tipo; nombre = (Limpiar $nombre) } }
  }

  # 1. Documentos, plantillas, módulos y herramientas: del índice de códigos
  $js = Get-Content (Join-Path $raiz "SEVEN-G/html/$lang/codigos.js") -Raw -Encoding utf8
  $ini = $js.IndexOf('var DATOS = {'); if ($ini -lt 0) { throw "codigos.js ($lang): no se encuentra DATOS" }
  $ini += 'var DATOS = '.Length
  $prof = 0; $enCadena = $false; $fin = -1
  for ($i = $ini; $i -lt $js.Length; $i++) {
    $ch = $js[$i]
    if ($enCadena) { if ($ch -eq '\\') { $i++ } elseif ($ch -eq '"') { $enCadena = $false }; continue }
    if ($ch -eq '"') { $enCadena = $true } elseif ($ch -eq '{') { $prof++ } elseif ($ch -eq '}') { $prof--; if ($prof -eq 0) { $fin = $i; break } }
  }
  if ($fin -lt 0) { throw "codigos.js ($lang): DATOS sin cerrar" }
  $datos = $js.Substring($ini, $fin - $ini + 1) | ConvertFrom-Json -AsHashtable
  foreach ($cod in $datos.exactos.Keys) {
    foreach ($e in $datos.exactos[$cod]) {
      $t = ($e.t -split ' — ')[0]
      switch ($e.k) {
        'doc' { Poner $cod 'documento' $t }
        'pla' { Poner $cod 'plantilla' $t }
        'mod' { Poner $cod 'modulo' ($t -replace '^(Módulo|Module) \d+ · ', '') }
        'her' { Poner $cod 'herramienta' $t }
        'esfera' { $n = [regex]::Match($t, '^(?:Esfera|Sphere) (\d{2}) · (.+)$'); if ($n.Success) { Poner "$(if ($en) { 'sphere' } else { 'esfera' }) $($n.Groups[1].Value)" 'esfera' $n.Groups[2].Value } }
      }
    }
  }

  # 2. Fases y puertas: 01 §6.1
  $d01 = Get-Content (Get-ChildItem $mds -Filter '01_*.md' | Select-Object -First 1).FullName -Raw -Encoding utf8
  foreach ($f in Tabla $d01 '### 6.1' '### 6.2') {
    $c = Celdas $f
    if ($c.Count -ge 4 -and $c[0] -match '^\d$') {
      Poner "$(if ($en) { 'phase' } else { 'fase' }) $($c[0])" 'fase' $c[1]
      $p = [regex]::Match($c[3], '^(G\d|R6)\s*·\s*(.+)$')
      if ($p.Success) { Poner $p.Groups[1].Value 'puerta' $p.Groups[2].Value }
    }
  }
  # 3. Ciclo corporativo C1–C5: 01 §5.1
  foreach ($f in Tabla $d01 '### 5.1' '### 5.2') {
    $c = Celdas $f; $p = [regex]::Match($c[0], '^\*\*(C[1-5])\s*·\s*(.+?)\*\*$')
    if ($p.Success) { Poner $p.Groups[1].Value 'ciclo' $p.Groups[2].Value }
  }
  # 4. Dimensiones de madurez: 11 §2.1
  $d11 = Get-Content (Get-ChildItem $mds -Filter '11_*.md' | Select-Object -First 1).FullName -Raw -Encoding utf8
  foreach ($f in Tabla $d11 '### 2.1' '### 2.2') {
    $c = Celdas $f; if ($c.Count -ge 2 -and $c[0] -match '^\*\*(D[1-7])\*\*$') { Poner $Matches[1] 'dimension' $c[1] }
  }
  # 5. Hitos, arquetipos y modificadores: 96
  $d96 = Get-Content (Get-ChildItem $mds -Filter '96_*.md' | Select-Object -First 1).FullName -Raw -Encoding utf8
  foreach ($f in Tabla $d96 '### 4.1' '### 4.2') {
    $c = Celdas $f; if ($c.Count -ge 3 -and $c[0] -match '^\*\*(HI-\d{2})\*\*$') { Poner $Matches[1] 'hito' $c[2] }
  }
  foreach ($f in Tabla $d96 '### 2.1' '### 2.2') {
    $c = Celdas $f; if ($c.Count -ge 2 -and $c[0] -match '^\*\*(PP-[A-F])\*\*$') { Poner $Matches[1] 'arquetipo' $c[1] }
  }
  foreach ($f in Tabla $d96 '### 2.3' '### 2.4') {
    $c = Celdas $f; if ($c.Count -ge 2 -and $c[0] -match '^\*\*(MP\d)\*\*$') { Poner $Matches[1] 'modificador' ($c[1] -replace '\s*\(.*$', '') }
  }
  $resultado[$lang] = $nombres
}

$json = $resultado | ConvertTo-Json -Depth 5
$json = [regex]::Replace($json, '\\u([0-9a-fA-F]{4})', { param($m) [char][Convert]::ToInt32($m.Groups[1].Value, 16) })
if ($Comprobar) {
  $actual = if (Test-Path $salida) { [IO.File]::ReadAllText($salida) } else { '' }
  $a = ($actual -replace '"generado":\s*"[^"]+"', '') -replace '\s', ''; $b = ($json -replace '"generado":\s*"[^"]+"', '') -replace '\s', ''
  if ($a -ne $b) { Write-Host 'nombres.json no está al día: ejecutar pwsh -File SEVEN-G/build/nombres.ps1'; exit 1 }
  Write-Host "nombres.json al día ($($resultado.es.Count) nombres en es, $($resultado.en.Count) en en)"
} else {
  [IO.File]::WriteAllText($salida, $json + "`n", [Text.UTF8Encoding]::new($false))
  Write-Host "nombres.json: $($resultado.es.Count) nombres en es, $($resultado.en.Count) en en"
}
