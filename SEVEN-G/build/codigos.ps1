<#
.SYNOPSIS
  Genera el índice de códigos del sitio y el control «Ir a código» (D88): SEVEN-G/html/<idioma>/codigos.js

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

.EXAMPLE
  pwsh -File SEVEN-G/build/codigos.ps1
#>
param([string[]]$Idiomas = @('es', 'en'))

$ErrorActionPreference = 'Stop'
$repo = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
$raiz = Join-Path $repo 'SEVEN-G'

function Texto([string]$html) { ([Net.WebUtility]::HtmlDecode(([regex]::Replace($html, '<[^>]+>', '')))).Trim() -replace '\s+', ' ' }
function Recortar([string]$s, [int]$n = 130) { if ($s.Length -le $n) { $s } else { $s.Substring(0, $n - 1).TrimEnd() + '…' } }

foreach ($lang in $Idiomas) {
  $en = $lang -eq 'en'
  $htmlDir = Join-Path $raiz "html\$lang"
  if (-not (Test-Path $htmlDir)) { Write-Warning "No existe $htmlDir"; continue }

  $exactos = [ordered]@{}        # CLAVE EN MAYÚSCULAS -> lista de {c, t, h}
  $patrones = [Collections.Generic.List[object]]::new()
  function Anadir([string]$clave, [string]$codigo, [string]$titulo, [string]$href) {
    if (-not $href) { return }
    $k = $clave.ToUpperInvariant()
    if (-not $exactos.Contains($k)) { $exactos[$k] = [Collections.Generic.List[object]]::new() }
    if ($exactos[$k] | Where-Object { $_.h -eq $href }) { return }
    $exactos[$k].Add([ordered]@{ c = $codigo; t = (Recortar $titulo); h = $href })
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
      Anadir $cod "$(if ($en) { 'Document' } else { 'Documento' }) $cod" $titulo $rel
    } elseif ($cod -like 'P*') {
      Anadir $cod $cod $titulo $rel
    } else {
      Anadir $cod "$(if ($en) { 'Course' } else { 'Curso' }) · $cod" $titulo $rel
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
    foreach ($m in [regex]::Matches($paginas['03'].html, '(?s)<tr id="(cod-t\d{2})">\s*<td[^>]*>(.*?)</td>\s*<td[^>]*>(.*?)</td>\s*<td[^>]*>(.*?)</td>')) {
      $cod = (Texto $m.Groups[2].Value)
      if ($cod -notmatch '^T\d{2}$') { continue }
      Anadir $cod $cod "$(Texto $m.Groups[3].Value) — $(Texto $m.Groups[4].Value)" "$($paginas['03'].href)#$($m.Groups[1].Value)"
    }
  }
  $herr = Join-Path $raiz 'herramientas'
  foreach ($h in (Get-ChildItem $herr -Directory | Where-Object Name -match '^T\d{2}_')) {
    $app = Get-ChildItem $h.FullName -File -Filter *.html | Where-Object Name -notlike '_*' | Select-Object -First 1
    if (-not $app) { continue }
    $cod = $h.Name.Substring(0, 3)
    $rel = [IO.Path]::GetRelativePath($htmlDir, $app.FullName).Replace('\', '/')
    Anadir $cod "$cod ▸ $(if ($en) { 'open the tool' } else { 'abrir la herramienta' })" $(if ($en) { 'Application with fictitious sample data' } else { 'Aplicación, con datos de ejemplo ficticios' }) $rel
  }

  # ---- fases, puertas, criterios, listas de verificación y esferas: a su sección ----
  foreach ($n in 0..7) {
    $e = Por-Texto '20' "^(Fase|Phase) $n\b"
    if ($e) { foreach ($k in "FASE $n", "PHASE $n", "F$n") { Anadir $k "$(if ($en) { 'Phase' } else { 'Fase' }) $n" "$($e.texto) — $(if ($en) { 'phase manual' } else { 'manual de la fase' })" $e.href } }
  }
  foreach ($g in 'G0', 'G1', 'G2', 'G3', 'G4', 'G5', 'R6', 'G7') {
    $e = Por-Texto '21' "^\d+\.\d+ $g\b"
    if ($e) {
      $rot = "$($e.texto -replace '^\d+\.\d+\s*', '') — $(if ($en) { 'gate criteria' } else { 'criterios de la puerta' })"
      Anadir $g $g $rot $e.href
      $patrones.Add([ordered]@{ re = "^$g\.\d{2}$"; c = "$g.nn"; t = "$(if ($en) { 'Gate criterion' } else { 'Criterio de puerta' }) · $rot"; h = $e.href })
    }
    $lv = Por-Texto '22' "^LV-$g\b"
    if ($lv) { Anadir "LV-$g" "LV-$g" "$($lv.texto) — $(if ($en) { 'checklist' } else { 'lista de verificación' })" $lv.href }
  }
  foreach ($x in 'LV-EV', 'LV-AG') { $lv = Por-Texto '22' "^$x\b"; if ($lv) { Anadir $x $x $lv.texto $lv.href } }
  foreach ($n in 1..9) {
    $e = Por-Texto '10' "(Esfera|Sphere) 0$n\b"
    if ($e) { foreach ($k in "ESFERA 0$n", "SPHERE 0$n", "E0$n") { Anadir $k "$(if ($en) { 'Sphere' } else { 'Esfera' }) 0$n" ($e.texto -replace '^\d+(\.\d+)?\s*', '') $e.href } }
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
            $patrones.Add([ordered]@{ re = "^$re$"; c = $p; t = (Recortar $titulo); h = $href })
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
    @{ ph = 'Go to code: P12, T06, G3…'; aria = 'Go to where a code is explained (document, template, tool, gate, criterion…)'; nada = 'No such code. Try the glossary:'; glos = 'Glossary and conventions (02), code system'; ayuda = 'Type a code (40, P12, T06, G3, G3.05, LV-G3, phase 3, C2, D6, A2, RT-GEN-01, IND-VAL-05…) or part of a title. Enter opens the first result.' }
  } else {
    @{ ph = 'Ir a código: P12, T06, G3…'; aria = 'Ir a donde se explica un código (documento, plantilla, herramienta, puerta, criterio…)'; nada = 'No existe ese código. Pruebe en el glosario:'; glos = 'Glosario y convenciones (02), sistema de códigos'; ayuda = 'Escriba un código (40, P12, T06, G3, G3.05, LV-G3, fase 3, C2, D6, A2, RT-GEN-01, IND-VAL-05…) o parte de un título. Intro abre el primer resultado.' }
  }
  $glosHref = if ($paginas.ContainsKey('02')) { Seccion '02' '6' } else { '' }
  $textos = ($txt + @{ glosHref = $glosHref }) | ConvertTo-Json -Compress

  $js = @'
/* SEVEN-G · índice de códigos y control «Ir a código» (D88). Generado por SEVEN-G/build/codigos.ps1: no editar a mano. */
(function () {
  var DATOS = __DATOS__, TX = __TEXTOS__;
  var BASE = (document.currentScript && document.currentScript.src) || location.href;
  var PATRONES = DATOS.patrones.map(function (p) { return { re: new RegExp(p.re, 'i'), c: p.c, t: p.t, h: p.h }; });
  var TODOS = []; Object.keys(DATOS.exactos).forEach(function (k) { DATOS.exactos[k].forEach(function (e) { if (TODOS.indexOf(e) < 0) TODOS.push(e); }); });

  function normalizar(s) {
    s = String(s || '').trim().toUpperCase().replace(/\s+/g, ' ').replace(/[§#]/g, '');
    s = s.replace(/^(DOCUMENTO|DOCUMENT|DOC\.?)\s*(\d{1,2})$/, function (_, a, n) { return ('0' + n).slice(-2); });
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

  function estilos() {
    if (document.getElementById('ir-codigo-css')) return;
    var st = document.createElement('style'); st.id = 'ir-codigo-css';
    st.textContent = '.ir-codigo{position:relative;display:inline-flex;align-items:center;font:500 14px/1.2 var(--sans,"Segoe UI",Arial,sans-serif)}' +
      '.ir-codigo input{width:11.5em;max-width:46vw;font:inherit;color:var(--tinta,#2f2b28);background:var(--papel,#fff1e5);border:1px solid var(--regla,#c9a78d);border-left:3px solid var(--claret,#990f3d);padding:6px 8px;border-radius:0}' +
      '.ir-codigo input:focus{outline:2px solid var(--oxford,#0f5499);outline-offset:1px;width:15em}' +
      '.ir-codigo-lista{position:fixed;z-index:1000;box-sizing:border-box;width:min(34em,calc(100vw - 16px));max-height:70vh;overflow-y:auto;background:var(--papel,#fff1e5);border:1px solid var(--negro,#1a1817);box-shadow:0 8px 24px rgba(0,0,0,.25);display:none;text-align:left;font:500 14px/1.2 var(--sans,"Segoe UI",Arial,sans-serif)}' +
      '.ir-codigo-lista.abierta{display:block}' +
      '.ir-codigo-lista a{display:block;padding:8px 10px;text-decoration:none;color:var(--tinta,#2f2b28);border-bottom:1px solid var(--regla-2,#e7c6ab);white-space:normal}' +
      '.ir-codigo-lista a b{display:block;color:var(--claret,#990f3d);font-weight:700}' +
      '.ir-codigo-lista a span{display:block;font-size:12.5px;line-height:1.35;color:var(--tinta-2,#564d47)}' +
      '.ir-codigo-lista a.activo,.ir-codigo-lista a:hover{background:var(--papel-2,#f3cfb2)}' +
      '.ir-codigo-lista p{margin:0;padding:8px 10px;font-size:12.5px;line-height:1.4;color:var(--tinta-2,#564d47)}' +
      '@media print{.ir-codigo{display:none!important}}';
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
    host.appendChild(inp); document.body.appendChild(lista);
    var res = [], act = 0;
    function coloca() {
      var r = inp.getBoundingClientRect(), ancho = Math.min(34 * 14, window.innerWidth - 16);
      lista.style.top = Math.round(r.bottom + 4) + 'px';
      lista.style.left = Math.max(8, Math.min(Math.round(r.left), window.innerWidth - ancho - 8)) + 'px';
    }
    window.addEventListener('resize', function () { if (lista.classList.contains('abierta')) coloca(); });
    function pinta() {
      var q = inp.value.trim();
      if (!q) { lista.classList.remove('abierta'); lista.innerHTML = ''; return; }
      coloca();
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
    document.addEventListener('click', function (ev) { if (!host.contains(ev.target) && !lista.contains(ev.target)) lista.classList.remove('abierta'); });
  }
  function iniciar() { estilos(); Array.prototype.forEach.call(document.querySelectorAll('[data-ir-codigo]'), montar); }
  window.sevengIrCodigo = { buscar: buscar, iniciar: iniciar, lang: DATOS.lang };
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', iniciar); else iniciar();
})();
'@
  $js = $js.Replace('__DATOS__', $datos).Replace('__TEXTOS__', $textos)
  $salida = Join-Path $htmlDir 'codigos.js'
  [IO.File]::WriteAllText($salida, $js, [Text.UTF8Encoding]::new($false))
  Write-Host "codigos [$lang]: $($exactos.Count) códigos y $($patrones.Count) patrones -> $salida"
}
