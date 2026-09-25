<#
.SYNOPSIS
  Genera los tres cursos de SEVEN-G en PowerPoint (.pptx) y su PDF: para la empresa (autoconsultoría), para el consultor
  y para el partner (empresa que integra la metodología en la suya).

.DESCRIPTION
  Salidas:  SEVEN-G/pptx/<idioma>/SEVEN-G_Curso_<Empresa|Consultor|Partner>.pptx
            SEVEN-G/pdf/<idioma>/curso/SEVEN-G_Curso_<Empresa|Consultor|Partner>.pdf
  Imágenes: SEVEN-G/build/img_curso/ (embudo de la cartera ES/EN, registro de iniciativas T01 y panel del consejo T17,
            capturadas con Edge sin ventana de los propios componentes y herramientas del sitio, con datos ficticios).

  Los tres cursos comparten un tronco (qué es SEVEN-G, las fases, qué se rellena en cada fase, cómo eso llena el embudo
  del registro y acaba en el panel del consejo, y dos casos de ejemplo) y añaden un bloque propio de cada público.
  El guion está en este script (sección «Contenido»); los datos de fases, plantillas y modelos de acompañamiento salen
  de los documentos 01 (SS6.10), 90 y 91. «Partner» describe a quien integra el marco bajo su licencia: no existe
  programa de socios ni «partner oficial» (91 SS6.2).

  El .pptx se escribe directamente en OOXML, sin dependencias (mismo enfoque que docx.ps1). El PDF se exporta del propio
  .pptx con PowerPoint por COM si está instalado; si no lo está, se avisa y se conserva el PDF que hubiera. Como el
  .pptx es determinista, si no cambia no se vuelve a exportar el PDF (evita diferencias inútiles en git).

.EXAMPLE
  pwsh -File SEVEN-G/build/curso_pptx.ps1
#>
param(
  [string[]]$Idiomas = @('es', 'en'),
  [switch]$SinPdf
)

$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.IO.Compression
Add-Type -AssemblyName System.IO.Compression.FileSystem
Add-Type -AssemblyName System.Drawing
$repo = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
$imgDir = Join-Path $PSScriptRoot 'img_curso'
$fechaFija = [DateTimeOffset]::new(2026, 1, 1, 0, 0, 0, [TimeSpan]::Zero)

function Xml([string]$s) { if ($null -eq $s) { return '' }; [Security.SecurityElement]::Escape($s) }

# ---------- primitivas OOXML ----------

$NEGRO = '1A1817'; $CLARET = '990F3D'; $PAPEL = 'FBE2CD'; $PAPEL2 = 'F3CFB2'; $TINTA = '2F2B28'; $TINTA2 = '564D47'
$OXFORD = '0F5499'; $TEAL = '0D7680'; $VELVET = '593380'; $ORO = 'A5822A'; $BLANCO = 'FFFFFF'; $GRIS = 'C9A78D'; $VERDE = '2E7D32'

function Rpr([string]$colorHex, [int]$tamano, [bool]$negrita = $false) {
  $b = if ($negrita) { ' b="1"' } else { '' }
  "<a:rPr lang=""es-ES"" sz=""$tamano""$b dirty=""0""><a:solidFill><a:srgbClr val=""$colorHex""/></a:solidFill></a:rPr>"
}
function Parrafo([string]$texto, [string]$colorHex, [int]$tamano, [bool]$negrita = $false, [string]$align = 'l') {
  "<a:p><a:pPr algn=""$align""/><a:r>$(Rpr $colorHex $tamano $negrita)<a:t>$(Xml $texto)</a:t></a:r></a:p>"
}
# párrafo con un rótulo en negrita seguido de texto normal
function Parrafo-Rotulo([string]$rotulo, [string]$texto, [string]$colorHex, [int]$tamano) {
  "<a:p><a:pPr algn=""l""><a:spcAft><a:spcPts val=""500""/></a:spcAft></a:pPr><a:r>$(Rpr $NEGRO $tamano $true)<a:t>$(Xml "$rotulo ")</a:t></a:r><a:r>$(Rpr $colorHex $tamano $false)<a:t>$(Xml $texto)</a:t></a:r></a:p>"
}
function Parrafo-Bullet([string]$texto, [string]$colorHex, [int]$tamano, [string]$colorBullet = $null) {
  $cb = if ($colorBullet) { $colorBullet } else { $CLARET }
  "<a:p><a:pPr marL=""285750"" indent=""-285750""><a:spcAft><a:spcPts val=""400""/></a:spcAft><a:buClr><a:srgbClr val=""$cb""/></a:buClr><a:buFont typeface=""Arial""/><a:buChar char=""&#8226;""/></a:pPr><a:r>$(Rpr $colorHex $tamano $false)<a:t>$(Xml $texto)</a:t></a:r></a:p>"
}
function Slide-Xml([string]$cuerpo, [string]$fondoHex = $PAPEL) {
  @"
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<p:sld xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:p="http://schemas.openxmlformats.org/presentationml/2006/main"><p:cSld><p:bg><p:bgPr><a:solidFill><a:srgbClr val="$fondoHex"/></a:solidFill><a:effectLst/></p:bgPr></p:bg><p:spTree><p:nvGrpSpPr><p:cNvPr id="1" name=""/><p:cNvGrpSpPr/><p:nvPr/></p:nvGrpSpPr><p:grpSpPr><a:xfrm><a:off x="0" y="0"/><a:ext cx="0" cy="0"/><a:chOff x="0" y="0"/><a:chExt cx="0" cy="0"/></a:xfrm></p:grpSpPr>
$cuerpo
</p:spTree></p:cSld><p:clrMapOvr><a:overrideClrMapping bg1="lt1" tx1="dk1" bg2="lt2" tx2="dk2" accent1="accent1" accent2="accent2" accent3="accent3" accent4="accent4" accent5="accent5" accent6="accent6" hlink="hlink" folHlink="folHlink"/></p:clrMapOvr></p:sld>
"@
}
$script:idSeq = 1
function NuevoId() { $script:idSeq++; return $script:idSeq }

function Shape-Texto([int]$x, [int]$y, [int]$cx, [int]$cy, [string]$parrafosXml, [string]$anchor = 't') {
  $id = NuevoId
  @"
<p:sp><p:nvSpPr><p:cNvPr id="$id" name="Texto $id"/><p:cNvSpPr txBox="1"/><p:nvPr/></p:nvSpPr><p:spPr><a:xfrm><a:off x="$x" y="$y"/><a:ext cx="$cx" cy="$cy"/></a:xfrm><a:prstGeom prst="rect"><a:avLst/></a:prstGeom><a:noFill/></p:spPr><p:txBody><a:bodyPr wrap="square" anchor="$anchor" lIns="45720" rIns="45720"><a:noAutofit/></a:bodyPr><a:lstStyle/>
$parrafosXml
</p:txBody></p:sp>
"@
}
function Shape-Caja([int]$x, [int]$y, [int]$cx, [int]$cy, [string]$titulo, [string]$colorFondo, [string]$colorTexto, [int]$tamTitulo, [string]$subtitulo = '', [int]$tamSub = 1000) {
  $id = NuevoId
  $parr = Parrafo $titulo $colorTexto $tamTitulo $true 'ctr'
  if ($subtitulo) { $parr += Parrafo $subtitulo $colorTexto $tamSub $false 'ctr' }
  @"
<p:sp><p:nvSpPr><p:cNvPr id="$id" name="Caja $id"/><p:cNvSpPr/><p:nvPr/></p:nvSpPr><p:spPr><a:xfrm><a:off x="$x" y="$y"/><a:ext cx="$cx" cy="$cy"/></a:xfrm><a:prstGeom prst="roundRect"><a:avLst><a:gd name="adj" fmla="val 6000"/></a:avLst></a:prstGeom><a:solidFill><a:srgbClr val="$colorFondo"/></a:solidFill><a:ln><a:noFill/></a:ln></p:spPr><p:txBody><a:bodyPr wrap="square" anchor="ctr" lIns="45720" rIns="45720"><a:noAutofit/></a:bodyPr><a:lstStyle/>
$parr
</p:txBody></p:sp>
"@
}

# imágenes: clave -> fichero. En el XML de la diapositiva se referencian como r:embed="rIdImg_<clave>"; Escribir-Pptx
# busca esas referencias, añade el fichero a ppt/media y la relación a la diapositiva.
$script:IMAGENES = @{}
function Registrar-Imagen([string]$clave, [string]$ruta) {
  if (-not (Test-Path $ruta)) { throw "Falta la imagen del curso: $ruta" }
  $img = [System.Drawing.Image]::FromFile($ruta)
  $script:IMAGENES[$clave] = [pscustomobject]@{ ruta = $ruta; ancho = $img.Width; alto = $img.Height }
  $img.Dispose()
}
# coloca la imagen dentro de la caja (x, y, cx, cy) conservando su proporción, alineada arriba a la izquierda
function Imagen([string]$clave, [int]$x, [int]$y, [int]$cx, [int]$cy, [string]$descr) {
  $i = $script:IMAGENES[$clave]
  $prop = $i.ancho / $i.alto
  $w = $cx; $h = [int]($cx / $prop)
  if ($h -gt $cy) { $h = $cy; $w = [int]($cy * $prop) }
  $id = NuevoId
  "<p:pic><p:nvPicPr><p:cNvPr id=""$id"" name=""Imagen $id"" descr=""$(Xml $descr)""/><p:cNvPicPr><a:picLocks noChangeAspect=""1""/></p:cNvPicPr><p:nvPr/></p:nvPicPr><p:blipFill><a:blip r:embed=""rIdImg_$clave""/><a:stretch><a:fillRect/></a:stretch></p:blipFill><p:spPr><a:xfrm><a:off x=""$x"" y=""$y""/><a:ext cx=""$w"" cy=""$h""/></a:xfrm><a:prstGeom prst=""rect""><a:avLst/></a:prstGeom><a:ln w=""12700""><a:solidFill><a:srgbClr val=""$GRIS""/></a:solidFill></a:ln></p:spPr></p:pic>"
}

$script:ROTULO = 'SEVEN-G · CURSO'
function Rombo([string]$marca = $script:ROTULO) {
  $id = NuevoId
  "<p:sp><p:nvSpPr><p:cNvPr id=""$id"" name=""Marca""/><p:cNvSpPr/><p:nvPr/></p:nvSpPr><p:spPr><a:xfrm><a:off x=""609600"" y=""365760""/><a:ext cx=""182880"" cy=""182880""/></a:xfrm><a:prstGeom prst=""rect""><a:avLst/></a:prstGeom><a:solidFill><a:srgbClr val=""$CLARET""/></a:solidFill></p:spPr><p:txBody><a:bodyPr/><a:lstStyle/><a:p/></p:txBody></p:sp>" +
  (Shape-Texto 838200 300000 10500000 320000 (Parrafo $marca $NEGRO 1400 $true) 'ctr')
}
function Cabecera([string]$titulo, [string]$sub = '') {
  $x = (Rombo) + (Shape-Texto 609600 700000 10972800 650000 (Parrafo $titulo $CLARET 2700 $true))
  if ($sub) { $x += Shape-Texto 609600 1330000 10972800 450000 (Parrafo $sub $TINTA2 1500) }
  $x
}

# ---------- tipos de diapositiva ----------

