<#
.SYNOPSIS
  Prepara el informe mensual de vigilancia de las fuentes externas de la metodología (D117).

.DESCRIPTION
  Lee el registro de referencias (build/referencias/*.json) y la lista de vigilancia (build/vigilancia_fuentes.json) y escribe
  SEVEN-G/mds/es/_trabajo/vigilancia_fuentes/AAAA-MM_Vigilancia_de_fuentes.md con:
    1. el resultado de la comprobación de enlaces (verificar_referencias.ps1), salvo con -SinEnlaces;
    2. las fuentes prioritarias, con la pregunta que hay que responder, dónde mirar (su «donde» o, si no lo tiene, la URL verificada
       del registro), si ese enlace responde y los documentos afectados; y las referencias del registro que pueden cambiar
       (borrador, no verificable, proyecto, consulta) y aún no están vigiladas, para darlas de alta (D118);
    3. las referencias cuya última comprobación tiene más de «antiguedad_max_meses» meses;
    4. dónde buscar fuentes nuevas.
  Las columnas «Resultado» y «Propuesta» quedan en blanco: las rellena la tarea programada o quien revise, consultando la fuente
  oficial. El script no modifica ningún documento ni el registro: los cambios los decide y los incorpora el autor.
  Si el informe del mes ya existe, no lo sobrescribe salvo con -Forzar.

.EXAMPLE
  pwsh -File SEVEN-G/build/vigilar_fuentes.ps1
#>
param([switch]$SinEnlaces, [switch]$Forzar, [string]$Mes = (Get-Date -Format 'yyyy-MM'))
$ErrorActionPreference = 'Stop'
$build = $PSScriptRoot
$repo = Split-Path (Split-Path $build)
$regs = @(Get-ChildItem (Join-Path $build 'referencias') -File -Filter '*.json' | Sort-Object Name | ForEach-Object { Get-Content $_.FullName -Raw -Encoding utf8 | ConvertFrom-Json })
$porId = @{}; foreach ($r in $regs) { $porId[$r.id] = $r }
$cfg = Get-Content (Join-Path $build 'vigilancia_fuentes.json') -Raw -Encoding utf8 | ConvertFrom-Json
$faltan = @($cfg.prioritarias | Where-Object { -not $porId.ContainsKey($_.id) } | ForEach-Object id)
if ($faltan.Count) { throw "vigilancia_fuentes.json cita referencias que no están en el registro: $($faltan -join ', ')" }

$dir = Join-Path $repo 'SEVEN-G\mds\es\_trabajo\vigilancia_fuentes'
New-Item -ItemType Directory -Force $dir | Out-Null
$salida = Join-Path $dir "${Mes}_Vigilancia_de_fuentes.md"
if ((Test-Path $salida) -and -not $Forzar) { Write-Host "Ya existe $salida (usar -Forzar para regenerarlo)."; exit 0 }

function Celda([string]$s) { ($s -replace '\|', '\|' -replace '\r?\n', ' ').Trim() }
function Docs($r) { $d = @($r.documentos); if ($d.Count -gt 12) { ($d[0..11] -join ', ') + " y $($d.Count - 12) más" } else { $d -join ', ' } }
function FechaComprobacion($r) {
  $m = [regex]::Match([string]$r.comprobacion, '^(\d{2})-(\d{2})-(\d{4})')
  if ($m.Success) { [datetime]::new([int]$m.Groups[3].Value, [int]$m.Groups[2].Value, [int]$m.Groups[1].Value) } else { $null }
}

$sb = [Text.StringBuilder]::new()
[void]$sb.AppendLine("# Vigilancia de fuentes · $Mes")
[void]$sb.AppendLine()
[void]$sb.AppendLine("Informe de trabajo (no se publica), preparado con ``vigilar_fuentes.ps1`` el $(Get-Date -Format 'dd-MM-yyyy') (D117). **No se modifica ningún documento a partir de este informe sin la decisión del autor.** Las columnas «Resultado» y «Propuesta» se rellenan consultando solo la fuente oficial o primaria (D41, D114).")
[void]$sb.AppendLine()

[void]$sb.AppendLine('## 1. Enlaces del registro')
[void]$sb.AppendLine()
if ($SinEnlaces) { [void]$sb.AppendLine('No comprobados en esta ejecución (-SinEnlaces).') }
else {
  $out = & pwsh -NoProfile -File (Join-Path $build 'verificar_referencias.ps1') 2>&1 | Out-String
  $resumen = ($out -split '\r?\n' | Where-Object { $_ -match '^Total comprobaciones' } | Select-Object -Last 1)
  $filas = @($out -split '\r?\n' | Where-Object { $_ -match '\s(FALLO|revisar a mano)\s' })
  [void]$sb.AppendLine("$resumen")
  [void]$sb.AppendLine()
  if ($filas.Count) {
    [void]$sb.AppendLine('Enlaces que no responden (FALLO) o que el sitio rechaza a los programas (revisar a mano en el navegador):')
    [void]$sb.AppendLine(); [void]$sb.AppendLine('```'); foreach ($f in $filas) { [void]$sb.AppendLine($f.TrimEnd()) }; [void]$sb.AppendLine('```')
  } else { [void]$sb.AppendLine('Todos los enlaces responden.') }
}
[void]$sb.AppendLine()

[void]$sb.AppendLine('## 2. Fuentes prioritarias (pueden cambiar en cualquier momento)')
[void]$sb.AppendLine()
[void]$sb.AppendLine('«Enlace»: respuesta HTTP de «Dónde mirar» (OK; «a mano» si el sitio rechaza a los programas; FALLO si no existe). Si el enlace falla o no lleva a la información, se busca la página oficial del emisor y se corrige «donde» en `vigilancia_fuentes.json` (D118).')
[void]$sb.AppendLine()
[void]$sb.AppendLine('| Referencia | Situación | Qué comprobar | Dónde mirar | Enlace | Documentos afectados | Resultado | Propuesta |')
[void]$sb.AppendLine('|---|---|---|---|---|---|---|---|')
$cab = @{ 'User-Agent' = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) SEVEN-G-verificador' }
foreach ($p in $cfg.prioritarias) {
  $r = $porId[$p.id]; $sit = if ($r.situacion) { $r.situacion } else { $r.estado }
  $donde = if ($p.donde) { $p.donde } elseif ($r.url_es) { $r.url_es } else { $r.url_en }
  $origen = if ($p.donde) { '' } else { ' (registro)' }
  $enl = if (-not $donde) { 'sin enlace' } elseif ($SinEnlaces) { '-' } else {
    $c = 0; try { $c = [int](Invoke-WebRequest -Uri $donde -Headers $cab -TimeoutSec 30 -SkipHttpErrorCheck -MaximumRedirection 10).StatusCode } catch { $c = -1 }
    if ($c -ge 200 -and $c -lt 400) { 'OK' } elseif ($c -in 401, 403, 405, 429) { "a mano ($c)" } else { "FALLO ($c)" }
  }
  [void]$sb.AppendLine("| **$($p.id)** | $sit | $(Celda $p.pregunta) | $donde$origen | $enl | $(Docs $r) | | |")
}
[void]$sb.AppendLine()
[void]$sb.AppendLine('### 2.1 Referencias que pueden cambiar y no están vigiladas')
[void]$sb.AppendLine()
$vigiladas = @($cfg.prioritarias | ForEach-Object id)
$patronCambio = '(?i)\b(proyecto|anteproyecto|propuesta|borrador|consulta p[uú]blica|draft|proposal|public consultation)\b'
$sinVig = @($regs | Where-Object { $vigiladas -notcontains $_.id -and (($_.situacion -and $_.situacion -ne 'final') -or $_.estado -ne 'verificado' -or ("$($_.titulo_es) $($_.titulo_en)" -match $patronCambio)) })
if ($sinVig.Count) {
  [void]$sb.AppendLine('Darlas de alta en `vigilancia_fuentes.json` con su pregunta (D118), o anotar por qué no hace falta:')
  [void]$sb.AppendLine(); [void]$sb.AppendLine('| Referencia | Estado · situación | Título | Alta propuesta |'); [void]$sb.AppendLine('|---|---|---|---|')
  foreach ($r in $sinVig) { [void]$sb.AppendLine("| **$($r.id)** | $($r.estado)$(if ($r.situacion) { ' · ' + $r.situacion }) | $(Celda $r.titulo_es) | |") }
} else { [void]$sb.AppendLine('Ninguna: todas las referencias que pueden cambiar están vigiladas.') }
[void]$sb.AppendLine()

[void]$sb.AppendLine("## 3. Referencias con la última comprobación de hace más de $($cfg.antiguedad_max_meses) meses")
[void]$sb.AppendLine()
$limite = (Get-Date).AddMonths(-[int]$cfg.antiguedad_max_meses)
$viejas = @($regs | Where-Object { $_.estado -eq 'verificado' } | ForEach-Object { $f = FechaComprobacion $_; if (-not $f -or $f -lt $limite) { [PSCustomObject]@{ r = $_; f = $f } } })
if ($viejas.Count) {
  [void]$sb.AppendLine('| Referencia | Última comprobación | Título | Resultado |'); [void]$sb.AppendLine('|---|---|---|---|')
  foreach ($v in $viejas) { [void]$sb.AppendLine("| **$($v.r.id)** | $(if ($v.f) { $v.f.ToString('dd-MM-yyyy') } else { 'sin fecha' }) | $(Celda $v.r.titulo_es) | |") }
} else { [void]$sb.AppendLine('Ninguna.') }
[void]$sb.AppendLine()

[void]$sb.AppendLine('## 4. Fuentes nuevas (solo se proponen; las incorpora el autor)')
[void]$sb.AppendLine()
[void]$sb.AppendLine('| Dónde mirar | Novedad relevante para la metodología | Documentos que podría afectar |'); [void]$sb.AppendLine('|---|---|---|')
foreach ($n in $cfg.novedades) { [void]$sb.AppendLine("| $($n.fuente): $($n.donde) | | |") }
[void]$sb.AppendLine()

[void]$sb.AppendLine('## 5. Qué se hace con un cambio')
[void]$sb.AppendLine()
[void]$sb.AppendLine('1. Se anota aquí con el enlace oficial que lo acredita y los documentos y herramientas afectados (campo `documentos` del registro).')
[void]$sb.AppendLine('2. El autor decide si se incorpora. Si lo aprueba: se corrigen los documentos en ES y EN en la misma entrega, se actualiza la entrada del registro (`comprobacion`, `situacion`, `notas`), se registra la decisión y se pasa `verificar_coherencia.ps1` antes de publicar.')
[void]$sb.AppendLine('3. Mientras no se incorpore, el aviso legal (D113) cubre que alguna norma pueda haber cambiado sin recogerse.')

[IO.File]::WriteAllText($salida, $sb.ToString(), [Text.UTF8Encoding]::new($false))
Write-Host "Informe: $salida · $(@($cfg.prioritarias).Count) prioritarias · $($viejas.Count) con comprobación antigua"
