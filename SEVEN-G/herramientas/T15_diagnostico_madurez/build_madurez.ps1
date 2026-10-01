<#
  T15 · Diagnóstico de madurez · construcción de madurez.html desde sus fuentes.

  Uso:          pwsh -File SEVEN-G/herramientas/T15_diagnostico_madurez/build_madurez.ps1 [-Datos <t15.json>] [-Salida <fichero.html>] [-ActualizarCuestionario]

  Fuentes:      _fuentes/madurez.plantilla.html   aplicación (HTML, CSS y JavaScript) sin datos; es lo único que se edita a mano
                lentes.json                       tres lentes, huella HT0–HT5, mínimo exigible, alertas (11 §7.6) y alcance IM1–IM4 (12 §3.7), extraído con -ActualizarLentes
                ../T01_registro_iniciativas/datos_demo.json   se incrusta un extracto para la huella y el alcance del ejemplo (-RegistroT01)
                cuestionario.json                 dimensiones, niveles, rúbricas y las 84 preguntas del documento 11 §2–§3 (ES/EN)
                datos_demo.json                   evaluaciones de ejemplo (ficticias)
  Salida:       madurez.html                      un solo fichero, sin servidor ni dependencias. NUNCA se edita a mano.

  Mismo patrón que T01 y T14 (D43, D64): los datos viven en JSON y el HTML se genera incrustándolos.
  cuestionario.json no se escribe a mano: se extrae de SEVEN-G/mds/es|en/11_SEVEN-G_Modelo_de_madurez.md con -ActualizarCuestionario.
  En cada construcción el script comprueba que cuestionario.json coincide con el documento 11 (ES/EN): si el documento cambia,
  la construcción falla hasta que se actualice el cuestionario (y, si cambian preguntas o niveles, su versión).
  Comprueba también la estructura (7 × 12 preguntas; 2-2-4-2-2 por nivel; 10 preguntas §14) y la coherencia de las evaluaciones.
#>
param(
  [string]$Datos,
  [string]$Salida,
  [switch]$ActualizarCuestionario,
  [string]$Resumen,
  [switch]$ActualizarPerfiles,
  [switch]$ActualizarLentes,
  [string]$RegistroT01
)
<#
  -ActualizarLentes (D120): regenera lentes.json desde el documento 11 §7.6 (lentes, huella tecnológica HT0–HT5, gobierno mínimo exigible por
  huella y alertas) y el documento 12 §3.7 (alcance del impacto IM1–IM4), ES/EN. En cada construcción se comprueba que coincide con los
  documentos: si cambia un umbral, una tecnología o una alerta, la construcción falla hasta regenerarlo. Los umbrales nunca se escriben en la plantilla.
  -RegistroT01 <fichero.json> (D120): registro T01 del que se incrusta un extracto mínimo (iniciativas, entradas en fase, cierres, evidencia
  del índice y tesis del consejo) para calcular la huella y el alcance cuando no hay registro en el navegador: con los datos de ejemplo de T15
  (y en -Resumen) se usa el registro de demostración de T01. Por defecto, ../T01_registro_iniciativas/datos_demo.json.
#>
<#
  -ActualizarPerfiles (D115): regenera perfiles_nist.json desde el documento 34 §5.4 y §5.5 (ES/EN). En cada construcción se comprueba que coincide
  con el documento: si cambia una subcategoría, su dimensión o sus preguntas, la construcción falla hasta regenerarlo.
#>
<#
  -Resumen <fichero.json>  (D100): además de construir la página, la abre en Edge sin ventana y escribe el resumen de todas las evaluaciones
  del fichero de datos en el formato madurez[] del esquema 0.8 de T01 (con el resumen de los perfiles NIST y, desde el 0.8, de las tres lentes: huella, alcance y alertas; D120) (el mismo fichero que exporta el botón «Exportar resumen para T01»,
  sin fecha de exportación para que sea reproducible). Es lo que el registro de demostración de T01 lleva en su lista madurez[].
#>
$ErrorActionPreference = 'Stop'
$aqui = $PSScriptRoot
if (-not $Datos)  { $Datos  = Join-Path $aqui 'datos_demo.json' }
if (-not $Salida) { $Salida = Join-Path $aqui 'madurez.html' }
$plantilla = Join-Path $aqui '_fuentes/madurez.plantilla.html'
$rutaCuest = Join-Path $aqui 'cuestionario.json'
$mds = Join-Path $aqui '..\..\mds'
$doc = @{ es = (Join-Path $mds 'es\11_SEVEN-G_Modelo_de_madurez.md'); en = (Join-Path $mds 'en\11_SEVEN-G_Modelo_de_madurez.md') }

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

