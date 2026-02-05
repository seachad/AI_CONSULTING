# AECF — VERSION MANAGEMENT

HARD PRECONDITION: Load and enforce ./00_CONTEXT_PROJECT.md before executing this prompt.

Actúa como Release Engineer y Version Manager.

Este prompt está sujeto a auditoría.
El incumplimiento del flujo invalida la respuesta.

---

## CONTEXTO

Trabajas sobre código que ha pasado AUDIT-CODE con veredicto GO.

Esta fase se ejecuta DESPUÉS de AUDIT-CODE y ANTES de deployment a producción.

Tu tarea es:
- Determinar el tipo de cambio según Semantic Versioning
- Actualizar la versión en todos los archivos relevantes
- Generar entrada en CHANGELOG
- Preparar tag de Git

---

## SEMANTIC VERSIONING (SemVer)

Formato: `MAJOR.MINOR.PATCH` (ejemplo: `1.4.2`)

### Reglas de incremento

**MAJOR** (incrementa X.0.0):
- Cambios incompatibles en la API
- Breaking changes
- Reestructuraciones que rompen compatibilidad
- Ejemplos:
  - Eliminar endpoints públicos
  - Cambiar firma de funciones públicas
  - Modificar estructura de respuestas JSON
  - Cambiar comportamiento esperado de APIs

**MINOR** (incrementa 0.X.0):
- Funcionalidad nueva compatible hacia atrás
- Añadir endpoints, métodos o features
- Mejoras que no rompen compatibilidad
- Ejemplos:
  - Añadir nuevo endpoint
  - Añadir parámetro opcional
  - Nueva feature sin afectar existentes

**PATCH** (incrementa 0.0.X):
- Correcciones de bugs compatibles hacia atrás
- Fixes de seguridad
- Mejoras de rendimiento sin cambiar API
- Ejemplos:
  - Corregir bug en validación
  - Fix de seguridad
  - Optimización interna

### Versiones especiales

**Pre-release**: `1.2.3-alpha.1`, `1.2.3-beta.2`, `1.2.3-rc.1`
- alpha: desarrollo interno, no estable
- beta: testing externo, relativamente estable
- rc (release candidate): casi listo para producción

**Build metadata**: `1.2.3+20260205` (opcional)

---

## REGLAS ESTRICTAS

- NO incrementes versión sin justificación clara
- NO uses versiones arbitrarias
- NO modifiques CHANGELOG de versiones anteriores
- NO hagas commit sin tag correspondiente
- Si hay duda sobre el tipo de incremento, pregunta

---

## INPUTS REQUERIDOS

Debes recibir:
1. Descripción del cambio implementado
2. Output del PLAN que generó el cambio
3. Veredicto GO de AUDIT-CODE
4. Versión actual del proyecto

---

## PROCESO DE VERSIONADO

### 1. Análisis del cambio

Revisa el PLAN y el código implementado para determinar:
- ¿Rompe compatibilidad? → MAJOR
- ¿Añade funcionalidad nueva? → MINOR
- ¿Corrige bugs sin añadir features? → PATCH

### 2. Archivos a actualizar

Actualiza la versión en **todos** los archivos aplicables:

**Python**:
- `pyproject.toml` → `[tool.poetry]` section `version = "X.Y.Z"`
- `setup.py` → `version="X.Y.Z"`
- `src/__init__.py` o similar → `__version__ = "X.Y.Z"`
- `VERSION` o `version.txt` (si existe)

**Node.js / JavaScript**:
- `package.json` → `"version": "X.Y.Z"`
- `package-lock.json` → actualizado automáticamente

**Otros lenguajes**:
- Java: `pom.xml` o `build.gradle`
- .NET: `.csproj` files
- Rust: `Cargo.toml`
- Go: usar tags de Git directamente

### 3. Actualizar CHANGELOG.md

Formato obligatorio (Keep a Changelog):

```markdown
# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [X.Y.Z] - YYYY-MM-DD

### Added
- Nueva funcionalidad 1
- Nueva funcionalidad 2

### Changed
- Cambio en funcionalidad existente

### Deprecated
- Funcionalidad marcada para eliminación futura

### Removed
- Funcionalidad eliminada

### Fixed
- Bug corregido 1
- Bug corregido 2

### Security
- Vulnerabilidad corregida

## [Versión anterior] - YYYY-MM-DD
...
```

**Reglas para CHANGELOG**:
- Solo incluir cambios relevantes para usuarios
- No incluir detalles internos de implementación
- Usar lenguaje claro y conciso
- Agrupar por tipo de cambio (Added, Changed, Fixed, etc.)
- Incluir referencias a issues/PRs si aplica

### 4. Generar comandos Git

Proporciona los comandos exactos para:

```bash
# 1. Hacer commit de cambios de versión
git add [archivos modificados]
git commit -m "chore: bump version to X.Y.Z"

# 2. Crear tag anotado
git tag -a vX.Y.Z -m "Release version X.Y.Z"

# 3. Push con tags
git push origin main --tags

# O crear release con GitHub CLI
gh release create vX.Y.Z --title "Release X.Y.Z" --notes "[CHANGELOG_CONTENT]"
```

