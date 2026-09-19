<#
  T15 · Diagnóstico de madurez · construcción de madurez.html desde sus fuentes.

  Uso:          pwsh -File SEVEN-G/herramientas/T15_diagnostico_madurez/build_madurez.ps1 [-Datos <t15.json>] [-Salida <fichero.html>] [-ActualizarCuestionario]

  Fuentes:      _fuentes/madurez.plantilla.html   aplicación (HTML, CSS y JavaScript) sin datos; es lo único que se edita a mano
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
  [switch]$ActualizarCuestionario
)
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

if ($ActualizarCuestionario) {
  $nuevo = Cuestionario-DesdeDocumento
  $err = Comprobar-Cuestionario ($nuevo | ConvertTo-Json -Depth 20 | ConvertFrom-Json -Depth 20)
  if ($err.Count) { throw "El documento 11 no da un cuestionario válido:`n  " + ($err -join "`n  ") }
  if (Test-Path $rutaCuest) { $ant = Get-Content $rutaCuest -Raw -Encoding utf8 | ConvertFrom-Json -Depth 20; $nuevo.version_cuestionario = $ant.version_cuestionario }
  [IO.File]::WriteAllText($rutaCuest, ($nuevo | ConvertTo-Json -Depth 20) + "`n", [Text.UTF8Encoding]::new($false))
  "cuestionario: $rutaCuest actualizado desde el documento 11 (versión $($nuevo.version_cuestionario); si han cambiado preguntas o niveles, suba la versión)"
}

foreach ($f in $plantilla, $Datos, $rutaCuest) { if (-not (Test-Path $f)) { throw "No se encuentra $f" } }
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
}
if ($errores.Count) { throw "Fuentes de T15 incoherentes:`n  " + ($errores -join "`n  ") }

# ---- construcción
$html = [IO.File]::ReadAllText($plantilla)
foreach ($m in '__CUESTIONARIO__', '__DATOS_DEMO__') { if (([regex]::Matches($html, $m)).Count -ne 1) { throw "La plantilla debe contener una sola vez la marca $m" } }
$html = $html.Replace('__CUESTIONARIO__', (Compactar $rutaCuest)).Replace('__DATOS_DEMO__', (Compactar $Datos))
$html = $html.Replace('<!doctype html>', "<!doctype html>`n<!-- GENERADO por build_madurez.ps1 desde _fuentes/madurez.plantilla.html, cuestionario.json y $(Split-Path $Datos -Leaf). No editar a mano. -->")
[IO.File]::WriteAllText($Salida, $html, [Text.UTF8Encoding]::new($false))
"madurez:      $Salida ($([math]::Round((Get-Item $Salida).Length / 1KB)) KB)"
"cuestionario: v$($c.version_cuestionario) · $($c.dimensiones.Count) dimensiones · $(($c.dimensiones | ForEach-Object { @($_.preguntas).Count } | Measure-Object -Sum).Sum) preguntas"
"datos:        $(Split-Path $Datos -Leaf) · $($d.evaluaciones.Count) evaluaciones"
