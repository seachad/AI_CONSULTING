<#
  S8 · Anonimizar un registro T01 para un piloto (plan de sprints del 01-10-2026, D143; D17, D57).
  Uso: pwsh -File SEVEN-G/mds/es/_trabajo/futures/s8_anonimizar_t01.ps1 -Entrada <registro.json> -Salida <anonimo.json> [-Codigo PIL-01] [-FactorImportes 1]
  Qué hace, sin tocar el fichero de entrada:
    - retira todo texto libre (nombres, descripciones, motivos, comentarios, títulos, enlaces, fórmulas, fuentes, actas…) y lo sustituye por «[retirado]»;
    - sustituye la organización por «Compañía piloto <código>», las personas por P01…, los proveedores por PRV-01… y las unidades de negocio por U01…,
      de forma coherente en todo el fichero (la misma unidad recibe siempre el mismo código);
    - multiplica todos los importes por -FactorImportes (por defecto 1): un factor elegido por el autor y no publicado oculta las cifras reconocibles
      y conserva las proporciones (neto, proporción validada, coste del gobierno sobre la inversión);
    - no toca madurez[] (solo niveles y recuentos, sin texto libre);
    - conserva fechas, fases, códigos, estados, clasificaciones, horas de gobierno, criterios y eventos: es lo que mide el piloto.
  Revisar SIEMPRE el resultado a mano y pasarlo por la lista privada de términos prohibidos antes de compartirlo (D57). No es una garantía de anonimato.
#>
param([Parameter(Mandatory)][string]$Entrada, [Parameter(Mandatory)][string]$Salida, [string]$Codigo = 'PIL-01', [double]$FactorImportes = 1)
$ErrorActionPreference = 'Stop'
$d = Get-Content $Entrada -Raw -Encoding utf8 | ConvertFrom-Json -Depth 100 -AsHashtable
$texto = @('nombre','descripcion','motivo','comentario','texto','titulo','enlace','acta','cargo','observaciones','fuente','formula','contingencia',
           'controles','justificacion','lecciones','que_es','nota','sistema_origen','condicion_paso','alcance_texto','servicios','contrato',
           'metrica','evidencia','sustituto','actividad_destino','periodo','responsable_texto','comentarios','descripcion_corta')
$importe = @('importe','realizada','pendiente','limite_inversion_etapa','ingresos_totales','coste_hora_gobierno','umbral_express')
$mapas = @{ persona = @{}; proveedor = @{}; area = @{} }
function Codigo($tipo, $valor, $prefijo) { if ($null -eq $valor -or "$valor" -eq '') { return $valor }; $m = $mapas[$tipo]; if (-not $m.ContainsKey("$valor")) { $m["$valor"] = '{0}{1:00}' -f $prefijo, ($m.Count + 1) }; $m["$valor"] }
foreach ($p in @($d.personas)) { $p.nombre = Codigo 'persona' $p.id 'P'; $p.cargo = '[retirado]' }
foreach ($p in @($d.proveedores)) { $p.nombre = Codigo 'proveedor' $p.id 'PRV-' }
function Limpiar($o, [string]$clave) {
  if ($o -is [System.Collections.IDictionary]) {
    foreach ($k in @($o.Keys)) {
      $v = $o[$k]
      if ($k -eq 'area' -and $v -is [string]) { $o[$k] = Codigo 'area' $v 'U' }
      elseif ($k -eq 'areas' -and $clave -eq 'meta' -and $v -is [System.Collections.IList]) { $o[$k] = @($v | ForEach-Object { Codigo 'area' $_ 'U' }) }
      elseif ($texto -contains $k -and $v -is [string] -and -not ($k -eq 'motivo' -and $clave -in 'cierre', 'espera')) { $o[$k] = '[retirado]' }
      elseif ($importe -contains $k -and ($v -is [int] -or $v -is [long] -or $v -is [double] -or $v -is [decimal])) { $o[$k] = [math]::Round($v * $FactorImportes) }
      else { Limpiar $v $k }
    }
  } elseif ($o -is [System.Collections.IList]) { foreach ($x in $o) { Limpiar $x $clave } }
}
foreach ($k in @($d.Keys)) { if ($k -notin 'personas', 'proveedores', 'madurez') { Limpiar $d[$k] $k } }
$d.meta.organizacion = "Compañía piloto $Codigo"
$d.meta.nota = "Registro anonimizado con s8_anonimizar_t01.ps1 el $(Get-Date -Format 'dd-MM-yyyy') (piloto $Codigo; importes $(if ($FactorImportes -ne 1) { 'escalados' } else { 'sin escalar' })). Revisado a mano antes de compartir."
$d | ConvertTo-Json -Depth 100 | Set-Content $Salida -Encoding utf8
Write-Host "anonimizado: $Salida · $($mapas.persona.Count) personas, $($mapas.proveedor.Count) proveedores, $($mapas.area.Count) unidades; importes ×$FactorImportes"
Write-Host 'Revíselo a mano y con la lista privada de términos prohibidos antes de compartirlo (D57).'
