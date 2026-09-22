<#
.SYNOPSIS
  Genera el índice de códigos del sitio y el control «Ir a código» (D88), rotulado «Buscador de documentos» desde D105: SEVEN-G/html/<idioma>/codigos.js

.DESCRIPTION
  Los códigos del marco (documentos 00–94, plantillas Pnn, herramientas Tnn, módulos del curso Mnn, puertas G0–G7 y R6,
  criterios G3.05, listas LV-G3, fases, esferas, C1–C5, D1–D7, A0–A3, S1–S4, N1–N3, RT-…, IND-…, REC-…, IT-…, PER-…) se citan
  en todo el sitio. Este fichero permite escribir cualquiera de ellos en la barra de navegación y saltar a donde se explica.

  El índice no se escribe a mano. Sale, en cada compilación, de los HTML ya generados:
    - la biblioteca (título de cada documento, plantilla y módulo del curso);
    - el catálogo de herramientas del documento 03 (fila de cada Tnn) y las aplicaciones de SEVEN-G/herramientas;
    - las tablas de códigos del glosario (documento 02, secciones 6.1 y 6.2): cada fila dice qué identifica el código y qué
      documento y sección lo define, y a esa sección se lleva;
    - los encabezados de los documentos 20 (fases), 21 (puertas y criterios), 22 (listas de verificación) y 10 (esferas).
  Los destinos son relativos a la carpeta de codigos.js; el control los resuelve contra la dirección del propio script, de
  modo que sirve igual desde un documento, una plantilla, SPHERES, SPAD, la portada o una herramienta.

  codigos.js contiene los datos y el control (HTML, estilos y comportamiento): una página solo necesita un elemento con el
  atributo data-ir-codigo y <script src=".../codigos.js" defer>. build.ps1 lo ejecuta al final.

  Códigos citados en cualquier panel (D99). El mismo fichero:
    - convierte en enlace, con su tooltip (D94), cada código escrito como texto dentro de los elementos con el atributo
      data-enlazar-codigos (y sigue haciéndolo cuando el panel vuelve a dibujarse: observa los cambios del DOM). No toca
      enlaces ya escritos, formularios, código, botones, rótulos de formulario ni los identificadores de registros
      (IA-AAAA-NNN, REC-…, DEC-…: son instancias, no conceptos); solo enlaza lo que el índice reconoce;
    - añade, junto al control «Ir a código», el botón «Citados aquí (n)»: la lista de documentos, plantillas, herramientas,
      puertas y demás códigos que la página o la vista actual nombra, agrupada por tipo, cada uno con su enlace.
    Con data-sin-medicion en la etiqueta <script> no se activa la medición de visitas (D90): así lo cargan los paneles del
    consejo y la comunidad, que prometen no medir.

.EXAMPLE
  pwsh -File SEVEN-G/build/codigos.ps1
#>
param([string[]]$Idiomas = @('es', 'en'))

$ErrorActionPreference = 'Stop'
$repo = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
$raiz = Join-Path $repo 'SEVEN-G'

function Texto([string]$html) { ([Net.WebUtility]::HtmlDecode(([regex]::Replace($html, '<[^>]+>', '')))).Trim() -replace '\s+', ' ' }
# medición de visitas (D90): SEVEN-G/build/analitica.json; sin fichero o sin websiteId, codigos.js no mide nada
$umami = 'null'
$ficheroAnalitica = Join-Path $PSScriptRoot 'analitica.json'
if (Test-Path $ficheroAnalitica) { $cfgA = Get-Content $ficheroAnalitica -Raw -Encoding utf8 | ConvertFrom-Json; if ($cfgA.umami) { $umami = $cfgA.umami | ConvertTo-Json -Compress } }

function Recortar([string]$s, [int]$n = 130) { if ($s.Length -le $n) { $s } else { $s.Substring(0, $n - 1).TrimEnd() + '…' } }

