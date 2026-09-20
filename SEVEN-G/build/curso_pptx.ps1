<#
.SYNOPSIS
  Genera la presentación en PowerPoint (.pptx) del curso de SEVEN-G: qué es, qué aporta, cómo funciona el ciclo de
  vida de una iniciativa y dos ejemplos narrados (una iniciativa que se para y otra que llega a producción).

.DESCRIPTION
  Salida:   SEVEN-G/pptx/<idioma>/SEVEN-G_Curso.pptx

  No es un volcado de los diez módulos del curso (mds/<idioma>/curso/M00..M09): es un guion propio, con diapositivas
  de texto y diapositivas de diagrama (fases del ciclo de vida, resultados de puerta, dos casos de ejemplo con datos
  ficticios), pensado para explicarse solo o servir de base a una sesión en vivo. El contenido de cada diapositiva
  está en este script (sección «Contenido»), no se genera desde otra fuente. Se puede editar y volver a ejecutar.

  Sin dependencias: escribe directamente el OOXML de PowerPoint (mismo enfoque que docx.ps1 para Word).
  No se edita a mano el .pptx; build.ps1 lo ejecuta antes de los HTML para que la guía del curso enlace el fichero.

.EXAMPLE
  pwsh -File SEVEN-G/build/curso_pptx.ps1
#>
param(
  [string[]]$Idiomas = @('es', 'en')
)

$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.IO.Compression
Add-Type -AssemblyName System.IO.Compression.FileSystem
$repo = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
$fechaFija = [DateTimeOffset]::new(2026, 1, 1, 0, 0, 0, [TimeSpan]::Zero)

function Xml([string]$s) { if ($null -eq $s) { return '' }; [Security.SecurityElement]::Escape($s) }

# ---------- primitivas OOXML ----------

$NEGRO = '1A1817'; $CLARET = '990F3D'; $PAPEL = 'FBE2CD'; $PAPEL2 = 'F3CFB2'; $TINTA = '2F2B28'; $TINTA2 = '564D47'
$OXFORD = '0F5499'; $TEAL = '0D7680'; $VELVET = '593380'; $ORO = 'A5822A'; $BLANCO = 'FFFFFF'; $GRIS = 'C9A78D'

function Rpr([string]$colorHex, [int]$tamano, [bool]$negrita = $false, [bool]$cursiva = $false) {
  $b = if ($negrita) { ' b="1"' } else { '' }
  $i = if ($cursiva) { ' i="1"' } else { '' }
  "<a:rPr lang=""es-ES"" sz=""$tamano""$b$i dirty=""0""><a:solidFill><a:srgbClr val=""$colorHex""/></a:solidFill></a:rPr>"
}
function Parrafo([string]$texto, [string]$colorHex, [int]$tamano, [bool]$negrita = $false, [string]$align = 'l', [bool]$cursiva = $false) {
  "<a:p><a:pPr algn=""$align""/><a:r>$(Rpr $colorHex $tamano $negrita $cursiva)<a:t>$(Xml $texto)</a:t></a:r></a:p>"
}
function Parrafo-Bullet([string]$texto, [string]$colorHex, [int]$tamano, [string]$colorBullet = $null) {
  $cb = if ($colorBullet) { $colorBullet } else { $colorHex }
  "<a:p><a:pPr marL=""285750"" indent=""-285750""><a:buClr><a:srgbClr val=""$cb""/></a:buClr><a:buFont typeface=""Arial""/><a:buChar char=""&#8226;""/></a:pPr><a:r>$(Rpr $colorHex $tamano $false)<a:t>$(Xml $texto)</a:t></a:r></a:p>"
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
<p:sp><p:nvSpPr><p:cNvPr id="$id" name="Texto $id"/><p:cNvSpPr txBox="1"/><p:nvPr/></p:nvSpPr><p:spPr><a:xfrm><a:off x="$x" y="$y"/><a:ext cx="$cx" cy="$cy"/></a:xfrm><a:prstGeom prst="rect"><a:avLst/></a:prstGeom><a:noFill/></p:spPr><p:txBody><a:bodyPr wrap="square" anchor="$anchor"><a:normAutofit/></a:bodyPr><a:lstStyle/>
$parrafosXml
</p:txBody></p:sp>
"@
}

# caja rectangular rellena, con texto centrado (para diagramas de fases, esferas y resultados de puerta)
function Shape-Caja([int]$x, [int]$y, [int]$cx, [int]$cy, [string]$titulo, [string]$colorFondo, [string]$colorTexto, [int]$tamTitulo, [string]$subtitulo = '', [int]$tamSub = 1000, [int]$radio = 6000) {
  $id = NuevoId
  $parr = Parrafo $titulo $colorTexto $tamTitulo $true 'ctr'
  if ($subtitulo) { $parr += Parrafo $subtitulo $colorTexto $tamSub $false 'ctr' }
  @"
<p:sp><p:nvSpPr><p:cNvPr id="$id" name="Caja $id"/><p:cNvSpPr/><p:nvPr/></p:nvSpPr><p:spPr><a:xfrm><a:off x="$x" y="$y"/><a:ext cx="$cx" cy="$cy"/></a:xfrm><a:prstGeom prst="roundRect"><a:avLst><a:gd name="adj" fmla="val $radio"/></a:avLst></a:prstGeom><a:solidFill><a:srgbClr val="$colorFondo"/></a:solidFill><a:ln><a:noFill/></a:ln></p:spPr><p:txBody><a:bodyPr wrap="square" anchor="ctr" lIns="45720" rIns="45720"><a:normAutofit/></a:bodyPr><a:lstStyle/>
$parr
</p:txBody></p:sp>
"@
}

