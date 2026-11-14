<#
  Datos de la entrada ligera «Qué es SEVEN-G» (D91, D124). Lo usan build.ps1 (al copiar la entrada a html/<idioma>/entrada/)
  y verificar_coherencia.ps1 (sección 13, para comprobar que la página publicada es su fuente con los datos al día).

  La fuente (build/entrada/<idioma>/index.html) no lleva cifras escritas a mano; lleva marcas que se sustituyen al generar:
    {{N_DOCUMENTOS}}, {{N_PLANTILLAS}}, {{N_HERRAMIENTAS}}   recuentos de la biblioteca (los mismos del índice y del documento 00)
    <!-- inventario-resumen -->                            línea de cifras de la cartera de ejemplo
    <!-- inventario-casos -->                              filas de la tabla «La cartera, caso a caso»
    <!-- temas -->                                         tarjetas del mapa de temas, desde build/temas.json (D163)
    <!-- presentaciones --> y <!-- presentaciones-nav -->  sección «SEVEN-G en slides» y su enlace en la barra, desde
                                                           presentaciones/manifiesto.json (también {{SLIDES}} en las páginas de área)
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

# Tono (matiz HSL) de cada área, en paleta ascendente: la misma área lleva el mismo color en la entrada, la portada y su página (D165).
function Tono-Area([int]$i) { 18 + 28 * $i }

# Mapa de temas de la entrada (D163): tarjetas por macroconcepto con enlaces directos, desde build/temas.json.
# Cada tarjeta es un <details> plegado, con su título y su pregunta a la vista y un color propio (D165); enlaza la página completa del área.
# href del JSON es relativo a html/<idioma>/; la entrada está en html/<idioma>/entrada/, por eso se antepone «../».
# Icono de un área (D168): trazado de Font Awesome Free (CC BY 4.0) incrustado como SVG; los datos están en iconos_fa.json.
$script:IconosFa = $null
function Icono-Area([string]$nombre) {
  if (-not $script:IconosFa) { $script:IconosFa = (Get-Content (Join-Path $PSScriptRoot 'iconos_fa.json') -Raw -Encoding utf8 | ConvertFrom-Json).iconos }
  $i = $script:IconosFa.$nombre
  if (-not $nombre -or -not $i) { return '' }
  "<svg class=""ico"" viewBox=""$($i.viewBox)"" aria-hidden=""true"" focusable=""false""><path fill=""currentColor"" d=""$($i.d)""/></svg>"
}
# Línea «Slides» de la tarjeta de un área (entrada y portada): «En 1 slide» y «En 10 slides», cada una con su PowerPoint y su PDF
# del idioma de la página, desde presentaciones/manifiesto.json (areas/<id>_1 y areas/<id>_10). Sin esas presentaciones, nada (D53).
# $desde: carpeta absoluta de la página; $etiqueta: 'span' (entrada) o 'i' (portada), como el rótulo de tipo de cada página.
function Slides-Tarjeta-Area([string]$id, [string]$lang, [string]$desde, [string]$clase, [string]$etiqueta) {
  $en = $lang -eq 'en'
  $repoR = [IO.Path]::GetFullPath((Join-Path $PSScriptRoot '..\..'))
  $man = @{}; foreach ($p in (Manifiesto-Presentaciones $repoR)) { $man[[string]$p.id] = $p }
  $partes = @()
  foreach ($n in 1, 10) {
    $p = $man["areas/${id}_$n"]; if (-not $p) { continue }
    $f = Ficheros-Slides $p $lang $repoR; if (-not $f.Count) { continue }
    $tit = Html-Entrada (Txt-Slides $p.titulo $lang)
    $enl = @()
    if ($f.pptx) { $enl += "<a href=""$(Rel-Slides $desde $f.pptx)"" download title=""$tit · PowerPoint"">PowerPoint</a>" }
    if ($f.pdf) { $enl += "<a href=""$(Rel-Slides $desde $f.pdf)"" target=""_blank"" rel=""noopener"" title=""$tit · PDF"">PDF</a>" }
    $rot = if ($en) { "In $n $(N-Slides $n $true)" } else { "En $n $(N-Slides $n $false)" }
    $partes += "<span class=""sl-par""><b>$rot</b> $($enl -join ' · ')</span>"
  }
  if (-not $partes.Count) { return '' }
  "        <p class=""$clase""><$etiqueta class=""tipo slides"">Slides</$etiqueta>$($partes -join '')</p>`n"
}
function Temas-Entrada([string]$lang) {
  $en = $lang -eq 'en'
  $desdeE = [IO.Path]::GetFullPath((Join-Path $PSScriptRoot "..\html\$lang\entrada"))
  $datos = Get-Content (Join-Path $PSScriptRoot 'temas.json') -Raw -Encoding utf8 | ConvertFrom-Json -Depth 16
  $rot = if ($en) { @{ doc = 'Document'; plantilla = 'Template'; herramienta = 'Tool'; ejemplo = 'Example' } } else { @{ doc = 'Documento'; plantilla = 'Plantilla'; herramienta = 'Herramienta'; ejemplo = 'Ejemplo' } }
  $sb = [Text.StringBuilder]::new(); $nT = 0
  [void]$sb.Append("      <!-- Iconos: Font Awesome Free 6.7.2, https://fontawesome.com (CC BY 4.0) -->`n")
  foreach ($t in $datos.temas) {
    $tx = if ($en) { $t.en } else { $t.es }
    $tono = Tono-Area $nT; $nT++
    [void]$sb.Append("      <details class=""macro"" name=""areas"" id=""area-$($t.id)"" style=""--h: $tono"">`n        <summary>$(Icono-Area $t.icono)<h3>$(Html-Entrada $tx.titulo)</h3><p class=""resp"">$(Html-Entrada $tx.pregunta)</p></summary>`n        <p class=""macro-mas""><a href=""../areas/$($t.id).html"" title=""$(if ($en) { 'Area page: concepts, where it is covered and sources' } else { 'Página del área: conceptos, dónde se trata y fuentes' })"">$(if ($en) { 'Full page of this area' } else { 'Página completa del área' }) →</a></p>`n$(Slides-Tarjeta-Area $t.id $lang $desdeE 'macro-slides' 'span')        <ul>`n")
    foreach ($e in $t.enlaces) {
      $texto = Html-Entrada $(if ($en) { $e.en } else { $e.es })
      $ancla = if ($en) { $e.ancla_en } else { $e.ancla_es }
      $href = '../' + $e.href + $(if ($ancla) { "#$ancla" } else { '' })
      [void]$sb.Append("          <li><a href=""$href"" title=""$($rot[[string]$e.tipo]): $texto""><span class=""tipo $($e.tipo)"">$($rot[[string]$e.tipo])</span>$texto</a></li>`n")
    }
    [void]$sb.Append("        </ul>`n      </details>`n")
  }
  $sb.ToString().TrimEnd("`n")
}

