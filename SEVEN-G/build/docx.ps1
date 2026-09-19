<#
.SYNOPSIS
  Genera la versión editable en Word (.docx) de cada plantilla de SEVEN-G a partir de su Markdown.

.DESCRIPTION
  Fuentes:  SEVEN-G/mds/<idioma>/plantillas/*.md
  Salidas:  SEVEN-G/docx/<idioma>/plantillas/<nombre>.docx

  Las plantillas se leen en HTML o PDF, pero una compañía las rellena en su procesador de textos: el .docx es la versión de trabajo
  de la misma fuente (D32, D67). No se edita a mano; se regenera con este script, que build.ps1 ejecuta antes de generar los HTML
  para que la zona de descargas enlace el .docx.

  Convierte lo que usan las plantillas: títulos (#, ##, ###), párrafos, negrita, cursiva, código, tablas, listas, citas y
  separadores. El resultado es determinista (mismas fechas internas en el ZIP) para que regenerar sin cambios no produzca
  diferencias en git. En las propiedades del documento guarda la huella SHA-256 del Markdown de origen, que comprueba
  verificar_coherencia.ps1.

.EXAMPLE
  pwsh -File SEVEN-G/build/docx.ps1
  pwsh -File SEVEN-G/build/docx.ps1 -Idiomas es -Filter P12_*
#>
param(
  [string[]]$Idiomas = @('es', 'en'),
  [string]$Filter = '*.md'
)

$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.IO.Compression
$repo = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
$fechaFija = [DateTimeOffset]::new(2026, 1, 1, 0, 0, 0, [TimeSpan]::Zero)

function Xml([string]$s) { [Security.SecurityElement]::Escape($s) }

# texto en línea -> runs de Word (negrita, cursiva y código; admite cursiva dentro de negrita y al revés)
function Runs([string]$t, [bool]$b = $false, [bool]$i = $false) {
  $t = $t -replace '\\([<>*_`\[\]|#\\-])', '$1'
  $t = $t -replace '\[([^\]]+)\]\((?:[^)]+)\)', '$1'   # enlaces: se deja el texto
  $sb = [Text.StringBuilder]::new()
  $rx = [regex]'\*\*(.+?)\*\*|(?<![\w*])\*(?!\s)(.+?)(?<!\s)\*(?![\w*])|`([^`]+)`'
  $pos = 0
  foreach ($m in $rx.Matches($t)) {
    if ($m.Index -gt $pos) { [void]$sb.Append((Run $t.Substring($pos, $m.Index - $pos) $b $i $false)) }
    if ($m.Groups[1].Success) { [void]$sb.Append((Runs $m.Groups[1].Value $true $i)) }
    elseif ($m.Groups[2].Success) { [void]$sb.Append((Runs $m.Groups[2].Value $b $true)) }
    else { [void]$sb.Append((Run $m.Groups[3].Value $b $i $true)) }
    $pos = $m.Index + $m.Length
  }
  if ($pos -lt $t.Length) { [void]$sb.Append((Run $t.Substring($pos) $b $i $false)) }
  $sb.ToString()
}
function Run([string]$s, [bool]$b, [bool]$i, [bool]$code) {
  if ($s -eq '') { return '' }
  $pr = ''
  if ($b) { $pr += '<w:b/>' }
  if ($i) { $pr += '<w:i/>' }
  if ($code) { $pr += '<w:rFonts w:ascii="Consolas" w:hAnsi="Consolas"/><w:sz w:val="18"/>' }
  $rpr = if ($pr) { "<w:rPr>$pr</w:rPr>" } else { '' }
  "<w:r>$rpr<w:t xml:space=""preserve"">$(Xml $s)</w:t></w:r>"
}
function Parrafo([string]$texto, [string]$estilo = '', [bool]$b = $false) {
  $ppr = if ($estilo) { "<w:pPr><w:pStyle w:val=""$estilo""/></w:pPr>" } else { '' }
  "<w:p>$ppr$(Runs $texto $b $false)</w:p>"
}
function Celdas([string]$fila) {
  $f = $fila.Trim(); if ($f.StartsWith('|')) { $f = $f.Substring(1) }; if ($f.EndsWith('|') -and -not $f.EndsWith('\|')) { $f = $f.Substring(0, $f.Length - 1) }
  @([regex]::Split($f, '(?<!\\)\|') | ForEach-Object { $_.Trim() })
}
function Tabla([string[]]$lineas) {
  $filas = @($lineas | Where-Object { $_ -notmatch '^\s*\|?\s*:?-{2,}' })
  $cab = Celdas $filas[0]
  $cuerpo = @($filas | Select-Object -Skip 1 | ForEach-Object { , (Celdas $_) })
  $n = [Math]::Max($cab.Count, (@($cuerpo | ForEach-Object { $_.Count }) + 0 | Measure-Object -Maximum).Maximum)
  $ancho = [int](9638 / [Math]::Max($n, 1))
  $sb = [Text.StringBuilder]::new()
  [void]$sb.Append('<w:tbl><w:tblPr><w:tblStyle w:val="TablaSG"/><w:tblW w:w="5000" w:type="pct"/><w:tblLayout w:type="autofit"/><w:tblLook w:val="04A0" w:firstRow="1" w:lastRow="0" w:firstColumn="0" w:lastColumn="0" w:noHBand="1" w:noVBand="1"/></w:tblPr><w:tblGrid>')
  for ($k = 0; $k -lt $n; $k++) { [void]$sb.Append("<w:gridCol w:w=""$ancho""/>") }
  [void]$sb.Append('</w:tblGrid>')
  $cabVacia = -not ($cab | Where-Object { $_ })
  $todas = if ($cabVacia) { $cuerpo } else { @(, $cab) + $cuerpo }
  $primera = -not $cabVacia
  foreach ($c in $todas) {
    $trpr = if ($primera) { '<w:trPr><w:tblHeader/></w:trPr>' } else { '' }
    [void]$sb.Append("<w:tr>$trpr")
    for ($k = 0; $k -lt $n; $k++) {
      $v = if ($k -lt $c.Count) { $c[$k] } else { '' }
      $sombra = if ($primera) { '<w:shd w:val="clear" w:color="auto" w:fill="F2DFCE"/>' } else { '' }
      $parrs = ($v -split '<br\s*/?>' | ForEach-Object { "<w:p><w:pPr><w:pStyle w:val=""Celda""/></w:pPr>$(Runs $_ $primera $false)</w:p>" }) -join ''
      [void]$sb.Append("<w:tc><w:tcPr><w:tcW w:w=""$ancho"" w:type=""dxa""/>$sombra</w:tcPr>$parrs</w:tc>")
    }
    [void]$sb.Append('</w:tr>')
    $primera = $false
  }
  [void]$sb.Append('</w:tbl><w:p><w:pPr><w:pStyle w:val="Espacio"/></w:pPr></w:p>')
  $sb.ToString()
}