function Rombo([string]$marca) {
  $id = NuevoId
  "<p:sp><p:nvSpPr><p:cNvPr id=""$id"" name=""Marca""/><p:cNvSpPr/><p:nvPr/></p:nvSpPr><p:spPr><a:xfrm><a:off x=""609600"" y=""365760""/><a:ext cx=""182880"" cy=""182880""/></a:xfrm><a:prstGeom prst=""rect""><a:avLst/></a:prstGeom><a:solidFill><a:srgbClr val=""$CLARET""/></a:solidFill></p:spPr><p:txBody><a:bodyPr/><a:lstStyle/><a:p/></p:txBody></p:sp>" +
  (Shape-Texto 838200 320000 10500000 320000 (Parrafo $marca $NEGRO 1400 $true) 'ctr')
}

# ---------- diapositivas de tipo texto ----------

function Diapositiva-Titulo([string]$titulo, [string]$subtitulo, [string]$pie) {
  $rombo = Rombo 'SEVEN-G · CURSO'
  $t = Shape-Texto 609600 1500000 10972800 1900000 (Parrafo $titulo $NEGRO 5000 $true)
  $s = Shape-Texto 609600 3350000 10500000 1200000 (Parrafo-Bullet $subtitulo $TINTA 2000 $CLARET)
  $p = Shape-Texto 609600 6150000 10972800 450000 (Parrafo $pie $OXFORD 1400)
  Slide-Xml ($rombo + $t + $s + $p)
}

function Diapositiva-SeccionOscura([string]$rotulo, [string]$titulo, [string]$nota) {
  $id1 = NuevoId
  $marca = "<p:sp><p:nvSpPr><p:cNvPr id=""$id1"" name=""Marca""/><p:cNvSpPr/><p:nvPr/></p:nvSpPr><p:spPr><a:xfrm><a:off x=""609600"" y=""2400000""/><a:ext cx=""182880"" cy=""182880""/></a:xfrm><a:prstGeom prst=""rect""><a:avLst/></a:prstGeom><a:solidFill><a:srgbClr val=""$CLARET""/></a:solidFill></p:spPr><p:txBody><a:bodyPr/><a:lstStyle/><a:p/></p:txBody></p:sp>"
  $r = Shape-Texto 838200 2320000 6000000 400000 (Parrafo $rotulo $PAPEL2 1600 $true)
  $t = Shape-Texto 609600 2850000 10972800 1400000 (Parrafo $titulo $PAPEL 4200 $true)
  $n = Shape-Texto 609600 4350000 10500000 700000 (Parrafo-Bullet $nota $PAPEL2 1700 $CLARET)
  Slide-Xml ($marca + $r + $t + $n) $NEGRO
}

function Diapositiva-Texto([string]$titulo, [string[]]$bullets, [string]$notaFinal = '') {
  $rombo = Rombo 'SEVEN-G · CURSO'
  $t = Shape-Texto 609600 800000 10972800 900000 (Parrafo $titulo $CLARET 3000 $true)
  $parr = ($bullets | ForEach-Object { Parrafo-Bullet $_ $TINTA 1800 }) -join ''
  $b = Shape-Texto 609600 1900000 10972800 4300000 $parr
  $n = if ($notaFinal) { Shape-Texto 609600 6300000 10972800 450000 (Parrafo $notaFinal $OXFORD 1400 $false) } else { '' }
  Slide-Xml ($rombo + $t + $b + $n)
}

# ---------- diapositiva de diagrama: las ocho fases en fila, con las puertas entre ellas ----------

