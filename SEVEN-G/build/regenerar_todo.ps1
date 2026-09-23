<#
  SEVEN-G · Regeneración completa, verificación y (opcionalmente) publicación, en el equipo del autor (Windows, PowerShell 7, Edge).

  Uso:
    pwsh -File SEVEN-G/build/regenerar_todo.ps1                                   regenera y verifica la rama actual
    pwsh -File SEVEN-G/build/regenerar_todo.ps1 -Rama claude/zealous-cannon-swizy1   trae esa rama, regenera y verifica
    pwsh -File SEVEN-G/build/regenerar_todo.ps1 -Rama <rama> -Publicar              además, si la verificación pasa: commit, integra la rama en main y push (D52)

  Orden (cada paso depende del anterior):
    1. Herramientas desde sus fuentes: T01 (build_registro), T11 (build_calculadora), T14 (build_indice), T15 (build_madurez).
    2. Índice de ejemplo del panel calculado por T14 desde los datos de T01 (Edge sin ventana): T17_panel_consejo/ejemplo/t14_indice.json.
    3. Panel del consejo de ejemplo (T17): uv run python t01_a_panel.py --indice ejemplo/t14_indice.json (si uv está instalado).
    4. Biblioteca completa: build.ps1 (SEVEN-G, SPHERES y SPAD, ES/EN, HTML, PDF, Word, cursos, codigos.js y busqueda.json).
    5. verificar_coherencia.ps1: si no da 0, se para y no se publica nada.

  Existe porque los HTML y PDF de la biblioteca solo se regeneran bien en Windows (Edge, PowerPoint por COM, rutas): las sesiones
  que trabajan en un contenedor Linux dejan los cambios en una rama y este script los regenera y publica en el equipo del autor.
#>
param(
  [string]$Rama,
  [switch]$Publicar
)
$ErrorActionPreference = 'Stop'
$repo = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
$h = Join-Path $repo 'SEVEN-G\herramientas'
function Paso([string]$m) { Write-Host ''; Write-Host "== $m" -ForegroundColor Cyan }
function Ejecutar([string]$que, [scriptblock]$b) { & $b; if ($LASTEXITCODE) { throw "$que ha fallado (código $LASTEXITCODE)" } }

Push-Location $repo
try {
  if ($Rama) {
    Paso "Rama $Rama"
    if (git status --porcelain) { throw 'Hay cambios sin guardar en el repositorio: haga commit o descártelos antes de cambiar de rama.' }
    Ejecutar 'git fetch' { git fetch origin $Rama }
    Ejecutar 'git checkout' { git checkout $Rama }
    Ejecutar 'git pull' { git pull --ff-only origin $Rama }
  }
  $ramaActual = (git rev-parse --abbrev-ref HEAD).Trim()

  Paso '1. Herramientas (T01, T11, T14, T15)'
  Ejecutar 'T01' { pwsh -NoProfile -File (Join-Path $h 'T01_registro_iniciativas\build_registro.ps1') }
  Ejecutar 'T11' { pwsh -NoProfile -File (Join-Path $h 'T11_calculadora_valor\build_calculadora.ps1') }
  Ejecutar 'T14' { pwsh -NoProfile -File (Join-Path $h 'T14_indice_transformacion\build_indice.ps1') }
  Ejecutar 'T15' { pwsh -NoProfile -File (Join-Path $h 'T15_diagnostico_madurez\build_madurez.ps1') }

  Paso '2. Índice de ejemplo del panel (T14 desde T01)'
  $tmpIx = Join-Path ([IO.Path]::GetTempPath()) "seveng-t14-$PID.html"
  Ejecutar 'T14 -DesdeT01' { pwsh -NoProfile -File (Join-Path $h 'T14_indice_transformacion\build_indice.ps1') -Salida $tmpIx -DesdeT01 (Join-Path $h 'T01_registro_iniciativas\datos_demo.json') -Exportar (Join-Path $h 'T17_panel_consejo\ejemplo\t14_indice.json') }
  Remove-Item $tmpIx -ErrorAction SilentlyContinue

  Paso '3. Panel del consejo de ejemplo (T17)'
  if (Get-Command uv -ErrorAction SilentlyContinue) {
    Push-Location (Join-Path $h 'T17_panel_consejo')
    try { Ejecutar 'T17' { uv run python t01_a_panel.py --indice ejemplo/t14_indice.json } } finally { Pop-Location }
  } else { Write-Host '  uv no está instalado: se conserva el panel de ejemplo del repositorio (la verificación dirá si está al día).' -ForegroundColor Yellow }

  Paso '4. Biblioteca completa (build.ps1)'
  Ejecutar 'build.ps1' { pwsh -NoProfile -File (Join-Path $repo 'SEVEN-G\build\build.ps1') }

  Paso '5. Verificación de coherencia'
  pwsh -NoProfile -File (Join-Path $repo 'SEVEN-G\build\verificar_coherencia.ps1')
  if ($LASTEXITCODE) { Write-Host ''; Write-Host 'La verificación ha fallado: no se publica nada. Corrija los errores (o pídaselo a Claude con el informe de arriba).' -ForegroundColor Red; exit 1 }

  if (-not $Publicar) { Write-Host ''; Write-Host "Regeneración y verificación correctas en la rama $ramaActual. Para publicar: añada -Publicar." -ForegroundColor Green; exit 0 }

  Paso '6. Publicación (D52)'
  git add -A
  if (git status --porcelain) { Ejecutar 'git commit' { git commit -m "Regeneración completa de la biblioteca y las herramientas (regenerar_todo.ps1)" } }
  if ($ramaActual -ne 'main') {
    Ejecutar 'git push (rama)' { git push -u origin $ramaActual }
    Ejecutar 'git checkout main' { git checkout main }
    Ejecutar 'git pull main' { git pull --ff-only origin main }
    Ejecutar 'git merge' { git merge --no-ff $ramaActual -m "Integra $ramaActual en main" }
  }
  Ejecutar 'git push main' { git push origin main }
  Write-Host ''; Write-Host 'Publicado en main: GitHub Pages actualizará el sitio en unos minutos.' -ForegroundColor Green
}
finally { Pop-Location }
