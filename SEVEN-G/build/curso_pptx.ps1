<#
.SYNOPSIS
  Genera la presentación en PowerPoint (.pptx) del curso completo de SEVEN-G a partir de sus módulos en Markdown.

.DESCRIPTION
  Fuentes:  SEVEN-G/mds/<idioma>/curso/M00..M09_*.md
  Salida:   SEVEN-G/pptx/<idioma>/SEVEN-G_Curso.pptx

  Una diapositiva de portada, una por módulo (objetivo + ideas clave) y una de cierre (licencia y contacto).
  Sin dependencias: escribe directamente el OOXML de PowerPoint (mismo enfoque que docx.ps1 para Word).
  No se edita a mano; build.ps1 lo ejecuta antes de los HTML para que la guía del curso enlace el fichero.

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
$cursoDir = Join-Path $repo 'SEVEN-G\mds\{0}\curso'
$fechaFija = [DateTimeOffset]::new(2026, 1, 1, 0, 0, 0, [TimeSpan]::Zero)

function Xml([string]$s) {
  if ($null -eq $s) { return '' }
  [Security.SecurityElement]::Escape($s)
}

# quita marcas de Markdown en línea (negrita, cursiva, código, enlaces) para texto de diapositiva
function Texto-Plano([string]$t) {
  $t = $t -replace '\*\*(.+?)\*\*', '$1'
  $t = $t -replace '(?<![\w*])\*(?!\s)(.+?)(?<!\s)\*(?![\w*])', '$1'
  $t = $t -replace '`([^`]+)`', '$1'
  $t = $t -replace '\[([^\]]+)\]\((?:[^)]+)\)', '$1'
  $t = $t -replace '\\(.)', '$1'
  $t.Trim()
}

function Parse-Modulo([string]$ruta) {
  $md = Get-Content -LiteralPath $ruta -Raw -Encoding utf8
  $lineas = ($md -replace "`r`n", "`n") -split "`n"
  $titulo = ($lineas | Where-Object { $_ -match '^#\s+(.+)$' } | Select-Object -First 1)
  if ($titulo) { $titulo = [regex]::Match($titulo, '^#\s+(.+)$').Groups[1].Value } else { $titulo = '' }
  $sub = ($lineas | Where-Object { $_ -match '^\*\*(.+)\*\*\s*$' } | Select-Object -First 1)
  if ($sub) { $sub = [regex]::Match($sub, '^\*\*(.+)\*\*\s*$').Groups[1].Value } else { $sub = '' }

  # sección "Objetivo"/"Objective": primer párrafo no vacío tras el encabezado
  $objetivo = ''
  for ($i = 0; $i -lt $lineas.Count; $i++) {
    if ($lineas[$i] -match '^##\s+\d+\.\s*(Objetivo|Objective)\b') {
      for ($j = $i + 1; $j -lt $lineas.Count; $j++) {
        if ($lineas[$j].Trim() -ne '' -and $lineas[$j] -notmatch '^---') { $objetivo = Texto-Plano $lineas[$j]; break }
        if ($lineas[$j] -match '^##') { break }
      }
      break
    }
  }

  # sección "Ideas clave"/"Key ideas": items de lista numerada
  $ideas = @()
  $enIdeas = $false
  foreach ($l in $lineas) {
    if ($l -match '^##\s+\d+\.\s*(Ideas clave|Key ideas)\b') { $enIdeas = $true; continue }
    if ($enIdeas -and $l -match '^##\s+\d+\.') { break }
    if ($enIdeas -and $l -match '^\d+\.\s+(.+)$') { $ideas += (Texto-Plano $Matches[1]) }
  }
  [pscustomobject]@{ Titulo = $titulo; Subtitulo = $sub; Objetivo = $objetivo; Ideas = $ideas }
}

# ---------- OOXML mínimo de una presentación (16:9, 12192000 x 6858000 EMU) ----------

function Rpr([string]$colorHex, [int]$tamano, [bool]$negrita = $false) {
  $b = if ($negrita) { ' b="1"' } else { '' }
  "<a:rPr lang=""es-ES"" sz=""$tamano""$b dirty=""0""><a:solidFill><a:srgbClr val=""$colorHex""/></a:solidFill></a:rPr>"
}