function Diapositiva-Titulo([string]$titulo, [string]$subtitulo, [string]$publico, [string]$pie) {
  $t = Shape-Texto 609600 1350000 10972800 1100000 (Parrafo $titulo $NEGRO 5000 $true)
  $p = Shape-Caja 609600 2600000 5200000 560000 $publico $CLARET $BLANCO 1800
  $s = Shape-Texto 609600 3450000 10500000 1500000 (Parrafo $subtitulo $TINTA 2000)
  $f = Shape-Texto 609600 6150000 10972800 450000 (Parrafo $pie $OXFORD 1400)
  Slide-Xml ((Rombo) + $t + $p + $s + $f)
}
function Diapositiva-Seccion([string]$rotulo, [string]$titulo, [string]$nota) {
  $id1 = NuevoId
  $marca = "<p:sp><p:nvSpPr><p:cNvPr id=""$id1"" name=""Marca""/><p:cNvSpPr/><p:nvPr/></p:nvSpPr><p:spPr><a:xfrm><a:off x=""609600"" y=""2400000""/><a:ext cx=""182880"" cy=""182880""/></a:xfrm><a:prstGeom prst=""rect""><a:avLst/></a:prstGeom><a:solidFill><a:srgbClr val=""$CLARET""/></a:solidFill></p:spPr><p:txBody><a:bodyPr/><a:lstStyle/><a:p/></p:txBody></p:sp>"
  $r = Shape-Texto 838200 2320000 9000000 400000 (Parrafo $rotulo $PAPEL2 1600 $true)
  $t = Shape-Texto 609600 2850000 10972800 1400000 (Parrafo $titulo $PAPEL 4000 $true)
  $n = Shape-Texto 609600 4400000 10500000 900000 (Parrafo $nota $PAPEL2 1700)
  Slide-Xml ($marca + $r + $t + $n) $NEGRO
}
function Diapositiva-Texto([string]$titulo, [string[]]$bullets, [string]$notaFinal = '', [int]$tam = 1800) {
  $parr = ($bullets | ForEach-Object { Parrafo-Bullet $_ $TINTA $tam }) -join ''
  $b = Shape-Texto 609600 1750000 10972800 4400000 $parr
  $n = if ($notaFinal) { Shape-Texto 609600 6250000 10972800 450000 (Parrafo $notaFinal $OXFORD 1400 $true) } else { '' }
  Slide-Xml ((Cabecera $titulo) + $b + $n)
}
# las ocho fases en fila, con las puertas; $resaltar = fases alcanzadas (el resto, en gris)
function Diapositiva-Fases([string]$titulo, [string]$sub, [string[]]$fases, [string[]]$puertas, [int[]]$resaltar = @(), [string]$colorResalte = $TEAL, [string]$rotuloResalte = '', [string[]]$etapas = @()) {
  $n = $fases.Count
  $anchoCaja = 1240000; $hueco = 130000
  $anchoTotal = $n * $anchoCaja + ($n - 1) * $hueco
  $x0 = [int]((12192000 - $anchoTotal) / 2)
  $y = 2350000; $altoCaja = 1500000
  $cajas = ''
  for ($i = 0; $i -lt $n; $i++) {
    $x = $x0 + $i * ($anchoCaja + $hueco)
    $activo = $resaltar.Count -eq 0 -or $resaltar -contains $i
    $color = if ($resaltar.Count -eq 0) { if ($i -eq 0) { $TINTA2 } elseif ($i -le 3) { $OXFORD } elseif ($i -le 5) { $VELVET } else { $TEAL } } elseif ($activo) { $colorResalte } else { $GRIS }
    $colorTxt = if ($activo) { $BLANCO } else { $TINTA2 }
    $cajas += Shape-Caja $x $y $anchoCaja $altoCaja "F$i" $color $colorTxt 2400 $fases[$i] 1050
    if ($puertas[$i]) { $cajas += Shape-Texto ($x + $anchoCaja - 330000) ($y + $altoCaja + 50000) 800000 300000 (Parrafo $puertas[$i] $CLARET 1200 $true 'ctr') }
  }
  # etapas del embudo bajo las fases: (texto, primera fase, última fase, color)
  $y2 = $y + $altoCaja + 480000
  foreach ($e in $etapas) {
    $p = $e -split '\|'
    $xa = $x0 + [int]$p[1] * ($anchoCaja + $hueco)
    $xb = $x0 + [int]$p[2] * ($anchoCaja + $hueco) + $anchoCaja
    $cajas += Shape-Caja $xa $y2 ($xb - $xa) 520000 $p[0] $p[3] $BLANCO 1300
  }
  $marca = if ($rotuloResalte) { Shape-Texto 609600 ($y2 + 100000) 10972800 600000 (Parrafo $rotuloResalte $colorResalte 2200 $true 'ctr') } else { '' }
  Slide-Xml ((Cabecera $titulo $sub) + $cajas + $marca)
}
function Diapositiva-Tarjetas([string]$titulo, [string]$sub, [pscustomobject[]]$tarjetas, [string]$nota = '') {
  $n = $tarjetas.Count
  $hueco = 120000
  $anchoCaja = [int]((10972800 - ($n - 1) * $hueco) / $n)
  $y = 2050000; $altoCab = 800000; $altoTxt = 2500000
  $cajas = ''
  for ($i = 0; $i -lt $n; $i++) {
    $x = 609600 + $i * ($anchoCaja + $hueco)
    $r = $tarjetas[$i]
    $cajas += Shape-Caja $x $y $anchoCaja $altoCab $r.nombre $r.color $BLANCO 1700
    $cajas += Shape-Caja $x ($y + $altoCab - 60000) $anchoCaja $altoTxt '' $PAPEL2 $TINTA 1000
    $cajas += Shape-Texto ($x + 40000) ($y + $altoCab + 40000) ($anchoCaja - 80000) ($altoTxt - 160000) (Parrafo $r.texto $TINTA 1300)
  }
  $n2 = if ($nota) { Shape-Texto 609600 6150000 10972800 500000 (Parrafo $nota $OXFORD 1400 $true) } else { '' }
  Slide-Xml ((Cabecera $titulo $sub) + $cajas + $n2)
}
# columnas de proceso: una por fase, con qué se hace, qué se rellena y qué puerta la cierra
function Diapositiva-Proceso([string]$titulo, [string]$sub, [pscustomobject[]]$cols, [string]$rQue, [string]$rRellena, [string]$nota) {
  $n = $cols.Count
  $hueco = 130000
  $ancho = [int]((10972800 - ($n - 1) * $hueco) / $n)
  $y = 1900000
  $x = ''
  for ($i = 0; $i -lt $n; $i++) {
    $c = $cols[$i]; $cx = 609600 + $i * ($ancho + $hueco)
    $x += Shape-Caja $cx $y $ancho 700000 $c.fase $c.color $BLANCO 1700 $c.nombre 1150
    $x += Shape-Caja $cx ($y + 640000) $ancho 2950000 '' $PAPEL2 $TINTA 1000
    $x += Shape-Texto ($cx + 40000) ($y + 760000) ($ancho - 80000) 2780000 ((Parrafo-Rotulo $rQue $c.que $TINTA 1150) + (Parrafo-Rotulo $rRellena $c.rellena $TINTA 1150))
    $x += Shape-Caja $cx ($y + 3650000) $ancho 560000 $c.puerta $CLARET $BLANCO 1150
  }
  $n2 = Shape-Texto 609600 6260000 10972800 450000 (Parrafo $nota $OXFORD 1300 $true)
  Slide-Xml ((Cabecera $titulo $sub) + $x + $n2)
}
function Diapositiva-Imagen([string]$titulo, [string]$sub, [string]$clave, [string]$descr, [string[]]$bullets, [int]$anchoImg = 6900000, [string]$nota = '') {
  $img = Imagen $clave 609600 1900000 $anchoImg 4300000 $descr
  $xt = 609600 + $anchoImg + 200000
  $parr = ($bullets | ForEach-Object { Parrafo-Bullet $_ $TINTA 1300 }) -join ''
  $b = Shape-Texto $xt 1850000 (12192000 - 609600 - $xt) 4400000 $parr
  $n2 = if ($nota) { Shape-Texto 609600 6260000 10972800 450000 (Parrafo $nota $OXFORD 1300 $true) } else { '' }
  Slide-Xml ((Cabecera $titulo $sub) + $img + $b + $n2)
}
function Diapositiva-Ejemplo([string]$titulo, [string]$caso, [string[]]$bullets, [string]$veredicto, [string]$colorVeredicto) {
  $c = Shape-Texto 609600 1330000 10972800 500000 (Parrafo $caso $TINTA 1700 $true)
  $parr = ($bullets | ForEach-Object { Parrafo-Bullet $_ $TINTA 1500 }) -join ''
  $b = Shape-Texto 609600 1900000 10972800 3550000 $parr
  $v = Shape-Caja 609600 5600000 10972800 900000 $veredicto $colorVeredicto $BLANCO 2100
  Slide-Xml ((Cabecera $titulo) + $c + $b + $v)
}
function Diapositiva-Cierre([string]$titulo, [string]$linea1, [string]$linea2, [string]$url) {
  $t1 = Shape-Texto 609600 2300000 10972800 900000 (Parrafo $titulo $NEGRO 4400 $true 'ctr')
  $t2 = Shape-Texto 609600 3350000 10972800 900000 (Parrafo $linea1 $TINTA 1900 $false 'ctr')
  $t3 = Shape-Texto 609600 4350000 10972800 500000 (Parrafo $linea2 $TINTA2 1600 $false 'ctr')
  $t4 = Shape-Texto 609600 4950000 10972800 500000 (Parrafo $url $OXFORD 1700 $false 'ctr')
  Slide-Xml ($t1 + $t2 + $t3 + $t4)
}

# ---------- paquete pptx ----------

