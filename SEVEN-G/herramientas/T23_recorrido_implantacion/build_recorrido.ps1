<#
  T23 · Recorrido de implantación · construcción de recorrido.html desde sus fuentes.

  Uso:          pwsh -File SEVEN-G/herramientas/T23_recorrido_implantacion/build_recorrido.ps1 [-Datos <t23.json>] [-Salida <fichero.html>] [-ActualizarRecorrido]

  Fuentes:      _fuentes/recorrido.plantilla.html   aplicación (HTML, CSS y JavaScript) sin datos; es lo único que se edita a mano
                recorrido.json                      arquetipos, regla de asignación, modificadores, cuestionario Q01–Q12, etapas, hitos HI-01…HI-22
                                                    con su prioridad por arquetipo y roles por etapa, extraídos del documento 96 (ES/EN)
                datos_demo.json                     respuestas y estados de ejemplo (compañía ficticia del registro T01; resulta PP-F)
                ejemplo_pp_b.json                   segundo ejemplo cargable (empresa de servicios ficticia; resulta PP-B)
  Salida:       recorrido.html                      un solo fichero, sin servidor ni dependencias. NUNCA se edita a mano.

  Mismo patrón que T15 con el documento 11 y el 34 (D43, D115): recorrido.json no se escribe a mano; se extrae de
  SEVEN-G/mds/es|en/96_SEVEN-G_Puntos_de_partida_y_recorrido_de_implantacion.md con -ActualizarRecorrido. En cada construcción el script
  comprueba que recorrido.json coincide con el documento 96 (ES/EN): si el documento cambia, la construcción falla hasta regenerarlo.
  Comprueba también la estructura (6 arquetipos, 5 modificadores, 12 preguntas, 5 etapas, 22 hitos, claves de prioridad válidas),
  que cada pregunta del documento 11 citada existe en el cuestionario de T15 y la coherencia de los datos de ejemplo.
#>
param(
  [string]$Datos,
  [string]$Salida,
  [switch]$ActualizarRecorrido
)
$ErrorActionPreference = 'Stop'
$aqui = $PSScriptRoot
if (-not $Datos)  { $Datos  = Join-Path $aqui 'datos_demo.json' }
if (-not $Salida) { $Salida = Join-Path $aqui 'recorrido.html' }
$plantilla = Join-Path (Join-Path $aqui '_fuentes') 'recorrido.plantilla.html'
$rutaRec = Join-Path $aqui 'recorrido.json'
$rutaEjB = Join-Path $aqui 'ejemplo_pp_b.json'
$mds = Join-Path (Join-Path $aqui '..') (Join-Path '..' 'mds')
$nombreDoc = '96_SEVEN-G_Puntos_de_partida_y_recorrido_de_implantacion.md'
$doc = @{ es = (Join-Path (Join-Path $mds 'es') $nombreDoc); en = (Join-Path (Join-Path $mds 'en') $nombreDoc) }
$rutaCuest11 = Join-Path (Join-Path (Join-Path $aqui '..') 'T15_diagnostico_madurez') 'cuestionario.json'

# claves estables de las respuestas de cada pregunta (el texto sale del documento; el orden de las respuestas debe ser este)
$CLAVES = [ordered]@{
  Q01 = 'ninguno', 'reglas', 'terceros', 'ml', 'generativa', 'agentes'
  Q02 = '0', '1-2', '3-5', 'mas5'
  Q03 = 'ninguno', 'alguno', 'mayoria'
  Q04 = 'si', 'no', 'nsnc'
  Q05 = 'ninguno', 'parcial', 'formal'
  Q06 = 'no', 'parcial', 'completo'
  Q07 = 'si', 'no'
  Q08 = 'si', 'no', 'nsnc'
  Q09 = 'si', 'no'
  Q10 = 'si', 'no'
  Q11 = 'ninguno', 'direccion', 'consejo'
  Q12 = 'si', 'no', 'terceros'
}
$PRIORIDADES = '1', '2', '3', 'C', 'D', '·'
$ARQ = 'PP-A', 'PP-B', 'PP-C', 'PP-D', 'PP-E', 'PP-F'