function Parrafo-Titulo([string]$texto, [string]$colorHex, [int]$tamano) {
  "<a:p><a:pPr algn=""l""/><a:r>$(Rpr $colorHex $tamano $true)<a:t>$(Xml $texto)</a:t></a:r></a:p>"
}

function Parrafo-Bullet([string]$texto, [string]$colorHex, [int]$tamano) {
  "<a:p><a:pPr marL=""285750"" indent=""-285750""><a:buFont typeface=""Arial""/><a:buChar char=""&#8226;""/></a:pPr><a:r>$(Rpr $colorHex $tamano $false)<a:t>$(Xml $texto)</a:t></a:r></a:p>"
}

function Parrafo-Simple([string]$texto, [string]$colorHex, [int]$tamano, [bool]$negrita = $false) {
  "<a:p><a:pPr algn=""ctr""/><a:r>$(Rpr $colorHex $tamano $negrita)<a:t>$(Xml $texto)</a:t></a:r></a:p>"
}

$NEGRO = '1A1817'; $CLARET = '990F3D'; $PAPEL = 'FBE2CD'; $TINTA = '2F2B28'; $OXFORD = '0F5499'

function Slide-Xml([string]$cuerpoShapes) {
  @"
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<p:sld xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:p="http://schemas.openxmlformats.org/presentationml/2006/main"><p:cSld><p:bg><p:bgPr><a:solidFill><a:srgbClr val="$PAPEL"/></a:solidFill><a:effectLst/></p:bgPr></p:bg><p:spTree><p:nvGrpSpPr><p:cNvPr id="1" name=""/><p:cNvGrpSpPr/><p:nvPr/></p:nvGrpSpPr><p:grpSpPr><a:xfrm><a:off x="0" y="0"/><a:ext cx="0" cy="0"/><a:chOff x="0" y="0"/><a:chExt cx="0" cy="0"/></a:xfrm></p:grpSpPr>
$cuerpoShapes
</p:spTree></p:cSld><p:clrMapOvr><a:overrideClrMapping bg1="lt1" tx1="dk1" bg2="lt2" tx2="dk2" accent1="accent1" accent2="accent2" accent3="accent3" accent4="accent4" accent5="accent5" accent6="accent6" hlink="hlink" folHlink="folHlink"/></p:clrMapOvr></p:sld>
"@
}

function Shape-Texto([int]$id, [int]$x, [int]$y, [int]$cx, [int]$cy, [string]$parrafosXml) {
  @"
<p:sp><p:nvSpPr><p:cNvPr id="$id" name="Texto $id"/><p:cNvSpPr txBox="1"/><p:nvPr/></p:nvSpPr><p:spPr><a:xfrm><a:off x="$x" y="$y"/><a:ext cx="$cx" cy="$cy"/></a:xfrm><a:prstGeom prst="rect"><a:avLst/></a:prstGeom><a:noFill/></p:spPr><p:txBody><a:bodyPr wrap="square" anchor="t"><a:normAutofit/></a:bodyPr><a:lstStyle/>
$parrafosXml
</p:txBody></p:sp>
"@
}

function Diapositiva-Portada([string]$tituloCurso, [string]$subCurso, [string]$licencia) {
  $rombo = "<p:sp><p:nvSpPr><p:cNvPr id=""9"" name=""Marca""/><p:cNvSpPr/><p:nvPr/></p:nvSpPr><p:spPr><a:xfrm><a:off x=""609600"" y=""609600""/><a:ext cx=""182880"" cy=""182880""/></a:xfrm><a:prstGeom prst=""rect""><a:avLst/></a:prstGeom><a:solidFill><a:srgbClr val=""$CLARET""/></a:solidFill></p:spPr><p:txBody><a:bodyPr/><a:lstStyle/><a:p/></p:txBody></p:sp>"
  $titulo = Shape-Texto 2 609600 1600200 10972800 1600200 (Parrafo-Titulo $tituloCurso $NEGRO 5400)
  $sub = Shape-Texto 3 609600 3200400 10972800 900000 (Parrafo-Bullet $subCurso $TINTA 2400)
  $lic = Shape-Texto 4 609600 6100000 10972800 500000 (Parrafo-Bullet $licencia $OXFORD 1600)
  Slide-Xml ($rombo + $titulo + $sub + $lic)
}

