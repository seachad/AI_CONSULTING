<#
  T14 · Calculadora del índice de transformación · construcción de indice.html desde sus fuentes.

  Uso:          pwsh -File SEVEN-G/herramientas/T14_indice_transformacion/build_indice.ps1 [-Datos <t14.json>] [-Salida <fichero.html>]

  Fuentes:      _fuentes/indice.plantilla.html   aplicación (HTML, CSS y JavaScript) sin datos; es lo único que se edita a mano
                datos_demo.json                  umbrales de referencia del documento 12 (versión 0.1) y cálculos de ejemplo (ficticios)
  Salida:       indice.html                      un solo fichero, sin servidor ni dependencias. NUNCA se edita a mano.

  Mismo patrón que T01 (D43): los datos viven en JSON y el HTML se genera incrustándolos. Con -Datos se construye una
  calculadora que arranca con otro fichero de T14 (por ejemplo, el exportado por una organización).
  El script comprueba que el fichero tiene umbrales completos y que cada cálculo usa una versión de umbrales que existe.

  Cálculo desde un registro T01 sin abrir el navegador (D71):
                pwsh -File build_indice.ps1 -DesdeT01 <registro_T01.json> -Exportar <t14.json>
                Abre la calculadora en Edge sin ventana, crea el cálculo a la fecha de referencia del registro con los umbrales vigentes
                y escribe el JSON de T14 con su resultado (perfil, señales, alertas y qué movería el perfil). Es la entrada opcional
                del bloque del índice en el panel del consejo (T17: t01_a_panel.py --indice).
#>
param(
  [string]$Datos,
  [string]$Salida,
  [string]$DesdeT01,
  [string]$Exportar
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
# módulo común de datos locales (D103): se incrusta para que la herramienta siga siendo un solo fichero
$comun = Join-Path $aqui '..\_comun\datos_locales.js'
if (-not (Test-Path $comun)) { throw "No se encuentra $comun" }
if (([regex]::Matches($html, '__DATOS_LOCALES__')).Count -ne 1) { throw 'La plantilla debe contener una sola vez la marca __DATOS_LOCALES__' }
$html = $html.Replace('__DATOS_LOCALES__', [IO.File]::ReadAllText($comun))
$html = $html.Replace('<!doctype html>', "<!doctype html>`n<!-- GENERADO por build_indice.ps1 desde _fuentes/indice.plantilla.html y $(Split-Path $Datos -Leaf). No editar a mano. -->")
[IO.File]::WriteAllText($Salida, $html, [Text.UTF8Encoding]::new($false))
"índice:     $Salida ($([math]::Round((Get-Item $Salida).Length / 1KB)) KB)"
"datos:      $(Split-Path $Datos -Leaf) · $($d.umbrales.Count) versiones de umbrales · $($d.calculos.Count) cálculos"

# ---- cálculo desde un registro T01 con la propia calculadora (Edge sin ventana y un servidor local de un solo uso)
if ($DesdeT01) {
  if (-not $Exportar) { throw 'Con -DesdeT01 hace falta -Exportar <fichero.json>' }
  if (-not (Test-Path $DesdeT01)) { throw "No se encuentra $DesdeT01" }
  $null = Get-Content $DesdeT01 -Raw -Encoding utf8 | ConvertFrom-Json -Depth 64
  $edge = @("${env:ProgramFiles(x86)}\Microsoft\Edge\Application\msedge.exe", "$env:ProgramFiles\Microsoft\Edge\Application\msedge.exe") | Where-Object { Test-Path $_ } | Select-Object -First 1
  if (-not $edge) { throw 'Hace falta Microsoft Edge para calcular desde T01' }
  $js = @'
setTimeout(function(){ try{
  const reg=JSON.parse(document.getElementById('t01-cli').textContent), m=reg.meta||{}, f=m.fecha_referencia||hoy(), d=desdeT01(reg,f);
  const c={id:'IDX-'+f.slice(0,7), fecha_corte:f, tipo:'seguimiento', version_umbrales:D.umbrales[D.umbrales.length-1].version, origen:'t01', entradas:d.entradas, de_t01:d.de_t01, t01:{organizacion:m.organizacion||null, fecha:f, iniciativas:reg.iniciativas.length}, notas:t('t01_nota',{f:fF(f)}), acciones:''};
  c.resultado=resultadoExport(c);
  const out={version_esquema:VERSION_ESQUEMA, herramienta:'T14', meta:{organizacion:m.organizacion||null, moneda:m.moneda||'EUR', datos_ilustrativos:!!m.datos_ilustrativos, origen:'Calculado con build_indice.ps1 desde el registro T01 (esquema '+reg.version_esquema+')', aviso_legal:TX.es.legal_txt}, umbrales:[umbral(c.version_umbrales)], calculos:[c]};
  fetch('/resultado',{method:'POST',body:JSON.stringify(out,null,1)});
}catch(e){ fetch('/resultado',{method:'POST',body:'ERROR '+e.message}); } }, 300);
'@
  $pagina = $html.Replace('</body>', "<script type=`"application/json`" id=`"t01-cli`">$(Compactar $DesdeT01)</script><script>$js</script></body>")
  $perfil = Join-Path ([IO.Path]::GetTempPath()) ('t14_edge_' + [Guid]::NewGuid().ToString('N').Substring(0, 8))
  $puerto = Get-Random -Minimum 20000 -Maximum 40000
  $http = [System.Net.HttpListener]::new(); $http.Prefixes.Add("http://localhost:$puerto/"); $http.Start()
  $proc = Start-Process -FilePath $edge -ArgumentList '--headless=new', '--disable-gpu', '--no-first-run', "--user-data-dir=$perfil", '--virtual-time-budget=6000', "http://localhost:$puerto/?lang=es" -PassThru -WindowStyle Hidden
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
  if (-not $res) { throw 'El navegador no ha devuelto el cálculo' }
  if ($res.StartsWith('ERROR')) { throw "Error en la calculadora: $res" }
  [IO.File]::WriteAllText($Exportar, $res.Replace("`r`n", "`n") + "`n", [Text.UTF8Encoding]::new($false))
  $r = ($res | ConvertFrom-Json).calculos[0].resultado
  "exportado: $Exportar · perfil $($r.perfil_asignado)$(if ($r.perfil_subyacente) { " (subyacente $($r.perfil_subyacente))" }) · suma $($r.suma) · cobertura $($r.cobertura)/8"
}