# JSON compacto sin reinterpretar números ni escapar acentos; "</" se escapa para que no cierre el <script> que lo contiene
function Compactar([string]$ruta) {
  $d = [System.Text.Json.JsonDocument]::Parse([IO.File]::ReadAllText($ruta))
  $ms = [IO.MemoryStream]::new()
  $op = [System.Text.Json.JsonWriterOptions]::new()
  $op.Indented = $false
  $op.Encoder = [System.Text.Encodings.Web.JavaScriptEncoder]::UnsafeRelaxedJsonEscaping
  $w = [System.Text.Json.Utf8JsonWriter]::new($ms, $op)
  $d.WriteTo($w); $w.Flush()
  $txt = [Text.Encoding]::UTF8.GetString($ms.ToArray())
  $w.Dispose(); $ms.Dispose(); $d.Dispose()
  return $txt.Replace('</', '<\/')
}

# ---- lectura del documento 96 (un idioma)
function Limpiar([string]$s) { ($s -replace '\*\*([^*]+)\*\*', '$1' -replace '\*([^*]+)\*', '$1').Trim() }
function Seccion([string]$t, [string]$desde, [string]$hasta, [string]$ruta) {
  $m = [regex]::Match($t, "(?ms)^$desde.*?(?=^$hasta)")
  if (-not $m.Success) { throw "El documento 96 no tiene la sección que empieza por «$desde»: $ruta" }
  return $m.Value
}
# filas de la (única) tabla de un bloque, sin cabecera ni separador; cada fila, lista de celdas
function Filas([string]$bloque) {
  $f = [Collections.Generic.List[object]]::new(); $cab = $false
  foreach ($l in ($bloque -split "\r?\n")) {
    if ($l -notmatch '^\|.*\|\s*$') { continue }
    if ($l -match '^\|[\s\-:|]+\|\s*$') { continue }
    if (-not $cab) { $cab = $true; continue }
    $c = $l.Trim().Trim('|') -split ' \| '
    $f.Add(@($c | ForEach-Object { $_.Trim() }))
  }
  return $f
}
# «6 / 9» → Lite 6, Enterprise 9; «Semana 1» → igual en los dos; «3 (dirección) · 6 / 9–12 (consejo)» → «3 (dirección) · 6 (consejo)» y «3 (dirección) · 9–12 (consejo)»
function Mes-Base([string]$s) {
  if ($s -notmatch ' / ') { return [ordered]@{ lite = $s; enterprise = $s } }
  $i = $s.IndexOf(' / '); $a = $s.Substring(0, $i).Trim(); $b = $s.Substring($i + 3).Trim()
  if ($a -match '^(.+ · )[^·]+$' -and $b -notmatch ' · ') { $b = $Matches[1] + $b }
  if ($b -match '( \([^)]+\))$' -and $a -notmatch '\)$') { $a = $a + $Matches[1] }
  return [ordered]@{ lite = $a; enterprise = $b }
}
function Leer-Documento([string]$ruta, [string]$idioma) {
  if (-not (Test-Path $ruta)) { throw "No se encuentra el documento 96 ($idioma): $ruta" }
  $t = [IO.File]::ReadAllText($ruta)
  $r = [ordered]@{}
  $r.arquetipos = @(foreach ($c in (Filas (Seccion $t '### 2\.1 ' '### 2\.2 ' $ruta))) {
    if ($c.Count -ne 6) { throw "documento 96 ($idioma) §2.1: fila con $($c.Count) celdas" }
    [ordered]@{ codigo = (Limpiar $c[0]); nombre = (Limpiar $c[1]); reconoce = (Limpiar $c[2]); riesgo = (Limpiar $c[3]); empieza = (Limpiar $c[4]); espera = (Limpiar $c[5]) } })
  $r.asignacion = @(foreach ($c in (Filas (Seccion $t '### 2\.2 ' '### 2\.3 ' $ruta))) {
    if ($c.Count -ne 3) { throw "documento 96 ($idioma) §2.2: fila con $($c.Count) celdas" }
    [ordered]@{ orden = [int](Limpiar $c[0]); arquetipo = (Limpiar $c[1]); condicion = (Limpiar $c[2]) } })
  $r.modificadores = @(foreach ($c in (Filas (Seccion $t '### 2\.3 ' '### 2\.4 ' $ruta))) {
    if ($c.Count -ne 3) { throw "documento 96 ($idioma) §2.3: fila con $($c.Count) celdas" }
    [ordered]@{ codigo = (Limpiar $c[0]); nombre = (Limpiar $c[1]); efecto = (Limpiar $c[2]) } })
  $r.preguntas = @(foreach ($c in (Filas (Seccion $t '### 2\.4 ' '## 3\. ' $ruta))) {
    if ($c.Count -ne 4) { throw "documento 96 ($idioma) §2.4: fila con $($c.Count) celdas" }
    [ordered]@{ codigo = (Limpiar $c[0]); texto = (Limpiar $c[1]); respuestas = @((Limpiar $c[2]) -split ' · ' | ForEach-Object { $_.Trim() }); alimenta = (Limpiar $c[3]) } })
  $r.etapas = @(foreach ($c in (Filas (Seccion $t '## 3\. ' '## 4\. ' $ruta))) {
    if ($c.Count -ne 3) { throw "documento 96 ($idioma) §3: fila con $($c.Count) celdas" }
    $e = Limpiar $c[0]; if ($e -notmatch '^(E\d) · (.+)$') { throw "documento 96 ($idioma) §3: etapa no reconocida «$e»" }
    [ordered]@{ codigo = $Matches[1]; nombre = $Matches[2].Trim(); objetivo = (Limpiar $c[1]); referencia = (Limpiar $c[2]) } })
  $r.hitos = @(foreach ($c in (Filas (Seccion $t '### 4\.1 ' '### 4\.2 ' $ruta))) {
    if ($c.Count -ne 7) { throw "documento 96 ($idioma) §4.1: fila con $($c.Count) celdas" }
    $mes = Limpiar $c[6]
    [ordered]@{ codigo = (Limpiar $c[0]); etapa = (Limpiar $c[1]); que = (Limpiar $c[2]); quien = (Limpiar $c[3]); evidencia = (Limpiar $c[4])
      preguntas11 = @([regex]::Matches($c[5], '\bD[1-7]\.\d\d\b') | ForEach-Object { $_.Value }); mes = $mes; mes_base = (Mes-Base $mes) } })
  $r.prioridades = [ordered]@{}
  foreach ($c in (Filas (Seccion $t '### 4\.2 ' '### 4\.3 ' $ruta))) {
    if ($c.Count -ne 7) { throw "documento 96 ($idioma) §4.2: fila con $($c.Count) celdas" }
    $p = [ordered]@{}; for ($i = 0; $i -lt 6; $i++) { $p[$ARQ[$i]] = (Limpiar $c[$i + 1]) }
    $r.prioridades[(Limpiar $c[0])] = $p
  }
  $s5 = Seccion $t '## 5\. ' '## 6\. ' $ruta
  $cab5 = ($s5 -split "\r?\n" | Where-Object { $_ -match '^\|' } | Select-Object -First 1).Trim().Trim('|') -split ' \| ' | ForEach-Object { $_.Trim() }
  $etCab = @($cab5 | Select-Object -Skip 1 | ForEach-Object { if ($_ -match '^(E\d) · ') { $Matches[1] } else { throw "documento 96 ($idioma) §5: columna de etapa no reconocida «$_»" } })
  $r.roles = @(foreach ($c in (Filas $s5)) {
    if ($c.Count -ne ($etCab.Count + 1)) { throw "documento 96 ($idioma) §5: fila con $($c.Count) celdas" }
    $et = [ordered]@{}
    for ($i = 0; $i -lt $etCab.Count; $i++) { $v = Limpiar $c[$i + 1]; $et[$etCab[$i]] = [ordered]@{ hitos = @([regex]::Matches($v, '\bHI-\d\d\b') | ForEach-Object { $_.Value }); texto = $v } }
    [ordered]@{ rol = (Limpiar $c[0]); etapas = $et } })
  return $r
}