function Diapositiva-Modulo([string]$numero, [pscustomobject]$m, [string]$rotObjetivo, [string]$rotIdeas) {
  $titulo = Shape-Texto 2 609600 365760 10972800 1000000 (Parrafo-Titulo "$numero · $($m.Titulo -replace '^Módulo \d+\s*·\s*', '' -replace '^Module \d+\s*·\s*', '')" $CLARET 3200)
  $obj = ''
  if ($m.Objetivo) {
    $obj = Shape-Texto 3 609600 1450000 10972800 900000 (
      "<a:p><a:r>$(Rpr $NEGRO 1800 $true)<a:t>$(Xml $rotObjetivo): </a:t></a:r><a:r>$(Rpr $TINTA 1800 $false)<a:t>$(Xml $m.Objetivo)</a:t></a:r></a:p>"
    )
  }
  $ideasParrafos = "<a:p><a:r>$(Rpr $NEGRO 1800 $true)<a:t>$(Xml $rotIdeas)</a:t></a:r></a:p>"
  foreach ($idea in $m.Ideas) { $ideasParrafos += (Parrafo-Bullet $idea $TINTA 1700) }
  $ideas = Shape-Texto 4 609600 2450000 10972800 4000000 $ideasParrafos
  Slide-Xml ($titulo + $obj + $ideas)
}

