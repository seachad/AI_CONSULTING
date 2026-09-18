<#
  Extrae las ilustraciones de SPAD/Documents/SPAD_AI_Engineering.pdf que se publican en la biblioteca SPAD.
  Renderiza las páginas elegidas, las recorta (sin título en la lámina del problema y sin la marca de la herramienta
  con que se generaron) y las guarda en JPEG en SPAD/html/img/, desde donde las enlazan los documentos.

  Uso:   pwsh -File SPAD/build/ilustraciones.ps1
  Requiere Windows PowerShell 5.1 (powershell.exe) para el renderizado del PDF (SEVEN-G/build/pdf_a_png.ps1).

  Láminas que NO se publican (decisión D61): 1 (presenta SPAD como parte de SEVEN-G, contra D09), 10 (tiempos
  sin respaldo), 12 (cifras de mejora y retorno sin respaldo), 13 («certificación», contra D25) y 14 (plazos y
  certificaciones). De la lámina 2 solo se publica la gráfica, sin el porcentaje sin respaldo.
#>
$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.Drawing
$repo   = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
$pdf    = Join-Path $repo 'SPAD\Documents\SPAD_AI_Engineering.pdf'
$destino = Join-Path $repo 'SPAD\html\img'
$tmp    = Join-Path ([IO.Path]::GetTempPath()) ('spad_ilus_' + [Guid]::NewGuid().ToString('N').Substring(0, 6))
New-Item -ItemType Directory -Force $destino, $tmp | Out-Null
$ancho = 1800
$escala = $ancho / 1100   # los recortes se expresan sobre una lámina de 1100 × 614

# página → nombre y recorte (x, y, ancho, alto) en coordenadas de 1100 × 614
$laminas = [ordered]@{
  '4'  = @{ n = 'spad_01_pensar_validar_ejecutar'; r = @(0, 0, 1100, 590) }
  '2'  = @{ n = 'spad_02_ilusion_de_velocidad';    r = @(305, 88, 495, 440) }
  '3'  = @{ n = 'spad_03_ia_tradicional_frente_a_spad'; r = @(0, 0, 1100, 592) }
  '5'  = @{ n = 'spad_04_reglas_no_negociables';   r = @(0, 0, 1100, 590) }
  '6'  = @{ n = 'spad_05_separacion_de_roles';     r = @(0, 0, 1100, 590) }
  '7'  = @{ n = 'spad_06_flujo_bloqueante';        r = @(0, 0, 1100, 590) }
  '8'  = @{ n = 'spad_07_politica_de_validacion';  r = @(0, 0, 1100, 590) }
  '9'  = @{ n = 'spad_08_contextos_y_topic';       r = @(0, 0, 1100, 590) }
  '11' = @{ n = 'spad_09_pruebas_y_seguridad';     r = @(0, 0, 1100, 590) }
}
$jpeg = [Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() | Where-Object MimeType -eq 'image/jpeg'
$param = [Drawing.Imaging.EncoderParameters]::new(1)
$param.Param[0] = [Drawing.Imaging.EncoderParameter]::new([Drawing.Imaging.Encoder]::Quality, [long]84)
try {
  foreach ($p in $laminas.Keys) {
    & powershell.exe -NoProfile -File (Join-Path $repo 'SEVEN-G\build\pdf_a_png.ps1') -Pdf $pdf -Salida $tmp -Paginas ([int]$p) -Ancho $ancho | Out-Null
    $png = Join-Path $tmp ('pagina_{0:D2}.png' -f [int]$p)
    $img = [Drawing.Image]::FromFile($png)
    try {
      $r = @($laminas[$p].r | ForEach-Object { [int][math]::Round($_ * $escala) })
      $w = [int][math]::Min($r[2], $img.Width - $r[0]); $h = [int][math]::Min($r[3], $img.Height - $r[1])
      $bmp = [Drawing.Bitmap]::new($w, $h)
      $g = [Drawing.Graphics]::FromImage($bmp)
      $g.DrawImage($img, [Drawing.Rectangle]::new(0, 0, $w, $h), [Drawing.Rectangle]::new($r[0], $r[1], $w, $h), [Drawing.GraphicsUnit]::Pixel)
      $g.Dispose()
      $salida = Join-Path $destino "$($laminas[$p].n).jpg"
      $bmp.Save($salida, $jpeg, $param); $bmp.Dispose()
      Write-Host "$salida ($w × $h)"
    } finally { $img.Dispose() }
  }
} finally { Remove-Item $tmp -Recurse -Force -ErrorAction SilentlyContinue }