# ---- lectura del documento 11 (un idioma): dimensiones, niveles, rúbricas y preguntas
function Limpiar([string]$s) { ($s -replace '\*\*([^*]+)\*\*', '$1' -replace '\*([^*]+)\*', '$1').Trim() }
function Leer-Documento([string]$ruta, [string]$idioma) {
  if (-not (Test-Path $ruta)) { throw "No se encuentra el documento 11 ($idioma): $ruta" }
  $reScope = if ($idioma -eq 'es') { '^\*\*Alcance\.\*\*\s*(.+?)\s*\*\*Se entrevista a:\*\*\s*(.+)$' } else { '^\*\*Scope\.\*\*\s*(.+?)\s*\*\*Interviewees:\*\*\s*(.+)$' }
  $r = [ordered]@{ niveles = [ordered]@{}; dims = [ordered]@{} }
  $dim = $null; $seccion = ''
  foreach ($l in [IO.File]::ReadAllLines($ruta)) {
    if ($l -match '^## (\d+)\.') { $seccion = $Matches[1]; $dim = $null; continue }
    if ($l -match '^### 3\.\d+ (D\d) · (.+)$') { $dim = $Matches[1]; if (-not $r.dims[$dim]) { $r.dims[$dim] = [ordered]@{} }; $r.dims[$dim].nombre_seccion = $Matches[2].Trim(); $r.dims[$dim].rubrica = [Collections.Generic.List[object]]::new(); $r.dims[$dim].preguntas = [Collections.Generic.List[object]]::new(); continue }
    if ($seccion -eq '2' -and $l -match '^\| \*\*(D\d)\*\* \| \*\*(.+?)\*\* \| (.+?) \| (.+?) \|$') {
      if (-not $r.dims[$Matches[1]]) { $r.dims[$Matches[1]] = [ordered]@{} }
      $r.dims[$Matches[1]].nombre = Limpiar $Matches[2]; $r.dims[$Matches[1]].pregunta = Limpiar $Matches[3]; $r.dims[$Matches[1]].relacion = Limpiar $Matches[4]; continue }
    if ($seccion -eq '2' -and $l -match '^\| \*\*([0-5])\*\* \| \*\*(.+?)\*\* \| (.+?) \| (.+?) \|$') {
      $r.niveles[$Matches[1]] = [ordered]@{ nombre = Limpiar $Matches[2]; descripcion = Limpiar $Matches[3]; rasgo = Limpiar $Matches[4] }; continue }
    if (-not $dim) { continue }
    if ($l -match $reScope) { $r.dims[$dim].alcance = Limpiar $Matches[1]; $r.dims[$dim].entrevistados = Limpiar ($Matches[2] -replace '\.$', ''); continue }
    if ($l -match '^\| \*\*([1-5])\*\* \| (.+?) \| (.+?) \|$') { $r.dims[$dim].rubrica.Add([ordered]@{ nivel = [int]$Matches[1]; criterios = Limpiar $Matches[2]; evidencias = Limpiar $Matches[3] }); continue }
    if ($l -match '^\| (D\d\.\d\d) \| (.+?) \| ([1-5]) \| (.+?) \|$') {
      $cod = $Matches[1]; $txt = $Matches[2]; $niv = [int]$Matches[3]; $evi = $Matches[4]
      $s14 = $txt -match '\*\*\(§14\)\*\*'; $txt = $txt -replace '\s*\*\*\(§14\)\*\*', ''
      $siA = $false; $nota = ''
      if ($txt -match '\s*\*\*\(((?:si aplica|if applicable))([^)]*)\)\*\*') { $siA = $true; $nota = $Matches[2].Trim().TrimStart(',').Trim(); $txt = $txt -replace '\s*\*\*\((?:si aplica|if applicable)[^)]*\)\*\*', '' }
      $r.dims[$dim].preguntas.Add([ordered]@{ codigo = $cod; nivel = $niv; texto = Limpiar $txt; evidencia = Limpiar $evi; s14 = [bool]$s14; si_aplica = $siA; nota = $nota })
    }
  }
  return $r
}
function Cuestionario-DesdeDocumento {
  $es = Leer-Documento $doc.es 'es'; $en = Leer-Documento $doc.en 'en'
  $bi = { param($a, $b) [ordered]@{ es = $a; en = $b } }
  $c = [ordered]@{
    version_cuestionario = '0.1'
    origen = 'Documento 11 · Modelo de madurez, §2 y §3 (versión 0.1, 16-09-2026). Extraído con build_madurez.ps1 -ActualizarCuestionario; no se edita a mano.'
    niveles = @(foreach ($k in $es.niveles.Keys) { [ordered]@{ nivel = [int]$k; nombre = (& $bi $es.niveles[$k].nombre $en.niveles[$k].nombre); descripcion = (& $bi $es.niveles[$k].descripcion $en.niveles[$k].descripcion); rasgo = (& $bi $es.niveles[$k].rasgo $en.niveles[$k].rasgo) } })
    dimensiones = @(foreach ($k in $es.dims.Keys) {
      $a = $es.dims[$k]; $b = $en.dims[$k]
      if ($a.preguntas.Count -ne $b.preguntas.Count) { throw "$k : distinto número de preguntas en ES ($($a.preguntas.Count)) y EN ($($b.preguntas.Count))" }
      [ordered]@{
        codigo = $k; nombre = (& $bi $a.nombre $b.nombre); pregunta = (& $bi $a.pregunta $b.pregunta); relacion = (& $bi $a.relacion $b.relacion)
        alcance = (& $bi $a.alcance $b.alcance); entrevistados = (& $bi $a.entrevistados $b.entrevistados)
        rubrica = @(for ($i = 0; $i -lt $a.rubrica.Count; $i++) { [ordered]@{ nivel = $a.rubrica[$i].nivel; criterios = (& $bi $a.rubrica[$i].criterios $b.rubrica[$i].criterios); evidencias = (& $bi $a.rubrica[$i].evidencias $b.rubrica[$i].evidencias) } })
        preguntas = @(for ($i = 0; $i -lt $a.preguntas.Count; $i++) {
          $p = $a.preguntas[$i]; $q = $b.preguntas[$i]
          if ($p.codigo -ne $q.codigo -or $p.nivel -ne $q.nivel -or $p.s14 -ne $q.s14 -or $p.si_aplica -ne $q.si_aplica) { throw "$($p.codigo): código, nivel o marcas distintos en ES y EN" }
          $o = [ordered]@{ codigo = $p.codigo; nivel = $p.nivel; s14 = $p.s14; si_aplica = $p.si_aplica; texto = (& $bi $p.texto $q.texto); evidencia = (& $bi $p.evidencia $q.evidencia) }
          if ($p.nota) { $o.si_aplica_nota = (& $bi $p.nota $q.nota) }
          $o })
      } })
  }
  return $c
}

# ---- comprobación de estructura del cuestionario
function Comprobar-Cuestionario($c) {
  $e = [Collections.Generic.List[string]]::new()
  if ($c.dimensiones.Count -ne 7) { $e.Add("hay $($c.dimensiones.Count) dimensiones (deben ser 7)") }
  if ($c.niveles.Count -ne 6) { $e.Add("hay $($c.niveles.Count) niveles (deben ser 6, de 0 a 5)") }
  $total = 0; $s14 = 0
  foreach ($d in $c.dimensiones) {
    $n = @($d.preguntas).Count; $total += $n
    $reparto = (1..5 | ForEach-Object { $niv = $_; @($d.preguntas | Where-Object { $_.nivel -eq $niv }).Count }) -join '-'
    if ($reparto -ne '2-2-4-2-2') { $e.Add("$($d.codigo): reparto por nivel $reparto (debe ser 2-2-4-2-2)") }
    if (@($d.rubrica).Count -ne 5) { $e.Add("$($d.codigo): la rúbrica no tiene 5 niveles") }
    foreach ($p in $d.preguntas) { if ($p.s14) { $s14++; if ($p.nivel -ne 3) { $e.Add("$($p.codigo): pregunta §14 de nivel $($p.nivel) (deben ser de nivel 3)") } }
      foreach ($k in 'texto', 'evidencia') { foreach ($l in 'es', 'en') { if (-not $p.$k.$l) { $e.Add("$($p.codigo): falta $k.$l") } } } }
  }
  if ($total -ne 84) { $e.Add("hay $total preguntas (deben ser 84)") }
  if ($s14 -ne 10) { $e.Add("hay $s14 preguntas §14 (deben ser 10)") }
  return $e
}