function Cuerpo([string]$md) {
  $lineas = ($md -replace "`r`n", "`n") -split "`n"
  $sb = [Text.StringBuilder]::new()
  $i = 0; $enComentario = $false; $enCodigo = $false
  while ($i -lt $lineas.Count) {
    $l = $lineas[$i]
    if ($enCodigo) { if ($l -match '^```') { $enCodigo = $false } else { [void]$sb.Append((Parrafo ('`' + $l + '`'))) }; $i++; continue }
    if ($l -match '^```') { $enCodigo = $true; $i++; continue }
    if ($enComentario) { if ($l -match '-->') { $enComentario = $false }; $i++; continue }
    if ($l -match '^\s*<!--') { if ($l -notmatch '-->') { $enComentario = $true }; $i++; continue }
    if ($l -match '^\s*$') { $i++; continue }
    if ($l -match '^\s*---+\s*$') { [void]$sb.Append('<w:p><w:pPr><w:pStyle w:val="Separador"/></w:pPr></w:p>'); $i++; continue }
    if ($l -match '^(#{1,4})\s+(.+)$') {
      $nivel = $Matches[1].Length; $estilo = @('', 'Title', 'Heading1', 'Heading2', 'Heading3')[$nivel]
      [void]$sb.Append((Parrafo $Matches[2] $estilo)); $i++; continue
    }
    if ($l -match '^\s*\|') {
      $bloque = @(); while ($i -lt $lineas.Count -and $lineas[$i] -match '^\s*\|') { $bloque += $lineas[$i]; $i++ }
      [void]$sb.Append((Tabla $bloque)); continue
    }
    if ($l -match '^\s*>\s?(.*)$') {
      $txt = @(); while ($i -lt $lineas.Count -and $lineas[$i] -match '^\s*>\s?(.*)$') { $txt += $Matches[1]; $i++ }
      [void]$sb.Append((Parrafo (($txt | Where-Object { $_ -ne '' }) -join ' ') 'Cita')); continue
    }
    if ($l -match '^(\s*)[-*+]\s+(.+)$') { $sang = [int]($Matches[1].Length / 2); [void]$sb.Append((Parrafo ('• ' + $Matches[2]) $(if ($sang) { 'Lista2' } else { 'Lista' }))); $i++; continue }
    if ($l -match '^(\s*)(\d+)[.)]\s+(.+)$') { [void]$sb.Append((Parrafo ($Matches[2] + '. ' + $Matches[3]) 'Lista')); $i++; continue }
    # párrafo: se unen las líneas seguidas
    $txt = @($l.Trim()); $i++
    while ($i -lt $lineas.Count -and $lineas[$i] -notmatch '^\s*$|^\s*[#|>]|^\s*[-*+]\s|^\s*\d+[.)]\s|^\s*---+\s*$|^```|^\s*<!--') { $txt += $lineas[$i].Trim(); $i++ }
    [void]$sb.Append((Parrafo ($txt -join ' ')))
  }
  $sb.ToString()
}