$contentTypes = @'
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types">
<Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml"/>
<Default Extension="xml" ContentType="application/xml"/>
<Default Extension="png" ContentType="image/png"/>
<Override PartName="/ppt/presentation.xml" ContentType="application/vnd.openxmlformats-officedocument.presentationml.presentation.main+xml"/>
<Override PartName="/ppt/slideMasters/slideMaster1.xml" ContentType="application/vnd.openxmlformats-officedocument.presentationml.slideMaster+xml"/>
<Override PartName="/ppt/slideLayouts/slideLayout1.xml" ContentType="application/vnd.openxmlformats-officedocument.presentationml.slideLayout+xml"/>
<Override PartName="/ppt/theme/theme1.xml" ContentType="application/vnd.openxmlformats-officedocument.theme+xml"/>
<Override PartName="/docProps/core.xml" ContentType="application/vnd.openxmlformats-package.core-properties+xml"/>
<Override PartName="/docProps/app.xml" ContentType="application/vnd.openxmlformats-officedocument.extended-properties+xml"/>
{0}
</Types>
'@
$rootRels = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?><Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships"><Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument" Target="ppt/presentation.xml"/><Relationship Id="rId2" Type="http://schemas.openxmlformats.org/package/2006/relationships/metadata/core-properties" Target="docProps/core.xml"/><Relationship Id="rId3" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/extended-properties" Target="docProps/app.xml"/></Relationships>'
$theme = @"
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<a:theme xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" name="SEVEN-G">
<a:themeElements>
<a:clrScheme name="SEVEN-G"><a:dk1><a:srgbClr val="$NEGRO"/></a:dk1><a:lt1><a:srgbClr val="$PAPEL"/></a:lt1><a:dk2><a:srgbClr val="$TINTA"/></a:dk2><a:lt2><a:srgbClr val="FFFFFF"/></a:lt2><a:accent1><a:srgbClr val="$CLARET"/></a:accent1><a:accent2><a:srgbClr val="$OXFORD"/></a:accent2><a:accent3><a:srgbClr val="$TEAL"/></a:accent3><a:accent4><a:srgbClr val="$VELVET"/></a:accent4><a:accent5><a:srgbClr val="$ORO"/></a:accent5><a:accent6><a:srgbClr val="71645B"/></a:accent6><a:hlink><a:srgbClr val="$OXFORD"/></a:hlink><a:folHlink><a:srgbClr val="$VELVET"/></a:folHlink></a:clrScheme>
<a:fontScheme name="SEVEN-G"><a:majorFont><a:latin typeface="Georgia"/><a:ea typeface=""/><a:cs typeface=""/></a:majorFont><a:minorFont><a:latin typeface="Arial"/><a:ea typeface=""/><a:cs typeface=""/></a:minorFont></a:fontScheme>
<a:fmtScheme name="SEVEN-G"><a:fillStyleLst><a:solidFill><a:schemeClr val="accent1"/></a:solidFill><a:solidFill><a:schemeClr val="accent1"/></a:solidFill><a:solidFill><a:schemeClr val="accent1"/></a:solidFill></a:fillStyleLst><a:lnStyleLst><a:ln><a:solidFill><a:schemeClr val="accent1"/></a:solidFill></a:ln><a:ln><a:solidFill><a:schemeClr val="accent1"/></a:solidFill></a:ln><a:ln><a:solidFill><a:schemeClr val="accent1"/></a:solidFill></a:ln></a:lnStyleLst><a:effectStyleLst><a:effectStyle><a:effectLst/></a:effectStyle><a:effectStyle><a:effectLst/></a:effectStyle><a:effectStyle><a:effectLst/></a:effectStyle></a:effectStyleLst><a:bgFillStyleLst><a:solidFill><a:schemeClr val="lt1"/></a:solidFill><a:solidFill><a:schemeClr val="lt1"/></a:solidFill><a:solidFill><a:schemeClr val="lt1"/></a:solidFill></a:bgFillStyleLst></a:fmtScheme>
</a:themeElements>
</a:theme>
"@
$slideLayout = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?><p:sldLayout xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:p="http://schemas.openxmlformats.org/presentationml/2006/main" type="blank" preserve="1"><p:cSld name="Blank"><p:spTree><p:nvGrpSpPr><p:cNvPr id="1" name=""/><p:cNvGrpSpPr/><p:nvPr/></p:nvGrpSpPr><p:grpSpPr><a:xfrm><a:off x="0" y="0"/><a:ext cx="0" cy="0"/><a:chOff x="0" y="0"/><a:chExt cx="0" cy="0"/></a:xfrm></p:grpSpPr></p:spTree></p:cSld><p:clrMapOvr><a:masterClrMapping/></p:clrMapOvr></p:sldLayout>'
$slideLayoutRels = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?><Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships"><Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/slideMaster" Target="../slideMasters/slideMaster1.xml"/></Relationships>'
$slideMaster = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?><p:sldMaster xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:p="http://schemas.openxmlformats.org/presentationml/2006/main"><p:cSld><p:bg><p:bgPr><a:solidFill><a:schemeClr val="lt1"/></a:solidFill><a:effectLst/></p:bgPr></p:bg><p:spTree><p:nvGrpSpPr><p:cNvPr id="1" name=""/><p:cNvGrpSpPr/><p:nvPr/></p:nvGrpSpPr><p:grpSpPr><a:xfrm><a:off x="0" y="0"/><a:ext cx="0" cy="0"/><a:chOff x="0" y="0"/><a:chExt cx="0" cy="0"/></a:xfrm></p:grpSpPr></p:spTree></p:cSld><p:clrMap bg1="lt1" tx1="dk1" bg2="lt2" tx2="dk2" accent1="accent1" accent2="accent2" accent3="accent3" accent4="accent4" accent5="accent5" accent6="accent6" hlink="hlink" folHlink="folHlink"/><p:sldLayoutIdLst><p:sldLayoutId id="2147483649" r:id="rId1"/></p:sldLayoutIdLst></p:sldMaster>'
$slideMasterRels = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?><Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships"><Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/slideLayout" Target="../slideLayouts/slideLayout1.xml"/><Relationship Id="rId2" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/theme" Target="../theme/theme1.xml"/></Relationships>'

function Escribir-Pptx([string]$rutaSalida, [string[]]$slidesXml, [string]$titulo) {
  New-Item -ItemType Directory -Force (Split-Path $rutaSalida) | Out-Null
  if (Test-Path $rutaSalida) { [IO.File]::Delete($rutaSalida) }
  $zip = [System.IO.Compression.ZipFile]::Open($rutaSalida, [System.IO.Compression.ZipArchiveMode]::Create)
  try {
    function Add-Entrada([string]$nombre, [string]$contenido) {
      $e = $zip.CreateEntry($nombre, [System.IO.Compression.CompressionLevel]::Optimal); $e.LastWriteTime = $fechaFija
      $s = $e.Open(); $w = New-Object System.IO.StreamWriter($s, [System.Text.UTF8Encoding]::new($false)); $w.Write($contenido); $w.Flush(); $w.Dispose(); $s.Dispose()
    }
    function Add-Binario([string]$nombre, [string]$ruta) {
      $e = $zip.CreateEntry($nombre, [System.IO.Compression.CompressionLevel]::Optimal); $e.LastWriteTime = $fechaFija
      $s = $e.Open(); $b = [IO.File]::ReadAllBytes($ruta); $s.Write($b, 0, $b.Length); $s.Dispose()
    }
    $n = $slidesXml.Count
    $overrides = ''; $presRelsSlides = ''; $sldIdLst = ''; $mediaHechas = @{}
    for ($i = 1; $i -le $n; $i++) {
      $overrides += "<Override PartName=""/ppt/slides/slide$i.xml"" ContentType=""application/vnd.openxmlformats-officedocument.presentationml.slide+xml""/>"
      $presRelsSlides += "<Relationship Id=""rIdS$i"" Type=""http://schemas.openxmlformats.org/officeDocument/2006/relationships/slide"" Target=""slides/slide$i.xml""/>"
      $sldIdLst += "<p:sldId id=""$(255 + $i)"" r:id=""rIdS$i""/>"
      $xml = $slidesXml[$i - 1]
      Add-Entrada "ppt/slides/slide$i.xml" $xml
      $rels = '<Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/slideLayout" Target="../slideLayouts/slideLayout1.xml"/>'
      foreach ($clave in ([regex]::Matches($xml, 'r:embed="rIdImg_([\w]+)"') | ForEach-Object { $_.Groups[1].Value } | Select-Object -Unique)) {
        if (-not $mediaHechas.ContainsKey($clave)) { Add-Binario "ppt/media/$clave.png" $script:IMAGENES[$clave].ruta; $mediaHechas[$clave] = $true }
        $rels += "<Relationship Id=""rIdImg_$clave"" Type=""http://schemas.openxmlformats.org/officeDocument/2006/relationships/image"" Target=""../media/$clave.png""/>"
      }
      Add-Entrada "ppt/slides/_rels/slide$i.xml.rels" "<?xml version=""1.0"" encoding=""UTF-8"" standalone=""yes""?><Relationships xmlns=""http://schemas.openxmlformats.org/package/2006/relationships"">$rels</Relationships>"
    }
    $f = $fechaFija.ToString('yyyy-MM-ddTHH:mm:ssZ')
    Add-Entrada '[Content_Types].xml' ($contentTypes -f $overrides)
    Add-Entrada '_rels/.rels' $rootRels
    Add-Entrada 'docProps/core.xml' "<?xml version=""1.0"" encoding=""UTF-8"" standalone=""yes""?><cp:coreProperties xmlns:cp=""http://schemas.openxmlformats.org/package/2006/metadata/core-properties"" xmlns:dc=""http://purl.org/dc/elements/1.1/"" xmlns:dcterms=""http://purl.org/dc/terms/"" xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance""><dc:title>$(Xml $titulo)</dc:title><dc:creator>Fernando García Varela</dc:creator><cp:lastModifiedBy>SEVEN-G build</cp:lastModifiedBy><dcterms:created xsi:type=""dcterms:W3CDTF"">$f</dcterms:created><dcterms:modified xsi:type=""dcterms:W3CDTF"">$f</dcterms:modified></cp:coreProperties>"
    Add-Entrada 'docProps/app.xml' "<?xml version=""1.0"" encoding=""UTF-8"" standalone=""yes""?><Properties xmlns=""http://schemas.openxmlformats.org/officeDocument/2006/extended-properties""><Application>SEVEN-G build</Application><Slides>$n</Slides><Company>Fernando García Varela</Company></Properties>"
    Add-Entrada 'ppt/theme/theme1.xml' $theme
    Add-Entrada 'ppt/slideLayouts/slideLayout1.xml' $slideLayout
    Add-Entrada 'ppt/slideLayouts/_rels/slideLayout1.xml.rels' $slideLayoutRels
    Add-Entrada 'ppt/slideMasters/slideMaster1.xml' $slideMaster
    Add-Entrada 'ppt/slideMasters/_rels/slideMaster1.xml.rels' $slideMasterRels
    Add-Entrada 'ppt/presentation.xml' "<?xml version=""1.0"" encoding=""UTF-8"" standalone=""yes""?><p:presentation xmlns:a=""http://schemas.openxmlformats.org/drawingml/2006/main"" xmlns:r=""http://schemas.openxmlformats.org/officeDocument/2006/relationships"" xmlns:p=""http://schemas.openxmlformats.org/presentationml/2006/main""><p:sldMasterIdLst><p:sldMasterId id=""2147483648"" r:id=""rIdM1""/></p:sldMasterIdLst><p:sldIdLst>$sldIdLst</p:sldIdLst><p:sldSz cx=""12192000"" cy=""6858000"" type=""screen16x9""/><p:notesSz cx=""6858000"" cy=""9144000""/></p:presentation>"
    Add-Entrada 'ppt/_rels/presentation.xml.rels' "<?xml version=""1.0"" encoding=""UTF-8"" standalone=""yes""?><Relationships xmlns=""http://schemas.openxmlformats.org/package/2006/relationships""><Relationship Id=""rIdM1"" Type=""http://schemas.openxmlformats.org/officeDocument/2006/relationships/slideMaster"" Target=""slideMasters/slideMaster1.xml""/><Relationship Id=""rIdT1"" Type=""http://schemas.openxmlformats.org/officeDocument/2006/relationships/theme"" Target=""theme/theme1.xml""/>$presRelsSlides</Relationships>"
  } finally { $zip.Dispose() }
}

# =====================================================================================
# CONTENIDO
# =====================================================================================

$script:EN = $false
function L([string]$es, [string]$en) { if ($script:EN) { $en } else { $es } }
function T([string]$nombre, [string]$color, [string]$texto) { [pscustomobject]@{ nombre = $nombre; color = $color; texto = $texto } }
function C([string]$fase, [string]$nombre, [string]$color, [string]$que, [string]$rellena, [string]$puerta) { [pscustomobject]@{ fase = $fase; nombre = $nombre; color = $color; que = $que; rellena = $rellena; puerta = $puerta } }

$PUERTAS = @('G0', 'G1', 'G2', 'G3', 'G4', 'G5', 'R6', 'G7')
function Fases() {
  @((L 'Contexto y restricciones' 'Context and constraints'), (L 'Descubrimiento de oportunidades' 'Opportunity discovery'), (L 'Hipótesis de valor' 'Value hypothesis'), (L 'Viabilidad y riesgo' 'Feasibility and risk'),
    (L 'Diseño de la solución' 'Solution design'), (L 'Entrega y validación' 'Delivery and validation'), (L 'Operación y gobierno' 'Operation and governance'), (L 'Evolución o retirada' 'Evolution or retirement'))
}
function Etapas() {
  @("$(L 'Propuesto' 'Proposed')|0|1|$VELVET", "$(L 'Hipótesis de valor' 'Value hypothesis')|2|2|$OXFORD", "$(L 'Prueba de concepto' 'Proof of concept')|3|3|$ORO", "$(L 'En desarrollo' 'In development')|4|5|$NEGRO", "$(L 'En uso' 'In use')|6|7|$VERDE")
}

