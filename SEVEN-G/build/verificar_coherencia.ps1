<#
  Pruebas de coherencia del repositorio antes de hacer commit y push (D52).

  Uso:   pwsh -File SEVEN-G/build/verificar_coherencia.ps1 [-SinNavegador]
  Sale con código 0 si todo es coherente y con 1 si hay algún error. No modifica nada del repositorio (trabaja en una carpeta temporal).

  Qué comprueba:
    1. Paridad ES/EN de los Markdown de SEVEN-G, SPHERES y SPAD (D12) y que cada documento tiene su HTML y su PDF (D11, D32).
    2. Textos internos o de clientes en lo que se publica (D17, D33): los mismos patrones que .github/workflows/pages.yml y, si existe,
       la lista privada de términos prohibidos (~/.seveng/terminos_prohibidos.txt).
    3. Aviso legal presente en las herramientas y paneles publicados (D33).
    4. Portada: el primer botón de cada metodología es el que explica el marco (D46) y sus enlaces locales existen.
    1e. Ninguna herramienta (Tnn) citada en los HTML generados queda sin enlace (D64).
    1f. Los documentos de SEVEN-G no se presentan como provisionales (D40) y la adaptación Lite del 30 no contradice a 01 (D66).
    1g. El navegador de documentos de cada página lista toda su biblioteca (una generación con -Filter no lo recorta).
    1h. El documento 00 (ES/EN) lleva el mapa de uso navegable con sus fases, puertas y listas enlazadas y anclas existentes (D72).
    1j. Cada documento numerado de SEVEN-G lleva su recuadro «Lo esencial» con el mismo nivel en ES y EN y en la matriz del documento 94 (D75),
        y el curso tiene su guía y sus nueve módulos, enlazados desde la guía, el documento 00, el 94 y la portada (D79).
    5. T01: registro.html coincide con lo que genera build_registro.ps1 (no se ha editado a mano ni está desfasado, D43).
       T14: indice.html coincide con lo que genera build_indice.ps1 (D64).
       T06: los riesgos de demostración tienen niveles coherentes con probabilidad × impacto y aceptaciones del órgano de su nivel (D65).
    6. T17: el panel de ejemplo coincide con lo que genera el conector desde los datos de demostración (D43, D44); requiere uv.
       El índice de ejemplo del panel (ejemplo/t14_indice.json) coincide con lo que calcula T14 desde los datos de T01 (D71).
    7. Prueba de humo en Edge sin ventana: el registro, el panel completo y el panel móvil se dibujan (un error de JavaScript los deja vacíos),
       y la calculadora T14 reproduce el ejemplo del documento 12 §9 (suma 12, transformación declarada no evidenciada).
    8. Registro de decisiones: numeración única y correlativa.
    10. Comunidad (D80): la página de incidencias y peticiones no pide correo ni datos de contacto, no carga recursos de terceros, no usa
        cookies, muestra la regla de los votos, está enlazada desde la portada (ES/EN) y en su carpeta no hay ningún token.
    17. Códigos citados en cualquier panel (D99): codigos.js enlaza los códigos escritos y ofrece «Citados aquí»; las herramientas, el
        motor de T17 (completo, móvil y recomendaciones), su ejemplo, la comunidad y la página de T17 lo cargan; los que prometen no
        medir visitas lo cargan con data-sin-medicion. La prueba de humo (7) sirve cada página con su ruta real para que codigos.js
        se cargue y comprueba que aparecen el control y los enlaces.
    18. Mapa de datos entre herramientas (D100): mapa_datos.json con todas sus rutas en el esquema de T01 (0.6); T11, T14 y T15 leen el
        registro del navegador (misma clave) y atienden ?desde=t01; T01 incorpora sus resultados; las demostraciones de T11, T14, T15 y T17
        son de la misma compañía que T01 y derivan de él (cálculo del índice y madurez de T15); documento 03 §4.1 (ES/EN).
    20. Buscador de términos en todas las páginas (D104): busqueda.json (ES/EN) generado por busqueda.ps1 cubre todas las páginas publicadas
        y sus anclas existen; cada página generada lleva el selector de ámbito; el control de códigos se rotula «Buscador de documentos»;
        M01 lo explica. La prueba de humo (7) busca «embudo» en todas las páginas desde el documento 00 y comprueba que aparece la lista.
#>
param([switch]$SinNavegador)
$ErrorActionPreference = 'Stop'
$repo = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
$errores = [Collections.Generic.List[string]]::new(); $avisos = [Collections.Generic.List[string]]::new()
function Ok([string]$m) { Write-Host "  ok   $m" }
function Mal([string]$m) { $script:errores.Add($m); Write-Host "  MAL  $m" -ForegroundColor Red }
function Aviso([string]$m) { $script:avisos.Add($m); Write-Host "  aviso $m" -ForegroundColor Yellow }
$tmp = Join-Path ([IO.Path]::GetTempPath()) ("seveng_coherencia_" + [Guid]::NewGuid().ToString('N').Substring(0, 8))
New-Item -ItemType Directory -Force $tmp | Out-Null