function Recorrido-DesdeDocumento {
  $es = Leer-Documento $doc.es 'es'; $en = Leer-Documento $doc.en 'en'
  $bi = { param($a, $b) [ordered]@{ es = $a; en = $b } }
  $igual = { param($que, $a, $b) if ($a -ne $b) { throw "documento 96: $que distinto en ES («$a») y EN («$b»)" } }
  foreach ($k in 'arquetipos', 'asignacion', 'modificadores', 'preguntas', 'etapas', 'hitos', 'roles') { & $igual "número de filas de «$k»" @($es[$k]).Count @($en[$k]).Count }
  $o = [ordered]@{
    version_recorrido = '0.1'
    origen = 'Documento 96 · Puntos de partida y recorrido de implantación, §2.1–§2.4, §3, §4.1, §4.2 y §5 (ES/EN). Extraído con build_recorrido.ps1 -ActualizarRecorrido; no se edita a mano.'
  }
  $o.arquetipos = @(for ($i = 0; $i -lt $es.arquetipos.Count; $i++) { $a = $es.arquetipos[$i]; $b = $en.arquetipos[$i]; & $igual 'código de arquetipo' $a.codigo $b.codigo
    [ordered]@{ codigo = $a.codigo; nombre = (& $bi $a.nombre $b.nombre); reconoce = (& $bi $a.reconoce $b.reconoce); riesgo = (& $bi $a.riesgo $b.riesgo); empieza = (& $bi $a.empieza $b.empieza); espera = (& $bi $a.espera $b.espera) } })
  $o.asignacion = @(for ($i = 0; $i -lt $es.asignacion.Count; $i++) { $a = $es.asignacion[$i]; $b = $en.asignacion[$i]; & $igual 'regla de asignación' "$($a.orden) $($a.arquetipo)" "$($b.orden) $($b.arquetipo)"
    [ordered]@{ orden = $a.orden; arquetipo = $a.arquetipo; condicion = (& $bi $a.condicion $b.condicion) } })
  $o.modificadores = @(for ($i = 0; $i -lt $es.modificadores.Count; $i++) { $a = $es.modificadores[$i]; $b = $en.modificadores[$i]; & $igual 'código de modificador' $a.codigo $b.codigo
    [ordered]@{ codigo = $a.codigo; nombre = (& $bi $a.nombre $b.nombre); efecto = (& $bi $a.efecto $b.efecto) } })
  $o.preguntas = @(for ($i = 0; $i -lt $es.preguntas.Count; $i++) { $a = $es.preguntas[$i]; $b = $en.preguntas[$i]; & $igual 'código de pregunta' $a.codigo $b.codigo
    $cl = $CLAVES[$a.codigo]; if (-not $cl) { throw "documento 96: pregunta $($a.codigo) sin claves de respuesta en build_recorrido.ps1" }
    & $igual "número de respuestas de $($a.codigo)" $a.respuestas.Count $b.respuestas.Count
    if ($a.respuestas.Count -ne @($cl).Count) { throw "documento 96: $($a.codigo) tiene $($a.respuestas.Count) respuestas y build_recorrido.ps1 espera $(@($cl).Count) ($($cl -join ', ')); revise las claves" }
    [ordered]@{ codigo = $a.codigo; multiple = ($a.codigo -eq 'Q01'); texto = (& $bi $a.texto $b.texto)
      respuestas = @(for ($j = 0; $j -lt $a.respuestas.Count; $j++) { [ordered]@{ clave = $cl[$j]; texto = (& $bi $a.respuestas[$j] $b.respuestas[$j]) } })
      alimenta = (& $bi $a.alimenta $b.alimenta) } })
  $o.etapas = @(for ($i = 0; $i -lt $es.etapas.Count; $i++) { $a = $es.etapas[$i]; $b = $en.etapas[$i]; & $igual 'código de etapa' $a.codigo $b.codigo
    [ordered]@{ codigo = $a.codigo; nombre = (& $bi $a.nombre $b.nombre); objetivo = (& $bi $a.objetivo $b.objetivo); referencia = (& $bi $a.referencia $b.referencia) } })
  $o.hitos = @(for ($i = 0; $i -lt $es.hitos.Count; $i++) { $a = $es.hitos[$i]; $b = $en.hitos[$i]
    & $igual 'código de hito' $a.codigo $b.codigo; & $igual "etapa de $($a.codigo)" $a.etapa $b.etapa; & $igual "preguntas del 11 de $($a.codigo)" ($a.preguntas11 -join ',') ($b.preguntas11 -join ',')
    $pa = $es.prioridades[$a.codigo]; $pb = $en.prioridades[$a.codigo]
    if (-not $pa -or -not $pb) { throw "documento 96 §4.2: falta la fila de prioridad de $($a.codigo)" }
    & $igual "prioridades de $($a.codigo)" (($pa.Values) -join ',') (($pb.Values) -join ',')
    [ordered]@{ codigo = $a.codigo; etapa = $a.etapa; que = (& $bi $a.que $b.que); quien = (& $bi $a.quien $b.quien); evidencia = (& $bi $a.evidencia $b.evidencia)
      preguntas11 = @($a.preguntas11); mes_base = [ordered]@{ texto = (& $bi $a.mes $b.mes); lite = (& $bi $a.mes_base.lite $b.mes_base.lite); enterprise = (& $bi $a.mes_base.enterprise $b.mes_base.enterprise) }
      prioridad = $pa } })
  foreach ($k in $es.prioridades.Keys) { if (-not ($es.hitos | Where-Object { $_.codigo -eq $k })) { throw "documento 96 §4.2: prioridad de un hito que no está en §4.1 ($k)" } }
  $o.roles = @(for ($i = 0; $i -lt $es.roles.Count; $i++) { $a = $es.roles[$i]; $b = $en.roles[$i]
    $et = [ordered]@{}
    foreach ($k in $a.etapas.Keys) { & $igual "hitos del rol «$($a.rol)» en $k" ($a.etapas[$k].hitos -join ',') ($b.etapas[$k].hitos -join ',')
      $et[$k] = [ordered]@{ hitos = @($a.etapas[$k].hitos); texto = (& $bi $a.etapas[$k].texto $b.etapas[$k].texto) } }
    [ordered]@{ rol = (& $bi $a.rol $b.rol); etapas = $et } })
  return $o
}

