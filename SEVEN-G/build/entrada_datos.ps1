<#
  Datos de la entrada ligera «Qué es SEVEN-G» (D91, D124). Lo usan build.ps1 (al copiar la entrada a html/<idioma>/entrada/)
  y verificar_coherencia.ps1 (sección 13, para comprobar que la página publicada es su fuente con los datos al día).

  La fuente (build/entrada/<idioma>/index.html) no lleva cifras escritas a mano; lleva marcas que se sustituyen al generar:
    {{N_DOCUMENTOS}}, {{N_PLANTILLAS}}, {{N_HERRAMIENTAS}}   recuentos de la biblioteca (los mismos del índice y del documento 00)
    <!-- inventario-resumen -->                            línea de cifras de la cartera de ejemplo
    <!-- inventario-casos -->                              filas de la tabla «La cartera, caso a caso»
  Los casos y sus cifras salen del JSON del panel de ejemplo (T17_panel_consejo/ejemplo/salida/t01_dashboard_data.json), con las
  mismas fórmulas que el panel (motor/economia.py, función resumen): si cambian los datos de demostración, basta con volver a
  generar. Los textos en inglés de los casos (nombre, unidad, etapas, motivos de salida) están en build/entrada_inventario_en.json;
  lo que no tenga traducción sale en español.
#>

$script:NO_NETO = @('capacidad_liberada')
$script:ORDEN_ESTADOS = @('En uso', 'En desarrollo', 'POC', 'Hipótesis de valor', 'Propuesto', 'No aprobado', 'Descartado', 'Desenganchado')
$script:SALIDAS = @('No aprobado', 'Descartado', 'Desenganchado')

function EntradaImp($it) { if ($null -ne $it -and $it.PSObject.Properties['importe'] -and $null -ne $it.importe) { [double]$it.importe } else { $null } }

function EntradaSuma($lineas, [string]$lado, [scriptblock]$filtro, [bool]$respaldoActual) {
  $total = 0.0; $alguno = $false
  foreach ($l in @($lineas)) {
    if ($null -eq $l -or -not (& $filtro $l)) { continue }
    $v = EntradaImp $l.$lado
    if ($null -eq $v -and $respaldoActual) { $v = EntradaImp $l.actual }
    if ($null -ne $v) { $total += $v; $alguno = $true }
  }
  if ($alguno) { $total } else { $null }
}

# Cifras derivadas de un caso: réplica de motor/economia.py::resumen (None = $null = sin dato)
function Resumen-CasoEntrada($caso) {
  $e = $caso.economia; $inv = if ($e) { $e.inversion } else { $null }
  $ef = if ($e -and $e.eficiencias) { @($e.eficiencias) } else { @() }
  $rt = if ($e -and $e.retorno) { @($e.retorno) } else { @() }
  $cuenta = { param($l) $script:NO_NETO -notcontains $l.concepto }
  $todo = { param($l) $true }
  $r = [ordered]@{
    recurrente      = if ($inv) { EntradaImp $inv.recurrente_anual } else { $null }
    eficiencias     = EntradaSuma $ef 'actual' $cuenta $false
    retorno         = EntradaSuma $rt 'actual' $todo $false
    recurrente_pot  = if ($inv) { EntradaImp $inv.recurrente_potencial } else { $null }
    eficiencias_pot = EntradaSuma $ef 'potencial' $cuenta $true
    retorno_pot     = EntradaSuma $rt 'potencial' $todo $true
  }
  if ($null -eq $r.recurrente_pot) { $r.recurrente_pot = $r.recurrente }
  $z = { param($k) if ($null -ne $r[$k]) { $r[$k] } else { 0 } }
  $r.neto = (& $z 'eficiencias') + (& $z 'retorno') - (& $z 'recurrente')
  $r.neto_pot = (& $z 'eficiencias_pot') + (& $z 'retorno_pot') - (& $z 'recurrente_pot')
  $porEstado = @{ validado = 0.0; declarado = 0.0; estimado_cati = 0.0 }
  foreach ($l in @($ef | Where-Object { & $cuenta $_ }) + $rt) {
    $v = EntradaImp $l.actual
    if ($null -ne $v) { $est = if ($l.actual.estado) { $l.actual.estado } else { 'estimado_cati' }; $porEstado[$est] = [double]$porEstado[$est] + $v }
  }
  $r.valor_por_estado = $porEstado
  $r
}