$estilos = @'
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<w:styles xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">
<w:docDefaults><w:rPrDefault><w:rPr><w:rFonts w:ascii="Georgia" w:hAnsi="Georgia" w:eastAsia="Georgia" w:cs="Georgia"/><w:color w:val="1A1817"/><w:sz w:val="20"/><w:szCs w:val="20"/><w:lang w:val="{{LANG}}"/></w:rPr></w:rPrDefault><w:pPrDefault><w:pPr><w:spacing w:after="120" w:line="264" w:lineRule="auto"/></w:pPr></w:pPrDefault></w:docDefaults>
<w:style w:type="paragraph" w:default="1" w:styleId="Normal"><w:name w:val="Normal"/><w:qFormat/></w:style>
<w:style w:type="paragraph" w:styleId="Title"><w:name w:val="Title"/><w:basedOn w:val="Normal"/><w:next w:val="Normal"/><w:qFormat/><w:pPr><w:spacing w:after="160"/></w:pPr><w:rPr><w:b/><w:color w:val="1A1817"/><w:sz w:val="40"/></w:rPr></w:style>
<w:style w:type="paragraph" w:styleId="Heading1"><w:name w:val="heading 1"/><w:basedOn w:val="Normal"/><w:next w:val="Normal"/><w:qFormat/><w:pPr><w:keepNext/><w:pBdr><w:top w:val="single" w:sz="12" w:space="4" w:color="990F3D"/></w:pBdr><w:spacing w:before="360" w:after="120"/><w:outlineLvl w:val="0"/></w:pPr><w:rPr><w:b/><w:color w:val="990F3D"/><w:sz w:val="28"/></w:rPr></w:style>
<w:style w:type="paragraph" w:styleId="Heading2"><w:name w:val="heading 2"/><w:basedOn w:val="Normal"/><w:next w:val="Normal"/><w:qFormat/><w:pPr><w:keepNext/><w:spacing w:before="240" w:after="80"/><w:outlineLvl w:val="1"/></w:pPr><w:rPr><w:b/><w:color w:val="0D7680"/><w:sz w:val="24"/></w:rPr></w:style>
<w:style w:type="paragraph" w:styleId="Heading3"><w:name w:val="heading 3"/><w:basedOn w:val="Normal"/><w:next w:val="Normal"/><w:qFormat/><w:pPr><w:keepNext/><w:spacing w:before="200" w:after="60"/><w:outlineLvl w:val="2"/></w:pPr><w:rPr><w:b/><w:sz w:val="21"/></w:rPr></w:style>
<w:style w:type="paragraph" w:styleId="Cita"><w:name w:val="Cita SEVEN-G"/><w:basedOn w:val="Normal"/><w:pPr><w:pBdr><w:left w:val="single" w:sz="18" w:space="8" w:color="990F3D"/></w:pBdr><w:shd w:val="clear" w:color="auto" w:fill="FFF1E5"/><w:ind w:left="240" w:right="120"/><w:spacing w:before="120" w:after="160"/></w:pPr><w:rPr><w:sz w:val="17"/></w:rPr></w:style>
<w:style w:type="paragraph" w:styleId="Celda"><w:name w:val="Celda"/><w:basedOn w:val="Normal"/><w:pPr><w:spacing w:before="20" w:after="20" w:line="240" w:lineRule="auto"/></w:pPr><w:rPr><w:sz w:val="17"/></w:rPr></w:style>
<w:style w:type="paragraph" w:styleId="Lista"><w:name w:val="Lista SEVEN-G"/><w:basedOn w:val="Normal"/><w:pPr><w:ind w:left="360" w:hanging="240"/><w:spacing w:after="60"/></w:pPr></w:style>
<w:style w:type="paragraph" w:styleId="Lista2"><w:name w:val="Lista SEVEN-G 2"/><w:basedOn w:val="Lista"/><w:pPr><w:ind w:left="720" w:hanging="240"/></w:pPr></w:style>
<w:style w:type="paragraph" w:styleId="Separador"><w:name w:val="Separador"/><w:basedOn w:val="Normal"/><w:pPr><w:pBdr><w:bottom w:val="single" w:sz="4" w:space="1" w:color="CCC1B7"/></w:pBdr><w:spacing w:after="120"/></w:pPr></w:style>
<w:style w:type="paragraph" w:styleId="Espacio"><w:name w:val="Espacio"/><w:basedOn w:val="Normal"/><w:pPr><w:spacing w:after="60" w:line="120" w:lineRule="exact"/></w:pPr></w:style>
<w:style w:type="paragraph" w:styleId="Pie"><w:name w:val="footer"/><w:basedOn w:val="Normal"/><w:rPr><w:color w:val="66605C"/><w:sz w:val="15"/></w:rPr></w:style>
<w:style w:type="table" w:styleId="TablaSG"><w:name w:val="Tabla SEVEN-G"/><w:tblPr><w:tblBorders><w:top w:val="single" w:sz="4" w:space="0" w:color="CCC1B7"/><w:left w:val="single" w:sz="4" w:space="0" w:color="CCC1B7"/><w:bottom w:val="single" w:sz="4" w:space="0" w:color="CCC1B7"/><w:right w:val="single" w:sz="4" w:space="0" w:color="CCC1B7"/><w:insideH w:val="single" w:sz="4" w:space="0" w:color="CCC1B7"/><w:insideV w:val="single" w:sz="4" w:space="0" w:color="CCC1B7"/></w:tblBorders><w:tblCellMar><w:top w:w="40" w:type="dxa"/><w:left w:w="80" w:type="dxa"/><w:bottom w:w="40" w:type="dxa"/><w:right w:w="80" w:type="dxa"/></w:tblCellMar></w:tblPr></w:style>
</w:styles>
'@