# ---- perfiles NIST (D115): subcategorías del AI RMF y del CSF 2.0 con su dimensión y sus preguntas, extraídas del documento 34 §5.4 y §5.5
$rutaPerf = Join-Path $aqui 'perfiles_nist.json'
$doc34 = @{ es = (Join-Path $mds 'es\34_SEVEN-G_Mapeo_regulatorio.md'); en = (Join-Path $mds 'en\34_SEVEN-G_Mapeo_regulatorio.md') }
function Nivel-Desde([string]$celda) {
  # «D6 · D6.05, D6.12», «D7 · D7.09; D6 · D6.11», «Propia (D5)» / «Own (D5)»
  if ($celda -match '^(?:Propia|Own) \((D[1-7])\)$') { return [ordered]@{ dimension = $Matches[1]; preguntas = @(); propia = $true } }
  $dims = @([regex]::Matches($celda, '(D[1-7]) · ') | ForEach-Object { $_.Groups[1].Value })
  if (-not $dims.Count) { throw "celda de nivel no reconocida en el documento 34: «$celda»" }
  return [ordered]@{ dimension = $dims[0]; preguntas = @([regex]::Matches($celda, '\bD[1-7]\.\d\d\b') | ForEach-Object { $_.Value }); propia = $false }
}
function Leer-Perfiles([string]$ruta) {
  $t = [IO.File]::ReadAllText($ruta)
  $s54 = [regex]::Match($t, '(?ms)^### 5\.4 .*?(?=^### 5\.5 )').Value; $s55 = [regex]::Match($t, '(?ms)^### 5\.5 .*?(?=^## )').Value
  if (-not $s54 -or -not $s55) { throw "El documento 34 no tiene las secciones 5.4 y 5.5: $ruta" }
  $rmf = foreach ($m in [regex]::Matches($s54, '(?m)^\| ((GOVERN|MAP|MEASURE|MANAGE) \d+\.\d+) \| (.+?) \| (.+?) \| (.+?) \|\r?$')) { [ordered]@{ id = $m.Groups[1].Value; funcion = $m.Groups[2].Value; descripcion = $m.Groups[3].Value.Trim(); cobertura = $m.Groups[4].Value.Trim(); nivel = (Nivel-Desde $m.Groups[5].Value.Trim()) } }
  $csf = foreach ($m in [regex]::Matches($s55, '(?m)^\| (((GV|ID|PR|DE|RS|RC))\.[A-Z]{2}-\d\d) \| (.+?) \| ([123]) · ([123]) · ([123]) \| (.+?) \| (.+?) \|\r?$')) { [ordered]@{ id = $m.Groups[1].Value; funcion = $m.Groups[2].Value; descripcion = $m.Groups[4].Value.Trim(); prioridad = [ordered]@{ S = [int]$m.Groups[5].Value; D = [int]$m.Groups[6].Value; T = [int]$m.Groups[7].Value }; cobertura = $m.Groups[8].Value.Trim(); nivel = (Nivel-Desde $m.Groups[9].Value.Trim()) } }
  return [ordered]@{ rmf = @($rmf); csf = @($csf) }
}
function Perfiles-DesdeDocumento {
  $es = Leer-Perfiles $doc34.es; $en = Leer-Perfiles $doc34.en
  $bi = { param($a, $b) [ordered]@{ es = $a; en = $b } }
  $unir = { param($LA, $LB, $conPrioridad)
    if ($LA.Count -ne $LB.Count) { throw "documento 34: distinto número de subcategorías en ES ($($LA.Count)) y EN ($($LB.Count))" }
    for ($i = 0; $i -lt $LA.Count; $i++) {
      $a = $LA[$i]; $b = $LB[$i]
      if ($a.id -ne $b.id -or $a.nivel.dimension -ne $b.nivel.dimension -or (($a.nivel.preguntas) -join ',') -ne (($b.nivel.preguntas) -join ',') -or $a.nivel.propia -ne $b.nivel.propia) { throw "documento 34: la subcategoría $($a.id) no coincide en ES y EN (código, dimensión o preguntas)" }
      $o = [ordered]@{ id = $a.id; funcion = $a.funcion; dimension = $a.nivel.dimension; preguntas = @($a.nivel.preguntas); propia = [bool]$a.nivel.propia }
      if ($conPrioridad) { if (($a.prioridad | ConvertTo-Json -Compress) -ne ($b.prioridad | ConvertTo-Json -Compress)) { throw "documento 34: prioridades distintas en ES y EN para $($a.id)" }; $o.prioridad = $a.prioridad }
      $o.descripcion = (& $bi $a.descripcion $b.descripcion); $o.cobertura = (& $bi $a.cobertura $b.cobertura)
      $o } }
  return [ordered]@{
    origen = 'Documento 34 · Mapeo regulatorio, §5.4 (NIST AI RMF, 72 subcategorías) y §5.5 (NIST CSF 2.0, 48 subcategorías con prioridad alta en el Cyber AI Profile, en borrador). Extraído con build_madurez.ps1 -ActualizarPerfiles; no se edita a mano.'
    ai_rmf = @(& $unir $es.rmf $en.rmf $false)
    csf = @(& $unir $es.csf $en.csf $true)
  }
}

