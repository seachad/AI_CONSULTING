<#
  T14 · Calculadora del índice de transformación · construcción de indice.html desde sus fuentes.

  Uso:          pwsh -File SEVEN-G/herramientas/T14_indice_transformacion/build_indice.ps1 [-Datos <t14.json>] [-Salida <fichero.html>]

  Fuentes:      _fuentes/indice.plantilla.html   aplicación (HTML, CSS y JavaScript) sin datos; es lo único que se edita a mano
                datos_demo.json                  umbrales de referencia del documento 12 (versión 0.1) y cálculos de ejemplo (ficticios)
  Salida:       indice.html                      un solo fichero, sin servidor ni dependencias. NUNCA se edita a mano.

  Mismo patrón que T01 (D43): los datos viven en JSON y el HTML se genera incrustándolos. Con -Datos se construye una
  calculadora que arranca con otro fichero de T14 (por ejemplo, el exportado por una organización).
  El script comprueba que el fichero tiene umbrales completos y que cada cálculo usa una versión de umbrales que existe.
#>
param(
  [string]$Datos,
  [string]$Salida
)
$ErrorActionPreference = 'Stop'
$aqui = $PSScriptRoot
if (-not $Datos)  { $Datos  = Join-Path $aqui 'datos_demo.json' }
if (-not $Salida) { $Salida = Join-Path $aqui 'indice.html' }
$plantilla = Join-Path $aqui '_fuentes/indice.plantilla.html'
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
foreach ($k in 'version_esquema', 'meta', 'umbrales', 'calculos') { if ($null -eq $d.$k) { throw "$(Split-Path $Datos -Leaf): falta la clave «$k»" } }
$grupos = @{ base = 'b1_min', 'b2_min', 'b3_min'; s1 = 'sin_clasificar_max', 't2', 't3', 'transformar_min'; s2 = 't2', 't3', 'iniciativas_min'; s3 = 't2', 't3', 'reasignada_min'
             s4 = 't2', 't3', 'sin_verificacion_max'; s5 = 't2', 't3', 'unidades_min'; s6 = 't2', 't3'; s7 = 'cr2', 'cr3', 'tr3_max', 'resultado_min', 'tasa_referencia'
             s8 = 'revisiones_min', 'decisiones_min'; perfil = 'suma_min', 'cobertura_min', 'd2_transformar_min'; sobredeclaracion = 'cartera', 'transformar' }
$errores = [Collections.Generic.List[string]]::new()
$versiones = @{}
foreach ($u in $d.umbrales) {
  if ($versiones[$u.version]) { $errores.Add("versión de umbrales repetida: $($u.version)") }; $versiones[$u.version] = $true
  foreach ($g in $grupos.Keys) { foreach ($p in $grupos[$g]) { if ($null -eq $u.parametros.$g.$p) { $errores.Add("umbrales v$($u.version): falta $g.$p") } } }
}
$ids = @{}
foreach ($c in $d.calculos) {
  if ($ids[$c.id]) { $errores.Add("cálculo repetido: $($c.id)") }; $ids[$c.id] = $true
  if (-not $versiones[$c.version_umbrales]) { $errores.Add("cálculo $($c.id): versión de umbrales inexistente ($($c.version_umbrales))") }
  if ($c.fecha_corte -notmatch '^\d{4}-\d{2}-\d{2}$') { $errores.Add("cálculo $($c.id): fecha de corte no válida") }
}
if ($errores.Count) { throw "Datos de T14 incoherentes:`n  " + ($errores -join "`n  ") }

# ---- construcción
$html = [IO.File]::ReadAllText($plantilla)
if (([regex]::Matches($html, '__DATOS_DEMO__')).Count -ne 1) { throw 'La plantilla debe contener una sola vez la marca __DATOS_DEMO__' }
$html = $html.Replace('__DATOS_DEMO__', (Compactar $Datos))
$html = $html.Replace('<!doctype html>', "<!doctype html>`n<!-- GENERADO por build_indice.ps1 desde _fuentes/indice.plantilla.html y $(Split-Path $Datos -Leaf). No editar a mano. -->")
[IO.File]::WriteAllText($Salida, $html, [Text.UTF8Encoding]::new($false))
"índice:     $Salida ($([math]::Round((Get-Item $Salida).Length / 1KB)) KB)"
"datos:      $(Split-Path $Datos -Leaf) · $($d.umbrales.Count) versiones de umbrales · $($d.calculos.Count) cálculos"
