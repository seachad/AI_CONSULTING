# Renderiza páginas de un PDF a PNG para revisión visual (usa Windows.Data.Pdf).
# Ejecutar con Windows PowerShell 5.1:  powershell -File build/pdf_a_png.ps1 -Pdf <ruta> -Salida <carpeta> [-Paginas 1,2,3]
param([Parameter(Mandatory)][string]$Pdf, [Parameter(Mandatory)][string]$Salida, [int[]]$Paginas)

Add-Type -AssemblyName System.Runtime.WindowsRuntime
$null = [Windows.Storage.StorageFile, Windows.Storage, ContentType = WindowsRuntime]
$null = [Windows.Data.Pdf.PdfDocument, Windows.Data.Pdf, ContentType = WindowsRuntime]
$null = [Windows.Storage.Streams.InMemoryRandomAccessStream, Windows.Storage.Streams, ContentType = WindowsRuntime]

$asTaskGeneric = ([System.WindowsRuntimeSystemExtensions].GetMethods() | Where-Object {
  $_.Name -eq 'AsTask' -and $_.GetParameters().Count -eq 1 -and $_.GetParameters()[0].ParameterType.Name -eq 'IAsyncOperation`1' })[0]
function Await($op, [Type]$t) { $task = $asTaskGeneric.MakeGenericMethod($t).Invoke($null, @($op)); $task.Wait(); $task.Result }
$asTaskAction = ([System.WindowsRuntimeSystemExtensions].GetMethods() | Where-Object {
  $_.Name -eq 'AsTask' -and $_.GetParameters().Count -eq 1 -and $_.GetParameters()[0].ParameterType.Name -eq 'IAsyncAction' })[0]
function AwaitAction($op) { $asTaskAction.Invoke($null, @($op)).Wait() }

New-Item -ItemType Directory -Force $Salida | Out-Null
$file = Await ([Windows.Storage.StorageFile]::GetFileFromPathAsync((Resolve-Path $Pdf).Path)) ([Windows.Storage.StorageFile])
$doc  = Await ([Windows.Data.Pdf.PdfDocument]::LoadFromFileAsync($file)) ([Windows.Data.Pdf.PdfDocument])
Write-Host "Páginas: $($doc.PageCount)"
if (-not $Paginas) { $Paginas = 1..$doc.PageCount }
foreach ($n in $Paginas) {
  if ($n -gt $doc.PageCount) { continue }
  $page = $doc.GetPage($n - 1)
  $stream = New-Object Windows.Storage.Streams.InMemoryRandomAccessStream
  $opts = New-Object Windows.Data.Pdf.PdfPageRenderOptions
  $opts.DestinationWidth = 1100
  AwaitAction ($page.RenderToStreamAsync($stream, $opts))
  $net = [System.IO.WindowsRuntimeStreamExtensions]::AsStreamForRead($stream.GetInputStreamAt(0))
  $out = Join-Path $Salida ("pagina_{0:D2}.png" -f $n)
  $fs = [IO.File]::Create($out); $net.CopyTo($fs); $fs.Close()
  Write-Host $out
}
