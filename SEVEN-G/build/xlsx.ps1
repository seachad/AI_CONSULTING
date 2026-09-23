<#
.SYNOPSIS
  Genera la versión en hoja de cálculo (.xlsx) de las plantillas de SEVEN-G que son, por naturaleza, un registro,
  un cuestionario o una cartera: filas repetibles con columnas fijas, algunas con lista cerrada de valores.

.DESCRIPTION
  Salidas:  SEVEN-G/xlsx/<idioma>/plantillas/<código>_<nombre>.xlsx

  No todas las plantillas tienen versión en Excel: la mayoría de las 71 (cartas, informes, actas, planes narrativos)
  están mejor en Word y ya tienen su .docx (docx.ps1). Esta salida es solo para las que son, en su propio diseño,
  una tabla de filas repetibles (D83): matrices y registros, cuestionarios de valoración y tablas de cartera.

  Cada hoja lleva, siempre en las primeras filas: la marca SEVEN-G (con su cuadrado de color), el nombre y código
  de la plantilla, la autoría, la licencia y la versión, y la fecha de generación. La tabla empieza después, con
  cabecera en negrita, autofiltro y panel inmovilizado para que la cabecera quede visible al desplazarse; las
  columnas con una lista cerrada de valores llevan validación de datos (desplegable) en un rango amplio, para que
  las filas que se añadan después también la tengan. La primera fila de datos es siempre un ejemplo ilustrativo
  (con fondo distinto), igual que en la plantilla en Markdown, para que el fichero no se abra vacío.

  El fichero es un .xlsx real (Office Open XML), escrito a mano con System.IO.Compression, sin dependencias, igual
  que docx.ps1. No se edita a mano: se regenera con este script, que build.ps1 ejecuta antes de generar los HTML.

.EXAMPLE
  pwsh -File SEVEN-G/build/xlsx.ps1
  pwsh -File SEVEN-G/build/xlsx.ps1 -Idiomas es -Filter P12
#>
param(
  [string[]]$Idiomas = @('es', 'en'),
  [string[]]$Filter = @('*')
)

$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.IO.Compression
$repo = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
$fechaFija = [DateTimeOffset]::new(2026, 1, 1, 0, 0, 0, [TimeSpan]::Zero)
$fechaGenerado = Get-Date -Format 'yyyy-MM-dd'

function Xml([string]$s) { if ($null -eq $s) { '' } else { [Security.SecurityElement]::Escape($s) } }
function ColLetra([int]$n) {
  $s = ''
  while ($n -gt 0) { $m = ($n - 1) % 26; $s = [char](65 + $m) + $s; $n = [int](($n - $m - 1) / 26) }
  $s
}

# ---- Vocabulario común (D83) ----
$T = @{
  es = @{
    marca = 'SEVEN-G'; autor = 'Fernando García · SEACHAD'; licencia = 'Contenido CC BY 4.0 · Código MIT'
    version = 'Versión 0.1 (borrador de trabajo)'; generado = 'Generado el'; plantilla = 'Plantilla'
    ejemplo = '(ejemplo ilustrativo)'; instr = 'Sustituya o borre la fila de ejemplo; añada una fila por cada elemento. Las columnas con desplegable solo aceptan los valores de su lista.'
    resultados = 'Resultados'
  }
  en = @{
    marca = 'SEVEN-G'; autor = 'Fernando García · SEACHAD'; licencia = 'Content CC BY 4.0 · Code MIT'
    version = 'Version 0.1 (working draft)'; generado = 'Generated on'; plantilla = 'Template'
    ejemplo = '(illustrative example)'; instr = 'Replace or delete the example row; add one row per item. Columns with a dropdown only accept the values in their list.'
    resultados = 'Results'
  }
}

# ---- Listas cerradas reutilizadas entre plantillas ----
$L = @{
  categoria10 = @{ es = @('EST', 'TEC', 'DAT', 'ECO', 'LEG', 'ORG', 'REP', 'GEN', 'SEG', 'TER'); en = @('EST', 'TEC', 'DAT', 'ECO', 'LEG', 'ORG', 'REP', 'GEN', 'SEG', 'TER') }
  del1a5 = @{ es = @('1', '2', '3', '4', '5'); en = @('1', '2', '3', '4', '5') }
  siNo = @{ es = @('Sí', 'No'); en = @('Yes', 'No') }
  siNoNs = @{ es = @('Sí', 'No', 'No lo sé'); en = @('Yes', 'No', "Don't know") }
  nivelN123 = @{ es = @('N1', 'N2', 'N3'); en = @('N1', 'N2', 'N3') }
  escala1a5 = @{ es = @('1', '2', '3', '4', '5'); en = @('1', '2', '3', '4', '5') }
}

