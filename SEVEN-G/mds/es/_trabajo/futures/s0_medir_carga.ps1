<#
  S0 · Línea base de la carga de gobierno (plan de sprints del 01-10-2026, D143).
  Uso: pwsh -File SEVEN-G/mds/es/_trabajo/futures/s0_medir_carga.ps1
  Lee el catálogo de criterios y el de riesgos tipo de T01 y las plantillas, y escribe en pantalla las tablas del informe S0
  para tres perfiles tipo. No modifica nada. Las horas que imprime son una estimación ilustrativa con supuestos explícitos.
#>
$ErrorActionPreference = 'Stop'
$raiz = Resolve-Path (Join-Path $PSScriptRoot '../../../../..')
$t01  = Join-Path $raiz 'SEVEN-G/herramientas/T01_registro_iniciativas'
$crit = Get-Content (Join-Path $t01 'catalogo_criterios.json') -Raw | ConvertFrom-Json
$rts  = (Get-Content (Join-Path $t01 'catalogo_riesgos.json') -Raw | ConvertFrom-Json).riesgos
$dirP = Join-Path $raiz 'SEVEN-G/mds/es/plantillas'

# Perfiles tipo. «tags»: etiquetas de criterio que aplican (GEN, AG, TER); los de TRANSFORMAR, ESCALAR, ITERAR y RETIRAR no se cuentan
$perfiles = [ordered]@{
  A = @{ nombre = 'Asistente interno de bajo coste (candidato a Express)'; intensidad = 'lite'; tags = @('GEN','TER')
         riesgo = @{ tecnologia = @('ia_generativa'); exposicion = 'interna'; autonomia = 'A0'; regulatoria = 'riesgo_minimo'; ambicion = 'optimizar'; intensidad = 'lite'; terceros = $true; personas = $false; datos_personales = $false; aprende = $true } }
  B = @{ nombre = 'Caso Lite típico (modelo predictivo propio, interno)'; intensidad = 'lite'; tags = @()
         riesgo = @{ tecnologia = @('ml_predictivo'); exposicion = 'interna'; autonomia = 'A0'; regulatoria = 'riesgo_minimo'; ambicion = 'optimizar'; intensidad = 'lite'; terceros = $false; personas = $false; datos_personales = $false; aprende = $true } }
  C = @{ nombre = 'Caso Enterprise (agente A2 con clientes, proveedor de modelo)'; intensidad = 'enterprise'; tags = @('GEN','AG','TER')
         riesgo = @{ tecnologia = @('agente','ia_generativa'); exposicion = 'clientes_directa'; autonomia = 'A2'; regulatoria = 'transparencia'; ambicion = 'aumentar'; intensidad = 'enterprise'; terceros = $true; personas = $true; datos_personales = $true; aprende = $true } }
}
$especiales = @('TRANSFORMAR','ESCALAR','ITERAR','RETIRAR')
$puertas = @('G0','G1','G2','G3','G4','G5')

function Aplica($c, $p) {
  if ($c.s | Where-Object { $especiales -contains $_ }) { return $false }
  foreach ($s in $c.s) { if ($p.tags -notcontains $s) { return $false } }
  if ($p.intensidad -eq 'lite' -and $c.l -eq 'na') { return $false }
  return $true
}
function Plantillas($lista) { $lista | ForEach-Object { $_.e -split '·' } | ForEach-Object { $_.Trim() } | Where-Object { $_ -match '^P\d\d$' } | Sort-Object -Unique }
function RtAplica($rt, $P) {
  if ($rt.aplica -eq $true) { return $true }
  if ($rt.aplica -isnot [array]) { return $false }
  foreach ($cond in $rt.aplica) {
    $ok = $true
    foreach ($k in $cond.PSObject.Properties.Name) {
      $v = $cond.$k
      if ($v -is [bool]) { if ([bool]$P[$k] -ne $v) { $ok = $false; break } }
      else { $mio = @($P[$k]) | Where-Object { $_ }; if (-not ($mio | Where-Object { $v -contains [string]$_ })) { $ok = $false; break } }
    }
    if ($ok) { return $true }
  }
  return $false
}
function Palabras($codigo) {
  $f = Get-ChildItem $dirP -Filter "$codigo*_SEVEN-G_*.md" | Select-Object -First 1
  if (-not $f) { return @(0, 0) }
  $txt = Get-Content $f.FullName -Raw
  return @(([regex]::Matches($txt, '\S+')).Count, ([regex]::Matches($txt, '\(Enterprise\)')).Count)
}