function Diapositiva-Fases([string]$titulo, [string]$sub, [string[]]$fases, [string[]]$puertas, [int[]]$resaltar = @(), [string]$colorResalte = $TEAL, [string]$rotuloResalte = '', [int]$xResalte = -1) {
  $rombo = Rombo 'SEVEN-G · CURSO'
  $t = Shape-Texto 609600 700000 10972800 700000 (Parrafo $titulo $CLARET 2800 $true)
  $s = Shape-Texto 609600 1350000 10972800 500000 (Parrafo $sub $TINTA2 1500)
  $n = $fases.Count
  $anchoCaja = 1200000; $hueco = 140000
  $anchoTotal = $n * $anchoCaja + ($n - 1) * $hueco
  $x0 = [int]((12192000 - $anchoTotal) / 2)
  $y = 2200000; $altoCaja = 1500000
  $cajas = ''
  for ($i = 0; $i -lt $n; $i++) {
    $x = $x0 + $i * ($anchoCaja + $hueco)
    $activo = $resaltar.Count -eq 0 -or $resaltar -contains $i
    $color = if ($resaltar.Count -eq 0) { if ($i -eq 0) { $TINTA2 } elseif ($i -le 3) { $OXFORD } elseif ($i -le 5) { $VELVET } else { $TEAL } } elseif ($activo) { $colorResalte } else { $GRIS }
    $colorTxt = if ($activo -or $resaltar.Count -eq 0) { $BLANCO } else { $TINTA2 }
    $cajas += Shape-Caja $x $y $anchoCaja $altoCaja "F$i" $color $colorTxt 2400 $fases[$i] 1050
    if ($i -lt $n - 1) {
      $xf = $x + $anchoCaja + [int]($hueco / 2) - 90000
      $cajas += Shape-Texto $xf ($y + 550000) 250000 400000 (Parrafo '→' $TINTA2 1800 $true 'ctr')
    }
  }
  # rótulos de puerta bajo cada hueco
  $puertasXml = ''
  for ($i = 0; $i -lt $puertas.Count; $i++) {
    if (-not $puertas[$i]) { continue }
    $x = $x0 + $i * ($anchoCaja + $hueco) + $anchoCaja - 250000
    $puertasXml += Shape-Texto $x ($y + $altoCaja + 60000) 900000 300000 (Parrafo $puertas[$i] $CLARET 1100 $true 'ctr')
  }
  $marca = if ($rotuloResalte) {
    $xr = if ($xResalte -ge 0) { $x0 + $xResalte * ($anchoCaja + $hueco) } else { $x0 }
    Shape-Texto $xr ($y + $altoCaja + 420000) $anchoTotal 500000 (Parrafo $rotuloResalte $colorResalte 1900 $true 'ctr')
  } else { '' }
  Slide-Xml ($rombo + $t + $s + $cajas + $puertasXml + $marca)
}

# ---------- diapositiva de diagrama: cinco resultados posibles de una puerta ----------

function Diapositiva-Resultados([string]$titulo, [string]$sub, [pscustomobject[]]$resultados) {
  $rombo = Rombo 'SEVEN-G · CURSO'
  $t = Shape-Texto 609600 700000 10972800 700000 (Parrafo $titulo $CLARET 2800 $true)
  $s = Shape-Texto 609600 1350000 10972800 500000 (Parrafo $sub $TINTA2 1500)
  $n = $resultados.Count
  $anchoCaja = 2150000; $hueco = 120000
  $anchoTotal = $n * $anchoCaja + ($n - 1) * $hueco
  $x0 = [int]((12192000 - $anchoTotal) / 2)
  $y = 2100000; $altoCaja = 3300000
  $cajas = ''
  for ($i = 0; $i -lt $n; $i++) {
    $x = $x0 + $i * ($anchoCaja + $hueco)
    $r = $resultados[$i]
    $cajas += Shape-Caja $x $y $anchoCaja $altoCaja $r.nombre $r.color $BLANCO 1900 $r.texto 1300
  }
  Slide-Xml ($rombo + $t + $s + $cajas)
}

# ---------- diapositiva de ejemplo narrado (con la fila de fases arriba y un veredicto grande abajo) ----------

function Diapositiva-Ejemplo([string]$titulo, [string]$caso, [string[]]$bullets, [string]$veredicto, [string]$colorVeredicto) {
  $rombo = Rombo 'SEVEN-G · CURSO · EJEMPLO ILUSTRATIVO'
  $t = Shape-Texto 609600 700000 10972800 700000 (Parrafo $titulo $CLARET 2600 $true)
  $c = Shape-Texto 609600 1350000 10972800 500000 (Parrafo $caso $TINTA 1700 $true)
  $parr = ($bullets | ForEach-Object { Parrafo-Bullet $_ $TINTA 1600 }) -join ''
  $b = Shape-Texto 609600 1950000 10972800 3400000 $parr
  $v = Shape-Caja 609600 5550000 10972800 1000000 $veredicto $colorVeredicto $BLANCO 2200
  Slide-Xml ($rombo + $t + $c + $b + $v)
}

function Diapositiva-Cierre([string]$titulo, [string]$linea1, [string]$linea2, [string]$url) {
  $t1 = Shape-Texto 609600 2500000 10972800 900000 (Parrafo $titulo $NEGRO 4400 $true 'ctr')
  $t2 = Shape-Texto 609600 3550000 10972800 600000 (Parrafo $linea1 $TINTA 1900 $false 'ctr')
  $t3 = Shape-Texto 609600 4150000 10972800 500000 (Parrafo $linea2 $TINTA2 1600 $false 'ctr')
  $t4 = Shape-Texto 609600 4750000 10972800 500000 (Parrafo $url $OXFORD 1700 $false 'ctr')
  Slide-Xml ($t1 + $t2 + $t3 + $t4)
}

# ---------- ficheros fijos del paquete pptx ----------