# ---- tronco común: qué es y cómo funciona ----
function Bloque-Que-Es() {
  @(
    (Diapositiva-Texto (L 'El problema que resuelve' 'The problem it solves') @(
      (L 'Muchas compañías tienen pilotos de IA que funcionan, pero pocos llegan a producción.' 'Many companies have AI pilots that work, but few reach production.'),
      (L 'El valor se declara («liberamos 200 horas») y casi nadie lo comprueba.' 'Value gets declared ("we freed up 200 hours") and almost nobody checks it.'),
      (L 'Nadie tiene autoridad clara para parar una iniciativa que no funciona.' 'Nobody has clear authority to stop an initiative that is not working.'),
      (L 'El consejo pregunta por la IA y recibe una lista de proyectos técnicos, no decisiones de negocio.' 'The board asks about AI and gets a list of technical projects, not business decisions.'),
      (L '¿La compañía se está transformando con IA, o solo es un poco más eficiente? Casi nadie puede contestarlo con evidencia.' 'Is the company transforming with AI, or just a bit more efficient? Almost nobody can answer that with evidence.')
    ) (L 'No es un problema de tecnología: es un problema de gobierno y de medición.' 'This is not a technology problem: it is a governance and measurement problem.')),

    (Diapositiva-Texto (L 'Qué es SEVEN-G y qué aporta' 'What SEVEN-G is and what it delivers') @(
      (L 'Seven-phase Enterprise Value & Governance: una fase 0 habilitante y siete fases de valor, con gobierno en todas.' 'Seven-phase Enterprise Value & Governance: an enabling phase 0 and seven value phases, with governance throughout.'),
      (L 'Ordena la IA como una cartera: cada iniciativa tiene fase, coste, valor esperado y responsable.' 'It organises AI as a portfolio: every initiative has a phase, a cost, expected value and an owner.'),
      (L 'Pone puertas de decisión entre las fases: sin evidencia verificada no se avanza.' 'It places decision gates between phases: no verified evidence, no progress.'),
      (L 'Separa quién decide, quién construye y quién controla, y traduce la regulación a fases, roles y evidencias.' 'It separates who decides, who builds and who controls, and turns regulation into phases, roles and evidence.'),
      (L 'Mide el valor en dinero y con estado —validado, declarado o estimado— y se lo enseña al consejo en un panel.' 'It measures value in money and with a status —validated, declared or estimated— and shows it to the board on a dashboard.'),
      (L 'Es gratuito y modificable: documentos, plantillas en Word y herramientas, con licencia abierta.' 'It is free and modifiable: documents, Word templates and tools, under an open licence.')
    )),

    (Diapositiva-Texto (L 'Dos niveles: la compañía y cada iniciativa' 'Two levels: the company and each initiative') @(
      (L 'C1 · Diagnóstico: inventario, madurez en siete dimensiones e índice de transformación.' 'C1 · Diagnosis: inventory, maturity across seven dimensions and the transformation index.'),
      (L 'C2 · Dirección: el consejo aprueba la tesis de IA, la ambición por esfera y el apetito de riesgo.' 'C2 · Direction: the board approves the AI thesis, ambition per sphere and risk appetite.'),
      (L 'C3 · Cartera: qué iniciativas se financian y en qué orden.' 'C3 · Portfolio: which initiatives get funded, and in what order.'),
      (L 'C4 · Supervisión: panel del consejo y registro de decisiones y recomendaciones.' 'C4 · Oversight: board dashboard and the log of decisions and recommendations.'),
      (L 'C5 · Revisión anual: qué funcionó, qué no y qué cambia.' 'C5 · Annual review: what worked, what did not and what changes.'),
      (L 'Y, dentro de esa cartera, cada iniciativa recorre su propio ciclo de vida de ocho fases.' 'And, inside that portfolio, each initiative goes through its own eight-phase lifecycle.')
    )),

    (Diapositiva-Fases (L 'El ciclo de vida de una iniciativa' "An initiative's lifecycle") (L 'Ocho fases con una puerta de decisión al final de cada una; debajo, la etapa del embudo en la que se ve cada fase' 'Eight phases with a decision gate at the end of each; below, the funnel stage where each phase shows up') (Fases) $PUERTAS @() $TEAL '' (Etapas)),

    (Diapositiva-Tarjetas (L 'Qué puede pasar en cada puerta' 'What can happen at each gate') (L 'Cinco resultados; quien aporta la evidencia nunca es quien verifica ni quien decide' 'Five outcomes; whoever provides the evidence never verifies it or decides') @(
      (T (L 'Continuar' 'Proceed') $TEAL (L 'Se cumplen todos los criterios y las evidencias están verificadas: pasa a la fase siguiente.' 'All criteria are met and the evidence is verified: it moves to the next phase.')),
      (T (L 'Con condiciones' 'With conditions') $OXFORD (L 'Pasa, con plazo y responsable para lo pendiente. Nunca para controles críticos de seguridad, legales o de supervisión humana.' 'It proceeds, with a deadline and owner for what is pending. Never for critical security, legal or human-oversight controls.')),
      (T (L 'Iterar' 'Iterate') $ORO (L 'Se repite la fase con un ajuste concreto y se vuelve a la misma puerta. A la tercera, decide el órgano superior.' 'The phase repeats with a specific adjustment and returns to the same gate. The third time, the higher body decides.')),
      (T (L 'Pivotar' 'Pivot') $VELVET (L 'La hipótesis no se sostiene pero hay otra razonable: vuelve a la fase 2. Solo en G1, G2 y G3.' 'The hypothesis does not hold but another reasonable one exists: back to phase 2. Only at G1, G2 and G3.')),
      (T (L 'Parar' 'Stop') $CLARET (L 'No hay valor plausible o el riesgo es inaceptable. Se registran el motivo y lo aprendido. Es un buen resultado.' 'No plausible value, or unacceptable risk. The reason and lessons are recorded. It is a good outcome.'))
    ) (L 'En G7 los resultados son Escalar, Iterar o Retirar.' 'At G7 the outcomes are Scale, Iterate or Retire.'))
  )
}

# ---- tronco común: del documento al embudo y al panel ----
function Bloque-Proceso() {
  $rQ = L 'Qué se hace.' 'What is done.'; $rR = L 'Se rellena.' 'Filled in.'
  $nota = L 'Cada decisión de puerta se deja en P29 y en el registro T01, con el estado de cada criterio y su evidencia.' 'Every gate decision is recorded in P29 and in the T01 register, with the status of each criterion and its evidence.'
  @(
    (Diapositiva-Seccion (L 'DEL DOCUMENTO AL PANEL' 'FROM DOCUMENT TO DASHBOARD') (L 'Cómo se llena el embudo' 'How the funnel gets filled') (L 'Nadie dibuja el embudo ni el panel: salen solos de lo que se rellena y se decide en cada fase. Este es el recorrido.' 'Nobody draws the funnel or the dashboard: they come out of what is filled in and decided at each phase. This is the path.')),

    (Diapositiva-Proceso (L 'Fases 0 a 3: de la idea a la prueba de concepto' 'Phases 0 to 3: from idea to proof of concept') (L 'Qué se hace, qué plantillas se rellenan y qué puerta cierra cada fase' 'What is done, which templates are filled in and which gate closes each phase') @(
      (C 'F0' (L 'Contexto y restricciones' 'Context and constraints') $TINTA2 (L 'Se autoriza la idea: patrocinador, responsable, alcance, restricciones e intensidad (Lite o Enterprise).' 'The idea is authorised: sponsor, owner, scope, constraints and intensity (Lite or Enterprise).') (L 'P01 Carta de la iniciativa · P02 Contexto y restricciones · P03 Roles · P04 Intensidad · P05 Alta en el inventario.' 'P01 Initiative charter · P02 Context and constraints · P03 Roles · P04 Intensity · P05 Inventory entry.') (L 'G0 → entra en «Propuesto»' 'G0 → enters "Proposed"')),
      (C 'F1' (L 'Descubrimiento' 'Discovery') $OXFORD (L 'Se comparan oportunidades, también alternativas sin IA, y se propone esfera y nivel de ambición.' 'Opportunities are compared, including non-AI alternatives, and a sphere and ambition level are proposed.') (L 'P06 Cartera de oportunidades y filtrado · P07 Esfera y ambición · P31 Ficha de caso de uso.' 'P06 Opportunity portfolio and screening · P07 Sphere and ambition · P31 Use case sheet.') (L 'G1 → sigue en «Propuesto»' 'G1 → stays in "Proposed"')),
      (C 'F2' (L 'Hipótesis de valor' 'Value hypothesis') $OXFORD (L 'Hipótesis falsable en dinero, con línea base, método de atribución y criterios de parada fijados antes de empezar.' 'A falsifiable hypothesis in money, with baseline, attribution method and stop criteria set in advance.') (L 'P08 Lienzo de hipótesis de valor · P09 Línea base. Apoyo: calculadora T11.' 'P08 Value hypothesis canvas · P09 Baseline. Support: T11 calculator.') (L 'G2 → «Hipótesis de valor»' 'G2 → "Value hypothesis"')),
      (C 'F3' (L 'Viabilidad y riesgo' 'Feasibility and risk') $OXFORD (L 'Prueba de concepto: viabilidad, clasificación regulatoria, riesgos y proveedores. Es la principal puerta de parada.' 'Proof of concept: feasibility, regulatory classification, risks and suppliers. It is the main stop gate.') (L 'P10 Viabilidad · P11 Clasificación regulatoria e impacto · P12 Riesgos · P13 Mitigación · P14 Proveedor.' 'P10 Feasibility · P11 Regulatory classification and impact · P12 Risks · P13 Mitigation · P14 Supplier.') (L 'G3 → «Prueba de concepto»' 'G3 → "Proof of concept"'))
    ) $rQ $rR $nota),

    (Diapositiva-Proceso (L 'Fases 4 a 7: del diseño a la producción y la retirada' 'Phases 4 to 7: from design to production and retirement') (L 'La puesta en producción no cierra el ciclo: abre la operación, con revisiones periódicas' 'Go-live does not close the cycle: it opens operation, with periodic reviews') @(
      (C 'F4' (L 'Diseño de la solución' 'Solution design') $VELVET (L 'Antes de construir: arquitectura, linaje de datos y modelos, supervisión humana, seguridad, reversión y adopción.' 'Before building: architecture, data and model lineage, human oversight, security, rollback and adoption.') (L 'P15 Arquitectura · P16 Linaje · P17 Supervisión humana · P18 Seguridad · P19 Reversión · P20 Adopción.' 'P15 Architecture · P16 Lineage · P17 Human oversight · P18 Security · P19 Rollback · P20 Adoption.') (L 'G4 → «En desarrollo»' 'G4 → "In development"')),
      (C 'F5' (L 'Entrega y validación' 'Delivery and validation') $VELVET (L 'Se construye, se valida y se pilota; se prueba la reversión y se firma la puesta en producción.' 'Build, validate and pilot; the rollback is tested and go-live is signed off.') (L 'P21 Informe de entrega · P22 Validación y piloto · P23 Firma de puesta en producción · P12 actualizado.' 'P21 Delivery report · P22 Validation and pilot · P23 Go-live sign-off · P12 updated.') (L 'G5 → pasa a «En uso»' 'G5 → moves to "In use"')),
      (C 'F6' (L 'Operación y gobierno' 'Operation and governance') $TEAL (L 'Monitorización, incidentes, cambios y seguimiento del valor realizado, con revisión de continuidad periódica.' 'Monitoring, incidents, changes and tracking of realised value, with a periodic continuity review.') (L 'P24 Manual de operación · P25 Monitorización · P26 y P27 Incidentes y cambios · P28 Valor · P65 Paquete R6.' 'P24 Operations manual · P25 Monitoring · P26 and P27 Incidents and changes · P28 Value · P65 R6 pack.') (L 'R6 → sigue «En uso» o adelanta G7' 'R6 → stays "In use" or brings G7 forward')),
      (C 'F7' (L 'Evolución o retirada' 'Evolution or retirement') $TEAL (L 'Con el valor realizado delante se decide escalar, iterar o retirar, y se registran las lecciones.' 'With realised value on the table, the decision is to scale, iterate or retire, and lessons are recorded.') (L 'P28 Seguimiento del valor · P30 Decisión de escalado o retirada, con plan de retirada si procede.' 'P28 Value tracking · P30 Scale-or-retire decision, with a retirement plan where applicable.') (L 'G7 → escala, itera o «Desenganchado»' 'G7 → scale, iterate or "Disengaged"'))
    ) $rQ $rR $nota),

    (Diapositiva-Imagen (L 'El registro de iniciativas (T01): donde todo queda anotado' 'The initiative register (T01): where everything is recorded') (L 'Cada iniciativa se da de alta como una oportunidad en un CRM; aquí, el registro de ejemplo con datos ficticios' 'Each initiative is entered like an opportunity in a CRM; here, the sample register with fictitious data') 'registro' (L 'Vista de embudo del registro de iniciativas T01' 'Funnel view of the T01 initiative register') @(
      (L 'Una barra por fase: cuántas iniciativas hay ahora en cada una y cuánto valor esperado llevan.' 'One bar per phase: how many initiatives are in each one now and how much expected value they carry.'),
      (L 'Al decidir una puerta, el registro guarda la fecha, el resultado, quién verificó y quién decidió, y el estado de cada criterio.' 'When a gate is decided, the register stores the date, the outcome, who verified and who decided, and the status of each criterion.'),
      (L 'Con esas fechas calcula solo el tiempo en fase y marca «estancadas» las que superan el plazo de referencia.' 'From those dates it works out time in phase by itself and flags as "stalled" those beyond the reference time limit.'),
      (L 'Las cifras llevan estado: validado, declarado o estimado. Lo que no se sabe queda «sin dato», nunca cero.' 'Figures carry a status: validated, declared or estimated. What is unknown stays "no data", never zero.'),
      (L 'Alertas: puertas pendientes, condiciones vencidas, riesgos sin responsable.' 'Alerts: pending gates, overdue conditions, risks without an owner.'),
      (L 'Todo se guarda en un fichero JSON de la propia compañía: sin servidor y sin enviar datos a nadie.' "Everything is saved in the company's own JSON file: no server and no data sent to anyone.")
    ) 6900000),

    (Diapositiva-Imagen (L 'El embudo de la cartera: cómo se lee' 'The portfolio funnel: how to read it') (L 'La cartera de IA, leída como un embudo comercial. Datos ilustrativos' 'The AI portfolio, read as a sales funnel. Illustrative data') 'embudo' (L 'Embudo de iniciativas de IA con sus etapas, salidas y casos en uso' 'Funnel of AI initiatives with its stages, exits and cases in use') @(
      (L 'Dentro del embudo, solo lo que está en curso: 5 propuestas, 4 con hipótesis de valor, 3 en prueba de concepto y 4 en desarrollo.' 'Inside the funnel, only what is in progress: 5 proposed, 4 with a value hypothesis, 3 in proof of concept and 4 in development.'),
      (L 'A la izquierda, cuántas alcanzaron cada etapa (40 → 31 → 24 → 17) y cuánto tardan. El triángulo rojo avisa: la prueba de concepto supera su plazo.' 'On the left, how many reached each stage (40 → 31 → 24 → 17) and how long they take. The red triangle warns: proof of concept exceeds its time limit.'),
      (L 'A la derecha, las que no superaron cada etapa y por qué: sin valor plausible, hipótesis refutada, riesgo inaceptable, coste superior al valor.' 'On the right, those that did not pass each stage and why: no plausible value, hypothesis refuted, unacceptable risk, cost above value.'),
      (L 'Debajo, las que ya lo atravesaron: 11 en uso, con su valor y su coste, y 1 desenganchada.' 'Below, those that made it through: 11 in use, with their value and cost, and 1 disengaged.'),
      (L 'No se busca convertir más: parar en G3 una iniciativa inviable es un buen resultado. Un 100 % de conversión indicaría puertas blandas.' 'The goal is not to convert more: stopping an unviable initiative at G3 is a good outcome. 100% conversion would point to soft gates.')
    ) 7500000),

    (Diapositiva-Imagen (L 'El panel del consejo (T17): cómo se lee' 'The board dashboard (T17): how to read it') (L 'Se genera del mismo registro, sin volver a teclear nada. Datos ficticios' 'It is generated from the same register, with nothing typed twice. Fictitious data') 'panel' (L 'Panel del consejo con las tarjetas de cartera y valor' 'Board dashboard with the portfolio and value cards') @(
      (L '15 casos: cuántos hay en uso, en desarrollo, en prueba de concepto, propuestos y fuera.' '15 cases: how many are in use, in development, in proof of concept, proposed and out.'),
      (L 'Costes 2,4 M€ al año y retorno total 7,3 M€ (eficiencias más retorno): el neto anual es 4,8 M€.' 'Costs of €2.4M a year and total return of €7.3M (efficiencies plus return): annual net is €4.8M.'),
      (L 'La tarjeta amarilla es la importante: solo el 36 % del valor está validado por control de gestión. El resto es declarado o estimado.' 'The yellow card is the one that matters: only 36% of the value is validated by finance. The rest is declared or estimated.'),
      (L 'La capacidad liberada que no se materializa aparece aparte y no suma.' 'Released capacity that has not been materialised is shown separately and does not add up.'),
      (L 'En rojo: solo 3 de 15 casos tienen todos los controles (evaluaciones de impacto, seguridad, manual de uso).' 'In red: only 3 of 15 cases have all the controls (impact assessments, security, user manual).'),
      (L 'Otras páginas: embudo y ciclo de vida, histórico y adopción, riesgo y cumplimiento, inventario.' 'Other pages: funnel and lifecycle, history and adoption, risk and compliance, inventory.')
    ) 6700000 (L 'Si una cifra del panel no gusta, no se retoca el panel: se corrige la evidencia en el registro y se vuelve a generar.' 'If a figure on the dashboard looks wrong, the dashboard is not touched: the evidence is fixed in the register and it is generated again.'))
  )
}