foreach ($lang in $Idiomas) {
  $en = $lang -eq 'en'
  $htmlDir = Join-Path $raiz "html\$lang"
  if (-not (Test-Path $htmlDir)) { Write-Warning "No existe $htmlDir"; continue }

  $exactos = [ordered]@{}        # CLAVE EN MAYÚSCULAS -> lista de {c, t, h, k}; k = tipo (doc, pla, her, app, mod, puerta, lv, fase, esfera, otro)
  $patrones = [Collections.Generic.List[object]]::new()
  function Anadir([string]$clave, [string]$codigo, [string]$titulo, [string]$href, [string]$tipo = 'otro') {
    if (-not $href) { return }
    $k = $clave.ToUpperInvariant()
    if (-not $exactos.Contains($k)) { $exactos[$k] = [Collections.Generic.List[object]]::new() }
    if ($exactos[$k] | Where-Object { $_.h -eq $href }) { return }
    $exactos[$k].Add([ordered]@{ c = $codigo; t = (Recortar $titulo); h = $href; k = $tipo })
  }

  # ---- páginas y encabezados ya generados ----
  $paginas = @{}     # '21' -> @{ href; html }
  foreach ($f in (Get-ChildItem $htmlDir -Recurse -File -Filter *.html | Where-Object { $_.FullName -notmatch '[\\/]_' -and $_.Name -ne 'index.html' })) {
    if ($f.Name -notmatch '^([PM]?\d{2})_') { continue }
    $cod = $Matches[1]
    $rel = [IO.Path]::GetRelativePath($htmlDir, $f.FullName).Replace('\', '/')
    $html = [IO.File]::ReadAllText($f.FullName)
    $h1 = [regex]::Match($html, '(?s)<h1[^>]*>(.*?)</h1>')
    $titulo = if ($h1.Success) { Texto $h1.Groups[1].Value } else { $f.BaseName }
    $paginas[$cod] = @{ href = $rel; html = $html; titulo = $titulo }
    if ($cod -match '^\d{2}$') {
      Anadir $cod "$(if ($en) { 'Document' } else { 'Documento' }) $cod" $titulo $rel 'doc'
    } elseif ($cod -like 'P*') {
      Anadir $cod $cod $titulo $rel 'pla'
    } else {
      Anadir $cod "$(if ($en) { 'Course' } else { 'Curso' }) · $cod" $titulo $rel 'mod'
    }
  }
  function Encabezados([string]$doc) {
    if (-not $paginas.ContainsKey($doc)) { return @() }
    $html = $paginas[$doc].html
    $r = [Collections.Generic.List[object]]::new()
    foreach ($m in [regex]::Matches($html, '(?s)<h2 id="([^"]+)">(?:<span class="antetitulo">(\d+)</span>)?(.*?)</h2>|<h3 id="([^"]+)">(.*?)</h3>')) {
      if ($m.Groups[1].Success) { $r.Add(@{ id = $m.Groups[1].Value; num = $(if ($m.Groups[2].Success) { [string][int]$m.Groups[2].Value } else { '' }); texto = (Texto $m.Groups[3].Value) }) }
      else { $t = Texto $m.Groups[5].Value; $n = [regex]::Match($t, '^(\d+\.\d+)'); $r.Add(@{ id = $m.Groups[4].Value; num = $(if ($n.Success) { $n.Groups[1].Value } else { '' }); texto = $t }) }
    }
    $r
  }
  function Seccion([string]$doc, [string]$sec) {      # '01', '5.1' -> '01_…html#…' (o la página, si no se encuentra la sección)
    if (-not $paginas.ContainsKey($doc)) { return $null }
    $e = Encabezados $doc | Where-Object { $_.num -eq $sec } | Select-Object -First 1
    if (-not $e -and $sec -match '^(\d+)\.') { $e = Encabezados $doc | Where-Object { $_.num -eq $Matches[1] } | Select-Object -First 1 }
    if ($e) { "$($paginas[$doc].href)#$($e.id)" } else { $paginas[$doc].href }
  }
  # si el documento que define el código tiene una fila propia para él (id="cod-seg-02"), se va a la fila y no solo a la sección
  function Fila-O-Seccion([string]$href, [string]$codigo) {
    if (-not $href) { return $href }
    $pag = ($href -split '#')[0]
    $doc = $paginas.Keys | Where-Object { $paginas[$_].href -eq $pag } | Select-Object -First 1
    if (-not $doc) { return $href }
    $idFila = 'cod-' + (([regex]::Replace($codigo.ToLowerInvariant(), '[^a-z0-9]+', '-')).Trim('-'))
    if ($paginas[$doc].html.Contains("<tr id=""$idFila"">")) { "$pag#$idFila" } else { $href }
  }
  function Por-Texto([string]$doc, [string]$patron) {
    if (-not $paginas.ContainsKey($doc)) { return $null }
    $e = Encabezados $doc | Where-Object { $_.texto -match $patron } | Select-Object -First 1
    if ($e) { @{ href = "$($paginas[$doc].href)#$($e.id)"; texto = $e.texto } } else { $null }
  }

  # ---- herramientas: la fila del catálogo del documento 03 (dónde se explica) y, si existe, la aplicación ----
  if ($paginas.ContainsKey('03')) {
    # solo la tabla del catálogo (cabecera «Código | Herramienta» / «Code | Tool»): otras tablas del 03 (§4.1, §5) también empiezan filas con
    # el código. La fila lleva id="cod-tnn" o, si otra tabla lo tomó antes, "cod-tnn-2" (build.ps1); sin id, se va a la sección que la contiene
    $h03 = $paginas['03'].html
    $tablasCat = [regex]::Matches($h03, '(?s)<table>\s*<thead>\s*<tr>\s*<th[^>]*>(?:Código|Code)</th>\s*<th[^>]*>(?:Herramienta|Tool)</th>.*?</table>')   # una tabla por bloque del catálogo
    if (-not $tablasCat.Count) { Write-Warning "[$lang] no se encuentra la tabla del catálogo de herramientas en el documento 03" }
    foreach ($cat in $tablasCat) {
      $sec = [regex]::Matches($h03.Substring(0, $cat.Index), '<h[23] id="([^"]+)"'); $seccionCat = if ($sec.Count) { $sec[$sec.Count - 1].Groups[1].Value } else { '' }
      foreach ($m in [regex]::Matches($cat.Value, '(?s)<tr(?: id="(cod-t\d{2}(?:-\d+)?)")?>\s*<td[^>]*>(.*?)</td>\s*<td[^>]*>(.*?)</td>\s*<td[^>]*>(.*?)</td>')) {
        $cod = (Texto $m.Groups[2].Value)
        if ($cod -notmatch '^T\d{2}$') { continue }
        $ancla = if ($m.Groups[1].Success) { $m.Groups[1].Value } else { $seccionCat }
        Anadir $cod $cod "$(Texto $m.Groups[3].Value) — $(Texto $m.Groups[4].Value)" "$($paginas['03'].href)$(if ($ancla) { "#$ancla" })" 'her'
      }
    }
  }
  $herr = Join-Path $raiz 'herramientas'
  foreach ($h in (Get-ChildItem $herr -Directory | Where-Object Name -match '^T\d{2}_')) {
    $app = Get-ChildItem $h.FullName -File -Filter *.html | Where-Object Name -notlike '_*' | Select-Object -First 1
    if (-not $app) { continue }
    $cod = $h.Name.Substring(0, 3)
    $rel = [IO.Path]::GetRelativePath($htmlDir, $app.FullName).Replace('\', '/')
    Anadir $cod "$cod ▸ $(if ($en) { 'open the tool' } else { 'abrir la herramienta' })" $(if ($en) { 'Application with fictitious sample data' } else { 'Aplicación, con datos de ejemplo ficticios' }) $rel 'app'
  }

  # ---- fases, puertas, criterios, listas de verificación y esferas: a su sección ----
  foreach ($n in 0..7) {
    $e = Por-Texto '20' "^(Fase|Phase) $n\b"
    if ($e) { foreach ($k in "FASE $n", "PHASE $n", "F$n") { Anadir $k "$(if ($en) { 'Phase' } else { 'Fase' }) $n" "$($e.texto) — $(if ($en) { 'phase manual' } else { 'manual de la fase' })" $e.href 'fase' } }
  }
  foreach ($g in 'G0', 'G1', 'G2', 'G3', 'G4', 'G5', 'R6', 'G7') {
    $e = Por-Texto '21' "^\d+\.\d+ $g\b"
    if ($e) {
      $rot = "$($e.texto -replace '^\d+\.\d+\s*', '') — $(if ($en) { 'gate criteria' } else { 'criterios de la puerta' })"
      Anadir $g $g $rot $e.href 'puerta'
      $patrones.Add([ordered]@{ re = "^$g\.\d{2}$"; c = "$g.nn"; t = "$(if ($en) { 'Gate criterion' } else { 'Criterio de puerta' }) · $rot"; h = $e.href; k = 'puerta' })
    }
    $lv = Por-Texto '22' "^LV-$g\b"
    if ($lv) { Anadir "LV-$g" "LV-$g" "$($lv.texto) — $(if ($en) { 'checklist' } else { 'lista de verificación' })" $lv.href 'lv' }
  }
  foreach ($x in 'LV-EV', 'LV-AG') { $lv = Por-Texto '22' "^$x\b"; if ($lv) { Anadir $x $x $lv.texto $lv.href 'lv' } }
  foreach ($n in 1..9) {
    $e = Por-Texto '10' "(Esfera|Sphere) 0$n\b"
    if ($e) { foreach ($k in "ESFERA 0$n", "SPHERE 0$n", "E0$n") { Anadir $k "$(if ($en) { 'Sphere' } else { 'Esfera' }) 0$n" ($e.texto -replace '^\d+(\.\d+)?\s*', '') $e.href 'esfera' } }
  }
  foreach ($n in 1..10) {
    Anadir "REGLA $n" "$(if ($en) { 'Rule' } else { 'Regla' }) $n" $(if ($en) { 'Value measurement rules' } else { 'Reglas de medición del valor' }) (Seccion '40' '3')
    Anadir "RULE $n" "$(if ($en) { 'Rule' } else { 'Regla' }) $n" $(if ($en) { 'Value measurement rules' } else { 'Reglas de medición del valor' }) (Seccion '40' '3')
    Anadir "PRINCIPIO $n" "$(if ($en) { 'Principle' } else { 'Principio' }) $n" $(if ($en) { 'Principles of the framework' } else { 'Principios del marco' }) (Seccion '01' '3')
    Anadir "PRINCIPLE $n" "$(if ($en) { 'Principle' } else { 'Principio' }) $n" $(if ($en) { 'Principles of the framework' } else { 'Principios del marco' }) (Seccion '01' '3')
  }

  # ---- tablas de códigos del glosario (02 §6.1 y §6.2) ----
  if ($paginas.ContainsKey('02')) {
    $g = $paginas['02'].html
    foreach ($tabla in @(@{ sec = '6.1'; iDesc = 2; iDoc = 3 }, @{ sec = '6.2'; iDesc = 1; iDoc = 2 })) {
      $ini = [regex]::Match($g, "<h3 id=""[^""]+"">$([regex]::Escape($tabla.sec)) ")
      if (-not $ini.Success) { Write-Warning "[$lang] no se encuentra la sección $($tabla.sec) del glosario"; continue }
      $resto = $g.Substring($ini.Index)
      $tb = [regex]::Match($resto, '(?s)<table>.*?</table>')
      if (-not $tb.Success) { continue }
      foreach ($fila in [regex]::Matches($tb.Value, '(?s)<tr(?: id="([^"]+)")?>(.*?)</tr>')) {
        $celdas = @([regex]::Matches($fila.Groups[2].Value, '(?s)<td[^>]*>(.*?)</td>') | ForEach-Object { Texto $_.Groups[1].Value })
        if ($celdas.Count -le $tabla.iDoc) { continue }
        $celdaCod = $celdas[0]; $desc = $celdas[$tabla.iDesc]; $docRef = $celdas[$tabla.iDoc]
        if ($celdaCod -match ',') { continue }     # fila de abreviaturas de responsables
        # destino: la sección del documento que lo define; si no se localiza, la fila del glosario
        $href = $null
        $mr = [regex]::Match($docRef, '\b(\d{2}) §(\d+(?:\.\d+)?)')
        if ($mr.Success) { $href = Seccion $mr.Groups[1].Value $mr.Groups[2].Value }
        if (-not $href) { $md = [regex]::Match($docRef, '\b(\d{2})\b'); if ($md.Success -and $paginas.ContainsKey($md.Groups[1].Value)) { $href = $paginas[$md.Groups[1].Value].href } }
        $hrefGlos = if ($fila.Groups[1].Success) { "$($paginas['02'].href)#$($fila.Groups[1].Value)" } else { "$($paginas['02'].href)#$($ini.Value -replace '^<h3 id="([^"]+)".*$', '$1')" }
        if (-not $href) { $href = $hrefGlos }
        $titulo = "$desc ($docRef)"
        foreach ($parte in ($celdaCod -split '\s+·\s+')) {
          $p = $parte.Trim()
          if ($p -match '\(') { $p = ($p -replace '\s*\(.*$', '').Trim() }
          $rn = [regex]::Match($p, '^([A-Z][A-Z\-\.]*?)(\d+)[–-]\1(\d+)$')                 # G0–G5, EV.01–EV.14, IT-P1–IT-P5
          $rl = [regex]::Match($p, '^([A-Z][A-Z\-]*?)([A-Z])[–-]\1([A-Z])$')               # PER-PA–PER-PF
          if ($rn.Success) {
            $ancho = $rn.Groups[2].Value.Length
            foreach ($i in ([int]$rn.Groups[2].Value)..([int]$rn.Groups[3].Value)) {
              $c = $rn.Groups[1].Value + ([string]$i).PadLeft($ancho, '0')
              if ($c -match '^[PT]\d{2}$' -or $c -match '^G[0-7]$') { continue }           # ya tienen su entrada propia, más precisa
              Anadir $c $c $titulo (Fila-O-Seccion $href $c)
            }
          } elseif ($rl.Success) {
            foreach ($ch in ([int][char]$rl.Groups[2].Value)..([int][char]$rl.Groups[3].Value)) { $c = $rl.Groups[1].Value + [char]$ch; Anadir $c $c $titulo $href }
          } elseif ($p -match '<|NN|AAAA|nn$|-n$') {
            if ($p.Length -lt 5) { continue }                                              # «Rnn», «Hnn», «I-n»: demasiado genéricos
            $re = [regex]::Escape($p)
            $re = $re -replace '<n>', '\d' -replace '<nn>', '\d{2}' -replace '<(CAT|FAM)>', '[A-Z]{3}' -replace '<(esfera|sphere)>', '\d{2}'
            $re = $re -replace 'AAAA', '\d{4}' -replace 'NNN', '\d{3}' -replace 'NN', '\d{2}' -replace 'nn$', '\d{2}' -replace '-n$', '-\d+'
            if ($re -match '^G\\d' -or $re -match '^R6') { continue }                      # criterios de puerta: ya añadidos por puerta
            # inst: identificador de registros (IA-AAAA-NNN, REC-AAAA-NNN…): «Ir a código» lo reconoce, pero en un panel no se enlaza cada instancia (D99)
            $patrones.Add([ordered]@{ re = "^$re$"; c = $p; t = (Recortar $titulo); h = $href; k = 'otro'; inst = [bool]($p -match 'AAAA|NNN') })
            # quien escribe solo el prefijo («RT-», «IND», «REC») también llega
            $pref = [regex]::Match($p, '^([A-Z]{2,4})[-<]'); if ($pref.Success) { Anadir $pref.Groups[1].Value $p $titulo $href; Anadir "$($pref.Groups[1].Value)-" $p $titulo $href }
          } elseif ($p -match '^[A-Z][A-Za-z0-9\-\.]{1,12}$' -and $p -match '\d|-') {
            if ($p -match '^G[0-7]$' -or $p -eq 'R6' -or $p -match '^LV-') { continue }
            Anadir $p $p $titulo $href
          }
        }
      }
    }
  }

  # ---- salida: datos + control ----
  $datos = [ordered]@{ lang = $lang; exactos = $exactos; patrones = $patrones } | ConvertTo-Json -Depth 6 -Compress
  $txt = if ($en) {
    @{ ph = 'Document finder'; aria = 'Document finder: go to where a code or a title is explained (document, template, tool, gate, criterion…)'; nada = 'No such code. Try the glossary:'; glos = 'Glossary and conventions (02), code system'; ayuda = 'Document finder. Type a code (40, P12, T06, G3, G3.05, LV-G3, phase 3, C2, D6, A2, RT-GEN-01, IND-VAL-05…) or part of a title. Enter opens the first result.'
       citados = 'Cited here'; citadosTt = 'Documents, templates, tools and other codes this page names, each with its link'; citadosNada = 'This page names no code of the framework.'
       tipos = @{ doc = 'Documents'; pla = 'Templates'; her = 'Tools'; app = 'Tools'; mod = 'Course'; puerta = 'Gates and criteria'; lv = 'Checklists'; fase = 'Phases'; esfera = 'Spheres'; otro = 'Other codes' }
       tt = @{ doc = 'Document'; pla = 'Template'; her = 'Tool'; app = 'Tool'; mod = 'Course module'; puerta = 'Gate'; lv = 'Checklist'; fase = 'Phase'; esfera = 'Sphere'; otro = 'Code' } }
  } else {
    @{ ph = 'Buscador de documentos'; aria = 'Buscador de documentos: ir a donde se explica un código o un título (documento, plantilla, herramienta, puerta, criterio…)'; nada = 'No existe ese código. Pruebe en el glosario:'; glos = 'Glosario y convenciones (02), sistema de códigos'; ayuda = 'Buscador de documentos. Escriba un código (40, P12, T06, G3, G3.05, LV-G3, fase 3, C2, D6, A2, RT-GEN-01, IND-VAL-05…) o parte de un título. Intro abre el primer resultado.'
       citados = 'Citados aquí'; citadosTt = 'Documentos, plantillas, herramientas y demás códigos que nombra esta página, cada uno con su enlace'; citadosNada = 'Esta página no nombra ningún código del marco.'
       tipos = @{ doc = 'Documentos'; pla = 'Plantillas'; her = 'Herramientas'; app = 'Herramientas'; mod = 'Curso'; puerta = 'Puertas y criterios'; lv = 'Listas de verificación'; fase = 'Fases'; esfera = 'Esferas'; otro = 'Otros códigos' }
       tt = @{ doc = 'Documento'; pla = 'Plantilla'; her = 'Herramienta'; app = 'Herramienta'; mod = 'Módulo del curso'; puerta = 'Puerta'; lv = 'Lista de verificación'; fase = 'Fase'; esfera = 'Esfera'; otro = 'Código' } }
  }
  $glosHref = if ($paginas.ContainsKey('02')) { Seccion '02' '6' } else { '' }
  $textos = ($txt + @{ glosHref = $glosHref }) | ConvertTo-Json -Compress -Depth 4

  $js = @'
/* SEVEN-G · índice de códigos, control «Ir a código» (D88) y códigos citados en los paneles (D99). Generado por SEVEN-G/build/codigos.ps1: no editar a mano. */
(function () {
  var DATOS = __DATOS__, TX = __TEXTOS__;
  var SCRIPT = document.currentScript;
  var BASE = (SCRIPT && SCRIPT.src) || location.href;
  var PATRONES = DATOS.patrones.map(function (p) { return { re: new RegExp(p.re, 'i'), c: p.c, t: p.t, h: p.h, k: p.k || 'otro', inst: !!p.inst }; });
  var TODOS = []; Object.keys(DATOS.exactos).forEach(function (k) { DATOS.exactos[k].forEach(function (e) { if (TODOS.indexOf(e) < 0) TODOS.push(e); }); });
  // otro codigos.js (el del otro idioma) cargado antes en la misma página: se retira para que no enlace ni observe por su cuenta
  if (window.sevengIrCodigo && window.sevengIrCodigo.desconectar) { try { window.sevengIrCodigo.desconectar(); } catch (e) {} }

  function normalizar(s) {
    s = String(s || '').trim().toUpperCase().replace(/\s+/g, ' ').replace(/[§#]/g, '');
    s = s.replace(/^(DOCUMENTOS?|DOCUMENTS?|DOC\.?)\s*(\d{1,2})$/, function (_, a, n) { return ('0' + n).slice(-2); });
    s = s.replace(/^(PLANTILLA|TEMPLATE|HERRAMIENTA|TOOL|PUERTA|GATE|MÓDULO|MODULO|MODULE)\s+/, '');
    s = s.replace(/^([PT])\s*(\d)$/, '$10$2').replace(/^([PTM])\s+(\d{2})$/, '$1$2');
    s = s.replace(/^(ESFERA|SPHERE)\s*0?(\d)$/, '$1 0$2').replace(/^(FASE|PHASE)\s*(\d)$/, '$1 $2');
    s = s.replace(/^(\d)$/, '0$1');
    return s;
  }
  function buscar(q) {
    var k = normalizar(q), r = [], vistos = {};
    function mete(e) { var id = e.c + '|' + e.h; if (!vistos[id]) { vistos[id] = 1; r.push(e); } }
    if (!k) return r;
    (DATOS.exactos[k] || []).forEach(mete);
    PATRONES.forEach(function (p) { if (p.re.test(k)) mete(p); });
    if (k.length >= 2) Object.keys(DATOS.exactos).forEach(function (c) { if (c !== k && c.indexOf(k) === 0 && r.length < 8) DATOS.exactos[c].forEach(mete); });
    if (r.length < 8 && k.length >= 3) { var t = String(q).trim().toLowerCase(); TODOS.forEach(function (e) { if (r.length < 8 && e.t.toLowerCase().indexOf(t) >= 0) mete(e); }); }
    return r.slice(0, 8);
  }
  function destino(h) { try { return new URL(h, BASE).href; } catch (e) { return h; } }
  // un código escrito tal cual («documento 40», «P12», «G3.05», «RT-GEN-01») -> la entrada del índice donde se explica, o null.
  // Solo lo exacto y los patrones que no son identificadores de registros (una iniciativa IA-2026-014 no es un concepto del marco).
  function resolver(texto) {
    var k = normalizar(texto), ex = DATOS.exactos[k];
    if (ex && ex.length) return ex[0];
    for (var i = 0; i < PATRONES.length; i++) if (!PATRONES[i].inst && PATRONES[i].re.test(k)) return PATRONES[i];
    return null;
  }
  // tooltip con el mismo formato que los enlaces de código de los documentos (D94): «Plantilla P12 · Matriz y registro de riesgos»
  function tooltip(e, tok) {
    var pre = TX.tt[e.k] || TX.tt.otro, t = e.t;
    var cod = String(tok || e.c).replace(/^(documentos?|documents?|doc\.|fase|phase|esfera|sphere|plantilla|template|herramienta|tool|curso ·|course ·)\s+/i, '').replace(/\s*▸.*$/, '');
    if (e.re && e.k === 'puerta') return t.replace(/^([^·]+?)\s*·\s*/, '$1 ' + cod + ' · ');        // «Criterio de puerta G3.05 · G3 · Viabilidad — …»
    var etiqueta = pre + ' ' + cod;                                                                 // «Fase 4», «Documento 40», «Plantilla P12», «Puerta G3»
    if (t.toUpperCase().indexOf(etiqueta.toUpperCase()) === 0) return t;                            // el título ya empieza por «Fase 4 · …»
    if (t.toUpperCase().indexOf(cod.toUpperCase()) === 0) return pre + ' ' + t;                     // «G3 · Viabilidad…» -> «Puerta G3 · Viabilidad…»
    return etiqueta + ' · ' + t;
  }

  /* ---- códigos escritos como texto en un panel -> enlaces (D99) ---- */
  var RE_TOKEN = /(^|[^\w\-\/#.§])((?:[Dd]ocumentos?|[Dd]ocuments?|[Dd]oc\.)\s+\d{2}|(?:[Ff]ase|[Pp]hase)\s+[0-7]|(?:[Ee]sfera|[Ss]phere)\s+0[1-9]|(?:[Rr]egla|[Rr]ule|[Pp]rincipio|[Pp]rinciple)\s+\d{1,2}|[PTM]\d{2}|G[0-7](?:\.\d{2})?|R6(?:\.\d{2})?|LV-[A-Z0-9]{2,3}|IE\d{2}\.\d{2}|[A-Z]{2,4}-[A-Z0-9]{1,4}(?:-[A-Z0-9]{1,4}){0,2}|[CDANS]\d)(?![\w\-\/#]|[.,]\w)/g;
  // dónde no se enlaza: enlaces ya escritos, controles, código, títulos principales, barras de navegación y lo marcado data-sin-codigos
  var EXCL = 'a, button, input, textarea, select, option, label, summary, script, style, noscript, code, pre, svg, h1, nav, [contenteditable], [data-sin-codigos], [data-ir-codigo], .ir-codigo-lista, .mermaid';
  // dónde sí se cuentan los citados: todo lo anterior salvo los enlaces, títulos y desplegables (también nombran códigos)
  var EXCL_CITAS = 'button, input, textarea, select, option, script, style, svg, nav, [hidden], [data-sin-codigos], [data-ir-codigo], .ir-codigo-lista, .panel-indice, .barra, .mermaid';
  function textos(raiz, excl) {
    var tw = document.createTreeWalker(raiz, NodeFilter.SHOW_TEXT, { acceptNode: function (n) {
      if (!n.nodeValue || n.nodeValue.length < 2 || !/\d/.test(n.nodeValue)) return NodeFilter.FILTER_REJECT;
      var p = n.parentElement; if (!p || p.closest(excl)) return NodeFilter.FILTER_REJECT;
      return NodeFilter.FILTER_ACCEPT; } });
    var r = []; while (tw.nextNode()) r.push(tw.currentNode); return r;
  }
  // un código con vecino de rango («P25 – P75», «S1–S8») solo se enlaza si el vecino también existe: si no, es otra cosa (un percentil, una serie)
  function candidato(texto, tok, ini, fin) {
    var e = resolver(tok); if (!e) return null;
    if (/^[A-Z]\d{1,2}$/.test(tok)) {
      var d = texto.slice(fin).match(/^\s*[–\-—]\s*([A-Z]\d{1,2})(?![\w\-\/#]|\.\w)/), a = texto.slice(0, ini).match(/(?:^|[^\w\-\/#.])([A-Z]\d{1,2})\s*[–\-—]\s*$/);
      var v = (d && d[1]) || (a && a[1]); if (v && !DATOS.exactos[v.toUpperCase()]) return null;
    }
    return e;
  }
  function enlazar(raiz) {
    raiz = raiz || document.body; if (!raiz || raiz.nodeType !== 1 || (raiz.closest && raiz.closest(EXCL))) return 0;
    var n = 0;
    textos(raiz, EXCL).forEach(function (nodo) {
      var texto = nodo.nodeValue, partes = null, ultimo = 0, m;
      RE_TOKEN.lastIndex = 0;
      while ((m = RE_TOKEN.exec(texto))) {
        var ini = m.index + m[1].length, tok = m[2], e = candidato(texto, tok, ini, ini + tok.length);
        if (!e) continue;
        if (!partes) partes = document.createDocumentFragment();
        if (ini > ultimo) partes.appendChild(document.createTextNode(texto.slice(ultimo, ini)));
        var a = document.createElement('a'); a.className = 'cod-enlace'; a.href = destino(e.h); a.title = tooltip(e, tok); a.setAttribute('data-lang', DATOS.lang); a.textContent = tok;
        partes.appendChild(a); ultimo = ini + tok.length; n++;
      }
      if (partes) { if (ultimo < texto.length) partes.appendChild(document.createTextNode(texto.slice(ultimo))); nodo.parentNode.replaceChild(partes, nodo); }
    });
    return n;
  }
  function desenlazar(sel) {   // enlaces hechos por el codigos.js del otro idioma: vuelven a ser texto y se enlazan de nuevo
    Array.prototype.forEach.call(document.querySelectorAll(sel), function (a) { var p = a.parentNode; if (!p) return; p.replaceChild(document.createTextNode(a.textContent), a); p.normalize(); });
  }
  // qué códigos nombra la página (o la vista actual de una herramienta): uno por concepto, agrupados por tipo, con su enlace
  function citados() {
    var raices = Array.prototype.slice.call(document.querySelectorAll('[data-enlazar-codigos]'));
    if (!raices.length) raices = [document.querySelector('main') || document.body];
    var vistos = {}, r = [];
    raices.forEach(function (raiz) { textos(raiz, EXCL_CITAS).forEach(function (nodo) {
      var texto = nodo.nodeValue, m; RE_TOKEN.lastIndex = 0;
      while ((m = RE_TOKEN.exec(texto))) {
        var ini = m.index + m[1].length, tok = m[2], e = candidato(texto, tok, ini, ini + tok.length);
        if (!e) continue; var id = e.c + '|' + e.h; if (vistos[id]) continue; vistos[id] = 1; r.push(e);
      }
    }); });
    var orden = ['doc', 'pla', 'her', 'app', 'mod', 'puerta', 'lv', 'fase', 'esfera', 'otro'];
    r.sort(function (a, b) { var ka = orden.indexOf(a.k), kb = orden.indexOf(b.k); return ka !== kb ? ka - kb : a.c.localeCompare(b.c, undefined, { numeric: true }); });
    return r;
  }

  function estilos() {
    if (document.getElementById('ir-codigo-css')) return;
    var st = document.createElement('style'); st.id = 'ir-codigo-css';
    st.textContent = '.ir-codigo{position:relative;display:inline-flex;align-items:center;gap:6px;font:500 14px/1.2 var(--sans,"Segoe UI",Arial,sans-serif)}' +
      '.ir-codigo input{width:13em;max-width:46vw;font:inherit;color:var(--tinta,#2f2b28);background:var(--papel,#fff1e5);border:1px solid var(--regla,#c9a78d);border-left:3px solid var(--claret,#990f3d);padding:6px 8px;border-radius:0}' +
      '.ir-codigo input:focus{outline:2px solid var(--oxford,#0f5499);outline-offset:1px;width:16em}' +
      '.ir-codigo-citados{font:inherit;color:var(--tinta,#2f2b28);background:var(--papel,#fff1e5);border:1px solid var(--regla,#c9a78d);padding:6px 8px;border-radius:0;cursor:pointer;white-space:nowrap}' +
      '.ir-codigo-citados:hover,.ir-codigo-citados[aria-expanded=true]{background:var(--papel-2,#f3cfb2)}.ir-codigo-citados:focus-visible{outline:2px solid var(--oxford,#0f5499);outline-offset:1px}.ir-codigo-citados[hidden]{display:none}' +
      '.ir-codigo-lista{position:fixed;z-index:1000;box-sizing:border-box;width:min(34em,calc(100vw - 16px));max-height:70vh;overflow-y:auto;background:var(--papel,#fff1e5);border:1px solid var(--negro,#1a1817);box-shadow:0 8px 24px rgba(0,0,0,.25);display:none;text-align:left;font:500 14px/1.2 var(--sans,"Segoe UI",Arial,sans-serif)}' +
      '.ir-codigo-lista.abierta{display:block}' +
      '.ir-codigo-lista a{display:block;padding:8px 10px;text-decoration:none;color:var(--tinta,#2f2b28);border-bottom:1px solid var(--regla-2,#e7c6ab);white-space:normal}' +
      '.ir-codigo-lista a b{display:block;color:var(--claret,#990f3d);font-weight:700}' +
      '.ir-codigo-lista a span{display:block;font-size:12.5px;line-height:1.35;color:var(--tinta-2,#564d47)}' +
      '.ir-codigo-lista a.activo,.ir-codigo-lista a:hover{background:var(--papel-2,#f3cfb2)}' +
      '.ir-codigo-lista p{margin:0;padding:8px 10px;font-size:12.5px;line-height:1.4;color:var(--tinta-2,#564d47)}' +
      '.ir-codigo-lista p.grupo{padding:5px 10px;font-size:11.5px;font-weight:700;letter-spacing:.05em;text-transform:uppercase;color:var(--claret,#990f3d);background:var(--papel-2,#f3cfb2);border-bottom:1px solid var(--regla-2,#e7c6ab)}' +
      'a.cod-enlace{color:inherit;text-decoration:underline;text-decoration-style:dotted;text-decoration-color:var(--claret,#990f3d);text-underline-offset:2px}a.cod-enlace:hover{text-decoration-style:solid}' +
      '@media print{.ir-codigo{display:none!important}a.cod-enlace{text-decoration:none}}';
    document.head.appendChild(st);
  }
  function montar(host) {
    if (host.getAttribute('data-ir-codigo') === DATOS.lang) return;
    host.setAttribute('data-ir-codigo', DATOS.lang); host.classList.add('ir-codigo'); host.innerHTML = '';
    var inp = document.createElement('input'); inp.type = 'search'; inp.placeholder = TX.ph; inp.setAttribute('aria-label', TX.aria); inp.title = TX.ayuda; inp.autocomplete = 'off'; inp.spellcheck = false;
    var lista = document.createElement('div'); lista.className = 'ir-codigo-lista'; lista.setAttribute('role', 'listbox');
    // la lista cuelga de <body> con posición fija: dentro de la barra la recortaría su desbordamiento horizontal
    Array.prototype.forEach.call(document.querySelectorAll('.ir-codigo-lista'), function (l) { if (!l._host || !document.contains(l._host)) l.parentNode.removeChild(l); });
    lista._host = host;
    // botón «Citados aquí (n)»: los códigos que nombra la página, con su enlace (D99); oculto si no nombra ninguno
    var btn = document.createElement('button'); btn.type = 'button'; btn.className = 'ir-codigo-citados'; btn.title = TX.citadosTt; btn.setAttribute('aria-expanded', 'false'); btn.hidden = true;
    var listaC = document.createElement('div'); listaC.className = 'ir-codigo-lista'; listaC._host = host;
    host.appendChild(inp); host.appendChild(btn); document.body.appendChild(lista); document.body.appendChild(listaC);
    var res = [], act = 0;
    function coloca(l, ancla) {
      var r = ancla.getBoundingClientRect(), ancho = Math.min(34 * 14, window.innerWidth - 16);
      l.style.top = Math.round(r.bottom + 4) + 'px';
      l.style.left = Math.max(8, Math.min(Math.round(r.left), window.innerWidth - ancho - 8)) + 'px';
    }
    window.addEventListener('resize', function () { if (lista.classList.contains('abierta')) coloca(lista, inp); if (listaC.classList.contains('abierta')) coloca(listaC, btn); });
    function pinta() {
      var q = inp.value.trim();
      if (!q) { lista.classList.remove('abierta'); lista.innerHTML = ''; return; }
      cierraCitados(); coloca(lista, inp);
      res = buscar(q); act = 0; lista.innerHTML = '';
      if (!res.length) {
        var p = document.createElement('p'); p.textContent = TX.nada + ' '; var a = document.createElement('a'); a.href = destino(TX.glosHref); a.textContent = TX.glos; a.style.display = 'inline'; a.style.padding = '0'; a.style.border = '0'; a.style.color = 'var(--oxford,#0f5499)'; p.appendChild(a); lista.appendChild(p);
      } else res.forEach(function (e, i) {
        var a = document.createElement('a'); a.href = destino(e.h); a.setAttribute('role', 'option'); if (i === 0) a.className = 'activo';
        var b = document.createElement('b'); b.textContent = e.c; var s = document.createElement('span'); s.textContent = e.t; a.appendChild(b); a.appendChild(s); lista.appendChild(a);
      });
      lista.classList.add('abierta');
    }
    function marca() { Array.prototype.forEach.call(lista.querySelectorAll('a[role=option]'), function (a, i) { a.classList.toggle('activo', i === act); }); }
    function ir(h) { var d = destino(h); lista.classList.remove('abierta'); if (d.split('#')[0] === location.href.split('#')[0]) { location.hash = ''; } location.href = d; }
    inp.addEventListener('input', pinta);
    inp.addEventListener('focus', pinta);
    inp.addEventListener('keydown', function (ev) {
      if (ev.key === 'ArrowDown' && res.length) { act = (act + 1) % res.length; marca(); ev.preventDefault(); }
      else if (ev.key === 'ArrowUp' && res.length) { act = (act - 1 + res.length) % res.length; marca(); ev.preventDefault(); }
      else if (ev.key === 'Enter') { ev.preventDefault(); ev.stopPropagation(); if (res.length) ir(res[act].h); }
      else if (ev.key === 'Escape') { lista.classList.remove('abierta'); inp.blur(); }
    });
    function cierraCitados() { listaC.classList.remove('abierta'); btn.setAttribute('aria-expanded', 'false'); }
    function pintaCitados() {
      var r = citados(); listaC.innerHTML = '';
      if (!r.length) { var p = document.createElement('p'); p.textContent = TX.citadosNada; listaC.appendChild(p); }
      var grupo = '';
      r.forEach(function (e) {
        var g = TX.tipos[e.k] || TX.tipos.otro;
        if (g !== grupo) { grupo = g; var pg = document.createElement('p'); pg.className = 'grupo'; pg.textContent = g; listaC.appendChild(pg); }
        var a = document.createElement('a'); a.href = destino(e.h); a.title = tooltip(e);
        var b = document.createElement('b'); b.textContent = e.c; var s = document.createElement('span'); s.textContent = e.t; a.appendChild(b); a.appendChild(s); listaC.appendChild(a);
      });
    }
    btn.addEventListener('click', function () {
      if (listaC.classList.contains('abierta')) { cierraCitados(); return; }
      lista.classList.remove('abierta'); pintaCitados(); coloca(listaC, btn); listaC.classList.add('abierta'); btn.setAttribute('aria-expanded', 'true');
    });
    btn.addEventListener('keydown', function (ev) { if (ev.key === 'Escape') { cierraCitados(); btn.blur(); } });
    document.addEventListener('click', function (ev) { if (!host.contains(ev.target) && !lista.contains(ev.target) && !listaC.contains(ev.target)) { lista.classList.remove('abierta'); cierraCitados(); } });
    host._cuenta = function () { var n = citados().length; btn.hidden = !n; btn.textContent = TX.citados + ' (' + n + ')'; if (listaC.classList.contains('abierta')) pintaCitados(); };
    host._cuenta();
  }
  function recuento() { Array.prototype.forEach.call(document.querySelectorAll('[data-ir-codigo]'), function (h) { if (h._cuenta) h._cuenta(); }); }
  var OBS = [], esperaCuenta = null;
  function recontar() { clearTimeout(esperaCuenta); esperaCuenta = setTimeout(recuento, 300); }
  function observar(raiz) {
    if (raiz._sevengObs === DATOS.lang || !window.MutationObserver) return;
    raiz._sevengObs = DATOS.lang;
    var ob = new MutationObserver(function (regs) {
      regs.forEach(function (r) {
        if (r.type === 'characterData') { if (r.target.parentElement) enlazar(r.target.parentElement); return; }
        if (r.type === 'attributes') return;   // una página del panel que se muestra u oculta: solo cambia el recuento de citados
        Array.prototype.forEach.call(r.addedNodes, function (n) { if (n.nodeType === 1 && !(n.classList && n.classList.contains('cod-enlace'))) enlazar(n); });
      });
      if (regs.length) recontar();
    });
    ob.observe(raiz, { childList: true, subtree: true, characterData: true, attributes: true, attributeFilter: ['hidden'] }); OBS.push({ ob: ob, raiz: raiz });
  }
  function desconectar() { OBS.forEach(function (o) { o.ob.disconnect(); o.raiz._sevengObs = null; }); OBS = []; }
  function iniciar() {
    estilos();
    desenlazar('a.cod-enlace:not([data-lang="' + DATOS.lang + '"])');
    Array.prototype.forEach.call(document.querySelectorAll('[data-enlazar-codigos]'), function (raiz) { enlazar(raiz); observar(raiz); });
    Array.prototype.forEach.call(document.querySelectorAll('[data-ir-codigo]'), montar);
    recuento();
  }
  window.addEventListener('hashchange', recontar);
  window.sevengIrCodigo = { buscar: buscar, resolver: resolver, enlazar: enlazar, citados: citados, iniciar: iniciar, desconectar: desconectar, lang: DATOS.lang };
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', iniciar); else iniciar();
})();
/* Medición agregada de visitas con Umami (D90): sin cookies ni datos personales; solo en los dominios públicos indicados.
   Con data-sin-medicion en la etiqueta <script> no se mide (paneles del consejo y comunidad, D99). */
(function () {
  var U = __UMAMI__, cs = document.currentScript;
  if (cs && cs.hasAttribute('data-sin-medicion')) return;
  if (!U || !U.websiteId || !U.src || document.getElementById('umami-js')) return;
  if ((U.dominios || []).indexOf(location.hostname) < 0) return;
  var s = document.createElement('script'); s.id = 'umami-js'; s.defer = true; s.src = U.src;
  s.setAttribute('data-website-id', U.websiteId); s.setAttribute('data-domains', U.dominios.join(',')); s.setAttribute('data-do-not-track', 'true');
  document.head.appendChild(s);
})();
'@
  $js = $js.Replace('__DATOS__', $datos).Replace('__TEXTOS__', $textos).Replace('__UMAMI__', $umami)
  $salida = Join-Path $htmlDir 'codigos.js'
  [IO.File]::WriteAllText($salida, $js, [Text.UTF8Encoding]::new($false))
  Write-Host "codigos [$lang]: $($exactos.Count) códigos y $($patrones.Count) patrones -> $salida"
}