$ns = 'xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships"'
$tipos = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?><Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types"><Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml"/><Default Extension="xml" ContentType="application/xml"/><Override PartName="/word/document.xml" ContentType="application/vnd.openxmlformats-officedocument.wordprocessingml.document.main+xml"/><Override PartName="/word/styles.xml" ContentType="application/vnd.openxmlformats-officedocument.wordprocessingml.styles+xml"/><Override PartName="/word/footer1.xml" ContentType="application/vnd.openxmlformats-officedocument.wordprocessingml.footer+xml"/><Override PartName="/docProps/core.xml" ContentType="application/vnd.openxmlformats-package.core-properties+xml"/><Override PartName="/docProps/app.xml" ContentType="application/vnd.openxmlformats-officedocument.extended-properties+xml"/></Types>'
$relsRaiz = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?><Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships"><Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument" Target="word/document.xml"/><Relationship Id="rId2" Type="http://schemas.openxmlformats.org/package/2006/relationships/metadata/core-properties" Target="docProps/core.xml"/><Relationship Id="rId3" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/extended-properties" Target="docProps/app.xml"/></Relationships>'
$relsDoc = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?><Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships"><Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/styles" Target="styles.xml"/><Relationship Id="rId2" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/footer" Target="footer1.xml"/></Relationships>'
$app = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?><Properties xmlns="http://schemas.openxmlformats.org/officeDocument/2006/extended-properties"><Application>SEVEN-G docx.ps1</Application></Properties>'

function Escribir([string]$destino, [hashtable]$partes) {
  New-Item -ItemType Directory -Force (Split-Path $destino) | Out-Null
  $ms = [IO.MemoryStream]::new()
  $zip = [IO.Compression.ZipArchive]::new($ms, [IO.Compression.ZipArchiveMode]::Create, $true)
  foreach ($nombre in @('[Content_Types].xml', '_rels/.rels', 'docProps/core.xml', 'docProps/app.xml', 'word/_rels/document.xml.rels', 'word/document.xml', 'word/styles.xml', 'word/footer1.xml')) {
    $e = $zip.CreateEntry($nombre, [IO.Compression.CompressionLevel]::Optimal); $e.LastWriteTime = $fechaFija
    $w = [IO.StreamWriter]::new($e.Open(), [Text.UTF8Encoding]::new($false)); $w.Write($partes[$nombre]); $w.Dispose()
  }
  $zip.Dispose()
  $nuevo = $ms.ToArray()
  if ((Test-Path $destino) -and [Linq.Enumerable]::SequenceEqual([IO.File]::ReadAllBytes($destino), $nuevo)) { return $false }
  [IO.File]::WriteAllBytes($destino, $nuevo); return $true
}