# Índice del mapa de temas: un enlace por tema a su tarjeta (#tema-<id>).
function Temas-Indice-Entrada([string]$lang) {
  $datos = Get-Content (Join-Path $PSScriptRoot 'temas.json') -Raw -Encoding utf8 | ConvertFrom-Json -Depth 16
  (@($datos.temas | ForEach-Object { $tx = if ($lang -eq 'en') { $_.en } else { $_.es }; "      <a href=""#area-$($_.id)"">$(Html-Entrada $tx.titulo)</a>" }) -join "`n")
}

# Devuelve la página con las marcas sustituidas. $recuentos: hashtable con {{N_DOCUMENTOS}}, {{N_PLANTILLAS}} y {{N_HERRAMIENTAS}}.
function Expandir-Entrada([string]$html, [string]$lang, [string]$repo, [hashtable]$recuentos) {
  foreach ($k in $recuentos.Keys) { $html = $html.Replace($k, [string]$recuentos[$k]) }
  if ($html.Contains('<!-- temas -->')) { $html = $html.Replace('<!-- temas -->', (Temas-Entrada $lang)) }
  if ($html.Contains('<!-- preguntas -->')) { $html = $html.Replace('<!-- preguntas -->', (Preguntas-Entrada $lang)) }
  if ($html.Contains('<!-- temas-indice -->')) { $html = $html.Replace('<!-- temas-indice -->', (Temas-Indice-Entrada $lang)) }
  # presentaciones en slides, desde presentaciones/manifiesto.json (sin manifiesto, la sección y su enlace no aparecen)
  if ($html.Contains('<!-- presentaciones-nav -->')) { $html = $html.Replace('<!-- presentaciones-nav -->', (Slides-Nav-Entrada $lang $repo)) }
  if ($html.Contains('<!-- presentaciones -->')) { $html = $html.Replace('<!-- presentaciones -->', (Slides-Entrada $lang $repo)) }
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
  # un código de herramienta escrito en una definición enlaza el catálogo de herramientas (documento 03): ninguna herramienta citada queda sin enlace (D64)
  $h = [regex]::Replace($h, '(?<![\w/>-])(T\d{2})(?![\w<])', '<a href="../03_SEVEN-G_Herramientas_y_registro_de_iniciativas.html" title="$1">$1</a>')
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
    @{ T_PORTADA = 'AI Consulting home: SEVEN-G, SPHERES and SPAD'; T_CABECERA = 'SEVEN-G header: what it is and what it is for'; T_NAV = 'Sections'; T_TODOS = 'All areas'; T_CONCEPTOS = 'Concepts'; T_DONDE = 'Where it is covered'; T_FUENTES = 'Sources'; T_BIBLIOTECA = 'Library'
       T_TEMA_SITIO = 'Theme for the whole site'; T_TEMA = 'Theme'; T_SALMON = 'Salmon'; T_CLARO = 'Light salmon'; T_NOCHE = 'Night'; T_IDIOMA = 'Language'; T_ANTETITULO = 'AI action areas'
       T_K_RESUMEN = 'In brief'; T_H_RESUMEN = 'What this area is about'
       T_K_CONCEPTOS = 'Concepts'; T_H_CONCEPTOS = 'The concepts you need'; T_S_CONCEPTOS = 'Definitions taken from the SEVEN-G glossary (document 02). The codes are links to where each one is explained.'
       T_K_DONDE = 'In the framework'; T_H_DONDE = 'Where it is covered'; T_S_DONDE = 'Documents, sections, templates, tools and examples that develop this area.'
       T_K_FUENTES = 'Sources'; T_H_FUENTES = 'External sources it is based on'; T_S_FUENTES = 'Official or primary sources cited by the documents of this area, checked in the reference register. Always verify the version in force on the date of use.'
       T_SIN_FUENTES = 'The documents of this area cite no external sources: their content is the author''s own method.'
       T_K_OTROS = 'Keep browsing'; T_H_OTROS = 'Other areas'; T_GLOSARIO = 'Full glossary (document 02)'; T_OTRO_IDIOMA = 'Esta página en español'
       doc = 'Document'; plantilla = 'Template'; herramienta = 'Tool'; ejemplo = 'Example' }
  } else {
    @{ T_PORTADA = 'Portada de AI Consulting: SEVEN-G, SPHERES y SPAD'; T_CABECERA = 'Cabecera de SEVEN-G: qué es y para qué sirve'; T_NAV = 'Secciones'; T_TODOS = 'Todas las áreas'; T_CONCEPTOS = 'Conceptos'; T_DONDE = 'Dónde se trata'; T_FUENTES = 'Fuentes'; T_BIBLIOTECA = 'Biblioteca'
       T_TEMA_SITIO = 'Tema de todo el sitio'; T_TEMA = 'Tema'; T_SALMON = 'Salmón'; T_CLARO = 'Salmón claro'; T_NOCHE = 'Noche'; T_IDIOMA = 'Idioma'; T_ANTETITULO = 'Áreas de actuación en IA'
       T_K_RESUMEN = 'En pocas palabras'; T_H_RESUMEN = 'De qué trata esta área'
       T_K_CONCEPTOS = 'Conceptos'; T_H_CONCEPTOS = 'Los conceptos que hacen falta'; T_S_CONCEPTOS = 'Definiciones tomadas del glosario de SEVEN-G (documento 02). Los códigos son enlaces a donde se explica cada uno.'
       T_K_DONDE = 'En el marco'; T_H_DONDE = 'Dónde se trata'; T_S_DONDE = 'Documentos, secciones, plantillas, herramientas y ejemplos que desarrollan esta área.'
       T_K_FUENTES = 'Fuentes'; T_H_FUENTES = 'Fuentes externas en que se basa'; T_S_FUENTES = 'Fuentes oficiales o primarias que citan los documentos de esta área, comprobadas en el registro de referencias. Verifique siempre la versión vigente en la fecha de uso.'
       T_SIN_FUENTES = 'Los documentos de esta área no citan fuentes externas: su contenido es método propio del autor.'
       T_K_OTROS = 'Seguir navegando'; T_H_OTROS = 'Otras áreas'; T_GLOSARIO = 'Glosario completo (documento 02)'; T_OTRO_IDIOMA = 'This page in English'
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
  $res = [ordered]@{}; $nP = 0
  foreach ($t in $datos.temas) {
    $tonoP = Tono-Area $nP; $nP++
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
    $idioma = if ($en) { "<a href=""../../es/areas/$($t.id).html"" title=""$($tx.T_OTRO_IDIOMA)"">ES</a><span class=""activo"">EN</span>" } else { "<span class=""activo"">ES</span><a href=""../../en/areas/$($t.id).html"" title=""$($tx.T_OTRO_IDIOMA)"">EN</a>" }
    $h = $plantilla
    foreach ($k in @($tx.Keys | Where-Object { $_ -like 'T_*' })) { $h = $h.Replace("{{$k}}", [string]$tx[$k]) }
    $h = $h.Replace('{{LANG}}', $lang).Replace('{{OTRO}}', $otro).Replace('{{ID}}', [string]$t.id).Replace('{{TONO}}', [string]$tonoP).Replace('{{TITULO}}', (Html-Entrada $tt.titulo)).Replace('{{PREGUNTA}}', (Html-Entrada $tt.pregunta)).
      Replace('{{RESUMEN}}', (Html-Entrada $tt.resumen)).Replace('{{PORTADA}}', $(if ($en) { '../../../../en/index.html' } else { '../../../../index.html' })).Replace('{{IDIOMA}}', $idioma).
      Replace('{{CONCEPTOS}}', $sbC.ToString()).Replace('{{ENLACES}}', $sbE.ToString().TrimEnd("`n")).Replace('{{FUENTES}}', $fuentes).Replace('{{OTROS}}', $otros).Replace('{{PIE_ENTRADA}}', $pie)
    # presentaciones del área (1 y 10 slides), desde presentaciones/manifiesto.json; sin ellas, ni bloque ni enlace en la barra
    $slA = Slides-Area ([string]$t.id) $lang $repo
    $h = $h.Replace('{{SLIDES}}', $slA).Replace('{{SLIDES_NAV}}', $(if ($slA) { "<a href=""#slides"">Slides</a>" } else { '' }))
    $res[[string]$t.id] = $h
  }
  $res
}

# ---- Áreas de actuación en IA en la portada del sitio (D165) ----
# Devuelve los enlaces a las páginas de área para la portada ($prefijo: ruta de la portada a la raíz del repositorio, '' o '../').
function Portada-Areas([string]$lang, [string]$prefijo) {
  $en = $lang -eq 'en'
  $datos = Get-Content (Join-Path $PSScriptRoot 'temas.json') -Raw -Encoding utf8 | ConvertFrom-Json -Depth 16
  $rot = if ($en) { @{ doc = 'Document'; plantilla = 'Template'; herramienta = 'Tool'; ejemplo = 'Example' } } else { @{ doc = 'Documento'; plantilla = 'Plantilla'; herramienta = 'Herramienta'; ejemplo = 'Ejemplo' } }
  $base = "${prefijo}SEVEN-G/html/$lang/"
  $desdeP = [IO.Path]::GetFullPath((Join-Path $PSScriptRoot $(if ($en) { '..\..\en' } else { '..\..' })))
  $sb = [Text.StringBuilder]::new(); $nA = 0
  [void]$sb.Append("      <!-- Iconos: Font Awesome Free 6.7.2, https://fontawesome.com (CC BY 4.0) -->`n")
  foreach ($t in $datos.temas) {
    $tx = if ($en) { $t.en } else { $t.es }; $tono = Tono-Area $nA; $nA++
    [void]$sb.Append("      <details class=""area"" name=""areas"" id=""area-$($t.id)"" style=""--h: $tono"">`n        <summary title=""$(Html-Entrada $tx.pregunta)"">$(Icono-Area $t.icono)<b>$(Html-Entrada $tx.titulo)</b><span>$(Html-Entrada $tx.pregunta)</span></summary>`n        <p class=""area-mas""><a href=""${base}areas/$($t.id).html"" title=""$(if ($en) { 'Area page: concepts, where it is covered and sources' } else { 'Página del área: conceptos, dónde se trata y fuentes' })"">$(if ($en) { 'Full page of this area' } else { 'Página completa del área' }) →</a></p>`n$(Slides-Tarjeta-Area $t.id $lang $desdeP 'area-slides' 'i')        <ul>`n")
    foreach ($e in $t.enlaces) {
      $texto = Html-Entrada $(if ($en) { $e.en } else { $e.es })
      $ancla = if ($en) { $e.ancla_en } else { $e.ancla_es }
      $href = $base + $e.href + $(if ($ancla) { "#$ancla" } else { '' })
      [void]$sb.Append("          <li><a href=""$href"" title=""$($rot[[string]$e.tipo]): $texto""><i class=""tipo $($e.tipo)"">$($rot[[string]$e.tipo])</i>$texto</a></li>`n")
    }
    [void]$sb.Append("        </ul>`n      </details>`n")
  }
  $sb.ToString().TrimEnd("`n")
}
# ---- Preguntas del consejo (D169): tarjetas de la entrada y una página por pregunta, desde build/preguntas.json.
function Preguntas-Entrada([string]$lang) {
  $en = $lang -eq 'en'
  $datos = Get-Content (Join-Path $PSScriptRoot 'preguntas.json') -Raw -Encoding utf8 | ConvertFrom-Json -Depth 16
  $n = 0
  (@($datos.preguntas | ForEach-Object {
    $n++; $tx = if ($en) { $_.en } else { $_.es }
    "      <a class=""pregunta"" href=""../preguntas/$($_.id).html"" title=""$(if ($en) { 'Open the page of this question: how SEVEN-G answers it and where to see it' } else { 'Abrir la página de esta pregunta: cómo la responde SEVEN-G y dónde verlo' })""><span class=""n"">$('{0:00}' -f $n)</span><b>$(Html-Entrada $tx.titulo)</b><span>$(Html-Entrada $tx.corta)</span><span class=""ir"">$(if ($en) { 'See the answer' } else { 'Ver la respuesta' }) →</span></a>"
  }) -join "`n")
}
# Devuelve un diccionario ordenado id -> HTML de la página de la pregunta.
function Paginas-Preguntas([string]$lang, [string]$repo) {
  $en = $lang -eq 'en'; $otro = if ($en) { 'es' } else { 'en' }
  $datos = Get-Content (Join-Path $PSScriptRoot 'preguntas.json') -Raw -Encoding utf8 | ConvertFrom-Json -Depth 16
  $temas = (Get-Content (Join-Path $PSScriptRoot 'temas.json') -Raw -Encoding utf8 | ConvertFrom-Json -Depth 16).temas
  $plantilla = [IO.File]::ReadAllText((Join-Path $PSScriptRoot 'preguntas.plantilla.html'))
  $tx = Textos-Temas $lang
  $q = if ($en) {
    @{ Q_TODAS = 'All questions'; Q_RESPUESTA = 'The answer'; Q_ANTETITULO = 'Questions your board will ask'; Q_K_RESPUESTA = 'How SEVEN-G answers it'; Q_H_RESPUESTA = 'The answer, in three ideas'
       Q_K_DONDE = 'See it now'; Q_H_DONDE = 'Where to see it and where it is explained'; Q_S_DONDE = 'Each link opens the tool, the example or the document. The examples use a fictitious company.'; Q_H_OTRAS = 'The other questions'
       vista_embudo = 'See the funnel on the SEVEN-G page'; vista_panel = 'See the board dashboard on the SEVEN-G page'; area = 'Full page of the area'
       alt_puerta = 'Technical illustration of a vault door labelled Stop Gate'; alt_escalera = 'Six-step staircase: maturity levels, from 0 (non-existent: chaos or proofs of concept only) to 5 (optimised: transformation)'
       niv = @('0 · Non-existent|chaos or PoCs only', '1 · Initial', '2 · Developing', '3 · Defined', '4 · Managed', '5 · Optimised|transformation') }
  } else {
    @{ Q_TODAS = 'Todas las preguntas'; Q_RESPUESTA = 'La respuesta'; Q_ANTETITULO = 'Preguntas que su consejo acabará haciendo'; Q_K_RESPUESTA = 'Cómo la responde SEVEN-G'; Q_H_RESPUESTA = 'La respuesta, en tres ideas'
       Q_K_DONDE = 'Véalo ahora'; Q_H_DONDE = 'Dónde verlo y dónde se explica'; Q_S_DONDE = 'Cada enlace abre la herramienta, el ejemplo o el documento. Los ejemplos usan una compañía ficticia.'; Q_H_OTRAS = 'Las otras preguntas'
       vista_embudo = 'Ver el embudo en la página de SEVEN-G'; vista_panel = 'Ver el panel del consejo en la página de SEVEN-G'; area = 'Página completa del área'
       alt_puerta = 'Ilustración técnica de una puerta acorazada con el rótulo Stop Gate'; alt_escalera = 'Escalera de seis peldaños: los niveles de madurez, del 0 (inexistente: caos o solo pruebas de concepto) al 5 (optimizado: transformación)'
       niv = @('0 · Inexistente|caos o solo POC', '1 · Inicial', '2 · En desarrollo', '3 · Definido', '4 · Gestionado', '5 · Optimizado|transformación') }
  }
  $entrada = [IO.File]::ReadAllText((Join-Path $PSScriptRoot "entrada/$lang/index.html"))
  $pie = [regex]::Match($entrada, '(?s)<footer>.*?</footer>').Value
  $res = [ordered]@{}
  foreach ($p in $datos.preguntas) {
    $pt = if ($en) { $p.en } else { $p.es }
    $parr = (@($pt.parrafos | ForEach-Object { "        <p>$(Html-Entrada $_)</p>" }) -join "`n")
    $vista = if ($p.vista) { "        <a class=""enlace"" href=""../entrada/index.html#$($p.vista)"">$($q["vista_$($p.vista)"]) →</a>" } else { '' }
    $imagen = ''
    if ($p.imagen -eq 'puerta') { $imagen = "      <div>`n        <img class=""plano ilus"" src=""../../entrada/SEVEN-G_06.png"" width=""1048"" height=""1200"" alt=""$($q.alt_puerta)"">`n      </div>" }
    elseif ($p.imagen -eq 'escalera') {
      $pos = @('right:82.1%;bottom:20.8%', 'right:70.1%;bottom:37%', 'right:57.9%;bottom:52.4%', 'right:45.7%;bottom:67.9%', 'right:33.7%;bottom:83.5%', 'right:21.5%;bottom:98.5%'); $i = 0
      $niv = (@($q.niv | ForEach-Object { $b, $it = $_ -split '\|'; $l = "          <span class=""niv"" style=""$($pos[$i])""><b>$b</b>$(if ($it) { "<i>$it</i>" })</span>"; $i++; $l }) -join "`n")
      $imagen = "      <div>`n        <div class=""escalera"">`n          <img class=""plano"" src=""../../entrada/SEVEN-G_13.png"" width=""1560"" height=""976"" alt=""$($q.alt_escalera)"">`n$niv`n        </div>`n      </div>"
    }
    $sbE = [Text.StringBuilder]::new()
    foreach ($e in $p.enlaces) {
      $texto = Html-Entrada $(if ($en) { $e.en } else { $e.es })
      $ancla = if ($en) { $e.ancla_en } else { $e.ancla_es }
      $href = '../' + $e.href + $(if ($ancla) { "#$ancla" } else { '' })
      [void]$sbE.Append("          <li><a href=""$href"" title=""$($tx[[string]$e.tipo]): $texto""><span class=""tipo $($e.tipo)"">$($tx[[string]$e.tipo])</span>$texto</a></li>`n")
    }
    $ar = $temas | Where-Object { $_.id -eq $p.area } | Select-Object -First 1
    $area = if ($ar) { $at = if ($en) { $ar.en } else { $ar.es }; "<a href=""../areas/$($ar.id).html"">$($q.area): $(Html-Entrada $at.titulo) →</a>" } else { '' }
    $otras = (@($datos.preguntas | Where-Object { $_.id -ne $p.id } | ForEach-Object { $o = if ($en) { $_.en } else { $_.es }; "      <a href=""$($_.id).html"">$(Html-Entrada $o.titulo)</a>" }) -join "`n")
    $idioma = if ($en) { "<a href=""../../es/preguntas/$($p.id).html"" title=""$($tx.T_OTRO_IDIOMA)"">ES</a><span class=""activo"">EN</span>" } else { "<span class=""activo"">ES</span><a href=""../../en/preguntas/$($p.id).html"" title=""$($tx.T_OTRO_IDIOMA)"">EN</a>" }
    $h = $plantilla
    foreach ($k in @($tx.Keys | Where-Object { $_ -like 'T_*' })) { $h = $h.Replace("{{$k}}", [string]$tx[$k]) }
    foreach ($k in @($q.Keys | Where-Object { $_ -like 'Q_*' })) { $h = $h.Replace("{{$k}}", [string]$q[$k]) }
    $h = $h.Replace('{{LANG}}', $lang).Replace('{{OTRO}}', $otro).Replace('{{ID}}', [string]$p.id).Replace('{{TITULO}}', (Html-Entrada $pt.titulo)).Replace('{{CORTA}}', (Html-Entrada $pt.corta)).
      Replace('{{PORTADA}}', $(if ($en) { '../../../../en/index.html' } else { '../../../../index.html' })).Replace('{{IDIOMA}}', $idioma).Replace('{{DUO}}', $(if ($imagen) { 'duo' } else { 'duo solo' })).
      Replace('{{PARRAFOS}}', $parr).Replace('{{VISTA}}', $vista).Replace('{{IMAGEN}}', $imagen).Replace('{{ENLACES}}', $sbE.ToString().TrimEnd("`n")).Replace('{{AREA}}', $area).Replace('{{OTRAS}}', $otras).Replace('{{PIE_ENTRADA}}', $pie)
    $res[[string]$p.id] = $h
  }
  $res
}
# Devuelve el texto de la portada con el bloque entre <!-- areas:inicio --> y <!-- areas:fin --> al día (o el mismo texto si no hay marcas).
function Portada-Con-Areas([string]$html, [string]$lang, [string]$prefijo) {
  [regex]::Replace($html, '(?s)(<!-- areas:inicio[^>]*-->).*?(\s*<!-- areas:fin -->)', { param($m) $m.Groups[1].Value + "`n" + (Portada-Areas $lang $prefijo) + "`n      <!-- areas:fin -->" })
}

# ---- Presentaciones en slides (PPTX y PDF), desde presentaciones/manifiesto.json ----
# El manifiesto lo escribe presentaciones/build_presentaciones.ps1 (build.ps1 lo ejecuta antes de generar las páginas).
# Ninguna tarjeta se escribe a mano: la entrada (<!-- presentaciones -->), los documentos 00 (zona de descargas), las páginas
# de área ({{SLIDES}}) y la portada (<!-- slides:<MARCO>:inicio --> … <!-- slides:fin -->) salen de aquí. Sin manifiesto, o si
# una presentación no está en él o no tiene sus ficheros, la página se genera sin ese bloque o esa tarjeta (D53).
$script:ORDEN_SLIDES = @{ '1' = 1; '5' = 2; '10' = 3; '20' = 4; 'curso' = 5 }
$script:CABECERA_MARCO = @{ 'SEVEN-G' = 'SEVEN-G/html/{0}/entrada/index.html'; 'SPHERES' = 'SPHERES/html/{0}/00_SPHERES_Que_es_y_para_que_sirve.html'; 'SPAD' = 'SPAD/html/{0}/00_SPAD_Que_es_y_para_que_sirve.html' }
function Manifiesto-Presentaciones([string]$repo) {
  $f = Join-Path $repo 'presentaciones/manifiesto.json'
  if (-not (Test-Path $f)) { return @() }
  try { $m = Get-Content $f -Raw -Encoding utf8 | ConvertFrom-Json -Depth 32 } catch { Write-Warning "presentaciones/manifiesto.json no se puede leer: $($_.Exception.Message)"; return @() }
  @($m.presentaciones | Where-Object { $_ -and $_.id })
}
# ficheros de una presentación en un idioma (rutas absolutas), solo los que existen
function Ficheros-Slides($p, [string]$lang, [string]$repo) {
  $r = @{}
  foreach ($k in 'pptx', 'pdf') {
    $rel = if ($p.$k) { [string]$p.$k.$lang } else { '' }
    if ($rel) { $abs = [IO.Path]::GetFullPath((Join-Path $repo $rel)); if (Test-Path $abs -PathType Leaf) { $r[$k] = $abs } }
  }
  $r
}
# presentaciones de un marco (sin las de área) o de un área, con algún fichero en ese idioma, en orden 1, 5, 10, 20, curso
function Presentaciones-De([string]$repo, [string]$lang, [string]$marco, [string]$area) {
  @(Manifiesto-Presentaciones $repo | Where-Object {
      if ($area) { [string]$_.area -eq $area } else { -not $_.area -and [string]$_.marco -eq $marco }
    } | Where-Object { (Ficheros-Slides $_ $lang $repo).Count } |
    Sort-Object @{ e = { $k = [string]$_.clave -replace '^.*_(\d+)$', '$1'; $o = $script:ORDEN_SLIDES[$k]; if ($o) { $o } else { 9 } } }, @{ e = { [string]$_.clave } })
}
function Rel-Slides([string]$desde, [string]$abs) { [IO.Path]::GetRelativePath($desde, $abs).Replace('\', '/') }
function Txt-Slides($o, [string]$lang) { if ($null -eq $o) { '' } elseif ($o -is [string]) { $o } else { [string]$o.$lang } }
function N-Slides([int]$n, [bool]$en) { if ($n -eq 1) { 'slide' } else { 'slides' } }
# tarjetas de descarga (entrada y páginas de área): título, descripción, nº de slides y dos botones del idioma de la página
function Tarjetas-Slides([object[]]$lista, [string]$lang, [string]$repo, [string]$desde) {
  $en = $lang -eq 'en'; $sb = [Text.StringBuilder]::new(); $i = 0
  foreach ($p in $lista) {
    $f = Ficheros-Slides $p $lang $repo; $tit = Html-Entrada (Txt-Slides $p.titulo $lang); $n = [int]$p.slides
    $clave = ([string]$p.clave -replace '^.*_(\d+)$', '$1')
    $botones = @()
    if ($f.pptx) { $botones += "<a class=""enlace"" href=""$(Rel-Slides $desde $f.pptx)"" download title=""$tit · PowerPoint$(if ($en) { ', editable' } else { ', editable' })"">PowerPoint →</a>" }
    if ($f.pdf) { $botones += "<a class=""enlace"" href=""$(Rel-Slides $desde $f.pdf)"" target=""_blank"" rel=""noopener"" title=""$tit · PDF$(if ($en) { ' with the notes of each slide' } else { ' con las notas de cada slide' })"">PDF →</a>" }
    [void]$sb.Append("      <article class=""slide-tarjeta"" data-clave=""$(Html-Entrada $clave)"">`n        <p class=""slide-n""><b>$n</b> $(N-Slides $n $en)</p>`n        <h3>$tit</h3>`n        <p>$(Html-Entrada (Txt-Slides $p.descripcion $lang))</p>`n        <p class=""slide-descargas"">$($botones -join '')</p>`n      </article>`n")
    $i++
  }
  $sb.ToString().TrimEnd("`n")
}
# enlace a la sección de slides de otro marco, relativo a $desde ($null si ese marco no tiene presentaciones)
function Enlace-Slides-Marco([string]$repo, [string]$lang, [string]$marco, [string]$desde) {
  if (-not (Presentaciones-De $repo $lang $marco '').Count) { return $null }
  (Rel-Slides $desde ([IO.Path]::GetFullPath((Join-Path $repo ($script:CABECERA_MARCO[$marco] -f $lang))))) + '#presentaciones'
}
# Sección #presentaciones de la entrada de SEVEN-G (marca <!-- presentaciones -->) y su enlace en la barra (<!-- presentaciones-nav -->)
function Slides-Entrada([string]$lang, [string]$repo) {
  $en = $lang -eq 'en'
  $desde = Join-Path $repo "SEVEN-G/html/$lang/entrada"
  $lista = Presentaciones-De $repo $lang 'SEVEN-G' ''
  if (-not $lista.Count) { return '' }
  $otros = @()
  # SPAD es otro nivel (construir software con IA, D176): la entrada de SEVEN-G no enlaza sus slides
  foreach ($m in 'SPHERES') { $h = Enlace-Slides-Marco $repo $lang $m $desde; if ($h) { $otros += "<a class=""enlace"" href=""$h"" title=""$(if ($en) { "$m in slides: presentations in PowerPoint and PDF" } else { "$m en slides: presentaciones en PowerPoint y PDF" })"">$m $(if ($en) { 'in slides' } else { 'en slides' }) →</a>" } }
  $nAreas = @(Manifiesto-Presentaciones $repo | Where-Object { $_.area -and (Ficheros-Slides $_ $lang $repo).Count } | ForEach-Object { [string]$_.area } | Sort-Object -Unique).Count
  if ($nAreas) { $otros += "<a class=""enlace"" href=""#areas"" title=""$(if ($en) { 'Each AI action area has its own presentations in 1 and 10 slides, on its full page' } else { 'Cada área de actuación en IA tiene sus presentaciones de 1 y 10 slides en su página completa' })"">$(if ($en) { "The $nAreas AI action areas, each in 1 and 10 slides" } else { "Las $nAreas áreas de actuación en IA, cada una en 1 y 10 slides" }) →</a>" }
  $kicker = if ($en) { 'For a meeting or a classroom' } else { 'Para una reunión o un aula' }
  $h2 = if ($en) { 'SEVEN-G in slides' } else { 'SEVEN-G en slides' }
  $sub = if ($en) { 'From one slide to the complete course, in PowerPoint (editable) and PDF. Each version tells the same story in more depth; the notes of each slide explain it and link to the document that develops it.' } else { 'De una slide al curso completo, en PowerPoint (editable) y en PDF. Cada versión cuenta lo mismo con más profundidad; las notas de cada slide lo explican y enlazan al documento que lo desarrolla.' }
  $linea = if ($otros.Count) { "`n    <p class=""presentacion slides-otros""><b>$(if ($en) { 'Also in slides:' } else { 'También en slides:' })</b> <span class=""dos-enlaces"">$($otros -join '')</span></p>" } else { '' }
  "<section id=""presentaciones"">`n  <div class=""envoltura"">`n    <p class=""kicker"">$kicker</p>`n    <h2>$h2</h2>`n    <p class=""sub"">$sub</p>`n    <div class=""slides"">`n$(Tarjetas-Slides $lista $lang $repo $desde)`n    </div>$linea`n  </div>`n</section>"
}
function Slides-Nav-Entrada([string]$lang, [string]$repo) {
  if (-not (Presentaciones-De $repo $lang 'SEVEN-G' '').Count) { return '' }
  '<a href="#presentaciones">Slides</a>'
}
# Bloque «Esta área en slides» de la página de un área ({{SLIDES}}) y su enlace en la barra ({{SLIDES_NAV}})
function Slides-Area([string]$id, [string]$lang, [string]$repo) {
  $en = $lang -eq 'en'
  $lista = Presentaciones-De $repo $lang 'SEVEN-G' $id
  if (-not $lista.Count) { return '' }
  $desde = Join-Path $repo "SEVEN-G/html/$lang/areas"
  $sub = if ($en) { 'The whole area in one slide, or in ten slides to explain it in a meeting or a classroom. PowerPoint (editable) and PDF with the notes of each slide.' } else { 'El área completa en una slide, o en diez para explicarla en una reunión o en un aula. PowerPoint (editable) y PDF con las notas de cada slide.' }
  "<section id=""slides"">`n  <div class=""envoltura"">`n    <p class=""kicker"">$(if ($en) { 'Presentations' } else { 'Presentaciones' })</p>`n    <h2>$(if ($en) { 'This area in slides' } else { 'Esta área en slides' })</h2>`n    <p class=""sub"">$sub</p>`n    <div class=""slides"">`n$(Tarjetas-Slides $lista $lang $repo $desde)`n    </div>`n  </div>`n</section>"
}
# Grupos de la zona de descargas del documento 00 de un marco (build.ps1, D97): una tarjeta por presentación con PPTX y PDF
function Grupos-Slides-Doc([string]$marco, [string]$lang, [string]$repo, [string]$desde) {
  $en = $lang -eq 'en'; $g = [Collections.Generic.List[object]]::new()
  foreach ($p in (Presentaciones-De $repo $lang $marco '')) {
    $f = Ficheros-Slides $p $lang $repo; $tit = Txt-Slides $p.titulo $lang; $n = [int]$p.slides
    $enl = [Collections.Generic.List[string]]::new()
    if ($f.pptx) { $enl.Add("<a class=""dz-item"" href=""$(Rel-Slides $desde $f.pptx)"" download title=""$(Html-Entrada "$tit · PowerPoint")""><span class=""dz-tipo"">PPTX</span><b>PowerPoint</b></a>") }
    if ($f.pdf) { $enl.Add("<a class=""dz-item"" href=""$(Rel-Slides $desde $f.pdf)"" target=""_blank"" rel=""noopener"" title=""$(Html-Entrada "$tit · PDF")""><span class=""dz-tipo"">PDF</span><b>$(if ($en) { 'Open as PDF' } else { 'Abrir en PDF' })</b></a>") }
    $g.Add(@{ clave = $(if ([string]$p.clave -eq 'curso') { 'slides-curso' } else { 'slides' }); rotulo = "$n $(N-Slides $n $en)"; titulo = $tit; texto = (Txt-Slides $p.descripcion $lang); enlaces = $enl })
  }
  $g
}
# Tarjeta «También en slides» del documento 00 de SEVEN-G o SPHERES: el otro marco de gobierno y las áreas
function Grupo-Slides-Otros([string]$marco, [string]$lang, [string]$repo, [string]$desde) {
  $en = $lang -eq 'en'; $enl = [Collections.Generic.List[string]]::new()
  # Gobierno de la IA (SEVEN-G y SPHERES) y construir software con IA (SPAD) no se cruzan (D176): SPAD no lleva esta tarjeta
  if ($marco -eq 'SPAD') { return $null }
  foreach ($m in @('SEVEN-G', 'SPHERES' | Where-Object { $_ -ne $marco })) {
    $h = Enlace-Slides-Marco $repo $lang $m $desde
    if ($h) { $enl.Add("<a class=""dz-item"" href=""$h"" title=""$(if ($en) { "$m in slides" } else { "$m en slides" })""><span class=""dz-tipo html"">Slides</span><b>$m</b></a>") }
  }
  if (@(Manifiesto-Presentaciones $repo | Where-Object { $_.area -and (Ficheros-Slides $_ $lang $repo).Count }).Count) {
    $hA = (Rel-Slides $desde ([IO.Path]::GetFullPath((Join-Path $repo "SEVEN-G/html/$lang/entrada/index.html")))) + '#areas'
    $enl.Add("<a class=""dz-item"" href=""$hA"" title=""$(if ($en) { 'Each AI action area in 1 and 10 slides, on its page' } else { 'Cada área de actuación en IA en 1 y 10 slides, en su página' })""><span class=""dz-tipo html"">Slides</span><b>$(if ($en) { 'AI action areas' } else { 'Áreas de actuación en IA' })</b></a>")
  }
  if (-not $enl.Count) { return $null }
  @{ clave = 'slides-otros'; rotulo = $(if ($en) { 'Other frameworks' } else { 'Otros marcos' }); titulo = $(if ($en) { 'Also in slides' } else { 'También en slides' })
     texto = $(if ($en) { 'The presentations of the other AI governance framework and of each AI action area.' } else { 'Las presentaciones del otro marco de gobierno de la IA y de cada área de actuación en IA.' }); enlaces = $enl }
}
# Portada: línea «<Marco> en slides» bajo los botones de cada metodología, entre <!-- slides:<MARCO>:inicio … --> y <!-- slides:fin -->
function Portada-Con-Slides([string]$html, [string]$lang, [string]$prefijo, [string]$repo) {
  $en = $lang -eq 'en'
  $desde = [IO.Path]::GetFullPath((Join-Path $repo $(if ($en) { 'en' } else { '.' })))
  [regex]::Replace($html, '(?s)(<!-- slides:(SEVEN-G|SPHERES|SPAD):inicio[^>]*-->).*?(<!-- slides:fin -->)', {
      param($m)
      $marco = $m.Groups[2].Value
      $lista = Presentaciones-De $repo $lang $marco ''
      $cuerpo = ''
      if ($lista.Count) {
        $h = Enlace-Slides-Marco $repo $lang $marco $desde
        $nums = @($lista | Where-Object { [string]$_.clave -ne 'curso' } | ForEach-Object { [string]$_.slides })
        $y = if ($en) { 'and' } else { 'y' }
        $txtN = if ($nums.Count -gt 1) { ($nums[0..($nums.Count - 2)] -join ', ') + " $y " + $nums[-1] } else { $nums -join '' }
        $curso = @($lista | Where-Object { [string]$_.clave -eq 'curso' }).Count
        $det = if ($en) { "$(if ($txtN) { "$txtN slides" })$(if ($txtN -and $curso) { ' and ' })$(if ($curso) { 'the complete course' }), in PowerPoint and PDF." } else { "$(if ($txtN) { "$txtN slides" })$(if ($txtN -and $curso) { ' y ' })$(if ($curso) { 'el curso completo' }), en PowerPoint y PDF." }
        $cuerpo = "`n      <p class=""nota-acciones nota-slides""><a href=""$h"" title=""$(if ($en) { "$marco presentations to download" } else { "Presentaciones de $marco para descargar" })""><strong>$marco $(if ($en) { 'in slides' } else { 'en slides' }) →</strong></a> $det</p>`n      "
      }
      $m.Groups[1].Value + $cuerpo + $m.Groups[3].Value
    })
}