# ---- comprobación de estructura
function Comprobar-Recorrido($r) {
  $e = [Collections.Generic.List[string]]::new()
  if (@($r.arquetipos).Count -ne 6) { $e.Add("hay $(@($r.arquetipos).Count) arquetipos (deben ser 6)") }
  if ((@($r.arquetipos | ForEach-Object codigo) -join ',') -ne ($ARQ -join ',')) { $e.Add('los arquetipos deben ser PP-A…PP-F en ese orden') }
  if ((@($r.asignacion | Sort-Object orden | ForEach-Object arquetipo) -join ',') -ne 'PP-F,PP-E,PP-D,PP-C,PP-B,PP-A') { $e.Add('la regla de asignación debe ir en el orden PP-F, PP-E, PP-D, PP-C, PP-B, PP-A (96 §2.2)') }
  if ((@($r.modificadores | ForEach-Object codigo) -join ',') -ne 'MP1,MP2,MP3,MP4,MP5') { $e.Add('los modificadores deben ser MP1…MP5') }
  if (@($r.preguntas).Count -ne 12) { $e.Add("hay $(@($r.preguntas).Count) preguntas (deben ser 12)") }
  if ((@($r.etapas | ForEach-Object codigo) -join ',') -ne 'E1,E2,E3,E4,E5') { $e.Add('las etapas deben ser E1…E5') }
  if (@($r.hitos).Count -ne 22) { $e.Add("hay $(@($r.hitos).Count) hitos (deben ser 22)") }
  $cods = @{}; foreach ($h in $r.hitos) { $cods[$h.codigo] = $true
    if ($h.etapa -notin 'E1', 'E2', 'E3', 'E4', 'E5') { $e.Add("$($h.codigo): etapa $($h.etapa) inexistente") }
    foreach ($a in $ARQ) { $v = $h.prioridad.$a; if ($v -cnotin $PRIORIDADES) { $e.Add("$($h.codigo): prioridad «$v» para $a no válida (1, 2, 3, C, D o ·)") } }
    foreach ($l in 'es', 'en') { foreach ($k in 'que', 'quien', 'evidencia') { if (-not $h.$k.$l) { $e.Add("$($h.codigo): falta $k.$l") } } }
    if (@($h.preguntas11).Count -eq 0) { $e.Add("$($h.codigo): no cita ninguna pregunta del documento 11") } }
  foreach ($ro in $r.roles) { foreach ($p in $ro.etapas.PSObject.Properties) { foreach ($x in $p.Value.hitos) { if (-not $cods[$x]) { $e.Add("rol «$($ro.rol.es)»: hito $x inexistente") } } } }
  return $e
}