$n = 0; $cambiados = 0
foreach ($lang in $Idiomas) {
  $dir = Join-Path $repo "SEVEN-G\mds\$lang\plantillas"
  if (-not (Test-Path $dir)) { continue }
  foreach ($f in (Get-ChildItem $dir -File -Filter $Filter | Where-Object Extension -eq '.md' | Sort-Object Name)) {
    $md = [IO.File]::ReadAllText($f.FullName, [Text.Encoding]::UTF8)
    $huella = [Convert]::ToHexString([Security.Cryptography.SHA256]::HashData([Text.Encoding]::UTF8.GetBytes(($md -replace "`r`n", "`n")))).ToLowerInvariant()
    $titulo = if ($md -match '(?m)^#\s+(.+)$') { $Matches[1].Trim() } else { $f.BaseName }
    $codigo = ($f.BaseName -split '_')[0]
    $pieTxt = if ($lang -eq 'en') { "SEVEN-G · Template $codigo · $titulo · CC BY 4.0 · Fernando García · SEACHAD · Generated from the Markdown source: do not edit the template, fill in a copy." } else { "SEVEN-G · Plantilla $codigo · $titulo · CC BY 4.0 · Fernando García · SEACHAD · Generada desde la fuente Markdown: no edite la plantilla, rellene una copia." }
    $doc = "<?xml version=""1.0"" encoding=""UTF-8"" standalone=""yes""?><w:document $ns><w:body>$(Cuerpo $md)<w:sectPr><w:footerReference w:type=""default"" r:id=""rId2""/><w:pgSz w:w=""11906"" w:h=""16838""/><w:pgMar w:top=""1134"" w:right=""1134"" w:bottom=""1134"" w:left=""1134"" w:header=""567"" w:footer=""567"" w:gutter=""0""/></w:sectPr></w:body></w:document>"
    $pie = "<?xml version=""1.0"" encoding=""UTF-8"" standalone=""yes""?><w:ftr $ns><w:p><w:pPr><w:pStyle w:val=""Pie""/></w:pPr>$(Run $pieTxt $false $false $false)<w:r><w:rPr><w:color w:val=""66605C""/><w:sz w:val=""15""/></w:rPr><w:t xml:space=""preserve""> · </w:t></w:r><w:r><w:rPr><w:sz w:val=""15""/></w:rPr><w:fldChar w:fldCharType=""begin""/></w:r><w:r><w:rPr><w:sz w:val=""15""/></w:rPr><w:instrText xml:space=""preserve""> PAGE </w:instrText></w:r><w:r><w:rPr><w:sz w:val=""15""/></w:rPr><w:fldChar w:fldCharType=""separate""/></w:r><w:r><w:rPr><w:sz w:val=""15""/></w:rPr><w:t>1</w:t></w:r><w:r><w:rPr><w:sz w:val=""15""/></w:rPr><w:fldChar w:fldCharType=""end""/></w:r></w:p></w:ftr>"
    $core = "<?xml version=""1.0"" encoding=""UTF-8"" standalone=""yes""?><cp:coreProperties xmlns:cp=""http://schemas.openxmlformats.org/package/2006/metadata/core-properties"" xmlns:dc=""http://purl.org/dc/elements/1.1/"" xmlns:dcterms=""http://purl.org/dc/terms/"" xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance""><dc:title>$(Xml "$codigo · $titulo")</dc:title><dc:creator>Fernando García · SEACHAD</dc:creator><dc:language>$lang</dc:language><dc:description>sha256:$huella</dc:description><cp:keywords>SEVEN-G</cp:keywords></cp:coreProperties>"
    $partes = @{
      '[Content_Types].xml' = $tipos; '_rels/.rels' = $relsRaiz; 'docProps/core.xml' = $core; 'docProps/app.xml' = $app
      'word/_rels/document.xml.rels' = $relsDoc; 'word/document.xml' = $doc; 'word/styles.xml' = $estilos.Replace('{{LANG}}', $(if ($lang -eq 'en') { 'en-GB' } else { 'es-ES' })); 'word/footer1.xml' = $pie
    }
    $destino = Join-Path $repo "SEVEN-G\docx\$lang\plantillas\$($f.BaseName).docx"
    if (Escribir $destino $partes) { $cambiados++ }
    $n++
  }
}
Write-Host "docx: $n plantillas ($cambiados actualizadas)"