# ---- madurez en tres lentes (D120): lentes, huella HT0–HT5, mínimo exigible por huella y alertas (11 §7.6) y alcance IM1–IM4 (12 §3.7)
$rutaLentes = Join-Path $aqui 'lentes.json'
$doc12 = @{ es = (Join-Path $mds 'es\12_SEVEN-G_Indice_de_transformacion.md'); en = (Join-Path $mds 'en\12_SEVEN-G_Indice_de_transformacion.md') }
$codAlertas = @('adopcion_por_delante', 'gobierno_sin_uso', 'transformacion_sin_personas')
function Celdas([string]$fila) { $c = $fila.Trim(); $c = $c.Substring(1, $c.Length - 2); return @($c -split '\|' | ForEach-Object { $_.Trim() }) }
function Sin-Marcas([string]$s) { return (Limpiar ($s -replace '`', '')) }
function Leer-Lentes([string]$ruta11, [string]$ruta12) {
  foreach ($r in $ruta11, $ruta12) { if (-not (Test-Path $r)) { throw "No se encuentra $r" } }
  $t = [IO.File]::ReadAllText($ruta11) -replace "`r`n", "`n"
  $sec = [regex]::Match($t, '(?ms)^### 7\.6 .*?(?=^## )').Value
  if (-not $sec) { throw "El documento 11 no tiene la sección 7.6: $ruta11" }
  $partes = [regex]::Split($sec, '(?m)^#### .*$')
  if ($partes.Count -ne 4) { throw "documento 11 §7.6: se esperaban tres subsecciones (huella, mínimo exigible y alertas) y hay $($partes.Count - 1)" }
  $filas = { param($txt) @([regex]::Matches($txt, '(?m)^\|.*\|$') | ForEach-Object { $_.Value } | Where-Object { $_ -notmatch '^\|[-| ]+\|$' } | Select-Object -Skip 1) }
  $lentes = @(foreach ($f in (& $filas $partes[0])) { $c = Celdas $f; if ($c.Count -ne 5 -or $c[0] -notmatch '^\*\*([1-3]) · (.+)\*\*$') { continue }; [ordered]@{ lente = [int]$Matches[1]; nombre = $Matches[2]; pregunta = (Sin-Marcas $c[1]); escala = (Sin-Marcas $c[2]); obtiene = (Sin-Marcas $c[4]) } })
  $huella = @(foreach ($f in (& $filas $partes[1])) { $c = Celdas $f; if ($c.Count -ne 4 -or $c[0] -notmatch '^\*\*(HT[0-5])\*\*$') { throw "documento 11 §7.6, huella: fila no reconocida «$f»" }
    $tec = @([regex]::Matches($c[3], '`([a-z_]+)`') | ForEach-Object { $_.Groups[1].Value })
    $o = [ordered]@{ nivel = $Matches[1]; n = [int]$Matches[1].Substring(2); nombre = (Sin-Marcas $c[1]); que = (Sin-Marcas $c[2]); tecnologia_txt = (Sin-Marcas $c[3]); tecnologias = $tec }
    if ($c[3] -match '`agente`[^`]*?\b(A[0-3])\b[^`]*?\b(A[0-3])\b') { $o.agente_autonomia = @($Matches[1], $Matches[2]) }
    $o })
  $mt = @(& $filas $partes[2]); $cab = Celdas ([regex]::Match($partes[2], '(?m)^\|.*\|$').Value)
  $dims = @($cab | Select-Object -Skip 1); foreach ($d in $dims) { if ($d -notmatch '^D[1-7]$') { throw "documento 11 §7.6, mínimo exigible: columna no reconocida «$d»" } }
  $minimos = @(foreach ($f in $mt) { $c = Celdas $f; if ($c[0] -notmatch '^\*\*(HT[0-5])\*\*$' -or $c.Count -ne $dims.Count + 1) { throw "documento 11 §7.6, mínimo exigible: fila no reconocida «$f»" }
    $o = [ordered]@{ huella = $Matches[1] }; for ($i = 0; $i -lt $dims.Count; $i++) { $v = $c[$i + 1]; $o[$dims[$i]] = if ($v -match '^[0-5]$') { [int]$v } elseif ($v -match '^[—–-]$') { $null } else { throw "documento 11 §7.6, mínimo exigible: valor no reconocido «$v»" } }; $o })
  $alertas = @(foreach ($f in (& $filas $partes[3])) { $c = Celdas $f; if ($c.Count -ne 4 -or $c[0] -notmatch '^\*\*(.+)\*\*$') { continue }; [ordered]@{ nombre = $Matches[1]; cuando = (Sin-Marcas $c[1]); gravedad_txt = (Sin-Marcas $c[2]); pide = (Sin-Marcas $c[3]) } })
  $t12 = [IO.File]::ReadAllText($ruta12) -replace "`r`n", "`n"
  $s37 = [regex]::Match($t12, '(?ms)^### 3\.7 .*?(?=^## |^### )').Value
  if (-not $s37) { throw "El documento 12 no tiene la sección 3.7: $ruta12" }
  $alcance = @(foreach ($f in (& $filas $s37)) { $c = Celdas $f; if ($c.Count -ne 4 -or $c[0] -notmatch '^\*\*(IM[1-4])\*\*$') { throw "documento 12 §3.7: fila no reconocida «$f»" }; [ordered]@{ nivel = $Matches[1]; nombre = (Sin-Marcas $c[1]); condicion = (Sin-Marcas $c[2]); ambicion = (Sin-Marcas $c[3]) } })
  return [ordered]@{ lentes = $lentes; huella = $huella; dims = $dims; minimos = $minimos; alertas = $alertas; alcance = $alcance }
}
# parámetros de las alertas, leídos del texto español (el inglés debe citar los mismos códigos y cifras)
function Fichas([string]$s) { return (@([regex]::Matches($s, '\b(?:HT[0-5]|IM[1-4]|D[1-7]|C[1-5]|[0-9]+)\b') | ForEach-Object { $_.Value }) -join ',') }
$numeros = @{ doce = 12; seis = 6; tres = 3; veinticuatro = 24; dieciocho = 18; nueve = 9 }
function Parametros-Alerta([int]$i, $a) {
  $g = $a.gravedad_txt
  $p = [ordered]@{ gravedad = if ($g -match '^(?i)alta') { 'alta' } elseif ($g -match '^(?i)media') { 'media' } else { throw "documento 11 §7.6: gravedad no reconocida «$g»" } }
  if ($g -match '^(?i)alta si') { $p.gravedad = 'media'; $p.alta_si = @([regex]::Matches($g, '\bD[1-7]\b') | ForEach-Object { $_.Value }) }
  switch ($i) {
    1 { if ($a.cuando -notmatch '(\d) o superior' ) { throw 'documento 11 §7.6, alerta 2: falta «N o superior»' }; $p.global_minimo = [int]$Matches[1]
        if ($a.cuando -notmatch '(HT[0-5]) o inferior') { throw 'documento 11 §7.6, alerta 2: falta «HTn o inferior»' }; $p.huella_maxima = $Matches[1]
        if ($a.cuando -notmatch '(\w+) meses después de (C[1-5])') { throw 'documento 11 §7.6, alerta 2: falta «N meses después de Cn»' }
        $p.meses = if ($Matches[1] -match '^\d+$') { [int]$Matches[1] } elseif ($numeros[$Matches[1]]) { $numeros[$Matches[1]] } else { throw "documento 11 §7.6, alerta 2: número no reconocido «$($Matches[1])»" }; $p.desde = $Matches[2] }
    2 { $p.alcance = @([regex]::Matches($a.cuando, '\bIM[1-4]\b') | ForEach-Object { $_.Value })
        if ($a.cuando -notmatch '(D[1-7]) en (\d) o menos') { throw 'documento 11 §7.6, alerta 3: falta «Dn en N o menos»' }; $p.dimension = $Matches[1]; $p.maximo = [int]$Matches[2] }
  }
  return $p
}
function Lentes-DesdeDocumento {
  $es = Leer-Lentes $doc.es $doc12.es; $en = Leer-Lentes $doc.en $doc12.en
  $bi = { param($a, $b) [ordered]@{ es = $a; en = $b } }
  foreach ($k in 'lentes', 'huella', 'minimos', 'alertas', 'alcance') { if (@($es.$k).Count -ne @($en.$k).Count) { throw "documentos 11 §7.6 / 12 §3.7: la tabla «$k» tiene $(@($es.$k).Count) filas en ES y $(@($en.$k).Count) en EN" } }
  if (@($es.lentes).Count -ne 3) { throw "documento 11 §7.6: $(@($es.lentes).Count) lentes (deben ser 3)" }
  if (@($es.huella).Count -ne 6) { throw "documento 11 §7.6: $(@($es.huella).Count) niveles de huella (deben ser 6, HT0–HT5)" }
  if (@($es.alcance).Count -ne 4) { throw "documento 12 §3.7: $(@($es.alcance).Count) niveles de alcance (deben ser 4, IM1–IM4)" }
  if (@($es.alertas).Count -ne $codAlertas.Count) { throw "documento 11 §7.6: $(@($es.alertas).Count) alertas (T15 conoce $($codAlertas.Count); añadir su código y su regla en la plantilla)" }
  if (($es.dims -join ',') -ne ($en.dims -join ',')) { throw 'documento 11 §7.6: columnas del mínimo exigible distintas en ES y EN' }
  for ($i = 0; $i -lt 6; $i++) { $a = $es.huella[$i]; $b = $en.huella[$i]
    if ($a.nivel -ne $b.nivel -or ($a.tecnologias -join ',') -ne ($b.tecnologias -join ',') -or ((@($a.agente_autonomia) -join ',') -ne (@($b.agente_autonomia) -join ','))) { throw "documento 11 §7.6: el nivel $($a.nivel) no coincide en ES y EN (código, tecnologías o autonomía)" } }
  for ($i = 0; $i -lt @($es.minimos).Count; $i++) { if (($es.minimos[$i] | ConvertTo-Json -Compress) -ne ($en.minimos[$i] | ConvertTo-Json -Compress)) { throw "documento 11 §7.6: el mínimo exigible de $($es.minimos[$i].huella) no coincide en ES y EN" } }
  for ($i = 0; $i -lt $codAlertas.Count; $i++) { $a = $es.alertas[$i]; $b = $en.alertas[$i]
    foreach ($k in 'cuando', 'gravedad_txt') { if ((Fichas $a.$k) -ne (Fichas $b.$k)) { throw "documento 11 §7.6: la alerta «$($a.nombre)» cita códigos o cifras distintos en ES ($(Fichas $a.$k)) y EN ($(Fichas $b.$k)) ($k)" } } }
  for ($i = 0; $i -lt 4; $i++) { if ($es.alcance[$i].nivel -ne $en.alcance[$i].nivel -or (Fichas $es.alcance[$i].condicion) -ne (Fichas $en.alcance[$i].condicion)) { throw "documento 12 §3.7: el nivel $($es.alcance[$i].nivel) no coincide en ES y EN" } }
  $tecValidas = 'ml_predictivo', 'ia_generativa', 'agente', 'lenguaje_documentos', 'vision', 'optimizacion', 'ia_terceros_embebida', 'reglas'
  foreach ($h in $es.huella) { foreach ($x in $h.tecnologias) { if ($x -notin $tecValidas) { throw "documento 11 §7.6: tecnología «$x» inexistente en el esquema de T01" } } }
  return [ordered]@{
    origen = 'Documento 11 · Modelo de madurez, §7.6 (lentes, huella tecnológica HT0–HT5, gobierno mínimo exigible por huella y alertas) y documento 12 · Índice de transformación, §3.7 (alcance del impacto IM1–IM4). Extraído con build_madurez.ps1 -ActualizarLentes; no se edita a mano.'
    lentes = @(for ($i = 0; $i -lt 3; $i++) { $a = $es.lentes[$i]; $b = $en.lentes[$i]; [ordered]@{ lente = $a.lente; nombre = (& $bi $a.nombre $b.nombre); pregunta = (& $bi $a.pregunta $b.pregunta); escala = (& $bi $a.escala $b.escala); obtiene = (& $bi $a.obtiene $b.obtiene) } })
    huella = @(for ($i = 0; $i -lt 6; $i++) { $a = $es.huella[$i]; $b = $en.huella[$i]
      $o = [ordered]@{ nivel = $a.nivel; n = $a.n; tecnologias = @($a.tecnologias) }; if ($a.agente_autonomia) { $o.agente_autonomia = @($a.agente_autonomia) }
      $o.nombre = (& $bi $a.nombre $b.nombre); $o.que = (& $bi $a.que $b.que); $o.tecnologia_txt = (& $bi $a.tecnologia_txt $b.tecnologia_txt); $o })
    dimensiones_minimo = @($es.dims)
    minimos = @($es.minimos)
    alertas = @(for ($i = 0; $i -lt $codAlertas.Count; $i++) { $a = $es.alertas[$i]; $b = $en.alertas[$i]
      [ordered]@{ codigo = $codAlertas[$i]; parametros = (Parametros-Alerta $i $a); nombre = (& $bi $a.nombre $b.nombre); cuando = (& $bi $a.cuando $b.cuando); gravedad = (& $bi $a.gravedad_txt $b.gravedad_txt); pide = (& $bi $a.pide $b.pide) } })
    alcance = @(for ($i = 0; $i -lt 4; $i++) { $a = $es.alcance[$i]; $b = $en.alcance[$i]; [ordered]@{ nivel = $a.nivel; nombre = (& $bi $a.nombre $b.nombre); condicion = (& $bi $a.condicion $b.condicion); ambicion = (& $bi $a.ambicion $b.ambicion) } })
  }
}
if ($ActualizarLentes) {
  $l = Lentes-DesdeDocumento
  [IO.File]::WriteAllText($rutaLentes, ($l | ConvertTo-Json -Depth 20) + "`n", [Text.UTF8Encoding]::new($false))
  "lentes: $rutaLentes actualizado desde los documentos 11 §7.6 y 12 §3.7 ($(@($l.huella).Count) niveles de huella, $(@($l.minimos).Count) filas de mínimo exigible, $(@($l.alertas).Count) alertas, $(@($l.alcance).Count) niveles de alcance)"
}

