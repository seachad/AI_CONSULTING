<#
  T01 · Registro de iniciativas · construcción de registro.html desde sus fuentes JSON.

  Uso:          pwsh -File SEVEN-G/herramientas/T01_registro_iniciativas/build_registro.ps1 [-Datos <registro.json>] [-Salida <fichero.html>]

  Fuentes:      _fuentes/registro.plantilla.html   aplicación (HTML, CSS y JavaScript) sin datos; es lo único que se edita a mano
                catalogo_criterios.json            catálogo de criterios de gate del documento 21 (ES/EN), un criterio por línea
                datos_demo.json                    registro de demostración (ficticio) con el que se abre la herramienta
  Salida:       registro.html                      un solo fichero, sin servidor ni dependencias. NUNCA se edita a mano.

  Patrón (el mismo del panel del consejo, T17): los datos viven en JSON y el HTML se genera incrustándolos, para que funcione
  abriendo el fichero desde el disco. Con -Datos se construye un registro que arranca con otro JSON (por ejemplo, el registro
  exportado por una organización) en lugar de la demostración.

  El script valida que los JSON se pueden leer, que el catálogo tiene códigos únicos y que cada iniciativa, evento y decisión
  del registro apunta a entidades que existen. No modifica las fuentes.
#>
param(
  [string]$Datos,
  [string]$Salida
)
$ErrorActionPreference = 'Stop'
$aqui = $PSScriptRoot
if (-not $Datos)  { $Datos  = Join-Path $aqui 'datos_demo.json' }
if (-not $Salida) { $Salida = Join-Path $aqui 'registro.html' }
$plantilla = Join-Path $aqui '_fuentes/registro.plantilla.html'
$catalogo  = Join-Path $aqui 'catalogo_criterios.json'
foreach ($f in $plantilla, $catalogo, $Datos) { if (-not (Test-Path $f)) { throw "No se encuentra $f" } }

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
$cat = Get-Content $catalogo -Raw | ConvertFrom-Json
$dup = $cat | Group-Object c | Where-Object Count -gt 1
if ($dup) { throw "catalogo_criterios.json: códigos repetidos: $($dup.Name -join ', ')" }
$reg = Get-Content $Datos -Raw | ConvertFrom-Json -Depth 64
foreach ($k in 'version_esquema', 'meta', 'personas', 'iniciativas', 'eventos', 'decisiones_gate', 'condiciones', 'evidencias', 'valores') {
  if ($null -eq $reg.$k) { throw "$(Split-Path $Datos -Leaf): falta la clave «$k» (no es un registro completo de T01)" }
}
$ids = @{}; foreach ($i in $reg.iniciativas) { $ids[$i.id] = $true }
$codigos = @{}; foreach ($c in $cat) { $codigos[$c.c] = $true }
$errores = [Collections.Generic.List[string]]::new()
foreach ($e in $reg.eventos)         { if ($e.iniciativa -and -not $ids[$e.iniciativa]) { $errores.Add("evento $($e.id): iniciativa $($e.iniciativa) inexistente") } }
foreach ($v in $reg.valores)         { if (-not $ids[$v.iniciativa]) { $errores.Add("valor $($v.id): iniciativa $($v.iniciativa) inexistente") } }
foreach ($d in $reg.decisiones_gate) {
  if (-not $ids[$d.iniciativa]) { $errores.Add("decisión $($d.id): iniciativa $($d.iniciativa) inexistente") }
  foreach ($c in $d.criterios) { if (-not $codigos[$c.codigo]) { $errores.Add("decisión $($d.id): criterio $($c.codigo) no está en el catálogo") } }
}
# esquema 0.5: decisiones del consejo (documento 62) y evidencia del índice de transformación
$recs = @{}; foreach ($r in @($reg.recomendaciones)) { if ($r) { $recs[$r.id] = $true } }
$pers = @{}; foreach ($p in $reg.personas) { $pers[$p.id] = $true }
foreach ($d in @($reg.decisiones_consejo)) {
  if (-not $d) { continue }
  foreach ($i in @($d.iniciativas)) { if ($i -and -not $ids[$i]) { $errores.Add("decisión del consejo $($d.id): iniciativa $i inexistente") } }
  foreach ($r in @($d.recomendaciones)) { if ($r -and -not $recs[$r]) { $errores.Add("decisión del consejo $($d.id): recomendación $r inexistente") } }
}
foreach ($i in $reg.iniciativas) { foreach ($k in 'itp2', 'itp3') { $v = $i.indice.$k; if ($v -and $v.verificador -and -not $pers[$v.verificador]) { $errores.Add("$($i.id): indice.$k.verificador $($v.verificador) inexistente") } } }
if ($errores.Count) { throw "Registro incoherente:`n  " + (($errores | Select-Object -First 20) -join "`n  ") }

# ---- construcción
$html = [IO.File]::ReadAllText($plantilla)
foreach ($marca in '__CATALOGO_CRITERIOS__', '__DATOS_DEMO__') {
  if (([regex]::Matches($html, [regex]::Escape($marca))).Count -ne 1) { throw "La plantilla debe contener una sola vez la marca $marca" }
}
# el registro enlaza al panel del consejo de ejemplo (T17): si el motor cambia de versión, el nombre del fichero cambia con él
if ($html -match "const PANEL_DEMO = '([^']+)'") {
  $panelDemo = Join-Path $aqui $Matches[1]
  if (-not (Test-Path $panelDemo)) { Write-Warning "El panel de ejemplo enlazado no existe: $($Matches[1]). Regenerarlo (uv run python t01_a_panel.py en T17_panel_consejo) o actualizar PANEL_DEMO en la plantilla." }
} else { throw 'La plantilla no define PANEL_DEMO' }
$html = $html.Replace('__CATALOGO_CRITERIOS__', (Compactar $catalogo)).Replace('__DATOS_DEMO__', (Compactar $Datos))
# módulo común de datos locales y conector T01 → panel en JavaScript (D101): se incrustan para que la herramienta siga siendo un solo fichero
$comun = Join-Path $aqui '..\_comun\datos_locales.js'
$conector = Join-Path $aqui '..\T17_panel_consejo\t01_a_panel.js'
$configPanel = Join-Path $aqui '..\T17_panel_consejo\config_panel.json'
foreach ($f in $comun, $conector, $configPanel) { if (-not (Test-Path $f)) { throw "No se encuentra $f" } }
foreach ($marca in '__DATOS_LOCALES__', '__CONECTOR_T17__', '__CONFIG_PANEL__') { if (([regex]::Matches($html, $marca)).Count -ne 1) { throw "La plantilla debe contener una sola vez la marca $marca" } }
$html = $html.Replace('__DATOS_LOCALES__', [IO.File]::ReadAllText($comun)).Replace('__CONECTOR_T17__', [IO.File]::ReadAllText($conector)).Replace('__CONFIG_PANEL__', (Compactar $configPanel))
$html = $html.Replace('<!doctype html>', "<!doctype html>`n<!-- GENERADO por build_registro.ps1 desde _fuentes/registro.plantilla.html, catalogo_criterios.json y $(Split-Path $Datos -Leaf). No editar a mano. -->")
[IO.File]::WriteAllText($Salida, $html, [Text.UTF8Encoding]::new($false))
"registro:   $Salida ($([math]::Round((Get-Item $Salida).Length / 1KB)) KB)"
"datos:      $(Split-Path $Datos -Leaf) · $($reg.iniciativas.Count) iniciativas · $($reg.eventos.Count) eventos · $($reg.decisiones_gate.Count) decisiones de gate · esquema $($reg.version_esquema)"
"catálogo:   $($cat.Count) criterios"