function Bloque-Ejemplos() {
  $f = Fases
  @(
    (Diapositiva-Seccion (L 'DOS EJEMPLOS' 'TWO EXAMPLES') (L 'Una iniciativa que se para y otra que llega a producción' 'One initiative that stops and one that reaches production') (L 'Datos ficticios, ilustrativos: no describen ninguna compañía real.' 'Fictitious, illustrative data: they do not describe any real company.')),

    (Diapositiva-Ejemplo (L 'Ejemplo 1 · Cuando una iniciativa se para' 'Example 1 · When an initiative stops') (L 'Cribado de candidaturas en procesos de selección (RR. HH.)' 'Candidate screening in recruitment (HR)') @(
      (L 'Fases 0 y 1: RR. HH. la patrocina (P01–P05). Al decidir sobre personas, la intensidad es Enterprise (P04). Entra en «Propuesto».' 'Phases 0 and 1: HR sponsors it (P01–P05). Because it decides about people, intensity is Enterprise (P04). It enters "Proposed".'),
      (L 'Fase 2: la hipótesis (P08) promete un 40 % menos de tiempo de cribado frente a la línea base (P09). El piloto lo confirma: G2, Continuar.' 'Phase 2: the hypothesis (P08) promises 40% less screening time against the baseline (P09). The pilot confirms it: G2, Proceed.'),
      (L 'Fase 3: la clasificación regulatoria (P11) lo sitúa como sistema de alto riesgo. La prueba de sesgo detecta que penaliza a candidatos de más edad.' 'Phase 3: the regulatory classification (P11) makes it a high-risk system. The bias test finds it penalises older candidates.'),
      (L 'Se itera dos veces ajustando variables: corregir el sesgo destruye la capacidad predictiva que justificaba el proyecto.' 'It iterates twice, adjusting variables: fixing the bias destroys the predictive power that justified the project.'),
      (L 'G3: riesgo residual alto sin mitigación viable (P12, P13). El comité de IA decide Parar; queda en P29 con su motivo.' 'G3: high residual risk with no viable mitigation (P12, P13). The AI committee decides to Stop; it is recorded in P29 with its reason.'),
      (L 'En el embudo aparece a la derecha de «Prueba de concepto»: Descartado · riesgo inaceptable. Lección: probar el sesgo antes, en la fase 2.' 'In the funnel it shows to the right of "Proof of concept": Discarded · unacceptable risk. Lesson: test for bias earlier, in phase 2.')
    ) (L 'PARADA EN G3 · SE EVITÓ CONSTRUIR Y OPERAR UN SISTEMA INVIABLE' 'STOPPED AT G3 · BUILDING AND RUNNING AN UNVIABLE SYSTEM WAS AVOIDED') $CLARET),

    (Diapositiva-Fases (L 'La iniciativa 1, sobre el ciclo de vida' 'Initiative 1, on the lifecycle') (L 'Llegó a la fase 3 y no superó la puerta G3' 'It reached phase 3 and did not pass gate G3') $f $PUERTAS @(0, 1, 2, 3) $CLARET (L 'PARADA EN G3 · sale del embudo como «Descartado», con su motivo' 'STOPPED AT G3 · it leaves the funnel as "Discarded", with its reason')),

    (Diapositiva-Ejemplo (L 'Ejemplo 2 · Cuando una iniciativa llega a producción' 'Example 2 · When an initiative reaches production') (L 'Asistente de respuesta a incidencias de TI de primer nivel' 'First-line IT incident response assistant') @(
      (L 'Fases 0 y 1: TI la patrocina; frente a la alternativa sin IA (más plantilla), se propone la esfera de operaciones con ambición Optimizar (P07).' 'Phases 0 and 1: IT sponsors it; against the non-AI alternative (more staff), the operations sphere with Optimise ambition is proposed (P07).'),
      (L 'Fase 2: hipótesis de un 30 % menos de tiempo de resolución en incidencias sencillas; el piloto controlado da un 32 %.' 'Phase 2: hypothesis of 30% less resolution time for simple incidents; the controlled pilot yields 32%.'),
      (L 'Fase 3: sin sesgo relevante, riesgo residual medio aceptado por su órgano (P12), proveedor evaluado (P14). G3, Continuar.' 'Phase 3: no relevant bias, medium residual risk accepted by the right body (P12), supplier assessed (P14). G3, Proceed.'),
      (L 'Fases 4 y 5: supervisión humana obligatoria por encima de cierta gravedad (P17), reversión probada (P19) y firma de puesta en producción (P23).' 'Phases 4 and 5: mandatory human oversight above a severity level (P17), tested rollback (P19) and go-live sign-off (P23).'),
      (L 'Fase 6: catorce meses en uso. Control de gestión valida 1,1 M€ al año (P28); la capacidad liberada se reasignó a incidencias complejas.' 'Phase 6: fourteen months in use. Finance validates €1.1M a year (P28); released capacity was reassigned to complex incidents.'),
      (L 'En el embudo está en «En uso»; en el panel suma al neto anual porque su valor está validado, no declarado.' 'In the funnel it sits under "In use"; on the dashboard it adds to annual net because its value is validated, not declared.')
    ) (L 'EN PRODUCCIÓN · 1,1 M€ DE RETORNO ANUAL VALIDADO · R6 TRIMESTRAL' 'IN PRODUCTION · €1.1M OF VALIDATED ANNUAL RETURN · QUARTERLY R6') $TEAL),

    (Diapositiva-Fases (L 'La iniciativa 2, sobre el ciclo de vida' 'Initiative 2, on the lifecycle') (L 'Recorrió las fases 0 a 6 y sigue en uso; la fase 7 llegará con G7' 'It went through phases 0 to 6 and remains in use; phase 7 will come with G7') $f $PUERTAS @(0, 1, 2, 3, 4, 5, 6) $TEAL (L 'EN USO · cada R6 confirma que sigue aportando valor bajo control' 'IN USE · each R6 confirms it keeps delivering value under control')),

    (Diapositiva-Texto (L 'Cómo se mide el valor' 'How value is measured') @(
      (L 'Todo importe lleva fórmula y estado: validado (control de gestión), declarado (el equipo) o estimado.' 'Every amount carries a formula and a status: validated (finance), declared (the team) or estimated.'),
      (L 'Las horas liberadas no son ahorro hasta que se materializan: baja un coste o se reasignan a una actividad con valor.' 'Released hours are not savings until they are materialised: a cost goes down or they are reassigned to a valuable activity.'),
      (L 'El coste es completo: construcción, consumo, operación, supervisión humana y retirada.' 'Cost is complete: build, consumption, operation, human oversight and retirement.'),
      (L 'El índice de transformación usa ocho señales de evidencia para separar transformar de solo eficientar.' 'The transformation index uses eight evidence signals to tell transformation apart from mere efficiency.'),
      (L 'Diez reglas de medición (documento 40). Ninguna cifra entra en el neto de la cartera sin su estado.' 'Ten measurement rules (document 40). No figure enters the portfolio net without its status.')
    ))
  )
}

