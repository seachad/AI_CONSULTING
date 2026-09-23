<#
  T11 · Calculadora de hipótesis de valor y costes por caso (T13 como módulo) · construcción de calculadora.html desde sus fuentes.

  Uso:          pwsh -File SEVEN-G/herramientas/T11_calculadora_valor/build_calculadora.ps1 [-Datos <t11.json>] [-Salida <fichero.html>]

  Fuentes:      _fuentes/calculadora.plantilla.html   aplicación (HTML, CSS y JavaScript) sin datos; es lo único que se edita a mano
                datos_demo.json                       parámetros por ejercicio (horizonte, tasa, tolerancia, alertas, escenarios) y casos de ejemplo (ficticios)
  Salida:       calculadora.html                      un solo fichero, sin servidor ni dependencias. NUNCA se edita a mano.

  Mismo patrón que T01 y T14 (D43): los datos viven en JSON y el HTML se genera incrustándolos. Con -Datos se construye una
  calculadora que arranca con otro fichero de T11 (por ejemplo, el exportado por una organización).
  El script comprueba que cada versión de parámetros está completa, que cada caso usa una versión que existe y que cada línea de
  coste tiene un componente válido (documento 42 §12). Las líneas sin categoría se admiten (llegan así desde T01) y se avisan.
#>
param(
  [string]$Datos,
  [string]$Salida
)
$ErrorActionPreference = 'Stop'
$aqui = $PSScriptRoot
if (-not $Datos)  { $Datos  = Join-Path $aqui 'datos_demo.json' }
if (-not $Salida) { $Salida = Join-Path $aqui 'calculadora.html' }
$plantilla = Join-Path $aqui '_fuentes/calculadora.plantilla.html'
foreach ($f in $plantilla, $Datos) { if (-not (Test-Path $f)) { throw "No se encuentra $f" } }

# JSON compacto sin reinterpretar números ni escapar acentos; "</" se escapa para que no cierre el <script> que lo contiene
function Compactar([string]$ruta) {
  $doc = [System.Text.Json.JsonDocument]::Parse([IO.File]::ReadAllText($ruta))
  $ms = [IO.MemoryStream]::new()
  $op = [System.Text.Json.JsonWriterOptions]::new()
  $op.Indented = $false
  $op.Encoder = [System.Text.Encodings.Web.JavaScriptEncoder]::UnsafeRelaxedJsonEscaping
  $w = [System.Text.Json.Utf8JsonWriter]::new($ms, $op)
  $doc.WriteTo($w); $w.Flush()
  $txt = [Text.Encoding]::UTF8.GetString($ms.ToArray())
  $w.Dispose(); $ms.Dispose(); $doc.Dispose()
  return $txt.Replace('</', '<\/')
}

# ---- comprobaciones de las fuentes
$d = Get-Content $Datos -Raw -Encoding utf8 | ConvertFrom-Json -Depth 32
foreach ($k in 'version_esquema', 'meta', 'parametros', 'casos') { if ($null -eq $d.$k) { throw "$(Split-Path $Datos -Leaf): falta la clave «$k»" } }
$requeridos = 'horizonte_anios', 'tasa_descuento_pct', 'tolerancia_sin_etiquetar_pct', 'alertas_consumo.aviso_pct', 'alertas_consumo.alerta_pct', 'alertas_consumo.limite_pct',
              'alertas_consumo.anomalia_factor', 'escenarios.prudente.valor', 'escenarios.prudente.coste_recurrente', 'escenarios.prudente.inversion',
              'escenarios.favorable.valor', 'escenarios.favorable.coste_recurrente', 'escenarios.favorable.inversion'