# ---- Motor de generación .xlsx (OOXML mínimo, sin dependencias) ----
function Nueva-HojaXlsx {
  param(
    [string]$destino, [string]$lang, [string]$codigo, [hashtable]$nombrePlantilla, [array]$hojas
  )
  $t = $T[$lang]
  $sstList = [Collections.Generic.List[string]]::new()
  $sstMap = @{}
  function SS([string]$texto) {
    $texto = if ($null -eq $texto) { '' } else { [string]$texto }
    if ($sstMap.ContainsKey($texto)) { return $sstMap[$texto] }
    $idx = $sstList.Count
    $sstList.Add($texto) | Out-Null
    $sstMap[$texto] = $idx
    $idx
  }

  # Estilos: 0 normal · 1 icono (fondo claret) · 2 marca (SEVEN-G, negrita grande, claret) · 3 subtítulo plantilla (negrita)
  # 4 meta (gris, pequeño) · 5 cabecera de tabla (blanco negrita, fondo claret, borde) · 6 celda de dato (borde)
  # 7 celda de dato numérica centrada (borde) · 8 fila de ejemplo (cursiva gris, fondo salmón claro, borde)
  # 9 fila de ejemplo numérica centrada (cursiva, fondo salmón claro, borde)
  $stylesXml = @'
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<styleSheet xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main">
<numFmts count="0"/>
<fonts count="6">
<font><sz val="11"/><name val="Calibri"/></font>
<font><b/><sz val="18"/><color rgb="FF990F3D"/><name val="Calibri"/></font>
<font><b/><sz val="12"/><color rgb="FF1A1817"/><name val="Calibri"/></font>
<font><sz val="9"/><color rgb="FF66605C"/><name val="Calibri"/></font>
<font><b/><sz val="10"/><color rgb="FFFFFFFF"/><name val="Calibri"/></font>
<font><i/><sz val="10"/><color rgb="FF66605C"/><name val="Calibri"/></font>
</fonts>
<fills count="5">
<fill><patternFill patternType="none"/></fill>
<fill><patternFill patternType="gray125"/></fill>
<fill><patternFill patternType="solid"><fgColor rgb="FF990F3D"/><bgColor indexed="64"/></patternFill></fill>
<fill><patternFill patternType="solid"><fgColor rgb="FF990F3D"/><bgColor indexed="64"/></patternFill></fill>
<fill><patternFill patternType="solid"><fgColor rgb="FFF3CFB2"/><bgColor indexed="64"/></patternFill></fill>
</fills>
<borders count="2">
<border><left/><right/><top/><bottom/><diagonal/></border>
<border><left style="thin"><color rgb="FFCCC1B7"/></left><right style="thin"><color rgb="FFCCC1B7"/></right><top style="thin"><color rgb="FFCCC1B7"/></top><bottom style="thin"><color rgb="FFCCC1B7"/></bottom><diagonal/></border>
</borders>
<cellStyleXfs count="1"><xf numFmtId="0" fontId="0" fillId="0" borderId="0"/></cellStyleXfs>
<cellXfs count="10">
<xf numFmtId="0" fontId="0" fillId="0" borderId="0" xfId="0"/>
<xf numFmtId="0" fontId="0" fillId="2" borderId="0" xfId="0" applyFill="1"/>
<xf numFmtId="0" fontId="1" fillId="0" borderId="0" xfId="0" applyFont="1"/>
<xf numFmtId="0" fontId="2" fillId="0" borderId="0" xfId="0" applyFont="1"/>
<xf numFmtId="0" fontId="3" fillId="0" borderId="0" xfId="0" applyFont="1"/>
<xf numFmtId="0" fontId="4" fillId="3" borderId="1" xfId="0" applyFont="1" applyFill="1" applyBorder="1" applyAlignment="1"><alignment wrapText="1" vertical="center"/></xf>
<xf numFmtId="0" fontId="0" fillId="0" borderId="1" xfId="0" applyBorder="1" applyAlignment="1"><alignment vertical="top" wrapText="1"/></xf>
<xf numFmtId="0" fontId="0" fillId="0" borderId="1" xfId="0" applyBorder="1" applyAlignment="1"><alignment horizontal="center" vertical="top"/></xf>
<xf numFmtId="0" fontId="5" fillId="4" borderId="1" xfId="0" applyFont="1" applyFill="1" applyBorder="1" applyAlignment="1"><alignment vertical="top" wrapText="1"/></xf>
<xf numFmtId="0" fontId="5" fillId="4" borderId="1" xfId="0" applyFont="1" applyFill="1" applyBorder="1" applyAlignment="1"><alignment horizontal="center" vertical="top"/></xf>
</cellXfs>
<cellStyles count="1"><cellStyle name="Normal" xfId="0" builtinId="0"/></cellStyles>
</styleSheet>
'@

  $partes = @{}
  $sheetXmls = [Collections.Generic.List[string]]::new()
  $sheetNames = [Collections.Generic.List[string]]::new()

  foreach ($hoja in $hojas) {
    $cols = $hoja.columnas
    $nCols = $cols.Count
    $ultimaCol = ColLetra $nCols
    $filaMarca = 1; $filaTitulo = 2; $filaMeta = 3; $filaInstr = 4
    $filaCab = 6
    $filas = $hoja.filas[$lang]
    # PowerShell "desenvuelve" un array de un solo elemento cuando ese elemento es a su vez un array
    # (una sola fila de ejemplo): se reenvuelve para que $filas siga siendo una lista de filas.
    if ($filas.Count -gt 0 -and $filas[0] -isnot [array] -and $filas[0] -isnot [Collections.IList]) { $filas = , $filas }
    $nFilasEjemplo = $hoja.ejemplos
    $ultimaFila = $filaCab + [Math]::Max($filas.Count, 1)
    $rangoValidacion = $filaCab + $nFilasEjemplo + 1
    $rangoValidacionFin = $filaCab + 400

    $sb = [Text.StringBuilder]::new()
    [void]$sb.Append('<?xml version="1.0" encoding="UTF-8" standalone="yes"?><worksheet xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main">')
    [void]$sb.Append("<dimension ref=""A1:$ultimaCol$([Math]::Max($ultimaFila, $rangoValidacionFin))""/>")
    [void]$sb.Append("<sheetViews><sheetView workbookViewId=""0""><pane ySplit=""$filaCab"" topLeftCell=""A$($filaCab+1)"" activePane=""bottomLeft"" state=""frozen""/></sheetView></sheetViews>")
    [void]$sb.Append('<cols>')
    for ($i = 0; $i -lt $nCols; $i++) {
      $ancho = if ($cols[$i].ancho) { $cols[$i].ancho } else { 16 }
      [void]$sb.Append("<col min=""$($i+1)"" max=""$($i+1)"" width=""$ancho"" customWidth=""1""/>")
    }
    [void]$sb.Append('</cols><sheetData>')

    # Fila marca: A = cuadrado de color, B = SEVEN-G
    [void]$sb.Append("<row r=""$filaMarca""><c r=""A$filaMarca"" s=""1""/><c r=""B$filaMarca"" s=""3"" t=""s""><v>$(SS $t.marca)</v></c></row>")
    # Fila título: código · nombre de la hoja
    $tituloHoja = "$codigo · $($nombrePlantilla[$lang])" + $(if ($hojas.Count -gt 1) { " — $($hoja.nombre[$lang])" } else { '' })
    [void]$sb.Append("<row r=""$filaTitulo""><c r=""A$filaTitulo"" s=""2"" t=""s""><v>$(SS $tituloHoja)</v></c></row>")
    # Fila meta: autoría · licencia · versión · fecha
    $meta = "$($t.autor) · $($t.licencia) · $($t.version) · $($t.generado) $fechaGenerado"
    [void]$sb.Append("<row r=""$filaMeta""><c r=""A$filaMeta"" s=""4"" t=""s""><v>$(SS $meta)</v></c></row>")
    # Fila instrucciones
    [void]$sb.Append("<row r=""$filaInstr""><c r=""A$filaInstr"" s=""4"" t=""s""><v>$(SS $t.instr)</v></c></row>")
    [void]$sb.Append("<row r=""5""/>")

    # Cabecera de tabla
    [void]$sb.Append("<row r=""$filaCab"">")
    for ($i = 0; $i -lt $nCols; $i++) {
      $letra = ColLetra ($i + 1)
      [void]$sb.Append("<c r=""$letra$filaCab"" s=""5"" t=""s""><v>$(SS $cols[$i][$lang])</v></c>")
    }
    [void]$sb.Append('</row>')

    # Filas de datos
    for ($f = 0; $f -lt $filas.Count; $f++) {
      $filaN = $filaCab + 1 + $f
      $esEjemplo = $f -lt $nFilasEjemplo
      [void]$sb.Append("<row r=""$filaN"">")
      for ($i = 0; $i -lt $nCols; $i++) {
        $letra = ColLetra ($i + 1)
        $ref = "$letra$filaN"
        $col = $cols[$i]
        $valor = $filas[$f][$i]
        if ($valor -is [hashtable] -and $valor.ContainsKey('f')) {
          $estilo = if ($esEjemplo) { 8 } else { 6 }
          [void]$sb.Append("<c r=""$ref"" s=""$estilo""><f>$(Xml $valor.f)</f></c>")
        }
        elseif ($col.formula -eq $true) {
          $colP = ColLetra ($i - 1); $colI = ColLetra $i
          $etiquetas = if ($lang -eq 'en') { @('Critical', 'High', 'Medium', 'Low') } else { @('Crítico', 'Alto', 'Medio', 'Bajo') }
          $formula = "$colP$filaN*$colI$filaN&"" · ""&IF($colP$filaN*$colI$filaN>=16,""$($etiquetas[0])"",IF($colP$filaN*$colI$filaN>=10,""$($etiquetas[1])"",IF($colP$filaN*$colI$filaN>=5,""$($etiquetas[2])"",""$($etiquetas[3])"")))"
          $estilo = if ($esEjemplo) { 8 } else { 6 }
          [void]$sb.Append("<c r=""$ref"" s=""$estilo""><f>$(Xml $formula)</f></c>")
        }
        elseif ($valor -is [int] -or $valor -is [double]) {
          $estilo = if ($esEjemplo) { 9 } else { 7 }
          [void]$sb.Append("<c r=""$ref"" s=""$estilo""><v>$valor</v></c>")
        }
        else {
          $estilo = if ($esEjemplo) { 8 } else { 6 }
          if ([string]::IsNullOrEmpty($valor)) { [void]$sb.Append("<c r=""$ref"" s=""$estilo""/>") }
          else { [void]$sb.Append("<c r=""$ref"" s=""$estilo"" t=""s""><v>$(SS $valor)</v></c>") }
        }
      }
      [void]$sb.Append('</row>')
    }
    [void]$sb.Append('</sheetData>')
    [void]$sb.Append("<autoFilter ref=""A$filaCab`:$ultimaCol$rangoValidacionFin""/>")

    # Validación de datos (listas cerradas) sobre un rango amplio, para filas futuras
    $dv = [Collections.Generic.List[string]]::new()
    for ($i = 0; $i -lt $nCols; $i++) {
      if ($cols[$i].lista) {
        $letra = ColLetra ($i + 1)
        $valores = ($cols[$i].lista[$lang] -join ',')
        $dv.Add("<dataValidation type=""list"" allowBlank=""1"" showInputMessage=""1"" showErrorMessage=""1"" sqref=""$letra$rangoValidacion`:$letra$rangoValidacionFin""><formula1>""$(Xml $valores)""</formula1></dataValidation>")
      }
    }
    if ($dv.Count) { [void]$sb.Append("<dataValidations count=""$($dv.Count)"">$($dv -join '')</dataValidations>") }
    [void]$sb.Append('</worksheet>')

    $sheetXmls.Add($sb.ToString())
    $sheetNames.Add($hoja.nombre[$lang])
  }

  # workbook.xml y relaciones
  $sheetsEl = [Collections.Generic.List[string]]::new()
  for ($i = 0; $i -lt $sheetNames.Count; $i++) {
    $sheetsEl.Add("<sheet name=""$(Xml $sheetNames[$i])"" sheetId=""$($i+1)"" r:id=""rId$($i+1)""/>")
  }
  $workbook = "<?xml version=""1.0"" encoding=""UTF-8"" standalone=""yes""?><workbook xmlns=""http://schemas.openxmlformats.org/spreadsheetml/2006/main"" xmlns:r=""http://schemas.openxmlformats.org/officeDocument/2006/relationships""><sheets>$($sheetsEl -join '')</sheets></workbook>"

  $relsWb = [Collections.Generic.List[string]]::new()
  for ($i = 0; $i -lt $sheetNames.Count; $i++) {
    $relsWb.Add("<Relationship Id=""rId$($i+1)"" Type=""http://schemas.openxmlformats.org/officeDocument/2006/relationships/worksheet"" Target=""worksheets/sheet$($i+1).xml""/>")
  }
  $relsWb.Add("<Relationship Id=""rIdStyles"" Type=""http://schemas.openxmlformats.org/officeDocument/2006/relationships/styles"" Target=""styles.xml""/>")
  $relsWb.Add("<Relationship Id=""rIdSS"" Type=""http://schemas.openxmlformats.org/officeDocument/2006/relationships/sharedStrings"" Target=""sharedStrings.xml""/>")
  $relsWorkbookXml = "<?xml version=""1.0"" encoding=""UTF-8"" standalone=""yes""?><Relationships xmlns=""http://schemas.openxmlformats.org/package/2006/relationships"">$($relsWb -join '')</Relationships>"

  # sharedStrings.xml
  $sstSb = [Text.StringBuilder]::new()
  [void]$sstSb.Append("<?xml version=""1.0"" encoding=""UTF-8"" standalone=""yes""?><sst xmlns=""http://schemas.openxmlformats.org/spreadsheetml/2006/main"" count=""$($sstList.Count)"" uniqueCount=""$($sstList.Count)"">")
  foreach ($s in $sstList) { [void]$sstSb.Append("<si><t xml:space=""preserve"">$(Xml $s)</t></si>") }
  [void]$sstSb.Append('</sst>')

  # Content types y relaciones raíz
  $overridesSheets = [Collections.Generic.List[string]]::new()
  for ($i = 0; $i -lt $sheetNames.Count; $i++) {
    $overridesSheets.Add("<Override PartName=""/xl/worksheets/sheet$($i+1).xml"" ContentType=""application/vnd.openxmlformats-officedocument.spreadsheetml.worksheet+xml""/>")
  }
  $tipos = "<?xml version=""1.0"" encoding=""UTF-8"" standalone=""yes""?><Types xmlns=""http://schemas.openxmlformats.org/package/2006/content-types""><Default Extension=""rels"" ContentType=""application/vnd.openxmlformats-package.relationships+xml""/><Default Extension=""xml"" ContentType=""application/xml""/><Override PartName=""/xl/workbook.xml"" ContentType=""application/vnd.openxmlformats-officedocument.spreadsheetml.sheet.main+xml""/><Override PartName=""/xl/styles.xml"" ContentType=""application/vnd.openxmlformats-officedocument.spreadsheetml.styles+xml""/><Override PartName=""/xl/sharedStrings.xml"" ContentType=""application/vnd.openxmlformats-officedocument.spreadsheetml.sharedStrings+xml""/>$($overridesSheets -join '')<Override PartName=""/docProps/core.xml"" ContentType=""application/vnd.openxmlformats-package.core-properties+xml""/><Override PartName=""/docProps/app.xml"" ContentType=""application/vnd.openxmlformats-officedocument.extended-properties+xml""/></Types>"
  $relsRaiz = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?><Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships"><Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument" Target="xl/workbook.xml"/><Relationship Id="rId2" Type="http://schemas.openxmlformats.org/package/2006/relationships/metadata/core-properties" Target="docProps/core.xml"/><Relationship Id="rId3" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/extended-properties" Target="docProps/app.xml"/></Relationships>'
  $app = "<?xml version=""1.0"" encoding=""UTF-8"" standalone=""yes""?><Properties xmlns=""http://schemas.openxmlformats.org/officeDocument/2006/extended-properties""><Application>SEVEN-G xlsx.ps1</Application></Properties>"
  $core = "<?xml version=""1.0"" encoding=""UTF-8"" standalone=""yes""?><cp:coreProperties xmlns:cp=""http://schemas.openxmlformats.org/package/2006/metadata/core-properties"" xmlns:dc=""http://purl.org/dc/elements/1.1/"" xmlns:dcterms=""http://purl.org/dc/terms/"" xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance""><dc:title>$(Xml "$codigo · $($nombrePlantilla[$lang])")</dc:title><dc:creator>$(Xml $t.autor)</dc:creator><dc:language>$lang</dc:language><cp:keywords>SEVEN-G</cp:keywords></cp:coreProperties>"

  $partes['[Content_Types].xml'] = $tipos
  $partes['_rels/.rels'] = $relsRaiz
  $partes['docProps/core.xml'] = $core
  $partes['docProps/app.xml'] = $app
  $partes['xl/workbook.xml'] = $workbook
  $partes['xl/_rels/workbook.xml.rels'] = $relsWorkbookXml
  $partes['xl/styles.xml'] = $stylesXml
  $partes['xl/sharedStrings.xml'] = $sstSb.ToString()
  for ($i = 0; $i -lt $sheetXmls.Count; $i++) { $partes["xl/worksheets/sheet$($i+1).xml"] = $sheetXmls[$i] }

  # orden fijo (una tabla hash normal no garantiza el mismo orden de claves entre ejecuciones, y el zip dejaría
  # de ser determinista: dos generaciones con el mismo contenido darían bytes distintos)
  $ordenPartes = @('[Content_Types].xml', '_rels/.rels', 'docProps/core.xml', 'docProps/app.xml', 'xl/workbook.xml', 'xl/_rels/workbook.xml.rels', 'xl/styles.xml', 'xl/sharedStrings.xml') + (1..$sheetXmls.Count | ForEach-Object { "xl/worksheets/sheet$_.xml" })

  New-Item -ItemType Directory -Force (Split-Path $destino) | Out-Null
  $ms = [IO.MemoryStream]::new()
  $zip = [IO.Compression.ZipArchive]::new($ms, [IO.Compression.ZipArchiveMode]::Create, $true)
  foreach ($nombre in $ordenPartes) {
    $e = $zip.CreateEntry($nombre, [IO.Compression.CompressionLevel]::Optimal); $e.LastWriteTime = $fechaFija
    $w = [IO.StreamWriter]::new($e.Open(), [Text.UTF8Encoding]::new($false)); $w.Write($partes[$nombre]); $w.Dispose()
  }
  $zip.Dispose()
  $nuevo = $ms.ToArray()
  if ((Test-Path $destino) -and [Linq.Enumerable]::SequenceEqual([IO.File]::ReadAllBytes($destino), $nuevo)) { return $false }
  [IO.File]::WriteAllBytes($destino, $nuevo); return $true
}