try {
  # ---- 1. paridad ES/EN y salidas
  Write-Host '1. Paridad ES/EN y salidas HTML/PDF'
  foreach ($met in 'SEVEN-G', 'SPHERES', 'SPAD') {
    $mds = Join-Path $repo "$met\mds"; if (-not (Test-Path $mds)) { continue }
    $rel = @{}
    foreach ($lang in 'es', 'en') {
      $base = Join-Path $mds $lang
      $rel[$lang] = @(Get-ChildItem $base -Recurse -File -Filter *.md | ForEach-Object { [IO.Path]::GetRelativePath($base, $_.FullName).Replace('\', '/') })
    }
    $soloEs = $rel.es | Where-Object { $_ -notin $rel.en -and $_ -notlike '_trabajo/*' }
    $soloEn = $rel.en | Where-Object { $_ -notin $rel.es -and $_ -notlike '_trabajo/*' }
    foreach ($x in $soloEs) { Mal "$met`: sin versión inglesa: $x" }
    foreach ($x in $soloEn) { Mal "$met`: sin versión española: $x" }
    $faltan = 0
    foreach ($lang in 'es', 'en') {
      foreach ($x in ($rel[$lang] | Where-Object { $_ -notlike '_*' -and $_ -notlike '*/_*' })) {
        $b = $x.Substring(0, $x.Length - 3)
        foreach ($s in @("html\$lang\$b.html", "pdf\$lang\$b.pdf")) { if (-not (Test-Path (Join-Path $repo "$met\$s"))) { Mal "$met`: falta $s"; $faltan++ } }
      }
    }
    if (-not $soloEs -and -not $soloEn -and -not $faltan) { Ok "$met`: $($rel.es.Count) documentos ES y $($rel.en.Count) EN, con HTML y PDF" }
  }

  # Markdown: una línea «---» o «===» pegada a un párrafo o a una tabla convierte ese texto en un título (y estropea el índice del
  # documento y el PDF). Se exige una línea en blanco antes del separador; los bloques de código no cuentan.
  Write-Host '1b. Separadores del Markdown'
  $pegados = foreach ($f in (Get-ChildItem (Join-Path $repo 'SEVEN-G\mds'), (Join-Path $repo 'SPHERES\mds'), (Join-Path $repo 'SPAD\mds') -Recurse -File -Filter *.md)) {
    $l = [IO.File]::ReadAllLines($f.FullName); $enCodigo = $false
    for ($i = 0; $i -lt $l.Count; $i++) {
      if ($l[$i] -match '^\s*(```|~~~)') { $enCodigo = -not $enCodigo; continue }
      if (-not $enCodigo -and $i -gt 0 -and $l[$i] -match '^\s*(-{3,}|={3,})\s*$' -and $l[$i - 1].Trim() -ne '' -and $l[$i - 1] -notmatch '^\s*(-{3,}|={3,}|```|~~~)') { "$([IO.Path]::GetRelativePath($repo, $f.FullName)):$($i + 1)" }
    }
  }
  foreach ($x in $pegados) { Mal "separador pegado al texto anterior (falta una línea en blanco): $x" }
  $titulosRotos = Get-ChildItem (Join-Path $repo 'SEVEN-G\html'), (Join-Path $repo 'SPHERES\html'), (Join-Path $repo 'SPAD\html') -Recurse -File -Filter *.html | Select-String -Pattern '<h[23][^>]*>(<span[^>]*>[^<]*</span>)?\s*\|' -List
  foreach ($x in $titulosRotos) { Mal "título generado a partir de una tabla: $([IO.Path]::GetRelativePath($repo, $x.Path))" }
  if (-not $pegados -and -not $titulosRotos) { Ok 'sin separadores pegados ni títulos generados a partir de tablas' }

  # marcadores entre < > sin escapar en el texto (p. ej. RT-<CAT>-NN): el navegador los toma por etiquetas y desaparecen. En texto corrido
  # se escriben \<CAT\>; dentro de código (`…`) van tal cual
  Write-Host '1d. Marcadores entre < > sin escapar'
  $etiquetasHtml = 'br|b|i|u|em|strong|sub|sup|span|div|a|p|small|code|kbd|details|summary|figure|figcaption|img|table|thead|tbody|tr|td|th|ul|ol|li|svg|path|g|rect|text|line|circle|polygon|defs|marker|tspan'
  $sinEscapar = foreach ($f in (Get-ChildItem (Join-Path $repo 'SEVEN-G\mds'), (Join-Path $repo 'SPHERES\mds'), (Join-Path $repo 'SPAD\mds') -Recurse -File -Filter *.md | Where-Object { $_.FullName -notmatch '[\\/]_trabajo[\\/]' })) {
    $enCodigo = $false; $i = 0
    foreach ($l in [IO.File]::ReadAllLines($f.FullName)) {
      $i++; if ($l -match '^\s*(```|~~~)') { $enCodigo = -not $enCodigo; continue }; if ($enCodigo) { continue }
      $sinCodigo = [regex]::Replace($l, '`[^`]*`', '')
      foreach ($m in [regex]::Matches($sinCodigo, "(?<!\\)<(?!!--|/?(?:$etiquetasHtml)\b|https?:)[^<>\s\\][^<>\\]*>")) { "$([IO.Path]::GetRelativePath($repo, $f.FullName)):$i $($m.Value)" }
    }
  }
  foreach ($x in ($sinEscapar | Select-Object -First 10)) { Mal "marcador sin escapar: $x" }
  if (-not $sinEscapar) { Ok 'ningún marcador entre < > sin escapar' }

  # enlaces locales de los HTML generados: cada href o src relativo debe existir en disco, y cada ancla interna, en la página
  Write-Host '1c. Enlaces locales de los HTML generados'
  $rotos = [Collections.Generic.List[string]]::new(); $nEnlaces = 0
  foreach ($f in (Get-ChildItem (Join-Path $repo 'SEVEN-G\html'), (Join-Path $repo 'SPHERES\html'), (Join-Path $repo 'SPAD\html') -Recurse -File -Filter *.html | Where-Object { $_.FullName -notmatch '[\\/]_trabajo[\\/]' })) {
    $html = [IO.File]::ReadAllText($f.FullName); $sinScript = [regex]::Replace($html, '(?s)<script\b.*?</script>', '')
    foreach ($a in [regex]::Matches($sinScript, '\s(?:href|src)="([^"]+)"')) {
      $u = $a.Groups[1].Value
      if ($u -match '^(https?:|mailto:|data:|javascript:)' -or $u -eq '#') { continue }
      $nEnlaces++
      if ($u.StartsWith('#')) { if ($html -notmatch ('id="' + [regex]::Escape($u.Substring(1)) + '"')) { $rotos.Add("$([IO.Path]::GetRelativePath($repo, $f.FullName)) -> $u") }; continue }
      $ruta = ($u -split '[#?]')[0]
      if ($ruta -and -not (Test-Path -LiteralPath (Join-Path (Split-Path $f.FullName) ([Uri]::UnescapeDataString($ruta))))) { $rotos.Add("$([IO.Path]::GetRelativePath($repo, $f.FullName)) -> $u") }
    }
  }
  foreach ($x in ($rotos | Select-Object -First 15)) { Mal "enlace roto: $x" }
  if ($rotos.Count -gt 15) { Mal "… y $($rotos.Count - 15) enlaces rotos más" }
  if (-not $rotos.Count) { Ok "$nEnlaces enlaces locales comprobados, ninguno roto" }

  # toda herramienta del catálogo (T01–T22) citada en el texto de un HTML generado lleva enlace: a su aplicación, al módulo de T01
  # o al procedimiento con el que se aplica (D64). Se descartan enlaces, código, scripts, estilos, la cabecera y los rótulos de los
  # diagramas (salen de un comentario «grafico:» y no admiten enlaces).
  Write-Host '1e. Herramientas citadas sin enlace'
  $sinEnlace = [Collections.Generic.List[string]]::new()
  foreach ($f in (Get-ChildItem (Join-Path $repo 'SEVEN-G\html'), (Join-Path $repo 'SPHERES\html'), (Join-Path $repo 'SPAD\html') -Recurse -File -Filter *.html -ErrorAction SilentlyContinue | Where-Object { $_.FullName -notmatch '[\\/]_trabajo[\\/]' })) {
    $txt = [regex]::Replace([IO.File]::ReadAllText($f.FullName), '(?s)<head\b.*?</head>|<script\b.*?</script>|<style\b.*?</style>|<a\b.*?</a>|<code\b.*?</code>|<div class="g-(?:titulo|sub)">.*?</div>|<pre class="mermaid">.*?</pre>', ' ')
    $txt = [regex]::Replace($txt, '<[^>]+>', ' ')
    $cods = @([regex]::Matches($txt, '(?<![\w/\-])T(0[1-9]|1\d|2[0-2])(?![\w])') | ForEach-Object Value | Select-Object -Unique)
    if ($cods.Count) { $sinEnlace.Add("$([IO.Path]::GetRelativePath($repo, $f.FullName)): $($cods -join ', ')") }
  }
  foreach ($x in ($sinEnlace | Select-Object -First 15)) { Mal "herramienta citada sin enlace: $x" }
  if ($sinEnlace.Count -gt 15) { Mal "… y $($sinEnlace.Count - 15) páginas más con herramientas sin enlace" }
  if (-not $sinEnlace.Count) { Ok 'todas las herramientas citadas llevan enlace' }

  # SEVEN-G 0.1 es operativa (D40): sus documentos no dicen que otros documentos o herramientas estén en redacción o pendientes.
  # Y la adaptación a organizaciones pequeñas no rebaja lo que 01 §9.3 exige a las iniciativas Enterprise (D66).
  Write-Host '1f. SEVEN-G operativa y alcance Lite coherente con 01'
  $provisional = Get-ChildItem (Join-Path $repo 'SEVEN-G\mds') -Recurse -File -Filter *.md | Where-Object { $_.FullName -notmatch '[\\/]_trabajo[\\/]' } |
    Select-String -Pattern 'en redacción|mientras no est[ée]n? (publicad|disponib|construid)|no esté construida|being drafted|until they are published|has not been built|while they are not available'
  foreach ($x in $provisional) { Mal "texto provisional en SEVEN-G (D40): $([IO.Path]::GetRelativePath($repo, $x.Path)):$($x.LineNumber)" }
  $liteRebajado = Get-ChildItem (Join-Path $repo 'SEVEN-G\mds') -Recurse -File -Filter '30_*.md' | Select-String -Pattern 'al menos en G3 y G5|at least at G3 and G5|mensual o bimestral|monthly or bimonthly'
  foreach ($x in $liteRebajado) { Mal "30 §11 contradice 01 §5.2 o §9.3 (D66): $([IO.Path]::GetRelativePath($repo, $x.Path)):$($x.LineNumber)" }
  if (-not $provisional -and -not $liteRebajado) { Ok 'sin textos provisionales y con la adaptación Lite alineada con 01' }

  # el navegador de documentos de cada página lista toda su biblioteca (documentos y plantillas sin _trabajo, más el índice):
  # una generación parcial con -Filter lo dejaba con solo las páginas generadas
  Write-Host '1g. Navegador de documentos completo'
  $navCortos = [Collections.Generic.List[string]]::new()
  foreach ($met in 'SEVEN-G', 'SPHERES', 'SPAD') {
    foreach ($lang in 'es', 'en') {
      $mdsL = Join-Path $repo "$met\mds\$lang"; $htmlL = Join-Path $repo "$met\html\$lang"
      if (-not (Test-Path $mdsL) -or -not (Test-Path $htmlL)) { continue }
      $esperado = @(Get-ChildItem $mdsL -Recurse -File -Filter *.md | Where-Object { $_.FullName -notmatch '[\\/]_trabajo[\\/]' }).Count + 1
      foreach ($f in (Get-ChildItem $htmlL -Recurse -File -Filter *.html)) {
        $m = [regex]::Match([IO.File]::ReadAllText($f.FullName), 'var navItems = (\[.*?\]);')
        if (-not $m.Success) { continue }
        $n = [regex]::Matches($m.Groups[1].Value, '"href"').Count
        if ($n -ne $esperado) { $navCortos.Add("$([IO.Path]::GetRelativePath($repo, $f.FullName)) ($n de $esperado)") }
      }
    }
  }
  foreach ($x in ($navCortos | Select-Object -First 10)) { Mal "navegador incompleto: $x. Generar sin -Filter" }
  if ($navCortos.Count -gt 10) { Mal "… y $($navCortos.Count - 10) páginas más con el navegador incompleto" }
  if (-not $navCortos.Count) { Ok 'todas las páginas listan su biblioteca completa en el navegador' }

  # el documento 00 (ES/EN) lleva el mapa de uso navegable (D72): las ocho fases enlazan a su manual (20), las ocho puertas a sus
  # criterios (21) y a su lista (22), y cada ancla que apunta a otro documento existe en él (1c solo comprueba el fichero)
  Write-Host '1h. Mapa de uso del documento 00'
  $mapaMal = 0
  foreach ($lang in 'es', 'en') {
    $f = Join-Path $repo "SEVEN-G\html\$lang\00_SEVEN-G_Que_es_y_para_que_sirve.html"
    if (-not (Test-Path $f)) { continue }
    # D73: antes del mapa, el diagrama conceptual del flujo (puertas, iterar, pivotar, parar y bucle de operación)
    $html00 = [IO.File]::ReadAllText($f)
    if ($html00 -notmatch '<div class="g-titulo">(Cómo fluye una iniciativa por SEVEN-G|How an initiative flows through SEVEN-G)</div>' -or $html00.IndexOf('g-titulo">Cómo fluye') + $html00.IndexOf('g-titulo">How an initiative flows') + 1 -gt $html00.IndexOf('<figure class="grafico mapa-uso">')) { Mal "00 [$lang]: falta el diagrama de flujo (<!-- figura: flujo-uso -->) antes del mapa de uso"; $mapaMal++ }
    if ($html00 -notmatch 'class="mu-bucle"' -or $html00 -notmatch 'class="mu-cel mu-sal"') { Mal "00 [$lang]: el mapa de uso no muestra las salidas de las puertas ni el bucle de operación"; $mapaMal++ }
    $mapa = [regex]::Match([IO.File]::ReadAllText($f), '(?s)<figure class="grafico mapa-uso">.*?</figure>').Value
    if (-not $mapa) { Mal "00 [$lang]: falta el mapa de uso (<!-- figura: mapa-uso -->)"; $mapaMal++; continue }
    $hrefs = @([regex]::Matches($mapa, 'href="([^"]+)"') | ForEach-Object { $_.Groups[1].Value })
    foreach ($par in @(@('20_', 8), @('21_', 8), @('22_', 8))) {
      $n = @($hrefs | Where-Object { $_ -like "$($par[0])*#*" } | Select-Object -Unique).Count
      if ($n -lt $par[1]) { Mal "00 [$lang]: el mapa de uso enlaza $n secciones de $($par[0])* (se esperan $($par[1]))"; $mapaMal++ }
    }
    foreach ($h in ($hrefs | Where-Object { $_ -match '^[^#]+\.html#[^/]' } | Select-Object -Unique)) {
      $destino = Join-Path (Split-Path $f) ($h -split '#')[0]
      if ((Test-Path $destino) -and [IO.File]::ReadAllText($destino) -notmatch ('id="' + [regex]::Escape(($h -split '#', 2)[1]) + '"')) { Mal "00 [$lang]: ancla inexistente en el mapa de uso: $h"; $mapaMal++ }
    }
  }
  if (-not $mapaMal) { Ok 'mapa de uso del documento 00 completo en ES y EN, con todas sus anclas' }

  # el documento 00 (ES/EN) abre con el inicio rápido (D74): sección 0 antes de la 1, con la figura de lo que se lleva sin coste
  # (índice, plantillas, las cinco aplicaciones y la licencia enlazados) y sin marcadores {{N_…}} sin sustituir
  Write-Host '1i. Inicio rápido del documento 00'
  $inicioMal = 0
  foreach ($lang in 'es', 'en') {
    $f = Join-Path $repo "SEVEN-G\html\$lang\00_SEVEN-G_Que_es_y_para_que_sirve.html"
    if (-not (Test-Path $f)) { continue }
    $html00 = [IO.File]::ReadAllText($f)
    $idInicio = if ($lang -eq 'es') { 'inicio-rapido-quick-start' } else { 'quick-start' }
    $idUno = if ($lang -eq 'es') { 'que-significa-seven-g' } else { 'what-seven-g-means' }
    $pInicio = $html00.IndexOf("<h2 id=""$idInicio"""); $pFigura = $html00.IndexOf('<figure class="grafico inicio-rapido">'); $pUno = $html00.IndexOf("<h2 id=""$idUno""")
    if ($pInicio -lt 0 -or $pFigura -lt $pInicio -or $pUno -lt $pFigura) { Mal "00 [$lang]: falta el inicio rápido (sección 0 con <!-- figura: inicio-rapido -->) antes de la sección 1"; $inicioMal++; continue }
    if ($html00 -match '\{\{N_[A-Z]+\}\}') { Mal "00 [$lang]: quedan recuentos sin sustituir ({{N_…}}) en el inicio rápido"; $inicioMal++ }
    $figura = [regex]::Match($html00, '(?s)<figure class="grafico inicio-rapido">.*?</figure>').Value
    foreach ($dest in 'index.html"', 'index.html#h-', 'T01_registro_iniciativas/', 'T11_calculadora_valor/', 'T14_indice_transformacion/', 'T15_diagnostico_madurez/', 'T17_panel_consejo/', '93_SEVEN-G_Licencia_uso_y_citacion.html') {
      if (-not $figura.Contains($dest)) { Mal "00 [$lang]: el inicio rápido no enlaza $dest"; $inicioMal++ }
    }
    if ($figura -notmatch 'CC BY 4\.0' -or $figura -notmatch 'MIT') { Mal "00 [$lang]: el inicio rápido no indica las licencias (CC BY 4.0 y MIT)"; $inicioMal++ }
  }
  if (-not $inicioMal) { Ok 'inicio rápido del documento 00 completo en ES y EN' }

  # lectura por capas (D75) y curso (D79): cada documento numerado de SEVEN-G lleva una directiva «esencial» con el mismo nivel en ES y EN,
  # ese nivel coincide con el de la tabla de documentos de la matriz (documento 94), el HTML muestra el recuadro, y el curso tiene su guía
  # y sus nueve módulos enlazados desde la guía, el documento 00, el 94 y la portada
  Write-Host '1j. Recuadro «Lo esencial», matriz de obligatoriedad y curso'
  $capasMal = 0
  $rotuloNivel = @{ siempre = 'Siempre'; enterprise = 'Enterprise'; condicional = 'Condicional'; recomendado = 'Recomendado'; consulta = 'Consulta' }
  $mdsEs = Join-Path $repo 'SEVEN-G\mds\es'; $mdsEn = Join-Path $repo 'SEVEN-G\mds\en'
  $f94 = Get-ChildItem $mdsEs -File -Filter '94_*.md' | Select-Object -First 1
  $matriz = @{}
  if ($f94) { foreach ($m in [regex]::Matches([IO.File]::ReadAllText($f94.FullName), '(?m)^\|\s*(\d{2})\s*\|\s*\[[^\]]+\]\([^)]+\)\s*\|\s*\*\*(\w+)\*\*')) { $matriz[$m.Groups[1].Value] = $m.Groups[2].Value } }
  else { Mal 'falta el documento 94 (matriz de obligatoriedad)'; $capasMal++ }
  foreach ($d in (Get-ChildItem $mdsEs -File -Filter '*.md' | Where-Object Name -match '^\d{2}_')) {
    $num = $d.Name.Substring(0, 2)
    $niveles = @{}
    foreach ($par in @(@('es', $d.FullName), @('en', (Join-Path $mdsEn $d.Name)))) {
      if (-not (Test-Path $par[1])) { continue }
      $dirs = [regex]::Matches([IO.File]::ReadAllText($par[1]), '<!--\s*esencial:\s*(\w+)\s*\|')
      if ($dirs.Count -ne 1) { Mal "$num [$($par[0])]: se espera una directiva «esencial» y hay $($dirs.Count)"; $capasMal++; continue }
      $niveles[$par[0]] = $dirs[0].Groups[1].Value.ToLowerInvariant()
      $html = Join-Path $repo "SEVEN-G\html\$($par[0])\$($d.BaseName).html"
      if ((Test-Path $html) -and [IO.File]::ReadAllText($html) -notmatch '<aside class="esencial" data-capa="') { Mal "$num [$($par[0])]: el HTML no muestra el recuadro «Lo esencial» (regenerar)"; $capasMal++ }
    }
    if ($niveles.es -and -not $rotuloNivel.ContainsKey($niveles.es)) { Mal "$num`: nivel de «esencial» desconocido: $($niveles.es)"; $capasMal++; continue }
    if ($niveles.es -and $niveles.en -and $niveles.es -ne $niveles.en) { Mal "$num`: el nivel de «esencial» difiere entre ES ($($niveles.es)) y EN ($($niveles.en))"; $capasMal++ }
    if ($f94 -and $niveles.es) {
      if (-not $matriz.ContainsKey($num)) { Mal "$num`: no figura en la tabla de documentos de la matriz (94 §6)"; $capasMal++ }
      elseif ($matriz[$num] -ne $rotuloNivel[$niveles.es]) { Mal "$num`: «Lo esencial» dice $($rotuloNivel[$niveles.es]) y la matriz (94 §6) dice $($matriz[$num])"; $capasMal++ }
    }
  }
  foreach ($lang in 'es', 'en') {
    $cursoDir = Join-Path $repo "SEVEN-G\mds\$lang\curso"
    $mods = @(Get-ChildItem $cursoDir -File -Filter 'M*.md' -ErrorAction SilentlyContinue)
    if ($mods.Count -lt 10) { Mal "curso [$lang]: se esperan la guía y nueve módulos y hay $($mods.Count) ficheros"; $capasMal++; continue }
    $guia = [IO.File]::ReadAllText((Join-Path $cursoDir 'M00_SEVEN-G_Curso_Guia_del_curso.md'))
    foreach ($mod in ($mods | Where-Object Name -ne 'M00_SEVEN-G_Curso_Guia_del_curso.md')) { if (-not $guia.Contains("$($mod.BaseName).html")) { Mal "curso [$lang]: la guía no enlaza $($mod.BaseName)"; $capasMal++ } }
    foreach ($n in '00', '94') {
      $doc = Get-ChildItem (Join-Path $repo "SEVEN-G\mds\$lang") -File -Filter "${n}_*.md" | Select-Object -First 1
      if ($doc -and -not [IO.File]::ReadAllText($doc.FullName).Contains('curso/M00_SEVEN-G_Curso_Guia_del_curso.html')) { Mal "$n [$lang]: no enlaza el curso"; $capasMal++ }
    }
    # el curso es una de las formas de empezar del inicio rápido del documento 00 (entre «30 minutos» y «90 días»)
    $html00c = Join-Path $repo "SEVEN-G\html\$lang\00_SEVEN-G_Que_es_y_para_que_sirve.html"
    if (Test-Path $html00c) {
      $pasos = [regex]::Match([IO.File]::ReadAllText($html00c), '(?s)<div class="ir-pasos">.*?</div>\s*</div>').Value
      if ([regex]::Matches($pasos, '<div class="ir-paso"><b>').Count -ne 4 -or -not $pasos.Contains('curso/M00_SEVEN-G_Curso_Guia_del_curso.html')) { Mal "00 [$lang]: el inicio rápido no ofrece el curso entre sus cuatro formas de empezar"; $capasMal++ }
    }
    $portada = Join-Path $repo $(if ($lang -eq 'en') { 'en\index.html' } else { 'index.html' })
    if (-not [IO.File]::ReadAllText($portada).Contains("html/$lang/curso/M00_SEVEN-G_Curso_Guia_del_curso.html")) { Mal "portada [$lang]: no enlaza el curso"; $capasMal++ }
    # curso completo descargable en PPT y PDF (petición del autor, 20-09-2026)
    # tres cursos en presentación (empresa, consultor y partner), cada uno con su PPT y su PDF, enlazados desde la guía (D86)
    $htmlGuia = Join-Path $repo "SEVEN-G\html\$lang\curso\M00_SEVEN-G_Curso_Guia_del_curso.html"
    $htmlGuiaTxt = if (Test-Path $htmlGuia) { [IO.File]::ReadAllText($htmlGuia) } else { '' }
    foreach ($cc in 'Empresa', 'Consultor', 'Partner') {
      if (-not (Test-Path (Join-Path $repo "SEVEN-G\pptx\$lang\SEVEN-G_Curso_$cc.pptx"))) { Mal "curso [$lang]: falta SEVEN-G_Curso_$cc.pptx (pwsh -File SEVEN-G/build/curso_pptx.ps1)"; $capasMal++ }
      if (-not (Test-Path (Join-Path $repo "SEVEN-G\pdf\$lang\curso\SEVEN-G_Curso_$cc.pdf"))) { Mal "curso [$lang]: falta SEVEN-G_Curso_$cc.pdf (curso_pptx.ps1 lo exporta con PowerPoint)"; $capasMal++ }
      if (-not $guia.Contains("SEVEN-G_Curso_$cc.pptx") -or -not $guia.Contains("SEVEN-G_Curso_$cc.pdf")) { Mal "curso [$lang]: la guía no enlaza el PPT y el PDF del curso «$cc»"; $capasMal++ }
      if ([regex]::Matches($htmlGuiaTxt, "SEVEN-G_Curso_$cc\.pptx").Count -lt 3) { Mal "curso [$lang]: la zona de descargas de la guía no ofrece el curso «$cc»"; $capasMal++ }
      # las descargas de la guía van agrupadas en una tarjeta por perfil, con su PPT y su PDF dentro (D97)
      if ($htmlGuiaTxt -notmatch "<div class=""dz-card"" data-grupo=""$($cc.ToLowerInvariant())"">(?:(?!<div class=""dz-card"").)*?SEVEN-G_Curso_$cc\.pptx(?:(?!<div class=""dz-card"").)*?SEVEN-G_Curso_$cc\.pdf") { Mal "curso [$lang]: la guía no agrupa en una tarjeta el PPT y el PDF del curso «$cc» (D97)"; $capasMal++ }
    }
    if (-not (Test-Path (Join-Path $repo "SEVEN-G\pdf\$lang\curso\SEVEN-G_Curso_completo.pdf"))) { Mal "curso [$lang]: falta SEVEN-G_Curso_completo.pdf (pwsh -File SEVEN-G/build/curso_pdf.ps1)"; $capasMal++ }
    if (-not $guia.Contains('SEVEN-G_Curso_completo.pdf')) { Mal "curso [$lang]: la guía no enlaza el PDF con los nueve módulos"; $capasMal++ }
  }
  # los PPT de los cursos solo llegan al sitio público si el flujo de Pages y publicar.ps1 copian SEVEN-G/pptx
  $pagesYml = Join-Path $repo '.github\workflows\pages.yml'
  if ((Test-Path $pagesYml) -and [IO.File]::ReadAllText($pagesYml) -notmatch 'for c in [^;]*\bpptx\b') { Mal 'pages.yml no publica SEVEN-G/pptx (los PPT de los cursos darían 404 en el sitio)'; $capasMal++ }
  if ([IO.File]::ReadAllText((Join-Path $repo 'SEVEN-G\build\publicar.ps1')) -notmatch "'pptx'") { Mal 'publicar.ps1 no publica SEVEN-G/pptx'; $capasMal++ }
  if (-not $capasMal) { Ok "«Lo esencial» en $($matriz.Count) documentos, coherente con la matriz (94) en ES y EN; curso completo, enlazado y descargable en PPT y PDF" }

  # ---- 2 y 3. textos internos o de clientes, y aviso legal
  Write-Host '2. Textos internos o de clientes en lo publicable'
  $publicables = @(Get-Item (Join-Path $repo 'index.html'), (Join-Path $repo 'en\index.html'))
  foreach ($c in 'SEVEN-G\html', 'SEVEN-G\herramientas', 'SPHERES\html', 'SPAD\html') {
    $d = Join-Path $repo $c
    if (Test-Path $d) { $publicables += Get-ChildItem $d -Recurse -File -Include *.html, *.md, *.json, *.py | Where-Object { $_.FullName -notmatch '[\\/](_[^\\/]*|__pycache__)[\\/]' } }
  }
  $patrones = @('_trabajo', 'notas_internas', 'C:\\SEACHAD', 'OneDrive')
  $lista = Join-Path $env:USERPROFILE '.seveng\terminos_prohibidos.txt'
  # un término por línea, buscado como texto literal sin distinguir mayúsculas; una línea «re:<expresión>» es una expresión regular
  # (p. ej., re:\bSIGLA\b(?!_) para una sigla que también forma parte de palabras corrientes o de claves de datos)
  if (Test-Path $lista) { $patrones += Get-Content $lista -Encoding utf8 | Where-Object { $_.Trim() -and -not $_.StartsWith('#') } | ForEach-Object { $x = $_.Trim(); if ($x.StartsWith('re:')) { $x.Substring(3) } else { [regex]::Escape($x) } } }
  else { Aviso "no existe la lista privada de términos prohibidos ($lista): solo se comprueban los patrones generales" }
  $hallazgos = $publicables | Select-String -Pattern ($patrones -join '|') -List
  foreach ($h in $hallazgos) { Mal "texto interno o prohibido en $([IO.Path]::GetRelativePath($repo, $h.Path)):$($h.LineNumber)" }
  if (-not $hallazgos) { Ok "$($publicables.Count) ficheros publicables sin textos internos ($($patrones.Count) patrones)" }

  # D81: sin la marca «SEACHAD» (en mayúsculas) en lo publicado; distinto de «seachad» en minúsculas, que es el
  # nombre real de la cuenta/organización de GitHub del autor (seachad.github.io, seachad/seven-g-feedback, Seachad-TEAM)
  $conSeachad = $publicables | Select-String -Pattern 'SEACHAD' -CaseSensitive -List
  foreach ($h in $conSeachad) { Mal "referencia a «SEACHAD» (D81, retirada de la marca): $([IO.Path]::GetRelativePath($repo, $h.Path)):$($h.LineNumber)" }
  if (-not $conSeachad) { Ok 'sin la marca «SEACHAD» en lo publicado' }

  # los términos de la lista privada tampoco pueden estar en el nombre de ningún fichero versionado (aunque no se publique)
  if (Test-Path $lista) {
    $privados = $patrones | Select-Object -Skip 4
    $nombres = @(& git -C $repo ls-files) | Where-Object { $n = $_ -replace '[-_]', ' '; $privados | Where-Object { $n -match $_ -or $n -match ($_ -replace '\\ ', ' ?') } }
    foreach ($x in $nombres) { Mal "término prohibido en el nombre de un fichero versionado: $x" }
    if (-not $nombres) { Ok 'ningún fichero versionado lleva términos prohibidos en el nombre' }
  }

  Write-Host '3. Aviso legal en herramientas y paneles'
  $conAviso = @('index.html', 'en\index.html', 'SEVEN-G\herramientas\T01_registro_iniciativas\registro.html', 'SEVEN-G\herramientas\T14_indice_transformacion\indice.html', 'SEVEN-G\herramientas\T11_calculadora_valor\calculadora.html', 'SEVEN-G\herramientas\T15_diagnostico_madurez\madurez.html','SEVEN-G\herramientas\T17_panel_consejo\index.html', 'SEVEN-G\herramientas\comunidad\index.html') +
    @(Get-ChildItem (Join-Path $repo 'SEVEN-G\herramientas\T17_panel_consejo\ejemplo\salida') -Filter *.html | ForEach-Object { [IO.Path]::GetRelativePath($repo, $_.FullName) })
  $sin = $conAviso | Where-Object { -not (Select-String -Path (Join-Path $repo $_) -Pattern 'Aviso legal|Legal notice' -Quiet) }
  foreach ($x in $sin) { Mal "sin aviso legal: $x" }
  if (-not $sin) { Ok "$($conAviso.Count) páginas con aviso legal" }

  # aviso de versión en revisión (D58) en las páginas principales mientras el marco esté en la versión 0.x; se retira al pasar a la 1.x
  $principales = @('index.html', 'en\index.html') + @(foreach ($met in 'SEVEN-G', 'SPHERES', 'SPAD') { foreach ($lang in 'es', 'en') { "$met\html\$lang\index.html"; "$met\html\$lang\00_${met}_Que_es_y_para_que_sirve.html" } })
  $sinRev = $principales | Where-Object { (Test-Path (Join-Path $repo $_)) -and -not (Select-String -Path (Join-Path $repo $_) -Pattern 'Versión en revisión|Version under review' -Quiet) }
  foreach ($x in $sinRev) { Mal "sin aviso de versión en revisión: $x" }
  if (-not $sinRev) { Ok "$($principales.Count) páginas principales con el aviso de versión en revisión" }

  # ---- 4. portada
  Write-Host '4. Portada: orden de botones y enlaces'
  foreach ($p in 'index.html', 'en\index.html') {
    $ruta = Join-Path $repo $p; $html = [IO.File]::ReadAllText($ruta); $bien = $true
    foreach ($m in [regex]::Matches($html, '(?s)<div class="acciones">(.*?)</div>')) {
      $primero = [regex]::Match($m.Groups[1].Value, '(?s)<a [^>]*>(.*?)</a>').Groups[1].Value
      if ($primero -notmatch '^(Qué es|What) ') { Mal "$p`: el primer botón no explica el marco: «$($primero -replace '<[^>]+>', ' ')»"; $bien = $false }
    }
    foreach ($m in [regex]::Matches($html, 'href="([^"#:]+)"')) {
      $destino = Join-Path (Split-Path $ruta) $m.Groups[1].Value
      if (-not (Test-Path $destino)) { Mal "$p`: enlace roto: $($m.Groups[1].Value)"; $bien = $false }
    }
    if ($bien) { Ok "$p" }
  }

  # ---- 5. T01 generado desde sus fuentes
  Write-Host '5. T01: registro.html generado desde los JSON'
  $t01 = Join-Path $repo 'SEVEN-G\herramientas\T01_registro_iniciativas'
  $salida = Join-Path $tmp 'registro.html'
  & pwsh -NoProfile -File (Join-Path $t01 'build_registro.ps1') -Salida $salida | Out-Null
  # se compara el texto sin depender de los finales de línea, que git puede cambiar al extraer el fichero
  if ($LASTEXITCODE) { Mal 'build_registro.ps1 ha fallado' }
  elseif (([IO.File]::ReadAllText($salida) -replace "`r`n", "`n") -cne ([IO.File]::ReadAllText((Join-Path $t01 'registro.html')) -replace "`r`n", "`n")) { Mal 'registro.html no coincide con sus fuentes: ejecutar build_registro.ps1 (nunca editarlo a mano)' }
  else { Ok 'registro.html coincide con datos_demo.json, catalogo_criterios.json y la plantilla' }

  # T14 generado desde sus fuentes (D64)
  $t14 = Join-Path $repo 'SEVEN-G\herramientas\T14_indice_transformacion'
  $salida14 = Join-Path $tmp 'indice.html'
  & pwsh -NoProfile -File (Join-Path $t14 'build_indice.ps1') -Salida $salida14 | Out-Null
  if ($LASTEXITCODE) { Mal 'build_indice.ps1 ha fallado' }
  elseif (([IO.File]::ReadAllText($salida14) -replace "`r`n", "`n") -cne ([IO.File]::ReadAllText((Join-Path $t14 'indice.html')) -replace "`r`n", "`n")) { Mal 'T14: indice.html no coincide con sus fuentes: ejecutar build_indice.ps1 (nunca editarlo a mano)' }
  else { Ok 'T14: indice.html coincide con datos_demo.json y la plantilla' }

  # T11 (con T13) y T15 generados desde sus fuentes (D68)
  $t11 = Join-Path $repo 'SEVEN-G\herramientas\T11_calculadora_valor'
  $t15 = Join-Path $repo 'SEVEN-G\herramientas\T15_diagnostico_madurez'
  foreach ($h in @(@{ dir = $t11; script = 'build_calculadora.ps1'; html = 'calculadora.html'; que = 'T11' }, @{ dir = $t15; script = 'build_madurez.ps1'; html = 'madurez.html'; que = 'T15' })) {
    $salidaH = Join-Path $tmp "$($h.que)_$($h.html)"
    & pwsh -NoProfile -File (Join-Path $h.dir $h.script) -Salida $salidaH | Out-Null
    if ($LASTEXITCODE) { Mal "$($h.que): $($h.script) ha fallado" }
    elseif (([IO.File]::ReadAllText($salidaH) -replace "`r`n", "`n") -cne ([IO.File]::ReadAllText((Join-Path $h.dir $h.html)) -replace "`r`n", "`n")) { Mal "$($h.que): $($h.html) no coincide con sus fuentes: ejecutar $($h.script) (nunca editarlo a mano)" }
    else { Ok "$($h.que): $($h.html) coincide con sus fuentes" }
  }

  # T06 (D65): los riesgos de demostración usan las escalas del documento 33 (nivel = probabilidad × impacto: Bajo 1–4, Medio 5–9,
  # Alto 10–15, Crítico 16–25) y ninguna aceptación la firma un órgano inferior al del nivel residual (33 §7.1)
  $nivelPI = { param($p, $i) if ($null -eq $p -or $null -eq $i) { return $null }; $n = [int]$p * [int]$i; if ($n -ge 16) { 'critico' } elseif ($n -ge 10) { 'alto' } elseif ($n -ge 5) { 'medio' } else { 'bajo' } }
  $rango = @{ producto = 0; patrocinador = 1; comite_ia = 2; consejo = 3 }; $requerido = @{ bajo = 0; medio = 1; alto = 2; critico = 3 }
  $malT06 = @()
  foreach ($r in (Get-Content (Join-Path $t01 'datos_demo.json') -Raw -Encoding utf8 | ConvertFrom-Json).riesgos) {
    $inh = & $nivelPI $r.probabilidad $r.impacto; $res = & $nivelPI $r.probabilidad_residual $r.impacto_residual
    if ($inh -and $r.nivel_inherente -ne $inh) { $malT06 += "$($r.id): nivel_inherente $($r.nivel_inherente) y P×I da $inh" }
    if ($res -and $r.nivel_residual -ne $res) { $malT06 += "$($r.id): nivel_residual $($r.nivel_residual) y P×I da $res" }
    if ($r.aceptacion -and $res -and $rango[$r.aceptacion.organo] -lt $requerido[$res]) { $malT06 += "$($r.id): aceptado por $($r.aceptacion.organo), inferior al órgano de un residual $res" }
  }
  if ($malT06) { Mal "T06: riesgos de demostración incoherentes con el documento 33: $($malT06 -join ' · ')" } else { Ok 'T06: niveles y aceptaciones de los riesgos de demostración coherentes con el documento 33' }

  # plantillas editables en Word (D67): cada plantilla tiene su .docx y este lleva la huella de su Markdown actual
  Add-Type -AssemblyName System.IO.Compression
  $malDocx = @(); $nDocx = 0
  foreach ($lang in 'es', 'en') {
    foreach ($p in (Get-ChildItem (Join-Path $repo "SEVEN-G\mds\$lang\plantillas") -File -Filter '*.md')) {
      $nDocx++
      $dx = Join-Path $repo "SEVEN-G\docx\$lang\plantillas\$($p.BaseName).docx"
      if (-not (Test-Path $dx)) { $malDocx += "falta $lang/$($p.BaseName).docx"; continue }
      $huella = [Convert]::ToHexString([Security.Cryptography.SHA256]::HashData([Text.Encoding]::UTF8.GetBytes(([IO.File]::ReadAllText($p.FullName) -replace "`r`n", "`n")))).ToLowerInvariant()
      $zip = [IO.Compression.ZipFile]::OpenRead($dx)
      try { $core = [IO.StreamReader]::new($zip.GetEntry('docProps/core.xml').Open()).ReadToEnd() } finally { $zip.Dispose() }
      if ($core -notmatch "sha256:$huella") { $malDocx += "$lang/$($p.BaseName).docx desfasado" }
    }
  }
  if ($malDocx) { Mal "plantillas en Word: $($malDocx -join ' · '). Ejecutar pwsh -File SEVEN-G/build/docx.ps1" } else { Ok "$nDocx plantillas con su versión editable en Word al día" }

  # ---- 6. T17: panel de ejemplo al día
  Write-Host '6. T17: panel de ejemplo generado desde los datos de demostración'
  $t17 = Join-Path $repo 'SEVEN-G\herramientas\T17_panel_consejo'
  if (Get-Command uv -ErrorAction SilentlyContinue) {
    $sal17 = Join-Path $tmp 'panel'
    Push-Location $t17
    $argIx = if (Test-Path (Join-Path $t17 'ejemplo\t14_indice.json')) { @('--indice', (Join-Path $t17 'ejemplo\t14_indice.json')) } else { @() }  # D71: el ejemplo lleva el índice de T14
    try { & uv run python t01_a_panel.py --salida $sal17 @argIx 2>&1 | Out-Null; $cod = $LASTEXITCODE } finally { Pop-Location }
    if ($cod) { Mal 'el conector t01_a_panel.py ha fallado' }
    else {
      # los pies del ejemplo publicado llevan enlaces que solo se ponen en la carpeta por defecto: se comparan los datos, que son la fuente de todo
      $a = Get-Content (Join-Path $sal17 't01_dashboard_data.json') -Raw | ConvertFrom-Json -Depth 64
      $b = Get-Content (Join-Path $t17 'ejemplo\salida\t01_dashboard_data.json') -Raw | ConvertFrom-Json -Depth 64
      $a.meta.textos.pie = $null; $b.meta.textos.pie = $null
      if (($a | ConvertTo-Json -Depth 64 -Compress) -ne ($b | ConvertTo-Json -Depth 64 -Compress)) { Mal 'el panel de ejemplo está desfasado: ejecutar uv run python t01_a_panel.py en T17_panel_consejo' }
      else { Ok "panel de ejemplo al día ($($a.casos.Count) casos)" }
      # D63: la demostración incluye una iniciativa transversal medida por unidad, y el panel la recibe con su bloque «alcance»
      $trans = @($a.casos | Where-Object { $_.alcance -and $_.alcance.tipo -eq 'transversal' })
      if (-not $trans.Count) { Mal 'D63: el panel de ejemplo no tiene ninguna iniciativa transversal con desglose por unidad (casos[].alcance)' }
      elseif (-not @($trans[0].alcance.unidades | Where-Object { $_.unidad }).Count) { Mal 'D63: la iniciativa transversal del ejemplo no trae unidades de negocio' }
      else { Ok "D63: iniciativa transversal medida por unidad ($(@($trans[0].alcance.unidades | Where-Object { $_.unidad }).Count) unidades)" }
      $plantilla = [IO.File]::ReadAllText((Join-Path $t01 '_fuentes\registro.plantilla.html'))
      if ($plantilla -match "const PANEL_DEMO = '([^']+)'" -and -not (Test-Path (Join-Path $t01 $Matches[1]))) { Mal "el registro enlaza a un panel de ejemplo que no existe: $($Matches[1])" }
    }
  } else { Aviso 'uv no está instalado: no se comprueba el panel de ejemplo' }

  # D71: el índice de transformación del panel de ejemplo es el que calcula T14 desde los mismos datos de T01 (requiere Edge)
  $ixEj = Join-Path $t17 'ejemplo\t14_indice.json'
  $edgeIx = @("${env:ProgramFiles(x86)}\Microsoft\Edge\Application\msedge.exe", "$env:ProgramFiles\Microsoft\Edge\Application\msedge.exe") | Where-Object { Test-Path $_ } | Select-Object -First 1
  if (-not (Test-Path $ixEj)) { Mal 'D71: falta el índice de ejemplo del panel (T17_panel_consejo/ejemplo/t14_indice.json)' }
  elseif ($SinNavegador -or -not $edgeIx) { Aviso 'sin navegador: no se comprueba el índice de ejemplo del panel' }
  else {
    $ixTmp = Join-Path $tmp 't14_indice.json'
    & pwsh -NoProfile -File (Join-Path $t14 'build_indice.ps1') -Salida (Join-Path $tmp 'indice_ix.html') -DesdeT01 (Join-Path $t01 'datos_demo.json') -Exportar $ixTmp | Out-Null
    if ($LASTEXITCODE -or -not (Test-Path $ixTmp)) { Mal 'D71: build_indice.ps1 -DesdeT01 ha fallado' }
    elseif (([IO.File]::ReadAllText($ixTmp) -replace "`r`n", "`n") -cne ([IO.File]::ReadAllText($ixEj) -replace "`r`n", "`n")) { Mal 'D71: el índice de ejemplo del panel está desfasado: ejecutar build_indice.ps1 -DesdeT01 ../T01_registro_iniciativas/datos_demo.json -Exportar ../T17_panel_consejo/ejemplo/t14_indice.json y regenerar el panel' }
    else { $rIx = (Get-Content $ixTmp -Raw | ConvertFrom-Json).calculos[0].resultado; Ok "D71: índice de ejemplo del panel al día ($($rIx.perfil_asignado), suma $($rIx.suma), cobertura $($rIx.cobertura)/8)" }
  }

  # ---- 7. prueba de humo en el navegador
  # Edge sin ventana abre cada página servida por un servidor local de un solo uso; la página lleva inyectado un informe que devuelve al
  # servidor los errores de JavaScript y si existen los elementos que debe haber dibujado. No se toca ningún fichero del repositorio.
  # Cada página se sirve con su ruta real dentro del repositorio (y el resto de ficheros, tal cual), para que sus rutas relativas
  # —codigos.js (D99), imágenes— resuelvan como en el sitio publicado.
  Write-Host '7. Prueba de humo en Edge sin ventana'
  $edge = @("${env:ProgramFiles(x86)}\Microsoft\Edge\Application\msedge.exe", "$env:ProgramFiles\Microsoft\Edge\Application\msedge.exe") | Where-Object { Test-Path $_ } | Select-Object -First 1
  if ($SinNavegador -or -not $edge) { Aviso 'sin navegador: no se hace la prueba de humo' }
  else {
    $salidaEj = Join-Path $t17 'ejemplo\salida'
    # D99: en cada página, el control «Ir a código» montado por codigos.js (input) y, donde el contenido nombra códigos, sus enlaces
    $ctl = '[data-ir-codigo] input[type="search"]'
    $pruebas = @(
      @{ f = (Join-Path $t01 'registro.html'); debe = @('#nav a[href="#/embudo"]', '#nav a[href="#/riesgos"]', '#nav a[href="#/consejo"]', '#lnk-panel', '#principal table', "#sitio-nav $ctl", '#principal a.cod-enlace[title]'); que = 'registro T01' }
      # el cálculo que se abre es el del documento 12 §9: suma 12, perfil subyacente Eficiencia a escala y asignado Transformación declarada, no evidenciada
      # D100: el cálculo que se abre es el de septiembre de 2026, calculado desde el registro de demostración de T01 (perfil asignado «declarada», subyacente «táctica», suma 12, cobertura 8); el de junio (documento 12 §9) queda en la evolución
      @{ f = (Join-Path $t14 'indice.html'); debe = @('#perfil[data-perfil="declarada"][data-evidenciado="tactica"][data-suma="12"][data-cobertura="8"]', 'tr[data-senal="8"][data-punt="1"]', '#nav a[href="#/umbrales"]', '#t01-local[data-registro]', "#sitio-nav $ctl", '#principal a.cod-enlace[title]'); que = 'calculadora T14 (cálculo desde el registro T01 de demostración)' }
      # T11: el caso de ejemplo IA-2026-001 da VAN 1.826.542 €, ROI 217,7 % y plazo 1,44 años (40 §8); T15: nivel global 2 limitado por D6 (11 §5)
      @{ f = (Join-Path $t11 'calculadora.html'); debe = @('#resultado[data-van="1826542"][data-roi="217.7"][data-payback="1.44"]', '#nav a[href="#/costes"]', '#t01-local[data-registro]', "#sitio-nav $ctl", '#principal a.cod-enlace[title]'); que = 'calculadora T11/T13 (ejemplo IA-2026-001)' }
      @{ f = (Join-Path $t15 'madurez.html'); debe = @('#nivel-global[data-nivel="2"][data-tope="2"][data-tope-aplicado="1"]', 'tr[data-dim="D6"][data-nivel="1"]', 'tr[data-dim="D3"][data-nivel="2"]', '#t01-local[data-registro]', "#sitio-nav $ctl", '#principal a.cod-enlace[title]'); que = 'diagnóstico T15 (ejemplo EM-2026-06)' }
      # D100: la tarjeta de madurez (bloque «madurez» del panel, escrito por T15 en el registro) se dibuja con sus siete dimensiones
      @{ f = (Get-ChildItem $salidaEj -Filter 't01_Dashboard_Casos_Uso_IA_v*.html' | Select-Object -First 1).FullName; debe = @('#indice tbody tr', '#kpis [data-kpi]', '#embudo .fun2-mid', '#embudo .fun-card.gan', '#embudo .fun-card li .pq', '#fbar #fopen, #filters .fgroup', '#transv table tbody tr', '#madurez table tbody tr', "#barra .toolbar $ctl", 'main a.cod-enlace[title]'); que = 'panel completo' }
      # comunidad (D80): la página se dibuja aunque no haya intermediario configurado ni red (el texto lo pone el JavaScript)
      @{ f = (Join-Path $repo 'SEVEN-G\herramientas\comunidad\index.html'); debe = @('h1[data-i18n]:not(:empty)', '#form-envio', '#lista[data-estado]', '#btn-identidad:not(:empty)', ".barra $ctl"); que = 'página de comunidad' }
      @{ f = (Get-ChildItem $salidaEj -Filter 't01_Dashboard_Movil_IA_v*.html' | Select-Object -First 1).FullName; debe = @('#embudo .row.fun', '#embudo .row.fun.gan', '#transv .row', '#madurez-sec:not([hidden]) #madurez *', "header $ctl", 'body a.cod-enlace[title]'); que = 'panel móvil' }
      @{ f = (Join-Path $salidaEj 't01_Registro_Recomendaciones.html'); debe = @('#tl article.rec', ".top $ctl", 'body a.cod-enlace[title]'); que = 'registro de recomendaciones' }
      @{ f = (Join-Path $t17 'index.html'); debe = @('p.que-es', "header $ctl", '#es a.cod-enlace[title]'); que = 'página de T17' }
      # D104: buscador de términos con selector de ámbito; en «Todas las páginas» la lista de resultados llega de busqueda.json (servido por http).
      # «antes»: script opcional que se ejecuta en la página antes de comprobar los selectores
      @{ f = (Join-Path $repo 'SEVEN-G\html\es\00_SEVEN-G_Que_es_y_para_que_sirve.html'); antes = "setTimeout(function(){var s=document.getElementById('buscar-ambito');s.value='todas';s.dispatchEvent(new Event('change'));var i=document.getElementById('buscar');i.value='embudo';i.dispatchEvent(new Event('input'));},200);"
         debe = @('#buscar-ambito option[value="todas"]', ".barra $ctl", '.buscar-lista:not([hidden]) a[role="option"][href*="?q=embudo"]'); que = 'documento 00 con búsqueda de «embudo» en todas las páginas' }
    )
    $tipos = @{ '.html' = 'text/html; charset=utf-8'; '.js' = 'application/javascript; charset=utf-8'; '.css' = 'text/css; charset=utf-8'; '.json' = 'application/json; charset=utf-8'; '.png' = 'image/png'; '.jpg' = 'image/jpeg'; '.svg' = 'image/svg+xml'; '.pdf' = 'application/pdf'; '.woff2' = 'font/woff2' }
    foreach ($p in $pruebas) {
      $puerto = Get-Random -Minimum 20000 -Maximum 40000
      $http = [System.Net.HttpListener]::new(); $http.Prefixes.Add("http://localhost:$puerto/"); $http.Start()
      $sel = ($p.debe | ForEach-Object { "'" + $_.Replace("'", "\'") + "'" }) -join ','
      $pagina = [IO.File]::ReadAllText($p.f)
      $pagina = $pagina -replace '(?i)<head>', '<head><script>window.__errs=[];window.addEventListener("error",function(e){__errs.push(e.message)});</script>'
      $informe = "<script>setTimeout(function(){var f=[$sel].filter(function(s){return !document.querySelector(s)});fetch('/resultado',{method:'POST',body:JSON.stringify({errores:window.__errs,faltan:f})});},2500);</script>"
      $antes = if ($p.antes) { "<script>$($p.antes)</script>" } else { '' }
      $pagina = $pagina -replace '(?i)</body>', (($antes + $informe).Replace('$', '$$') + '</body>')
      $rutaPag = '/' + [IO.Path]::GetRelativePath($repo, $p.f).Replace('\', '/')
      $perfil = Join-Path $tmp ('edge_' + [Guid]::NewGuid().ToString('N').Substring(0, 6))
      $proc = Start-Process -FilePath $edge -ArgumentList '--headless=new', '--disable-gpu', '--no-first-run', "--user-data-dir=$perfil", '--window-size=1400,1000', "--screenshot=$tmp\humo.png", '--virtual-time-budget=10000', "http://localhost:$puerto$rutaPag" -PassThru -WindowStyle Hidden
      $resultado = $null; $limite = (Get-Date).AddSeconds(40)
      while (-not $resultado -and (Get-Date) -lt $limite) {
        $tarea = $http.GetContextAsync()
        if (-not $tarea.Wait(1000)) { if ($proc.HasExited -and -not $tarea.Wait(1500)) { break }; if (-not $tarea.IsCompleted) { continue } }
        $ctx = $tarea.Result
        $ruta = [Uri]::UnescapeDataString($ctx.Request.Url.AbsolutePath)
        if ($ctx.Request.HttpMethod -eq 'POST') { $resultado = [IO.StreamReader]::new($ctx.Request.InputStream).ReadToEnd() | ConvertFrom-Json; $bytes = [byte[]]@() }
        elseif ($ruta -eq $rutaPag) { $bytes = [Text.Encoding]::UTF8.GetBytes($pagina); $ctx.Response.ContentType = 'text/html; charset=utf-8' }
        else {
          # cualquier otro fichero del repositorio, tal cual (codigos.js, imágenes, JSON): solo dentro del repositorio
          $fich = [IO.Path]::GetFullPath((Join-Path $repo $ruta.TrimStart('/').Replace('/', '\')))
          if ($fich.StartsWith($repo, [StringComparison]::OrdinalIgnoreCase) -and (Test-Path $fich -PathType Leaf)) { $bytes = [IO.File]::ReadAllBytes($fich); $ctx.Response.ContentType = $tipos[[IO.Path]::GetExtension($fich).ToLowerInvariant()] ?? 'application/octet-stream' }
          else { $ctx.Response.StatusCode = 404; $bytes = [byte[]]@() }
        }
        $ctx.Response.ContentLength64 = $bytes.Length; if ($bytes.Length) { $ctx.Response.OutputStream.Write($bytes, 0, $bytes.Length) }; $ctx.Response.Close()
      }
      $http.Stop(); if (-not $proc.HasExited) { try { $proc.Kill() } catch {} }
      if (-not $resultado) { Aviso "$($p.que): el navegador no ha respondido; prueba no concluyente" }
      elseif ($resultado.errores.Count) { Mal "$($p.que): error de JavaScript: $($resultado.errores -join ' · ')" }
      elseif ($resultado.faltan.Count) { Mal "$($p.que): no se dibuja (falta $($resultado.faltan -join ', '))" }
      else { Ok "$($p.que) se dibuja sin errores de JavaScript" }
    }
  }

  # ---- 8. registro de decisiones
  Write-Host '8. Registro de decisiones'
  $nums = [regex]::Matches([IO.File]::ReadAllText((Join-Path $repo '.claude\seveng_decisiones.md')), '(?m)^\| D(\d+) \|') | ForEach-Object { [int]$_.Groups[1].Value }
  $rep = $nums | Group-Object | Where-Object Count -gt 1
  if ($rep) { Mal "decisiones repetidas: D$($rep.Name -join ', D')" }
  elseif (Compare-Object $nums (1..$nums.Count)) { Mal 'la numeración de las decisiones no es correlativa' }
  else { Ok "$($nums.Count) decisiones, numeración correlativa" }

  # ---- 9. nada generado por accidente bajo control de versiones
  Write-Host '9. Ficheros que no deben versionarse'
  $sobran = @(& git -C $repo ls-files | Where-Object { $_ -match '__pycache__|\.pyc$' })
  foreach ($x in $sobran) { Mal "bytecode de Python versionado: $x (git rm --cached)" }
  if (-not $sobran) { Ok 'sin bytecode de Python en el repositorio' }

  # ---- 10. comunidad (D80): la página cumple lo que promete
  Write-Host '10. Comunidad: sin datos de contacto, sin terceros y sin tokens'
  $com = Join-Path $repo 'SEVEN-G\herramientas\comunidad'; $malCom = 0
  $pag = [IO.File]::ReadAllText((Join-Path $com 'index.html'))
  foreach ($c in @(
      @{ re = '(?i)type="(email|tel)"|name="(e-?mail|correo|telefono|phone)"|autocomplete="(email|tel|name)"'; que = 'pide correo u otro dato de contacto' }
      @{ re = '(?i)<(script|link|img|iframe|source)\b[^>]*\b(src|href)="(https?:)?//'; que = 'carga recursos de terceros' }
      @{ re = '(?i)document\.cookie|google-analytics|googletagmanager|gtag\('; que = 'usa cookies o analítica' })) {
    if ($pag -match $c.re) { Mal "comunidad: la página $($c.que)"; $malCom++ }
  }
  foreach ($frase in 'número relevante de votos', 'relevant number of community votes', 'seveng-comunidad-usuario') { if (-not $pag.Contains($frase)) { Mal "comunidad: falta en la página «$frase»"; $malCom++ } }
  $conToken = Get-ChildItem $com -Recurse -File | Select-String -Pattern 'gh[pousr]_[A-Za-z0-9]{20,}|github_pat_[A-Za-z0-9_]{20,}' -List
  foreach ($x in $conToken) { Mal "comunidad: hay un token de GitHub en $([IO.Path]::GetRelativePath($repo, $x.Path)): revocarlo y quitarlo"; $malCom++ }
  foreach ($p in 'index.html', 'en\index.html') { if (-not [IO.File]::ReadAllText((Join-Path $repo $p)).Contains('SEVEN-G/herramientas/comunidad/index.html')) { Mal "$p`: no enlaza la página de comunidad"; $malCom++ } }
  if (-not $malCom) { Ok 'página de comunidad sin datos de contacto, recursos de terceros, cookies ni tokens, con la regla de los votos y enlazada desde la portada' }

  # ---- 11. control «Ir a código» (D88): índice generado, presente en todas las páginas y con todos sus destinos existentes
  Write-Host '11. Control «Ir a código»'
  $malCod = 0
  foreach ($lang in 'es', 'en') {
    $dirCod = Join-Path $repo "SEVEN-G\html\$lang"
    $jsCod = Join-Path $dirCod 'codigos.js'
    if (-not (Test-Path $jsCod)) { Mal "falta SEVEN-G/html/$lang/codigos.js (pwsh -File SEVEN-G/build/codigos.ps1)"; $malCod++; continue }
    $mDatos = [regex]::Match([IO.File]::ReadAllText($jsCod), '(?s)var DATOS = (.*?), TX = \{')
    if (-not $mDatos.Success) { Mal "codigos.js [$lang]: no se pueden leer los datos"; $malCod++; continue }
    $datosCod = $mDatos.Groups[1].Value | ConvertFrom-Json -AsHashtable
    foreach ($k in '40', 'P12', 'T06', 'M04', 'G3', 'R6', 'LV-G3', 'FASE 3', 'ESFERA 04', 'C2', 'D6', 'A2', 'S1', 'N2', 'IT-S7', 'SEG-02') { if (-not $datosCod.exactos.ContainsKey($k)) { Mal "codigos.js [$lang]: falta el código «$k»"; $malCod++ } }
    foreach ($ej in 'G3.05', 'RT-GEN-01', 'IND-VAL-05', 'REC-2026-007', 'IA-2026-014') { if (-not ($datosCod.patrones | Where-Object { $ej -match $_.re })) { Mal "codigos.js [$lang]: ningún patrón reconoce «$ej»"; $malCod++ } }
    $cacheCod = @{}
    $destinos = @($datosCod.exactos.Values | ForEach-Object { $_ } | ForEach-Object { $_.h }) + @($datosCod.patrones | ForEach-Object { $_.h }) | Select-Object -Unique
    foreach ($h in $destinos) {
      $partes = $h -split '#', 2
      $fich = [IO.Path]::GetFullPath((Join-Path $dirCod $partes[0]))
      if (-not (Test-Path $fich)) { Mal "codigos.js [$lang]: destino inexistente $h"; $malCod++; continue }
      if ($partes.Count -gt 1 -and $partes[1] -and -not $partes[1].StartsWith('/')) {
        if (-not $cacheCod.ContainsKey($fich)) { $cacheCod[$fich] = [IO.File]::ReadAllText($fich) }
        if (-not $cacheCod[$fich].Contains("id=""$($partes[1])""")) { Mal "codigos.js [$lang]: ancla inexistente $h"; $malCod++ }
      }
    }
  }
  $sinControl = foreach ($c in 'SEVEN-G\html', 'SPHERES\html', 'SPAD\html') {
    Get-ChildItem (Join-Path $repo $c) -Recurse -File -Filter *.html | Where-Object { $_.FullName -notmatch '[\\/]_' } | Where-Object { $t = [IO.File]::ReadAllText($_.FullName); -not ($t.Contains('data-ir-codigo') -and $t -match 'src="[^"]*codigos\.js"') }
  }
  foreach ($x in $sinControl) { Mal "sin el control «Ir a código»: $([IO.Path]::GetRelativePath($repo, $x.FullName))"; $malCod++ }
  foreach ($p in 'index.html', 'en\index.html') { $t = [IO.File]::ReadAllText((Join-Path $repo $p)); if (-not ($t.Contains('data-ir-codigo') -and $t.Contains('codigos.js'))) { Mal "$p`: la portada no tiene el control «Ir a código»"; $malCod++ } }
  foreach ($h in (Get-ChildItem (Join-Path $repo 'SEVEN-G\herramientas') -Recurse -File -Filter *.plantilla.html)) { if (-not [IO.File]::ReadAllText($h.FullName).Contains('irCodigoCargar')) { Mal "herramienta sin el control «Ir a código»: $($h.Name)"; $malCod++ } }
  if (-not $malCod) { Ok 'índice de códigos generado (ES/EN), con todos sus destinos y anclas, y control presente en todas las páginas, la portada y las herramientas' }

  # ---- 12. medición de visitas (D90): configuración válida, llevada a codigos.js, declarada en el documento 04 y fuera de la comunidad
  Write-Host '12. Medición de visitas (Umami)'
  $malUm = 0
  $cfgUm = (Get-Content (Join-Path $repo 'SEVEN-G\build\analitica.json') -Raw -Encoding utf8 | ConvertFrom-Json).umami
  if ($cfgUm.websiteId -and $cfgUm.websiteId -notmatch '^[0-9a-f]{8}(-[0-9a-f]{4}){3}-[0-9a-f]{12}$') { Mal 'analitica.json: websiteId no es un identificador de Umami'; $malUm++ }
  if ($cfgUm.src -notmatch '^https://') { Mal 'analitica.json: src debe ser https'; $malUm++ }
  if (@($cfgUm.dominios) -match 'localhost|127\.0\.0\.1') { Mal 'analitica.json: no se mide en local'; $malUm++ }
  foreach ($lang in 'es', 'en') {
    $tCod = [IO.File]::ReadAllText((Join-Path $repo "SEVEN-G\html\$lang\codigos.js"))
    if (-not $tCod.Contains(($cfgUm | ConvertTo-Json -Compress))) { Mal "codigos.js [$lang] no lleva la configuración de analitica.json (pwsh -File SEVEN-G/build/codigos.ps1)"; $malUm++ }
    if (-not $tCod.Contains('data-do-not-track')) { Mal "codigos.js [$lang]: la medición no respeta «No rastrear»"; $malUm++ }
    $d04 = Get-ChildItem (Join-Path $repo "SEVEN-G\mds\$lang") -Filter '04_*.md' | Select-Object -First 1
    if (-not [IO.File]::ReadAllText($d04.FullName).Contains('umami.is')) { Mal "documento 04 [$lang]: no declara la medición de visitas"; $malUm++ }
  }
  if ($pag -match '(?i)umami') { Mal 'comunidad: la página no debe medirse'; $malUm++ }
  if ($pag -match 'codigos\.js' -and $pag -notmatch 'data-sin-medicion') { Mal 'comunidad: carga codigos.js sin data-sin-medicion (se mediría, D80/D90)'; $malUm++ }
  if (-not $malUm) { Ok "medición de visitas configurada$(if (-not $cfgUm.websiteId) { ' (sin websiteId: desactivada)' }), declarada en el documento 04 y fuera de la página de comunidad" }
  # ---- 13. entrada ligera «Qué es SEVEN-G» (D91): en ES y EN, copia exacta de su fuente, enlazada desde la portada como primer
  # botón, y con paso al documento 00 (el detalle), al registro y a los dos paneles (completo y móvil); imágenes SEVEN-G_<lámina>.png
  Write-Host '13. Entrada ligera de SEVEN-G'
  $malEnt = 0
  foreach ($lang in 'es', 'en') {
    $fuente = Join-Path $repo "SEVEN-G\build\entrada\$lang\index.html"; $pub = Join-Path $repo "SEVEN-G\html\$lang\entrada\index.html"
    if (-not (Test-Path $fuente) -or -not (Test-Path $pub)) { Mal "entrada [$lang]: falta la fuente o la página publicada"; $malEnt++; continue }
    $tEnt = [IO.File]::ReadAllText($pub)
    if (($tEnt -replace "`r`n", "`n") -cne ([IO.File]::ReadAllText($fuente) -replace "`r`n", "`n")) { Mal "entrada [$lang]: html/$lang/entrada/index.html no coincide con build/entrada/$lang (generar con build.ps1)"; $malEnt++ }
    foreach ($req in '00_SEVEN-G_Que_es_y_para_que_sirve.html', 'T01_registro_iniciativas/registro.html', 'Dashboard_Casos_Uso_IA', 'Dashboard_Movil_IA', 'class="niv"', '<details class="aviso">', 'Presentaci%C3%B3n_Corregida.pptx', 'Presentaci%C3%B3n_Corregida.pdf') {
      if (-not $tEnt.Contains($req)) { Mal "entrada [$lang]: falta «$req»"; $malEnt++ }
    }
    foreach ($img in [regex]::Matches($tEnt, 'src="\.\./\.\./entrada/([^"]+\.png)"')) {
      $n = $img.Groups[1].Value
      if ($n -notmatch '^SEVEN-G_(\d{2}|embudo|embudo_en|panel)\.png$') { Mal "entrada [$lang]: imagen con nombre fuera de convención: $n"; $malEnt++ }
      if (-not (Test-Path (Join-Path $repo "SEVEN-G\html\entrada\$n"))) { Mal "entrada [$lang]: falta la imagen $n"; $malEnt++ }
    }
    $port = [IO.File]::ReadAllText((Join-Path $repo $(if ($lang -eq 'es') { 'index.html' } else { 'en\index.html' })))
    if ($port -notmatch "<a class=""boton primario"" href=""[^""]*SEVEN-G/html/$lang/entrada/index\.html""") { Mal "portada [$lang]: el botón «Qué es SEVEN-G» no lleva a la entrada ligera"; $malEnt++ }
  }
  if (-not $malEnt) { Ok 'entrada ligera en ES y EN, igual a su fuente, enlazada desde la portada y con paso al documento 00, al registro y a los paneles' }

  # ---- 14. avisos plegados por defecto (D93): en los documentos (plegados en pantalla, completos en el PDF), la portada y los paneles
  Write-Host '14. Avisos plegados por defecto'
  $malAv = 0
  $abiertos = Get-ChildItem (Join-Path $repo 'SEVEN-G\html'), (Join-Path $repo 'SPHERES\html'), (Join-Path $repo 'SPAD\html') -Recurse -File -Filter *.html | Select-String -Pattern '<blockquote class="aviso-legal">' -List
  foreach ($x in ($abiertos | Select-Object -First 10)) { Mal "aviso sin plegar: $([IO.Path]::GetRelativePath($repo, $x.Path))"; $malAv++ }
  foreach ($f in 'SEVEN-G\build\estilo.css', 'SEVEN-G\build\plantilla.html') { if (-not [IO.File]::ReadAllText((Join-Path $repo $f)).Contains('plegado')) { Mal "$f`: falta el plegado de los avisos"; $malAv++ } }
  foreach ($p in 'index.html', 'en\index.html') { if ([IO.File]::ReadAllText((Join-Path $repo $p)) -match '<p class="aviso') { Mal "$p`: aviso de la portada sin plegar (debe ser <details>)"; $malAv++ } }
  $salidaT17 = Join-Path $repo 'SEVEN-G\herramientas\T17_panel_consejo\ejemplo\salida'
  if (-not (Select-String -Path (Join-Path $salidaT17 't01_Dashboard_Casos_Uso_IA_v8.html') -Pattern '<details class="banner">' -Quiet)) { Mal 'panel completo: el aviso no está plegado'; $malAv++ }
  if (-not (Select-String -Path (Join-Path $salidaT17 't01_Dashboard_Movil_IA_v8.html') -Pattern '<details class="foot" id="aviso-legal">' -Quiet)) { Mal 'panel móvil: el aviso no está plegado'; $malAv++ }
  if (-not (Select-String -Path (Join-Path $salidaT17 't01_Dashboard_Casos_Uso_IA_v8.html') -Pattern 'class="ir-movil"' -Quiet)) { Mal 'panel completo: falta el paso a la versión para móvil'; $malAv++ }
  if (-not $malAv) { Ok 'avisos plegados en documentos, portada y paneles; el panel completo ofrece la versión para móvil' }

  # ---- 15. todo enlace cuyo texto es solo un código (documento NN, Tnn, Pnn, Mnn) lleva un tooltip que dice adónde va (D94)
  Write-Host '15. Tooltips en los enlaces de código'
  $sinTitulo = [Collections.Generic.List[string]]::new(); $nCod = 0
  foreach ($f in (Get-ChildItem (Join-Path $repo 'SEVEN-G\html'), (Join-Path $repo 'SPHERES\html'), (Join-Path $repo 'SPAD\html') -Recurse -File -Filter *.html)) {
    $cuerpo = [regex]::Replace([IO.File]::ReadAllText($f.FullName), '(?s)<script\b.*?</script>', '')
    foreach ($a in [regex]::Matches($cuerpo, '(?i)<a\s([^>]*)>\s*(?:documento?\s+)?(?:\d{2}|[TPM]\d{2})\s*</a>')) {
      $nCod++
      if ($a.Groups[1].Value -notmatch '\btitle="[^"]+"') { $sinTitulo.Add("$([IO.Path]::GetRelativePath($repo, $f.FullName)): $($a.Value)") }
    }
  }
  foreach ($x in ($sinTitulo | Select-Object -First 12)) { Mal "enlace de código sin tooltip: $x" }
  if ($sinTitulo.Count -gt 12) { Mal "… y $($sinTitulo.Count - 12) enlaces de código más sin tooltip" }
  if (-not $sinTitulo.Count) { Ok "$nCod enlaces de código, todos con tooltip" }
  if (-not (Select-String -Path (Join-Path $repo 'SEVEN-G\herramientas\T17_panel_consejo\index.html') -Pattern 'class="que-es"' -Quiet)) { Mal 'T17: su página no explica en una frase qué es (generador del panel)' }
  # ---- 16. móvil y visores sin JavaScript (D95, D96): nada ensancha la página en un teléfono, el panel completo cede el paso al
  # móvil y los dos paneles llevan una vista estática para cuando el visor no ejecuta JavaScript (fichero enviado por mensajería)
  Write-Host '16. Móvil y vista sin JavaScript'
  $malMov = 0
  if ([IO.File]::ReadAllText((Join-Path $repo 'SEVEN-G\build\estilo.css')) -notmatch '\.barra-in \{ position: relative;') { Mal 'estilo.css: .barra-in debe ser position: relative (si no, los rótulos ocultos ensanchan la página en el móvil)'; $malMov++ }
  foreach ($p in 'index.html', 'en\index.html') { if (-not [IO.File]::ReadAllText((Join-Path $repo $p)).Contains('@media (max-width: 600px) { .barra-dcha')) { Mal "$p`: falta el ajuste de la barra para móvil"; $malMov++ } }
  $docMuestra = Join-Path $repo 'SEVEN-G\html\es\00_SEVEN-G_Que_es_y_para_que_sirve.html'
  if ([IO.File]::ReadAllText($docMuestra) -notmatch '\.barra-in \{ position: relative;') { Mal 'los HTML generados no llevan el ajuste de la barra para móvil: regenerar con build.ps1'; $malMov++ }
  $sal = Join-Path $repo 'SEVEN-G\herramientas\T17_panel_consejo\ejemplo\salida'
  foreach ($f in 't01_Dashboard_Casos_Uso_IA_v8.html', 't01_Dashboard_Movil_IA_v8.html') {
    $t = [IO.File]::ReadAllText((Join-Path $sal $f))
    if ($t -notmatch '<noscript data-vista-estatica>' -or $t -notmatch 'body>\*:not\(noscript\)\{display:none') { Mal "$f`: falta la vista estática para visores sin JavaScript"; $malMov++ }
  }
  if (-not [IO.File]::ReadAllText((Join-Path $sal 't01_Dashboard_Casos_Uso_IA_v8.html')).Contains('nv.redirigir_movil')) { Mal 'panel completo: falta el paso automático al panel móvil'; $malMov++ }
  if (-not [IO.File]::ReadAllText((Join-Path $sal 't01_Dashboard_Movil_IA_v8.html')).Contains('?completo=1')) { Mal 'panel móvil: no enlaza el panel completo con ?completo'; $malMov++ }
  if (-not ((Get-Content (Join-Path $repo 'SEVEN-G\herramientas\T17_panel_consejo\config_panel.json') -Raw | ConvertFrom-Json).navegacion.redirigir_movil)) { Mal 'config_panel.json: navegacion.redirigir_movil debe ser true en el ejemplo'; $malMov++ }
  if (-not $malMov) { Ok 'barras ajustadas al móvil, panel completo con paso al móvil y vista estática sin JavaScript en los dos paneles' }

  # ---- 17. códigos citados en cualquier panel (D99): codigos.js enlaza y lista los citados; todas las herramientas y paneles lo cargan
  Write-Host '17. Códigos citados en los paneles'
  $malCit = 0
  foreach ($lang in 'es', 'en') {
    $tCod = [IO.File]::ReadAllText((Join-Path $repo "SEVEN-G\html\$lang\codigos.js"))
    foreach ($req in 'data-enlazar-codigos', 'ir-codigo-citados', 'data-sin-medicion', 'enlazar: enlazar', 'MutationObserver', 'a.cod-enlace') { if (-not $tCod.Contains($req)) { Mal "codigos.js [$lang]: falta «$req» (pwsh -File SEVEN-G/build/codigos.ps1)"; $malCit++ } }
  }
  # herramientas: su contenido (plantilla y HTML generado) se enlaza
  foreach ($h in (Get-ChildItem (Join-Path $repo 'SEVEN-G\herramientas') -Recurse -File -Filter *.plantilla.html) + @((Join-Path $t01 'registro.html'), (Join-Path $t11 'calculadora.html'), (Join-Path $t14 'indice.html'), (Join-Path $t15 'madurez.html') | ForEach-Object { Get-Item $_ })) {
    if (-not [IO.File]::ReadAllText($h.FullName).Contains('data-enlazar-codigos')) { Mal "herramienta sin enlace de códigos en su contenido (data-enlazar-codigos): $($h.Name)"; $malCit++ }
  }
  # motor de T17: los tres generadores admiten navegacion.codigos y cargan el índice sin medición
  foreach ($m in @(@{ f = 'motor\build_dashboard.py'; k = 'NAV.codigos' }, @{ f = 'motor\panel_movil.py'; k = 'nv.codigos' }, @{ f = 'motor\demo_lib.py'; k = 'D.codigos' })) {
    $tm = [IO.File]::ReadAllText((Join-Path $t17 $m.f))
    if (-not ($tm.Contains($m.k) -and $tm.Contains('data-sin-medicion') -and $tm.Contains('data-enlazar-codigos') -and $tm.Contains('data-ir-codigo'))) { Mal "T17 $($m.f): no admite navegacion.codigos (D99)"; $malCit++ }
  }
  if (-not [IO.File]::ReadAllText((Join-Path $t17 't01_a_panel.py')).Contains('p["codigos"]')) { Mal 'T17 t01_a_panel.py: no pasa navegacion.codigos al registro de recomendaciones'; $malCit++ }
  # ejemplo: la configuración apunta a un codigos.js que existe y los tres HTML generados lo cargan sin medición
  $navCfg = (Get-Content (Join-Path $t17 'config_panel.json') -Raw | ConvertFrom-Json).navegacion
  if (-not $navCfg.codigos) { Mal 'config_panel.json: falta navegacion.codigos en el ejemplo'; $malCit++ }
  elseif (-not (Test-Path ([IO.Path]::GetFullPath((Join-Path $t17 "ejemplo\salida\$($navCfg.codigos.Replace('/', '\'))"))))) { Mal "config_panel.json: navegacion.codigos apunta a un fichero inexistente ($($navCfg.codigos))"; $malCit++ }
  foreach ($f in (Get-ChildItem (Join-Path $t17 'ejemplo\salida') -Filter *.html)) { if (-not [IO.File]::ReadAllText($f.FullName).Contains('data-sin-medicion')) { Mal "panel de ejemplo sin carga del índice de códigos: $($f.Name)"; $malCit++ } }
  # comunidad y página de T17: control en su navegación y contenido enlazado
  $tCom = [IO.File]::ReadAllText((Join-Path $repo 'SEVEN-G\herramientas\comunidad\index.html'))
  if (-not ($tCom.Contains('data-ir-codigo') -and $tCom.Contains('data-enlazar-codigos') -and $tCom.Contains('codigos.js') -and $tCom.Contains('data-sin-medicion'))) { Mal 'comunidad: falta el control «Ir a código» o el enlace de códigos (con data-sin-medicion)'; $malCit++ }
  $tT17 = [IO.File]::ReadAllText((Join-Path $t17 'index.html'))
  if (-not ($tT17.Contains('data-ir-codigo') -and $tT17.Contains('data-enlazar-codigos') -and $tT17.Contains('codigos.js'))) { Mal 'T17 index.html: falta el control «Ir a código» o el enlace de códigos'; $malCit++ }
  # documentación: principio 8 del documento 03 y módulo M01 (ES/EN)
  foreach ($lang in 'es', 'en') {
    $d03 = Get-ChildItem (Join-Path $repo "SEVEN-G\mds\$lang") -Filter '03_*.md' | Select-Object -First 1
    if ([IO.File]::ReadAllText($d03.FullName) -notmatch '(?m)^\| 8 \|') { Mal "documento 03 [$lang]: falta el principio 8 (códigos navegables, D99)"; $malCit++ }
    $m01 = Get-ChildItem (Join-Path $repo "SEVEN-G\mds\$lang\curso") -Filter 'M01_*.md' | Select-Object -First 1
    if ([IO.File]::ReadAllText($m01.FullName) -notmatch 'Citados aquí|Cited here') { Mal "M01 [$lang]: no explica «Citados aquí» (D99)"; $malCit++ }
  }
  if (-not $malCit) { Ok 'códigos citados navegables: índice con enlaces y «Citados aquí», herramientas, motor y ejemplo de T17, comunidad y página de T17' }

  # ---- 18. mapa de datos entre herramientas (D100): T01 es la fuente de verdad; cada ruta del mapa existe en el esquema; las demostraciones
  # de T11, T14, T15 y T17 son de la misma compañía que el registro y derivan de él; las herramientas comparten la clave del registro
  Write-Host '18. Mapa de datos entre herramientas'
  $malMapa = 0
  $mapaRuta = Join-Path $repo 'SEVEN-G\herramientas\mapa_datos.json'
  if (-not (Test-Path $mapaRuta)) { Mal 'falta SEVEN-G/herramientas/mapa_datos.json (D100)'; $malMapa++ }
  else {
    $mapa = Get-Content $mapaRuta -Raw -Encoding utf8 | ConvertFrom-Json -AsHashtable
    $esq = Get-Content (Join-Path $t01 'esquema_registro.schema.json') -Raw -Encoding utf8 | ConvertFrom-Json -AsHashtable
    # sigue los $ref y, en un oneOf/anyOf (por ejemplo «objeto o nulo»), toma la rama que es un objeto con propiedades o una lista
    function Resolver-Esquema($nodo) {
      for ($i = 0; $i -lt 10 -and $nodo -is [hashtable]; $i++) {
        if ($nodo.ContainsKey('$ref')) { $n = $esq; foreach ($x in (($nodo['$ref'] -replace '^#/', '') -split '/')) { $n = $n[$x] }; $nodo = $n; continue }
        if ($nodo.ContainsKey('properties') -or $nodo.ContainsKey('items')) { break }   # un anyOf de solo «required» (evento) no sustituye a las propiedades
        $ramas = if ($nodo.ContainsKey('oneOf')) { $nodo['oneOf'] } elseif ($nodo.ContainsKey('anyOf')) { $nodo['anyOf'] } else { $null }
        if ($ramas) { $nodo = @($ramas | Where-Object { $r = Resolver-Esquema $_; $r -is [hashtable] -and ($r.ContainsKey('properties') -or $r.ContainsKey('items')) } | Select-Object -First 1)[0]; continue }
        break
      }
      return $nodo
    }
    function Existe-Ruta([string]$ruta) {
      $n = $esq
      foreach ($seg in ($ruta -split '\.')) {
        $lista = $seg.EndsWith('[]'); $nombre = $seg -replace '\[\]$', ''
        $n = Resolver-Esquema $n; if (-not ($n -is [hashtable]) -or -not $n.ContainsKey('properties') -or -not $n['properties'].ContainsKey($nombre)) { return $false }
        $n = Resolver-Esquema $n['properties'][$nombre]
        if ($lista) { if (-not ($n -is [hashtable]) -or -not $n.ContainsKey('items')) { return $false }; $n = Resolver-Esquema $n['items'] }
      }
      return $true
    }
    $rutasMal = @(); $nRutas = 0
    foreach ($h in $mapa.herramientas.Keys) { foreach ($k in 'lee_de_t01', 'escribe_en_t01') { foreach ($r in @($mapa.herramientas[$h][$k])) { if (-not $r) { continue }; $nRutas++; if (-not (Existe-Ruta $r)) { $rutasMal += "$h $k $r" } } } }
    if ($rutasMal) { Mal "mapa_datos.json: rutas que no existen en esquema_registro.schema.json: $($rutasMal -join ' · ')"; $malMapa++ } else { Ok "mapa_datos.json: $nRutas rutas leídas o escritas por las herramientas, todas en el esquema de T01 (versión $($esq.properties.version_esquema.enum[-1]))" }
    # clave del registro compartida: la que guarda T01 es la que leen T11, T14 y T15, y el mapa la declara
    $claveT01 = [regex]::Match([IO.File]::ReadAllText((Join-Path $t01 '_fuentes\registro.plantilla.html')), "const LS_DATOS = '([^']+)'").Groups[1].Value
    if ($claveT01 -ne $mapa.herramientas.T01.almacenamiento) { Mal "mapa_datos.json: la clave del registro ($($mapa.herramientas.T01.almacenamiento)) no es la que usa T01 ($claveT01)"; $malMapa++ }
    foreach ($h in @(@{ c = 'T11'; f = (Join-Path $t11 '_fuentes\calculadora.plantilla.html') }, @{ c = 'T14'; f = (Join-Path $t14 '_fuentes\indice.plantilla.html') }, @{ c = 'T15'; f = (Join-Path $t15 '_fuentes\madurez.plantilla.html') })) {
      $tp = [IO.File]::ReadAllText($h.f)
      if (-not $tp.Contains("LS_T01 = '$claveT01'")) { Mal "$($h.c): no lee el registro T01 del navegador (clave $claveT01)"; $malMapa++ }
      if (-not $tp.Contains("q.get('desde')==='t01'")) { Mal "$($h.c): no atiende el enlace del registro (?desde=t01)"; $malMapa++ }
      if ($h.c -ne 'T15' -and -not $tp.Contains('function actualizarDesdeT01(')) { Mal "$($h.c): no puede actualizar desde el registro sin pisar lo corregido a mano (D102)"; $malMapa++ }   # T15 no importa datos de T01 que haya que refrescar
      $claveH = [regex]::Match($tp, "const LS_DATOS = '([^']+)'").Groups[1].Value
      if ($claveH -ne $mapa.herramientas[$h.c].almacenamiento) { Mal "mapa_datos.json: almacenamiento de $($h.c) ($($mapa.herramientas[$h.c].almacenamiento)) distinto del real ($claveH)"; $malMapa++ }
    }
    $tT01 = [IO.File]::ReadAllText((Join-Path $t01 '_fuentes\registro.plantilla.html'))
    foreach ($e in "calculadora.html'", "indice.html'", "madurez.html'") { if (-not $tT01.Contains($e)) { Mal "T01: no enlaza la herramienta $e con el registro cargado"; $malMapa++ } }
    if (-not ($tT01.Contains("?desde=t01") -and $tT01.Contains('data-ir=') -and $tT01.Contains('function incorporarResultado'))) { Mal 'T01: faltan los enlaces ?desde=t01 (con guardado previo) o la incorporación de resultados de T11 y T15'; $malMapa++ }
    # esquema 0.6 admitido en el esquema JSON, en el registro y en el conector
    if ($esq.properties.version_esquema.enum -notcontains '0.6' -or -not $esq.properties.ContainsKey('madurez')) { Mal 'esquema_registro.schema.json: falta la versión 0.6 con la lista madurez[]'; $malMapa++ }
    if (-not $tT01.Contains("'0.6'")) { Mal 'T01: la validación no admite el esquema 0.6'; $malMapa++ }
    if (-not [IO.File]::ReadAllText((Join-Path $t17 't01_a_panel.py')).Contains('"0.6"')) { Mal 'T17 t01_a_panel.py: no admite el esquema 0.6'; $malMapa++ }
    # demostraciones: una sola compañía ficticia
    $orgT01 = (Get-Content (Join-Path $t01 'datos_demo.json') -Raw -Encoding utf8 | ConvertFrom-Json -Depth 64).meta.organizacion
    foreach ($h in @(@{ c = 'T11'; d = $t11 }, @{ c = 'T14'; d = $t14 }, @{ c = 'T15'; d = $t15 })) {
      $o = (Get-Content (Join-Path $h.d 'datos_demo.json') -Raw -Encoding utf8 | ConvertFrom-Json -Depth 32).meta.organizacion
      if ($o -cne $orgT01) { Mal "$($h.c): los datos de demostración son de otra compañía («$o», y T01 es «$orgT01»)"; $malMapa++ }
    }
    # T14: su demostración contiene el cálculo hecho desde el registro T01, idéntico al que usa el panel (ejemplo/t14_indice.json)
    $d14 = Get-Content (Join-Path $t14 'datos_demo.json') -Raw -Encoding utf8 | ConvertFrom-Json -Depth 32
    $c14 = @($d14.calculos | Where-Object { $_.origen -eq 't01' })
    $cIx = (Get-Content (Join-Path $t17 'ejemplo\t14_indice.json') -Raw -Encoding utf8 | ConvertFrom-Json -Depth 32).calculos[0]
    if (-not $c14.Count) { Mal 'T14: los datos de demostración no incluyen ningún cálculo desde el registro T01'; $malMapa++ }
    elseif (($c14[-1].entradas | ConvertTo-Json -Depth 16 -Compress) -ne ($cIx.entradas | ConvertTo-Json -Depth 16 -Compress) -or $c14[-1].fecha_corte -ne $cIx.fecha_corte) { Mal 'T14: el cálculo desde T01 de su demostración no coincide con el del panel (ejemplo/t14_indice.json): regenerar ambos desde datos_demo.json de T01'; $malMapa++ }
    # T15 -> T01 -> T17: el registro de demostración lleva el resumen de madurez que exporta T15 y el panel de ejemplo lo muestra
    $mT01 = (Get-Content (Join-Path $t01 'datos_demo.json') -Raw -Encoding utf8 | ConvertFrom-Json -Depth 64).madurez
    if (-not $mT01 -or -not $mT01.Count) { Mal 'T01: los datos de demostración no llevan la lista madurez[] (T15)'; $malMapa++ }
    else {
      $edgeMad = @("${env:ProgramFiles(x86)}\Microsoft\Edge\Application\msedge.exe", "$env:ProgramFiles\Microsoft\Edge\Application\msedge.exe") | Where-Object { Test-Path $_ } | Select-Object -First 1
      if ($SinNavegador -or -not $edgeMad) { Aviso 'sin navegador: no se comprueba que la madurez del registro de demostración sea la que exporta T15' }
      else {
        $resTmp = Join-Path $tmp 't15_resumen.json'
        & pwsh -NoProfile -File (Join-Path $t15 'build_madurez.ps1') -Salida (Join-Path $tmp 'madurez_res.html') -Resumen $resTmp | Out-Null
        if ($LASTEXITCODE -or -not (Test-Path $resTmp)) { Mal 'build_madurez.ps1 -Resumen ha fallado'; $malMapa++ }
        else {
          $mT15 = (Get-Content $resTmp -Raw -Encoding utf8 | ConvertFrom-Json -Depth 32).madurez_t01
          if (($mT01 | ConvertTo-Json -Depth 16 -Compress) -ne ($mT15 | ConvertTo-Json -Depth 16 -Compress)) { Mal 'T01: madurez[] de la demostración no coincide con lo que exporta T15 (build_madurez.ps1 -Resumen): actualizar datos_demo.json de T01 y regenerar el registro y el panel'; $malMapa++ }
          else { Ok "madurez del registro de demostración al día ($($mT01.Count) diagnósticos de T15; último $($mT01[-1].id), nivel global $($mT01[-1].nivel_global))" }
        }
      }
      $dPanel = Get-Content (Join-Path $t17 'ejemplo\salida\t01_dashboard_data.json') -Raw -Encoding utf8 | ConvertFrom-Json -Depth 64
      if (-not $dPanel.madurez -or $dPanel.madurez.id -ne $mT01[-1].id) { Mal 'T17: el panel de ejemplo no lleva el bloque madurez del último diagnóstico del registro'; $malMapa++ }
    }
    # documento 03 §4.1 (ES/EN): explica el mapa y nombra cada herramienta que lee del registro
    foreach ($lang in 'es', 'en') {
      $d03 = [IO.File]::ReadAllText((Get-ChildItem (Join-Path $repo "SEVEN-G\mds\$lang") -Filter '03_*.md' | Select-Object -First 1).FullName)
      $sec = [regex]::Match($d03, '(?s)### 4\.1 .*?(?=\n## )').Value
      if (-not $sec -or -not $sec.Contains('mapa_datos.json')) { Mal "documento 03 [$lang]: falta la sección 4.1 con el mapa de datos (D100)"; $malMapa++ }
      else { foreach ($h in ($mapa.herramientas.Keys | Where-Object { $mapa.herramientas[$_].lee_de_t01 })) { if ($sec -notmatch "\*\*$h\*\*") { Mal "documento 03 [$lang] §4.1: no describe qué lee $h"; $malMapa++ } } }
    }
    if (-not $malMapa) { Ok 'herramientas enlazadas con el registro T01 como fuente de verdad: clave compartida, enlaces ?desde=t01, esquema 0.6, demostraciones de una sola compañía y documento 03 §4.1' }
  }

  # ---- 19. datos en local e instalación propia (D103): el documento 95 existe en ES y EN, apunta al repositorio público y a su ZIP, y lo enlazan
  # la portada, la entrada, el README y el principio 6 del documento 03; los recuentos de documentos escritos a mano coinciden con la biblioteca
  Write-Host '19. Datos en local e instalación propia'
  $malInst = 0
  $repoUrl = 'https://github.com/seachad/AI_CONSULTING'
  foreach ($lang in 'es', 'en') {
    $d95 = Get-ChildItem (Join-Path $repo "SEVEN-G\mds\$lang") -Filter '95_*.md' | Select-Object -First 1
    if (-not $d95) { Mal "falta el documento 95 [$lang] (D103)"; $malInst++; continue }
    $t95 = [IO.File]::ReadAllText($d95.FullName)
    foreach ($req in $repoUrl, "$repoUrl/archive/refs/heads/main.zip", 'https://seachad.github.io/AI_CONSULTING/', 'seveng-t01-datos-v1', 'publicar.ps1', 'build_registro.ps1', 't01_a_panel.py', 'pages.yml', 'analitica.json') {
      if (-not $t95.Contains($req)) { Mal "documento 95 [$lang]: falta «$req»"; $malInst++ }
    }
    $d03 = [IO.File]::ReadAllText((Get-ChildItem (Join-Path $repo "SEVEN-G\mds\$lang") -Filter '03_*.md' | Select-Object -First 1).FullName)
    if ($d03 -notmatch '(?m)^\| 6 \|.*(documento|document) 95') { Mal "documento 03 [$lang]: el principio 6 no remite al documento 95"; $malInst++ }
    $ent = [IO.File]::ReadAllText((Join-Path $repo "SEVEN-G\build\entrada\$lang\index.html"))
    if (-not $ent.Contains('95_SEVEN-G_Datos_en_local_e_instalacion_propia.html')) { Mal "entrada [$lang]: no enlaza el documento 95"; $malInst++ }
  }
  $nDocs = @(Get-ChildItem (Join-Path $repo 'SEVEN-G\mds\es') -File -Filter '*.md' | Where-Object { $_.Name -match '^\d{2}_' }).Count
  foreach ($p in @(@{ f = 'index.html'; l = 'es' }, @{ f = 'en\index.html'; l = 'en' }, @{ f = 'SEVEN-G\build\entrada\es\index.html'; l = 'es' }, @{ f = 'SEVEN-G\build\entrada\en\index.html'; l = 'en' })) {
    $t = [IO.File]::ReadAllText((Join-Path $repo $p.f))
    if ($p.f -like '*index.html' -and $p.f -notlike '*entrada*') {
      if (-not ($t.Contains('95_SEVEN-G_Datos_en_local_e_instalacion_propia.html') -and $t.Contains($repoUrl))) { Mal "$($p.f): la portada no enlaza el documento 95 y el repositorio"; $malInst++ }
    }
    $m = [regex]::Match($t, '<b>(\d+)</b><span>' + $(if ($p.l -eq 'en') { 'documents' } else { 'documentos' }))
    if (-not $m.Success) { Mal "$($p.f): no se encuentra la cifra de documentos"; $malInst++ }
    elseif ([int]$m.Groups[1].Value -ne $nDocs) { Mal "$($p.f): dice $($m.Groups[1].Value) documentos y la biblioteca tiene $nDocs"; $malInst++ }
  }
  $readme = [IO.File]::ReadAllText((Join-Path $repo 'README.md'))
  if (-not ($readme.Contains('95_SEVEN-G_Datos_en_local_e_instalacion_propia.html') -and $readme.Contains("$repoUrl/archive/refs/heads/main.zip"))) { Mal 'README.md: no enlaza el documento 95 ni la descarga del repositorio'; $malInst++ }
  if ($readme -match '(?i)repositorio es privado') { Mal 'README.md: sigue diciendo que el repositorio es privado'; $malInst++ }
  if (-not $malInst) { Ok "documento 95 (ES/EN) con el repositorio y su ZIP, enlazado desde la portada, la entrada, el README y el documento 03; $nDocs documentos en las cifras de portada y entrada" }

  # ---- 20. buscador de términos en la página o en todas las páginas (D104): índice de texto generado (ES/EN) que cubre todas las páginas
  # publicadas con sus secciones y anclas; selector de ámbito en cada página generada; el control de códigos se rotula «Buscador de documentos»
  Write-Host '20. Buscador de términos en todas las páginas'
  $malBus = 0
  foreach ($lang in 'es', 'en') {
    $dirB = Join-Path $repo "SEVEN-G\html\$lang"; $fB = Join-Path $dirB 'busqueda.json'
    if (-not (Test-Path $fB)) { Mal "falta SEVEN-G/html/$lang/busqueda.json (pwsh -File SEVEN-G/build/busqueda.ps1)"; $malBus++; continue }
    $idxB = Get-Content $fB -Raw -Encoding utf8 | ConvertFrom-Json
    $enIndice = @{}; foreach ($pg in $idxB.paginas) { $enIndice[$pg.h] = $pg }
    foreach ($met in 'SEVEN-G', 'SPHERES', 'SPAD') {
      $dirMet = Join-Path $repo "$met\html\$lang"
      foreach ($f in (Get-ChildItem $dirMet -Recurse -File -Filter *.html | Where-Object { $_.FullName -notmatch '[\\/]_' })) {
        $t = [IO.File]::ReadAllText($f.FullName)
        if (-not $t.Contains('<main class="contenido"')) { continue }    # páginas sin la barra de los documentos (entrada ligera)
        $relB = [IO.Path]::GetRelativePath($dirB, $f.FullName).Replace('\', '/')
        if (-not ($t.Contains('id="buscar-ambito"') -and $t.Contains('value="todas"') -and $t.Contains('busqueda.json'))) { Mal "sin selector de ámbito del buscador: $([IO.Path]::GetRelativePath($repo, $f.FullName))"; $malBus++ }
        if (-not $enIndice.ContainsKey($relB)) { Mal "busqueda.json [$lang]: no indexa $met/html/$lang/$([IO.Path]::GetRelativePath($dirMet, $f.FullName).Replace('\', '/'))"; $malBus++; continue }
        foreach ($sec in $enIndice[$relB].s) { if ($sec.id -and -not $t.Contains("id=""$($sec.id)""")) { Mal "busqueda.json [$lang]: ancla inexistente $relB#$($sec.id)"; $malBus++ } }
        $enIndice.Remove($relB)
      }
    }
    foreach ($h in @($enIndice.Keys)) { Mal "busqueda.json [$lang]: indexa una página inexistente o no publicable: $h"; $malBus++ }
    $tCodB = [IO.File]::ReadAllText((Join-Path $dirB 'codigos.js'))
    if (-not $tCodB.Contains($(if ($lang -eq 'en') { 'Document finder' } else { 'Buscador de documentos' }))) { Mal "codigos.js [$lang]: el control de códigos no se rotula «Buscador de documentos» (D104; pwsh -File SEVEN-G/build/codigos.ps1)"; $malBus++ }
    $m01B = [IO.File]::ReadAllText((Get-ChildItem (Join-Path $repo "SEVEN-G\mds\$lang\curso") -Filter 'M01_*.md' | Select-Object -First 1).FullName)
    foreach ($req in $(if ($lang -eq 'en') { @('Document finder', 'Whole site') } else { @('Buscador de documentos', 'Todo el sitio') })) { if (-not $m01B.Contains($req)) { Mal "M01 [$lang]: no explica «$req» (D104)"; $malBus++ } }
  }
  if (-not $malBus) { Ok 'índice de búsqueda (ES/EN) con todas las páginas publicadas y sus anclas, selector de ámbito en cada página, control «Buscador de documentos» y M01 al día' }
}
finally { Remove-Item $tmp -Recurse -Force -Confirm:$false -ErrorAction SilentlyContinue }

Write-Host ''
if ($errores.Count) { Write-Host "COHERENCIA: $($errores.Count) errores. No hacer commit ni push." -ForegroundColor Red; exit 1 }
Write-Host "COHERENCIA: todo correcto$(if ($avisos.Count) { " ($($avisos.Count) avisos)" })."; exit 0
