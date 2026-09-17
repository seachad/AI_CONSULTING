# Servidor local mínimo para revisar el sitio generado (solo lectura, solo localhost).
# Sirve la raíz del repositorio, de modo que la portada y los enlaces entre SEVEN-G y SPHERES funcionan igual que publicados.
# Uso: pwsh -File SEVEN-G/build/servidor.ps1 [-Puerto 8765]   ->  http://localhost:8765/  (portada)
#      http://localhost:8765/SEVEN-G/html/es/  ·  http://localhost:8765/SPHERES/html/es/
param([int]$Puerto = 8765)
$raiz = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
$tipos = @{ '.html' = 'text/html; charset=utf-8'; '.css' = 'text/css'; '.js' = 'text/javascript'; '.json' = 'application/json'; '.svg' = 'image/svg+xml'; '.png' = 'image/png'; '.pdf' = 'application/pdf' }
$http = [System.Net.HttpListener]::new()
$http.Prefixes.Add("http://localhost:$Puerto/")
$http.Start()
Write-Host "Sirviendo $raiz en http://localhost:$Puerto/"
try {
  while ($http.IsListening) {
    $ctx = $http.GetContext()
    $ruta = [Uri]::UnescapeDataString($ctx.Request.Url.AbsolutePath.TrimStart('/'))
    if (-not $ruta) { $ruta = 'index.html' }
    $fichero = [IO.Path]::GetFullPath((Join-Path $raiz $ruta))
    if ((Test-Path $fichero -PathType Container) -and (Test-Path (Join-Path $fichero 'index.html'))) { $fichero = Join-Path $fichero 'index.html' }
    if (-not $fichero.StartsWith($raiz) -or $fichero -match '[\\/](\.git|\.claude)([\\/]|$)') {
      $ctx.Response.StatusCode = 404; $bytes = [Text.Encoding]::UTF8.GetBytes('No encontrado')
    } elseif ((Test-Path $fichero -PathType Container)) {
      $lista = Get-ChildItem $fichero -Recurse -File -Filter *.html | ForEach-Object { $r = [IO.Path]::GetRelativePath($raiz, $_.FullName).Replace('\', '/'); "<li><a href=""/$r"">$r</a></li>" }
      $bytes = [Text.Encoding]::UTF8.GetBytes("<meta charset=utf-8><ul>$($lista -join '')</ul>")
      $ctx.Response.ContentType = 'text/html; charset=utf-8'
    } elseif (Test-Path $fichero -PathType Leaf) {
      $bytes = [IO.File]::ReadAllBytes($fichero)
      $ctx.Response.ContentType = $tipos[[IO.Path]::GetExtension($fichero)] ?? 'application/octet-stream'
    } else {
      $ctx.Response.StatusCode = 404; $bytes = [Text.Encoding]::UTF8.GetBytes('No encontrado')
    }
    try {
      $ctx.Response.ContentLength64 = $bytes.Length
      if ($ctx.Request.HttpMethod -ne 'HEAD') { $ctx.Response.OutputStream.Write($bytes, 0, $bytes.Length) }
      $ctx.Response.Close()
    } catch { Write-Host "Aviso: $($_.Exception.Message)" }
  }
} finally { $http.Stop() }