# ---- Catálogo de plantillas con versión en Excel (D83) ----
$plantillas = [ordered]@{

  'P12' = @{
    archivo = 'P12_SEVEN-G_Matriz_y_registro_de_riesgos'
    nombre = @{ es = 'Matriz y registro de riesgos'; en = 'Risk matrix and register' }
    hojas = @(
      @{
        nombre = @{ es = 'Registro de riesgos'; en = 'Risk register' }
        ejemplos = 1
        columnas = @(
          @{ es = 'Nº'; en = 'No.'; ancho = 7 }
          @{ es = 'Riesgo (causa, evento y consecuencia)'; en = 'Risk (cause, event and consequence)'; ancho = 42 }
          @{ es = 'Categoría'; en = 'Category'; ancho = 12; lista = $L.categoria10 }
          @{ es = 'Riesgo tipo de referencia'; en = 'Reference typical risk'; ancho = 24 }
          @{ es = 'Sistema o fase'; en = 'System or phase'; ancho = 22 }
          @{ es = 'Responsable del riesgo'; en = 'Risk owner'; ancho = 20 }
          @{ es = 'Fecha de alta'; en = 'Date added'; ancho = 13 }
          @{ es = 'P inh. (1–5)'; en = 'Inh. L (1–5)'; ancho = 10; lista = $L.del1a5 }
          @{ es = 'I inh. (1–5)'; en = 'Inh. I (1–5)'; ancho = 10; lista = $L.del1a5 }
          @{ es = 'Eje dominante'; en = 'Dominant axis'; ancho = 18; lista = @{ es = @('Económico', 'Personas y derechos', 'Regulatorio', 'Operativo', 'Reputacional'); en = @('Economic', 'People and rights', 'Regulatory', 'Operational', 'Reputational') } }
          @{ es = 'Nivel inherente'; en = 'Inherent level'; ancho = 16; formula = $true }
          @{ es = 'Controles existentes y eficaces'; en = 'Existing and effective controls'; ancho = 36 }
          @{ es = 'P res. (1–5)'; en = 'Res. L (1–5)'; ancho = 10; lista = $L.del1a5 }
          @{ es = 'I res. (1–5)'; en = 'Res. I (1–5)'; ancho = 10; lista = $L.del1a5 }
          @{ es = 'Nivel residual'; en = 'Residual level'; ancho = 16; formula = $true }
          @{ es = 'Tendencia'; en = 'Trend'; ancho = 12; lista = @{ es = @('Sube', 'Estable', 'Baja'); en = @('Rising', 'Stable', 'Falling') } }
          @{ es = 'Respuesta'; en = 'Response'; ancho = 12; lista = @{ es = @('Evitar', 'Mitigar', 'Transferir', 'Aceptar'); en = @('Avoid', 'Mitigate', 'Transfer', 'Accept') } }
          @{ es = 'Controles previstos (P13)'; en = 'Planned controls (P13)'; ancho = 30 }
          @{ es = 'Aceptado por'; en = 'Accepted by'; ancho = 24 }
          @{ es = 'Fecha de aceptación'; en = 'Acceptance date'; ancho = 15 }
          @{ es = 'Estado'; en = 'Status'; ancho = 15; lista = @{ es = @('Identificado', 'En tratamiento', 'Aceptado', 'Materializado', 'Cerrado'); en = @('Identified', 'Under treatment', 'Accepted', 'Materialised', 'Closed') } }
          @{ es = 'Próxima revisión'; en = 'Next review'; ancho = 26 }
        )
        filas = @{
          es = @(
            @('R01', 'Por una inyección de instrucciones en el mensaje de un cliente, el asistente revela datos del pedido de otro cliente, con perjuicio para el afectado y posible incumplimiento del RGPD.', 'GEN', 'Catálogo GEN del documento 33', 'Asistente de consultas · fases 5–6', 'Responsable técnico', '2026-11-20', 4, 4, 'Personas y derechos', $null, 'Aislamiento de sesión por cliente; filtro de salida de datos personales; pruebas de inyección con 0 fugas', 2, 4, $null, 'Baja', 'Mitigar', 'Monitorización de salidas con alerta (P25)', 'Patrocinador, con conformidad del responsable de riesgos', '2027-01-15', 'Aceptado', 'R6 del segundo trimestre de 2027')
          )
          en = @(
            @('R01', "Through a prompt injection in a customer's message, the assistant reveals order data belonging to another customer, causing harm to the affected person and a possible breach of the GDPR.", 'GEN', 'GEN catalogue of document 33', 'Enquiries assistant · phases 5–6', 'AI Technical Owner', '2026-11-20', 4, 4, 'People and rights', $null, 'Session isolation per customer; output filter for personal data; injection testing with 0 leaks', 2, 4, $null, 'Falling', 'Mitigate', 'Output monitoring with alerting (P25)', 'AI Sponsor, with clearance from the AI Risk Owner', '2027-01-15', 'Accepted', 'R6 in the second quarter of 2027')
          )
        }
      }
    )
  }

  'P27' = @{
    archivo = 'P27_SEVEN-G_Registro_de_incidentes_y_cambios'
    nombre = @{ es = 'Registro de incidentes y cambios'; en = 'Incident and change log' }
    hojas = @(
      @{
        nombre = @{ es = 'Incidentes'; en = 'Incidents' }
        ejemplos = 1
        columnas = @(
          @{ es = 'Código'; en = 'Code'; ancho = 16 }
          @{ es = 'Fecha y hora de detección'; en = 'Date and time of detection'; ancho = 20 }
          @{ es = 'Tipo'; en = 'Type'; ancho = 26; lista = @{ es = @('Degradación del rendimiento', 'Resultado erróneo con impacto', 'Resultado discriminatorio o sesgado', 'Fuga de información', 'Acción no autorizada de un agente', 'Inyección de instrucciones o manipulación', 'Indisponibilidad', 'Incumplimiento regulatorio', 'Uso indebido del sistema', 'Incidente de un proveedor'); en = @('Performance degradation', 'Erroneous output with impact', 'Discriminatory or biased output', 'Information leakage', 'Unauthorised action by an agent', 'Prompt injection or manipulation', 'Unavailability', 'Regulatory breach', 'Misuse of the system', 'Supplier incident') } }
          @{ es = 'Severidad inicial'; en = 'Initial severity'; ancho = 12; lista = @{ es = @('S1', 'S2', 'S3', 'S4'); en = @('S1', 'S2', 'S3', 'S4') } }
          @{ es = 'Severidad final'; en = 'Final severity'; ancho = 12; lista = @{ es = @('S1', 'S2', 'S3', 'S4'); en = @('S1', 'S2', 'S3', 'S4') } }
          @{ es = 'Descripción breve'; en = 'Brief description'; ancho = 40 }
          @{ es = 'Coordinador'; en = 'Coordinator'; ancho = 22 }
          @{ es = 'Estado'; en = 'Status'; ancho = 14; lista = @{ es = @('Abierto', 'Contenido', 'Resuelto', 'Cerrado'); en = @('Open', 'Contained', 'Resolved', 'Closed') } }
          @{ es = 'Fecha de cierre'; en = 'Closure date'; ancho = 14 }
        )
        filas = @{
          es = @(@('INC-2026-007', '2026-07-14 10:42', 'Resultado erróneo con impacto', 'S3', 'S2', 'El asistente informó a clientes de un plazo de devolución derogado', 'Responsable de operación de IA', 'Cerrado', '2026-08-02'))
          en = @(@('INC-2026-007', '2026-07-14 10:42', 'Erroneous output with impact', 'S3', 'S2', 'The assistant informed customers of a repealed return period', 'AI Operations Owner', 'Closed', '2026-08-02'))
        }
      },
      @{
        nombre = @{ es = 'Cambios'; en = 'Changes' }
        ejemplos = 1
        columnas = @(
          @{ es = 'Identificador del cambio'; en = 'Change identifier'; ancho = 18 }
          @{ es = 'Fecha'; en = 'Date'; ancho = 13 }
          @{ es = 'Tipo'; en = 'Type'; ancho = 14; lista = @{ es = @('Menor', 'Relevante', 'Emergencia'); en = @('Minor', 'Relevant', 'Emergency') } }
          @{ es = 'Componente'; en = 'Component'; ancho = 26; lista = @{ es = @('Modelo', 'Instrucciones del sistema', 'Base de conocimiento', 'Datos de entrenamiento', 'Herramientas o permisos del agente', 'Nivel de autonomía', 'Umbrales de monitorización', 'Integración o infraestructura', 'Proveedor', 'Población o finalidad'); en = @('Model', 'System instructions', 'Knowledge base', 'Training data', 'Agent tools or permissions', 'Autonomy level', 'Monitoring thresholds', 'Integration or infrastructure', 'Supplier', 'Population or purpose') } }
          @{ es = 'Descripción'; en = 'Description'; ancho = 42 }
          @{ es = 'Aprobado por'; en = 'Approved by'; ancho = 26 }
          @{ es = 'Estado'; en = 'Status'; ancho = 14; lista = @{ es = @('Solicitado', 'Aprobado', 'Ejecutado', 'Revertido', 'Rechazado'); en = @('Requested', 'Approved', 'Executed', 'Rolled back', 'Rejected') } }
          @{ es = 'Incidente relacionado'; en = 'Related incident'; ancho = 18 }
        )
        filas = @{
          es = @(@('CHG-2026-041', '2026-07-20', 'Relevante', 'Base de conocimiento', 'Sustitución de la política de devoluciones por la versión vigente y retirada de documentos derogados', 'Responsable técnico con conformidad de riesgos', 'Ejecutado', 'INC-2026-007'))
          en = @(@('CHG-2026-041', '2026-07-20', 'Relevant', 'Knowledge base', 'Replacement of the returns policy with the version in force and withdrawal of repealed documents', 'Technical owner with risk clearance', 'Executed', 'INC-2026-007'))
        }
      }
    )
  }

  'P36' = @{
    archivo = 'P36_SEVEN-G_Plan_de_cartera_C3'
    nombre = @{ es = 'Plan de cartera C3'; en = 'C3 portfolio plan' }
    hojas = @(
      @{
        nombre = @{ es = 'Priorización'; en = 'Prioritisation' }
        ejemplos = 1
        columnas = @(
          @{ es = 'Carril'; en = 'Lane'; ancho = 14; lista = @{ es = @('Optimizar', 'Aumentar', 'Transformar'); en = @('Optimise', 'Augment', 'Transform') } }
          @{ es = 'Iniciativa'; en = 'Initiative'; ancho = 36 }
          @{ es = 'Neto adicional por euro'; en = 'Additional net value per euro'; ancho = 16 }
          @{ es = 'Múltiplo'; en = 'Multiple'; ancho = 12 }
          @{ es = 'Neto (1–5)'; en = 'Net (1–5)'; ancho = 10; lista = $L.del1a5 }
          @{ es = 'Tesis (1–5)'; en = 'Thesis (1–5)'; ancho = 10; lista = $L.del1a5 }
          @{ es = 'Ambición (1–5)'; en = 'Ambition (1–5)'; ancho = 12; lista = $L.del1a5 }
          @{ es = 'Riesgo (1–5)'; en = 'Risk (1–5)'; ancho = 10; lista = $L.del1a5 }
          @{ es = 'Datos (1–5)'; en = 'Data (1–5)'; ancho = 10; lista = $L.del1a5 }
          @{ es = 'Capacidad (1–5)'; en = 'Capacity (1–5)'; ancho = 12; lista = $L.del1a5 }
          @{ es = 'Puntuación'; en = 'Score'; ancho = 12 }
          @{ es = 'Orden'; en = 'Rank'; ancho = 8 }
          @{ es = 'Alteración del orden y justificación'; en = 'Change of order and justification'; ancho = 34 }
        )
        filas = @{
          es = @(@('Optimizar', 'IA-2026-014 Clasificación de reclamaciones (ejemplo ilustrativo, horizonte 2 años)', 1.6, 3.2, 5, 4, 3, 5, 4, 4, 90, 1, '—'))
          en = @(@('Optimise', 'IA-2026-014 Complaint classification (illustrative example, 2-year horizon)', 1.6, 3.2, 5, 4, 3, 5, 4, 4, 90, 1, '—'))
        }
      },
      @{
        nombre = @{ es = 'Asignación por tramos'; en = 'Allocation by tranche' }
        ejemplos = 1
        columnas = @(
          @{ es = 'Iniciativa'; en = 'Initiative'; ancho = 30 }
          @{ es = 'Carril'; en = 'Lane'; ancho = 14; lista = @{ es = @('Optimizar', 'Aumentar', 'Transformar'); en = @('Optimise', 'Augment', 'Transform') } }
          @{ es = 'Tramo'; en = 'Tranche'; ancho = 20; lista = @{ es = @('1', '2', '3', 'Escalado', 'Etapa de Transformar'); en = @('1', '2', '3', 'Scaling', 'Transform stage') } }
          @{ es = 'Importe'; en = 'Amount'; ancho = 14 }
          @{ es = 'Se libera tras'; en = 'Released after'; ancho = 26 }
          @{ es = 'Estado'; en = 'Status'; ancho = 14; lista = @{ es = @('Pendiente', 'Liberado', 'Consumido'); en = @('Pending', 'Released', 'Consumed') } }
        )
        filas = @{
          es = @(@('IA-2026-014 (ejemplo ilustrativo)', 'Optimizar', '1', 45000, 'Aprobación de G2', 'Liberado'))
          en = @(@('IA-2026-014 (illustrative example)', 'Optimise', '1', 45000, 'G2 approval', 'Released'))
        }
      }
    )
  }

  'P43' = @{
    archivo = 'P43_SEVEN-G_Catalogo_de_herramientas_autorizadas_y_solicitudes'
    nombre = @{ es = 'Catálogo de herramientas autorizadas y solicitudes'; en = 'Catalogue of authorised tools and requests' }
    hojas = @(
      @{
        nombre = @{ es = 'Catálogo'; en = 'Catalogue' }
        ejemplos = 1
        columnas = @(
          @{ es = 'Código (T02)'; en = 'Code (T02)'; ancho = 16 }
          @{ es = 'Herramienta, edición y proveedor'; en = 'Tool, edition and supplier'; ancho = 40 }
          @{ es = 'Categoría'; en = 'Category'; ancho = 22; lista = @{ es = @('Autorizada', 'Autorizada con restricciones'); en = @('Authorised', 'Authorised with restrictions') } }
          @{ es = 'Finalidades autorizadas'; en = 'Authorised purposes'; ancho = 30 }
          @{ es = 'Colectivos'; en = 'Groups'; ancho = 24 }
          @{ es = 'Autonomía máxima'; en = 'Maximum autonomy'; ancho = 14; lista = @{ es = @('A0', 'A1', 'A2'); en = @('A0', 'A1', 'A2') } }
          @{ es = 'Conexiones permitidas'; en = 'Permitted connections'; ancho = 24 }
          @{ es = 'Condiciones de uso'; en = 'Conditions of use'; ancho = 36 }
          @{ es = 'Formación exigida'; en = 'Required training'; ancho = 16 }
          @{ es = 'Evaluación del proveedor (P14)'; en = 'Supplier assessment (P14)'; ancho = 20 }
          @{ es = 'Responsable del servicio'; en = 'Service owner'; ancho = 22 }
          @{ es = 'Alta · próxima revisión'; en = 'Added · next review'; ancho = 22 }
        )
        filas = @{
          es = @(@('SIA-2026-014', 'Asistente de redacción generativo, edición corporativa, proveedor ficticio', 'Autorizada con restricciones', 'Redacción y resumen de documentos internos', 'Todos los empleados con F1', 'A0', 'Ninguna', 'Cuenta corporativa; el proveedor no usa los datos para entrenar; registros conservados 12 meses', 'F1', 'N1, 2026-09-10', 'Dirección de tecnología', '2026-09-15 · 2027-09-15'))
          en = @(@('SIA-2026-014', 'Generative writing assistant, corporate edition, fictitious supplier', 'Authorised with restrictions', 'Drafting and summarising internal documents', 'All employees with F1', 'A0', 'None', 'Corporate account; the supplier does not use the data for training; logs retained for 12 months', 'F1', 'N1, 2026-09-10', 'Technology department', '2026-09-15 · 2027-09-15'))
        }
      },
      @{
        nombre = @{ es = 'No autorizadas'; en = 'Not authorised' }
        ejemplos = 1
        columnas = @(
          @{ es = 'Herramienta o tipo'; en = 'Tool or type'; ancho = 34 }
          @{ es = 'Motivo'; en = 'Reason'; ancho = 36 }
          @{ es = 'Alternativa del catálogo'; en = 'Catalogue alternative'; ancho = 20 }
          @{ es = 'Bloqueo técnico'; en = 'Technical blocking'; ancho = 14; lista = $L.siNo }
          @{ es = 'Fecha de la decisión'; en = 'Date of decision'; ancho = 16 }
        )
        filas = @{
          es = @(@('Versiones gratuitas o personales de asistentes generativos', 'Uso de los datos por el proveedor; sin registros corporativos', 'SIA-2026-014', 'Sí', '2026-09-15'))
          en = @(@('Free or personal versions of generative assistants', 'Use of the data by the supplier; no corporate logs', 'SIA-2026-014', 'Yes', '2026-09-15'))
        }
      }
    )
  }

  'P44' = @{
    archivo = 'P44_SEVEN-G_Encuesta_de_uso_y_percepcion_de_la_IA'
    nombre = @{ es = 'Encuesta de uso y percepción de la IA'; en = 'AI use and perception survey' }
    hojas = @(
      @{
        nombre = @{ es = 'Encuesta anual'; en = 'Annual survey' }
        ejemplos = 1
        columnas = @(
          @{ es = 'ID de respuesta'; en = 'Response ID'; ancho = 12 }
          @{ es = 'Área y colectivo (U13)'; en = 'Area and group (U13)'; ancho = 22 }
          @{ es = 'U1 · ¿Ha usado IA?'; en = 'U1 · Used AI?'; ancho = 10; lista = $L.siNo }
          @{ es = 'U2 · Herramientas usadas'; en = 'U2 · Tools used'; ancho = 26 }
          @{ es = 'U3 · Cuenta'; en = 'U3 · Account'; ancho = 14; lista = @{ es = @('Corporativa', 'Personal', 'Ambas', 'No lo sé'); en = @('Corporate', 'Personal', 'Both', "Don't know") } }
          @{ es = 'U4 · Frecuencia'; en = 'U4 · Frequency'; ancho = 12; lista = @{ es = @('Diaria', 'Semanal', 'Mensual', 'Ocasional'); en = @('Daily', 'Weekly', 'Monthly', 'Occasionally') } }
          @{ es = 'U5 · Tareas'; en = 'U5 · Tasks'; ancho = 22 }
          @{ es = 'U6 · Información introducida'; en = 'U6 · Information entered'; ancho = 20; lista = @{ es = @('[Pública]', '[Interna]', '[Confidencial]', '[Restringida]', 'Datos personales', 'Ninguna de estas', 'Prefiero no responder'); en = @('[Public]', '[Internal]', '[Confidential]', '[Restricted]', 'Personal data', 'None of these', 'Prefer not to answer') } }
          @{ es = 'U7 · Extensiones instaladas'; en = 'U7 · Extensions installed'; ancho = 12; lista = $L.siNoNs }
          @{ es = 'U8 · Agente personal'; en = 'U8 · Personal agent'; ancho = 12; lista = $L.siNo }
          @{ es = 'U9 · Necesidad no cubierta'; en = 'U9 · Unmet need'; ancho = 30 }
          @{ es = 'U10 · Conoce qué puede usar (1–5)'; en = 'U10 · Knows what may be used (1–5)'; ancho = 16; lista = $L.escala1a5 }
          @{ es = 'U11 · Sabe comunicar un incidente (1–5)'; en = 'U11 · Knows how to report (1–5)'; ancho = 16; lista = $L.escala1a5 }
          @{ es = 'U12 · Formación suficiente (1–5)'; en = 'U12 · Sufficient training (1–5)'; ancho = 16; lista = $L.escala1a5 }
        )
        filas = @{
          es = @(@('R-0001 (ejemplo ilustrativo)', 'Reclamaciones · Empleado', 'Sí', 'SIA-2026-014', 'Corporativa', 'Semanal', 'Redacción, Resumen', '[Interna]', 'No', 'No', 'Ninguna', 4, 3, 4))
          en = @(@('R-0001 (illustrative example)', 'Complaints · Employee', 'Yes', 'SIA-2026-014', 'Corporate', 'Weekly', 'Drafting, Summarising', '[Internal]', 'No', 'No', 'None', 4, 3, 4))
        }
      },
      @{
        nombre = @{ es = 'Resultados encuesta anual'; en = 'Annual survey results' }
        ejemplos = 0
        columnas = @(
          @{ es = 'Resultado'; en = 'Result'; ancho = 34 }
          @{ es = 'Valor'; en = 'Value'; ancho = 14 }
          @{ es = 'Fórmula'; en = 'Formula'; ancho = 50 }
        )
        filas = @{
          es = @(
            @('Uso declarado de IA', @{ f = "COUNTIF('Encuesta anual'!C8:C500,""Sí"")/COUNTA('Encuesta anual'!C8:C500)" }, 'Respuestas Sí en U1 ÷ respuestas válidas'),
            @('Conocimiento de la política (U10)', @{ f = "COUNTIF('Encuesta anual'!L8:L500,"">=4"")/COUNTA('Encuesta anual'!L8:L500)" }, '% favorable en U10'),
            @('Conocimiento de la política (U11)', @{ f = "COUNTIF('Encuesta anual'!M8:M500,"">=4"")/COUNTA('Encuesta anual'!M8:M500)" }, '% favorable en U11'),
            @('Conocimiento de la política (U12)', @{ f = "COUNTIF('Encuesta anual'!N8:N500,"">=4"")/COUNTA('Encuesta anual'!N8:N500)" }, '% favorable en U12')
          )
          en = @(
            @('Declared use of AI', @{ f = "COUNTIF('Annual survey'!C8:C500,""Yes"")/COUNTA('Annual survey'!C8:C500)" }, 'Yes responses to U1 ÷ valid responses'),
            @('Knowledge of the policy (U10)', @{ f = "COUNTIF('Annual survey'!L8:L500,"">=4"")/COUNTA('Annual survey'!L8:L500)" }, '% favourable in U10'),
            @('Knowledge of the policy (U11)', @{ f = "COUNTIF('Annual survey'!M8:M500,"">=4"")/COUNTA('Annual survey'!M8:M500)" }, '% favourable in U11'),
            @('Knowledge of the policy (U12)', @{ f = "COUNTIF('Annual survey'!N8:N500,"">=4"")/COUNTA('Annual survey'!N8:N500)" }, '% favourable in U12')
          )
        }
      },
      @{
        nombre = @{ es = 'Encuesta de pulso'; en = 'Pulse survey' }
        ejemplos = 1
        columnas = @(
          @{ es = 'ID de respuesta'; en = 'Response ID'; ancho = 12 }
          @{ es = 'Colectivo y función (P13)'; en = 'Group and function (P13)'; ancho = 22; lista = @{ es = @('Usuario', 'Supervisor', 'Mando'); en = @('User', 'Overseer', 'Manager') } }
          @{ es = 'P1 · Utilidad (1–5)'; en = 'P1 · Usefulness (1–5)'; ancho = 12; lista = $L.escala1a5 }
          @{ es = 'P2 · Utilidad (1–5)'; en = 'P2 · Usefulness (1–5)'; ancho = 12; lista = $L.escala1a5 }
          @{ es = 'P3 · Confianza (1–5)'; en = 'P3 · Trust (1–5)'; ancho = 12; lista = $L.escala1a5 }
          @{ es = 'P4 · Confianza (1–5)'; en = 'P4 · Trust (1–5)'; ancho = 12; lista = $L.escala1a5 }
          @{ es = 'P5 · Apoyo (1–5)'; en = 'P5 · Support (1–5)'; ancho = 12; lista = $L.escala1a5 }
          @{ es = 'P6 · Apoyo (1–5)'; en = 'P6 · Support (1–5)'; ancho = 12; lista = $L.escala1a5 }
          @{ es = 'P7 · Carga (1–5)'; en = 'P7 · Workload (1–5)'; ancho = 12; lista = $L.escala1a5 }
          @{ es = 'P8 · Carga (1–5)'; en = 'P8 · Workload (1–5)'; ancho = 12; lista = $L.escala1a5 }
          @{ es = 'P9 · Autonomía (1–5)'; en = 'P9 · Autonomy (1–5)'; ancho = 14; lista = $L.escala1a5 }
          @{ es = 'P10 · Autonomía (1–5)'; en = 'P10 · Autonomy (1–5)'; ancho = 14; lista = $L.escala1a5 }
          @{ es = 'P11 · Qué cambiaría'; en = 'P11 · What would you change'; ancho = 30 }
          @{ es = 'P12 · Preocupaciones'; en = 'P12 · Concerns'; ancho = 30 }
        )
        filas = @{
          es = @(@('R-0001 (ejemplo ilustrativo)', 'Usuario', 4, 5, 4, 4, 3, 4, 4, 3, 5, 4, 'Respuestas más rápidas fuera de horario', 'Ninguna'))
          en = @(@('R-0001 (illustrative example)', 'User', 4, 5, 4, 4, 3, 4, 4, 3, 5, 4, 'Faster responses outside office hours', 'None'))
        }
      },
      @{
        nombre = @{ es = 'Resultados del pulso'; en = 'Pulse results' }
        ejemplos = 0
        columnas = @(
          @{ es = 'Dimensión'; en = 'Dimension'; ancho = 20 }
          @{ es = '% favorable'; en = '% favourable'; ancho = 14 }
          @{ es = 'Preguntas'; en = 'Questions'; ancho = 14 }
        )
        filas = @{
          es = @(
            @('Utilidad', @{ f = "(COUNTIF('Encuesta de pulso'!C8:C500,"">=4"")+COUNTIF('Encuesta de pulso'!D8:D500,"">=4""))/(COUNTA('Encuesta de pulso'!C8:C500)+COUNTA('Encuesta de pulso'!D8:D500))" }, 'P1, P2'),
            @('Confianza', @{ f = "(COUNTIF('Encuesta de pulso'!E8:E500,"">=4"")+COUNTIF('Encuesta de pulso'!F8:F500,"">=4""))/(COUNTA('Encuesta de pulso'!E8:E500)+COUNTA('Encuesta de pulso'!F8:F500))" }, 'P3, P4'),
            @('Apoyo', @{ f = "(COUNTIF('Encuesta de pulso'!G8:G500,"">=4"")+COUNTIF('Encuesta de pulso'!H8:H500,"">=4""))/(COUNTA('Encuesta de pulso'!G8:G500)+COUNTA('Encuesta de pulso'!H8:H500))" }, 'P5, P6'),
            @('Carga', @{ f = "(COUNTIF('Encuesta de pulso'!I8:I500,"">=4"")+COUNTIF('Encuesta de pulso'!J8:J500,"">=4""))/(COUNTA('Encuesta de pulso'!I8:I500)+COUNTA('Encuesta de pulso'!J8:J500))" }, 'P7, P8'),
            @('Autonomía', @{ f = "(COUNTIF('Encuesta de pulso'!K8:K500,"">=4"")+COUNTIF('Encuesta de pulso'!L8:L500,"">=4""))/(COUNTA('Encuesta de pulso'!K8:K500)+COUNTA('Encuesta de pulso'!L8:L500))" }, 'P9, P10')
          )
          en = @(
            @('Usefulness', @{ f = "(COUNTIF('Pulse survey'!C8:C500,"">=4"")+COUNTIF('Pulse survey'!D8:D500,"">=4""))/(COUNTA('Pulse survey'!C8:C500)+COUNTA('Pulse survey'!D8:D500))" }, 'P1, P2'),
            @('Trust', @{ f = "(COUNTIF('Pulse survey'!E8:E500,"">=4"")+COUNTIF('Pulse survey'!F8:F500,"">=4""))/(COUNTA('Pulse survey'!E8:E500)+COUNTA('Pulse survey'!F8:F500))" }, 'P3, P4'),
            @('Support', @{ f = "(COUNTIF('Pulse survey'!G8:G500,"">=4"")+COUNTIF('Pulse survey'!H8:H500,"">=4""))/(COUNTA('Pulse survey'!G8:G500)+COUNTA('Pulse survey'!H8:H500))" }, 'P5, P6'),
            @('Workload', @{ f = "(COUNTIF('Pulse survey'!I8:I500,"">=4"")+COUNTIF('Pulse survey'!J8:J500,"">=4""))/(COUNTA('Pulse survey'!I8:I500)+COUNTA('Pulse survey'!J8:J500))" }, 'P7, P8'),
            @('Autonomy', @{ f = "(COUNTIF('Pulse survey'!K8:K500,"">=4"")+COUNTIF('Pulse survey'!L8:L500,"">=4""))/(COUNTA('Pulse survey'!K8:K500)+COUNTA('Pulse survey'!L8:L500))" }, 'P9, P10')
          )
        }
      }
    )
  }

  'P45' = @{
    archivo = 'P45_SEVEN-G_Plan_y_registro_de_alfabetizacion_y_formacion'
    nombre = @{ es = 'Plan y registro de alfabetización y formación'; en = 'AI literacy and training plan and record' }
    hojas = @(
      @{
        nombre = @{ es = 'Registro por persona'; en = 'Record per person' }
        ejemplos = 1
        columnas = @(
          @{ es = 'Persona'; en = 'Person'; ancho = 14 }
          @{ es = 'Área'; en = 'Area'; ancho = 18 }
          @{ es = 'Perfiles (F1–F9)'; en = 'Profiles (F1–F9)'; ancho = 16 }
          @{ es = 'Acción y versión'; en = 'Action and version'; ancho = 32 }
          @{ es = 'Fecha'; en = 'Date'; ancho = 13 }
          @{ es = 'Formato'; en = 'Format'; ancho = 20 }
          @{ es = 'Evaluación'; en = 'Assessment'; ancho = 18; lista = @{ es = @('Superada', 'No superada', 'Práctica validada'); en = @('Passed', 'Not passed', 'Practical validated') } }
          @{ es = 'Aceptación de la política'; en = 'Acceptance of the policy'; ancho = 16 }
          @{ es = 'Vigente hasta'; en = 'Valid until'; ancho = 13 }
          @{ es = 'Sistemas supervisados o rol'; en = 'Systems overseen or role'; ancho = 22 }
          @{ es = 'Estado'; en = 'Status'; ancho = 12; lista = @{ es = @('Vigente', 'Vencida', 'Pendiente'); en = @('Current', 'Expired', 'Pending') } }
        )
        filas = @{
          es = @(@('E-00417 (ejemplo ilustrativo)', 'Reclamaciones', 'F1, F3', 'Supervisión del clasificador de reclamaciones v1.1', '2027-01-12', 'Presencial con casos', 'Práctica validada', '2026-11-03', '2028-01-12', 'SIA-2026-021', 'Vigente'))
          en = @(@('E-00417 (illustrative example)', 'Complaints', 'F1, F3', 'Oversight of the complaints classifier v1.1', '2027-01-12', 'Classroom with cases', 'Practical validated', '2026-11-03', '2028-01-12', 'SIA-2026-021', 'Current'))
        }
      }
    )
  }

  'P50' = @{
    archivo = 'P50_SEVEN-G_Registro_de_no_conformidades'
    nombre = @{ es = 'Registro de no conformidades'; en = 'Nonconformity register' }
    hojas = @(
      @{
        nombre = @{ es = 'Registro de compañía'; en = 'Company register' }
        ejemplos = 1
        columnas = @(
          @{ es = 'Código'; en = 'Code'; ancho = 16 }
          @{ es = 'Título'; en = 'Title'; ancho = 34 }
          @{ es = 'Alcance'; en = 'Scope'; ancho = 16 }
          @{ es = 'Tipo'; en = 'Type'; ancho = 14; lista = @{ es = @('Crítica', 'Mayor', 'Menor'); en = @('Critical', 'Major', 'Minor') } }
          @{ es = 'Fuente'; en = 'Source'; ancho = 20 }
          @{ es = 'Detección'; en = 'Detection'; ancho = 13 }
          @{ es = 'Responsable de la acción'; en = 'Action owner'; ancho = 24 }
          @{ es = 'Estado'; en = 'Status'; ancho = 16; lista = @{ es = @('Abierta', 'En ejecución', 'Verificación', 'Cerrada'); en = @('Open', 'In progress', 'Verification', 'Closed') } }
          @{ es = 'Próximo plazo'; en = 'Next deadline'; ancho = 14 }
          @{ es = 'Vencida'; en = 'Overdue'; ancho = 10; lista = $L.siNo }
          @{ es = 'Incidente vinculado'; en = 'Linked incident'; ancho = 18 }
          @{ es = 'Cierre'; en = 'Closure'; ancho = 13 }
        )
        filas = @{
          es = @(@('NC-2026-014', 'Cambio relevante en producción sin gate', 'IA-2026-003', 'Mayor', 'Alerta del registro', '2026-11-03', 'Responsable de operación de IA', 'En ejecución', '2026-12-15', 'No', '—', ''))
          en = @(@('NC-2026-014', 'Relevant change in production without a gate', 'IA-2026-003', 'Major', 'Register alert', '2026-11-03', 'AI Operations Owner', 'In progress', '2026-12-15', 'No', '—', ''))
        }
      }
    )
  }

  'P54' = @{
    archivo = 'P54_SEVEN-G_Inventario_de_identidades_no_humanas_y_componentes'
    nombre = @{ es = 'Inventario de identidades no humanas y componentes'; en = 'Non-human identity and component inventory' }
    hojas = @(
      @{
        nombre = @{ es = 'Identidades no humanas'; en = 'Non-human identities' }
        ejemplos = 1
        columnas = @(
          @{ es = 'Código'; en = 'Code'; ancho = 16 }
          @{ es = 'Nombre técnico'; en = 'Technical name'; ancho = 26 }
          @{ es = 'Tipo'; en = 'Type'; ancho = 22; lista = @{ es = @('Agente', 'Cuenta de servicio', 'Clave de API', 'Certificado', 'Identidad de conector o servidor de herramientas', 'Agente de construcción'); en = @('Agent', 'Service account', 'API key', 'Certificate', 'Connector or tool server identity', 'Build agent') } }
          @{ es = 'Sistema'; en = 'System'; ancho = 16 }
          @{ es = 'Finalidad'; en = 'Purpose'; ancho = 30 }
          @{ es = 'Actúa por cuenta de'; en = 'Acts on behalf of'; ancho = 20; lista = @{ es = @('Un usuario (delegación)', 'La compañía (proceso)'); en = @('A user (delegation)', 'The company (process)') } }
          @{ es = 'Responsable humano'; en = 'Human owner'; ancho = 22 }
          @{ es = 'Sustituto'; en = 'Deputy'; ancho = 22 }
          @{ es = 'Estado'; en = 'Status'; ancho = 12; lista = @{ es = @('Activa', 'Suspendida', 'Revocada'); en = @('Active', 'Suspended', 'Revoked') } }
          @{ es = 'Fecha de alta'; en = 'Date registered'; ancho = 13 }
        )
        filas = @{
          es = @(@('IDN-2026-012', 'agente-devoluciones-prod', 'Agente', 'SIA-2026-004', 'Tramitar devoluciones de pedidos propios', 'La compañía (proceso)', 'Responsable de operación de IA', 'Responsable técnico de IA', 'Activa', '2026-10-02'))
          en = @(@('IDN-2026-012', 'refunds-agent-prod', 'Agent', 'SIA-2026-004', "Process refunds for the company's own orders", 'The company (process)', 'AI Operations Owner', 'AI Technical Owner', 'Active', '2026-10-02'))
        }
      },
      @{
        nombre = @{ es = 'Modelos y componentes'; en = 'Models and components' }
        ejemplos = 1
        columnas = @(
          @{ es = 'Código'; en = 'Code'; ancho = 16 }
          @{ es = 'Componente'; en = 'Component'; ancho = 26 }
          @{ es = 'Tipo'; en = 'Type'; ancho = 20; lista = @{ es = @('Modelo (propio)', 'Modelo (de proveedor)', 'Modelo (abierto)', 'Pesos', 'Biblioteca o dependencia', 'Conector', 'Servidor de herramientas', 'Imagen o contenedor', 'Servicio de proveedor', 'Conjunto de datos de evaluación'); en = @('Model (own)', 'Model (supplier)', 'Model (open)', 'Weights', 'Library or dependency', 'Connector', 'Tool server', 'Image or container', 'Supplier service', 'Evaluation dataset') } }
          @{ es = 'Versión fijada'; en = 'Pinned version'; ancho = 14 }
          @{ es = 'Origen o proveedor'; en = 'Origin or supplier'; ancho = 22 }
          @{ es = 'Fuente aprobada'; en = 'Approved source'; ancho = 14; lista = $L.siNo }
          @{ es = 'Verificación de integridad'; en = 'Integrity verification'; ancho = 26 }
          @{ es = 'Licencia'; en = 'Licence'; ancho = 14 }
          @{ es = 'Vulnerabilidades conocidas'; en = 'Known vulnerabilities'; ancho = 26 }
          @{ es = 'Responsable'; en = 'Owner'; ancho = 22 }
          @{ es = 'Estado'; en = 'Status'; ancho = 16; lista = @{ es = @('Aprobado', 'En evaluación', 'Obsoleto', 'Retirado'); en = @('Approved', 'Under evaluation', 'Obsolete', 'Retired') } }
        )
        filas = @{
          es = @(@('SIA-2026-004 · C03', 'Conector con el sistema de pedidos', 'Conector', '2.4.1', 'Desarrollo propio', 'Sí', 'Firma verificada en el despliegue', 'Interna', 'Ninguna en el último análisis', 'Responsable técnico de IA', 'Aprobado'))
          en = @(@('SIA-2026-004 · C03', 'Connector to the order system', 'Connector', '2.4.1', 'In-house development', 'Yes', 'Signature verified at deployment', 'Internal', 'None in the last scan', 'AI Technical Owner', 'Approved'))
        }
      }
    )
  }

  'P57' = @{
    archivo = 'P57_SEVEN-G_Registro_de_proveedores_y_plan_de_salida'
    nombre = @{ es = 'Registro de proveedores y plan de salida'; en = 'Supplier register and exit plan' }
    hojas = @(
      @{
        nombre = @{ es = 'Identificación y servicio'; en = 'Identification and service' }
        ejemplos = 1
        columnas = @(
          @{ es = 'Código'; en = 'Code'; ancho = 16 }
          @{ es = 'Razón social · grupo · país'; en = 'Legal name · group · country'; ancho = 34 }
          @{ es = 'Tipo de tercero'; en = 'Type of third party'; ancho = 20 }
          @{ es = 'Servicio'; en = 'Service'; ancho = 36 }
          @{ es = 'Modelos y versiones'; en = 'Models and versions'; ancho = 24 }
          @{ es = 'Tipo de contratación'; en = 'Type of sourcing'; ancho = 16; lista = @{ es = @('Construir sobre', 'Comprar', 'Adaptar', 'Aliarse'); en = @('Build on', 'Buy', 'Adapt', 'Partner') } }
          @{ es = 'Sistemas e iniciativas'; en = 'Systems and initiatives'; ancho = 24 }
          @{ es = 'Gestor de la relación'; en = 'Relationship manager'; ancho = 24 }
        )
        filas = @{
          es = @(@('PRV-2026-003', 'Proveedor Alfa, S.A. (ficticio) · Grupo Alfa · Irlanda', 'Proveedor de modelos', 'Modelo de lenguaje por interfaz de programación para el asistente de consultas', 'Modelo general, versión fijada 2026-06', 'Construir sobre', 'SIA-2026-007 · IA-2026-012', 'Responsable técnico del área de clientes'))
          en = @(@('PRV-2026-003', 'Supplier Alfa, S.A. (fictitious) · Alfa Group · Ireland', 'Model provider', 'Language model via programming interface for the enquiries assistant', 'General model, version pinned 2026-06', 'Build on', 'SIA-2026-007 · IA-2026-012', 'Technical owner in the customer area'))
        }
      },
      @{
        nombre = @{ es = 'Clasificación y datos'; en = 'Classification and data' }
        ejemplos = 1
        columnas = @(
          @{ es = 'Código'; en = 'Code'; ancho = 16 }
          @{ es = 'Criticidad'; en = 'Criticality'; ancho = 12; lista = $L.nivelN123 }
          @{ es = 'Datos'; en = 'Data'; ancho = 10; lista = $L.nivelN123 }
          @{ es = 'Autonomía'; en = 'Autonomy'; ancho = 12; lista = $L.nivelN123 }
          @{ es = 'Sustituibilidad'; en = 'Substitutability'; ancho = 16; lista = $L.nivelN123 }
          @{ es = 'Nivel'; en = 'Level'; ancho = 10; lista = $L.nivelN123 }
          @{ es = 'Función crítica o importante'; en = 'Critical or important function'; ancho = 20; lista = $L.siNo }
          @{ es = 'Rol regulatorio'; en = 'Regulatory role'; ancho = 34 }
          @{ es = 'Datos personales'; en = 'Personal data'; ancho = 14; lista = $L.siNo }
          @{ es = 'Ubicación y garantía de transferencias'; en = 'Location and transfer safeguard'; ancho = 26 }
          @{ es = 'Retención'; en = 'Retention'; ancho = 14 }
          @{ es = 'Uso para entrenamiento'; en = 'Use for training'; ancho = 18; lista = @{ es = @('Excluido', 'Autorizado', 'Sin verificar'); en = @('Excluded', 'Authorised', 'Unverified') } }
        )
        filas = @{
          es = @(@('PRV-2026-003', 'N2', 'N2', 'N1', 'N2', 'N2', 'No', 'Proveedor de modelo de propósito general · responsable del despliegue', 'Sí', 'UE; sin transferencias', '30 días', 'Excluido'))
          en = @(@('PRV-2026-003', 'N2', 'N2', 'N1', 'N2', 'N2', 'No', 'Provider of a general-purpose AI model · deployer', 'Yes', 'EU; no transfers', '30 days', 'Excluded'))
        }
      },
      @{
        nombre = @{ es = 'Riesgo y seguimiento'; en = 'Risk and monitoring' }
        ejemplos = 1
        columnas = @(
          @{ es = 'Código'; en = 'Code'; ancho = 16 }
          @{ es = 'Riesgos vinculados (T06)'; en = 'Linked risks (T06)'; ancho = 20 }
          @{ es = 'Nivel residual principal'; en = 'Main residual level'; ancho = 16; lista = @{ es = @('Bajo', 'Medio', 'Alto', 'Crítico'); en = @('Low', 'Medium', 'High', 'Critical') } }
          @{ es = 'Indicadores de servicio'; en = 'Service indicators'; ancho = 20 }
          @{ es = 'Incidentes imputables'; en = 'Attributable incidents'; ancho = 18 }
          @{ es = 'Última · próxima revisión'; en = 'Last · next review'; ancho = 22 }
          @{ es = 'Sustituibilidad estimada'; en = 'Estimated substitutability'; ancho = 20 }
          @{ es = 'Alternativa identificada'; en = 'Identified alternative'; ancho = 22 }
          @{ es = 'Plan de salida probado'; en = 'Exit plan tested'; ancho = 16; lista = $L.siNo }
          @{ es = 'Valor de cartera dependiente'; en = 'Dependent portfolio value'; ancho = 22 }
          @{ es = 'Estado'; en = 'Status'; ancho = 22; lista = @{ es = @('En evaluación', 'Aprobado', 'Aprobado con condiciones', 'Rechazado', 'En salida', 'Finalizado'); en = @('Under assessment', 'Approved', 'Approved with conditions', 'Rejected', 'Exiting', 'Terminated') } }
        )
        filas = @{
          es = @(@('PRV-2026-003', 'RT-TER-01, RT-TER-03', 'Medio', 'Disponibilidad 99,8 %', 'Ninguno', '2027-01-15 · 2027-07-15', '6 meses', 'Proveedor Beta (ficticio)', 'Sí', '8 % del valor validado', 'Aprobado con condiciones'))
          en = @(@('PRV-2026-003', 'RT-TER-01, RT-TER-03', 'Medium', 'Availability 99.8 %', 'None', '2027-01-15 · 2027-07-15', '6 months', 'Supplier Beta (fictitious)', 'Yes', '8 % of validated value', 'Approved with conditions'))
        }
      }
    )
  }

  'P55' = @{
    archivo = 'P55_SEVEN-G_Cuestionario_de_diligencia_debida_a_proveedores_de_IA'
    nombre = @{ es = 'Cuestionario de diligencia debida a proveedores de IA'; en = 'AI supplier due diligence questionnaire' }
    hojas = @(
      @{
        nombre = @{ es = 'Cuestionario'; en = 'Questionnaire' }
        ejemplos = 1
        columnas = @(
          @{ es = 'Bloque'; en = 'Block'; ancho = 30; lista = @{
              es = @('1 · Identidad y solvencia', '2 · Servicio y modelo', '3 · Datos', '4 · Subencargados y cadena de suministro', '5 · Seguridad', '6 · Cumplimiento del Reglamento de IA', '7 · Protección de datos', '8 · Propiedad intelectual', '9 · Continuidad', '10 · Incidentes', '11 · Salida', '12 · Ética y uso responsable')
              en = @('1 · Identity and soundness', '2 · Service and model', '3 · Data', '4 · Sub-processors and supply chain', '5 · Security', '6 · AI Act compliance', '7 · Data protection', '8 · Intellectual property', '9 · Continuity', '10 · Incidents', '11 · Exit', '12 · Ethics and responsible use')
            }
          }
          @{ es = '#'; en = '#'; ancho = 8 }
          @{ es = 'Pregunta'; en = 'Question'; ancho = 46 }
          @{ es = 'Evidencia solicitada'; en = 'Evidence requested'; ancho = 30 }
          @{ es = 'Nivel'; en = 'Level'; ancho = 8; lista = $L.nivelN123 }
          @{ es = 'Respuesta'; en = 'Answer'; ancho = 40 }
          @{ es = 'Valoración'; en = 'Assessment'; ancho = 34; lista = @{ es = @('Conforme', 'Conforme con observaciones', 'No conforme'); en = @('Conformant', 'Conformant with observations', 'Non-conformant') } }
        )
        filas = @{
          es = @(
            @('3 · Datos', '3.1 (ejemplo ilustrativo)', '¿Usa las entradas, contextos, resultados o datos de la compañía para entrenar o mejorar modelos o para otros fines? ¿Cómo se excluye?', 'Condiciones de servicio; captura de la configuración.', 'N1', 'No se usan para entrenamiento en el plan empresarial; configuración desactivada por defecto.', 'Conforme con observaciones: falta la captura de la configuración del entorno de la compañía.'),
            @('1 · Identidad y solvencia', '1.1', 'Indique razón social, grupo al que pertenece, país de establecimiento y años de actividad.', 'Extracto del registro mercantil o equivalente.', 'N1', '', ''),
            @('1 · Identidad y solvencia', '1.2', 'Describa la estructura de propiedad y cualquier cambio de control reciente o conocido.', 'Organigrama societario.', 'N2', '', ''),
            @('1 · Identidad y solvencia', '1.3', '¿Qué seguros de responsabilidad civil profesional y de ciberriesgos mantiene, con qué coberturas y límites?', 'Certificados de seguro vigentes.', 'N2', '', ''),
            @('1 · Identidad y solvencia', '1.4', '¿Existe algún conflicto de interés con la compañía o sus competidores relevante para el servicio?', 'Declaración firmada.', 'N2', '', ''),
            @('1 · Identidad y solvencia', '1.5', 'Aporte su situación financiera de los tres últimos ejercicios.', 'Cuentas anuales e informe de auditoría.', 'N3', '', ''),
            @('1 · Identidad y solvencia', '1.6', 'Facilite referencias de clientes con servicios comparables.', 'Contactos autorizados.', 'N3', '', ''),
            @('2 · Servicio y modelo', '2.1', 'Describa el servicio y las funciones de IA que incluye, en lenguaje comprensible.', 'Ficha del servicio.', 'N1', '', ''),
            @('2 · Servicio y modelo', '2.2', '¿Qué modelos usa el servicio? ¿Son propios o de terceros? Identifique al proveedor de cada modelo.', 'Lista de modelos y proveedores.', 'N2', '', ''),
            @('2 · Servicio y modelo', '2.3', '¿Qué versiones están en uso y cuál es su política de cambios y de retirada de versiones (preaviso, fijación de versión)?', 'Política de versiones; calendario de retiradas.', 'N2', '', ''),
            @('2 · Servicio y modelo', '2.4', '¿Qué documentación del modelo facilita: finalidad prevista, limitaciones conocidas, resultados de evaluación, instrucciones de uso?', 'Documentación del modelo.', 'N2', '', ''),
            @('2 · Servicio y modelo', '2.5', '¿Permite a la compañía hacer pruebas propias con datos representativos antes de contratar?', 'Condiciones del entorno de pruebas.', 'N2', '', ''),
            @('3 · Datos', '3.1', '¿Usa las entradas, contextos, resultados o datos de la compañía para entrenar o mejorar modelos o para otros fines? ¿Cómo se excluye?', 'Condiciones de servicio; captura de la configuración.', 'N1', '', ''),
            @('3 · Datos', '3.2', '¿Qué plazo de retención aplica a entradas, resultados y registros?', 'Condiciones; configuración.', 'N1', '', ''),
            @('3 · Datos', '3.3', '¿En qué regiones se tratan y almacenan los datos?', 'Condiciones; configuración de región.', 'N1', '', ''),
            @('3 · Datos', '3.4', '¿Hay transferencias internacionales? ¿Con qué garantías del capítulo V del RGPD?', 'Mecanismo de transferencia.', 'N2', '', ''),
            @('3 · Datos', '3.5', '¿Cómo se cifran los datos en tránsito y en reposo y quién gestiona las claves?', 'Descripción técnica o informe independiente.', 'N2', '', ''),
            @('3 · Datos', '3.6', '¿Cómo se separan los datos de distintos clientes?', 'Descripción de la arquitectura.', 'N2', '', ''),
            @('3 · Datos', '3.7', '¿Cómo se borran los datos a petición y al terminar el contrato? ¿Emite certificado?', 'Procedimiento de borrado; modelo de certificado.', 'N2', '', ''),
            @('4 · Subencargados y cadena de suministro', '4.1', 'Facilite la lista de subencargados con su ubicación y función.', 'Lista actualizada.', 'N2', '', ''),
            @('4 · Subencargados y cadena de suministro', '4.2', '¿Cómo notifica los cambios de subencargados? ¿Hay preaviso y derecho de oposición?', 'Política de cambios.', 'N2', '', ''),
            @('4 · Subencargados y cadena de suministro', '4.3', '¿Traslada a sus subencargados las mismas obligaciones que asume con la compañía?', 'Cláusula tipo o declaración.', 'N2', '', ''),
            @('4 · Subencargados y cadena de suministro', '4.4', '¿Subcontrata alguna parte esencial del servicio? ¿Cómo gestiona la subcontratación en cadena?', 'Mapa de la cadena; política.', 'N3', '', ''),
            @('5 · Seguridad', '5.1', '¿Qué certificaciones e informes independientes mantiene (por ejemplo, ISO/IEC 27001 o ISO/IEC 42001) y cubren este servicio?', 'Certificados con alcance y vigencia.', 'N2', '', ''),
            @('5 · Seguridad', '5.2', '¿Con qué frecuencia hace pruebas de intrusión y cuándo fue la última?', 'Resumen ejecutivo de la última prueba.', 'N2', '', ''),
            @('5 · Seguridad', '5.3', '¿Cómo gestiona las vulnerabilidades y en qué plazos las corrige?', 'Política de vulnerabilidades.', 'N2', '', ''),
            @('5 · Seguridad', '5.4', '¿Qué protecciones aplica frente a inyección de instrucciones, fuga de información y extracción del modelo?', 'Descripción de controles; resultados de pruebas.', 'N2', '', ''),
            @('5 · Seguridad', '5.5', 'Si el servicio incluye agentes: ¿qué identidad, permisos, límites de acción e interruptor de parada tienen?', 'Descripción frente a los controles AG del documento 35.', 'N2', '', ''),
            @('5 · Seguridad', '5.6', '¿Cómo autentica y registra el acceso de su personal a los datos de la compañía?', 'Política de acceso; registros.', 'N2', '', ''),
            @('5 · Seguridad', '5.7', '¿Acepta pruebas adversarias de la compañía o aporta informes independientes recientes de ese tipo?', 'Autorización de pruebas o informe.', 'N3', '', ''),
            @('6 · Cumplimiento del Reglamento de IA', '6.1', '¿Qué rol asume usted según el Reglamento de IA para este servicio (proveedor del sistema, proveedor de modelo de propósito general u otro)?', 'Declaración.', 'N2', '', ''),
            @('6 · Cumplimiento del Reglamento de IA', '6.2', '¿Cómo clasifica el sistema a efectos del Reglamento de IA?', 'Análisis de clasificación.', 'N2', '', ''),
            @('6 · Cumplimiento del Reglamento de IA', '6.3', '¿Qué documentación técnica e instrucciones de uso facilita para que la compañía cumpla sus obligaciones como responsable del despliegue (art. 26)?', 'Instrucciones de uso.', 'N2', '', ''),
            @('6 · Cumplimiento del Reglamento de IA', '6.4', '¿Qué registros genera el sistema y cómo accede la compañía a ellos?', 'Descripción de registros y plazos.', 'N2', '', ''),
            @('6 · Cumplimiento del Reglamento de IA', '6.5', '¿Qué medios ofrece para la supervisión humana?', 'Descripción funcional.', 'N2', '', ''),
            @('6 · Cumplimiento del Reglamento de IA', '6.6', '¿Cómo coopera en la gestión de incidentes graves y en la vigilancia posterior a la comercialización?', 'Procedimiento.', 'N2', '', ''),
            @('6 · Cumplimiento del Reglamento de IA', '6.7', 'Si aporta un modelo de propósito general: ¿qué información y documentación facilita sobre capacidades y limitaciones (art. 53)?', 'Documentación para proveedores posteriores.', 'N2', '', ''),
            @('6 · Cumplimiento del Reglamento de IA', '6.8', 'Si suministra componentes a un sistema de alto riesgo de la compañía: ¿acepta el acuerdo escrito del art. 25.4?', 'Borrador de acuerdo.', 'N3', '', ''),
            @('7 · Protección de datos', '7.1', '¿Actúa como encargado del tratamiento? ¿Firma el contrato de encargo conforme al art. 28 del RGPD?', 'Contrato de encargo.', 'N1', '', ''),
            @('7 · Protección de datos', '7.2', '¿Qué medidas técnicas y organizativas aplica?', 'Anexo de medidas.', 'N2', '', ''),
            @('7 · Protección de datos', '7.3', '¿Cómo apoya las evaluaciones de impacto de la compañía?', 'Información facilitada.', 'N2', '', ''),
            @('7 · Protección de datos', '7.4', '¿Cómo apoya la atención de los derechos de los interesados?', 'Procedimiento.', 'N2', '', ''),
            @('8 · Propiedad intelectual', '8.1', '¿Quién es titular de los resultados o qué derechos de uso tiene la compañía sobre ellos?', 'Condiciones.', 'N2', '', ''),
            @('8 · Propiedad intelectual', '8.2', '¿Qué información facilita sobre las licencias y la procedencia de los datos de entrenamiento?', 'Declaración o documentación.', 'N2', '', ''),
            @('8 · Propiedad intelectual', '8.3', '¿Ofrece indemnidad frente a reclamaciones por infracción derivadas del modelo o de sus datos de entrenamiento?', 'Cláusula de indemnidad.', 'N2', '', ''),
            @('8 · Propiedad intelectual', '8.4', 'Si desarrolla a medida: ¿de quién es lo desarrollado?', 'Propuesta contractual.', 'N2', '', ''),
            @('9 · Continuidad', '9.1', '¿Qué disponibilidad compromete y cuál ha sido la real en los últimos doce meses?', 'Compromiso de servicio; histórico.', 'N2', '', ''),
            @('9 · Continuidad', '9.2', '¿De qué terceros depende el servicio (nube, modelos) y qué ocurre si fallan?', 'Mapa de dependencias.', 'N2', '', ''),
            @('9 · Continuidad', '9.3', '¿Tiene planes de continuidad y recuperación? ¿Qué tiempos de recuperación compromete?', 'Resumen del plan.', 'N3', '', ''),
            @('9 · Continuidad', '9.4', '¿Cuándo probó esos planes por última vez y con qué resultado?', 'Informe de la prueba.', 'N3', '', ''),
            @('10 · Incidentes', '10.1', '¿Cómo gestiona los incidentes y por qué canal los notifica?', 'Condiciones; procedimiento.', 'N1', '', ''),
            @('10 · Incidentes', '10.2', '¿En qué plazo desde la detección notifica y con qué contenido mínimo?', 'Compromiso contractual.', 'N2', '', ''),
            @('10 · Incidentes', '10.3', '¿Qué incidentes relevantes ha tenido el servicio en los últimos veinticuatro meses?', 'Relación resumida.', 'N2', '', ''),
            @('10 · Incidentes', '10.4', '¿Coopera en la respuesta y en las notificaciones regulatorias de la compañía, con un plazo máximo acordado (orientativamente 24 horas o menos)?', 'Compromiso contractual.', 'N3', '', ''),
            @('11 · Salida', '11.1', '¿En qué formatos puede exportar la compañía sus datos?', 'Documentación de exportación.', 'N1', '', ''),
            @('11 · Salida', '11.2', '¿Puede exportar también configuraciones, instrucciones, registros, índices y memorias?', 'Documentación; prueba.', 'N2', '', ''),
            @('11 · Salida', '11.3', '¿Qué asistencia y periodo de transición ofrece al terminar?', 'Propuesta contractual.', 'N2', '', ''),
            @('11 · Salida', '11.4', '¿Cómo certifica el borrado al terminar?', 'Modelo de certificado (P57 §8).', 'N2', '', ''),
            @('11 · Salida', '11.5', '¿Colabora en una prueba de portabilidad con un proveedor alternativo?', 'Compromiso.', 'N3', '', ''),
            @('12 · Ética y uso responsable', '12.1', '¿Qué política de uso aceptable aplica y qué restricciones de uso impone?', 'Política publicada.', 'N1', '', ''),
            @('12 · Ética y uso responsable', '12.2', '¿Cómo evalúa y gestiona el sesgo del modelo o del servicio?', 'Métricas y resultados de evaluación.', 'N2', '', ''),
            @('12 · Ética y uso responsable', '12.3', '¿Alguna restricción de uso afecta al caso de uso de la compañía?', 'Análisis del valorador.', 'N2', '', '')
          )
          en = @(
            @('3 · Data', '3.1 (illustrative example)', "Do you use the company's inputs, contexts, outputs or data to train or improve models or for other purposes? How is this excluded?", 'Terms of service; screenshot of the configuration.', 'N1', 'They are not used for training on the business plan; the setting is disabled by default.', 'Conformant with observations: the screenshot of the configuration of the company''s environment is missing.'),
            @('1 · Identity and soundness', '1.1', 'State your legal name, the group you belong to, your country of establishment and years in operation.', 'Extract from the companies register or equivalent.', 'N1', '', ''),
            @('1 · Identity and soundness', '1.2', 'Describe your ownership structure and any recent or known change of control.', 'Group structure chart.', 'N2', '', ''),
            @('1 · Identity and soundness', '1.3', 'What professional liability and cyber insurance do you hold, with what cover and limits?', 'Current insurance certificates.', 'N2', '', ''),
            @('1 · Identity and soundness', '1.4', 'Is there any conflict of interest with the company or its competitors that is relevant to the service?', 'Signed declaration.', 'N2', '', ''),
            @('1 · Identity and soundness', '1.5', 'Provide your financial position for the last three financial years.', 'Annual accounts and audit report.', 'N3', '', ''),
            @('1 · Identity and soundness', '1.6', 'Provide references from customers with comparable services.', 'Authorised contacts.', 'N3', '', ''),
            @('2 · Service and model', '2.1', 'Describe the service and the AI functions it includes, in plain language.', 'Service data sheet.', 'N1', '', ''),
            @('2 · Service and model', '2.2', 'Which models does the service use? Are they your own or third-party? Identify the provider of each model.', 'List of models and providers.', 'N2', '', ''),
            @('2 · Service and model', '2.3', 'Which versions are in use and what is your policy for changing and withdrawing versions (notice, version pinning)?', 'Version policy; withdrawal schedule.', 'N2', '', ''),
            @('2 · Service and model', '2.4', 'What model documentation do you provide: intended purpose, known limitations, evaluation results, instructions for use?', 'Model documentation.', 'N2', '', ''),
            @('2 · Service and model', '2.5', 'Do you allow the company to run its own tests with representative data before contracting?', 'Terms of the test environment.', 'N2', '', ''),
            @('3 · Data', '3.1', "Do you use the company's inputs, contexts, outputs or data to train or improve models or for other purposes? How is this excluded?", 'Terms of service; screenshot of the configuration.', 'N1', '', ''),
            @('3 · Data', '3.2', 'What retention period applies to inputs, outputs and logs?', 'Terms; configuration.', 'N1', '', ''),
            @('3 · Data', '3.3', 'In which regions are the data processed and stored?', 'Terms; region configuration.', 'N1', '', ''),
            @('3 · Data', '3.4', 'Are there international transfers? With which Chapter V GDPR safeguards?', 'Transfer mechanism.', 'N2', '', ''),
            @('3 · Data', '3.5', 'How are data encrypted in transit and at rest, and who manages the keys?', 'Technical description or independent report.', 'N2', '', ''),
            @('3 · Data', '3.6', 'How are the data of different customers separated?', 'Architecture description.', 'N2', '', ''),
            @('3 · Data', '3.7', 'How are data deleted on request and at the end of the contract? Do you issue a certificate?', 'Deletion procedure; certificate model.', 'N2', '', ''),
            @('4 · Sub-processors and supply chain', '4.1', 'Provide the list of sub-processors with their location and function.', 'Up-to-date list.', 'N2', '', ''),
            @('4 · Sub-processors and supply chain', '4.2', 'How do you notify changes of sub-processors? Is there advance notice and a right to object?', 'Change policy.', 'N2', '', ''),
            @('4 · Sub-processors and supply chain', '4.3', 'Do you pass on to your sub-processors the same obligations you assume towards the company?', 'Standard clause or declaration.', 'N2', '', ''),
            @('4 · Sub-processors and supply chain', '4.4', 'Do you subcontract any essential part of the service? How do you manage the subcontracting chain?', 'Chain map; policy.', 'N3', '', ''),
            @('5 · Security', '5.1', 'Which certifications and independent reports do you hold (for example, ISO/IEC 27001 or ISO/IEC 42001), and do they cover this service?', 'Certificates with scope and validity.', 'N2', '', ''),
            @('5 · Security', '5.2', 'How often do you carry out penetration tests and when was the last one?', 'Executive summary of the last test.', 'N2', '', ''),
            @('5 · Security', '5.3', 'How do you manage vulnerabilities and within what time frames do you fix them?', 'Vulnerability policy.', 'N2', '', ''),
            @('5 · Security', '5.4', 'What protections do you apply against prompt injection, information leakage and model extraction?', 'Description of controls; test results.', 'N2', '', ''),
            @('5 · Security', '5.5', 'If the service includes agents: what identity, permissions, action limits and kill switch do they have?', 'Description against the AG controls of document 35.', 'N2', '', ''),
            @('5 · Security', '5.6', "How do you authenticate and log your staff's access to the company's data?", 'Access policy; logs.', 'N2', '', ''),
            @('5 · Security', '5.7', 'Do you accept adversarial testing by the company or provide recent independent reports of that type?', 'Testing authorisation or report.', 'N3', '', ''),
            @('6 · AI Act compliance', '6.1', 'What role do you assume under the AI Act for this service (provider of the system, provider of a general-purpose AI model or other)?', 'Declaration.', 'N2', '', ''),
            @('6 · AI Act compliance', '6.2', 'How do you classify the system for the purposes of the AI Act?', 'Classification analysis.', 'N2', '', ''),
            @('6 · AI Act compliance', '6.3', 'What technical documentation and instructions for use do you provide so that the company can meet its obligations as deployer (Art. 26)?', 'Instructions for use.', 'N2', '', ''),
            @('6 · AI Act compliance', '6.4', 'What logs does the system generate and how does the company access them?', 'Description of logs and retention periods.', 'N2', '', ''),
            @('6 · AI Act compliance', '6.5', 'What means do you provide for human oversight?', 'Functional description.', 'N2', '', ''),
            @('6 · AI Act compliance', '6.6', 'How do you cooperate in handling serious incidents and in post-market monitoring?', 'Procedure.', 'N2', '', ''),
            @('6 · AI Act compliance', '6.7', 'If you supply a general-purpose AI model: what information and documentation do you provide on capabilities and limitations (Art. 53)?', 'Documentation for downstream providers.', 'N2', '', ''),
            @('6 · AI Act compliance', '6.8', 'If you supply components to a high-risk system of the company: do you accept the written agreement under Art. 25(4)?', 'Draft agreement.', 'N3', '', ''),
            @('7 · Data protection', '7.1', 'Do you act as a processor? Will you sign a data processing agreement in accordance with Art. 28 of the GDPR?', 'Data processing agreement.', 'N1', '', ''),
            @('7 · Data protection', '7.2', 'What technical and organisational measures do you apply?', 'Annex of measures.', 'N2', '', ''),
            @('7 · Data protection', '7.3', "How do you support the company's impact assessments?", 'Information provided.', 'N2', '', ''),
            @('7 · Data protection', '7.4', 'How do you support the handling of data subject rights?', 'Procedure.', 'N2', '', ''),
            @('8 · Intellectual property', '8.1', 'Who owns the outputs, or what rights of use does the company have over them?', 'Terms.', 'N2', '', ''),
            @('8 · Intellectual property', '8.2', 'What information do you provide on the licences and provenance of the training data?', 'Declaration or documentation.', 'N2', '', ''),
            @('8 · Intellectual property', '8.3', 'Do you offer an indemnity against infringement claims arising from the model or its training data?', 'Indemnity clause.', 'N2', '', ''),
            @('8 · Intellectual property', '8.4', 'If you develop bespoke components: who owns what is developed?', 'Contractual proposal.', 'N2', '', ''),
            @('9 · Continuity', '9.1', 'What availability do you commit to and what has actual availability been over the last twelve months?', 'Service commitment; history.', 'N2', '', ''),
            @('9 · Continuity', '9.2', 'Which third parties does the service depend on (cloud, models) and what happens if they fail?', 'Dependency map.', 'N2', '', ''),
            @('9 · Continuity', '9.3', 'Do you have continuity and recovery plans? What recovery times do you commit to?', 'Plan summary.', 'N3', '', ''),
            @('9 · Continuity', '9.4', 'When did you last test those plans and with what result?', 'Test report.', 'N3', '', ''),
            @('10 · Incidents', '10.1', 'How do you manage incidents and through which channel do you notify them?', 'Terms; procedure.', 'N1', '', ''),
            @('10 · Incidents', '10.2', 'Within what time limit from detection do you notify, and with what minimum content?', 'Contractual commitment.', 'N2', '', ''),
            @('10 · Incidents', '10.3', 'What relevant incidents has the service had in the last twenty-four months?', 'Summary list.', 'N2', '', ''),
            @('10 · Incidents', '10.4', "Do you cooperate in the company's response and regulatory notifications within an agreed maximum time limit (indicatively 24 hours or less)?", 'Contractual commitment.', 'N3', '', ''),
            @('11 · Exit', '11.1', 'In which formats can the company export its data?', 'Export documentation.', 'N1', '', ''),
            @('11 · Exit', '11.2', 'Can configurations, prompts, logs, indexes and memories also be exported?', 'Documentation; test.', 'N2', '', ''),
            @('11 · Exit', '11.3', 'What assistance and transition period do you offer on termination?', 'Contractual proposal.', 'N2', '', ''),
            @('11 · Exit', '11.4', 'How do you certify deletion on termination?', 'Certificate model (P57 §8).', 'N2', '', ''),
            @('11 · Exit', '11.5', 'Will you cooperate in a portability test with an alternative supplier?', 'Commitment.', 'N3', '', ''),
            @('12 · Ethics and responsible use', '12.1', 'What acceptable use policy do you apply and what use restrictions do you impose?', 'Published policy.', 'N1', '', ''),
            @('12 · Ethics and responsible use', '12.2', 'How do you assess and manage bias in the model or the service?', 'Metrics and evaluation results.', 'N2', '', ''),
            @('12 · Ethics and responsible use', '12.3', "Does any use restriction affect the company's use case?", "Assessor's analysis.", 'N2', '', '')
          )
        }
      },
      @{
        nombre = @{ es = 'Resumen y traslado a P14'; en = 'Summary and transfer to P14' }
        ejemplos = 1
        columnas = @(
          @{ es = 'Bloque'; en = 'Block'; ancho = 30 }
          @{ es = 'Resultado'; en = 'Result'; ancho = 30; lista = @{ es = @('Conforme', 'Conforme con observaciones', 'No conforme'); en = @('Conformant', 'Conformant with observations', 'Non-conformant') } }
          @{ es = 'Observaciones y condiciones'; en = 'Observations and conditions'; ancho = 42 }
          @{ es = 'Riesgo trasladado a P12'; en = 'Risk transferred to P12'; ancho = 20 }
        )
        filas = @{
          es = @(
            @('3 · Datos', 'Conforme con observaciones', 'Aportar captura de la configuración de no entrenamiento antes de la firma; compras; 2026-10-15.', 'RT-TER-02'),
            @('1 · Identidad y solvencia', '', '', ''), @('2 · Servicio y modelo', '', '', ''), @('4 · Subencargados y cadena de suministro', '', '', ''),
            @('5 · Seguridad', '', '', ''), @('6 · Cumplimiento del Reglamento de IA', '', '', ''), @('7 · Protección de datos', '', '', ''),
            @('8 · Propiedad intelectual', '', '', ''), @('9 · Continuidad', '', '', ''), @('10 · Incidentes', '', '', ''),
            @('11 · Salida', '', '', ''), @('12 · Ética y uso responsable', '', '', '')
          )
          en = @(
            @('3 · Data', 'Conformant with observations', 'Provide a screenshot of the no-training configuration before signature; procurement; 2026-10-15.', 'RT-TER-02'),
            @('1 · Identity and soundness', '', '', ''), @('2 · Service and model', '', '', ''), @('4 · Sub-processors and supply chain', '', '', ''),
            @('5 · Security', '', '', ''), @('6 · AI Act compliance', '', '', ''), @('7 · Data protection', '', '', ''),
            @('8 · Intellectual property', '', '', ''), @('9 · Continuity', '', '', ''), @('10 · Incidents', '', '', ''),
            @('11 · Exit', '', '', ''), @('12 · Ethics and responsible use', '', '', '')
          )
        }
      }
    )
  }
}

$n = 0; $cambiados = 0
foreach ($codigo in $plantillas.Keys) {
  if (-not ($Filter | Where-Object { $codigo -like $_ })) { continue }
  $p = $plantillas[$codigo]
  foreach ($lang in $Idiomas) {
    $destino = Join-Path $repo "SEVEN-G/xlsx/$lang/plantillas/$($p.archivo).xlsx"
    if (Nueva-HojaXlsx -destino $destino -lang $lang -codigo $codigo -nombrePlantilla $p.nombre -hojas $p.hojas) { $cambiados++ }
    $n++
  }
}
Write-Host "xlsx: $n plantillas ($cambiados actualizadas)"
