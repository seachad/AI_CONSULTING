<#
  T17 · Conversión T01 → JSON del panel con el conector en JavaScript (t01_a_panel.js), sin Python (D101).

  Uso:   pwsh -File SEVEN-G/herramientas/T17_panel_consejo/conector_js.ps1 -T01 <registro.json> -Salida <dashboard_data.json> [-Config <config_panel.json>]

  Abre en Microsoft Edge sin ventana una página mínima con t01_a_panel.js, el registro y config_panel.json, y escribe el JSON del
  panel que devuelve el navegador (el mismo que produce t01_a_panel.py; verificar_coherencia.ps1 compara ambos con los datos de
  demostración). Sirve para regenerar dashboard_data.json en un equipo sin Python y para la prueba de paridad.
#>
param(
  [Parameter(Mandatory)][string]$T01,
  [Parameter(Mandatory)][string]$Salida,
  [string]$Config
)
$ErrorActionPreference = 'Stop'
$aqui = $PSScriptRoot
if (-not $Config) { $Config = Join-Path $aqui 'config_panel.json' }
$js = Join-Path $aqui 't01_a_panel.js'
foreach ($f in $T01, $Config, $js) { if (-not (Test-Path $f)) { throw "No se encuentra $f" } }
$edge = @("${env:ProgramFiles(x86)}\Microsoft\Edge\Application\msedge.exe", "$env:ProgramFiles\Microsoft\Edge\Application\msedge.exe") | Where-Object { Test-Path $_ } | Select-Object -First 1
if (-not $edge) { throw 'Hace falta Microsoft Edge para ejecutar el conector en JavaScript' }
$esc = { param($s) $s.Replace('</', '<\/') }
$pagina = '<!doctype html><meta charset="utf-8"><script>' + [IO.File]::ReadAllText($js) + '</script>' +
  '<script type="application/json" id="t01">' + (& $esc ([IO.File]::ReadAllText($T01))) + '</script>' +
  '<script type="application/json" id="cfg">' + (& $esc ([IO.File]::ReadAllText($Config))) + '</script>' +
  '<script>setTimeout(function(){ try{ var t01=JSON.parse(document.getElementById("t01").textContent), cfg=JSON.parse(document.getElementById("cfg").textContent);' +
  ' var d=SevengT17.convertir(t01,{config:cfg}); fetch("/resultado",{method:"POST",body:JSON.stringify(d,null,1)}); }catch(e){ fetch("/resultado",{method:"POST",body:"ERROR "+e.message}); } },100);</script>'
$perfil = Join-Path ([IO.Path]::GetTempPath()) ('t17_edge_' + [Guid]::NewGuid().ToString('N').Substring(0, 8))
$puerto = Get-Random -Minimum 20000 -Maximum 40000
$http = [System.Net.HttpListener]::new(); $http.Prefixes.Add("http://localhost:$puerto/"); $http.Start()
$proc = Start-Process -FilePath $edge -ArgumentList '--headless=new', '--disable-gpu', '--no-first-run', "--user-data-dir=$perfil", '--virtual-time-budget=6000', "http://localhost:$puerto/" -PassThru -WindowStyle Hidden
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
if (-not $res) { throw 'El navegador no ha devuelto la conversión' }
if ($res.StartsWith('ERROR')) { throw "Error en el conector: $res" }
[IO.File]::WriteAllText($Salida, $res.Replace("`r`n", "`n") + "`n", [Text.UTF8Encoding]::new($false))
$d = $res | ConvertFrom-Json -Depth 64
"datos: $Salida · $($d.casos.Count) casos · $($d.meta.organizacion) · corte $($d.meta.generado)"