if ($ActualizarPerfiles) {
  $p = Perfiles-DesdeDocumento
  [IO.File]::WriteAllText($rutaPerf, ($p | ConvertTo-Json -Depth 20) + "`n", [Text.UTF8Encoding]::new($false))
  "perfiles: $rutaPerf actualizado desde el documento 34 ($($p.ai_rmf.Count) subcategorías del AI RMF y $($p.csf.Count) del CSF)"
}

if ($ActualizarCuestionario) {
  $nuevo = Cuestionario-DesdeDocumento
  $err = Comprobar-Cuestionario ($nuevo | ConvertTo-Json -Depth 20 | ConvertFrom-Json -Depth 20)
  if ($err.Count) { throw "El documento 11 no da un cuestionario válido:`n  " + ($err -join "`n  ") }
  if (Test-Path $rutaCuest) { $ant = Get-Content $rutaCuest -Raw -Encoding utf8 | ConvertFrom-Json -Depth 20; $nuevo.version_cuestionario = $ant.version_cuestionario }
  [IO.File]::WriteAllText($rutaCuest, ($nuevo | ConvertTo-Json -Depth 20) + "`n", [Text.UTF8Encoding]::new($false))
  "cuestionario: $rutaCuest actualizado desde el documento 11 (versión $($nuevo.version_cuestionario); si han cambiado preguntas o niveles, suba la versión)"
}

