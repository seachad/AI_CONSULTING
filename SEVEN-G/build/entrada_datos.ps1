<#
  Datos de la entrada ligera «Qué es SEVEN-G» (D91, D124). Lo usan build.ps1 (al copiar la entrada a html/<idioma>/entrada/)
  y verificar_coherencia.ps1 (sección 13, para comprobar que la página publicada es su fuente con los datos al día).

  La fuente (build/entrada/<idioma>/index.html) no lleva cifras escritas a mano; lleva marcas que se sustituyen al generar:
    {{N_DOCUMENTOS}}, {{N_PLANTILLAS}}, {{N_HERRAMIENTAS}}   recuentos de la biblioteca (los mismos del índice y del documento 00)
    <!-- inventario-resumen -->                            línea de cifras de la cartera de ejemplo
    <!-- inventario-casos -->                              filas de la tabla «La cartera, caso a caso»
    <!-- temas -->                                         tarjetas del mapa de temas, desde build/temas.json (D163)
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

# Mapa de temas de la entrada (D163): tarjetas por macroconcepto con enlaces directos, desde build/temas.json.
# Cada tarjeta es un <details> abierto: la entrada lo pliega en el móvil (D164) y enlaza la página completa del tema.
# href del JSON es relativo a html/<idioma>/; la entrada está en html/<idioma>/entrada/, por eso se antepone «../».
function Temas-Entrada([string]$lang) {
  $en = $lang -eq 'en'
  $datos = Get-Content (Join-Path $PSScriptRoot 'temas.json') -Raw -Encoding utf8 | ConvertFrom-Json -Depth 16
  $rot = if ($en) { @{ doc = 'Document'; plantilla = 'Template'; herramienta = 'Tool'; ejemplo = 'Example' } } else { @{ doc = 'Documento'; plantilla = 'Plantilla'; herramienta = 'Herramienta'; ejemplo = 'Ejemplo' } }
  $sb = [Text.StringBuilder]::new()
  foreach ($t in $datos.temas) {
    $tx = if ($en) { $t.en } else { $t.es }
    [void]$sb.Append("      <details class=""macro"" id=""tema-$($t.id)"" open>`n        <summary><h3>$(Html-Entrada $tx.titulo)</h3><p class=""resp"">$(Html-Entrada $tx.pregunta)</p></summary>`n        <ul>`n")
    foreach ($e in $t.enlaces) {
      $texto = Html-Entrada $(if ($en) { $e.en } else { $e.es })
      $ancla = if ($en) { $e.ancla_en } else { $e.ancla_es }
      $href = '../' + $e.href + $(if ($ancla) { "#$ancla" } else { '' })
      [void]$sb.Append("          <li><a href=""$href"" title=""$($rot[[string]$e.tipo]): $texto""><span class=""tipo $($e.tipo)"">$($rot[[string]$e.tipo])</span>$texto</a></li>`n")
    }
    [void]$sb.Append("        </ul>`n        <p class=""macro-mas""><a href=""../temas/$($t.id).html"" title=""$(if ($en) { 'Topic page: concepts, where it is covered and sources' } else { 'Página del tema: conceptos, dónde se trata y fuentes' })"">$(if ($en) { 'Full topic page' } else { 'Página completa del tema' }) →</a></p>`n      </details>`n")
  }
  $sb.ToString().TrimEnd("`n")
}

# Índice del mapa de temas: un enlace por tema a su tarjeta (#tema-<id>).
function Temas-Indice-Entrada([string]$lang) {
  $datos = Get-Content (Join-Path $PSScriptRoot 'temas.json') -Raw -Encoding utf8 | ConvertFrom-Json -Depth 16
  (@($datos.temas | ForEach-Object { $tx = if ($lang -eq 'en') { $_.en } else { $_.es }; "      <a href=""#tema-$($_.id)"">$(Html-Entrada $tx.titulo)</a>" }) -join "`n")
}