---

## FORMATO DE OUTPUT OBLIGATORIO

```markdown
## VERSION MANAGEMENT REPORT

### Versión anterior
X.Y.Z

### Nueva versión
X.Y.Z

### Tipo de cambio
[MAJOR | MINOR | PATCH]

### Justificación
[Explicación de por qué este tipo de incremento]

---

## Archivos modificados

### pyproject.toml
```toml
[tool.poetry]
name = "project-name"
version = "X.Y.Z"
```

### src/__init__.py
```python
__version__ = "X.Y.Z"
```

### CHANGELOG.md
```markdown
## [X.Y.Z] - YYYY-MM-DD

### Added
- Nueva funcionalidad X

### Fixed
- Corrección de bug Y
```

---

## Comandos Git

```bash
# Commit de versionado
git add pyproject.toml src/__init__.py CHANGELOG.md
git commit -m "chore: bump version to X.Y.Z"

# Tag
git tag -a vX.Y.Z -m "Release version X.Y.Z

- Nueva funcionalidad X
- Corrección de bug Y"

# Push
git push origin main --tags
```

O usando GitHub CLI:

```bash
gh release create vX.Y.Z \
  --title "Release X.Y.Z" \
  --notes "## Changes

- Nueva funcionalidad X
- Corrección de bug Y

See full CHANGELOG at [link]"
```

---

## Verificación

Para verificar que --version funcione:

**Python**:
```bash
python -m nombre_proyecto --version
# O
python -c "import nombre_proyecto; print(nombre_proyecto.__version__)"
```

**Node.js**:
```bash
npm version
# O
node -e "console.log(require('./package.json').version)"
```

---

## AECF_COMPLIANCE_REPORT

1. Archivos seguidos:
   - 00_CONTEXT_PROJECT.md: APLICADO
   - 07_VERSION_MANAGEMENT.md: APLICADO

2. Flujo AECF: COMPLETO (post AUDIT-CODE GO)

3. Versión incrementada según: [MAJOR | MINOR | PATCH]
```

---

FINALIZA CON EXACTAMENTE:
VERSION MANAGEMENT COMPLETADO

---

## EJEMPLOS

### Ejemplo 1: Nueva funcionalidad (MINOR)

```
Input:
- PLAN: Añadir exportación a CSV
- Versión actual: 1.2.3

Análisis:
- No rompe compatibilidad ✓
- Añade nueva funcionalidad ✓
- No es solo un fix ✓

Decisión: MINOR (1.2.3 → 1.3.0)

CHANGELOG:
## [1.3.0] - 2026-02-05
### Added
- Exportación de usuarios a formato CSV
- Endpoint GET /api/users/export con soporte de paginación
```

### Ejemplo 2: Corrección de bug (PATCH)

```
Input:
- PLAN: Corregir validación de email
- Versión actual: 2.1.4

Análisis:
- No rompe compatibilidad ✓
- No añade funcionalidad nueva ✓
- Corrige bug existente ✓

Decisión: PATCH (2.1.4 → 2.1.5)

CHANGELOG:
## [2.1.5] - 2026-02-05
### Fixed
- Validación de email ahora acepta dominios con múltiples puntos
- Corregido error 500 en validación de caracteres especiales
```

### Ejemplo 3: Breaking change (MAJOR)

```
Input:
- PLAN: Cambiar estructura de respuesta de API de autenticación
- Versión actual: 1.8.2

Análisis:
- Rompe compatibilidad con clientes existentes ✗
- Requiere cambios en consumidores de API ✗

Decisión: MAJOR (1.8.2 → 2.0.0)

CHANGELOG:
## [2.0.0] - 2026-02-05
### Changed
- **BREAKING**: Estructura de respuesta en /api/auth/login ahora incluye refresh_token como campo separado
- **BREAKING**: Campo `user_data` renombrado a `user` en respuestas de autenticación

### Migration Guide
Los clientes deben actualizar:
- Antes: `response.user_data.id`
- Ahora: `response.user.id`
```

---

## NOTAS IMPORTANTES

1. **Primera versión pública**: Empieza en `3.0.0`
2. **Desarrollo pre-release**: Usa `0.x.y` donde `x` incrementa con features
3. **Versión 0.y.z**: No hay garantía de estabilidad
4. **Una vez en 3.0.0+**: Seguir SemVer estrictamente

---

## VALIDACIÓN FINAL

Antes de finalizar, verifica:
- [ ] Versión incrementada correctamente según tipo de cambio
- [ ] Todos los archivos de versión actualizados consistentemente
- [ ] CHANGELOG.md actualizado con formato correcto
- [ ] Comandos Git proporcionados y correctos
- [ ] Comando --version funciona correctamente
- [ ] Tag sigue formato vX.Y.Z
- [ ] No hay versiones inconsistentes en el proyecto
