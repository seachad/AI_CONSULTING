<#
  Pruebas de coherencia del repositorio antes de hacer commit y push (D52).

  Uso:   pwsh -File SEVEN-G/build/verificar_coherencia.ps1 [-SinNavegador]
  Sale con código 0 si todo es coherente y con 1 si hay algún error. No modifica nada del repositorio (trabaja en una carpeta temporal).

  Qué comprueba:
    1. Paridad ES/EN de los Markdown de SEVEN-G y SPHERES (D12) y que cada documento tiene su HTML y su PDF (D11, D32).
    2. Textos internos o de clientes en lo que se publica (D17, D33): los mismos patrones que .github/workflows/pages.yml y, si existe,
       la lista privada de términos prohibidos (~/.seveng/terminos_prohibidos.txt).
    3. Aviso legal presente en las herramientas y paneles publicados (D33).
    4. Portada: el primer botón de cada metodología es el que explica el marco (D46) y sus enlaces locales existen.
    5. T01: registro.html coincide con lo que genera build_registro.ps1 (no se ha editado a mano ni está desfasado, D43).
    6. T17: el panel de ejemplo coincide con lo que genera el conector desde los datos de demostración (D43, D44); requiere uv.
    7. Prueba de humo en Edge sin ventana: el registro, el panel completo y el panel móvil se dibujan (un error de JavaScript los deja vacíos).
    8. Registro de decisiones: numeración única y correlativa.
#>
param([switch]$SinNavegador)
$ErrorActionPreference = 'Stop'
$repo = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
$errores = [Collections.Generic.List[string]]::new(); $avisos = [Collections.Generic.List[string]]::new()
function Ok([string]$m) { Write-Host "  ok   $m" }
function Mal([string]$m) { $script:errores.Add($m); Write-Host "  MAL  $m" -ForegroundColor Red }
function Aviso([string]$m) { $script:avisos.Add($m); Write-Host "  aviso $m" -ForegroundColor Yellow }
$tmp = Join-Path ([IO.Path]::GetTempPath()) ("seveng_coherencia_" + [Guid]::NewGuid().ToString('N').Substring(0, 8))
New-Item -ItemType Directory -Force $tmp | Out-Null