$componentes = 'construccion', 'adopcion', 'recurrente', 'retirada'
$categorias = 'licencias', 'consumo_modelos', 'computo', 'datos', 'personas_construccion', 'personas_operacion', 'proveedores', 'control', 'adopcion'
$errores = [Collections.Generic.List[string]]::new()
$avisos = [Collections.Generic.List[string]]::new()
$versiones = @{}
foreach ($p in $d.parametros) {
  if ($versiones[$p.version]) { $errores.Add("versión de parámetros repetida: $($p.version)") }; $versiones[$p.version] = $true
  foreach ($r in $requeridos) {
    $v = $p; foreach ($parte in $r.Split('.')) { $v = if ($null -ne $v) { $v.$parte } else { $null } }
    if ($null -eq $v) { $errores.Add("parámetros v$($p.version): falta $r") }
  }
  if ($p.horizonte_anios -lt 1) { $errores.Add("parámetros v$($p.version): el horizonte debe ser de al menos 1 año") }
}
$ids = @{}
foreach ($c in $d.casos) {
  if ($ids[$c.id]) { $errores.Add("caso repetido: $($c.id)") }; $ids[$c.id] = $true
  if (-not $versiones[$c.version_parametros]) { $errores.Add("caso $($c.id): versión de parámetros inexistente ($($c.version_parametros))") }
  $i = 0
  foreach ($l in @($c.costes.lineas)) {
    $i++
    if ($null -eq $l) { continue }
    if ($l.componente -notin $componentes) { $errores.Add("caso $($c.id), coste $i («$($l.concepto)»): componente no válido ($($l.componente))") }
    if ($null -eq $l.categoria) { $avisos.Add("caso $($c.id), coste $i («$($l.concepto)»): sin categoría") }
    elseif ($l.categoria -notin $categorias) { $errores.Add("caso $($c.id), coste $i («$($l.concepto)»): categoría no válida ($($l.categoria))") }
  }
  foreach ($s in @($c.costes.compartidos)) {
    if ($null -eq $s) { continue }
    if ($s.metodo -notin 'consumo', 'inductor', 'ponderado') { $errores.Add("caso $($c.id), compartido «$($s.nombre)»: método no válido ($($s.metodo))") }
    if ($s.clave_aprobada -ne $true) { $avisos.Add("caso $($c.id), compartido «$($s.nombre)»: clave de reparto sin aprobar") }
  }
  foreach ($l in @($c.lineas)) {
    if ($null -eq $l) { continue }
    if ($l.estado -eq 'validado') { $errores.Add("caso $($c.id), línea «$($l.concepto)»: el valor esperado no se valida (documento 40 §4.1)") }
  }
}
if ($errores.Count) { throw "Datos de T11 incoherentes:`n  " + ($errores -join "`n  ") }

# ---- construcción
$html = [IO.File]::ReadAllText($plantilla)
if (([regex]::Matches($html, '__DATOS_DEMO__')).Count -ne 1) { throw 'La plantilla debe contener una sola vez la marca __DATOS_DEMO__' }
$html = $html.Replace('__DATOS_DEMO__', (Compactar $Datos))
# módulo común de datos locales (D103): se incrusta para que la herramienta siga siendo un solo fichero
$comun = Join-Path $aqui '..\_comun\datos_locales.js'
if (-not (Test-Path $comun)) { throw "No se encuentra $comun" }
if (([regex]::Matches($html, '__DATOS_LOCALES__')).Count -ne 1) { throw 'La plantilla debe contener una sola vez la marca __DATOS_LOCALES__' }
$html = $html.Replace('__DATOS_LOCALES__', [IO.File]::ReadAllText($comun))
# ayuda de la herramienta (D111): módulo común _comun/ayuda.js y textos de _fuentes/ayuda.json (ES/EN), incrustados como el resto
$ayudaJs = Join-Path $aqui '..\_comun\ayuda.js'; $ayudaJson = Join-Path $aqui '_fuentes\ayuda.json'
foreach ($f in $ayudaJs, $ayudaJson) { if (-not (Test-Path $f)) { throw "No se encuentra $f" } }
if (([regex]::Matches($html, '__AYUDA__')).Count -ne 1) { throw 'La plantilla debe contener una sola vez la marca __AYUDA__' }
$null = [IO.File]::ReadAllText($ayudaJson) | ConvertFrom-Json   # falla aquí si el JSON de ayuda no es válido
$html = $html.Replace('__AYUDA__', 'const AYUDA_HERR = ' + [IO.File]::ReadAllText($ayudaJson).Trim().Replace('</', '<\/') + ";`n" + [IO.File]::ReadAllText($ayudaJs))
$html = $html.Replace('<!doctype html>', "<!doctype html>`n<!-- GENERADO por build_calculadora.ps1 desde _fuentes/calculadora.plantilla.html y $(Split-Path $Datos -Leaf). No editar a mano. -->")
[IO.File]::WriteAllText($Salida, $html, [Text.UTF8Encoding]::new($false))
"calculadora: $Salida ($([math]::Round((Get-Item $Salida).Length / 1KB)) KB)"
"datos:       $(Split-Path $Datos -Leaf) · $($d.parametros.Count) versiones de parámetros · $($d.casos.Count) casos"
foreach ($a in $avisos) { "aviso:       $a" }