function Dinero-Entrada([double]$v, [bool]$en) {
  $neg = $v -lt 0; $a = [math]::Abs($v); $inv = [Globalization.CultureInfo]::InvariantCulture
  if ($a -ge 1e6) { $s = ($a / 1e6).ToString('0.##', $inv); $u = 'M' } else { $s = ([math]::Round($a / 1e3)).ToString('0', $inv); $u = 'k' }
  $t = if ($en) { "€$s$u" } else { ($s -replace '\.', ',') + " $u€" }
  if ($neg) { "−$t" } else { $t }
}

function Html-Entrada([string]$s) { $s.Replace('&', '&amp;').Replace('<', '&lt;').Replace('>', '&gt;').Replace('"', '&quot;') }

# Devuelve la página con las marcas sustituidas. $recuentos: hashtable con {{N_DOCUMENTOS}}, {{N_PLANTILLAS}} y {{N_HERRAMIENTAS}}.
function Expandir-Entrada([string]$html, [string]$lang, [string]$repo, [hashtable]$recuentos) {
  foreach ($k in $recuentos.Keys) { $html = $html.Replace($k, [string]$recuentos[$k]) }
  if (-not ($html.Contains('<!-- inventario-casos -->') -or $html.Contains('<!-- inventario-resumen -->'))) { return $html }
  $en = $lang -eq 'en'
  $datos = Get-Content (Join-Path $repo 'SEVEN-G/herramientas/T17_panel_consejo/ejemplo/salida/t01_dashboard_data.json') -Raw -Encoding utf8 | ConvertFrom-Json -Depth 64
  $tr = $null
  if ($en) {
    $ftr = Join-Path $repo 'SEVEN-G/build/entrada_inventario_en.json'
    if (Test-Path $ftr) { $tr = Get-Content $ftr -Raw -Encoding utf8 | ConvertFrom-Json -AsHashtable }
  }
  $T = { param($s) if ($en -and $tr -and $tr.etiquetas.ContainsKey([string]$s)) { $tr.etiquetas[[string]$s] } else { $s } }
  $prev = if ($en) { 'fcst.' } else { 'prev.' }; $sd = if ($en) { 'no data' } else { 'sin dato' }
  $filas = [Collections.Generic.List[object]]::new(); $i = 0
  foreach ($c in @($datos.casos)) {
    $r = Resumen-CasoEntrada $c; $est = [string]$c.estado; $uso = $est -eq 'En uso'
    $orden = [array]::IndexOf($script:ORDEN_ESTADOS, $est); if ($orden -lt 0) { $orden = 99 }
    $netoOrden = if ($uso) { $r.neto } else { $r.neto_pot }
    $filas.Add([pscustomobject]@{ c = $c; r = $r; est = $est; uso = $uso; orden = $orden; neto = $netoOrden; i = $i++ })
  }
  $filas = @($filas | Sort-Object orden, @{ Expression = 'neto'; Descending = $true }, i)
  $sb = [Text.StringBuilder]::new()
  foreach ($f in $filas) {
    $c = $f.c; $r = $f.r
    if ($script:SALIDAS -contains $f.est) {
      $mot = [string]$c.reporte_compania.retirada.motivo
      $mot = if ($mot) { ($mot -split ':', 2)[0].Trim() } else { '' }
      if ($en -and $mot -and $tr) {
        foreach ($k in $tr.salidas.Keys) { $mot = $mot.Replace($k, $tr.salidas[$k]) }
      }
      if (-not $mot) { $mot = $sd }
      $coste = '<td class="num nd">—</td>'; $neto = "<td class=""num sal"">$(Html-Entrada $mot)</td>"; $val = '<td class="num nd">—</td>'
    } else {
      $rec = if ($f.uso) { $r.recurrente } else { $r.recurrente_pot }
      $marca = if ($f.uso) { '' } else { " <small>$prev</small>" }
      $coste = if ($null -ne $rec) { "<td class=""num"">$(Dinero-Entrada $rec $en)$marca</td>" } else { "<td class=""num nd"">$sd</td>" }
      $claves = if ($f.uso) { 'eficiencias', 'retorno', 'recurrente' } else { 'eficiencias_pot', 'retorno_pot', 'recurrente_pot' }
      $tiene = @($claves | Where-Object { $null -ne $r[$_] }).Count -gt 0
      $n = if ($f.uso) { $r.neto } else { $r.neto_pot }
      $neto = if ($tiene) { "<td class=""num$(if ($n -lt 0) { ' neg' })""><b>$(Dinero-Entrada $n $en)</b>$marca</td>" } else { "<td class=""num nd"">$sd</td>" }
      if ($f.uso) {
        $vp = $r.valor_por_estado; $tot = $vp.validado + $vp.declarado + $vp.estimado_cati
        $p = if ($tot) { [math]::Round(100 * $vp.validado / $tot) } else { 0 }
        $val = "<td class=""num$(if ($p -eq 0) { ' neg' })"">$p$(if ($en) { '%' } else { "`u{00A0}%" })</td>"
      } elseif ($tiene) { $val = "<td class=""num nd"">$(if ($en) { 'estimate' } else { 'estimado' })</td>" }
      else { $val = '<td class="num nd">—</td>' }
    }
    $nombre = if ($en -and $tr -and $tr.nombres.ContainsKey([string]$c.id)) { $tr.nombres[[string]$c.id] } else { [string]$c.nombre }
    $clase = if ($f.uso) { 'uso' } elseif ($script:SALIDAS -contains $f.est) { 'fuera' } else { 'curso' }
    [void]$sb.Append("          <tr data-caso=""$(Html-Entrada $c.id)""><td><small>$(Html-Entrada $c.id)</small>$(Html-Entrada $nombre)</td><td>$(Html-Entrada (& $T $c.unidad))</td>")
    [void]$sb.Append("<td><span class=""etapa $clase"">$(Html-Entrada (& $T $f.est))</span></td><td>$(Html-Entrada (& $T $c.tags.ambicion))</td><td>$(Html-Entrada (& $T $c.tags.riesgo))</td>")
    [void]$sb.Append("$coste$neto$val</tr>`n")
  }
  # línea de cifras: casos, en uso, neto anual de lo que está en uso, parte validada y previsión de lo que sigue en curso
  $enUso = @($filas | Where-Object uso); $enCurso = @($filas | Where-Object { -not $_.uso -and $script:SALIDAS -notcontains $_.est })
  $netoUso = ($enUso | ForEach-Object { $_.r.neto } | Measure-Object -Sum).Sum
  $valTot = 0.0; $valOk = 0.0
  foreach ($f in $enUso) { $vp = $f.r.valor_por_estado; $valTot += $vp.validado + $vp.declarado + $vp.estimado_cati; $valOk += $vp.validado }
  $pVal = if ($valTot) { [math]::Round(100 * $valOk / $valTot) } else { 0 }
  $netoPrev = ($enCurso | Where-Object { $_.r.eficiencias_pot -ne $null -or $_.r.retorno_pot -ne $null -or $_.r.recurrente_pot -ne $null } | ForEach-Object { $_.r.neto_pot } | Measure-Object -Sum).Sum
  $resumen = if ($en) {
    "<b>$($filas.Count)</b> cases · <b>$($enUso.Count)</b> in use with an annual net of <b>$(Dinero-Entrada $netoUso $true)</b>, <b>$pVal%</b> of it validated · <b>$($enCurso.Count)</b> in progress with a forecast net of <b>$(Dinero-Entrada $netoPrev $true)</b>, which does not add up until it is realised"
  } else {
    "<b>$($filas.Count)</b> casos · <b>$($enUso.Count)</b> en uso con un neto anual de <b>$(Dinero-Entrada $netoUso $false)</b>, validado en un <b>$pVal&nbsp;%</b> · <b>$($enCurso.Count)</b> en curso con un neto previsto de <b>$(Dinero-Entrada $netoPrev $false)</b>, que no suma hasta que se materializa"
  }
  $html.Replace('<!-- inventario-casos -->', $sb.ToString().TrimEnd("`n")).Replace('<!-- inventario-resumen -->', $resumen)
}