if (-not $RegistroT01) { $RegistroT01 = Join-Path $aqui '..\T01_registro_iniciativas\datos_demo.json' }
foreach ($f in $plantilla, $Datos, $rutaCuest, $rutaPerf, $rutaLentes, $RegistroT01) { if (-not (Test-Path $f)) { throw "No se encuentra $f (perfiles_nist.json se crea con -ActualizarPerfiles y lentes.json con -ActualizarLentes)" } }
$c = Get-Content $rutaCuest -Raw -Encoding utf8 | ConvertFrom-Json -Depth 20
$errores = [Collections.Generic.List[string]]::new()
foreach ($x in (Comprobar-Cuestionario $c)) { $errores.Add("cuestionario: $x") }

# ---- el cuestionario debe coincidir con el documento 11 (ES/EN)
if ((Test-Path $doc.es) -and (Test-Path $doc.en)) {
  $delDoc = (Cuestionario-DesdeDocumento) | ConvertTo-Json -Depth 20 | ConvertFrom-Json -Depth 20
  $delDoc.version_cuestionario = $c.version_cuestionario; $delDoc.origen = $c.origen
  if (($delDoc | ConvertTo-Json -Depth 20 -Compress) -cne ($c | ConvertTo-Json -Depth 20 -Compress)) {
    $errores.Add('cuestionario.json no coincide con el documento 11 (ES/EN): ejecute build_madurez.ps1 -ActualizarCuestionario y revise si procede subir la versión del cuestionario')
  }
}

# ---- los perfiles NIST deben coincidir con el documento 34 (ES/EN) y citar preguntas que existen (D115)
$perf = Get-Content $rutaPerf -Raw -Encoding utf8 | ConvertFrom-Json -Depth 20
if ((Test-Path $doc34.es) -and (Test-Path $doc34.en)) {
  $delDoc34 = (Perfiles-DesdeDocumento) | ConvertTo-Json -Depth 20 | ConvertFrom-Json -Depth 20
  if (($delDoc34 | ConvertTo-Json -Depth 20 -Compress) -cne ($perf | ConvertTo-Json -Depth 20 -Compress)) { $errores.Add('perfiles_nist.json no coincide con el documento 34 §5.4 y §5.5 (ES/EN): ejecute build_madurez.ps1 -ActualizarPerfiles') }
}
if (@($perf.ai_rmf).Count -ne 72) { $errores.Add("perfiles_nist.json: $(@($perf.ai_rmf).Count) subcategorías del AI RMF (deben ser 72)") }
if (@($perf.csf).Count -ne 48) { $errores.Add("perfiles_nist.json: $(@($perf.csf).Count) subcategorías del CSF (deben ser 48)") }
$idsPerf = @{}; $codDims = @($c.dimensiones | ForEach-Object codigo); $codPreg = @{}; foreach ($dd in $c.dimensiones) { foreach ($p in $dd.preguntas) { $codPreg[$p.codigo] = $true } }
foreach ($s in @($perf.ai_rmf) + @($perf.csf)) { $idsPerf[$s.id] = $s
  if ($s.dimension -notin $codDims) { $errores.Add("perfil $($s.id): dimensión $($s.dimension) inexistente") }
  foreach ($q in @($s.preguntas)) { if (-not $codPreg[$q]) { $errores.Add("perfil $($s.id): pregunta $q inexistente en el cuestionario") } } }

# ---- las lentes deben coincidir con los documentos 11 §7.6 y 12 §3.7 (ES/EN) (D120)
$lentesJ = Get-Content $rutaLentes -Raw -Encoding utf8 | ConvertFrom-Json -Depth 20
if ((Test-Path $doc.es) -and (Test-Path $doc.en) -and (Test-Path $doc12.es) -and (Test-Path $doc12.en)) {
  $delDocL = (Lentes-DesdeDocumento) | ConvertTo-Json -Depth 20 | ConvertFrom-Json -Depth 20
  if (($delDocL | ConvertTo-Json -Depth 20 -Compress) -cne ($lentesJ | ConvertTo-Json -Depth 20 -Compress)) { $errores.Add('lentes.json no coincide con los documentos 11 §7.6 y 12 §3.7 (ES/EN): ejecute build_madurez.ps1 -ActualizarLentes') }
}
foreach ($m in $lentesJ.minimos) { foreach ($dd in $lentesJ.dimensiones_minimo) { if ($null -ne $m.$dd -and $dd -notin $codDims) { $errores.Add("lentes.json: dimensión $dd inexistente") } } }