# ---- bloque propio: empresa (autoconsultoría) ----
function Bloque-Empresa() {
  @(
    (Diapositiva-Seccion (L 'AUTOCONSULTORÍA' 'SELF-CONSULTING') (L 'Implantarlo en su compañía, por sus propios medios' 'Implementing it in your company, by your own means') (L 'El marco está pensado para aplicarse sin contratar a nadie. Esto es lo que hace falta y en qué orden.' 'The framework is designed to be applied without hiring anyone. This is what it takes, and in what order.')),

    (Diapositiva-Texto (L 'Antes de empezar: lo que la compañía necesita' 'Before starting: what the company needs') @(
      (L 'Mandato de implantación firmado por la primera línea ejecutiva, con objetivo, perímetro y plazo (P32).' 'An implementation mandate signed by the top executive, with objective, perimeter and deadline (P32).'),
      (L 'El consejo conoce el plan y reserva una sesión hacia la semana 12 para aprobar la dirección (C2).' 'The board knows the plan and reserves a session around week 12 to approve the direction (C2).'),
      (L 'Un responsable de implantación con dedicación real y un equipo núcleo: negocio, tecnología, datos, riesgos, cumplimiento, seguridad, personas y control de gestión.' 'An implementation lead with real dedication and a core team: business, technology, data, risk, compliance, security, people and finance.'),
      (L 'Auditoría interna informada y asesoría jurídica disponible para la clasificación regulatoria.' 'Internal audit informed and legal counsel available for regulatory classification.'),
      (L 'Un soporte de registro: T01, o una hoja de cálculo con los mismos campos.' 'A register: T01, or a spreadsheet with the same fields.'),
      (L 'Sin moratoria: la actividad de IA sigue; solo se detiene lo que el diagnóstico señale como riesgo inaceptable.' 'No moratorium: AI activity continues; only what the diagnosis flags as unacceptable risk is stopped.')
    )),

    (Diapositiva-Texto (L 'Lite o Enterprise: proporcionalidad' 'Lite or Enterprise: proportionality') @(
      (L 'Dos decisiones distintas: el alcance de implantación es de la compañía; la intensidad, de cada iniciativa.' 'Two different decisions: implementation scope belongs to the company; intensity, to each initiative.'),
      (L 'El tamaño no decide. Basta un criterio Enterprise en una iniciativa: alto riesgo, decisiones sobre personas, exposición directa, agentes que actúan, datos protegidos, función crítica, Transformar o inversión alta.' 'Size does not decide. One Enterprise criterion is enough for an initiative: high risk, decisions about people, direct exposure, acting agents, protected data, critical function, Transform or high investment.'),
      (L 'Ruta mínima Lite: consejo con punto de IA trimestral, comité de dirección mensual y oficina de IA de una persona a tiempo parcial.' 'Minimum Lite path: board with a quarterly AI item, monthly executive committee and a one-person part-time AI office.'),
      (L 'En Lite las puertas se agrupan (G0–G2 juntas, G4–G5 juntas, R6 semestral). G3 va siempre por separado.' 'In Lite, gates are grouped (G0–G2 together, G4–G5 together, six-monthly R6). G3 always stands alone.'),
      (L 'Ninguna evidencia obligatoria se omite en Lite: se simplifica. El inventario nunca se reduce.' 'No mandatory evidence is skipped in Lite: it is simplified. The inventory is never reduced.')
    ) (L 'Documento 90, sección 2.4, y matriz de obligatoriedad (documento 94).' 'Document 90, section 2.4, and the obligation matrix (document 94).')),

    (Diapositiva-Tarjetas (L 'El plan de 90 días' 'The 90-day plan') (L 'Tres meses, tres resultados y una decisión del consejo' 'Three months, three results and one board decision') @(
      (T (L 'Mes 1 · Diagnóstico (C1)' 'Month 1 · Diagnosis (C1)') $OXFORD (L 'Mandato (P32). Inventario de toda la IA, también la de terceros y la no autorizada, con declaración de completitud. Madurez con evidencia (T15) e índice de transformación (T14). Hito 1: informe C1 verificado (P33).' 'Mandate (P32). Inventory of all AI, including third-party and unauthorised, with a completeness statement. Evidence-based maturity (T15) and transformation index (T14). Milestone 1: verified C1 report (P33).')),
      (T (L 'Mes 2 · Riesgos y oportunidades' 'Month 2 · Risks and opportunities') $VELVET (L 'Talleres por esfera: riesgos de lo que ya existe (P11, P12) y oportunidades con valor estimado (P06, P07). Borrador de tesis de IA, ambición y apetito de riesgo (P35). Hito 2: propuesta de C2 lista para el consejo.' 'Workshops per sphere: risks of what already exists (P11, P12) and opportunities with estimated value (P06, P07). Draft AI thesis, ambition and risk appetite (P35). Milestone 2: C2 proposal ready for the board.')),
      (T (L 'Mes 3 · Gobierno y cartera' 'Month 3 · Governance and portfolio') $TEAL (L 'Órganos y roles sin incompatibilidades (P38, P03), puertas y políticas, primer panel con datos reales (T17) y cartera priorizada (P36). El consejo aprueba C2 y el comité, C3. Hito 3: régimen ordinario.' 'Bodies and roles with no incompatibilities (P38, P03), gates and policies, first dashboard with real data (T17) and prioritised portfolio (P36). The board approves C2 and the committee, C3. Milestone 3: business as usual.'))
    ) (L 'Desde la semana 13, ninguna iniciativa nueva consume presupuesto sin pasar por G0.' 'From week 13, no new initiative spends budget without going through G0.')),

    (Diapositiva-Texto (L 'Tres garantías que no se negocian, ni en pequeño' 'Three guarantees that are never negotiable, even at small scale') @(
      (L 'Quien construye no verifica ni decide su propio trabajo.' 'Whoever builds neither verifies nor decides on their own work.'),
      (L 'La conformidad de riesgos la emite alguien independiente del equipo.' 'Risk sign-off comes from someone independent of the team.'),
      (L 'El consejo aprueba la dirección y el apetito de riesgo: no se delega.' 'The board approves the direction and the risk appetite: this is not delegated.'),
      (L 'Una misma persona puede tener varios roles si no son incompatibles; el registro T01 lo comprueba (P03).' 'One person can hold several roles if they are not incompatible; the T01 register checks it (P03).'),
      (L 'Lo existente se regulariza con plazos aprobados, no se ignora: inventario primero, después riesgos y después puertas.' 'What already exists is regularised with approved deadlines, not ignored: inventory first, then risks, then gates.')
    )),

    (Diapositiva-Texto (L 'Errores frecuentes al implantarlo uno mismo' 'Common mistakes when implementing it yourself') @(
      (L 'Aplicar Enterprise a todo: el marco se vuelve pesado y se abandona. O no aplicar nada «porque somos pequeños».' 'Applying Enterprise to everything: the framework becomes heavy and is abandoned. Or applying nothing "because we are small".'),
      (L 'Rellenar las plantillas después de decidir: la documentación a posteriori invalida la puerta.' 'Filling in templates after deciding: after-the-fact documentation invalidates the gate.'),
      (L 'Sumar horas liberadas como ahorro en el panel.' 'Adding released hours as savings on the dashboard.'),
      (L 'No parar nunca nada: una cartera sin paradas no tiene puertas, tiene trámites.' 'Never stopping anything: a portfolio with no stops has formalities, not gates.'),
      (L 'Un inventario incompleto: la IA de terceros y el uso no autorizado también cuentan.' 'An incomplete inventory: third-party AI and unauthorised use count too.'),
      (L 'Dejar al consejo fuera hasta el final: su sesión se reserva el primer día.' 'Leaving the board out until the end: its session is booked on day one.')
    )),

    (Diapositiva-Texto (L 'Por dónde empezar mañana' 'Where to start tomorrow') @(
      (L 'Una tarde: abra el registro de ejemplo (T01) y su panel (T17), y responda al diagnóstico de madurez (T15) con su situación real.' 'One afternoon: open the sample register (T01) and its dashboard (T17), and answer the maturity diagnostic (T15) with your real situation.'),
      (L 'Una semana: documentos 00, 01 y 90; decida alcance Lite o Enterprise y redacte el mandato (P32).' 'One week: documents 00, 01 and 90; decide Lite or Enterprise scope and draft the mandate (P32).'),
      (L 'La adopción puede ser modular: solo el registro, solo las puertas, solo la medición o solo el panel, y ampliar después.' 'Adoption can be modular: just the register, just the gates, just measurement or just the dashboard, and extend later.'),
      (L 'Si quiere acompañamiento, puede pedirlo a cualquier profesional; el documento 91 explica cómo evitar depender de él.' 'If you want support, you can ask any professional; document 91 explains how to avoid depending on them.'),
      (L 'Nada de esto exige registrarse ni contratar a nadie.' 'None of this requires registering or hiring anyone.')
    ))
  )
}