# Devuelve la página con las marcas sustituidas. $recuentos: hashtable con {{N_DOCUMENTOS}}, {{N_PLANTILLAS}} y {{N_HERRAMIENTAS}}.
function Expandir-Entrada([string]$html, [string]$lang, [string]$repo, [hashtable]$recuentos) {
  foreach ($k in $recuentos.Keys) { $html = $html.Replace($k, [string]$recuentos[$k]) }
  if ($html.Contains('<!-- temas -->')) { $html = $html.Replace('<!-- temas -->', (Temas-Entrada $lang)) }
  if ($html.Contains('<!-- temas-indice -->')) { $html = $html.Replace('<!-- temas-indice -->', (Temas-Indice-Entrada $lang)) }
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

# ---- Páginas completas de tema (D164): html/<idioma>/temas/<id>.html ----
# Cada página sale de build/temas.json (título, pregunta, resumen, enlaces y lista de conceptos), del glosario (documento 02:
# definición de cada concepto en el idioma de la página) y del registro de referencias (fuentes externas verificadas que citan
# los documentos enlazados por el tema). La plantilla es build/temas.plantilla.html y el pie es el de la entrada del mismo idioma.
function Md-Linea-Tema([string]$s) {
  $h = Html-Entrada $s
  $h = [regex]::Replace($h, '\*\*(.+?)\*\*', '<b>$1</b>')
  $h = [regex]::Replace($h, '(?<![\*\w])\*(?!\s)(.+?)(?<!\s)\*(?![\*\w])', '<i>$1</i>')
  $h = [regex]::Replace($h, '`([^`]+)`', '<code>$1</code>')
  $h.Replace('\&lt;', '&lt;').Replace('\&gt;', '&gt;')
}
# clave de comparación de un término del glosario: primer tramo antes de «;», sin marcas ni paréntesis y con las palabras ordenadas
# («Express (intensity)» y «Express intensity» son el mismo término)
function Clave-Termino([string]$s) {
  $x = ([regex]::Replace(($s -split ';')[0], '[\*†`\\\(\)]', ' ')).ToLowerInvariant()
  (@($x -split '\s+' | Where-Object { $_ } | Sort-Object) -join ' ')
}
function Glosario-Temas([string]$repo, [string]$lang) {
  # filas «| **término** | definición | referencia | término en el otro idioma |» de la sección 3 del documento 02
  $f = Get-ChildItem (Join-Path $repo "SEVEN-G/mds/$lang") -Filter '02_SEVEN-G_*.md' | Select-Object -First 1
  $filas = [Collections.Generic.List[object]]::new()
  $dentro = $false
  foreach ($l in [IO.File]::ReadAllLines($f.FullName)) {
    if ($l -match '^## 3\.') { $dentro = $true; continue }
    if ($l -match '^## ' -and $dentro) { break }
    if (-not $dentro -or $l -notmatch '^\| \*\*') { continue }
    $c = @([regex]::Split($l.Trim().Trim('|'), '(?<!\\)\|') | ForEach-Object { $_.Trim() })
    if ($c.Count -lt 4) { continue }
    $filas.Add([pscustomobject]@{ termino = ($c[0] -replace '^\*\*|\*\*$', ''); definicion = $c[1]; otro = $c[3] })
  }
  $filas
}
function Textos-Temas([string]$lang) {
  if ($lang -eq 'en') {
    @{ T_PORTADA = 'AI Consulting home: SEVEN-G, SPHERES and SPAD'; T_CABECERA = 'SEVEN-G header: what it is and what it is for'; T_NAV = 'Sections'; T_TODOS = 'All topics'; T_CONCEPTOS = 'Concepts'; T_DONDE = 'Where it is covered'; T_FUENTES = 'Sources'; T_BIBLIOTECA = 'Library'
       T_TEMA_SITIO = 'Theme for the whole site'; T_TEMA = 'Theme'; T_SALMON = 'Salmon'; T_CLARO = 'Light salmon'; T_NOCHE = 'Night'; T_IDIOMA = 'Language'; T_ANTETITULO = 'SEVEN-G by topic'
       T_K_RESUMEN = 'In brief'; T_H_RESUMEN = 'What this topic is about'
       T_K_CONCEPTOS = 'Concepts'; T_H_CONCEPTOS = 'The concepts you need'; T_S_CONCEPTOS = 'Definitions taken from the SEVEN-G glossary (document 02). The codes are links to where each one is explained.'
       T_K_DONDE = 'In the framework'; T_H_DONDE = 'Where it is covered'; T_S_DONDE = 'Documents, sections, templates, tools and examples that develop this topic.'
       T_K_FUENTES = 'Sources'; T_H_FUENTES = 'External sources it is based on'; T_S_FUENTES = 'Official or primary sources cited by the documents of this topic, checked in the reference register. Always verify the version in force on the date of use.'
       T_SIN_FUENTES = 'The documents of this topic cite no external sources: their content is the author''s own method.'
       T_K_OTROS = 'Keep browsing'; T_H_OTROS = 'Other topics'; T_GLOSARIO = 'Full glossary (document 02)'; T_OTRO_IDIOMA = 'Esta página en español'
       doc = 'Document'; plantilla = 'Template'; herramienta = 'Tool'; ejemplo = 'Example' }
  } else {
    @{ T_PORTADA = 'Portada de AI Consulting: SEVEN-G, SPHERES y SPAD'; T_CABECERA = 'Cabecera de SEVEN-G: qué es y para qué sirve'; T_NAV = 'Secciones'; T_TODOS = 'Todos los temas'; T_CONCEPTOS = 'Conceptos'; T_DONDE = 'Dónde se trata'; T_FUENTES = 'Fuentes'; T_BIBLIOTECA = 'Biblioteca'
       T_TEMA_SITIO = 'Tema de todo el sitio'; T_TEMA = 'Tema'; T_SALMON = 'Salmón'; T_CLARO = 'Salmón claro'; T_NOCHE = 'Noche'; T_IDIOMA = 'Idioma'; T_ANTETITULO = 'SEVEN-G por temas'
       T_K_RESUMEN = 'En pocas palabras'; T_H_RESUMEN = 'De qué trata este tema'
       T_K_CONCEPTOS = 'Conceptos'; T_H_CONCEPTOS = 'Los conceptos que hacen falta'; T_S_CONCEPTOS = 'Definiciones tomadas del glosario de SEVEN-G (documento 02). Los códigos son enlaces a donde se explica cada uno.'
       T_K_DONDE = 'En el marco'; T_H_DONDE = 'Dónde se trata'; T_S_DONDE = 'Documentos, secciones, plantillas, herramientas y ejemplos que desarrollan este tema.'
       T_K_FUENTES = 'Fuentes'; T_H_FUENTES = 'Fuentes externas en que se basa'; T_S_FUENTES = 'Fuentes oficiales o primarias que citan los documentos de este tema, comprobadas en el registro de referencias. Verifique siempre la versión vigente en la fecha de uso.'
       T_SIN_FUENTES = 'Los documentos de este tema no citan fuentes externas: su contenido es método propio del autor.'
       T_K_OTROS = 'Seguir navegando'; T_H_OTROS = 'Otros temas'; T_GLOSARIO = 'Glosario completo (documento 02)'; T_OTRO_IDIOMA = 'This page in English'
       doc = 'Documento'; plantilla = 'Plantilla'; herramienta = 'Herramienta'; ejemplo = 'Ejemplo' }
  }
}
# Devuelve un diccionario ordenado id -> HTML de la página del tema. $avisos (opcional): lista donde se anotan los conceptos sin definición.
function Paginas-Temas([string]$lang, [string]$repo, $avisos = $null) {
  $en = $lang -eq 'en'; $otro = if ($en) { 'es' } else { 'en' }
  $datos = Get-Content (Join-Path $PSScriptRoot 'temas.json') -Raw -Encoding utf8 | ConvertFrom-Json -Depth 16
  $plantilla = [IO.File]::ReadAllText((Join-Path $PSScriptRoot 'temas.plantilla.html'))
  $tx = Textos-Temas $lang
  $entrada = [IO.File]::ReadAllText((Join-Path $PSScriptRoot "entrada/$lang/index.html"))
  $pie = [regex]::Match($entrada, '(?s)<footer>.*?</footer>').Value
  $glosEs = @(Glosario-Temas $repo 'es'); $glosEn = if ($en) { @(Glosario-Temas $repo 'en') } else { @() }
  $refs = @(Get-ChildItem (Join-Path $PSScriptRoot 'referencias') -File -Filter '*.json' | Sort-Object Name | ForEach-Object { Get-Content $_.FullName -Raw -Encoding utf8 | ConvertFrom-Json } | ForEach-Object { $_ } | Where-Object { $_.estado -eq 'verificado' -and $_.url_es -and $_.url_en })
  $orden = @{ 'norma-ue' = 1; 'norma-internacional' = 2; 'norma-es' = 3; 'jurisprudencia' = 4; 'autoridad' = 5; 'guia' = 6; 'norma-tecnica' = 7; 'marco' = 8; 'estudio' = 9; 'licencia' = 10; 'web' = 11 }
  $res = [ordered]@{}
  foreach ($t in $datos.temas) {
    $tt = if ($en) { $t.en } else { $t.es }
    # conceptos: definición del glosario en el idioma de la página
    $sbC = [Text.StringBuilder]::new()
    foreach ($c in @($t.conceptos)) {
      $k = Clave-Termino $c
      $fEs = $glosEs | Where-Object { (Clave-Termino $_.termino) -eq $k } | Select-Object -First 1
      $fila = $fEs
      if ($en -and $fEs) {
        $kEn = Clave-Termino $fEs.otro
        $fila = $glosEn | Where-Object { (Clave-Termino $_.termino) -eq $kEn } | Select-Object -First 1
        if (-not $fila) { $fila = $glosEn | Where-Object { (Clave-Termino $_.otro) -eq $k } | Select-Object -First 1 }
      }
      if (-not $fila) { if ($null -ne $avisos) { $avisos.Add("tema $($t.id) [$lang]: el concepto «$c» no está en el glosario") }; continue }
      [void]$sbC.Append("      <dt>$(Md-Linea-Tema $fila.termino)</dt>`n      <dd>$(Md-Linea-Tema $fila.definicion)</dd>`n")
    }
    [void]$sbC.Append("      <dt class=""mas""><a href=""../02_SEVEN-G_Glosario_y_convenciones.html"">$($tx.T_GLOSARIO) →</a></dt>")
    # enlaces del tema (href relativo a html/<idioma>/; la página está en html/<idioma>/temas/)
    $sbE = [Text.StringBuilder]::new(); $docs = @{}
    foreach ($e in $t.enlaces) {
      $texto = Html-Entrada $(if ($en) { $e.en } else { $e.es })
      $ancla = if ($en) { $e.ancla_en } else { $e.ancla_es }
      $href = '../' + $e.href + $(if ($ancla) { "#$ancla" } else { '' })
      [void]$sbE.Append("          <li><a href=""$href"" title=""$($tx[[string]$e.tipo]): $texto""><span class=""tipo $($e.tipo)"">$($tx[[string]$e.tipo])</span>$texto</a></li>`n")
      $m = [regex]::Match([IO.Path]::GetFileName([string]$e.href), '^(P?\d{2})_')
      if ($m.Success) { $docs[$m.Groups[1].Value] = 1 }
    }
    # fuentes externas: referencias verificadas del registro que citan alguno de los documentos enlazados
    $fu = @($refs | Where-Object { @($_.documentos | Where-Object { $docs.ContainsKey([string]$_) }).Count -gt 0 } |
      Sort-Object @{ e = { $o = $orden[[string]$_.tipo]; if ($o) { $o } else { 99 } } }, @{ e = { if ($en) { $_.titulo_en } else { $_.titulo_es } } })
    $fuentes = if ($fu.Count) {
      "    <ul class=""tema-fuentes"">`n" + (@($fu | ForEach-Object {
        $url = $(if ($en) { $_.url_en } else { $_.url_es }).Replace('&', '&amp;')
        $tit = Html-Entrada $(if ($en) { $_.titulo_en } else { $_.titulo_es })
        $extra = @(); if ($_.emisor) { $extra += Html-Entrada $_.emisor }
        if ($_.fecha -match '^(\d{4})-(\d{2})-(\d{2})$') { $extra += "$($Matches[3])-$($Matches[2])-$($Matches[1])" } elseif ($_.fecha) { $extra += [string]$_.fecha }
        "      <li><a href=""$url"" target=""_blank"" rel=""noopener"">$tit</a>$(if ($extra) { '<span> · ' + ($extra -join ' · ') + '</span>' })</li>"
      }) -join "`n") + "`n    </ul>"
    } else { "    <p class=""pie"">$($tx.T_SIN_FUENTES)</p>" }
    $otros = (@($datos.temas | Where-Object { $_.id -ne $t.id } | ForEach-Object { $o = if ($en) { $_.en } else { $_.es }; "      <a href=""$($_.id).html"">$(Html-Entrada $o.titulo)</a>" }) -join "`n")
    $idioma = if ($en) { "<a href=""../../es/temas/$($t.id).html"" title=""$($tx.T_OTRO_IDIOMA)"">ES</a><span class=""activo"">EN</span>" } else { "<span class=""activo"">ES</span><a href=""../../en/temas/$($t.id).html"" title=""$($tx.T_OTRO_IDIOMA)"">EN</a>" }
    $h = $plantilla
    foreach ($k in @($tx.Keys | Where-Object { $_ -like 'T_*' })) { $h = $h.Replace("{{$k}}", [string]$tx[$k]) }
    $h = $h.Replace('{{LANG}}', $lang).Replace('{{OTRO}}', $otro).Replace('{{ID}}', [string]$t.id).Replace('{{TITULO}}', (Html-Entrada $tt.titulo)).Replace('{{PREGUNTA}}', (Html-Entrada $tt.pregunta)).
      Replace('{{RESUMEN}}', (Html-Entrada $tt.resumen)).Replace('{{PORTADA}}', $(if ($en) { '../../../../en/index.html' } else { '../../../../index.html' })).Replace('{{IDIOMA}}', $idioma).
      Replace('{{CONCEPTOS}}', $sbC.ToString()).Replace('{{ENLACES}}', $sbE.ToString().TrimEnd("`n")).Replace('{{FUENTES}}', $fuentes).Replace('{{OTROS}}', $otros).Replace('{{PIE_ENTRADA}}', $pie)
    $res[[string]$t.id] = $h
  }
  $res
}