if ($ActualizarRecorrido) {
  $nuevo = Recorrido-DesdeDocumento
  $err = Comprobar-Recorrido ($nuevo | ConvertTo-Json -Depth 20 | ConvertFrom-Json -Depth 20)
  if ($err.Count) { throw "El documento 96 no da un recorrido válido:`n  " + ($err -join "`n  ") }
  if (Test-Path $rutaRec) { $ant = Get-Content $rutaRec -Raw -Encoding utf8 | ConvertFrom-Json -Depth 20; $nuevo.version_recorrido = $ant.version_recorrido }
  [IO.File]::WriteAllText($rutaRec, ($nuevo | ConvertTo-Json -Depth 20) + "`n", [Text.UTF8Encoding]::new($false))
  "recorrido: $rutaRec actualizado desde el documento 96 (versión $($nuevo.version_recorrido); si cambian hitos o prioridades, suba la versión)"
}

foreach ($f in $plantilla, $Datos, $rutaRec, $rutaEjB) { if (-not (Test-Path $f)) { throw "No se encuentra $f (recorrido.json se crea con -ActualizarRecorrido)" } }
$r = Get-Content $rutaRec -Raw -Encoding utf8 | ConvertFrom-Json -Depth 20
$errores = [Collections.Generic.List[string]]::new()
foreach ($x in (Comprobar-Recorrido $r)) { $errores.Add("recorrido: $x") }