try {
  # ---- 1. paridad ES/EN y salidas
  Write-Host '1. Paridad ES/EN y salidas HTML/PDF'
  foreach ($met in 'SEVEN-G', 'SPHERES') {
    $mds = Join-Path $repo "$met\mds"; if (-not (Test-Path $mds)) { continue }
    $rel = @{}
    foreach ($lang in 'es', 'en') {
      $base = Join-Path $mds $lang
      $rel[$lang] = @(Get-ChildItem $base -Recurse -File -Filter *.md | ForEach-Object { [IO.Path]::GetRelativePath($base, $_.FullName).Replace('\', '/') })
    }
    $soloEs = $rel.es | Where-Object { $_ -notin $rel.en -and $_ -notlike '_trabajo/*' }
    $soloEn = $rel.en | Where-Object { $_ -notin $rel.es -and $_ -notlike '_trabajo/*' }
    foreach ($x in $soloEs) { Mal "$met`: sin versión inglesa: $x" }
    foreach ($x in $soloEn) { Mal "$met`: sin versión española: $x" }
    $faltan = 0
    foreach ($lang in 'es', 'en') {
      foreach ($x in ($rel[$lang] | Where-Object { $_ -notlike '_*' -and $_ -notlike '*/_*' })) {
        $b = $x.Substring(0, $x.Length - 3)
        foreach ($s in @("html\$lang\$b.html", "pdf\$lang\$b.pdf")) { if (-not (Test-Path (Join-Path $repo "$met\$s"))) { Mal "$met`: falta $s"; $faltan++ } }
      }
    }
    if (-not $soloEs -and -not $soloEn -and -not $faltan) { Ok "$met`: $($rel.es.Count) documentos ES y $($rel.en.Count) EN, con HTML y PDF" }
  }

  # ---- 2 y 3. textos internos o de clientes, y aviso legal
  Write-Host '2. Textos internos o de clientes en lo publicable'
  $publicables = @(Get-Item (Join-Path $repo 'index.html'), (Join-Path $repo 'en\index.html'))
  foreach ($c in 'SEVEN-G\html', 'SEVEN-G\herramientas', 'SPHERES\html') {
    $d = Join-Path $repo $c
    if (Test-Path $d) { $publicables += Get-ChildItem $d -Recurse -File -Include *.html, *.md, *.json, *.py | Where-Object { $_.FullName -notmatch '[\\/](_[^\\/]*|__pycache__)[\\/]' } }
  }
  $patrones = @('_trabajo', 'notas_internas', 'C:\\SEACHAD', 'OneDrive')
  $lista = Join-Path $env:USERPROFILE '.seveng\terminos_prohibidos.txt'
  # un término por línea, buscado como texto literal sin distinguir mayúsculas; una línea «re:<expresión>» es una expresión regular
  # (p. ej., re:\bSIGLA\b(?!_) para una sigla que también forma parte de palabras corrientes o de claves de datos)
  if (Test-Path $lista) { $patrones += Get-Content $lista -Encoding utf8 | Where-Object { $_.Trim() -and -not $_.StartsWith('#') } | ForEach-Object { $x = $_.Trim(); if ($x.StartsWith('re:')) { $x.Substring(3) } else { [regex]::Escape($x) } } }
  else { Aviso "no existe la lista privada de términos prohibidos ($lista): solo se comprueban los patrones generales" }
  $hallazgos = $publicables | Select-String -Pattern ($patrones -join '|') -List
  foreach ($h in $hallazgos) { Mal "texto interno o prohibido en $([IO.Path]::GetRelativePath($repo, $h.Path)):$($h.LineNumber)" }
  if (-not $hallazgos) { Ok "$($publicables.Count) ficheros publicables sin textos internos ($($patrones.Count) patrones)" }

  Write-Host '3. Aviso legal en herramientas y paneles'
  $conAviso = @('index.html', 'en\index.html', 'SEVEN-G\herramientas\T01_registro_iniciativas\registro.html', 'SEVEN-G\herramientas\T17_panel_consejo\index.html') +
    @(Get-ChildItem (Join-Path $repo 'SEVEN-G\herramientas\T17_panel_consejo\ejemplo\salida') -Filter *.html | ForEach-Object { [IO.Path]::GetRelativePath($repo, $_.FullName) })
  $sin = $conAviso | Where-Object { -not (Select-String -Path (Join-Path $repo $_) -Pattern 'Aviso legal|Legal notice' -Quiet) }
  foreach ($x in $sin) { Mal "sin aviso legal: $x" }
  if (-not $sin) { Ok "$($conAviso.Count) páginas con aviso legal" }

  # aviso de versión en revisión (D58) en las páginas principales mientras el marco esté en la versión 0.x; se retira al pasar a la 1.x
  $principales = @('index.html', 'en\index.html') + @(foreach ($met in 'SEVEN-G', 'SPHERES') { foreach ($lang in 'es', 'en') { "$met\html\$lang\index.html"; "$met\html\$lang\00_${met}_Que_es_y_para_que_sirve.html" } })
  $sinRev = $principales | Where-Object { (Test-Path (Join-Path $repo $_)) -and -not (Select-String -Path (Join-Path $repo $_) -Pattern 'Versión en revisión|Version under review' -Quiet) }
  foreach ($x in $sinRev) { Mal "sin aviso de versión en revisión: $x" }
  if (-not $sinRev) { Ok "$($principales.Count) páginas principales con el aviso de versión en revisión" }

  # ---- 4. portada
  Write-Host '4. Portada: orden de botones y enlaces'
  foreach ($p in 'index.html', 'en\index.html') {
    $ruta = Join-Path $repo $p; $html = [IO.File]::ReadAllText($ruta); $bien = $true
    foreach ($m in [regex]::Matches($html, '(?s)<div class="acciones">(.*?)</div>')) {
      $primero = [regex]::Match($m.Groups[1].Value, '(?s)<a [^>]*>(.*?)</a>').Groups[1].Value
      if ($primero -notmatch '^(Qué es|What) ') { Mal "$p`: el primer botón no explica el marco: «$($primero -replace '<[^>]+>', ' ')»"; $bien = $false }
    }
    foreach ($m in [regex]::Matches($html, 'href="([^"#:]+)"')) {
      $destino = Join-Path (Split-Path $ruta) $m.Groups[1].Value
      if (-not (Test-Path $destino)) { Mal "$p`: enlace roto: $($m.Groups[1].Value)"; $bien = $false }
    }
    if ($bien) { Ok "$p" }
  }

  # ---- 5. T01 generado desde sus fuentes
  Write-Host '5. T01: registro.html generado desde los JSON'
  $t01 = Join-Path $repo 'SEVEN-G\herramientas\T01_registro_iniciativas'
  $salida = Join-Path $tmp 'registro.html'
  & pwsh -NoProfile -File (Join-Path $t01 'build_registro.ps1') -Salida $salida | Out-Null
  # se compara el texto sin depender de los finales de línea, que git puede cambiar al extraer el fichero
  if ($LASTEXITCODE) { Mal 'build_registro.ps1 ha fallado' }
  elseif (([IO.File]::ReadAllText($salida) -replace "`r`n", "`n") -cne ([IO.File]::ReadAllText((Join-Path $t01 'registro.html')) -replace "`r`n", "`n")) { Mal 'registro.html no coincide con sus fuentes: ejecutar build_registro.ps1 (nunca editarlo a mano)' }
  else { Ok 'registro.html coincide con datos_demo.json, catalogo_criterios.json y la plantilla' }

  # ---- 6. T17: panel de ejemplo al día
  Write-Host '6. T17: panel de ejemplo generado desde los datos de demostración'
  $t17 = Join-Path $repo 'SEVEN-G\herramientas\T17_panel_consejo'
  if (Get-Command uv -ErrorAction SilentlyContinue) {
    $sal17 = Join-Path $tmp 'panel'
    Push-Location $t17
    try { & uv run python t01_a_panel.py --salida $sal17 2>&1 | Out-Null; $cod = $LASTEXITCODE } finally { Pop-Location }
    if ($cod) { Mal 'el conector t01_a_panel.py ha fallado' }
    else {
      # los pies del ejemplo publicado llevan enlaces que solo se ponen en la carpeta por defecto: se comparan los datos, que son la fuente de todo
      $a = Get-Content (Join-Path $sal17 't01_dashboard_data.json') -Raw | ConvertFrom-Json -Depth 64
      $b = Get-Content (Join-Path $t17 'ejemplo\salida\t01_dashboard_data.json') -Raw | ConvertFrom-Json -Depth 64
      $a.meta.textos.pie = $null; $b.meta.textos.pie = $null
      if (($a | ConvertTo-Json -Depth 64 -Compress) -ne ($b | ConvertTo-Json -Depth 64 -Compress)) { Mal 'el panel de ejemplo está desfasado: ejecutar uv run python t01_a_panel.py en T17_panel_consejo' }
      else { Ok "panel de ejemplo al día ($($a.casos.Count) casos)" }
      $plantilla = [IO.File]::ReadAllText((Join-Path $t01 '_fuentes\registro.plantilla.html'))
      if ($plantilla -match "const PANEL_DEMO = '([^']+)'" -and -not (Test-Path (Join-Path $t01 $Matches[1]))) { Mal "el registro enlaza a un panel de ejemplo que no existe: $($Matches[1])" }
    }
  } else { Aviso 'uv no está instalado: no se comprueba el panel de ejemplo' }

  # ---- 7. prueba de humo en el navegador
  # Edge sin ventana abre cada página servida por un servidor local de un solo uso; la página lleva inyectado un informe que devuelve al
  # servidor los errores de JavaScript y si existen los elementos que debe haber dibujado. No se toca ningún fichero del repositorio.
  Write-Host '7. Prueba de humo en Edge sin ventana'
  $edge = @("${env:ProgramFiles(x86)}\Microsoft\Edge\Application\msedge.exe", "$env:ProgramFiles\Microsoft\Edge\Application\msedge.exe") | Where-Object { Test-Path $_ } | Select-Object -First 1
  if ($SinNavegador -or -not $edge) { Aviso 'sin navegador: no se hace la prueba de humo' }
  else {
    $salidaEj = Join-Path $t17 'ejemplo\salida'
    $pruebas = @(
      @{ f = (Join-Path $t01 'registro.html'); debe = @('#nav a[href="#/embudo"]', '#lnk-panel', '#principal table'); que = 'registro T01' }
      @{ f = (Get-ChildItem $salidaEj -Filter 't01_Dashboard_Casos_Uso_IA_v*.html' | Select-Object -First 1).FullName; debe = @('#kpis [data-kpi]', '#embudo .fun2-mid', '#embudo .fun-card.gan', '#embudo .fun-card li .pq', '#fbar #fopen, #filters .fgroup'); que = 'panel completo' }
      @{ f = (Get-ChildItem $salidaEj -Filter 't01_Dashboard_Movil_IA_v*.html' | Select-Object -First 1).FullName; debe = @('#embudo .row.fun', '#embudo .row.fun.gan'); que = 'panel móvil' }
    )
    foreach ($p in $pruebas) {
      $puerto = Get-Random -Minimum 20000 -Maximum 40000
      $http = [System.Net.HttpListener]::new(); $http.Prefixes.Add("http://localhost:$puerto/"); $http.Start()
      $sel = ($p.debe | ForEach-Object { "'" + $_.Replace("'", "\'") + "'" }) -join ','
      $pagina = [IO.File]::ReadAllText($p.f)
      $pagina = $pagina -replace '(?i)<head>', '<head><script>window.__errs=[];window.addEventListener("error",function(e){__errs.push(e.message)});</script>'
      $informe = "<script>setTimeout(function(){var f=[$sel].filter(function(s){return !document.querySelector(s)});fetch('/resultado',{method:'POST',body:JSON.stringify({errores:window.__errs,faltan:f})});},1200);</script>"
      $pagina = $pagina -replace '(?i)</body>', ($informe.Replace('$', '$$') + '</body>')
      $perfil = Join-Path $tmp ('edge_' + [Guid]::NewGuid().ToString('N').Substring(0, 6))
      $proc = Start-Process -FilePath $edge -ArgumentList '--headless=new', '--disable-gpu', '--no-first-run', "--user-data-dir=$perfil", '--window-size=1400,1000', "--screenshot=$tmp\humo.png", '--virtual-time-budget=8000', "http://localhost:$puerto/" -PassThru -WindowStyle Hidden
      $resultado = $null; $limite = (Get-Date).AddSeconds(40)
      while (-not $resultado -and (Get-Date) -lt $limite) {
        $tarea = $http.GetContextAsync()
        if (-not $tarea.Wait(1000)) { if ($proc.HasExited -and -not $tarea.Wait(1500)) { break }; if (-not $tarea.IsCompleted) { continue } }
        $ctx = $tarea.Result
        if ($ctx.Request.HttpMethod -eq 'POST') { $resultado = [IO.StreamReader]::new($ctx.Request.InputStream).ReadToEnd() | ConvertFrom-Json; $bytes = [byte[]]@() }
        elseif ($ctx.Request.Url.AbsolutePath -eq '/') { $bytes = [Text.Encoding]::UTF8.GetBytes($pagina); $ctx.Response.ContentType = 'text/html; charset=utf-8' }
        else { $ctx.Response.StatusCode = 404; $bytes = [byte[]]@() }
        $ctx.Response.ContentLength64 = $bytes.Length; if ($bytes.Length) { $ctx.Response.OutputStream.Write($bytes, 0, $bytes.Length) }; $ctx.Response.Close()
      }
      $http.Stop(); if (-not $proc.HasExited) { try { $proc.Kill() } catch {} }
      if (-not $resultado) { Aviso "$($p.que): el navegador no ha respondido; prueba no concluyente" }
      elseif ($resultado.errores.Count) { Mal "$($p.que): error de JavaScript: $($resultado.errores -join ' · ')" }
      elseif ($resultado.faltan.Count) { Mal "$($p.que): no se dibuja (falta $($resultado.faltan -join ', '))" }
      else { Ok "$($p.que) se dibuja sin errores de JavaScript" }
    }
  }

  # ---- 8. registro de decisiones
  Write-Host '8. Registro de decisiones'
  $nums = [regex]::Matches([IO.File]::ReadAllText((Join-Path $repo '.claude\seveng_decisiones.md')), '(?m)^\| D(\d+) \|') | ForEach-Object { [int]$_.Groups[1].Value }
  $rep = $nums | Group-Object | Where-Object Count -gt 1
  if ($rep) { Mal "decisiones repetidas: D$($rep.Name -join ', D')" }
  elseif (Compare-Object $nums (1..$nums.Count)) { Mal 'la numeración de las decisiones no es correlativa' }
  else { Ok "$($nums.Count) decisiones, numeración correlativa" }

  # ---- 9. nada generado por accidente bajo control de versiones
  Write-Host '9. Ficheros que no deben versionarse'
  $sobran = @(& git -C $repo ls-files | Where-Object { $_ -match '__pycache__|\.pyc$' })
  foreach ($x in $sobran) { Mal "bytecode de Python versionado: $x (git rm --cached)" }
  if (-not $sobran) { Ok 'sin bytecode de Python en el repositorio' }
}
finally { Remove-Item $tmp -Recurse -Force -Confirm:$false -ErrorAction SilentlyContinue }

Write-Host ''
if ($errores.Count) { Write-Host "COHERENCIA: $($errores.Count) errores. No hacer commit ni push." -ForegroundColor Red; exit 1 }
Write-Host "COHERENCIA: todo correcto$(if ($avisos.Count) { " ($($avisos.Count) avisos)" })."; exit 0