function Diapositiva-Cierre([string]$textoCierre1, [string]$textoCierre2, [string]$url) {
  $t1 = Shape-Texto 2 609600 2400000 10972800 900000 (Parrafo-Simple $textoCierre1 $NEGRO 3200 $true)
  $t2 = Shape-Texto 3 609600 3400000 10972800 700000 (Parrafo-Simple $textoCierre2 $TINTA 1800 $false)
  $t3 = Shape-Texto 4 609600 4100000 10972800 700000 (Parrafo-Simple $url $OXFORD 1800 $false)
  Slide-Xml ($t1 + $t2 + $t3)
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
<a:clrScheme name="SEVEN-G"><a:dk1><a:srgbClr val="$NEGRO"/></a:dk1><a:lt1><a:srgbClr val="$PAPEL"/></a:lt1><a:dk2><a:srgbClr val="$TINTA"/></a:dk2><a:lt2><a:srgbClr val="FFFFFF"/></a:lt2><a:accent1><a:srgbClr val="$CLARET"/></a:accent1><a:accent2><a:srgbClr val="$OXFORD"/></a:accent2><a:accent3><a:srgbClr val="0D7680"/></a:accent3><a:accent4><a:srgbClr val="593380"/></a:accent4><a:accent5><a:srgbClr val="A5822A"/></a:accent5><a:accent6><a:srgbClr val="71645B"/></a:accent6><a:hlink><a:srgbClr val="$OXFORD"/></a:hlink><a:folHlink><a:srgbClr val="593380"/></a:folHlink></a:clrScheme>
<a:fontScheme name="SEVEN-G"><a:majorFont><a:latin typeface="Georgia"/><a:ea typeface=""/><a:cs typeface=""/></a:majorFont><a:minorFont><a:latin typeface="Arial"/><a:ea typeface=""/><a:cs typeface=""/></a:minorFont></a:fontScheme>
<a:fmtScheme name="SEVEN-G"><a:fillStyleLst><a:solidFill><a:schemeClr val="accent1"/></a:solidFill><a:solidFill><a:schemeClr val="accent1"/></a:solidFill><a:solidFill><a:schemeClr val="accent1"/></a:solidFill></a:fillStyleLst><a:lnStyleLst><a:ln><a:solidFill><a:schemeClr val="accent1"/></a:solidFill></a:ln><a:ln><a:solidFill><a:schemeClr val="accent1"/></a:solidFill></a:ln><a:ln><a:solidFill><a:schemeClr val="accent1"/></a:solidFill></a:ln></a:lnStyleLst><a:effectStyleLst><a:effectStyle><a:effectLst/></a:effectStyle><a:effectStyle><a:effectLst/></a:effectStyle><a:effectStyle><a:effectLst/></a:effectStyle></a:effectStyleLst><a:bgFillStyleLst><a:solidFill><a:schemeClr val="lt1"/></a:solidFill><a:solidFill><a:schemeClr val="lt1"/></a:solidFill><a:solidFill><a:schemeClr val="lt1"/></a:solidFill></a:bgFillStyleLst></a:fmtScheme>
</a:themeElements>
</a:theme>
"@

$slideLayout = @'
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<p:sldLayout xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:p="http://schemas.openxmlformats.org/presentationml/2006/main" type="blank" preserve="1">
<p:cSld name="Blank"><p:spTree><p:nvGrpSpPr><p:cNvPr id="1" name=""/><p:cNvGrpSpPr/><p:nvPr/></p:nvGrpSpPr><p:grpSpPr><a:xfrm><a:off x="0" y="0"/><a:ext cx="0" cy="0"/><a:chOff x="0" y="0"/><a:chExt cx="0" cy="0"/></a:xfrm></p:grpSpPr></p:spTree></p:cSld>
<p:clrMapOvr><a:masterClrMapping/></p:clrMapOvr>
</p:sldLayout>
'@
$slideLayoutRels = @'
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">
<Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/slideMaster" Target="../slideMasters/slideMaster1.xml"/>
</Relationships>
'@

$slideMaster = @'
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<p:sldMaster xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:p="http://schemas.openxmlformats.org/presentationml/2006/main">
<p:cSld><p:bg><p:bgPr><a:solidFill><a:schemeClr val="lt1"/></a:solidFill><a:effectLst/></p:bgPr></p:bg><p:spTree><p:nvGrpSpPr><p:cNvPr id="1" name=""/><p:cNvGrpSpPr/><p:nvPr/></p:nvGrpSpPr><p:grpSpPr><a:xfrm><a:off x="0" y="0"/><a:ext cx="0" cy="0"/><a:chOff x="0" y="0"/><a:chExt cx="0" cy="0"/></a:xfrm></p:grpSpPr></p:spTree></p:cSld>
<p:clrMap bg1="lt1" tx1="dk1" bg2="lt2" tx2="dk2" accent1="accent1" accent2="accent2" accent3="accent3" accent4="accent4" accent5="accent5" accent6="accent6" hlink="hlink" folHlink="folHlink"/>
<p:sldLayoutIdLst><p:sldLayoutId id="2147483649" r:id="rId1"/></p:sldLayoutIdLst>
</p:sldMaster>
'@
$slideMasterRels = @'
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">
<Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/slideLayout" Target="../slideLayouts/slideLayout1.xml"/>
<Relationship Id="rId2" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/theme" Target="../theme/theme1.xml"/>
</Relationships>
'@

function App-Xml([int]$nSlides, [string]$idioma) {
  @"
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Properties xmlns="http://schemas.openxmlformats.org/officeDocument/2006/extended-properties" xmlns:vt="http://schemas.openxmlformats.org/officeDocument/2006/docPropsVTypes">
<Application>SEVEN-G build</Application><Slides>$nSlides</Slides><Company>Fernando García Varela</Company>
</Properties>
"@
}

function Core-Xml([string]$titulo) {
  $f = $fechaFija.ToString('yyyy-MM-ddTHH:mm:ssZ')
  @"
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<cp:coreProperties xmlns:cp="http://schemas.openxmlformats.org/package/2006/metadata/core-properties" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
<dc:title>$(Xml $titulo)</dc:title><dc:creator>Fernando García Varela</dc:creator><cp:lastModifiedBy>SEVEN-G build</cp:lastModifiedBy>
<dcterms:created xsi:type="dcterms:W3CDTF">$f</dcterms:created><dcterms:modified xsi:type="dcterms:W3CDTF">$f</dcterms:modified>
</cp:coreProperties>
"@
}

function Escribir-Pptx([string]$rutaSalida, [string[]]$slidesXml, [string]$titulo, [string]$idioma) {
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
    $overrides = ''
    $presRelsSlides = ''
    $sldIdLst = ''
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
    Add-Entrada 'docProps/app.xml' (App-Xml $n $idioma)
    Add-Entrada 'ppt/theme/theme1.xml' $theme
    Add-Entrada 'ppt/slideLayouts/slideLayout1.xml' $slideLayout
    Add-Entrada 'ppt/slideLayouts/_rels/slideLayout1.xml.rels' $slideLayoutRels
    Add-Entrada 'ppt/slideMasters/slideMaster1.xml' $slideMaster
    Add-Entrada 'ppt/slideMasters/_rels/slideMaster1.xml.rels' $slideMasterRels
    $presentation = @"
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<p:presentation xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:p="http://schemas.openxmlformats.org/presentationml/2006/main">
<p:sldMasterIdLst><p:sldMasterId id="2147483648" r:id="rIdM1"/></p:sldMasterIdLst>
<p:sldIdLst>
$sldIdLst
</p:sldIdLst>
<p:sldSz cx="12192000" cy="6858000" type="screen16x9"/>
<p:notesSz cx="6858000" cy="9144000"/>
</p:presentation>
"@
    Add-Entrada 'ppt/presentation.xml' $presentation
    $presRels = "<?xml version=""1.0"" encoding=""UTF-8"" standalone=""yes""?><Relationships xmlns=""http://schemas.openxmlformats.org/package/2006/relationships""><Relationship Id=""rIdM1"" Type=""http://schemas.openxmlformats.org/officeDocument/2006/relationships/slideMaster"" Target=""slideMasters/slideMaster1.xml""/><Relationship Id=""rIdT1"" Type=""http://schemas.openxmlformats.org/officeDocument/2006/relationships/theme"" Target=""theme/theme1.xml""/>$presRelsSlides</Relationships>"
    Add-Entrada 'ppt/_rels/presentation.xml.rels' $presRels
  } finally { $zip.Dispose() }
}