# ---- bloque propio: consultor ----
function Bloque-Consultor() {
  @(
    (Diapositiva-Seccion (L 'PARA EL CONSULTOR' 'FOR THE CONSULTANT') (L 'Aplicar SEVEN-G en los clientes, con su propia firma' 'Applying SEVEN-G at clients, under your own name') (L 'La licencia lo permite, también en servicios de pago y sin contratar al autor. A cambio pide fidelidad, independencia y honestidad.' 'The licence allows it, including in paid services and without hiring the author. In return it asks for fidelity, independence and honesty.')),

    (Diapositiva-Texto (L 'Qué le permite la licencia y qué asume usted' 'What the licence allows and what you take on') @(
      (L 'Puede usar, adaptar y aplicar el marco en servicios remunerados sin pedir permiso: basta reconocer la autoría, indicar los cambios y no sugerir respaldo del autor.' 'You may use, adapt and apply the framework in paid services without asking permission: credit the author, indicate changes and do not suggest endorsement.'),
      (L 'Responde de su servicio ante su cliente: SEVEN-G es un marco de referencia, no una garantía de resultado.' 'You answer to your client for your service: SEVEN-G is a reference framework, not a guarantee of results.'),
      (L 'Declara qué versión aplica y qué ha adaptado, en cada entregable.' 'You state which version you apply and what you have adapted, in every deliverable.'),
      (L 'La información del cliente no se usa en otros clientes ni en ejemplos, ni siquiera anonimizada, sin autorización escrita.' "Client information is not used with other clients or in examples, not even anonymised, without written authorisation."),
      (L 'La clasificación regulatoria y las cuestiones jurídicas requieren criterio jurídico cualificado; traslade el aviso legal a sus entregables.' 'Regulatory classification and legal matters require qualified legal judgement; carry the legal notice into your deliverables.')
    ) (L 'Documento 91, sección 2, y documento 93.' 'Document 91, section 2, and document 93.')),

    (Diapositiva-Texto (L 'Seis reglas que no puede omitir sin declararlo' 'Six rules you cannot drop without saying so') @(
      (L 'Separación de funciones: quien construye no controla y nadie se aprueba a sí mismo.' 'Segregation of duties: whoever builds does not control, and nobody approves themselves.'),
      (L 'Validación dual en las puertas y posibilidad real de parar.' 'Dual validation at the gates and a real ability to stop.'),
      (L 'Las diez reglas de medición: estado de cada importe, y la capacidad liberada no suma hasta materializarse.' 'The ten measurement rules: a status for every amount, and released capacity does not count until materialised.'),
      (L 'Clasificación de la ambición con las cinco preguntas.' 'Ambition classified with the five questions.'),
      (L 'Madurez basada en evidencia observable, no en autoevaluación.' 'Maturity based on observable evidence, not self-assessment.'),
      (L 'Registro de recomendaciones con identificadores persistentes y valoración independiente.' 'A recommendations log with persistent identifiers and independent assessment.')
    ) (L 'Si omite alguna, su servicio puede inspirarse en SEVEN-G, pero no presentarse como aplicación de SEVEN-G.' 'If you drop any, your service may be inspired by SEVEN-G, but must not be presented as an application of SEVEN-G.') 1700),

    (Diapositiva-Tarjetas (L 'Cinco modelos de acompañamiento' 'Five engagement models') (L 'Qué se entrega en cada uno; las duraciones son orientativas' 'What each one delivers; durations are indicative') @(
      (T (L 'M1 · Diagnóstico' 'M1 · Diagnosis') $OXFORD (L '4 a 6 semanas. Inventario, madurez con evidencia (T15), índice de transformación (T14), valor y coste actuales. Informe C1 (P33).' '4 to 6 weeks. Inventory, evidence-based maturity (T15), transformation index (T14), current value and cost. C1 report (P33).')),
      (T (L 'M2 · Implantación' 'M2 · Implementation') $VELVET (L '90 días. Tesis y apetito de riesgo, gobierno, cartera, registro T01 y panel con datos reales, y el primer paquete para el consejo.' '90 days. Thesis and risk appetite, governance, portfolio, T01 register and dashboard with real data, and the first board pack.')),
      (T (L 'M3 · Auditoría' 'M3 · Audit') $CLARET (L 'Opinión independiente: Conforme, Conforme con observaciones o No conforme. Plan, papeles e informe (P58, P59, P60).' 'Independent opinion: Compliant, Compliant with observations or Non-compliant. Plan, working papers and report (P58, P59, P60).')),
      (T (L 'M4 · Consejo' 'M4 · Board advisory') $ORO (L 'Mandato anual. Preparar sesiones, revisar el paquete trimestral, recomendaciones registradas y valoraciones independientes.' 'Annual mandate. Preparing sessions, reviewing the quarterly pack, logged recommendations and independent assessments.')),
      (T (L 'M5 · Continuo' 'M5 · Ongoing support') $TEAL (L 'Apoyo a la oficina de IA: registro, métricas del embudo y paquetes, siempre con plan de transferencia y fecha de salida (P71).' 'Support to the AI office: register, funnel metrics and packs, always with a transfer plan and an exit date (P71).'))
    ) (L 'En todos, la compañía decide; usted prepara, propone, verifica o asesora.' 'In all of them the company decides; you prepare, propose, verify or advise.')),

    (Diapositiva-Texto (L 'Independencia: quien implanta no audita' 'Independence: whoever implements does not audit') @(
      (L 'No puede verificar, auditar ni valorar de forma independiente lo que usted, su firma o una entidad vinculada ha diseñado, implantado u operado.' 'You cannot independently verify, audit or assess what you, your firm or a related entity designed, implemented or operated.'),
      (L 'Implantación (M2) y auditoría (M3) son incompatibles en el mismo ámbito; tampoco asesorar al consejo (M4) sobre lo que usted opera (M5).' 'Implementation (M2) and audit (M3) are incompatible for the same scope; neither is advising the board (M4) on what you operate (M5).'),
      (L 'Tras un servicio incompatible, deje pasar al menos un ciclo anual completo antes de auditar ese ámbito.' 'After an incompatible service, let at least one full annual cycle pass before auditing that scope.'),
      (L 'Declare por escrito sus relaciones con proveedores de tecnología, herramientas propias y esquema de honorarios (P41).' 'Declare in writing your relationships with technology vendors, your own tools and your fee scheme (P41).'),
      (L 'Honorarios ligados al valor: solo sobre valor validado por control de gestión o por una auditoría ajena a usted.' 'Value-linked fees: only on value validated by finance or by an audit that is not yours.')
    ) (L 'Documento 91, sección 5.' 'Document 91, section 5.')),

    (Diapositiva-Tarjetas (L 'Qué puede decir y qué no' 'What you can and cannot say') (L 'SEVEN-G es una marca registrada de Fernando García Varela; la licencia de contenidos no cede la marca' 'SEVEN-G is a registered trademark of Fernando García Varela; the content licence does not grant the trademark') @(
      (T (L 'Sí' 'Yes') $TEAL (L '«Servicio basado en SEVEN-G (versión …), marco de Fernando García Varela, CC BY 4.0.»   «Metodología adaptada de SEVEN-G; cambios: …»   «Utiliza el mapa de esferas y las reglas de medición de SEVEN-G.»' '"Service based on SEVEN-G (version …), a framework by Fernando García Varela, CC BY 4.0."   "Methodology adapted from SEVEN-G; changes: …"   "Uses the sphere map and measurement rules of SEVEN-G."')),
      (T (L 'No' 'No') $CLARET (L '«Certificado SEVEN-G», «consultora acreditada», «partner oficial», «avalado por el autor»: no existe certificación ni programa de socios. Tampoco «cumplimiento garantizado por SEVEN-G».' '"SEVEN-G certified", "accredited consultancy", "official partner", "endorsed by the author": there is no certification or partner programme. Nor "compliance guaranteed by SEVEN-G".')),
      (T (L 'No prometa' 'Do not promise') $ORO (L 'Un X % de ahorro antes del diagnóstico, un nivel de madurez en un plazo, «su compañía se transformará», «sin riesgo» o plazos de implantación sin haber diagnosticado.' 'X% savings before the diagnosis, a maturity level by a date, "your company will transform", "no risk", or implementation deadlines without a diagnosis.'))
    ) (L 'Documento 91, secciones 6 y 8.' 'Document 91, sections 6 and 8.')),

    (Diapositiva-Texto (L 'Sus plantillas y la salida del servicio' 'Your templates and leaving the engagement') @(
      (L 'P70 Propuesta y carta de encargo: alcance, modelo (M1–M5), fuera de alcance, roles de ambas partes e independencia.' 'P70 Proposal and engagement letter: scope, model (M1–M5), out of scope, roles on both sides and independence.'),
      (L 'P41 Declaración de independencia y conflictos de interés, al inicio de todo servicio M3 o M4.' 'P41 Declaration of independence and conflicts of interest, at the start of every M3 or M4 service.'),
      (L 'Calidad: cada entregable indica versión y adaptaciones, enlaza su evidencia y lo revisa un segundo profesional.' 'Quality: every deliverable states version and adaptations, links its evidence and is reviewed by a second professional.'),
      (L 'P71 Plan de transferencia y nota de salida: registros en formato abierto, evidencias localizadas, pendientes con responsable y riesgos abiertos.' 'P71 Transfer plan and exit note: registers in open format, evidence located, pending items with an owner and open risks.'),
      (L 'La prueba de un buen trabajo: la compañía no le necesita para leer ni para mantener nada de lo entregado.' 'The test of good work: the company does not need you to read or maintain anything you delivered.')
    ))
  )
}