# ---- recorrido.json debe coincidir con el documento 96 (ES/EN)
if ((Test-Path $doc.es) -and (Test-Path $doc.en)) {
  $delDoc = (Recorrido-DesdeDocumento) | ConvertTo-Json -Depth 20 | ConvertFrom-Json -Depth 20
  $delDoc.version_recorrido = $r.version_recorrido; $delDoc.origen = $r.origen
  if (($delDoc | ConvertTo-Json -Depth 20 -Compress) -cne ($r | ConvertTo-Json -Depth 20 -Compress)) {
    $errores.Add('recorrido.json no coincide con el documento 96 (ES/EN): ejecute build_recorrido.ps1 -ActualizarRecorrido y revise si procede subir la versión del recorrido')
  }
} else { $errores.Add('no se encuentra el documento 96 en ES y EN: no se puede comprobar recorrido.json') }

# ---- las preguntas del documento 11 que acreditan cada hito existen en el cuestionario de T15
if (Test-Path $rutaCuest11) {
  $c11 = Get-Content $rutaCuest11 -Raw -Encoding utf8 | ConvertFrom-Json -Depth 20
  $p11 = @{}; foreach ($dd in $c11.dimensiones) { foreach ($p in $dd.preguntas) { $p11[$p.codigo] = $true } }
  foreach ($h in $r.hitos) { foreach ($q in @($h.preguntas11)) { if (-not $p11[$q]) { $errores.Add("$($h.codigo): la pregunta $q no existe en el cuestionario del documento 11 (T15)") } } }
} else { $errores.Add("no se encuentra $rutaCuest11 para comprobar las preguntas del documento 11") }