# ---- extracto del registro T01 para la huella y el alcance cuando no hay registro en el navegador (D120)
$r01 = Get-Content $RegistroT01 -Raw -Encoding utf8 | ConvertFrom-Json -Depth 64
if (-not $r01.meta -or $null -eq $r01.iniciativas) { throw "$(Split-Path $RegistroT01 -Leaf): no es un registro completo de T01" }
$extracto = [ordered]@{
  origen = "Extracto de $(Split-Path (Split-Path $RegistroT01 -Parent) -Leaf)/$(Split-Path $RegistroT01 -Leaf) para la huella tecnológica y el alcance del impacto (11 §7.6, 12 §3.7); lo escribe build_madurez.ps1."
  meta = [ordered]@{ organizacion = $r01.meta.organizacion; fecha_referencia = $r01.meta.fecha_referencia; datos_ilustrativos = [bool]$r01.meta.datos_ilustrativos }
  iniciativas = @(foreach ($i in $r01.iniciativas) {
    $ix = [ordered]@{}; foreach ($k in 'itp2', 'itp3') { $v = $i.indice.$k; if ($v) { $ix[$k] = [ordered]@{ estado = $v.estado; fecha = $v.fecha } } }
    [ordered]@{ id = $i.id; nombre = $i.nombre; fecha_registro = $i.fecha_registro
      clasificacion = [ordered]@{ tecnologia = @($i.clasificacion.tecnologia); autonomia = $i.clasificacion.autonomia; ambicion_real = $i.clasificacion.ambicion_real }
      ciclo = [ordered]@{ fase = $i.ciclo.fase; estado = $i.ciclo.estado }; cierre = if ($i.cierre) { [ordered]@{ tipo = $i.cierre.tipo; fecha = $i.cierre.fecha } } else { $null }
      sistemas = @($i.sistemas); indice = $ix } })
  eventos = @($r01.eventos | Where-Object { $_.tipo -eq 'entrada_fase' } | ForEach-Object { [ordered]@{ id = $_.id; iniciativa = $_.iniciativa; fecha = $_.fecha; tipo = $_.tipo; fase = $_.fase } })
  decisiones_consejo = @($r01.decisiones_consejo | Where-Object { $_ } | ForEach-Object { [ordered]@{ id = $_.id; fecha = $_.fecha; asunto = $_.asunto; resultado = $_.resultado } })
}
$extractoTxt = ($extracto | ConvertTo-Json -Depth 20 -Compress).Replace('</', '<\/')

# ---- comprobaciones de los datos
$d = Get-Content $Datos -Raw -Encoding utf8 | ConvertFrom-Json -Depth 32
foreach ($k in 'version_esquema', 'meta', 'evaluaciones') { if ($null -eq $d.$k) { throw "$(Split-Path $Datos -Leaf): falta la clave «$k»" } }
$codigos = @{}; foreach ($dd in $c.dimensiones) { foreach ($p in $dd.preguntas) { $codigos[$p.codigo] = $p } }
$ids = @{}
foreach ($ev in $d.evaluaciones) {
  if ($ids[$ev.id]) { $errores.Add("evaluación repetida: $($ev.id)") }; $ids[$ev.id] = $true
  if ($ev.fecha_corte -notmatch '^\d{4}-\d{2}-\d{2}$') { $errores.Add("evaluación $($ev.id): fecha de corte no válida") }
  if ($ev.modalidad -notin 'autodiagnostico', 'verificada', 'independiente') { $errores.Add("evaluación $($ev.id): modalidad no válida ($($ev.modalidad))") }
  if ($ev.version_cuestionario -ne $c.version_cuestionario) { $errores.Add("evaluación $($ev.id): versión de cuestionario $($ev.version_cuestionario) distinta de la del cuestionario ($($c.version_cuestionario))") }
  if ($ev.pesos) { foreach ($dd in $c.dimensiones) { $w = $ev.pesos.($dd.codigo); if ($null -eq $w -or $w -le 0) { $errores.Add("evaluación $($ev.id): peso de $($dd.codigo) ausente o no positivo") } } }
  foreach ($pr in $ev.respuestas.PSObject.Properties) {
    $q = $codigos[$pr.Name]; $v = $pr.Value
    if (-not $q) { $errores.Add("evaluación $($ev.id): pregunta inexistente $($pr.Name)"); continue }
    if ($null -ne $v.r -and $v.r -notin 'si', 'parcial', 'no', 'na') { $errores.Add("evaluación $($ev.id) $($pr.Name): respuesta no válida ($($v.r))") }
    if ($v.r -eq 'na' -and -not $q.si_aplica) { $errores.Add("evaluación $($ev.id) $($pr.Name): «No aplica» en una pregunta que no lo admite") }
  }
  if ($ev.lentes_manual) {
    $hm = $ev.lentes_manual.huella; if ($hm -and $hm.nivel -and $hm.nivel -notin @($lentesJ.huella | ForEach-Object nivel)) { $errores.Add("evaluación $($ev.id): lentes_manual.huella.nivel no válido ($($hm.nivel))") }
    if ($ev.lentes_manual.alcance) { foreach ($pr in $ev.lentes_manual.alcance.PSObject.Properties) { if ($pr.Name -notin @($lentesJ.alcance | ForEach-Object nivel) -or ($null -ne $pr.Value -and $pr.Value -lt 0)) { $errores.Add("evaluación $($ev.id): lentes_manual.alcance.$($pr.Name) no válido") } } }
  }
  foreach ($grupo in 'objetivos', 'propios') {
    if (-not $ev.perfiles -or -not $ev.perfiles.$grupo) { continue }
    foreach ($pr in $ev.perfiles.$grupo.PSObject.Properties) {
      $s = $idsPerf[$pr.Name]
      if (-not $s) { $errores.Add("evaluación $($ev.id): perfiles.$grupo cita una subcategoría inexistente ($($pr.Name))"); continue }
      $n = if ($grupo -eq 'propios') { $pr.Value.nivel } else { $pr.Value }
      if ($null -ne $n -and ($n -lt 0 -or $n -gt 5)) { $errores.Add("evaluación $($ev.id): perfiles.$grupo.$($pr.Name) fuera de la escala 0–5") }
      if ($grupo -eq 'propios' -and -not $s.propia) { $errores.Add("evaluación $($ev.id): $($pr.Name) no es una subcategoría «Propia»; su nivel se deriva del cuestionario") }
    }
  }
}
if ($errores.Count) { throw "Fuentes de T15 incoherentes:`n  " + ($errores -join "`n  ") }