# ---------- generación por idioma ----------

$textos = @{
  es = @{ objetivo = 'Objetivo'; ideas = 'Ideas clave'; cierre1 = 'Gracias'; cierre2 = 'SEVEN-G · Fernando García Varela · CC BY 4.0 (contenidos) · MIT (código)'; sub = 'Curso de autoaprendizaje: qué es, cómo se usa y cómo moverse por el sitio' }
  en = @{ objetivo = 'Objective'; ideas = 'Key ideas'; cierre1 = 'Thank you'; cierre2 = 'SEVEN-G · Fernando García Varela · CC BY 4.0 (content) · MIT (code)'; sub = 'Self-learning course: what it is, how it is used and how to find your way around the site' }
}
$tituloCurso = @{ es = 'Curso de SEVEN-G'; en = 'SEVEN-G course' }

foreach ($lang in $Idiomas) {
  $dir = [string]::Format($cursoDir, $lang)
  if (-not (Test-Path $dir)) { Write-Warning "No existe $dir"; continue }
  $modulos = Get-ChildItem $dir -Filter 'M*.md' | Sort-Object Name
  if (-not $modulos) { Write-Warning "Sin módulos en $dir"; continue }

  $t = $textos[$lang]
  $slides = @()
  $slides += (Diapositiva-Portada $tituloCurso[$lang] $t.sub $t.cierre2)
  foreach ($f in $modulos) {
    $m = Parse-Modulo $f.FullName
    $numero = [regex]::Match($f.Name, '^M(\d+)_').Groups[1].Value
    $slides += (Diapositiva-Modulo $numero $m $t.objetivo $t.ideas)
  }
  $slides += (Diapositiva-Cierre $t.cierre1 $t.sub 'https://www.linkedin.com/in/fernandogarciavarela/')

  $salida = Join-Path $repo "SEVEN-G\pptx\$lang\SEVEN-G_Curso.pptx"
  Escribir-Pptx $salida $slides $tituloCurso[$lang] $lang
  Write-Host "$lang : $($slides.Count) diapositivas -> $salida"
}