# ---- comprobaciones de los datos (demostración y segundo ejemplo)
$preg = @{}; foreach ($q in $r.preguntas) { $preg[$q.codigo] = $q }
$hitosOk = @{}; foreach ($h in $r.hitos) { $hitosOk[$h.codigo] = $true }
foreach ($ruta in $Datos, $rutaEjB) {
  $n = Split-Path $ruta -Leaf
  $d = Get-Content $ruta -Raw -Encoding utf8 | ConvertFrom-Json -Depth 32
  foreach ($k in 'version_esquema', 'meta', 'respuestas') { if ($null -eq $d.$k) { throw "${n}: falta la clave «$k»" } }
  foreach ($pr in $d.respuestas.PSObject.Properties) {
    $q = $preg[$pr.Name]; if (-not $q) { $errores.Add("${n}: pregunta inexistente $($pr.Name)"); continue }
    $claves = @($q.respuestas | ForEach-Object clave)
    foreach ($v in @($pr.Value.v)) { if ($null -ne $v -and $v -notin $claves) { $errores.Add("${n} $($pr.Name): respuesta «$v» no válida ($($claves -join ', '))") } }
    if (-not $q.multiple -and @($pr.Value.v).Count -gt 1) { $errores.Add("${n} $($pr.Name): varias respuestas en una pregunta de respuesta única") }
    if ($pr.Value.fuente -and $pr.Value.fuente -notin 'manual', 't01') { $errores.Add("${n} $($pr.Name): fuente «$($pr.Value.fuente)» no válida (manual o t01)") }
  }
  if ($d.hitos) { foreach ($pr in $d.hitos.PSObject.Properties) {
    if (-not $hitosOk[$pr.Name]) { $errores.Add("${n}: hito inexistente $($pr.Name)"); continue }
    if ($pr.Value.estado -and $pr.Value.estado -notin 'pendiente', 'en_curso', 'cumplido', 'convalidado') { $errores.Add("${n} $($pr.Name): estado «$($pr.Value.estado)» no válido") } } }
}
if ($errores.Count) { throw "Fuentes de T23 incoherentes:`n  " + ($errores -join "`n  ") }

# ---- construcción
$html = [IO.File]::ReadAllText($plantilla)
foreach ($m in '__RECORRIDO__', '__DATOS_DEMO__', '__EJEMPLO_B__', '__DATOS_LOCALES__') { if (([regex]::Matches($html, $m)).Count -ne 1) { throw "La plantilla debe contener una sola vez la marca $m" } }
$html = $html.Replace('__RECORRIDO__', (Compactar $rutaRec)).Replace('__DATOS_DEMO__', (Compactar $Datos)).Replace('__EJEMPLO_B__', (Compactar $rutaEjB))
# módulo común de datos locales (D103): se incrusta para que la herramienta siga siendo un solo fichero
$comun = Join-Path (Join-Path (Join-Path $aqui '..') '_comun') 'datos_locales.js'
if (-not (Test-Path $comun)) { throw "No se encuentra $comun" }
$html = $html.Replace('__DATOS_LOCALES__', [IO.File]::ReadAllText($comun))
$html = $html.Replace('<!doctype html>', "<!doctype html>`n<!-- GENERADO por build_recorrido.ps1 desde _fuentes/recorrido.plantilla.html, recorrido.json, $(Split-Path $Datos -Leaf) y ejemplo_pp_b.json. No editar a mano. -->")
[IO.File]::WriteAllText($Salida, $html, [Text.UTF8Encoding]::new($false))
"recorrido:    $Salida ($([math]::Round((Get-Item $Salida).Length / 1KB)) KB)"
"documento 96: v$($r.version_recorrido) · $(@($r.arquetipos).Count) arquetipos · $(@($r.modificadores).Count) modificadores · $(@($r.preguntas).Count) preguntas · $(@($r.etapas).Count) etapas · $(@($r.hitos).Count) hitos · $(@($r.roles).Count) roles"
"datos:        $(Split-Path $Datos -Leaf) y ejemplo_pp_b.json"