$contentTypes = @'
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types">
<Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml"/>
<Default Extension="xml" ContentType="application/xml"/>
<Override PartName="/ppt/presentation.xml" ContentType="application/vnd.openxmlformats-officedocument.presentationml.presentation.main+xml"/>
<Override PartName="/ppt/slideMasters/slideMaster1.xml" ContentType="application/vnd.openxmlformats-officedocument.presentationml.slideMaster+xml"/>
<Override PartName="/ppt/slideLayouts/slideLayout1.xml" ContentType="application/vnd.openxmlformats-officedocument.presentationml.slideLayout+xml"/>
<Override PartName="/ppt/theme/theme1.xml" ContentType="application/vnd.openxmlformats-officedocument.theme+xml"/>
<Override PartName="/docProps/core.xml" ContentType="application/vnd.openxmlformats-package.core-properties+xml"/>
<Override PartName="/docProps/app.xml" ContentType="application/vnd.openxmlformats-officedocument.extended-properties+xml"/>
{0}
</Types>
'@
$rootRels = @'
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">
<Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument" Target="ppt/presentation.xml"/>
<Relationship Id="rId2" Type="http://schemas.openxmlformats.org/package/2006/relationships/metadata/core-properties" Target="docProps/core.xml"/>
<Relationship Id="rId3" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/extended-properties" Target="docProps/app.xml"/>
</Relationships>
'@
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

function App-Xml([int]$nSlides) { "<?xml version=""1.0"" encoding=""UTF-8"" standalone=""yes""?><Properties xmlns=""http://schemas.openxmlformats.org/officeDocument/2006/extended-properties"" xmlns:vt=""http://schemas.openxmlformats.org/officeDocument/2006/docPropsVTypes""><Application>SEVEN-G build</Application><Slides>$nSlides</Slides><Company>Fernando García Varela</Company></Properties>" }
function Core-Xml([string]$titulo) {
  $f = $fechaFija.ToString('yyyy-MM-ddTHH:mm:ssZ')
  "<?xml version=""1.0"" encoding=""UTF-8"" standalone=""yes""?><cp:coreProperties xmlns:cp=""http://schemas.openxmlformats.org/package/2006/metadata/core-properties"" xmlns:dc=""http://purl.org/dc/elements/1.1/"" xmlns:dcterms=""http://purl.org/dc/terms/"" xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance""><dc:title>$(Xml $titulo)</dc:title><dc:creator>Fernando García Varela</dc:creator><cp:lastModifiedBy>SEVEN-G build</cp:lastModifiedBy><dcterms:created xsi:type=""dcterms:W3CDTF"">$f</dcterms:created><dcterms:modified xsi:type=""dcterms:W3CDTF"">$f</dcterms:modified></cp:coreProperties>"
}

function Escribir-Pptx([string]$rutaSalida, [string[]]$slidesXml, [string]$titulo) {
  New-Item -ItemType Directory -Force (Split-Path $rutaSalida) | Out-Null
  if (Test-Path $rutaSalida) { Remove-Item $rutaSalida -Force }
  $zip = [System.IO.Compression.ZipFile]::Open($rutaSalida, [System.IO.Compression.ZipArchiveMode]::Create)
  try {
    function Add-Entrada([string]$nombre, [string]$contenido) {
      $e = $zip.CreateEntry($nombre, [System.IO.Compression.CompressionLevel]::Optimal)
      $e.LastWriteTime = $fechaFija
      $s = $e.Open(); $w = New-Object System.IO.StreamWriter($s, [System.Text.UTF8Encoding]::new($false)); $w.Write($contenido); $w.Flush(); $w.Dispose(); $s.Dispose()
    }
    $n = $slidesXml.Count
    $overrides = ''; $presRelsSlides = ''; $sldIdLst = ''
    for ($i = 1; $i -le $n; $i++) {
      $overrides += "<Override PartName=""/ppt/slides/slide$i.xml"" ContentType=""application/vnd.openxmlformats-officedocument.presentationml.slide+xml""/>`n"
      $presRelsSlides += "<Relationship Id=""rIdS$i"" Type=""http://schemas.openxmlformats.org/officeDocument/2006/relationships/slide"" Target=""slides/slide$i.xml""/>`n"
      $sldIdLst += "<p:sldId id=""$(255 + $i)"" r:id=""rIdS$i""/>`n"
      Add-Entrada "ppt/slides/slide$i.xml" $slidesXml[$i - 1]
      Add-Entrada "ppt/slides/_rels/slide$i.xml.rels" '<?xml version="1.0" encoding="UTF-8" standalone="yes"?><Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships"><Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/slideLayout" Target="../slideLayouts/slideLayout1.xml"/></Relationships>'
    }
    Add-Entrada '[Content_Types].xml' ($contentTypes -f $overrides)
    Add-Entrada '_rels/.rels' $rootRels
    Add-Entrada 'docProps/core.xml' (Core-Xml $titulo)
    Add-Entrada 'docProps/app.xml' (App-Xml $n)
    Add-Entrada 'ppt/theme/theme1.xml' $theme
    Add-Entrada 'ppt/slideLayouts/slideLayout1.xml' $slideLayout
    Add-Entrada 'ppt/slideLayouts/_rels/slideLayout1.xml.rels' $slideLayoutRels
    Add-Entrada 'ppt/slideMasters/slideMaster1.xml' $slideMaster
    Add-Entrada 'ppt/slideMasters/_rels/slideMaster1.xml.rels' $slideMasterRels
    $presentation = "<?xml version=""1.0"" encoding=""UTF-8"" standalone=""yes""?><p:presentation xmlns:a=""http://schemas.openxmlformats.org/drawingml/2006/main"" xmlns:r=""http://schemas.openxmlformats.org/officeDocument/2006/relationships"" xmlns:p=""http://schemas.openxmlformats.org/presentationml/2006/main""><p:sldMasterIdLst><p:sldMasterId id=""2147483648"" r:id=""rIdM1""/></p:sldMasterIdLst><p:sldIdLst>`n$sldIdLst`n</p:sldIdLst><p:sldSz cx=""12192000"" cy=""6858000"" type=""screen16x9""/><p:notesSz cx=""6858000"" cy=""9144000""/></p:presentation>"
    Add-Entrada 'ppt/presentation.xml' $presentation
    $presRels = "<?xml version=""1.0"" encoding=""UTF-8"" standalone=""yes""?><Relationships xmlns=""http://schemas.openxmlformats.org/package/2006/relationships""><Relationship Id=""rIdM1"" Type=""http://schemas.openxmlformats.org/officeDocument/2006/relationships/slideMaster"" Target=""slideMasters/slideMaster1.xml""/><Relationship Id=""rIdT1"" Type=""http://schemas.openxmlformats.org/officeDocument/2006/relationships/theme"" Target=""theme/theme1.xml""/>$presRelsSlides</Relationships>"
    Add-Entrada 'ppt/_rels/presentation.xml.rels' $presRels
  } finally { $zip.Dispose() }
}