# ---- bloque propio: partner (empresa que integra la metodología en la suya) ----
function Bloque-Partner() {
  @(
    (Diapositiva-Seccion (L 'PARA EL PARTNER' 'FOR THE PARTNER') (L 'Integrar SEVEN-G en su propia metodología o producto' 'Integrating SEVEN-G into your own methodology or product') (L 'Aquí, «partner» es la empresa que incorpora el marco a lo suyo bajo su licencia abierta. No existe programa de socios ni la figura de «partner oficial».' 'Here, "partner" means a company that builds the framework into its own offering under its open licence. There is no partner programme and no "official partner" status.')),

    (Diapositiva-Tarjetas (L 'Qué permite la licencia y qué exige' 'What the licence allows and what it requires') (L 'Contenidos: CC BY 4.0. Código de las herramientas: MIT' 'Content: CC BY 4.0. Tool code: MIT') @(
      (T (L 'Permite' 'It allows') $TEAL (L 'Copiar, adaptar, traducir, recortar, renombrar, mezclar con su metodología e integrar en productos, también con fines comerciales, sin pedir permiso ni pagar.' 'Copying, adapting, translating, trimming, renaming, merging with your methodology and building into products, including commercially, without asking permission or paying.')),
      (T (L 'Exige' 'It requires') $OXFORD (L 'Reconocer la autoría (Fernando García Varela), enlazar la licencia, indicar los cambios y conservar el aviso legal. En el código, mantener el aviso de derechos de autor y la licencia MIT.' 'Crediting the author (Fernando García Varela), linking the licence, indicating changes and keeping the legal notice. In code, keeping the copyright notice and the MIT licence.')),
      (T (L 'No cede' 'It does not grant') $CLARET (L 'La marca: SEVEN-G es una marca registrada. Puede nombrarla para decir con exactitud qué ha usado; no para sugerir aval, acreditación o certificación.' 'The trademark: SEVEN-G is a registered trademark. You may name it to state accurately what you used; not to suggest endorsement, accreditation or certification.'))
    ) (L 'Las versiones publicadas no se revocan: lo que integre hoy podrá seguir usándolo (documento 93).' 'Published versions are not revoked: what you integrate today you can keep using (document 93).')),

    (Diapositiva-Tarjetas (L 'Adopción modular: cuatro componentes' 'Modular adoption: four components') (L 'Puede integrar el marco entero o solo las piezas que le faltan a su metodología' 'You can integrate the whole framework or just the pieces your methodology lacks') @(
      (T (L 'A · Mapa de impacto' 'A · Impact map') $VELVET (L 'Nueve esferas por tres niveles de ambición (Optimizar, Aumentar, Transformar). Sirve para priorizar y para hablar con el consejo sin tecnología.' 'Nine spheres by three ambition levels (Optimise, Augment, Transform). Useful to prioritise and to talk to the board without technology.')),
      (T (L 'B · Gobierno' 'B · Governance') $OXFORD (L 'Fases, puertas con validación dual, separación de funciones, riesgos, regulación y no conformidades.' 'Phases, gates with dual validation, segregation of duties, risk, regulation and nonconformities.')),
      (T (L 'C · Medición' 'C · Measurement') $TEAL (L 'Diez reglas de medición, estados del importe, costes completos e índice de transformación.' 'Ten measurement rules, amount statuses, full costs and the transformation index.')),
      (T (L 'D · Herramientas' 'D · Tools') $ORO (L 'Registro T01, calculadoras, diagnóstico de madurez y panel del consejo: HTML sin servidor, datos en JSON, código MIT.' 'T01 register, calculators, maturity diagnostic and board dashboard: serverless HTML, JSON data, MIT code.'))
    ) (L 'Si lo llama «SEVEN-G», respete sus seis reglas esenciales; si no, diga «adaptado de» e indique qué cambia.' 'If you call it "SEVEN-G", respect its six essential rules; otherwise say "adapted from" and state what changes.')),

    (Diapositiva-Texto (L 'Cómo encajarlo en su metodología' 'How to fit it into your methodology') @(
      (L 'Haga una tabla de correspondencias: sus etapas frente a las fases 0 a 7, sus comités frente a los órganos, sus entregables frente a las plantillas P.' 'Build a mapping table: your stages against phases 0 to 7, your committees against the bodies, your deliverables against the P templates.'),
      (L 'Conserve los códigos (G0–G7, P01–P74, T01–T22) o publique su equivalencia: sus clientes podrán contrastar con la fuente.' 'Keep the codes (G0–G7, P01–P74, T01–T22) or publish your equivalence: your clients will be able to check against the source.'),
      (L 'Puede cambiar nombres, umbrales, plazos y pesos. No cambie lo que protege al cliente: separación de funciones, evidencia antes de decidir y estado de cada importe.' 'You may change names, thresholds, deadlines and weights. Do not change what protects the client: segregation of duties, evidence before deciding and a status for every amount.'),
      (L 'Indique la versión de partida y sus cambios; cuando el marco evolucione, decida si actualiza y dígalo.' 'State the base version and your changes; when the framework evolves, decide whether you update, and say so.'),
      (L 'En una obra que mezcla marcos debe quedar claro qué procede de SEVEN-G. Sus aportaciones puede licenciarlas como quiera, sin impedir la licencia del original.' "In a work that mixes frameworks it must be clear what comes from SEVEN-G. You may license your own contributions as you wish, without blocking the original's licence.")
    ) '' 1700),

    (Diapositiva-Texto (L 'Integración técnica: datos y herramientas' 'Technical integration: data and tools') @(
      (L 'Un único modelo de datos para todo: el JSON del registro T01, con su esquema publicado. Se importa, se exporta y se fusiona por código de iniciativa.' "One data model for everything: the T01 register's JSON, with its published schema. It can be imported, exported and merged by initiative code."),
      (L 'Puede alimentar ese JSON desde su propia plataforma (gestión de proyectos, GRC, CRM) y generar el panel del consejo con el conector de T17.' 'You can feed that JSON from your own platform (project management, GRC, CRM) and generate the board dashboard with the T17 connector.'),
      (L 'Las herramientas son HTML sin servidor: se alojan donde quiera, con su marca junto al reconocimiento, y no envían datos a nadie.' 'The tools are serverless HTML: host them wherever you like, with your brand next to the attribution, and they send data to no one.'),
      (L 'Las 74 plantillas se generan en Word desde Markdown: puede cambiar estilos y portada y regenerarlas con su imagen.' 'The 74 templates are generated in Word from Markdown: you can change styles and cover and regenerate them with your branding.'),
      (L 'Los esquemas nuevos solo añaden campos opcionales: los ficheros antiguos siguen funcionando.' 'New schema versions only add optional fields: old files keep working.'),
      (L 'Los datos del cliente son del cliente: déjelos siempre en formato abierto.' "The client's data belongs to the client: always leave it in an open format.")
    ) '' 1700),

    (Diapositiva-Tarjetas (L 'Cómo nombrarlo ante sus clientes' 'How to name it in front of your clients') (L 'Decir con exactitud qué se ha usado es obligatorio; sugerir aval no está permitido' 'Stating accurately what was used is mandatory; suggesting endorsement is not allowed') @(
      (T (L 'Adecuado' 'Appropriate') $TEAL (L '«Basado en SEVEN-G (versión 0.80).»   «Adaptado de SEVEN-G; cambios: …»   «Incluye el registro de iniciativas de SEVEN-G (MIT).»   «Esta adaptación no está respaldada por el autor.»' '"Based on SEVEN-G (version 0.80)."   "Adapted from SEVEN-G; changes: …"   "Includes the SEVEN-G initiative register (MIT)."   "This adaptation is not endorsed by the author."')),
      (T (L 'No adecuado' 'Inappropriate') $CLARET (L '«Partner oficial», «homologado», «acreditado», «certificación SEVEN-G», o declarar en nombre de SEVEN-G o del autor que un cliente cumple la regulación.' '"Official partner", "approved", "accredited", "SEVEN-G certification", or stating on behalf of SEVEN-G or the author that a client complies with regulation.')),
      (T (L 'Aviso que se conserva' 'Notice to keep') $OXFORD (L '«Basado en SEVEN-G (Fernando García Varela, CC BY 4.0). Contenido orientativo, «tal cual», sin garantías; no es asesoramiento jurídico. El autor no valida ni respalda esta obra.»' '"Based on SEVEN-G (Fernando García Varela, CC BY 4.0). Guidance content, "as is", without warranties; not legal advice. The author does not validate or endorse this work."'))
    ) (L 'Documento 93, secciones 6, 7, 8 y 11.9.' 'Document 93, sections 6, 7, 8 and 11.9.')),

    (Diapositiva-Texto (L 'Mantenerse al día y mejorar el marco' 'Staying current and improving the framework') @(
      (L 'El sitio publica la versión del marco y el control de versiones de cada documento: revise los cambios antes de actualizar su adaptación.' "The site publishes the framework version and each document's version history: review the changes before updating your adaptation."),
      (L 'Incidencias y peticiones de mejora: en la página de comunidad, sin cuenta ni correo; se abordan las peticiones con más votos.' 'Issues and improvement requests: on the community page, with no account or email; the most-voted requests are taken on.'),
      (L 'Una traducción suya es una obra derivada: indique que no es oficial, de qué versión procede y quién la ha hecho.' 'A translation of yours is a derivative work: state that it is unofficial, which version it comes from and who made it.'),
      (L 'Si quiere algo que la licencia no da —un desarrollo a medida, formación para su equipo, acuerdo sobre el uso de la marca—, hable con el autor. Esa conversación la inicia usted.' 'If you want something the licence does not give —custom work, training for your team, an agreement on trademark use— talk to the author. You start that conversation.')
    ))
  )
}

$CURSOS = @(
  @{ clave = 'Empresa'; bloque = 'Bloque-Empresa' },
  @{ clave = 'Consultor'; bloque = 'Bloque-Consultor' },
  @{ clave = 'Partner'; bloque = 'Bloque-Partner' }
)
function Textos-Curso([string]$clave) {
  switch ($clave) {
    'Empresa'   { @{ titulo = (L 'Curso de SEVEN-G para la empresa' 'SEVEN-G course for the company'); publico = (L 'Empresa · Autoconsultoría' 'Company · Self-consulting'); sub = (L 'Qué es SEVEN-G, cómo se llena el embudo de iniciativas hasta el panel del consejo y cómo implantarlo en su compañía por sus propios medios.' 'What SEVEN-G is, how the initiative funnel gets filled all the way to the board dashboard, and how to implement it in your company by your own means.') } }
    'Consultor' { @{ titulo = (L 'Curso de SEVEN-G para el consultor' 'SEVEN-G course for the consultant'); publico = (L 'Consultor · Acompañar a clientes' 'Consultant · Supporting clients'); sub = (L 'Qué es SEVEN-G, cómo se llena el embudo de iniciativas hasta el panel del consejo y cómo aplicarlo en sus clientes con su propia firma.' 'What SEVEN-G is, how the initiative funnel gets filled all the way to the board dashboard, and how to apply it at your clients under your own name.') } }
    'Partner'   { @{ titulo = (L 'Curso de SEVEN-G para el partner' 'SEVEN-G course for the partner'); publico = (L 'Partner · Integrarlo en su metodología' 'Partner · Building it into your methodology'); sub = (L 'Qué es SEVEN-G, cómo se llena el embudo de iniciativas hasta el panel del consejo y cómo integrarlo en su propia metodología o producto.' 'What SEVEN-G is, how the initiative funnel gets filled all the way to the board dashboard, and how to build it into your own methodology or product.') } }
  }
}

# exporta todos los PDF pendientes con una sola instancia de PowerPoint (abrir y cerrar la aplicación por cada fichero falla a veces)
function Exportar-Pdfs([object[]]$pendientes) {
  if (-not $pendientes) { return }
  $app = $null
  for ($k = 0; $k -lt 3 -and -not $app; $k++) { try { $app = New-Object -ComObject PowerPoint.Application } catch { Start-Sleep -Seconds 2 } }
  if (-not $app) { Write-Warning "PowerPoint no está disponible: no se exportan $($pendientes.Count) PDF de los cursos (se conservan los que hubiera)."; return }
  try {
    foreach ($p in $pendientes) {
      New-Item -ItemType Directory -Force (Split-Path $p.pdf) | Out-Null
      $pres = $app.Presentations.Open($p.pptx, $true, $true, $false)
      $pres.SaveAs($p.pdf, 32)   # 32 = ppSaveAsPDF
      $pres.Close()
      Write-Host "PDF -> $($p.pdf)"
    }
  } finally { $app.Quit(); [void][Runtime.InteropServices.Marshal]::ReleaseComObject($app) }
}
$pdfPendientes = [Collections.Generic.List[object]]::new()

Registrar-Imagen 'registro' (Join-Path $imgDir 'registro-ejemplo.png')
Registrar-Imagen 'panel' (Join-Path $imgDir 'panel-consejo-ejemplo.png')

foreach ($lang in $Idiomas) {
  $script:EN = $lang -eq 'en'
  Registrar-Imagen 'embudo' (Join-Path $imgDir "embudo-cartera-$lang.png")
  foreach ($curso in $CURSOS) {
    $script:idSeq = 1
    $tx = Textos-Curso $curso.clave
    $script:ROTULO = "SEVEN-G · $((L 'CURSO' 'COURSE')) · $($tx.publico.ToUpperInvariant())"
    $slides = [Collections.Generic.List[string]]::new()
    $slides.Add((Diapositiva-Titulo 'SEVEN-G' $tx.sub $tx.publico (L 'Fernando García Varela · Curso de autoaprendizaje · CC BY 4.0 · Ejemplos con datos ficticios' 'Fernando García Varela · Self-learning course · CC BY 4.0 · Examples with fictitious data')))
    foreach ($s in (Bloque-Que-Es)) { $slides.Add($s) }
    foreach ($s in (Bloque-Proceso)) { $slides.Add($s) }
    foreach ($s in (Bloque-Ejemplos)) { $slides.Add($s) }
    foreach ($s in (& $curso.bloque)) { $slides.Add($s) }
    $slides.Add((Diapositiva-Cierre (L 'Gracias' 'Thank you') (L 'SEVEN-G es gratuito: se usa, se descarga y se adapta sin registrarse, y el sitio nunca le escribirá. Si quiere hablar con el autor, la iniciativa es suya.' 'SEVEN-G is free: it is used, downloaded and adapted without registering, and the site will never write to you. If you want to talk to the author, the initiative is yours.') (L 'SEVEN-G es una marca registrada de Fernando García Varela · CC BY 4.0 (contenidos) · MIT (código)' 'SEVEN-G is a registered trademark of Fernando García Varela · CC BY 4.0 (content) · MIT (code)') 'https://www.linkedin.com/in/fernandogarciavarela/'))

    $salida = Join-Path $repo "SEVEN-G\pptx\$lang\SEVEN-G_Curso_$($curso.clave).pptx"
    $pdf = Join-Path $repo "SEVEN-G\pdf\$lang\curso\SEVEN-G_Curso_$($curso.clave).pdf"
    $tmp = Join-Path ([IO.Path]::GetTempPath()) "seveng_curso_$PID`_$lang`_$($curso.clave).pptx"
    Escribir-Pptx $tmp $slides $tx.titulo
    $igual = (Test-Path $salida) -and ((Get-FileHash $tmp).Hash -eq (Get-FileHash $salida).Hash)
    if ($igual) { [IO.File]::Delete($tmp) }
    else { New-Item -ItemType Directory -Force (Split-Path $salida) | Out-Null; [IO.File]::Copy($tmp, $salida, $true); [IO.File]::Delete($tmp) }
    if (-not $SinPdf -and (-not $igual -or -not (Test-Path $pdf))) { $pdfPendientes.Add([pscustomobject]@{ pptx = $salida; pdf = $pdf }) }
    Write-Host "$lang · $($curso.clave): $($slides.Count) diapositivas$(if ($igual) { ' (sin cambios)' }) -> $salida"
  }
}
Exportar-Pdfs $pdfPendientes
