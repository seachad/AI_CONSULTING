# Crosswalk de cobertura (D149): la fuente única es build/crosswalk/crosswalk.json y este script escribe sus tablas en el
# documento 34 §9.1 (ES/EN), entre las marcas <!-- crosswalk:inicio --> y <!-- crosswalk:fin -->. No se editan las tablas a
# mano. Lo ejecuta build.ps1 antes de generar los HTML; también puede ejecutarse solo:
#   pwsh -File SEVEN-G/build/crosswalk.ps1            (escribe el 34 en los dos idiomas)
#   pwsh -File SEVEN-G/build/crosswalk.ps1 -Comprobar (sale con 1 si algún documento no está al día; no escribe)
param([switch]$Comprobar)
$repoCw = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path

function Leer-Crosswalk {
  $cw = Get-Content (Join-Path $PSScriptRoot 'crosswalk/crosswalk.json') -Raw -Encoding utf8 | ConvertFrom-Json
  $ids = @($cw.normas | ForEach-Object id)
  $nucleo = 1..14 | ForEach-Object { 'N-{0:00}' -f $_ }
  foreach ($f in $cw.filas) {
    if ($ids -notcontains $f.norma) { throw "crosswalk.json: norma desconocida «$($f.norma)»" }
    if (-not $cw.coberturas.($f.cobertura)) { throw "crosswalk.json: cobertura desconocida «$($f.cobertura)» en $($f.norma) $($f.ref)" }
    foreach ($n in @($f.nucleo)) { if ($nucleo -notcontains $n) { throw "crosswalk.json: regla del núcleo desconocida «$n»" } }
    if (-not $f.tema.es -or -not $f.tema.en) { throw "crosswalk.json: falta el tema en ES o EN en $($f.norma) $($f.ref)" }
    if ($f.cobertura -ne 'directa' -and (-not $f.nota.es -or -not $f.nota.en)) { throw "crosswalk.json: una cobertura distinta de «directa» necesita nota en ES y EN ($($f.norma) $($f.ref))" }
  }
  $cw
}

function Texto($v, [string]$lang) { if ($v -is [string]) { $v } else { $v.$lang } }
function Celda([string]$s) { if ("$s".Trim()) { "$s".Replace('|', '\|') } else { '—' } }

function Md-Crosswalk($cw, [string]$lang) {
  $T = @{
    es = @{ cab = '| Ref. | Tema (resumen propio) | Núcleo | Dónde en SEVEN-G | Evidencia | Cobertura | Nota |'
            res = '| Norma | Filas | Directa | Parcial | Requiere control externo | No cubierto |'; total = '**Total**'
            nota = 'Generado desde `crosswalk.json` (versión {0}, {1}; versión del núcleo {2}). No se edita a mano.' }
    en = @{ cab = '| Ref. | Topic (own summary) | Core | Where in SEVEN-G | Evidence | Coverage | Note |'
            res = '| Standard | Rows | Direct | Partial | Requires external control | Not covered |'; total = '**Total**'
            nota = 'Generated from `crosswalk.json` (version {0}, {1}; core version {2}). Not edited by hand.' }
  }[$lang]
  $o = [Collections.Generic.List[string]]::new()
  $o.Add(($T.nota -f $cw.version, $cw.fecha, $cw.version_nucleo)); $o.Add('')
  $o.Add($T.res); $o.Add('|---|---|---|---|---|---|')
  $tot = @{ n = 0; directa = 0; parcial = 0; externo = 0; no_cubierto = 0 }
  foreach ($n in $cw.normas) {
    $fs = @($cw.filas | Where-Object norma -eq $n.id)
    $c = @{}; foreach ($k in 'directa', 'parcial', 'externo', 'no_cubierto') { $c[$k] = @($fs | Where-Object cobertura -eq $k).Count; $tot[$k] += $c[$k] }
    $tot.n += $fs.Count
    $o.Add("| $($n.nombre.$lang) | $($fs.Count) | $($c.directa) | $($c.parcial) | $($c.externo) | $($c.no_cubierto) |")
  }
  $o.Add("| $($T.total) | $($tot.n) | $($tot.directa) | $($tot.parcial) | $($tot.externo) | $($tot.no_cubierto) |")
  foreach ($n in $cw.normas) {
    $o.Add(''); $o.Add("**$($n.nombre.$lang)**"); $o.Add('')
    $o.Add($T.cab); $o.Add('|---|---|---|---|---|---|---|')
    foreach ($f in @($cw.filas | Where-Object norma -eq $n.id)) {
      $cob = $cw.coberturas.($f.cobertura).$lang
      if ($f.cobertura -ne 'directa') { $cob = "**$cob**" }
      $o.Add('| ' + ((Celda (Texto $f.ref $lang)), (Celda $f.tema.$lang), (Celda (@($f.nucleo) -join ', ')), (Celda (Texto $f.seveng $lang)),
        (Celda $f.evidencia), $cob, (Celda $f.nota.$lang) -join ' | ') + ' |')
    }
  }
  $o -join "`n"
}

$cw = Leer-Crosswalk
$desfasados = @()
foreach ($lang in 'es', 'en') {
  $doc = Get-ChildItem (Join-Path $repoCw "SEVEN-G/mds/$lang") -Filter '34_SEVEN-G_*.md' | Select-Object -First 1
  $txt = [IO.File]::ReadAllText($doc.FullName)
  $rx = [regex]'(?s)(<!-- crosswalk:inicio -->).*?(<!-- crosswalk:fin -->)'
  if (-not $rx.IsMatch($txt)) { throw "$($doc.Name): faltan las marcas <!-- crosswalk:inicio --> y <!-- crosswalk:fin -->" }
  $md = Md-Crosswalk $cw $lang
  $nuevo = $rx.Replace($txt, { param($m) $m.Groups[1].Value + "`n" + $md + "`n" + $m.Groups[2].Value }, 1)
  if ($nuevo -ne $txt) {
    if ($Comprobar) { $desfasados += "$lang/$($doc.Name)" }
    else { [IO.File]::WriteAllText($doc.FullName, $nuevo, [Text.UTF8Encoding]::new($false)); Write-Host "crosswalk: $lang/$($doc.Name) actualizado" }
  }
}
if ($Comprobar) {
  if ($desfasados) { Write-Host "crosswalk: no están al día: $($desfasados -join ', ')"; exit 1 }
  exit 0
}