# =====================================================================================
# CONTENIDO: el guion del curso, en español e inglés. Fases y nombres tomados del
# documento 01 (SS6.2-6.9); los dos casos de ejemplo son ilustrativos, con datos ficticios.
# =====================================================================================

$FASES_ES = @('Contexto y restricciones', 'Descubrimiento de oportunidades', 'Hipótesis de valor', 'Viabilidad y riesgo', 'Diseño de la solución', 'Entrega y validación', 'Operación y gobierno', 'Evolución o retirada')
$FASES_EN = @('Context and constraints', 'Opportunity discovery', 'Value hypothesis', 'Feasibility and risk', 'Solution design', 'Delivery and validation', 'Operation and governance', 'Evolution or retirement')
$PUERTAS = @('G0', 'G1', 'G2', 'G3', 'G4', 'G5', 'R6', '')

function Construir-Diapositivas([string]$lang) {
  $en = $lang -eq 'en'
  $slides = [Collections.Generic.List[string]]::new()
  $fases = if ($en) { $FASES_EN } else { $FASES_ES }

  if (-not $en) {
    $slides.Add((Diapositiva-Titulo 'SEVEN-G' 'Curso introductorio: qué es, qué aporta y cómo se usa para implantar, gobernar y medir la inteligencia artificial de una compañía' 'Fernando García Varela · Curso de autoaprendizaje · CC BY 4.0'))

    $slides.Add((Diapositiva-Texto 'El problema que resuelve' @(
      'Muchas compañías tienen pilotos de IA que funcionan, pero pocos llegan a producción.',
      'El valor se declara ("liberamos 200 horas") pero casi nadie lo comprueba.',
      'Nadie tiene autoridad clara para parar una iniciativa que no funciona.',
      'El consejo pregunta por la IA y recibe una lista de proyectos técnicos, no una decisión de negocio.',
      'Y la pregunta de fondo casi nunca se contesta con evidencia: ¿la compañía se está transformando con IA, o solo está siendo un poco más eficiente?'
    ) 'Estos síntomas no son un problema tecnológico: son un problema de gobierno y de medición.'))

    $slides.Add((Diapositiva-Texto 'Qué es SEVEN-G' @(
      'Seven-phase Enterprise Value & Governance: una fase 0 habilitante y siete fases de valor, con gobierno en todas ellas.',
      'Un método completo, gratuito y modificable para implantar, gobernar y medir la IA de una organización.',
      'No sustituye lo que la compañía ya tiene (comités, marcos de riesgo, oficina de proyectos): lo ordena y lo conecta con un lenguaje común.',
      'No es una guía técnica para construir modelos: gobierna y mide: qué se aprueba, qué se mide, quién decide y cuándo se para.'
    )))

    $slides.Add((Diapositiva-Texto 'Qué aporta a la compañía' @(
      'Ordena la IA como una cartera, no como una lista de proyectos: cada iniciativa tiene fase, coste, valor esperado y responsable.',
      'Pone puertas de decisión entre las fases: para avanzar hace falta evidencia verificada, o la iniciativa se itera, se pivota o se para.',
      'Separa quién decide, quién construye y quién controla, y traduce la regulación a fases, roles y evidencias.',
      'Mide el valor en dinero y con estado —validado, declarado o estimado— y le dice al consejo si la compañía se transforma o solo se eficienta.'
    )))

    $slides.Add((Diapositiva-SeccionOscura 'CÓMO SE ORGANIZA' 'Dos niveles: la compañía y cada iniciativa' 'La compañía dirige y supervisa la cartera entera; cada iniciativa recorre su propio camino, de la idea a la producción o a la retirada.'))

    $slides.Add((Diapositiva-Texto 'Nivel 1 · El ciclo corporativo' @(
      'C1 · Diagnóstico: madurez de la compañía en las siete dimensiones (estrategia, gobierno, datos, riesgo, talento...).',
      'C2 · Dirección: el consejo aprueba la tesis de IA y el apetito de riesgo, y fija el presupuesto marco.',
      'C3 · Cartera: se prioriza qué iniciativas se financian y en qué orden, con el mapa de esferas y niveles de ambición.',
      'C4 · Supervisión: el consejo y el comité de IA siguen la cartera con el panel y el registro de decisiones.',
      'C5 · Revisión anual: qué funcionó, qué no, y qué cambia para el año siguiente.'
    )))

    $slides.Add((Diapositiva-Fases 'Nivel 2 · El ciclo de vida de una iniciativa' 'Ocho fases (0 a 7), separadas por puertas de decisión' $fases $PUERTAS))

    $slides.Add((Diapositiva-Resultados 'Qué puede pasar en cada puerta' 'Cinco resultados posibles; nunca decide quien aporta la evidencia' @(
      [pscustomobject]@{ nombre = 'Continuar'; color = $TEAL; texto = 'Se cumplen los criterios: pasa a la fase siguiente.' },
      [pscustomobject]@{ nombre = 'Con condiciones'; color = $OXFORD; texto = 'Pasa, pero con plazo y responsable para lo pendiente.' },
      [pscustomobject]@{ nombre = 'Iterar'; color = $ORO; texto = 'Se repite la fase con un ajuste. Máximo dos veces.' },
      [pscustomobject]@{ nombre = 'Pivotar'; color = $VELVET; texto = 'La hipótesis no se sostiene: se prueba otra, desde la fase 2.' },
      [pscustomobject]@{ nombre = 'Parar'; color = $CLARET; texto = 'No hay valor o el riesgo es inaceptable. Es un buen resultado.' }
    )))

    $slides.Add((Diapositiva-SeccionOscura 'DOS EJEMPLOS' 'Una iniciativa que se para, y otra que llega a producción' 'Datos ficticios, ilustrativos: no describen ninguna compañía real (documento 92).'))

    $slides.Add((Diapositiva-Ejemplo 'Ejemplo 1 · Cuando una iniciativa se para' 'Cribado de candidaturas en procesos de selección (RR. HH.)' @(
      'Fase 0-1: se autoriza con patrocinio de RR. HH.; el objetivo es reducir el tiempo de cribado inicial.',
      'Fase 2: la hipótesis de valor se confirma en el piloto: 40 % menos de tiempo de cribado.',
      'Fase 3 (viabilidad y riesgo): la prueba de sesgo por segmentos detecta que el modelo penaliza a candidatos de más edad, y corregirlo le hace perder la capacidad predictiva que justificaba el proyecto.',
      'El equipo pide iterar dos veces, ajustando variables y umbrales, sin resolver el sesgo.',
      'En G3, con el riesgo residual todavía alto para un sistema de alto riesgo, el comité de IA decide parar.',
      'Lección aprendida (queda registrada, T01): el sesgo se debe evaluar antes de la fase 3, no como último paso.'
    ) 'RESULTADO: PARADA EN G3 · RIESGO INACEPTABLE' $CLARET))

    $slides.Add((Diapositiva-Fases 'La iniciativa 1, sobre el ciclo de vida' 'Llegó a la fase 3 y no superó la puerta G3' $fases $PUERTAS @(0, 1, 2, 3) $CLARET 'PARADA EN G3' 3))

    $slides.Add((Diapositiva-Ejemplo 'Ejemplo 2 · Cuando una iniciativa llega a producción' 'Asistente de respuesta a incidencias de TI de primer nivel' @(
      'Fase 0-1: se autoriza con patrocinio del área de TI; el objetivo es reducir el tiempo de primera respuesta.',
      'Fase 2: la hipótesis de valor se valida con un piloto controlado: 32 % menos de tiempo de resolución en incidencias sencillas.',
      'Fase 3: la prueba de concepto no muestra sesgo relevante por tipo de usuario ni de departamento; el riesgo se clasifica como medio.',
      'Fase 4-5: se diseña con supervisión humana obligatoria por encima de cierta gravedad, se construye y se valida el piloto ampliado.',
      'G5: firma de puesta en producción, con plan de reversión probado.',
      'Fase 6-7: catorce meses en uso, con revisión de continuidad (R6) trimestral; en la última R6 se confirma el valor.'
    ) 'RESULTADO: EN PRODUCCIÓN · 1,1 M€ DE RETORNO ANUAL VALIDADO' $TEAL))

    $slides.Add((Diapositiva-Fases 'La iniciativa 2, sobre el ciclo de vida' 'Recorrió las ocho fases y sigue en uso, con revisiones periódicas' $fases $PUERTAS @(0, 1, 2, 3, 4, 5, 6, 7) $TEAL 'EN USO · R6 TRIMESTRAL' 2))

    $slides.Add((Diapositiva-Texto 'Cómo se mide el valor' @(
      'Todo importe lleva una fórmula y un estado: validado (por control de gestión), declarado (por el equipo) o estimado.',
      'La capacidad liberada (horas) no cuenta como ahorro hasta que se materializa: se reduce coste o se reasigna a otra actividad con valor.',
      'El índice de transformación de la compañía usa ocho señales de evidencia para distinguir transformar de solo eficientar.',
      'Diez reglas de medición en total (documento 40); ninguna cifra entra en el neto de la cartera sin su estado.'
    )))

    $slides.Add((Diapositiva-Texto 'Lo que ve el consejo' @(
      'Un panel generado desde el mismo registro de iniciativas: cartera, valor, embudo, riesgo y cumplimiento.',
      'La cartera de iniciativas de IA, leída como un embudo comercial: cuántas entran, dónde se pierden y por qué.',
      'Un registro de decisiones y recomendaciones (T18), con seguimiento de lo que se acordó.',
      'Una pregunta permanente: ¿la compañía se transforma con IA, o solo se está volviendo un poco más eficiente?'
    )))

    $slides.Add((Diapositiva-Texto 'Cómo empezar' @(
      'Documento 00: qué es SEVEN-G y su mapa de uso navegable.',
      'Registro de iniciativas de ejemplo (T01) y el panel del consejo generado con esos mismos datos (T17).',
      'La adopción es modular: se puede empezar solo por el registro, por las puertas de decisión o por la medición del valor.',
      'La guía de implantación (documento 90) propone un plan de 90 días.'
    )))

    $slides.Add((Diapositiva-Cierre 'Gracias' 'SEVEN-G es gratuito: se usa, se descarga y se adapta sin registrarse.' 'Fernando García Varela · CC BY 4.0 (contenidos) · MIT (código)' 'https://www.linkedin.com/in/fernandogarciavarela/'))

    return $slides
  }

  # ---- English ----
  $slides.Add((Diapositiva-Titulo 'SEVEN-G' 'Introductory course: what it is, what it delivers and how a company uses it to implement, govern and measure artificial intelligence' 'Fernando García Varela · Self-learning course · CC BY 4.0'))

  $slides.Add((Diapositiva-Texto 'The problem it solves' @(
    'Many companies have AI pilots that work, but few reach production.',
    'Value gets declared ("we freed up 200 hours") but almost nobody checks it.',
    'Nobody has clear authority to stop an initiative that is not working.',
    'The board asks about AI and gets a list of technical projects, not a business decision.',
    'And the underlying question is almost never answered with evidence: is the company transforming with AI, or just becoming a bit more efficient?'
  ) 'These symptoms are not a technology problem: they are a governance and measurement problem.'))

  $slides.Add((Diapositiva-Texto 'What SEVEN-G is' @(
    'Seven-phase Enterprise Value & Governance: an enabling phase 0 and seven value phases, with governance throughout.',
    'A complete, free and modifiable method to implement, govern and measure an organisation''s AI.',
    'It does not replace what the company already has (committees, risk frameworks, a PMO): it orders and connects them with a common language.',
    'It is not a technical guide to building models: it governs and measures — what gets approved, what gets measured, who decides and when to stop.'
  )))

  $slides.Add((Diapositiva-Texto 'What it delivers to the company' @(
    'Organises AI as a portfolio, not a list of projects: every initiative has a phase, a cost, expected value and an owner.',
    'Places decision gates between phases: moving forward needs verified evidence, or the initiative iterates, pivots or stops.',
    'Separates who decides, who builds and who controls, and translates regulation into phases, roles and evidence.',
    'Measures value in money and with a status —validated, declared or estimated— and tells the board whether the company is transforming or just becoming more efficient.'
  )))

  $slides.Add((Diapositiva-SeccionOscura 'HOW IT IS ORGANISED' 'Two levels: the company and each initiative' 'The company steers and oversees the whole portfolio; each initiative follows its own path, from idea to production or retirement.'))

  $slides.Add((Diapositiva-Texto 'Level 1 · The corporate cycle' @(
    'C1 · Diagnosis: the company''s maturity across seven dimensions (strategy, governance, data, risk, talent...).',
    'C2 · Direction: the board approves the AI thesis and risk appetite, and sets the framework budget.',
    'C3 · Portfolio: which initiatives get funded and in what order, using the sphere map and ambition levels.',
    'C4 · Oversight: the board and the AI committee track the portfolio through the dashboard and the decision log.',
    'C5 · Annual review: what worked, what did not, and what changes for the following year.'
  )))

  $slides.Add((Diapositiva-Fases 'Level 2 · An initiative''s lifecycle' 'Eight phases (0 to 7), separated by decision gates' $fases $PUERTAS))

  $slides.Add((Diapositiva-Resultados 'What can happen at each gate' 'Five possible outcomes; whoever provides the evidence never decides' @(
    [pscustomobject]@{ nombre = 'Proceed'; color = $TEAL; texto = 'Criteria are met: it moves to the next phase.' },
    [pscustomobject]@{ nombre = 'With conditions'; color = $OXFORD; texto = 'It proceeds, with a deadline and owner for what is pending.' },
    [pscustomobject]@{ nombre = 'Iterate'; color = $ORO; texto = 'The phase repeats with an adjustment. Twice at most.' },
    [pscustomobject]@{ nombre = 'Pivot'; color = $VELVET; texto = 'The hypothesis does not hold: a new one is tested, from phase 2.' },
    [pscustomobject]@{ nombre = 'Stop'; color = $CLARET; texto = 'No value, or the risk is unacceptable. This is a good outcome.' }
  )))

  $slides.Add((Diapositiva-SeccionOscura 'TWO EXAMPLES' 'One initiative that stops, and one that reaches production' 'Fictitious, illustrative data: it does not describe any real company (document 92).'))

  $slides.Add((Diapositiva-Ejemplo 'Example 1 · When an initiative stops' 'Candidate screening in a recruitment process (HR)' @(
    'Phase 0-1: authorised with HR sponsorship; the goal is to cut initial screening time.',
    'Phase 2: the value hypothesis is confirmed in the pilot: 40% less screening time.',
    'Phase 3 (feasibility and risk): the bias test by segment finds the model penalises older candidates, and fixing it removes the predictive power that justified the project.',
    'The team asks to iterate twice, adjusting variables and thresholds, without resolving the bias.',
    'At G3, with residual risk still high for a high-risk system, the AI committee decides to stop.',
    'Lesson learned (recorded in T01): bias should be assessed before phase 3, not as a last step.'
  ) 'OUTCOME: STOPPED AT G3 · UNACCEPTABLE RISK' $CLARET))

  $slides.Add((Diapositiva-Fases 'Initiative 1, on the lifecycle' 'It reached phase 3 and did not pass gate G3' $fases $PUERTAS @(0, 1, 2, 3) $CLARET 'STOPPED AT G3' 3))

  $slides.Add((Diapositiva-Ejemplo 'Example 2 · When an initiative reaches production' 'First-line IT incident response assistant' @(
    'Phase 0-1: authorised with IT sponsorship; the goal is to cut first-response time.',
    'Phase 2: the value hypothesis is validated in a controlled pilot: 32% less resolution time for simple incidents.',
    'Phase 3: the proof of concept shows no relevant bias by user type or department; risk is classified as medium.',
    'Phase 4-5: designed with mandatory human oversight above a severity threshold, built and validated in an extended pilot.',
    'G5: go-live sign-off, with a tested rollback plan.',
    'Phase 6-7: fourteen months in use, with a quarterly continuity review (R6); the latest R6 confirms the value.'
  ) 'OUTCOME: IN PRODUCTION · €1.1M OF VALIDATED ANNUAL RETURN' $TEAL))

  $slides.Add((Diapositiva-Fases 'Initiative 2, on the lifecycle' 'It went through all eight phases and remains in use, with periodic reviews' $fases $PUERTAS @(0, 1, 2, 3, 4, 5, 6, 7) $TEAL 'IN USE · QUARTERLY R6' 2))

  $slides.Add((Diapositiva-Texto 'How value is measured' @(
    'Every amount carries a formula and a status: validated (by finance/control), declared (by the team) or estimated.',
    'Released capacity (hours) does not count as savings until it is materialised: cost goes down, or it is reassigned to another valuable activity.',
    'The company''s transformation index uses eight evidence signals to tell transformation apart from mere efficiency.',
    'Ten measurement rules in total (document 40); no figure enters the portfolio net without its status.'
  )))

  $slides.Add((Diapositiva-Texto 'What the board sees' @(
    'A dashboard generated from the same initiative register: portfolio, value, funnel, risk and compliance.',
    'The AI initiative portfolio, read as a sales funnel: how many come in, where they are lost and why.',
    'A log of decisions and recommendations (T18), tracking what was agreed.',
    'A standing question: is the company transforming with AI, or just becoming a bit more efficient?'
  )))

  $slides.Add((Diapositiva-Texto 'How to get started' @(
    'Document 00: what SEVEN-G is, with its navigable usage map.',
    'The sample initiative register (T01) and the board dashboard generated from that same data (T17).',
    'Adoption is modular: you can start with just the register, the decision gates, or value measurement.',
    'The implementation guide (document 90) proposes a 90-day plan.'
  )))

  $slides.Add((Diapositiva-Cierre 'Thank you' 'SEVEN-G is free: it is used, downloaded and adapted without registering.' 'Fernando García Varela · CC BY 4.0 (content) · MIT (code)' 'https://www.linkedin.com/in/fernandogarciavarela/'))

  return $slides
}

$tituloCurso = @{ es = 'Curso de SEVEN-G'; en = 'SEVEN-G course' }
foreach ($lang in $Idiomas) {
  $script:idSeq = 1
  $slides = Construir-Diapositivas $lang
  $salida = Join-Path $repo "SEVEN-G\pptx\$lang\SEVEN-G_Curso.pptx"
  Escribir-Pptx $salida $slides $tituloCurso[$lang]
  Write-Host "$lang : $($slides.Count) diapositivas -> $salida"
}