# Supuestos ilustrativos (orden de magnitud, no dato): minutos por criterio evaluado y verificado, horas por plantilla según su tamaño,
# horas por sesión de decisión (preparación + reunión, por persona) y personas por sesión
$minCriterio = 20; $horasPor1000Palabras = 2; $horasSesion = 1.5
$personasSesion = @{ lite = 3; enterprise = 6 }
$sesiones = @{ lite = 3; enterprise = 6 }
$r6Anual  = @{ lite = 2; enterprise = 4 }

"## Recuento por perfil (G0–G5)`n"
"| Perfil | Intensidad | Criterios | «Sí ◆» | Simplificados en Lite | Solo recomendados | Plantillas distintas | Palabras de esas plantillas | Campos (Enterprise) que se omiten en Lite | Sesiones de decisión | Riesgos tipo propuestos (T06) | Horas de gobierno ilustrativas |"
"|---|---|---|---|---|---|---|---|---|---|---|---|"
foreach ($k in $perfiles.Keys) {
  $p = $perfiles[$k]
  $cs = @($crit | Where-Object { $puertas -contains $_.g } | Where-Object { Aplica $_ $p })
  $critico = @($cs | Where-Object { $_.o -eq 'si_critico' }).Count
  $simpl = if ($p.intensidad -eq 'lite') { @($cs | Where-Object { $_.l -eq 'simpl' }).Count } else { 0 }
  $rec = if ($p.intensidad -eq 'lite') { @($cs | Where-Object { $_.l -eq 'rec' }).Count } else { 0 }
  $ps = @(Plantillas $cs)
  $pal = 0; $ent = 0; foreach ($c in $ps) { $w = Palabras $c; $pal += $w[0]; $ent += $w[1] }
  $riesgos = @($rts | Where-Object { $_.aplica -ne 'cartera' } | Where-Object { RtAplica $_ $p.riesgo }).Count
  $factor = if ($p.intensidad -eq 'lite') { 0.6 } else { 1 }
  $horas = [math]::Round(($cs.Count * $minCriterio / 60) + ($pal / 1000 * $horasPor1000Palabras * $factor) + ($sesiones[$p.intensidad] * $horasSesion * $personasSesion[$p.intensidad]))
  "| $k · $($p.nombre) | $($p.intensidad) | $($cs.Count) | $critico | $simpl | $rec | $($ps.Count) | $pal | $(if($p.intensidad -eq 'lite'){$ent}else{'—'}) | $($sesiones[$p.intensidad]) (+ $($r6Anual[$p.intensidad]) R6 al año) | $riesgos | ≈ $horas |"
}

"`n## Criterios por puerta y perfil`n"
"| Puerta | " + (($perfiles.Keys | ForEach-Object { "Perfil $_" }) -join ' | ') + ' |'
"|---|" + (($perfiles.Keys | ForEach-Object { '---' }) -join '|') + '|'
foreach ($g in $puertas + @('R6','G7')) {
  $fila = foreach ($k in $perfiles.Keys) { @($crit | Where-Object { $_.g -eq $g } | Where-Object { Aplica $_ $perfiles[$k] }).Count }
  "| $g | " + ($fila -join ' | ') + ' |'
}

"`n## Plantillas que se piden en más de una puerta (posible doble petición)`n"
"| Plantilla | Puertas | Criterios |"
"|---|---|---|"
$porP = @{}
foreach ($c in $crit) { foreach ($pp in ($c.e -split '·' | ForEach-Object { $_.Trim() } | Where-Object { $_ -match '^P\d\d$' })) { if (-not $porP[$pp]) { $porP[$pp] = @() }; $porP[$pp] += $c } }
foreach ($pp in ($porP.Keys | Sort-Object)) {
  $gs = @($porP[$pp] | ForEach-Object { $_.g } | Sort-Object -Unique)
  if ($gs.Count -ge 3) { "| $pp | $($gs -join ', ') | $($porP[$pp].Count) |" }
}
