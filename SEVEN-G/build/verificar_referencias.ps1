<#
.SYNOPSIS
  Comprueba que las URL del registro de fuentes externas (build/referencias/*.json) responden.

.DESCRIPTION
  Recorre todas las referencias con estado "verificado" y hace una petición a url_es y url_en.
  Informa del código HTTP y marca como fallo cualquier respuesta distinta de 2xx/3xx.
  Algunos sitios oficiales (p. ej. EUR-Lex o iso.org) pueden rechazar peticiones automatizadas
  con 403/405 aunque la página exista: esos casos se listan como "revisar a mano".
  Ejecutar antes de publicar (D41).

.EXAMPLE
  pwsh -File SEVEN-G/build/verificar_referencias.ps1
#>
$ErrorActionPreference = 'Stop'
$dir = Join-Path $PSScriptRoot 'referencias'
$filas = [Collections.Generic.List[object]]::new()
$cabeceras = @{ 'User-Agent' = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) SEVEN-G-verificador'; 'Accept-Language' = 'es,en;q=0.8' }
foreach ($j in (Get-ChildItem $dir -File -Filter '*.json' | Sort-Object Name)) {
  foreach ($r in @(Get-Content $j.FullName -Raw -Encoding utf8 | ConvertFrom-Json)) {
    if ($r.estado -ne 'verificado') { $filas.Add([PSCustomObject]@{ id = $r.id; idioma = '-'; codigo = '-'; resultado = "estado $($r.estado)"; url = '' }); continue }
    foreach ($par in @(@('es', $r.url_es), @('en', $r.url_en))) {
      if ($par[0] -eq 'en' -and $r.url_en -eq $r.url_es) { continue }
      $codigo = 0
      try {
        $resp = Invoke-WebRequest -Uri $par[1] -Method Get -Headers $cabeceras -MaximumRedirection 10 -TimeoutSec 30 -SkipHttpErrorCheck
        $codigo = [int]$resp.StatusCode
      } catch { $codigo = -1 }
      $res = if ($codigo -ge 200 -and $codigo -lt 400) { 'OK' } elseif ($codigo -in 401, 403, 405, 429) { 'revisar a mano' } else { 'FALLO' }
      $filas.Add([PSCustomObject]@{ id = $r.id; idioma = $par[0]; codigo = $codigo; resultado = $res; url = $par[1] })
    }
  }
}
$filas | Sort-Object resultado, id | Format-Table -AutoSize | Out-String -Width 250
$fallos = @($filas | Where-Object resultado -eq 'FALLO')
Write-Host ("Total comprobaciones: {0} · OK: {1} · revisar a mano: {2} · fallos: {3}" -f $filas.Count, @($filas | Where-Object resultado -eq 'OK').Count, @($filas | Where-Object resultado -eq 'revisar a mano').Count, $fallos.Count)
if ($fallos.Count) { exit 1 }