# ---- construcción
$html = [IO.File]::ReadAllText($plantilla)
foreach ($m in '__CUESTIONARIO__', '__DATOS_DEMO__', '__PERFILES__', '__LENTES__', '__T01_EXTRACTO__') { if (([regex]::Matches($html, $m)).Count -ne 1) { throw "La plantilla debe contener una sola vez la marca $m" } }
$html = $html.Replace('__CUESTIONARIO__', (Compactar $rutaCuest)).Replace('__DATOS_DEMO__', (Compactar $Datos)).Replace('__PERFILES__', (Compactar $rutaPerf)).Replace('__LENTES__', (Compactar $rutaLentes)).Replace('__T01_EXTRACTO__', $extractoTxt)
# módulo común de datos locales (D103): se incrusta para que la herramienta siga siendo un solo fichero
$comun = Join-Path $aqui '..\_comun\datos_locales.js'
if (-not (Test-Path $comun)) { throw "No se encuentra $comun" }
if (([regex]::Matches($html, '__DATOS_LOCALES__')).Count -ne 1) { throw 'La plantilla debe contener una sola vez la marca __DATOS_LOCALES__' }
$html = $html.Replace('__DATOS_LOCALES__', [IO.File]::ReadAllText($comun))
# ayuda de la herramienta (D123): módulo común _comun/ayuda.js y textos de _fuentes/ayuda.json (ES/EN), incrustados como el resto
$ayudaJs = Join-Path $aqui '..\_comun\ayuda.js'; $ayudaJson = Join-Path $aqui '_fuentes\ayuda.json'
foreach ($f in $ayudaJs, $ayudaJson) { if (-not (Test-Path $f)) { throw "No se encuentra $f" } }
if (([regex]::Matches($html, '__AYUDA__')).Count -ne 1) { throw 'La plantilla debe contener una sola vez la marca __AYUDA__' }
$null = [IO.File]::ReadAllText($ayudaJson) | ConvertFrom-Json   # falla aquí si el JSON de ayuda no es válido
$html = $html.Replace('__AYUDA__', 'const AYUDA_HERR = ' + [IO.File]::ReadAllText($ayudaJson).Trim().Replace('</', '<\/') + ";`n" + [IO.File]::ReadAllText($ayudaJs))
$html = $html.Replace('<!doctype html>', "<!doctype html>`n<!-- GENERADO por build_madurez.ps1 desde _fuentes/madurez.plantilla.html, cuestionario.json y $(Split-Path $Datos -Leaf). No editar a mano. -->")
[IO.File]::WriteAllText($Salida, $html, [Text.UTF8Encoding]::new($false))
"madurez:      $Salida ($([math]::Round((Get-Item $Salida).Length / 1KB)) KB)"
"cuestionario: v$($c.version_cuestionario) · $($c.dimensiones.Count) dimensiones · $(($c.dimensiones | ForEach-Object { @($_.preguntas).Count } | Measure-Object -Sum).Sum) preguntas"
"datos:        $(Split-Path $Datos -Leaf) · $($d.evaluaciones.Count) evaluaciones"

# ---- resumen para T01 con la propia herramienta (Edge sin ventana y un servidor local de un solo uso), D100
if ($Resumen) {
  $edge = @("${env:ProgramFiles(x86)}\Microsoft\Edge\Application\msedge.exe", "$env:ProgramFiles\Microsoft\Edge\Application\msedge.exe") | Where-Object { Test-Path $_ } | Select-Object -First 1
  if (-not $edge) { throw 'Hace falta Microsoft Edge para exportar el resumen' }
  $js = @'
setTimeout(function(){ try{
  const out={herramienta:'T15', version_esquema:VERSION_ESQUEMA, exportado:null, datos_ilustrativos:!!(D.meta||{}).datos_ilustrativos, organizacion:(D.meta||{}).organizacion||null,
    origen:'Resumen escrito por build_madurez.ps1 -Resumen desde '+'__DATOS__', madurez_t01:ordenadas().map(function(ev){ return resumenParaT01(ev, null); })};
  fetch('/resultado',{method:'POST',body:JSON.stringify(out,null,1)});
}catch(e){ fetch('/resultado',{method:'POST',body:'ERROR '+e.message}); } }, 300);
'@
  $js = $js.Replace('__DATOS__', (Split-Path $Datos -Leaf))
  $pagina = $html.Replace('<script type="application/json" id="cuestionario">', '<script>window.T15_USAR_T01_INCRUSTADO=true;</script><script type="application/json" id="cuestionario">').Replace('</body>', "<script>$js</script></body>")
  $perfil = Join-Path ([IO.Path]::GetTempPath()) ('t15_edge_' + [Guid]::NewGuid().ToString('N').Substring(0, 8))
  $puerto = Get-Random -Minimum 20000 -Maximum 40000
  # si el puerto elegido al azar está ocupado, se prueba con otro
  for ($intento = 0; ; $intento++) { $http = [System.Net.HttpListener]::new(); $http.Prefixes.Add("http://localhost:$puerto/"); try { $http.Start(); break } catch { $http.Close(); if ($intento -ge 9) { throw }; $puerto = Get-Random -Minimum 20000 -Maximum 40000 } }
  $sinVentana = if ($IsWindows) { @{ WindowStyle = 'Hidden' } } else { @{} }  # -WindowStyle solo existe en Windows
  $proc = Start-Process -FilePath $edge -ArgumentList '--headless=new', '--disable-gpu', '--no-first-run', "--user-data-dir=$perfil", '--virtual-time-budget=6000', "http://localhost:$puerto/?lang=es" -PassThru @sinVentana
  $res = $null; $limite = (Get-Date).AddSeconds(45)
  try {
    while (-not $res -and (Get-Date) -lt $limite) {
      $tarea = $http.GetContextAsync(); if (-not $tarea.Wait(1000)) { continue }; $ctx = $tarea.Result
      if ($ctx.Request.HttpMethod -eq 'POST') { $res = [IO.StreamReader]::new($ctx.Request.InputStream, [Text.Encoding]::UTF8).ReadToEnd(); $b = [byte[]]@() }
      elseif ($ctx.Request.Url.AbsolutePath -eq '/') { $b = [Text.Encoding]::UTF8.GetBytes($pagina); $ctx.Response.ContentType = 'text/html; charset=utf-8' }
      else { $ctx.Response.StatusCode = 404; $b = [byte[]]@() }
      $ctx.Response.ContentLength64 = $b.Length; if ($b.Length) { $ctx.Response.OutputStream.Write($b, 0, $b.Length) }; $ctx.Response.Close()
    }
  } finally { $http.Stop(); if (-not $proc.HasExited) { try { $proc.Kill() } catch {} }; Remove-Item $perfil -Recurse -Force -ErrorAction SilentlyContinue }
  if (-not $res) { throw 'El navegador no ha devuelto el resumen' }
  if ($res.StartsWith('ERROR')) { throw "Error en la herramienta: $res" }
  [IO.File]::WriteAllText($Resumen, $res.Replace("`r`n", "`n") + "`n", [Text.UTF8Encoding]::new($false))
  $m = ($res | ConvertFrom-Json).madurez_t01
  "resumen:      $Resumen · $(@($m).Count) evaluaciones · última: $($m[-1].id) nivel global $($m[-1].nivel_global)"
}
