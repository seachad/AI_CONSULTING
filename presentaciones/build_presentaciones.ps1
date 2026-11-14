<#
.SYNOPSIS
  Genera las presentaciones del sitio (PPTX y PDF, español e inglés) desde los JSON de presentaciones/fuentes.

.DESCRIPTION
  Contrato: presentaciones/ESPECIFICACION.md (campos, tipos de slide, límites y rutas de salida).
  El PPTX se escribe en OOXML puro, sin dependencias, y es determinista (misma entrada -> mismos bytes).
  El PDF lleva cada slide como imagen y, debajo, sus notas completas y sus fuentes con enlaces: PowerPoint (COM)
  exporta las slides a PNG y Edge sin ventana imprime un HTML A4. Si falta PowerPoint o Edge, se avisa y se conserva
  el PDF anterior. El PDF solo se regenera si cambió el PPTX o si no existe.

  Salidas: <MARCO>/pptx/<idioma>/presentaciones/<nombre>.pptx y <MARCO>/pdf/<idioma>/presentaciones/<nombre>.pdf;
  áreas en SEVEN-G/pptx|pdf/<idioma>/areas/; manifiesto en presentaciones/manifiesto.json.

.PARAMETER Solo        Patrón(es) «carpeta/clave» (comodines): seven-g/5, areas/*, spad/curso.
.PARAMETER Idiomas     Idiomas a generar (por defecto es y en). La validación mira siempre los dos.
.PARAMETER SinPdf      No genera PDF.
.PARAMETER Validar     Solo valida; no escribe nada.
.PARAMETER Revisado    Patrón(es): vuelve a sellar en el manifiesto las huellas de basado_en de esas presentaciones.
.PARAMETER Comprobar   No escribe nada; sale con 1 si algo no valida, un PPTX no corresponde a su JSON o falta,
                       falta un PDF o una fuente de basado_en cambió desde la última revisión.
.PARAMETER Fuentes     Carpeta de fuentes (por defecto presentaciones/fuentes). Para pruebas.
.PARAMETER Salida      Raíz de las salidas (por defecto la raíz del repositorio). Para pruebas.
.PARAMETER Catalogo    Catálogo de imágenes (por defecto presentaciones/imagenes.json). Para pruebas.

.EXAMPLE
  pwsh -File presentaciones/build_presentaciones.ps1
  pwsh -File presentaciones/build_presentaciones.ps1 -Solo seven-g/5 -SinPdf
  pwsh -File presentaciones/build_presentaciones.ps1 -Validar
  pwsh -File presentaciones/build_presentaciones.ps1 -Comprobar
  pwsh -File presentaciones/build_presentaciones.ps1 -Revisado 'areas/*'
#>
param(
  [string[]]$Solo,
  [string[]]$Idiomas = @('es', 'en'),
  [switch]$SinPdf,
  [switch]$Validar,
  [string[]]$Revisado,
  [switch]$Comprobar,
  [string]$Fuentes,
  [string]$Salida,
  [string]$Catalogo
)

$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.IO.Compression
# con pwsh -File las listas llegan como «a,b»
$Solo = @($Solo | ForEach-Object { $_ -split ',' } | Where-Object { $_ })
$Revisado = @($Revisado | ForEach-Object { $_ -split ',' } | Where-Object { $_ })
$Idiomas = @($Idiomas | ForEach-Object { $_ -split ',' } | Where-Object { $_ })
Add-Type -AssemblyName System.IO.Compression.FileSystem

$presDir = $PSScriptRoot
$repo = Split-Path -Parent $presDir
if (-not $Fuentes) { $Fuentes = Join-Path $presDir 'fuentes' }
$Fuentes = [IO.Path]::GetFullPath($Fuentes)
$salidaPersonalizada = [bool]$Salida
if (-not $Salida) { $Salida = $repo }
$Salida = [IO.Path]::GetFullPath($Salida)
$rutaManifiesto = if ($salidaPersonalizada) { Join-Path $Salida 'manifiesto.json' } else { Join-Path $presDir 'manifiesto.json' }
$fechaFija = [DateTimeOffset]::new(2026, 1, 1, 0, 0, 0, [TimeSpan]::Zero)
$utf8 = [Text.UTF8Encoding]::new($false)

$config = Get-Content (Join-Path $presDir 'config.json') -Raw -Encoding utf8 | ConvertFrom-Json -AsHashtable
$BASE_URL = [string]$config.base_url
if (-not $BASE_URL.EndsWith('/')) { $BASE_URL += '/' }
$SITIO_TXT = $BASE_URL -replace '^https?://', ''
$AUTOR = if ($config.autor) { [string]$config.autor } else { 'Fernando García Varela' }
$LIC_PIE = if ($config.licencia_pie) { [string]$config.licencia_pie } else { 'CC BY 4.0' }

# aviso legal breve con exención (D33, D113), el mismo del cierre de los cursos (curso_pptx.ps1)
$AVISO = @{
  es = 'Aviso legal: ayuda metodológica genérica y gratuita, «tal cual» y con fines informativos; no es asesoramiento jurídico ni está revisada jurídicamente para ningún caso. Cada organización la adapta y es responsable de su revisión legal y de su cumplimiento regulatorio; puede no recoger cambios normativos recientes. En la máxima medida permitida por la ley, el autor no asume responsabilidad alguna por los efectos de su aplicación. No otorga certificación de ningún tipo. Detalle en el documento 93.'
  en = 'Legal notice: a generic, free methodological aid provided "as is" for information purposes; it is not legal advice and has not been legally reviewed for any case. Each organisation adapts it and is responsible for its legal review and its regulatory compliance; it may not reflect recent regulatory changes. To the fullest extent permitted by law, the author accepts no liability whatsoever for the effects of its application. It does not grant certification of any kind. Details in document 93.'
}
$TX = @{
  es = @{ notas = 'Notas'; fuentes = 'Fuentes y enlaces'; aviso = 'Aviso legal' }
  en = @{ notas = 'Notes'; fuentes = 'Sources and links'; aviso = 'Legal notice' }
}

function Xml([string]$s) { if ($null -eq $s) { return '' }; [Security.SecurityElement]::Escape($s) }
function Sha256Bytes([byte[]]$b) { [Convert]::ToHexString([Security.Cryptography.SHA256]::HashData($b)).ToLowerInvariant() }
function Sha256Fichero([string]$ruta) { Sha256Bytes ([IO.File]::ReadAllBytes($ruta)) }
# Huella de un fichero de texto que no depende de los saltos de línea (CRLF o LF): git y algunos generadores
# (crosswalk.ps1) los cambian sin cambiar el contenido, y eso no debe pedir una revisión ni otro PPTX.
function Sin-CR([byte[]]$b) { $l1 = [Text.Encoding]::Latin1; , $l1.GetBytes($l1.GetString($b).Replace("`r", '')) }
function Sha256Texto([string]$ruta) { Sha256Bytes (Sin-CR ([IO.File]::ReadAllBytes($ruta))) }
function Rel([string]$ruta, [string]$base = $repo) { [IO.Path]::GetRelativePath($base, $ruta).Replace('\', '/') }

# =====================================================================================
# Paleta y medidas (EMU; 12700 EMU = 1 pt)
# =====================================================================================
$PAPEL = 'FBE2CD'; $PAPEL2 = 'F3CFB2'; $CARTA = 'FFF5EC'; $NEGRO = '1A1817'; $TINTA = '2F2B28'; $TINTA2 = '5E544D'
$CLARET = '990F3D'; $OXFORD = '0F5499'; $TEAL = '0D7680'; $VELVET = '593380'; $ORO = 'A5822A'; $VERDE = '2E7D32'
$GRIS = 'C9A78D'; $BLANCO = 'FFFFFF'
$COLORES = @{ claret = $CLARET; oxford = $OXFORD; teal = $TEAL; velvet = $VELVET; oro = $ORO; verde = $VERDE; negro = $NEGRO }
$CICLO = @($OXFORD, $TEAL, $VELVET, $CLARET, $ORO, $VERDE)
function ColorDe($nombre, [int]$i = 0) { if ($nombre -and $COLORES.ContainsKey([string]$nombre)) { $COLORES[[string]$nombre] } else { $CICLO[$i % $CICLO.Count] } }

$SW = 12192000; $SH = 6858000
$MX = 609600; $W = $SW - 2 * $MX
$INS_LR = 91440; $INS_TB = 45720

# =====================================================================================
# Medición de texto (estimación prudente, para que nada se salga de su caja)
# =====================================================================================
function Em-Palabra([string]$p) {
  $e = 0.0
  foreach ($ch in $p.ToCharArray()) {
    if ('iljI.,;:!|''`()[]'.Contains($ch)) { $e += 0.26 }
    elseif ('ftr-"'.Contains($ch)) { $e += 0.33 }
    elseif ('mwMW@%'.Contains($ch)) { $e += 0.86 }
    elseif ([char]::IsUpper($ch)) { $e += 0.68 }
    elseif ([char]::IsDigit($ch)) { $e += 0.56 }
    elseif ($ch -eq ' ') { $e += 0.28 }
    elseif ([int]$ch -gt 0x2000) { $e += 0.80 }
    else { $e += 0.50 }
  }
  $e
}
# número de líneas que ocupa un texto en un ancho dado (pt) a un tamaño dado (pt)
function Lineas([string]$texto, [double]$anchoPt, [double]$tamPt, [double]$factor) {
  if (-not $texto) { return 1 }
  $total = 0
  foreach ($seg in ($texto -split "`n")) {
    $lin = 1; $act = 0.0
    $esp = 0.28 * $tamPt * $factor
    foreach ($pal in ($seg -split ' ')) {
      if ($pal -eq '') { continue }
      $w = (Em-Palabra $pal) * $tamPt * $factor
      # una palabra que no cabe en el ancho se partiría a mitad: ese tamaño no vale
      if ($w -gt $anchoPt) { return 999 }
      if ($act -eq 0) {
        while ($w -gt $anchoPt) { $lin++; $w -= $anchoPt }
        $act = $w
      } elseif ($act + $esp + $w -le $anchoPt) { $act += $esp + $w }
      else {
        $lin++
        while ($w -gt $anchoPt) { $lin++; $w -= $anchoPt }
        $act = $w
      }
    }
    $total += $lin
  }
  $total
}
# factor de anchura por tipo de letra, con holgura
function Factor([string]$fam, [bool]$neg) {
  $f = if ($fam -eq 'Georgia') { 1.12 } else { 1.0 }
  if ($neg) { $f *= 1.10 }
  $f * 1.07
}
# Partes: lista de @{ t = texto; neg; fam; esc (multiplicador del tamaño); aft (pt tras el párrafo); ind (sangría pt) }
# Devuelve el mayor tamaño (centésimas de punto) entre $max y $min con el que todo cabe en (cx, cy).
function Ajustar([object[]]$partes, [int]$cx, [int]$cy, [int]$max, [int]$min = 900, [int]$insLR = $INS_LR, [int]$insTB = $INS_TB) {
  $anchoPt = ($cx - 2 * $insLR) / 12700.0
  $altoPt = ($cy - 2 * $insTB) / 12700.0
  for ($s = $max; $s -ge $min; $s -= 50) {
    $h = 0.0
    foreach ($p in $partes) {
      $esc = if ($p.esc) { $p.esc } else { 1.0 }
      $tam = $s / 100.0 * $esc
      $fam = if ($p.fam) { $p.fam } else { 'Arial' }
      $ind = if ($p.ind) { $p.ind } else { 0 }
      $n = Lineas $p.t ($anchoPt - $ind) $tam (Factor $fam ([bool]$p.neg))
      $lh = if ($fam -eq 'Georgia') { 1.22 } else { 1.2 }
      $h += $n * $tam * $lh + $(if ($p.aft) { $p.aft / 1000.0 * $s / 100.0 } else { 0 })
    }
    if ($h -le $altoPt) { $script:ajusteOk = $true; return $s }
  }
  $script:ajusteOk = $false
  if ($script:ajusteSilencio) { return $min }
  $muestra = (@($partes | ForEach-Object { $_.t }) -join ' ')
  $muestra = $muestra.Substring(0, [math]::Min(40, $muestra.Length))
  $script:avisosAjuste.Add("texto muy largo para su caja (tamaño mínimo $([math]::Round($min/100,1)) pt): «$muestra…»")
  $min
}
# como Ajustar, pero sin aviso: devuelve el tamaño si cabe con $min o más; si no, 0
function Cabe([object[]]$partes, [int]$cx, [int]$cy, [int]$max, [int]$min, [int]$insLR = $INS_LR, [int]$insTB = $INS_TB) {
  $script:ajusteSilencio = $true
  try { $t = Ajustar $partes $cx $cy $max $min $insLR $insTB } finally { $script:ajusteSilencio = $false }
  if ($script:ajusteOk) { $t } else { 0 }
}
# el «→» de un título enlazado va pegado a la última palabra (sin espacio partible)
function ConFlecha([string]$t, [bool]$u) { if ($u) { $t + [char]0x00A0 + '→' } else { $t } }

# =====================================================================================
# Primitivas OOXML
# =====================================================================================
$NS = 'xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:p="http://schemas.openxmlformats.org/presentationml/2006/main"'
$T_HLINK = 'http://schemas.openxmlformats.org/officeDocument/2006/relationships/hyperlink'
$T_IMAGE = 'http://schemas.openxmlformats.org/officeDocument/2006/relationships/image'

function Nuevo-Ctx() { @{ lista = [Collections.Generic.List[object]]::new(); mapa = @{}; idSeq = 1 } }
function Rel-Nueva([hashtable]$ctx, [string]$tipo, [string]$target, [bool]$externo) {
  $k = "$tipo|$target"
  if ($ctx.mapa.ContainsKey($k)) { return $ctx.mapa[$k] }
  $id = "rId$($ctx.lista.Count + 10)"
  $ctx.lista.Add([pscustomobject]@{ id = $id; tipo = $tipo; target = $target; externo = $externo })
  $ctx.mapa[$k] = $id
  $id
}
function Enlace([string]$url) { if (-not $url) { return $null }; Rel-Nueva $script:ctx $T_HLINK $url $true }
function NuevoId() { $script:ctx.idSeq++; $script:ctx.idSeq }

# run: $o = @{ color; tam; neg; ita; fam; url; sub (subrayado) }
function Run([string]$texto, [hashtable]$o) {
  $a = " lang=""$($script:LANGTAG)"" sz=""$($o.tam)"""
  if ($o.neg) { $a += ' b="1"' }
  if ($o.ita) { $a += ' i="1"' }
  if ($o.sub) { $a += ' u="sng"' }
  $c = if ($o.color) { $o.color } else { $TINTA }
  $f = if ($o.fam) { "<a:latin typeface=""$($o.fam)""/>" } else { '' }
  $h = if ($o.url) { "<a:hlinkClick r:id=""$(Enlace $o.url)""/>" } else { '' }
  "<a:r><a:rPr$a dirty=""0""><a:solidFill><a:srgbClr val=""$c""/></a:solidFill>$f$h</a:rPr><a:t>$(Xml $texto)</a:t></a:r>"
}
# párrafo: $runs ya en XML; $o = @{ algn; aft (centipt); bullet (color); ind (EMU); lnSpc (%) ; bef }
function Parr([string]$runs, [hashtable]$o = @{}) {
  $algn = if ($o.algn) { $o.algn } else { 'l' }
  $attr = " algn=""$algn"""
  $inner = ''
  if ($o.lnSpc) { $inner += "<a:lnSpc><a:spcPct val=""$($o.lnSpc * 1000)""/></a:lnSpc>" }
  if ($o.bef) { $inner += "<a:spcBef><a:spcPts val=""$($o.bef)""/></a:spcBef>" }
  if ($o.aft) { $inner += "<a:spcAft><a:spcPts val=""$($o.aft)""/></a:spcAft>" }
  if ($o.bullet) {
    $ind = if ($o.ind) { $o.ind } else { 228600 }
    $attr += " marL=""$ind"" indent=""-$ind"""
    $inner += "<a:buClr><a:srgbClr val=""$($o.bullet)""/></a:buClr><a:buSzPct val=""100000""/><a:buFont typeface=""Arial""/><a:buChar char=""&#9642;""/>"
  } else { $inner += '<a:buNone/>' }
  "<a:p><a:pPr$attr>$inner</a:pPr>$runs<a:endParaRPr lang=""$($script:LANGTAG)"" dirty=""0""/></a:p>"
}
# caja de texto o forma; $o = @{ fill; line; lineW; geom; anchor; url; insLR; insTB; adj; nombre }
function Forma([int]$x, [int]$y, [int]$cx, [int]$cy, [string]$parrs, [hashtable]$o = @{}) {
  $id = NuevoId
  $geom = if ($o.geom) { $o.geom } else { 'rect' }
  $av = if ($o.adj) { "<a:avLst><a:gd name=""adj"" fmla=""val $($o.adj)""/></a:avLst>" } else { '<a:avLst/>' }
  $fill = if ($o.fill) { "<a:solidFill><a:srgbClr val=""$($o.fill)""/></a:solidFill>" } else { '<a:noFill/>' }
  $ln = if ($o.line) { "<a:ln w=""$(if ($o.lineW) { $o.lineW } else { 12700 })""><a:solidFill><a:srgbClr val=""$($o.line)""/></a:solidFill></a:ln>" } else { '<a:ln><a:noFill/></a:ln>' }
  $anchor = if ($o.anchor) { $o.anchor } else { 't' }
  $lr = if ($null -ne $o.insLR) { $o.insLR } else { $INS_LR }
  $tb = if ($null -ne $o.insTB) { $o.insTB } else { $INS_TB }
  $h = if ($o.url) { "<a:hlinkClick r:id=""$(Enlace $o.url)""/>" } else { '' }
  $nombre = if ($o.nombre) { $o.nombre } else { "Forma $id" }
  $txb = if ($o.fill -or $o.line -or $o.geom) { '' } else { ' txBox="1"' }
  if (-not $parrs) { $parrs = "<a:p><a:endParaRPr lang=""$($script:LANGTAG)"" dirty=""0""/></a:p>" }
  "<p:sp><p:nvSpPr><p:cNvPr id=""$id"" name=""$(Xml $nombre)"">$h</p:cNvPr><p:cNvSpPr$txb/><p:nvPr/></p:nvSpPr><p:spPr><a:xfrm><a:off x=""$x"" y=""$y""/><a:ext cx=""$cx"" cy=""$cy""/></a:xfrm><a:prstGeom prst=""$geom"">$av</a:prstGeom>$fill$ln</p:spPr><p:txBody><a:bodyPr wrap=""square"" lIns=""$lr"" tIns=""$tb"" rIns=""$lr"" bIns=""$tb"" anchor=""$anchor"" rtlCol=""0""><a:normAutofit/></a:bodyPr><a:lstStyle/>$parrs</p:txBody></p:sp>"
}
function Rect([int]$x, [int]$y, [int]$cx, [int]$cy, [string]$fill, [string]$geom = 'rect') { Forma $x $y $cx $cy '' @{ fill = $fill; geom = $geom; insLR = 0; insTB = 0 } }

# imágenes
$script:media = [ordered]@{}
function Medidas-Imagen([string]$ruta) {
  $b = [IO.File]::ReadAllBytes($ruta)
  if ($b.Length -gt 24 -and $b[1] -eq 0x50 -and $b[2] -eq 0x4E -and $b[3] -eq 0x47) {
    $an = ([int]$b[16] -shl 24) -bor ([int]$b[17] -shl 16) -bor ([int]$b[18] -shl 8) -bor [int]$b[19]
    $al = ([int]$b[20] -shl 24) -bor ([int]$b[21] -shl 16) -bor ([int]$b[22] -shl 8) -bor [int]$b[23]
    return @($an, $al)
  }
  if ($b.Length -gt 4 -and $b[0] -eq 0xFF -and $b[1] -eq 0xD8) {
    $i = 2
    while ($i + 9 -lt $b.Length) {
      if ($b[$i] -ne 0xFF) { $i++; continue }
      $m = $b[$i + 1]
      if ($m -ge 0xC0 -and $m -le 0xCF -and $m -ne 0xC4 -and $m -ne 0xC8 -and $m -ne 0xCC) {
        $al = ([int]$b[$i + 5] -shl 8) -bor [int]$b[$i + 6]; $an = ([int]$b[$i + 7] -shl 8) -bor [int]$b[$i + 8]
        return @($an, $al)
      }
      $len = ([int]$b[$i + 2] -shl 8) -bor [int]$b[$i + 3]
      $i += 2 + $len
    }
  }
  throw "No se pueden leer las medidas de la imagen $ruta"
}
# Los componentes del sitio (presentaciones/img) llevan dentro su propio título y subtítulo arriba y «Fuente» abajo:
# en una slide ya los dice el título de la slide, así que se recortan para que el gráfico se vea más grande.
# Devuelve @(izq, arriba, der, abajo) en fracción, o $null.
function Recorte-De([string]$ruta) {
  if ($ruta -notmatch '[\\/]presentaciones[\\/]img[\\/]') { return $null }
  $m = Medidas-Imagen $ruta
  $k = $m[0] / 2255.0
  @((25 * $k / $m[0]), (185 * $k / $m[1]), (25 * $k / $m[0]), (72 * $k / $m[1]))
}
function Proporcion([string]$ruta, $rec) {
  $m = Medidas-Imagen $ruta
  if ($rec) { ($m[0] * (1 - $rec[0] - $rec[2])) / ($m[1] * (1 - $rec[1] - $rec[3])) } else { $m[0] / [double]$m[1] }
}
function Pic([string]$ruta, [int]$x, [int]$y, [int]$cx, [int]$cy, [string]$descr, [string]$alinear = 'centro', $rec = $null) {
  $prop = Proporcion $ruta $rec
  $src = if ($rec) { "<a:srcRect l=""$([int]($rec[0]*100000))"" t=""$([int]($rec[1]*100000))"" r=""$([int]($rec[2]*100000))"" b=""$([int]($rec[3]*100000))""/>" } else { '' }
  $w = $cx; $h = [int]($cx / $prop)
  if ($h -gt $cy) { $h = $cy; $w = [int]($cy * $prop) }
  $ox = $x; $oy = $y
  if ($alinear -eq 'centro') { $ox = $x + [int](($cx - $w) / 2); $oy = $y + [int](($cy - $h) / 2) }
  elseif ($alinear -eq 'arriba-izq') { }
  elseif ($alinear -eq 'centro-v') { $oy = $y + [int](($cy - $h) / 2) }
  if (-not $script:media.Contains($ruta)) {
    $ext = [IO.Path]::GetExtension($ruta).TrimStart('.').ToLowerInvariant(); if ($ext -eq 'jpeg') { $ext = 'jpg' }
    $script:media[$ruta] = "image$($script:media.Count + 1).$ext"
  }
  $rid = Rel-Nueva $script:ctx $T_IMAGE "../media/$($script:media[$ruta])" $false
  $id = NuevoId
  $xml = "<p:pic><p:nvPicPr><p:cNvPr id=""$id"" name=""Imagen $id"" descr=""$(Xml $descr)""/><p:cNvPicPr><a:picLocks noChangeAspect=""1""/></p:cNvPicPr><p:nvPr/></p:nvPicPr><p:blipFill><a:blip r:embed=""$rid""/>$src<a:stretch><a:fillRect/></a:stretch></p:blipFill><p:spPr><a:xfrm><a:off x=""$ox"" y=""$oy""/><a:ext cx=""$w"" cy=""$h""/></a:xfrm><a:prstGeom prst=""rect""><a:avLst/></a:prstGeom><a:ln w=""9525""><a:solidFill><a:srgbClr val=""$GRIS""/></a:solidFill></a:ln></p:spPr></p:pic>"
  [pscustomobject]@{ xml = $xml; x = $ox; y = $oy; w = $w; h = $h }
}

# =====================================================================================
# Utilidades de contenido
# =====================================================================================
$script:L = 'es'
function Tx($o) {
  if ($null -eq $o) { return '' }
  if ($o -is [string]) { return $o }
  if ($o -is [System.Collections.IDictionary]) {
    if ($o.Contains($script:L)) { return [string]$o[$script:L] }
    if ($o.Contains('texto')) { return Tx $o['texto'] }
  }
  [string]$o
}
# href de un campo -> cadena del idioma (aún sin base)
function HrefIdioma($h, [string]$lang) {
  if ($null -eq $h) { return $null }
  if ($h -is [string]) { return $h.Replace('{idioma}', $lang) }
  if ($h -is [System.Collections.IDictionary] -and $h.Contains($lang)) { return ([string]$h[$lang]).Replace('{idioma}', $lang) }
  $null
}
function Url($h) {
  $s = HrefIdioma $h $script:L
  if (-not $s) { return $null }
  if ($s -match '^https?://') { return $s }
  $BASE_URL + $s.TrimStart('/')
}
function Lista($v) { if ($null -eq $v) { return @() }; @($v) }

# =====================================================================================
# Marco de cada slide: cabecera, zona de contenido, destacado, enlaces y pie
# =====================================================================================
function Kicker([string]$texto, [bool]$oscuro) {
  $c = if ($oscuro) { $PAPEL2 } else { $CLARET }
  (Rect $MX 318000 110000 110000 $c) + (Forma ($MX + 170000) 250000 ($W - 170000) 250000 (Parr (Run $texto.ToUpperInvariant() @{ color = $c; tam = 1050; neg = $true })) @{ anchor = 'ctr'; insLR = 0; insTB = 0 })
}
# devuelve @{ xml; top } ; título y sub con regla bajo ellos
function Cabecera($s, [bool]$oscuro = $false) {
  $titulo = Tx $s.titulo; $sub = Tx $s.sub
  $ct = if ($oscuro) { $PAPEL } else { $NEGRO }
  $tt = Ajustar @(@{ t = $titulo; neg = $true; fam = 'Georgia' }) $W 800000 2800 1900
  $x = Forma $MX 500000 $W 800000 (Parr (Run $titulo @{ color = $ct; tam = $tt; neg = $true; fam = 'Georgia' }) @{ lnSpc = 92 }) @{ anchor = 'b' }
  if ($sub) {
    $ts = Ajustar @(@{ t = $sub }) $W 560000 1600 1200
    $x += Forma $MX 1320000 $W 560000 (Parr (Run $sub @{ color = $(if ($oscuro) { $PAPEL2 } else { $TINTA2 }); tam = $ts })) @{}
    $x += Rect $MX 1910000 $W 12700 $(if ($oscuro) { $PAPEL2 } else { $NEGRO })
    return @{ xml = $x; top = 2020000 }
  }
  $x += Rect $MX 1360000 $W 12700 $(if ($oscuro) { $PAPEL2 } else { $NEGRO })
  @{ xml = $x; top = 1470000 }
}
$Y_PIE = 6470000; $Y_ENL = 5975000; $H_ENL = 400000; $Y_DEST = 5330000; $H_DEST = 540000
function Fondo($s) { if ($s.destacado) { $Y_DEST - 130000 } else { $Y_ENL - 150000 } }
function Destacado($s) {
  $t = Tx $s.destacado
  if (-not $t) { return '' }
  $tam = Ajustar @(@{ t = $t; neg = $true }) ($W - 300000) $H_DEST 1500 1050 160000 $INS_TB
  (Rect $MX $Y_DEST 60000 $H_DEST $NEGRO) + (Forma ($MX + 60000) $Y_DEST ($W - 60000) $H_DEST (Parr (Run $t @{ color = $BLANCO; tam = $tam; neg = $true })) @{ fill = $CLARET; anchor = 'ctr'; insLR = 160000 })
}
function Enlaces($s, [bool]$oscuro) {
  $lst = @(Lista $s.enlaces)
  if ($lst.Count -eq 0) { return '' }
  $textos = @($lst | ForEach-Object { '→ ' + (Tx $_.texto) })
  $hueco = 120000
  # cada botón en una sola línea: se baja la letra hasta que todos caben en su ancho natural
  $anchos = $null; $tam = 1150
  for ($s2 = 1150; $s2 -ge 850; $s2 -= 50) {
    $nat = @($textos | ForEach-Object { [int]((Em-Palabra $_) * $s2 / 100.0 * (Factor 'Arial' $true) * 1.12 * 12700) + 2 * 110000 + 60000 })
    $sum = ($nat | Measure-Object -Sum).Sum + ($lst.Count - 1) * $hueco
    if ($sum -le $W) {
      # el sobrante se reparte para que la fila no quede corta
      $extra = [int][math]::Min(400000, ($W - $sum) / $lst.Count * 0.35)
      $anchos = @($nat | ForEach-Object { $_ + $extra }); $tam = $s2; break
    }
  }
  if (-not $anchos) {
    $anchos = @(1..$lst.Count | ForEach-Object { [int](($W - ($lst.Count - 1) * $hueco) / $lst.Count) })
    $tam = 1150
    for ($i = 0; $i -lt $lst.Count; $i++) { $tam = [math]::Min($tam, (Ajustar @(@{ t = $textos[$i]; neg = $true }) $anchos[$i] $H_ENL 1150 850 110000 30000)) }
  }
  $x = ''; $cx = $MX
  $fondo = if ($oscuro) { $PAPEL } else { $CARTA }
  for ($i = 0; $i -lt $lst.Count; $i++) {
    $x += Forma $cx $Y_ENL $anchos[$i] $H_ENL (Parr (Run $textos[$i] @{ color = $OXFORD; tam = $tam; neg = $true }) @{ algn = 'ctr' }) @{ fill = $fondo; line = $OXFORD; lineW = 9525; geom = 'roundRect'; adj = 50000; anchor = 'ctr'; url = (Url $lst[$i].href); insLR = 110000; insTB = 30000; nombre = "Enlace $($i + 1)" }
    $cx += $anchos[$i] + $hueco
  }
  $x
}
function Pie([int]$n, [int]$total, [string]$marco, [bool]$oscuro) {
  $c = if ($oscuro) { $GRIS } else { $TINTA2 }
  $linea = if ($oscuro) { '4A4440' } else { $GRIS }
  $izq = "$marco · $($config.version[$script:L]) · $LIC_PIE · $AUTOR"
  (Rect $MX $Y_PIE $W 6350 $linea) +
  (Forma $MX ($Y_PIE + 50000) 6300000 280000 (Parr (Run $izq @{ color = $c; tam = 900 })) @{ anchor = 'ctr'; insLR = 0; insTB = 0 }) +
  (Forma 6950000 ($Y_PIE + 50000) 3900000 280000 (Parr (Run $SITIO_TXT @{ color = $(if ($oscuro) { $PAPEL2 } else { $OXFORD }); tam = 900; neg = $true }) @{ algn = 'r' }) @{ anchor = 'ctr'; insLR = 0; insTB = 0; url = $BASE_URL; nombre = 'Enlace al sitio' }) +
  (Forma 10900000 ($Y_PIE + 50000) ($SW - $MX - 10900000) 280000 (Parr (Run "$n / $total" @{ color = $c; tam = 900; neg = $true }) @{ algn = 'r' }) @{ anchor = 'ctr'; insLR = 0; insTB = 0 })
}
function Slide-Xml([string]$cuerpo, [string]$fondo) {
  "<?xml version=""1.0"" encoding=""UTF-8"" standalone=""yes""?><p:sld $NS><p:cSld><p:bg><p:bgPr><a:solidFill><a:srgbClr val=""$fondo""/></a:solidFill><a:effectLst/></p:bgPr></p:bg><p:spTree><p:nvGrpSpPr><p:cNvPr id=""1"" name=""""/><p:cNvGrpSpPr/><p:nvPr/></p:nvGrpSpPr><p:grpSpPr><a:xfrm><a:off x=""0"" y=""0""/><a:ext cx=""0"" cy=""0""/><a:chOff x=""0"" y=""0""/><a:chExt cx=""0"" cy=""0""/></a:xfrm></p:grpSpPr>$cuerpo</p:spTree></p:cSld><p:clrMapOvr><a:masterClrMapping/></p:clrMapOvr></p:sld>"
}

# lista de viñetas (bullets: {rotulo?, texto, href?} o texto) en una caja; devuelve XML de párrafos ajustado
function Viñetas([object[]]$bullets, [int]$cx, [int]$cy, [int]$max, [int]$min = 1000, [string]$colorBullet = $CLARET) {
  $partes = @(); $items = @()
  foreach ($b in $bullets) {
    $rot = ''; $txt = ''; $href = $null
    if ($b -is [System.Collections.IDictionary] -and ($b.Contains('texto') -or $b.Contains('rotulo'))) { $rot = Tx $b.rotulo; $txt = Tx $b.texto; $href = $b.href } else { $txt = Tx $b }
    $items += , @($rot, $txt, $href)
    $partes += @{ t = $(if ($rot) { "$rot  $txt" } else { $txt }); aft = 700; ind = 18 }
  }
  $tam = Ajustar $partes $cx $cy $max $min
  $aft = [int]($tam * 0.55)
  $x = ''
  foreach ($it in $items) {
    $r = ''
    if ($it[0]) { $r += Run "$($it[0])  " @{ color = $CLARET; tam = $tam; neg = $true } }
    $u = Url $it[2]
    $r += if ($u) { Run $it[1] @{ color = $OXFORD; tam = $tam; url = $u; sub = $true } } else { Run $it[1] @{ color = $TINTA; tam = $tam } }
    $x += Parr $r @{ bullet = $colorBullet; aft = $aft; ind = 228600 }
  }
  $x
}

# =====================================================================================
# Tipos de slide
# =====================================================================================
function Cuerpo-Texto($s, [int]$top, [int]$bot) {
  $bl = @(Lista $s.bullets)
  Forma $MX $top $W ($bot - $top) (Viñetas $bl $W ($bot - $top) 2200 1100) @{}
}
function Cuerpo-Tarjetas($s, [int]$top, [int]$bot) {
  $tj = @(Lista $s.tarjetas); $n = $tj.Count
  $filas = if ($n -le 4) { @($n) } elseif ($n -eq 5) { @(3, 2) } else { @(3, 3) }
  $hueco = 160000; $huecoV = 160000
  $altoFila = [int](($bot - $top - ($filas.Count - 1) * $huecoV) / $filas.Count)
  $cols = ($filas | Measure-Object -Maximum).Maximum
  $ancho = [int](($W - ($cols - 1) * $hueco) / $cols)
  # cabecera con sitio para dos líneas de título; el título nunca baja de 13 pt
  $hCab = if ($filas.Count -gt 1) { 600000 } else { 700000 }
  $maxB = if ($n -le 3) { 2100 } elseif ($n -le 4) { 1900 } else { 1800 }
  $tamT = 2000; $tamB = $maxB
  foreach ($t in $tj) {
    $tamT = [math]::Min($tamT, (Ajustar @(@{ t = (ConFlecha (Tx $t.titulo) ([bool]$t.href)); neg = $true; fam = 'Georgia' }) $ancho $hCab 2000 1300 110000 40000))
  }
  foreach ($t in $tj) {
    $tamB = [math]::Min($tamB, (Ajustar @(@{ t = (Tx $t.texto) }) $ancho ($altoFila - $hCab) $maxB 1000 110000 70000))
  }
  $x = ''; $k = 0
  for ($f = 0; $f -lt $filas.Count; $f++) {
    $y = $top + $f * ($altoFila + $huecoV)
    for ($c = 0; $c -lt $filas[$f]; $c++) {
      $t = $tj[$k]; $col = ColorDe $t.color $k
      $cx = $MX + $c * ($ancho + $hueco)
      $u = Url $t.href
      $tit = ConFlecha (Tx $t.titulo) ([bool]$u)
      $x += Forma $cx $y $ancho $altoFila '' @{ fill = $CARTA; line = $PAPEL2; lineW = 9525; url = $u }
      $x += Forma $cx $y $ancho $hCab (Parr (Run $tit @{ color = $BLANCO; tam = $tamT; neg = $true; fam = 'Georgia' }) @{ lnSpc = 95 }) @{ fill = $col; anchor = 'ctr'; insLR = 110000; insTB = 40000; url = $u }
      $x += Forma $cx ($y + $hCab) $ancho ($altoFila - $hCab) (Parr (Run (Tx $t.texto) @{ color = $TINTA; tam = $tamB })) @{ insLR = 110000; insTB = 70000; url = $u }
      $k++
    }
  }
  $x
}
function Partes-Viñetas([object[]]$bullets) {
  @($bullets | ForEach-Object {
      $rot = ''; $txt = ''
      if ($_ -is [System.Collections.IDictionary] -and ($_.Contains('texto') -or $_.Contains('rotulo'))) { $rot = Tx $_.rotulo; $txt = Tx $_.texto } else { $txt = Tx $_ }
      @{ t = $(if ($rot) { "$rot  $txt" } else { $txt }); aft = 700; ind = 18 } })
}
function Cuerpo-Imagen($s, [int]$top, [int]$bot, [hashtable]$img) {
  $bl = @(Lista $s.bullets)
  $rec = Recorte-De $img.ruta
  $r = Proporcion $img.ruta $rec
  $alto = $bot - $top
  # a) imagen a la izquierda (dos tercios) y viñetas a la derecha
  $wLado = [math]::Min([int]($W * 0.64), [int]($alto * $r))
  # b) imagen apaisada en banda a todo el ancho y viñetas debajo, en dos columnas
  $mitad = [int][math]::Ceiling($bl.Count / 2)
  $cols = @(, @($bl | Select-Object -First $mitad)); if ($bl.Count -gt $mitad) { $cols += , @($bl | Select-Object -Skip $mitad) }
  $anchoCol = [int](($W - 360000) / 2)
  $hB = 0; $tamB = 0
  for ($h = 750000; $h -le [int]($alto * 0.5); $h += 50000) {
    $t = 1700
    foreach ($c in $cols) { $t = [math]::Min($t, (Cabe (Partes-Viñetas $c) $anchoCol $h 1700 1300)); if ($t -eq 0) { break } }
    if ($t -gt 0) { $hB = $h; $tamB = $t; break }
  }
  $wBanda = if ($hB) { [math]::Min($W, [int](($alto - $hB - 150000) * $r)) } else { 0 }
  if ($wBanda -gt $wLado * 1.2) {
    $hImg = $alto - $hB - 150000
    $p = Pic $img.ruta $MX $top $W $hImg $img.descr 'centro' $rec
    $x = $p.xml
    $yb = $top + $hImg + 150000
    for ($i = 0; $i -lt $cols.Count; $i++) {
      $x += Forma ($MX + $i * ($anchoCol + 360000)) $yb $anchoCol ($bot - $yb) (Viñetas $cols[$i] $anchoCol ($bot - $yb) $tamB $tamB) @{}
    }
    return $x
  }
  $p = Pic $img.ruta $MX $top ([int]($W * 0.64)) $alto $img.descr 'centro-v' $rec
  $xt = $p.x + $p.w + 280000
  $ancho = $SW - $MX - $xt
  $p.xml + (Forma $xt $top $ancho $alto (Viñetas $bl $ancho $alto 1800 1000) @{ anchor = 'ctr' })
}
function Cuerpo-Tabla($s, [int]$top, [int]$bot) {
  $cab = @(Lista $s.cabecera | ForEach-Object { Tx $_ })
  $filas = @(Lista $s.filas)
  $nc = $cab.Count
  # anchos de columna según el texto más largo de cada una (mínimo 12 %)
  $peso = @(for ($c = 0; $c -lt $nc; $c++) {
      $m = (Em-Palabra $cab[$c])
      foreach ($f in $filas) { $m = [math]::Max($m, (Em-Palabra (Tx (@($f)[$c])))) }
      [math]::Sqrt([math]::Max($m, 1)) })
  $sumP = ($peso | Measure-Object -Sum).Sum
  $anchos = @($peso | ForEach-Object { [math]::Max(0.12, $_ / $sumP) })
  $sumA = ($anchos | Measure-Object -Sum).Sum
  $anchos = @($anchos | ForEach-Object { [int]($W * $_ / $sumA) })
  $anchos[$nc - 1] = [int]$W - [int](($anchos | Select-Object -First ($nc - 1)) | Measure-Object -Sum).Sum
  $mLR = 82296; $mTB = 36576
  # ninguna columna más estrecha que su palabra más larga a 11 pt (si no, PowerPoint la parte a mitad)
  $minW = @(for ($c = 0; $c -lt $nc; $c++) {
      $mp = 0.0
      foreach ($txt in @($cab[$c]) + @($filas | ForEach-Object { Tx (@($_)[$c]) })) { foreach ($pal in ($txt -split '\s+')) { if ($pal) { $mp = [math]::Max($mp, (Em-Palabra $pal)) } } }
      [int]($mp * 11 * (Factor 'Arial' $true) * 1.1 * 12700 + 2 * $mLR + 20000) })
  for ($k = 0; $k -lt 3; $k++) {
    $faltan = 0; $libres = 0
    for ($c = 0; $c -lt $nc; $c++) { if ($anchos[$c] -lt $minW[$c]) { $faltan += $minW[$c] - $anchos[$c]; $anchos[$c] = $minW[$c] } else { $libres += $anchos[$c] - $minW[$c] } }
    if ($faltan -le 0 -or $libres -le 0) { break }
    for ($c = 0; $c -lt $nc; $c++) { if ($anchos[$c] -gt $minW[$c]) { $anchos[$c] -= [int]($faltan * ($anchos[$c] - $minW[$c]) / $libres) } }
  }
  $anchos[$nc - 1] = [int]$W - [int](($anchos | Select-Object -First ($nc - 1)) | Measure-Object -Sum).Sum
  $alto = $bot - $top
  $tam = 1100; $altosF = @()
  # medida prudente: PowerPoint ocupa algo más que la estimación en las tablas
  $holg = 1.08
  for ($s2 = 1800; $s2 -ge 800; $s2 -= 50) {
    $tot = 0; $altosF = @()
    $lineasCab = 1
    for ($c = 0; $c -lt $nc; $c++) { $lineasCab = [math]::Max($lineasCab, (Lineas $cab[$c] (($anchos[$c] - 2 * $mLR) / 12700.0) ($s2 / 100.0) ((Factor 'Arial' $true) * $holg))) }
    $hc = [int]($lineasCab * $s2 / 100.0 * 1.22 * 12700 + 2 * $mTB + 16000); $altosF += $hc; $tot += $hc
    foreach ($f in $filas) {
      $l = 1
      for ($c = 0; $c -lt $nc; $c++) { $l = [math]::Max($l, (Lineas (Tx (@($f)[$c])) (($anchos[$c] - 2 * $mLR) / 12700.0) ($s2 / 100.0) ((Factor 'Arial' ($c -eq 0)) * $holg))) }
      $hf = [int]($l * $s2 / 100.0 * 1.22 * 12700 + 2 * $mTB + 16000); $altosF += $hf; $tot += $hf
    }
    $tam = $s2
    if ($tot -le $alto -and $l -lt 999) { break }
  }
  if ($tot -gt $alto) { $script:avisosAjuste.Add('tabla muy larga para su caja') }
  # reparto de parte del alto sobrante entre las filas de datos, para ocupar la zona con aire sin rozar lo de abajo
  $sobra = [int](($alto - $tot) * 0.8)
  if ($sobra -gt 0 -and $filas.Count -gt 0) { $extra = [int][math]::Min($sobra / $filas.Count, 300000); for ($i = 1; $i -lt $altosF.Count; $i++) { $altosF[$i] += $extra } }
  $grid = ($anchos | ForEach-Object { "<a:gridCol w=""$_""/>" }) -join ''
  function Celda([string]$runs, [string]$fill, [string]$lineaB) {
    "<a:tc><a:txBody><a:bodyPr/><a:lstStyle/>$(Parr $runs)</a:txBody><a:tcPr marL=""$mLR"" marR=""$mLR"" marT=""$mTB"" marB=""$mTB"" anchor=""ctr""><a:lnL w=""0""><a:noFill/></a:lnL><a:lnR w=""0""><a:noFill/></a:lnR><a:lnT w=""0""><a:noFill/></a:lnT><a:lnB w=""9525""><a:solidFill><a:srgbClr val=""$lineaB""/></a:solidFill></a:lnB><a:solidFill><a:srgbClr val=""$fill""/></a:solidFill></a:tcPr></a:tc>"
  }
  $trs = "<a:tr h=""$($altosF[0])"">" + (($cab | ForEach-Object { Celda (Run $_ @{ color = $BLANCO; tam = $tam; neg = $true }) $CLARET $CLARET }) -join '') + '</a:tr>'
  for ($r = 0; $r -lt $filas.Count; $r++) {
    $fill = if ($r % 2 -eq 0) { $CARTA } else { 'F8E3D2' }
    $trs += "<a:tr h=""$($altosF[$r + 1])"">"
    for ($c = 0; $c -lt $nc; $c++) {
      $cel = @($filas[$r])[$c]
      $u = $null; if ($cel -is [System.Collections.IDictionary] -and $cel.Contains('href')) { $u = Url $cel.href }
      $runs = if ($u) { Run (Tx $cel) @{ color = $OXFORD; tam = $tam; neg = ($c -eq 0); url = $u; sub = $true } } else { Run (Tx $cel) @{ color = $(if ($c -eq 0) { $NEGRO } else { $TINTA }); tam = $tam; neg = ($c -eq 0) } }
      $trs += Celda $runs $fill $GRIS
    }
    $trs += '</a:tr>'
  }
  $id = NuevoId
  $altoTot = ($altosF | Measure-Object -Sum).Sum
  "<p:graphicFrame><p:nvGraphicFramePr><p:cNvPr id=""$id"" name=""Tabla $id""/><p:cNvGraphicFramePr><a:graphicFrameLocks noGrp=""1""/></p:cNvGraphicFramePr><p:nvPr/></p:nvGraphicFramePr><p:xfrm><a:off x=""$MX"" y=""$top""/><a:ext cx=""$W"" cy=""$altoTot""/></p:xfrm><a:graphic><a:graphicData uri=""http://schemas.openxmlformats.org/drawingml/2006/table""><a:tbl><a:tblPr firstRow=""1"" bandRow=""1""/><a:tblGrid>$grid</a:tblGrid>$trs</a:tbl></a:graphicData></a:graphic></p:graphicFrame>"
}
function Cuerpo-Proceso($s, [int]$top, [int]$bot) {
  $ps = @(Lista $s.pasos); $n = $ps.Count
  # con 7 u 8 pasos, dos filas de 4: columnas el doble de anchas y ninguna palabra partida
  $porFila = if ($n -ge 7) { [int][math]::Ceiling($n / 2) } else { $n }
  $nFilas = [int][math]::Ceiling($n / $porFila)
  $gap = if ($porFila -ge 6) { 220000 } else { 280000 }
  $gapV = 200000
  $ancho = [int](($W - ($porFila - 1) * $gap) / $porFila)
  $hRot = if ($nFilas -gt 1) { 360000 } else { 420000 }
  $hFila = [int](($bot - $top - ($nFilas - 1) * $gapV) / $nFilas)
  $hCaja = $hFila - $hRot - 70000
  $maxB = if ($porFila -le 4) { 1900 } elseif ($porFila -le 5) { 1700 } else { 1600 }
  $insLR = if ($porFila -ge 6) { 70000 } else { 90000 }
  $tamR = 1600
  foreach ($p in $ps) {
    $tamR = [math]::Min($tamR, (Ajustar @(@{ t = (Tx $p.rotulo); neg = $true }) $ancho $hRot 1600 1000 60000 20000))
  }
  # el título se ajusta solo (una palabra larga no debe encoger el texto); el texto, en el alto que deja el título
  $anchoPt = ($ancho - 2 * $insLR) / 12700.0
  $tamT = [int]($maxB * 1.08)
  foreach ($p in $ps) { $tamT = [math]::Min($tamT, (Ajustar @(@{ t = (Tx $p.titulo); neg = $true; fam = 'Georgia' }) $ancho ([int]($hCaja * 0.4)) ([int]($maxB * 1.08)) 900 $insLR 20000)) }
  $tamB = $maxB
  foreach ($p in $ps) {
    $lt = Lineas (Tx $p.titulo) $anchoPt ($tamT / 100.0) (Factor 'Georgia' $true)
    $hT = [int]($lt * $tamT / 100.0 * 1.2 * 12700 + $tamT / 2.0 * 127)
    $tamB = [math]::Min($tamB, (Ajustar @(@{ t = (Tx $p.texto) }) $ancho ($hCaja - $hT) $maxB 900 $insLR 80000))
  }
  $tamT = [int][math]::Min($tamT, [math]::Max($tamB * 1.25, 1000))
  $x = ''
  for ($i = 0; $i -lt $n; $i++) {
    $p = $ps[$i]; $col = if ($p.color) { ColorDe $p.color } else { $OXFORD }
    $fila = [math]::Floor($i / $porFila); $k = $i % $porFila
    $cx = $MX + $k * ($ancho + $gap)
    $yRot = $top + $fila * ($hFila + $gapV)
    $yCaja = $yRot + $hRot + 70000
    $x += Forma $cx $yRot $ancho $hRot (Parr (Run (Tx $p.rotulo) @{ color = $BLANCO; tam = $tamR; neg = $true }) @{ algn = 'ctr' }) @{ fill = $col; geom = 'roundRect'; adj = 30000; anchor = 'ctr'; insLR = 60000; insTB = 20000 }
    $parr = (Parr (Run (Tx $p.titulo) @{ color = $col; tam = $tamT; neg = $true; fam = 'Georgia' }) @{ aft = [int]($tamT * 0.5) }) + (Parr (Run (Tx $p.texto) @{ color = $TINTA; tam = $tamB }))
    $x += Forma $cx $yCaja $ancho $hCaja $parr @{ fill = $CARTA; line = $col; lineW = 12700; insLR = $insLR; insTB = 80000 }
    $x += Rect $cx $yCaja $ancho 50000 $col
    if ($i -lt $n - 1) {
      $aw = [int]($gap * 0.62); $ah = 240000
      if ($k -lt $porFila - 1) {
        $x += Rect ($cx + $ancho + [int](($gap - $aw) / 2)) ($yCaja + [int]($hCaja / 2) - [int]($ah / 2)) $aw $ah $CLARET 'rightArrow'
      } else {
        # fin de fila: la flecha sale por el margen derecho y vuelve a entrar por el izquierdo en la fila siguiente
        $x += Rect ($SW - $MX + 70000) ($yCaja + [int]($hCaja / 2) - [int]($ah / 2)) $aw $ah $CLARET 'rightArrow'
        $yCaja2 = $yCaja + $hFila + $gapV
        $x += Rect ($MX - 70000 - $aw) ($yCaja2 + [int]($hCaja / 2) - [int]($ah / 2)) $aw $ah $CLARET 'rightArrow'
      }
    }
  }
  $x
}
function Cuerpo-Comparacion($s, [int]$top, [int]$bot) {
  $gap = 360000
  $ancho = [int](($W - $gap) / 2)
  $lados = @($s.izquierda, $s.derecha)
  $hCab = 600000
  $tamT = 2000; $tamB = 1800
  foreach ($l in $lados) {
    $tamT = [math]::Min($tamT, (Ajustar @(@{ t = (Tx $l.titulo); neg = $true; fam = 'Georgia' }) $ancho $hCab 2000 1200 140000))
    $partes = @(Lista $l.bullets | ForEach-Object { @{ t = (Tx $_); aft = 700; ind = 18 } })
    $tamB = [math]::Min($tamB, (Ajustar $partes $ancho ($bot - $top - $hCab) 1800 1000 140000 100000))
  }
  $x = ''
  for ($i = 0; $i -lt 2; $i++) {
    $l = $lados[$i]; $col = ColorDe $l.color $(if ($i -eq 0) { 3 } else { 1 })
    $cx = $MX + $i * ($ancho + $gap)
    $x += Forma $cx $top $ancho $hCab (Parr (Run (Tx $l.titulo) @{ color = $BLANCO; tam = $tamT; neg = $true; fam = 'Georgia' })) @{ fill = $col; anchor = 'ctr'; insLR = 140000 }
    $parr = (@(Lista $l.bullets) | ForEach-Object { Parr (Run (Tx $_) @{ color = $TINTA; tam = $tamB }) @{ bullet = $col; aft = [int]($tamB * 0.55); ind = 228600 } }) -join ''
    $x += Forma $cx ($top + $hCab) $ancho ($bot - $top - $hCab) $parr @{ fill = $CARTA; line = $col; lineW = 12700; insLR = 140000; insTB = 100000 }
  }
  # «frente a» entre las dos columnas
  $x += Forma ($MX + $ancho + 40000) ($top + 120000) ($gap - 80000) 360000 (Parr (Run '↔' @{ color = $CLARET; tam = 2000; neg = $true }) @{ algn = 'ctr' }) @{ anchor = 'ctr'; insLR = 0; insTB = 0 }
  $x
}
function Cuerpo-Cita($s, [int]$top, [int]$bot) {
  $texto = Tx $s.texto; $apoyo = Tx $s.apoyo
  $xq = $MX + 900000; $ancho = $W - 900000
  $alto = $bot - $top
  $hT = if ($apoyo) { [int]($alto * 0.66) } else { $alto }
  $tamT = Ajustar @(@{ t = ([string][char]0x201C + $texto + [char]0x201D); fam = 'Georgia'; neg = $false }) $ancho $hT 3200 1600 0
  $x = Forma $MX ($top - 120000) 800000 1100000 (Parr (Run '“' @{ color = $CLARET; tam = 9600; neg = $true; fam = 'Georgia' })) @{ insLR = 0; insTB = 0 }
  $x += Rect ($MX + 700000) ($top + 80000) 38100 ($hT - 160000) $CLARET
  $x += Forma $xq $top $ancho $hT (Parr (Run $texto @{ color = $NEGRO; tam = $tamT; ita = $true; fam = 'Georgia' }) @{ lnSpc = 105 }) @{ anchor = 'ctr'; insLR = 0 }
  if ($apoyo) {
    $tamA = Ajustar @(@{ t = $apoyo }) $ancho ($alto - $hT) 1700 1100 0
    $x += Forma $xq ($top + $hT) $ancho ($alto - $hT) (Parr (Run $apoyo @{ color = $TINTA2; tam = $tamA })) @{ anchor = 't'; insLR = 0 }
  }
  $x
}
function Cuerpo-Poster($s, [int]$top, [int]$bot, $img) {
  $bl = @(Lista $s.bloques); $n = $bl.Count
  $hueco = 160000
  $areaX = $MX; $areaW = $W; $bTop = $top; $bBot = $bot
  $x = ''
  $partesDe = { param($b) @(@{ t = (ConFlecha (Tx $b.titulo) ([bool]$b.href)); neg = $true; fam = 'Georgia'; esc = 1.12; aft = 300 }, @{ t = (Tx $b.texto) }) }
  $cols = if ($n -eq 4) { 2 } else { 3 }
  if ($img) {
    $rec = Recorte-De $img.ruta
    $r = Proporcion $img.ruta $rec
    # banda: imagen a todo el ancho arriba y bloques en rejilla debajo. Se prueban rejillas (todos en una fila, o 3 columnas)
    # y se queda la que deja más alto a la imagen. Columna: imagen al 42 % a la derecha. Gana la que da más superficie a la imagen.
    $mejor = $null
    foreach ($cc in @(@($n, $(if ($n -eq 4) { 4 } else { 3 })) | Select-Object -Unique)) {
      if ($cc -gt 6) { continue }
      $fb = [int][math]::Ceiling($n / $cc)
      $aB = [int](($W - ($cc - 1) * $hueco) / $cc)
      $hB = 0
      for ($h = 500000; $h -le [int](($bot - $top) * 0.75 / $fb); $h += 25000) {
        $ok = $true
        foreach ($b in $bl) { if (-not (Cabe (& $partesDe $b) $aB ($h - 50000) 1000 1000 100000 70000)) { $ok = $false; break } }
        if ($ok) { $hB = $h; break }
      }
      if (-not $hB) { continue }
      $hI = $bot - $top - $fb * $hB - ($fb - 1) * $hueco - 150000
      if (-not $mejor -or $hI -gt $mejor.hI) { $mejor = @{ cols = $cc; filas = $fb; hB = $hB; hI = $hI } }
    }
    $supBanda = if ($mejor) { $wI = [math]::Min($W, $mejor.hI * $r); $wI * ($wI / $r) } else { 0 }
    $anchoCol = $W * 0.42
    $hCol = [math]::Min($bot - $top, $anchoCol / $r)
    $supCol = ($hCol * $r) * $hCol
    if ($r -ge 2.2 -or $supBanda -ge 0.85 * $supCol) {
      if (-not $mejor) { $mejor = @{ cols = 3; filas = [int][math]::Ceiling($n / 3); hI = [int](($bot - $top) * 0.25) } }
      $cols = $mejor.cols
      $hImg = $mejor.hI
      $p = Pic $img.ruta $MX $top $W $hImg $img.descr 'centro' $rec
      $x += $p.xml
      $bTop = $top + $hImg + 150000
    } else {
      # imagen más cuadrada: columna a la derecha del 42 % del ancho; bloques en dos columnas
      $anchoImg = [int]($W * 0.42)
      $p = Pic $img.ruta ($SW - $MX - $anchoImg) $top $anchoImg ($bot - $top) $img.descr 'centro' $rec
      $x += $p.xml
      $areaW = $SW - $MX - $anchoImg - 240000 - $MX
      $cols = 2
    }
  }
  $filas = [int][math]::Ceiling($n / $cols)
  $ancho = [int](($areaW - ($cols - 1) * $hueco) / $cols)
  $alto = [int](($bBot - $bTop - ($filas - 1) * $hueco) / $filas)
  $tam = 1600
  foreach ($b in $bl) { $tam = [math]::Min($tam, (Ajustar (& $partesDe $b) $ancho ($alto - 50000) 1600 900 100000 70000)) }
  for ($i = 0; $i -lt $n; $i++) {
    $b = $bl[$i]; $col = ColorDe $b.color $i
    $f = [math]::Floor($i / $cols); $c = $i % $cols
    $cx = $areaX + $c * ($ancho + $hueco); $cy = $bTop + $f * ($alto + $hueco)
    $u = Url $b.href
    $tit = ConFlecha (Tx $b.titulo) ([bool]$u)
    $parr = (Parr (Run $tit @{ color = $col; tam = [int]($tam * 1.12); neg = $true; fam = 'Georgia' }) @{ aft = [int]($tam * 0.3) }) + (Parr (Run (Tx $b.texto) @{ color = $TINTA; tam = $tam }))
    $x += Rect $cx $cy $ancho 50000 $col
    $x += Forma $cx ($cy + 50000) $ancho ($alto - 50000) $parr @{ fill = $CARTA; insLR = 100000; insTB = 70000; url = $u }
  }
  $x
}
function Slide-Portada($s, [int]$n, [int]$total, $img) {
  $titulo = Tx $s.titulo; $sub = Tx $s.sub; $pub = Tx $s.publico
  $x = (Rect 0 0 228600 $SH $CLARET) + (Kicker $script:presTitulo $false)
  $anchoT = if ($img) { 6300000 } else { $W }
  if ($img) {
    $p = Pic $img.ruta 7150000 1250000 ($SW - $MX - 7150000) 3900000 $img.descr 'centro'
    $x += $p.xml
  }
  $tt = Ajustar @(@{ t = $titulo; neg = $true; fam = 'Georgia' }) $anchoT 1750000 4800 2600
  $x += Forma $MX 900000 $anchoT 1750000 (Parr (Run $titulo @{ color = $NEGRO; tam = $tt; neg = $true; fam = 'Georgia' }) @{ lnSpc = 90 }) @{ anchor = 'b' }
  $x += Rect $MX 2760000 1400000 38100 $CLARET
  $y = 2920000
  if ($pub) {
    # la píldora «para quién» va en una sola línea: se baja la letra antes que partirla
    $tp = 1400
    while ($tp -gt 1000 -and ([int]((Em-Palabra $pub) * $tp / 100.0 * (Factor 'Arial' $true) * 1.12 * 12700) + 340000) -gt $anchoT) { $tp -= 50 }
    $wPub = [math]::Min($anchoT, [int]((Em-Palabra $pub) * $tp / 100.0 * (Factor 'Arial' $true) * 1.12 * 12700) + 340000)
    if ($tp -le 1000) { $tp = Ajustar @(@{ t = $pub; neg = $true }) $wPub 460000 1000 900 150000 20000 }
    $x += Forma $MX $y $wPub 460000 (Parr (Run $pub @{ color = $BLANCO; tam = $tp; neg = $true })) @{ fill = $CLARET; geom = 'roundRect'; adj = 50000; anchor = 'ctr'; insLR = 150000; insTB = 20000 }
    $y += 620000
  }
  if ($sub) {
    $bot = (Fondo $s)
    $ts = Ajustar @(@{ t = $sub }) $anchoT ($bot - $y) 2200 1300
    $x += Forma $MX $y $anchoT ($bot - $y) (Parr (Run $sub @{ color = $TINTA; tam = $ts })) @{}
  }
  $x += (Destacado $s) + (Enlaces $s $false) + (Pie $n $total $script:marco $false)
  Slide-Xml $x $PAPEL
}
function Slide-Seccion($s, [int]$n, [int]$total) {
  $rot = Tx $s.rotulo; $titulo = Tx $s.titulo; $texto = Tx $s.texto; $sub = Tx $s.sub
  $x = (Kicker $script:presTitulo $true)
  $y = 1550000
  if ($rot) {
    $wR = [math]::Min($W, [int]((Em-Palabra $rot.ToUpperInvariant()) * 13 * (Factor 'Arial' $true) * 1.15 * 12700) + 380000)
    $x += Forma $MX $y $wR 440000 (Parr (Run $rot.ToUpperInvariant() @{ color = $BLANCO; tam = 1300; neg = $true })) @{ fill = $CLARET; anchor = 'ctr'; insLR = 150000; insTB = 20000 }
  }
  $y += 600000
  $tt = Ajustar @(@{ t = $titulo; neg = $true; fam = 'Georgia' }) $W 1400000 4400 2600
  $x += Forma $MX $y $W 1400000 (Parr (Run $titulo @{ color = $PAPEL; tam = $tt; neg = $true; fam = 'Georgia' }) @{ lnSpc = 92 }) @{ anchor = 't' }
  $y += 1480000
  $x += Rect $MX $y 1400000 25400 $CLARET
  $y += 150000
  $bot = Fondo $s
  $partes = @(); $parr = ''
  if ($texto) { $partes += @{ t = $texto; aft = 600 } }
  if ($sub) { $partes += @{ t = $sub; esc = 0.85 } }
  if ($partes.Count) {
    $ts = Ajustar $partes $W ($bot - $y) 2200 1300
    if ($texto) { $parr += Parr (Run $texto @{ color = $PAPEL2; tam = $ts }) @{ aft = [int]($ts * 0.6) } }
    if ($sub) { $parr += Parr (Run $sub @{ color = $GRIS; tam = [int]($ts * 0.85) }) }
    $x += Forma $MX $y $W ($bot - $y) $parr @{}
  }
  $x += (Destacado $s) + (Enlaces $s $true) + (Pie $n $total $script:marco $true)
  Slide-Xml $x $NEGRO
}
function Slide-Normal($s, [int]$n, [int]$total, $img) {
  $kick = if ($s.tipo -eq 'poster' -and $s.antetitulo) { Tx $s.antetitulo } else { $script:presTitulo }
  $cab = Cabecera $s
  $top = $cab.top; $bot = Fondo $s
  $cuerpo = switch ($s.tipo) {
    'texto' { Cuerpo-Texto $s $top $bot }
    'tarjetas' { Cuerpo-Tarjetas $s $top $bot }
    'imagen' { Cuerpo-Imagen $s $top $bot $img }
    'tabla' { Cuerpo-Tabla $s $top $bot }
    'proceso' { Cuerpo-Proceso $s $top $bot }
    'comparacion' { Cuerpo-Comparacion $s $top $bot }
    'cita' { Cuerpo-Cita $s $top $bot }
    'poster' { Cuerpo-Poster $s $top $bot $img }
  }
  $x = (Rect 0 0 $SW 64000 $CLARET) + (Kicker $kick $false) + $cab.xml + $cuerpo + (Destacado $s) + (Enlaces $s $false) + (Pie $n $total $script:marco $false)
  Slide-Xml $x $PAPEL
}

# =====================================================================================
# Notas del orador
# =====================================================================================
# bloques de notas: lista de @{ tipo = 'p'|'li'; texto }
function Bloques-Notas([string]$t) {
  $out = [Collections.Generic.List[object]]::new()
  foreach ($par in ($t -replace "`r", '' -split "`n\s*`n")) {
    $acum = ''
    foreach ($lin in ($par -split "`n")) {
      if ($lin -match '^\s*-\s+(.*)$') {
        if ($acum) { $out.Add(@{ tipo = 'p'; texto = $acum.Trim() }); $acum = '' }
        $out.Add(@{ tipo = 'li'; texto = $Matches[1].Trim() })
      } elseif ($lin.Trim()) { $acum += ' ' + $lin.Trim() }
    }
    if ($acum) { $out.Add(@{ tipo = 'p'; texto = $acum.Trim() }) }
  }
  $out
}
# fuentes y enlaces de una slide, sin repetidos: lista de @{ texto; url }
function Fuentes-Slide($s) {
  $vistas = @{}; $out = [Collections.Generic.List[object]]::new()
  foreach ($f in (@(Lista $s.fuentes) + @(Lista $s.enlaces))) {
    $u = Url $f.href; $t = Tx $f.texto
    if (-not $u -or $vistas.ContainsKey("$t|$u")) { continue }
    $vistas["$t|$u"] = $true; $out.Add(@{ texto = $t; url = $u })
  }
  $out
}
function Notas-Xml($s, [bool]$ultima) {
  $p = ''
  foreach ($b in (Bloques-Notas (Tx $s.notas))) {
    if ($b.tipo -eq 'li') { $p += Parr (Run $b.texto @{ color = $NEGRO; tam = 1200 }) @{ bullet = $NEGRO; ind = 228600; aft = 300 } }
    else { $p += Parr (Run $b.texto @{ color = $NEGRO; tam = 1200 }) @{ aft = 600 } }
  }
  $p += Parr (Run $TX[$script:L].fuentes @{ color = $NEGRO; tam = 1200; neg = $true }) @{ bef = 600; aft = 300 }
  foreach ($f in (Fuentes-Slide $s)) {
    $p += Parr ((Run "$($f.texto): " @{ color = $NEGRO; tam = 1100 }) + (Run $f.url @{ color = $OXFORD; tam = 1100; url = $f.url; sub = $true })) @{ bullet = $NEGRO; ind = 228600; aft = 200 }
  }
  if ($ultima) { $p += Parr (Run $AVISO[$script:L] @{ color = $NEGRO; tam = 1000; ita = $true }) @{ bef = 900 } }
  "<?xml version=""1.0"" encoding=""UTF-8"" standalone=""yes""?><p:notes $NS><p:cSld><p:spTree><p:nvGrpSpPr><p:cNvPr id=""1"" name=""""/><p:cNvGrpSpPr/><p:nvPr/></p:nvGrpSpPr><p:grpSpPr><a:xfrm><a:off x=""0"" y=""0""/><a:ext cx=""0"" cy=""0""/><a:chOff x=""0"" y=""0""/><a:chExt cx=""0"" cy=""0""/></a:xfrm></p:grpSpPr><p:sp><p:nvSpPr><p:cNvPr id=""2"" name=""Imagen de diapositiva 1""/><p:cNvSpPr><a:spLocks noGrp=""1"" noRot=""1"" noChangeAspect=""1""/></p:cNvSpPr><p:nvPr><p:ph type=""sldImg""/></p:nvPr></p:nvSpPr><p:spPr/></p:sp><p:sp><p:nvSpPr><p:cNvPr id=""3"" name=""Notas 2""/><p:cNvSpPr><a:spLocks noGrp=""1""/></p:cNvSpPr><p:nvPr><p:ph type=""body"" idx=""1""/></p:nvPr></p:nvSpPr><p:spPr/><p:txBody><a:bodyPr/><a:lstStyle/>$p</p:txBody></p:sp></p:spTree></p:cSld><p:clrMapOvr><a:masterClrMapping/></p:clrMapOvr></p:notes>"
}

# =====================================================================================
# Paquete PPTX
# =====================================================================================
$theme = @"
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<a:theme xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" name="SEVEN-G"><a:themeElements><a:clrScheme name="SEVEN-G"><a:dk1><a:srgbClr val="$NEGRO"/></a:dk1><a:lt1><a:srgbClr val="$PAPEL"/></a:lt1><a:dk2><a:srgbClr val="$TINTA"/></a:dk2><a:lt2><a:srgbClr val="FFFFFF"/></a:lt2><a:accent1><a:srgbClr val="$CLARET"/></a:accent1><a:accent2><a:srgbClr val="$OXFORD"/></a:accent2><a:accent3><a:srgbClr val="$TEAL"/></a:accent3><a:accent4><a:srgbClr val="$VELVET"/></a:accent4><a:accent5><a:srgbClr val="$ORO"/></a:accent5><a:accent6><a:srgbClr val="$VERDE"/></a:accent6><a:hlink><a:srgbClr val="$OXFORD"/></a:hlink><a:folHlink><a:srgbClr val="$VELVET"/></a:folHlink></a:clrScheme><a:fontScheme name="SEVEN-G"><a:majorFont><a:latin typeface="Georgia"/><a:ea typeface=""/><a:cs typeface=""/></a:majorFont><a:minorFont><a:latin typeface="Arial"/><a:ea typeface=""/><a:cs typeface=""/></a:minorFont></a:fontScheme><a:fmtScheme name="SEVEN-G"><a:fillStyleLst><a:solidFill><a:schemeClr val="phClr"/></a:solidFill><a:solidFill><a:schemeClr val="phClr"/></a:solidFill><a:solidFill><a:schemeClr val="phClr"/></a:solidFill></a:fillStyleLst><a:lnStyleLst><a:ln w="9525"><a:solidFill><a:schemeClr val="phClr"/></a:solidFill></a:ln><a:ln w="12700"><a:solidFill><a:schemeClr val="phClr"/></a:solidFill></a:ln><a:ln w="19050"><a:solidFill><a:schemeClr val="phClr"/></a:solidFill></a:ln></a:lnStyleLst><a:effectStyleLst><a:effectStyle><a:effectLst/></a:effectStyle><a:effectStyle><a:effectLst/></a:effectStyle><a:effectStyle><a:effectLst/></a:effectStyle></a:effectStyleLst><a:bgFillStyleLst><a:solidFill><a:schemeClr val="phClr"/></a:solidFill><a:solidFill><a:schemeClr val="phClr"/></a:solidFill><a:solidFill><a:schemeClr val="phClr"/></a:solidFill></a:bgFillStyleLst></a:fmtScheme></a:themeElements></a:theme>
"@
$slideLayout = "<?xml version=""1.0"" encoding=""UTF-8"" standalone=""yes""?><p:sldLayout $NS type=""blank"" preserve=""1""><p:cSld name=""Blank""><p:spTree><p:nvGrpSpPr><p:cNvPr id=""1"" name=""""/><p:cNvGrpSpPr/><p:nvPr/></p:nvGrpSpPr><p:grpSpPr><a:xfrm><a:off x=""0"" y=""0""/><a:ext cx=""0"" cy=""0""/><a:chOff x=""0"" y=""0""/><a:chExt cx=""0"" cy=""0""/></a:xfrm></p:grpSpPr></p:spTree></p:cSld><p:clrMapOvr><a:masterClrMapping/></p:clrMapOvr></p:sldLayout>"
$slideMaster = "<?xml version=""1.0"" encoding=""UTF-8"" standalone=""yes""?><p:sldMaster $NS><p:cSld><p:bg><p:bgPr><a:solidFill><a:schemeClr val=""lt1""/></a:solidFill><a:effectLst/></p:bgPr></p:bg><p:spTree><p:nvGrpSpPr><p:cNvPr id=""1"" name=""""/><p:cNvGrpSpPr/><p:nvPr/></p:nvGrpSpPr><p:grpSpPr><a:xfrm><a:off x=""0"" y=""0""/><a:ext cx=""0"" cy=""0""/><a:chOff x=""0"" y=""0""/><a:chExt cx=""0"" cy=""0""/></a:xfrm></p:grpSpPr></p:spTree></p:cSld><p:clrMap bg1=""lt1"" tx1=""dk1"" bg2=""lt2"" tx2=""dk2"" accent1=""accent1"" accent2=""accent2"" accent3=""accent3"" accent4=""accent4"" accent5=""accent5"" accent6=""accent6"" hlink=""hlink"" folHlink=""folHlink""/><p:sldLayoutIdLst><p:sldLayoutId id=""2147483649"" r:id=""rId1""/></p:sldLayoutIdLst></p:sldMaster>"
$notesMaster = "<?xml version=""1.0"" encoding=""UTF-8"" standalone=""yes""?><p:notesMaster $NS><p:cSld><p:bg><p:bgPr><a:solidFill><a:srgbClr val=""FFFFFF""/></a:solidFill><a:effectLst/></p:bgPr></p:bg><p:spTree><p:nvGrpSpPr><p:cNvPr id=""1"" name=""""/><p:cNvGrpSpPr/><p:nvPr/></p:nvGrpSpPr><p:grpSpPr><a:xfrm><a:off x=""0"" y=""0""/><a:ext cx=""0"" cy=""0""/><a:chOff x=""0"" y=""0""/><a:chExt cx=""0"" cy=""0""/></a:xfrm></p:grpSpPr><p:sp><p:nvSpPr><p:cNvPr id=""2"" name=""Imagen de diapositiva""/><p:cNvSpPr><a:spLocks noGrp=""1"" noRot=""1"" noChangeAspect=""1""/></p:cNvSpPr><p:nvPr><p:ph type=""sldImg"" idx=""2""/></p:nvPr></p:nvSpPr><p:spPr><a:xfrm><a:off x=""381000"" y=""685800""/><a:ext cx=""6096000"" cy=""3429000""/></a:xfrm><a:prstGeom prst=""rect""><a:avLst/></a:prstGeom><a:noFill/><a:ln w=""12700""><a:solidFill><a:srgbClr val=""000000""/></a:solidFill></a:ln></p:spPr></p:sp><p:sp><p:nvSpPr><p:cNvPr id=""3"" name=""Notas""/><p:cNvSpPr><a:spLocks noGrp=""1""/></p:cNvSpPr><p:nvPr><p:ph type=""body"" sz=""quarter"" idx=""3""/></p:nvPr></p:nvSpPr><p:spPr><a:xfrm><a:off x=""685800"" y=""4343400""/><a:ext cx=""5486400"" cy=""4114800""/></a:xfrm><a:prstGeom prst=""rect""><a:avLst/></a:prstGeom></p:spPr><p:txBody><a:bodyPr vert=""horz"" lIns=""91440"" tIns=""45720"" rIns=""91440"" bIns=""45720"" rtlCol=""0""><a:normAutofit/></a:bodyPr><a:lstStyle/><a:p><a:endParaRPr lang=""es-ES""/></a:p></p:txBody></p:sp></p:spTree></p:cSld><p:clrMap bg1=""lt1"" tx1=""dk1"" bg2=""lt2"" tx2=""dk2"" accent1=""accent1"" accent2=""accent2"" accent3=""accent3"" accent4=""accent4"" accent5=""accent5"" accent6=""accent6"" hlink=""hlink"" folHlink=""folHlink""/><p:notesStyle><a:lvl1pPr marL=""0"" algn=""l"" defTabSz=""914400"" rtl=""0"" eaLnBrk=""1"" latinLnBrk=""0"" hangingPunct=""1""><a:defRPr sz=""1200"" kern=""1200""><a:solidFill><a:schemeClr val=""tx1""/></a:solidFill><a:latin typeface=""+mn-lt""/><a:ea typeface=""+mn-ea""/><a:cs typeface=""+mn-cs""/></a:defRPr></a:lvl1pPr></p:notesStyle></p:notesMaster>"

function Rels-Xml([object[]]$fijas, [object[]]$lista) {
  $r = ''
  foreach ($f in @($fijas) + @($lista)) {
    if (-not $f) { continue }
    $tm = if ($f.externo) { ' TargetMode="External"' } else { '' }
    $r += "<Relationship Id=""$($f.id)"" Type=""$($f.tipo)"" Target=""$(Xml $f.target)""$tm/>"
  }
  "<?xml version=""1.0"" encoding=""UTF-8"" standalone=""yes""?><Relationships xmlns=""http://schemas.openxmlformats.org/package/2006/relationships"">$r</Relationships>"
}
function RelFija([string]$id, [string]$tipo, [string]$target) { [pscustomobject]@{ id = $id; tipo = "http://schemas.openxmlformats.org/officeDocument/2006/relationships/$tipo"; target = $target; externo = $false } }

# $slides: lista de @{ xml; rels; notas; notasRels }
function Escribir-Pptx([string]$ruta, [object[]]$slides, [hashtable]$props) {
  New-Item -ItemType Directory -Force (Split-Path $ruta) | Out-Null
  if (Test-Path $ruta) { [IO.File]::Delete($ruta) }
  $zip = [IO.Compression.ZipFile]::Open($ruta, [IO.Compression.ZipArchiveMode]::Create)
  try {
    $add = {
      param([string]$nombre, $contenido)
      $e = $zip.CreateEntry($nombre, [IO.Compression.CompressionLevel]::Optimal); $e.LastWriteTime = $fechaFija
      $st = $e.Open()
      $b = if ($contenido -is [byte[]]) { $contenido } else { $utf8.GetBytes([string]$contenido) }
      $st.Write($b, 0, $b.Length); $st.Dispose()
    }
    $n = $slides.Count
    $ov = ''; $presRels = ''; $sldIds = ''
    for ($i = 1; $i -le $n; $i++) {
      $ov += "<Override PartName=""/ppt/slides/slide$i.xml"" ContentType=""application/vnd.openxmlformats-officedocument.presentationml.slide+xml""/><Override PartName=""/ppt/notesSlides/notesSlide$i.xml"" ContentType=""application/vnd.openxmlformats-officedocument.presentationml.notesSlide+xml""/>"
      $presRels += "<Relationship Id=""rIdS$i"" Type=""http://schemas.openxmlformats.org/officeDocument/2006/relationships/slide"" Target=""slides/slide$i.xml""/>"
      $sldIds += "<p:sldId id=""$(255 + $i)"" r:id=""rIdS$i""/>"
    }
    & $add '[Content_Types].xml' "<?xml version=""1.0"" encoding=""UTF-8"" standalone=""yes""?><Types xmlns=""http://schemas.openxmlformats.org/package/2006/content-types""><Default Extension=""rels"" ContentType=""application/vnd.openxmlformats-package.relationships+xml""/><Default Extension=""xml"" ContentType=""application/xml""/><Default Extension=""png"" ContentType=""image/png""/><Default Extension=""jpg"" ContentType=""image/jpeg""/><Override PartName=""/ppt/presentation.xml"" ContentType=""application/vnd.openxmlformats-officedocument.presentationml.presentation.main+xml""/><Override PartName=""/ppt/slideMasters/slideMaster1.xml"" ContentType=""application/vnd.openxmlformats-officedocument.presentationml.slideMaster+xml""/><Override PartName=""/ppt/slideLayouts/slideLayout1.xml"" ContentType=""application/vnd.openxmlformats-officedocument.presentationml.slideLayout+xml""/><Override PartName=""/ppt/notesMasters/notesMaster1.xml"" ContentType=""application/vnd.openxmlformats-officedocument.presentationml.notesMaster+xml""/><Override PartName=""/ppt/theme/theme1.xml"" ContentType=""application/vnd.openxmlformats-officedocument.theme+xml""/><Override PartName=""/ppt/theme/theme2.xml"" ContentType=""application/vnd.openxmlformats-officedocument.theme+xml""/><Override PartName=""/docProps/core.xml"" ContentType=""application/vnd.openxmlformats-package.core-properties+xml""/><Override PartName=""/docProps/app.xml"" ContentType=""application/vnd.openxmlformats-officedocument.extended-properties+xml""/><Override PartName=""/docProps/custom.xml"" ContentType=""application/vnd.openxmlformats-officedocument.custom-properties+xml""/>$ov</Types>"
    & $add '_rels/.rels' '<?xml version="1.0" encoding="UTF-8" standalone="yes"?><Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships"><Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument" Target="ppt/presentation.xml"/><Relationship Id="rId2" Type="http://schemas.openxmlformats.org/package/2006/relationships/metadata/core-properties" Target="docProps/core.xml"/><Relationship Id="rId3" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/extended-properties" Target="docProps/app.xml"/><Relationship Id="rId4" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/custom-properties" Target="docProps/custom.xml"/></Relationships>'
    $f = $fechaFija.ToString('yyyy-MM-ddTHH:mm:ssZ')
    & $add 'docProps/core.xml' "<?xml version=""1.0"" encoding=""UTF-8"" standalone=""yes""?><cp:coreProperties xmlns:cp=""http://schemas.openxmlformats.org/package/2006/metadata/core-properties"" xmlns:dc=""http://purl.org/dc/elements/1.1/"" xmlns:dcterms=""http://purl.org/dc/terms/"" xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance""><dc:title>$(Xml $props.titulo)</dc:title><dc:subject>$(Xml $props.descripcion)</dc:subject><dc:creator>$(Xml $AUTOR)</dc:creator><cp:keywords>$(Xml "fuente-sha256:$($props.sha)")</cp:keywords><dc:description>$(Xml "$($props.licencia) · $BASE_URL · fuente SHA-256 $($props.sha)")</dc:description><dc:language>$($script:LANGTAG)</dc:language><cp:lastModifiedBy>$(Xml $AUTOR)</cp:lastModifiedBy><dcterms:created xsi:type=""dcterms:W3CDTF"">$f</dcterms:created><dcterms:modified xsi:type=""dcterms:W3CDTF"">$f</dcterms:modified></cp:coreProperties>"
    & $add 'docProps/app.xml' "<?xml version=""1.0"" encoding=""UTF-8"" standalone=""yes""?><Properties xmlns=""http://schemas.openxmlformats.org/officeDocument/2006/extended-properties""><Application>build_presentaciones</Application><Slides>$n</Slides><Notes>$n</Notes><Company>$(Xml $AUTOR)</Company></Properties>"
    & $add 'docProps/custom.xml' "<?xml version=""1.0"" encoding=""UTF-8"" standalone=""yes""?><Properties xmlns=""http://schemas.openxmlformats.org/officeDocument/2006/custom-properties"" xmlns:vt=""http://schemas.openxmlformats.org/officeDocument/2006/docPropsVTypes""><property fmtid=""{D5CDD505-2E9C-101B-9397-08002B2CF9AE}"" pid=""2"" name=""FuenteSHA256""><vt:lpwstr>$($props.sha)</vt:lpwstr></property><property fmtid=""{D5CDD505-2E9C-101B-9397-08002B2CF9AE}"" pid=""3"" name=""Sitio""><vt:lpwstr>$(Xml $BASE_URL)</vt:lpwstr></property></Properties>"
    & $add 'ppt/presentation.xml' "<?xml version=""1.0"" encoding=""UTF-8"" standalone=""yes""?><p:presentation $NS saveSubsetFonts=""1""><p:sldMasterIdLst><p:sldMasterId id=""2147483648"" r:id=""rIdM1""/></p:sldMasterIdLst><p:notesMasterIdLst><p:notesMasterId r:id=""rIdN1""/></p:notesMasterIdLst><p:sldIdLst>$sldIds</p:sldIdLst><p:sldSz cx=""$SW"" cy=""$SH""/><p:notesSz cx=""6858000"" cy=""9144000""/><p:defaultTextStyle><a:lvl1pPr><a:defRPr lang=""$($script:LANGTAG)""/></a:lvl1pPr></p:defaultTextStyle></p:presentation>"
    & $add 'ppt/_rels/presentation.xml.rels' "<?xml version=""1.0"" encoding=""UTF-8"" standalone=""yes""?><Relationships xmlns=""http://schemas.openxmlformats.org/package/2006/relationships""><Relationship Id=""rIdM1"" Type=""http://schemas.openxmlformats.org/officeDocument/2006/relationships/slideMaster"" Target=""slideMasters/slideMaster1.xml""/><Relationship Id=""rIdN1"" Type=""http://schemas.openxmlformats.org/officeDocument/2006/relationships/notesMaster"" Target=""notesMasters/notesMaster1.xml""/><Relationship Id=""rIdT1"" Type=""http://schemas.openxmlformats.org/officeDocument/2006/relationships/theme"" Target=""theme/theme1.xml""/>$presRels</Relationships>"
    & $add 'ppt/theme/theme1.xml' $theme
    & $add 'ppt/theme/theme2.xml' $theme
    & $add 'ppt/slideMasters/slideMaster1.xml' $slideMaster
    & $add 'ppt/slideMasters/_rels/slideMaster1.xml.rels' (Rels-Xml @((RelFija 'rId1' 'slideLayout' '../slideLayouts/slideLayout1.xml'), (RelFija 'rId2' 'theme' '../theme/theme1.xml')) @())
    & $add 'ppt/slideLayouts/slideLayout1.xml' $slideLayout
    & $add 'ppt/slideLayouts/_rels/slideLayout1.xml.rels' (Rels-Xml @((RelFija 'rId1' 'slideMaster' '../slideMasters/slideMaster1.xml')) @())
    & $add 'ppt/notesMasters/notesMaster1.xml' $notesMaster
    & $add 'ppt/notesMasters/_rels/notesMaster1.xml.rels' (Rels-Xml @((RelFija 'rId1' 'theme' '../theme/theme2.xml')) @())
    for ($i = 1; $i -le $n; $i++) {
      $s = $slides[$i - 1]
      & $add "ppt/slides/slide$i.xml" $s.xml
      & $add "ppt/slides/_rels/slide$i.xml.rels" (Rels-Xml @((RelFija 'rId1' 'slideLayout' '../slideLayouts/slideLayout1.xml'), (RelFija 'rId2' 'notesSlide' "../notesSlides/notesSlide$i.xml")) $s.rels)
      & $add "ppt/notesSlides/notesSlide$i.xml" $s.notas
      & $add "ppt/notesSlides/_rels/notesSlide$i.xml.rels" (Rels-Xml @((RelFija 'rId1' 'notesMaster' '../notesMasters/notesMaster1.xml'), (RelFija 'rId2' 'slide' "../slides/slide$i.xml")) $s.notasRels)
    }
    foreach ($k in $script:media.Keys) { & $add "ppt/media/$($script:media[$k])" ([IO.File]::ReadAllBytes($k)) }
  } finally { $zip.Dispose() }
}

# =====================================================================================
# Carga de catálogos para validar
# =====================================================================================
$script:avisosAjuste = [Collections.Generic.List[string]]::new()
$errores = [Collections.Generic.List[string]]::new()
$avisos = [Collections.Generic.List[string]]::new()

# referencias externas verificadas
$URLS_OK = [Collections.Generic.HashSet[string]]::new([StringComparer]::Ordinal)
function Recorrer-Refs($o) {
  if ($o -is [System.Collections.IDictionary]) {
    if ([string]$o['estado'] -eq 'verificado') { foreach ($k in 'url_es', 'url_en', 'url') { if ($o[$k]) { [void]$URLS_OK.Add(([string]$o[$k]).Trim()) } } }
    foreach ($v in $o.Values) { Recorrer-Refs $v }
  } elseif ($o -is [System.Collections.IEnumerable] -and $o -isnot [string]) { foreach ($v in $o) { Recorrer-Refs $v } }
}
foreach ($f in (Get-ChildItem (Join-Path $repo 'SEVEN-G/build/referencias') -Filter '*.json' -ErrorAction SilentlyContinue)) {
  try { Recorrer-Refs (Get-Content $f.FullName -Raw -Encoding utf8 | ConvertFrom-Json -AsHashtable) } catch { $avisos.Add("No se pudo leer el registro de referencias $($f.Name): $($_.Exception.Message)") }
}

# catálogo de imágenes (tolerante: mapa clave -> {es,en} | ruta | {ruta_es,ruta_en} | {ruta:{es,en}}, o lista con «clave»)
$IMAGENES = @{}
$rutaCat = if ($Catalogo) { [IO.Path]::GetFullPath($Catalogo) } else { Join-Path $presDir 'imagenes.json' }
if (Test-Path $rutaCat) {
  try {
    $cat = Get-Content $rutaCat -Raw -Encoding utf8 | ConvertFrom-Json -AsHashtable
    if ($cat -is [System.Collections.IDictionary] -and $cat.Contains('imagenes')) { $cat = $cat['imagenes'] }
    $pares = @()
    if ($cat -is [System.Collections.IDictionary]) { foreach ($k in $cat.Keys) { if ($k -notlike '_*') { $pares += , @($k, $cat[$k]) } } }
    else { foreach ($e in $cat) { $k = if ($e.clave) { $e.clave } elseif ($e.id) { $e.id } else { $e.key }; if ($k) { $pares += , @($k, $e) } } }
    foreach ($par in $pares) {
      $k = [string]$par[0]; $v = $par[1]; $rutas = @{}
      foreach ($lg in 'es', 'en') {
        $r = $null
        if ($v -is [string]) { $r = $v }
        elseif ($v -is [System.Collections.IDictionary]) {
          if ($v[$lg] -is [string]) { $r = $v[$lg] }
          elseif ($v[$lg] -is [System.Collections.IDictionary]) { $r = $v[$lg].ruta }
          elseif ($v["ruta_$lg"]) { $r = $v["ruta_$lg"] }
          elseif ($v.ruta -is [System.Collections.IDictionary]) { $r = $v.ruta[$lg] }
          elseif ($v.ruta) { $r = $v.ruta }
          elseif ($v.archivo) { $r = $v.archivo }
        }
        if ($r) {
          $r = ([string]$r).Replace('{idioma}', $lg)
          $abs = if ([IO.Path]::IsPathRooted($r)) { $r } else { Join-Path $repo $r }
          if (-not (Test-Path $abs)) { $abs2 = Join-Path $presDir $r; if (Test-Path $abs2) { $abs = $abs2 } }
          $rutas[$lg] = [IO.Path]::GetFullPath($abs)
        }
      }
      if (-not $rutas.es -and $rutas.en) { $rutas.es = $rutas.en }
      if (-not $rutas.en -and $rutas.es) { $rutas.en = $rutas.es }
      $descr = if ($v -is [System.Collections.IDictionary] -and $v.descripcion) { $v.descripcion } else { $k }
      $IMAGENES[$k] = @{ rutas = $rutas; descr = $descr }
    }
  } catch { $errores.Add("presentaciones/imagenes.json: no es un JSON válido o no se entiende ($($_.Exception.Message))") }
}
function Imagen-De([string]$clave, [string]$lg) {
  $i = $IMAGENES[$clave]; if (-not $i) { return $null }
  $d = $i.descr; if ($d -is [System.Collections.IDictionary]) { $d = $d[$lg] }
  @{ ruta = $i.rutas[$lg]; descr = [string]$d }
}

# áreas válidas
$AREAS = @{}
try { foreach ($t in (Get-Content (Join-Path $repo 'SEVEN-G/build/temas.json') -Raw -Encoding utf8 | ConvertFrom-Json -AsHashtable).temas) { $AREAS[[string]$t.id] = $true } } catch {}

# =====================================================================================
# Validación
# =====================================================================================
$cacheHtml = @{}
function Validar-Href($h, [string]$donde, [Collections.Generic.List[string]]$err) {
  if ($null -eq $h -or ($h -is [string] -and -not $h.Trim())) { $err.Add("$donde.href: falta"); return }
  if (-not ($h -is [string] -or $h -is [System.Collections.IDictionary])) { $err.Add("$donde.href: tipo no válido"); return }
  foreach ($lg in 'es', 'en') {
    $s = HrefIdioma $h $lg
    if (-not $s) { $err.Add("$donde.href: falta la versión «$lg»"); continue }
    if ($s -match '^https?://') {
      if (-not ($URLS_OK.Contains($s) -or $URLS_OK.Contains($s.TrimEnd('/')) -or $URLS_OK.Contains("$s/"))) { $err.Add("$donde.href ($lg): URL externa que no está verificada en SEVEN-G/build/referencias: $s") }
      continue
    }
    if ($s -match '^[a-z]+:') { $err.Add("$donde.href ($lg): esquema no admitido: $s"); continue }
    $partes = $s.TrimStart('/') -split '#', 2
    $fich = $partes[0]; $ancla = if ($partes.Count -gt 1) { $partes[1] } else { '' }
    $abs = Join-Path $repo $fich
    if ($fich -eq '' -or $fich.EndsWith('/')) { $abs = Join-Path $abs 'index.html' }
    if (-not (Test-Path $abs -PathType Leaf)) { $err.Add("$donde.href ($lg): no existe el fichero $fich"); continue }
    if ($ancla) {
      if (-not $cacheHtml.ContainsKey($abs)) { $cacheHtml[$abs] = [IO.File]::ReadAllText($abs) }
      $a = [regex]::Escape($ancla)
      if ($cacheHtml[$abs] -notmatch "id=[""']$a[""']") { $err.Add("$donde.href ($lg): no existe el ancla #$ancla en $fich") }
    }
  }
}
# comprueba un texto {es,en}; $max = 0 sin límite
function Validar-Texto($o, [string]$donde, [int]$max, [bool]$oblig, [Collections.Generic.List[string]]$err, [int]$min = 0) {
  if ($null -eq $o) { if ($oblig) { $err.Add("${donde}: falta") }; return }
  if ($o -isnot [System.Collections.IDictionary]) { $err.Add("${donde}: debe ser un objeto { es, en }"); return }
  foreach ($lg in 'es', 'en') {
    $v = $o[$lg]
    if ($v -isnot [string] -or -not $v.Trim()) { $err.Add("${donde}.${lg}: falta o está vacío"); continue }
    if ($max -gt 0 -and $v.Length -gt $max) { $err.Add("${donde}.${lg}: $($v.Length) caracteres (máximo $max)") }
    if ($min -gt 0 -and $v.Length -lt $min) { $err.Add("${donde}.${lg}: $($v.Length) caracteres (mínimo $min)") }
  }
}
function Validar-Color($c, [string]$donde, $err) { if ($null -ne $c -and -not $COLORES.ContainsKey([string]$c)) { $err.Add("$donde.color: «$c» no es un color válido ($($COLORES.Keys -join ', '))") } }
function Validar-Rango($lista, [string]$donde, [int]$a, [int]$b, $err) {
  $n = @(Lista $lista).Count
  if ($null -eq $lista -or $lista -isnot [System.Collections.IEnumerable] -or $lista -is [string] -or $lista -is [System.Collections.IDictionary]) { $err.Add("${donde}: falta o no es una lista"); return $false }
  if ($n -lt $a -or $n -gt $b) { $err.Add("${donde}: $n elementos (de $a a $b)"); return $false }
  $true
}
function Bullet-Texto($b) { if ($b -is [System.Collections.IDictionary] -and $b.Contains('texto')) { $b.texto } else { $b } }
$PROHIBIDOS = @(
  @{ re = 'SEACHAD'; cs = $true }, @{ re = 'marca registrada' }, @{ re = 'registered trademark' }, @{ re = 'no difundir' }, @{ re = 'do not distribute' }
)
function Buscar-Prohibidos($o, [string]$ruta, $err) {
  if ($o -is [string]) {
    foreach ($p in $PROHIBIDOS) {
      $m = if ($p.cs) { $o -cmatch $p.re } else { $o -match $p.re }
      if ($m) { $r2 = [regex]::Replace($ruta, '^\.slides\[(\d+)\]', { param($x) "slide $([int]$x.Groups[1].Value + 1)" }).TrimStart('.'); $err.Add("${r2}: contiene el texto prohibido «$($p.re)»") }
    }
  } elseif ($o -is [System.Collections.IDictionary]) { foreach ($k in $o.Keys) { Buscar-Prohibidos $o[$k] "$ruta.$k" $err } }
  elseif ($o -is [System.Collections.IEnumerable]) { $i = 0; foreach ($v in $o) { Buscar-Prohibidos $v "$ruta[$i]" $err; $i++ } }
}
function Slides-Esperadas([string]$clave, [string]$marco) {
  switch -regex ($clave) {
    '^(1|.+_1)$' { return @(1, 1) }
    '^5$' { return @(5, 5) }
    '^(10|.+_10)$' { return @(10, 10) }
    '^20$' { return @(20, 20) }
    '^curso$' { if ($marco -eq 'SEVEN-G') { return @(36, 44) } else { return @(26, 32) } }
  }
  $null
}
function Validar-Presentacion([hashtable]$d, [string]$carpeta, [string]$clave) {
  $err = [Collections.Generic.List[string]]::new()
  $av = [Collections.Generic.List[string]]::new()
  if ($d.marco -notin @('SEVEN-G', 'SPHERES', 'SPAD')) { $err.Add("marco: «$($d.marco)» no es SEVEN-G, SPHERES ni SPAD") }
  if ([string]$d.clave -ne $clave) { $err.Add("clave: «$($d.clave)» no coincide con el nombre del fichero («$clave»)") }
  $esArea = $carpeta -eq 'areas' -or $d.Contains('area')
  if ($esArea) {
    if (-not $d.area) { $err.Add('area: falta (presentación de área)') }
    elseif ($AREAS.Count -and -not $AREAS.ContainsKey([string]$d.area)) { $err.Add("area: «$($d.area)» no está en SEVEN-G/build/temas.json") }
    elseif ($clave -notlike "$($d.area)_*") { $err.Add("clave: «$clave» debe ser «$($d.area)_1» o «$($d.area)_10»") }
    if ($d.marco -ne 'SEVEN-G') { $err.Add('marco: las áreas son de SEVEN-G') }
  }
  Validar-Texto $d.titulo 'titulo' 0 $true $err
  Validar-Texto $d.descripcion 'descripcion' 160 $true $err
  $bas = @(Lista $d.basado_en)
  if ($bas.Count -eq 0) { $err.Add('basado_en: falta (al menos una fuente Markdown)') }
  foreach ($b in $bas) { if ($b -isnot [string] -or -not (Test-Path (Join-Path $repo $b) -PathType Leaf)) { $err.Add("basado_en: no existe «$b»") } }
  $slides = @(Lista $d.slides)
  $esp = Slides-Esperadas $clave ([string]$d.marco)
  if (-not $esp) { $err.Add("clave: «$clave» no es una clave conocida (1, 5, 10, 20, curso, <área>_1, <área>_10)") }
  elseif ($slides.Count -lt $esp[0] -or $slides.Count -gt $esp[1]) { $err.Add("slides: $($slides.Count) slides; la clave «$clave» exige $(if ($esp[0] -eq $esp[1]) { $esp[0] } else { "de $($esp[0]) a $($esp[1])" })") }
  $una = $slides.Count -eq 1
  $notMin = if ($una) { 2500 } else { 700 }; $notMax = if ($una) { 5000 } else { 2600 }
  $tipos = @('poster', 'portada', 'seccion', 'texto', 'tarjetas', 'imagen', 'tabla', 'proceso', 'comparacion', 'cita')
  for ($i = 0; $i -lt $slides.Count; $i++) {
    $s = $slides[$i]; $p = "slide $($i + 1)"
    if ($s -isnot [System.Collections.IDictionary]) { $err.Add("${p}: no es un objeto"); continue }
    $t = [string]$s.tipo
    if ($t -notin $tipos) { $err.Add("$p.tipo: «$t» no es un tipo conocido"); continue }
    $maxT = switch ($t) { 'portada' { 70 } default { 80 } }
    Validar-Texto $s.titulo "$p.titulo" $maxT $true $err
    $maxSub = if ($t -eq 'portada') { 170 } else { 150 }
    Validar-Texto $s.sub "$p.sub" $maxSub $false $err
    Validar-Texto $s.destacado "$p.destacado" 170 $false $err
    $maxEnl = if ($t -eq 'poster') { 4 } else { 3 }
    if (Validar-Rango $s.enlaces "$p.enlaces" 1 $maxEnl $err) {
      $k = 0; foreach ($e in $s.enlaces) { Validar-Texto $e.texto "$p.enlaces[$k].texto" 42 $true $err; Validar-Href $e.href "$p.enlaces[$k]" $err; $k++ }
    }
    Validar-Texto $s.notas "$p.notas" $notMax $true $err $notMin
    if (Validar-Rango $s.fuentes "$p.fuentes" 1 6 $err) {
      $k = 0; foreach ($e in $s.fuentes) { Validar-Texto $e.texto "$p.fuentes[$k].texto" 90 $true $err; Validar-Href $e.href "$p.fuentes[$k]" $err; $k++ }
    }
    if ($s.Contains('imagen') -and $s.imagen) {
      if (-not $IMAGENES.ContainsKey([string]$s.imagen)) { $err.Add("$p.imagen: la clave «$($s.imagen)» no está en presentaciones/imagenes.json") }
      else { foreach ($lg in 'es', 'en') { $r = $IMAGENES[[string]$s.imagen].rutas[$lg]; if (-not $r -or -not (Test-Path $r)) { $err.Add("$p.imagen: falta el fichero de «$($s.imagen)» ($lg): $r") } } }
    }
    switch ($t) {
      'poster' {
        if (-not $una) { $err.Add("$p.tipo: «poster» solo se admite en presentaciones de 1 slide") }
        Validar-Texto $s.antetitulo "$p.antetitulo" 60 $false $err
        $maxB = if ($s.imagen) { 150 } else { 190 }
        if (Validar-Rango $s.bloques "$p.bloques" 4 6 $err) {
          $k = 0; foreach ($b in $s.bloques) { Validar-Texto $b.titulo "$p.bloques[$k].titulo" 34 $true $err; Validar-Texto $b.texto "$p.bloques[$k].texto" $maxB $true $err; Validar-Color $b.color "$p.bloques[$k]" $err; if ($b.Contains('href')) { Validar-Href $b.href "$p.bloques[$k]" $err }; $k++ }
        }
      }
      'portada' { Validar-Texto $s.publico "$p.publico" 100 $false $err }
      'seccion' { Validar-Texto $s.rotulo "$p.rotulo" 30 $false $err; Validar-Texto $s.texto "$p.texto" 220 $false $err }
      'texto' {
        if (Validar-Rango $s.bullets "$p.bullets" 3 6 $err) {
          $k = 0; foreach ($b in $s.bullets) {
            if ($b -is [System.Collections.IDictionary] -and $b.Contains('texto')) { Validar-Texto $b.rotulo "$p.bullets[$k].rotulo" 30 $false $err; Validar-Texto $b.texto "$p.bullets[$k].texto" 160 $true $err; if ($b.Contains('href')) { Validar-Href $b.href "$p.bullets[$k]" $err } }
            else { Validar-Texto $b "$p.bullets[$k]" 160 $true $err }
            $k++
          }
        }
      }
      'tarjetas' {
        if (Validar-Rango $s.tarjetas "$p.tarjetas" 2 6 $err) {
          $maxT2 = if (@($s.tarjetas).Count -ge 5) { 150 } else { 210 }
          $k = 0; foreach ($b in $s.tarjetas) { Validar-Texto $b.titulo "$p.tarjetas[$k].titulo" 36 $true $err; Validar-Texto $b.texto "$p.tarjetas[$k].texto" $maxT2 $true $err; Validar-Color $b.color "$p.tarjetas[$k]" $err; if ($b.Contains('href')) { Validar-Href $b.href "$p.tarjetas[$k]" $err }; $k++ }
        }
      }
      'imagen' {
        if (-not $s.imagen) { $err.Add("$p.imagen: falta") }
        if (Validar-Rango $s.bullets "$p.bullets" 2 4 $err) {
          $k = 0; foreach ($b in $s.bullets) {
            if ($b -is [System.Collections.IDictionary] -and $b.Contains('texto')) { Validar-Texto $b.rotulo "$p.bullets[$k].rotulo" 30 $false $err; Validar-Texto $b.texto "$p.bullets[$k].texto" 140 $true $err; if ($b.Contains('href')) { Validar-Href $b.href "$p.bullets[$k]" $err } }
            else { Validar-Texto $b "$p.bullets[$k]" 140 $true $err }
            $k++
          }
        }
      }
      'tabla' {
        $okC = Validar-Rango $s.cabecera "$p.cabecera" 2 5 $err
        if ($okC) { $k = 0; foreach ($c in $s.cabecera) { Validar-Texto $c "$p.cabecera[$k]" 26 $true $err; $k++ } }
        if ((Validar-Rango $s.filas "$p.filas" 2 7 $err) -and $okC) {
          $nc = @($s.cabecera).Count; $maxC = if ($nc -eq 5) { 65 } else { 95 }
          $r = 0; foreach ($f in $s.filas) {
            $f = @($f)
            if ($f.Count -ne $nc) { $err.Add("$p.filas[$r]: $($f.Count) celdas; la cabecera tiene $nc") }
            $c = 0; foreach ($cel in $f) {
              if ($cel -is [System.Collections.IDictionary] -and $cel.Contains('texto')) { Validar-Texto $cel.texto "$p.filas[$r][$c].texto" $maxC $true $err; if ($cel.Contains('href')) { Validar-Href $cel.href "$p.filas[$r][$c]" $err } }
              else { Validar-Texto $cel "$p.filas[$r][$c]" $maxC $true $err }
              $c++
            }
            $r++
          }
        }
      }
      'proceso' {
        if (Validar-Rango $s.pasos "$p.pasos" 3 8 $err) {
          $maxP = if (@($s.pasos).Count -ge 7) { 80 } else { 120 }
          $k = 0; foreach ($b in $s.pasos) { Validar-Texto $b.rotulo "$p.pasos[$k].rotulo" 10 $true $err; Validar-Texto $b.titulo "$p.pasos[$k].titulo" 28 $true $err; Validar-Texto $b.texto "$p.pasos[$k].texto" $maxP $true $err; Validar-Color $b.color "$p.pasos[$k]" $err; $k++ }
        }
      }
      'comparacion' {
        foreach ($lado in 'izquierda', 'derecha') {
          $l = $s[$lado]
          if ($l -isnot [System.Collections.IDictionary]) { $err.Add("$p.${lado}: falta"); continue }
          Validar-Texto $l.titulo "$p.$lado.titulo" 42 $true $err; Validar-Color $l.color "$p.$lado" $err
          if (Validar-Rango $l.bullets "$p.$lado.bullets" 2 5 $err) { $k = 0; foreach ($b in $l.bullets) { Validar-Texto (Bullet-Texto $b) "$p.$lado.bullets[$k]" 120 $true $err; $k++ } }
        }
      }
      'cita' { Validar-Texto $s.texto "$p.texto" 230 $true $err; Validar-Texto $s.apoyo "$p.apoyo" 220 $false $err }
    }
    if ($i -ge 2 -and $slides[$i - 1].tipo -eq $t -and $slides[$i - 2].tipo -eq $t) { $av.Add("${p}: tres slides seguidas de tipo «$t» (la especificación pide variar)") }
  }
  if ($slides.Count -ge 5) {
    $visual = @('imagen', 'proceso', 'tabla', 'comparacion', 'tarjetas', 'poster')
    for ($i = 0; $i + 2 -lt $slides.Count; $i++) {
      if (-not (@($slides[$i..($i + 2)] | Where-Object { $_.tipo -in $visual -or $_.imagen }).Count)) { $av.Add("slides $($i + 1)-$($i + 3): ninguna lleva gráfico o estructura visual"); break }
    }
  }
  Buscar-Prohibidos $d '' $err
  @{ errores = $err; avisos = $av }
}

# =====================================================================================
# Descubrimiento de fuentes
# =====================================================================================
function Nombre-Fichero([string]$t) {
  $n = $t.Normalize([Text.NormalizationForm]::FormD)
  $sb = [Text.StringBuilder]::new()
  foreach ($ch in $n.ToCharArray()) { if ([Globalization.CharUnicodeInfo]::GetUnicodeCategory($ch) -ne 'NonSpacingMark') { [void]$sb.Append($ch) } }
  $n = $sb.ToString() -replace '\s+', '_' -replace '[^A-Za-z0-9_\-]', '' -replace '_{2,}', '_'
  $n.Trim('_')
}
$ORDEN_CLAVE = @{ '1' = 1; '5' = 2; '10' = 3; '20' = 4; 'curso' = 5 }
function Orden([string]$carpeta, [string]$clave) {
  $oc = @{ 'seven-g' = 1; 'spheres' = 2; 'spad' = 3; 'areas' = 4 }[$carpeta]; if (-not $oc) { $oc = 9 }
  $k = $ORDEN_CLAVE[$clave]
  if (-not $k) { $k = if ($clave -match '_1$') { 1 } elseif ($clave -match '_10$') { 3 } else { 9 } }
  '{0}|{1}|{2}|{3}' -f $oc, $(if ($carpeta -eq 'areas') { ($clave -replace '_\d+$', '') } else { '' }), $k, $clave
}
$presentaciones = [Collections.Generic.List[object]]::new()
if (Test-Path $Fuentes) {
  foreach ($dir in (Get-ChildItem $Fuentes -Directory | Sort-Object Name)) {
    $ficheros = Get-ChildItem $dir.FullName -Filter '*.json' -File | Sort-Object Name
    $grupos = [ordered]@{}
    foreach ($f in $ficheros) {
      $base = $f.Name -replace '\.json$', ''
      $clave = $base -replace '\.part\d+$', ''
      if (-not $grupos.Contains($clave)) { $grupos[$clave] = [Collections.Generic.List[object]]::new() }
      $grupos[$clave].Add($f)
    }
    foreach ($clave in $grupos.Keys) {
      # el fichero principal primero; las partes, por orden de nombre (ordinal)
      $fs = @($grupos[$clave] | Sort-Object @{ e = { if ($_.Name -eq "$clave.json") { 0 } else { 1 } } }, @{ e = { $_.Name } })
      $id = "$($dir.Name.ToLowerInvariant())/$clave"
      $presentaciones.Add([pscustomobject]@{ id = $id; carpeta = $dir.Name.ToLowerInvariant(); clave = $clave; ficheros = $fs; orden = (Orden $dir.Name.ToLowerInvariant() $clave) })
    }
  }
} else { Write-Warning "No existe la carpeta de fuentes $Fuentes" }
$presentaciones = @($presentaciones | Sort-Object orden)
function Coincide([string]$id, [string[]]$patrones) { if (-not $patrones) { return $true }; foreach ($p in $patrones) { if ($id -like $p) { return $true } }; $false }

function Cargar([object]$pr) {
  $err = [Collections.Generic.List[string]]::new()
  $bytes = [Collections.Generic.List[byte]]::new()
  $d = $null
  foreach ($f in $pr.ficheros) {
    $raw = [IO.File]::ReadAllBytes($f.FullName); $bytes.AddRange($raw)
    if ($raw.Length -ge 3 -and $raw[0] -eq 0xEF -and $raw[1] -eq 0xBB -and $raw[2] -eq 0xBF) { $err.Add("$($f.Name): lleva BOM (debe ser UTF-8 sin BOM)") }
    try { $j = $utf8.GetString($raw).TrimStart([char]0xFEFF) | ConvertFrom-Json -AsHashtable -Depth 64 }
    catch { $err.Add("$($f.Name): JSON no válido: $($_.Exception.Message)"); continue }
    if ($j -isnot [System.Collections.IDictionary]) { $err.Add("$($f.Name): debe ser un objeto JSON"); continue }
    if ($f.Name -eq "$($pr.clave).json") { $d = $j }
    else {
      if (-not $d) { $err.Add("$($f.Name): falta $($pr.clave).json (cabecera)"); continue }
      if ($j.Keys | Where-Object { $_ -ne 'slides' }) { $err.Add("$($f.Name): una parte solo puede tener «slides»") }
      $d['slides'] = @(Lista $d.slides) + @(Lista $j.slides)
    }
  }
  if (-not $d -and $err.Count -eq 0) { $err.Add("falta $($pr.clave).json") }
  @{ datos = $d; errores = $err; sha = (Sha256Bytes (Sin-CR $bytes.ToArray())) }
}

function Rutas-Salida([hashtable]$d, [string]$lg) {
  $nombre = Nombre-Fichero ([string]$d.titulo[$lg])
  if ($d.area) { $m = 'SEVEN-G'; $sub = 'areas' } else { $m = [string]$d.marco; $sub = 'presentaciones' }
  @{
    pptx = Join-Path $Salida "$m/pptx/$lg/$sub/$nombre.pptx"
    pdf  = Join-Path $Salida "$m/pdf/$lg/$sub/$nombre.pdf"
  }
}

# construye el PPTX de un idioma en $ruta
function Construir([hashtable]$d, [string]$lg, [string]$ruta, [string]$sha) {
  $script:L = $lg; $script:LANGTAG = if ($lg -eq 'en') { 'en-GB' } else { 'es-ES' }
  $script:media = [ordered]@{}
  $script:marco = [string]$d.marco
  $script:presTitulo = [string]$d.titulo[$lg]
  $slides = @(Lista $d.slides)
  $out = [Collections.Generic.List[object]]::new()
  for ($i = 0; $i -lt $slides.Count; $i++) {
    $s = $slides[$i]
    $script:avisosAjuste.Clear()
    $script:ctx = Nuevo-Ctx
    $img = $null; if ($s.imagen) { $img = Imagen-De ([string]$s.imagen) $lg }
    $xml = switch ($s.tipo) {
      'portada' { Slide-Portada $s ($i + 1) $slides.Count $img }
      'seccion' { Slide-Seccion $s ($i + 1) $slides.Count }
      default { Slide-Normal $s ($i + 1) $slides.Count $img }
    }
    foreach ($a in ($script:avisosAjuste | Select-Object -Unique)) { $script:avisosConstruccion.Add("$lg · slide $($i + 1): $a") }
    $rels = @($script:ctx.lista)
    $script:ctx = Nuevo-Ctx
    $notas = Notas-Xml $s ($i -eq $slides.Count - 1)
    $out.Add(@{ xml = $xml; rels = $rels; notas = $notas; notasRels = @($script:ctx.lista) })
  }
  Escribir-Pptx $ruta $out @{ titulo = $script:presTitulo; descripcion = [string]$d.descripcion[$lg]; sha = $sha; licencia = "$($config.licencia[$lg]) · $AUTOR" }
}

# =====================================================================================
# PDF: slides como PNG (PowerPoint) + notas en HTML A4 (Edge)
# =====================================================================================
$EDGE = @("${env:ProgramFiles(x86)}\Microsoft\Edge\Application\msedge.exe", "$env:ProgramFiles\Microsoft\Edge\Application\msedge.exe") | Where-Object { $_ -and (Test-Path $_) } | Select-Object -First 1
function Enc([string]$s) { [Net.WebUtility]::HtmlEncode($s) }
function Css([string]$s) { $s.Replace('\', '\\').Replace('"', '\"') }
function Html-Pdf([hashtable]$d, [string]$lg, [string[]]$pngs) {
  $script:L = $lg
  $titulo = Enc ([string]$d.titulo[$lg])
  $slides = @(Lista $d.slides)
  $sec = ''
  for ($i = 0; $i -lt $slides.Count; $i++) {
    $s = $slides[$i]
    $notas = ''; $enLista = $false
    foreach ($b in (Bloques-Notas (Tx $s.notas))) {
      if ($b.tipo -eq 'li') { if (-not $enLista) { $notas += '<ul>'; $enLista = $true }; $notas += "<li>$(Enc $b.texto)</li>" }
      else { if ($enLista) { $notas += '</ul>'; $enLista = $false }; $notas += "<p>$(Enc $b.texto)</p>" }
    }
    if ($enLista) { $notas += '</ul>' }
    $fu = (Fuentes-Slide $s | ForEach-Object { "<li><a href=""$(Enc $_.url)"">$(Enc $_.texto)</a> <span class=""url"">$(Enc $_.url)</span></li>" }) -join ''
    $src = ([Uri]$pngs[$i]).AbsoluteUri
    $sec += "<section class=""slide""><div class=""num"">$($i + 1) / $($slides.Count) · $(Enc (Tx $s.titulo))</div><img src=""$src"" alt=""$(Enc (Tx $s.titulo))""><h2>$($TX[$lg].notas)</h2>$notas<h3>$($TX[$lg].fuentes)</h3><ul class=""fuentes"">$fu</ul></section>"
  }
  $sec += "<section class=""aviso""><h3>$($TX[$lg].aviso)</h3><p>$(Enc $AVISO[$lg])</p><p>$(Enc $config.licencia[$lg]) · $(Enc $AUTOR) · <a href=""$(Enc $BASE_URL)"">$(Enc $SITIO_TXT)</a></p></section>"
  @"
<!doctype html><html lang="$lg"><head><meta charset="utf-8"><title>$titulo</title><style>
@page { size: A4 portrait; margin: 20mm 16mm 18mm 16mm; background: #FBE2CD;
  @top-left { content: "$(Css ([string]$d.titulo[$lg]).ToUpperInvariant())"; font: bold 8.5pt Arial, sans-serif; color: #990F3D; border-bottom: 1.5px solid #990F3D; vertical-align: bottom; padding-bottom: 2mm; }
  @bottom-left { content: "$(Css "$($d.marco) · $($config.version[$lg]) · $LIC_PIE · $AUTOR")"; font: 8pt Arial, sans-serif; color: #5E544D; border-top: 1px solid #C9A78D; vertical-align: top; padding-top: 2mm; }
  @bottom-right { content: "$(Css $SITIO_TXT) · " counter(page) " / " counter(pages); font: bold 8pt Arial, sans-serif; color: #0F5499; border-top: 1px solid #C9A78D; vertical-align: top; padding-top: 2mm; }
}
html { background: #FBE2CD; -webkit-print-color-adjust: exact; print-color-adjust: exact; }
body { margin: 0; font-family: Georgia, 'Times New Roman', serif; color: #2F2B28; font-size: 10.5pt; line-height: 1.45; background: #FBE2CD; }
section.slide { break-before: page; }
section.slide:first-of-type { break-before: auto; }
.num { font: bold 8.5pt Arial, sans-serif; color: #5E544D; margin-bottom: 2mm; }
img { width: 100%; border: 0.6pt solid #C9A78D; display: block; margin-bottom: 4mm; }
h2 { font: bold 13pt Georgia, serif; color: #990F3D; margin: 3mm 0 2mm; border-bottom: 1px solid #C9A78D; padding-bottom: 1mm; }
h3 { font: bold 10pt Arial, sans-serif; color: #1A1817; margin: 4mm 0 1.5mm; text-transform: uppercase; letter-spacing: .03em; }
p { margin: 0 0 2.4mm; text-align: justify; hyphens: auto; }
ul { margin: 0 0 2.4mm 5mm; padding-left: 3mm; }
li { margin-bottom: 1.2mm; }
ul.fuentes { font: 9pt Arial, sans-serif; }
ul.fuentes a { color: #0F5499; font-weight: bold; }
.url { color: #5E544D; word-break: break-all; font-size: 8pt; }
a { color: #0F5499; }
section.aviso { break-before: page; font-size: 9.5pt; }
</style></head><body>
$sec
</body></html>
"@
}
function Edge-Pdf([string]$html, [string]$pdf) {
  $perfil = Join-Path ([IO.Path]::GetTempPath()) "presentaciones-edge-$PID"
  $tmpPdf = "$pdf.tmp.pdf"
  for ($k = 0; $k -lt 3; $k++) {
    if (Test-Path $tmpPdf) { Remove-Item $tmpPdf -Force }
    $arg = @('--headless=new', '--disable-gpu', '--no-first-run', '--no-pdf-header-footer', '--allow-file-access-from-files', '--virtual-time-budget=20000', "--user-data-dir=`"$perfil`"", "--print-to-pdf=`"$tmpPdf`"", ([Uri]$html).AbsoluteUri)
    Start-Process -FilePath $EDGE -ArgumentList $arg -Wait -WindowStyle Hidden
    if ((Test-Path $tmpPdf) -and (Get-Item $tmpPdf).Length -gt 1000) { Move-Item $tmpPdf $pdf -Force; return $true }
    Start-Sleep -Seconds 2
  }
  $false
}
function Exportar-Pdfs([object[]]$pendientes) {
  if (-not $pendientes) { return }
  if (-not $EDGE) { Write-Warning "Edge no está disponible: no se generan $($pendientes.Count) PDF (se conservan los que hubiera)."; return }
  $app = $null
  for ($k = 0; $k -lt 3 -and -not $app; $k++) { try { $app = New-Object -ComObject PowerPoint.Application } catch { Start-Sleep -Seconds 2 } }
  if (-not $app) { Write-Warning "PowerPoint no está disponible: no se generan $($pendientes.Count) PDF (se conservan los que hubiera)."; return }
  $tmpBase = Join-Path ([IO.Path]::GetTempPath()) "presentaciones-pdf-$PID"
  try {
    foreach ($p in $pendientes) {
      $dir = Join-Path $tmpBase ([IO.Path]::GetFileNameWithoutExtension($p.pdf) + "-$($p.lg)")
      New-Item -ItemType Directory -Force $dir | Out-Null
      $pres = $app.Presentations.Open($p.pptx, $true, $true, $false)
      $pngs = @()
      try {
        for ($i = 1; $i -le $pres.Slides.Count; $i++) {
          $png = Join-Path $dir ('slide{0:D2}.png' -f $i)
          $pres.Slides.Item($i).Export($png, 'PNG', 1920, 1080)
          $pngs += $png
        }
      } finally { $pres.Close(); [void][Runtime.InteropServices.Marshal]::ReleaseComObject($pres) }
      $html = Join-Path $dir 'notas.html'
      [IO.File]::WriteAllText($html, (Html-Pdf $p.datos $p.lg $pngs), $utf8)
      New-Item -ItemType Directory -Force (Split-Path $p.pdf) | Out-Null
      if (Edge-Pdf $html $p.pdf) { Write-Host "PDF  -> $(Rel $p.pdf $Salida)" } else { Write-Warning "Edge no generó $($p.pdf) (se conserva el anterior, si lo hay)"; $script:fallos++ }
    }
  } finally {
    $app.Quit(); [void][Runtime.InteropServices.Marshal]::ReleaseComObject($app); [GC]::Collect(); [GC]::WaitForPendingFinalizers()
    Remove-Item -Recurse -Force $tmpBase -ErrorAction SilentlyContinue
    Remove-Item -Recurse -Force (Join-Path ([IO.Path]::GetTempPath()) "presentaciones-edge-$PID") -ErrorAction SilentlyContinue
  }
}

# =====================================================================================
# Manifiesto
# =====================================================================================
function Leer-Manifiesto() {
  if (-not (Test-Path $rutaManifiesto)) { return @{} }
  $m = Get-Content $rutaManifiesto -Raw -Encoding utf8 | ConvertFrom-Json -AsHashtable
  $h = @{}
  foreach ($e in @(Lista $m.presentaciones)) { $h[[string]$e.id] = $e }
  $h
}
function Escribir-Manifiesto([hashtable]$entradas) {
  $lista = @($entradas.Values | Sort-Object { $_.orden_ } | ForEach-Object {
      $e = [ordered]@{}
      foreach ($k in 'id', 'marco', 'clave', 'area', 'titulo', 'descripcion', 'slides', 'fuentes', 'fuente_sha256', 'pptx', 'pdf', 'pptx_sha256', 'basado_en', 'revisado') { if ($_.Contains($k) -and $null -ne $_[$k]) { $e[$k] = $_[$k] } }
      $e })
  $doc = [ordered]@{
    nota          = 'Lo escribe presentaciones/build_presentaciones.ps1. No se edita a mano. revisado: huella SHA-256 de cada fuente de basado_en en la última revisión.'
    base_url      = $BASE_URL
    presentaciones = $lista
  }
  New-Item -ItemType Directory -Force (Split-Path $rutaManifiesto) | Out-Null
  [IO.File]::WriteAllText($rutaManifiesto, (($doc | ConvertTo-Json -Depth 12) -replace "`r`n", "`n") + "`n", $utf8)
}
function PorIdioma([System.Collections.IDictionary]$h) { $o = [ordered]@{}; foreach ($k in 'es', 'en') { if ($h.Contains($k)) { $o[$k] = $h[$k] } }; $o }
function Ordenado([System.Collections.IDictionary]$h) { $o = [ordered]@{}; foreach ($k in ($h.Keys | Sort-Object)) { $o[$k] = $h[$k] }; $o }

# =====================================================================================
# Ejecución
# =====================================================================================
$script:avisosConstruccion = [Collections.Generic.List[string]]::new()
$script:fallos = 0
$problemas = [Collections.Generic.List[string]]::new()
$manifiesto = Leer-Manifiesto
$seleccion = @($presentaciones | Where-Object { Coincide $_.id $(if ($Revisado) { $Revisado } else { $Solo }) })
if ($seleccion.Count -eq 0) { Write-Warning 'No hay presentaciones que coincidan.' }

# --- -Revisado: solo vuelve a sellar las huellas ---
if ($Revisado) {
  foreach ($pr in $seleccion) {
    $c = Cargar $pr
    if (-not $manifiesto.ContainsKey($pr.id)) { $problemas.Add("$($pr.id): no está en el manifiesto; genérela primero"); continue }
    if (-not $c.datos) { $problemas.Add("$($pr.id): no se puede leer"); continue }
    $rev = @{}; foreach ($b in @(Lista $c.datos.basado_en)) { $a = Join-Path $repo $b; if (Test-Path $a) { $rev[$b] = Sha256Texto $a } }
    $manifiesto[$pr.id]['revisado'] = Ordenado $rev
    $manifiesto[$pr.id]['basado_en'] = @(Lista $c.datos.basado_en)
    $manifiesto[$pr.id]['orden_'] = $pr.orden
    Write-Host "Revisado: $($pr.id)"
  }
  foreach ($k in @($manifiesto.Keys)) { if (-not $manifiesto[$k].Contains('orden_')) { $p0 = $presentaciones | Where-Object id -eq $k | Select-Object -First 1; $manifiesto[$k]['orden_'] = if ($p0) { $p0.orden } else { "9|$k" } } }
  if ($problemas.Count -eq 0) { Escribir-Manifiesto $manifiesto }
  foreach ($p in $problemas) { Write-Host "ERROR  $p" -ForegroundColor Red }
  exit $(if ($problemas.Count) { 1 } else { 0 })
}

$pdfPendientes = [Collections.Generic.List[object]]::new()
$tmpDir = Join-Path ([IO.Path]::GetTempPath()) "presentaciones-build-$PID"
New-Item -ItemType Directory -Force $tmpDir | Out-Null
$nOk = 0; $nErr = 0
try {
  foreach ($pr in $seleccion) {
    $c = Cargar $pr
    $err = [Collections.Generic.List[string]]::new($c.errores)
    $av = @()
    if ($c.datos) { $v = Validar-Presentacion $c.datos $pr.carpeta $pr.clave; $err.AddRange($v.errores); $av = $v.avisos }
    foreach ($a in $av) { $avisos.Add("$($pr.id): $a") }
    if ($err.Count) {
      $nErr++
      foreach ($e in $err) { $problemas.Add("$($pr.id) · $e") }
      continue
    }
    $nOk++
    if ($Validar) { continue }
    $d = $c.datos
    $prev = $manifiesto[$pr.id]
    $entrada = if ($prev) { $prev } else { @{} }
    $pptxRel = @{}; $pdfRel = @{}; $pptxSha = @{}
    if ($prev -and $prev.pptx) { foreach ($k in $prev.pptx.Keys) { $pptxRel[$k] = $prev.pptx[$k] } }
    if ($prev -and $prev.pdf) { foreach ($k in $prev.pdf.Keys) { $pdfRel[$k] = $prev.pdf[$k] } }
    if ($prev -and $prev.pptx_sha256) { foreach ($k in $prev.pptx_sha256.Keys) { $pptxSha[$k] = $prev.pptx_sha256[$k] } }
    $langs = if ($Comprobar) { @('es', 'en') } else { $Idiomas }
    foreach ($lg in $langs) {
      $rs = Rutas-Salida $d $lg
      $tmp = Join-Path $tmpDir "$($pr.carpeta)_$($pr.clave)_$lg.pptx"
      Construir $d $lg $tmp $c.sha
      $hash = Sha256Fichero $tmp
      $igual = (Test-Path $rs.pptx) -and ((Sha256Fichero $rs.pptx) -eq $hash)
      if ($Comprobar) {
        if (-not (Test-Path $rs.pptx)) { $problemas.Add("$($pr.id) · ${lg}: falta el PPTX $(Rel $rs.pptx $Salida)") }
        elseif (-not $igual) { $problemas.Add("$($pr.id) · ${lg}: el PPTX no corresponde a su JSON (vuelva a generarlo)") }
        if (-not (Test-Path $rs.pdf)) { $problemas.Add("$($pr.id) · ${lg}: falta el PDF $(Rel $rs.pdf $Salida)") }
        Remove-Item $tmp -Force
        continue
      }
      if (-not $igual) { New-Item -ItemType Directory -Force (Split-Path $rs.pptx) | Out-Null; Copy-Item $tmp $rs.pptx -Force }
      Remove-Item $tmp -Force
      if (-not $SinPdf -and (-not $igual -or -not (Test-Path $rs.pdf))) { $pdfPendientes.Add([pscustomobject]@{ pptx = $rs.pptx; pdf = $rs.pdf; lg = $lg; datos = $d }) }
      $pptxRel[$lg] = Rel $rs.pptx $Salida; $pdfRel[$lg] = Rel $rs.pdf $Salida; $pptxSha[$lg] = $hash
      Write-Host "$($pr.id) · ${lg}: $(@(Lista $d.slides).Count) slides$(if ($igual) { ' (sin cambios)' }) -> $(Rel $rs.pptx $Salida)"
    }
    # huellas de basado_en: comprobar o sellar
    $bas = @(Lista $d.basado_en)
    if ($Comprobar) {
      if (-not $prev) { $problemas.Add("$($pr.id): no está en el manifiesto (no se ha generado)") }
      else {
        foreach ($b in $bas) {
          $a = Join-Path $repo $b
          $h = if (Test-Path $a) { Sha256Texto $a } else { '' }
          if (-not $prev.revisado -or -not $prev.revisado.Contains($b)) { $problemas.Add("$($pr.id): la fuente $b no tiene huella de revisión (genere o use -Revisado)") }
          elseif ($prev.revisado[$b] -ne $h) { $problemas.Add("$($pr.id): la fuente $b ha cambiado desde la última revisión (revise la presentación y ejecute -Revisado '$($pr.id)')") }
        }
      }
      continue
    }
    $rev = @{}
    if ($prev -and $prev.revisado) { foreach ($k in $prev.revisado.Keys) { if ($k -in $bas) { $rev[$k] = $prev.revisado[$k] } } }
    foreach ($b in $bas) { if (-not $rev.ContainsKey($b)) { $rev[$b] = Sha256Texto (Join-Path $repo $b) } }   # primera generación o fuente nueva: se sella
    $entrada = [ordered]@{
      id = $pr.id; marco = [string]$d.marco; clave = $pr.clave; area = $(if ($d.area) { [string]$d.area } else { $null })
      titulo = [ordered]@{ es = [string]$d.titulo.es; en = [string]$d.titulo.en }
      descripcion = [ordered]@{ es = [string]$d.descripcion.es; en = [string]$d.descripcion.en }
      slides = @(Lista $d.slides).Count
      fuentes = @($pr.ficheros | ForEach-Object { Rel $_.FullName })
      fuente_sha256 = $c.sha
      pptx = (PorIdioma $pptxRel); pdf = (PorIdioma $pdfRel); pptx_sha256 = (PorIdioma $pptxSha)
      basado_en = $bas
      revisado = (Ordenado $rev)
      orden_ = $pr.orden
    }
    $manifiesto[$pr.id] = $entrada
  }

  if ($Comprobar) {
    # entradas del manifiesto sin JSON
    if (-not $Solo) { foreach ($k in $manifiesto.Keys) { if (-not ($presentaciones | Where-Object id -eq $k)) { $problemas.Add("${k}: está en el manifiesto pero no hay JSON fuente") } } }
  } elseif (-not $Validar) {
    foreach ($k in @($manifiesto.Keys)) { if (-not $manifiesto[$k].Contains('orden_')) { $p0 = $presentaciones | Where-Object id -eq $k | Select-Object -First 1; $manifiesto[$k]['orden_'] = if ($p0) { $p0.orden } else { "9|$k" } } }
    Escribir-Manifiesto $manifiesto
    if (-not $SinPdf) { Exportar-Pdfs $pdfPendientes }
  }
} finally { Remove-Item -Recurse -Force $tmpDir -ErrorAction SilentlyContinue }

# --- resumen ---
foreach ($a in $script:avisosConstruccion | Select-Object -Unique) { Write-Warning "ajuste: $a" }
foreach ($a in $avisos) { Write-Host "AVISO  $a" -ForegroundColor Yellow }
foreach ($p in $problemas) { Write-Host "ERROR  $p" -ForegroundColor Red }
$modo = if ($Comprobar) { 'Comprobación' } elseif ($Validar) { 'Validación' } else { 'Generación' }
Write-Host "${modo}: $($seleccion.Count) presentaciones; válidas $nOk; con errores $nErr; problemas $($problemas.Count)."
exit $(if ($problemas.Count -or $script:fallos) { 1 } else { 0 })
