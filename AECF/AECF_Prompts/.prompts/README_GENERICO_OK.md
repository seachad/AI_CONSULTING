# AECF — AI Engineering Controlled Flow

**Guía práctica completa para usar AECF**

---

## ¿Qué es AECF?

AECF es el **protocolo obligatorio de trabajo con IA** para generar código **seguro, auditable y apto para producción**.

No es un prompt.  
No es una guía de estilo.  
No es opcional.

Es un **flujo de ingeniería controlado** que estructura cómo trabajar con modelos de lenguaje en proyectos reales.

### Componentes de AECF

**AI (Artificial Intelligence)**  
Uso explícito de modelos de lenguaje como asistentes técnicos.

**Engineering**  
Aplicado a ingeniería real (software en producción, no demos ni prototipos).

**Controlled**  
El proceso está gobernado por reglas estrictas. No hay creatividad libre ni saltos de fase.

**Flow**  
Flujo secuencial obligatorio, con estados definidos y veredictos formales.

### Por qué existe AECF

Cada fase:
- tiene un rol claro
- tiene reglas explícitas
- produce un artefacto auditable
- bloquea la siguiente si no se cumple

El incumplimiento del flujo **invalida el resultado**.

---

## Inicio rápido


### Paso 1: Cargar contexto (SIEMPRE)

Antes de ejecutar **cualquier fase AECF**, cargar:

- [00_CONTEXT_GENERICS.md](aecf/00_CONTEXT_GENERICS.md) — Reglas generales para todos los proyectos
- [00_CONTEXT_PROJECT.md](aecf/00_CONTEXT_PROJECT.md) — Contrato específico del proyecto

**Ejemplo de precondición en prompt:**
```
HARD PRECONDITION: Load and enforce ./00_CONTEXT_GENERICS.md
HARD PRECONDITION: Load and enforce ./00_CONTEXT_PROJECT.md before executing this prompt.
```

### Paso 2: Elegir el flujo

**¿Es funcionalidad nueva o legacy?**

- **Nueva** → No existe en el código → Ir a [Flujo para funcionalidad nueva](#flujo-para-funcionalidad-nueva)
- **Legacy** → Ya existe en el código → Ir a [Flujo para funcionalidad legacy](#flujo-para-funcionalidad-legacy)

---

## Flujo para funcionalidad nueva

```
PLAN → AUDIT-PLAN → IMPLEMENT → AUDIT-CODE → [FIX-CODE] → PRODUCTION
```

### 1. PLAN ([01_PLAN.md](aecf/01_PLAN.md))

**Objetivo**: Definir alcance, riesgos y decisiones de diseño a alto nivel.

**Ejemplo**:
```
Prompt: "Necesito añadir exportación de usuarios a CSV"

1. Cargar contextos (GENERICS + PROJECT)
2. Aplicar 01_PLAN.md
3. Describir el requisito

Output esperado:
- Alcance definido
- Suposiciones explícitas
- Riesgos identificados
- Decisiones de diseño justificadas
- Plan de implementación (pasos conceptuales)
```

**NO hacer**: Generar código, implementar, optimizar.

### 2. AUDIT-PLAN ([02_AUDIT_PLAN.md](aecf/02_AUDIT_PLAN.md))

**Objetivo**: Auditar críticamente el plan antes de implementar.

**Produce**: Veredicto **GO** o **NO-GO**

**Si NO-GO** → Ir a paso 2.1 (FIX-PLAN)  
**Si GO** → Continuar a paso 3 (IMPLEMENT)

#### 2.1 FIX-PLAN ([03_FIX_PLAN.md](aecf/03_FIX_PLAN.md))

**Objetivo**: Corregir **SOLO** los puntos señalados en AUDIT-PLAN.

**NO hacer**: Ampliar alcance, introducir mejoras no solicitadas.

Después de FIX-PLAN → Volver a AUDIT-PLAN (paso 2).

### 3. IMPLEMENT ([04_IMPLEMENT.md](aecf/04_IMPLEMENT.md))

**Objetivo**: Implementar el plan literalmente.

**Obligaciones técnicas de producción**:
1. **Logging**: usar sistema de logging (NO `print()`)
2. **Gestión de recursos**: cerrar conexiones/archivos explícitamente
3. **Control de acceso**: implementar si hay datos sensibles
4. **Enumeración**: no exponer existencia de usuarios
5. **Exposición de datos**: solo campos necesarios
6. **Paginación**: requerida para listas

**NO hacer**: Rediseñar, añadir funcionalidades no descritas.

### 4. AUDIT-CODE ([05_AUDIT_CODE.md](aecf/05_AUDIT_CODE.md))

**Objetivo**: Auditar código contra PLAN y criterios de producción.

**Clasificación de hallazgos**:
- **CRÍTICO** → NO-GO (bloquea producción)
- **WARNING** → GO CONDICIONAL (riesgo aceptable)
- **INFO** → GO (observación sin impacto)

**Si NO-GO o GO CONDICIONAL** → Ir a paso 4.1 (FIX-CODE)  
**Si GO** → **PRODUCCIÓN** ✅

#### 4.1 FIX-CODE ([06_FIX_CODE.md](aecf/06_FIX_CODE.md))

**Objetivo**: Aplicar cambios mínimos para hacer el código apto para producción.

**NO hacer**: Rediseñar, ampliar alcance.

Después de FIX-CODE → Volver a AUDIT-CODE (paso 4).

---

## Flujo para funcionalidad legacy

```
[EXISTING_FUNCTIONALLITY] → DISCOVERY → PLAN → AUDIT-PLAN → IMPLEMENT → AUDIT-CODE → [FIX-CODE]
```

### 0. EXISTING_FUNCTIONALLITY (opcional) ([00_EXISTING_FUNCTIONALLITY.md](aecf/00_EXISTING_FUNCTIONALLITY.md))

**Cuándo usar**: Cuando necesitas documentación técnica detallada del código existente **antes** de DISCOVERY.

**Objetivo**: Extraer documentación factual del código sin diseñar, refactorizar ni recomendar.

**Produce**:
- `AECF_<NN>_DOCUMENTATION.md` con:
  - Scope y purpose
  - Entry points
  - High-level flow
  - Technical flow detallado
  - Dependency map
  - Configuración y entorno
  - I/O y side effects
  - Riesgos observados (factual)
  - Known unknowns
- `AECF_<NN>_FLOW.mmd` con diagramas en formato mermaid

**Regla crítica**: Si el entry point no está claro → **STOP** y preguntar.

**NO hacer**: Asumir, inferir comportamiento, diseñar, recomendar.

### 1. DISCOVERY ([00_DISCOVERY_LEGACY.md](aecf/00_DISCOVERY_LEGACY.md))

**Objetivo**: Localizar y enumerar todo el código relacionado con la funcionalidad existente.

**Produce**:
- Lista de archivos implicados
- Responsabilidad de cada archivo
- Flujo funcional identificado
- Límites del alcance

**NO hacer**: Modificar código, proponer soluciones, refactorizar.

**Output de EXISTING_FUNCTIONALLITY** puede usarse como entrada enriquecida para DISCOVERY.

### 2-5. Continúa igual que funcionalidad nueva

PLAN → AUDIT-PLAN → [FIX-PLAN] → IMPLEMENT → AUDIT-CODE → [FIX-CODE]

---

## Contexto obligatorio: CONTEXT_GENERICS y CONTEXT_PROJECT

### Reglas clave de CONTEXT_GENERICS

Aplicables a **todos los proyectos**:

1. **Ubicación de documentos**: `documentation/<chat_title>/AECF_<num>_<nombre_documento>`
2. **Multi-instancia / HAProxy**: toda escritura compartida protegida contra race conditions
3. **Threads/queues**: 
   - Variables CM_ controlan el modo
   - Threads: `T_*`
   - Queues: `Q_*`
4. **Debug en producción**: usar decorator `function_not_for_production`
5. **Variables CM_**: en `production_env_overrides.json`, NO en `.env`
6. **Documentación .md**: siempre en `documentation/`
7. **Tests obligatorios**: todo código testeable debe incluir tests en `tests/`
8. **Mermaid**: archivos `.mmd` en `documentation/`, sin comentarios markdown

### Reglas clave de CONTEXT_PROJECT

Específicas del proyecto:
- Dominio de aplicación
- Restricciones arquitectónicas (lenguaje, frameworks, runtime)
- Seguridad y compliance
- Reglas no negociables
- Expectativas de output
- Overrides de AECF

---

## Estructura del repositorio

```
AECF_Prompts/
├── README.md                           
└── .prompts/
    ├── README_GENERICO_OK.md           (este archivo - guía práctica)
    ├── README_SP.md                    (español extendido)
    ├── README_ENG.md                   (inglés)
    └── aecf/
        ├── 00_CONTEXT_GENERICS.md      (reglas generales)
        ├── 00_CONTEXT_PROJECT.md       (contrato del proyecto)
        ├── 00_EXISTING_FUNCTIONALLITY.md  (extracción de documentación)
        ├── 00_DISCOVERY_LEGACY.md      (localización de código legacy)
        ├── 01_PLAN.md                  (diseño alto nivel)
        ├── 02_AUDIT_PLAN.md            (auditoría del plan)
        ├── 03_FIX_PLAN.md              (corrección del plan)
        ├── 04_IMPLEMENT.md             (implementación)
        ├── 05_AUDIT_CODE.md            (auditoría del código)
        ├── 06_FIX_CODE.md              (corrección del código)
        ├── AECF_RULES.md               (reglas vinculantes)
        ├── AECF_POLICY.md              (política de detección de violaciones)
        └── aecf_flow.mmd               (diagrama oficial del flujo)
```

---

## Referencia rápida de prompts

### Contexto (usar SIEMPRE)
- **00_CONTEXT_GENERICS.md** — Reglas generales
- **00_CONTEXT_PROJECT.md** — Contrato específico del proyecto

### Funcionalidad legacy (opcional)
- **00_EXISTING_FUNCTIONALLITY.md** — Extrae documentación técnica factual
- **00_DISCOVERY_LEGACY.md** — Localiza código existente

### Funcionalidad nueva o legacy
- **01_PLAN.md** — Define alcance, riesgos, decisiones de diseño
- **02_AUDIT_PLAN.md** — Audita el plan (GO / NO-GO)
- **03_FIX_PLAN.md** — Corrige el plan según auditoría
- **04_IMPLEMENT.md** — Implementa según plan aprobado
- **05_AUDIT_CODE.md** — Audita código (GO / GO CONDICIONAL / NO-GO)
- **06_FIX_CODE.md** — Corrige código según auditoría

---

## Ejemplos prácticos paso a paso

### Ejemplo 1: Añadir exportación de usuarios a CSV (funcionalidad nueva)

```
1. PLAN
   Prompt: "Necesito añadir funcionalidad para exportar lista de usuarios a CSV"
   → Output: documentation/CSV_Export/AECF_01_PLAN.md

2. AUDIT_PLAN
   Prompt: "Audita el plan de exportación CSV"
   → Veredicto: GO

3. IMPLEMENT
   Prompt: "Implementa exportación CSV según plan aprobado"
   → Output: Código en app/export/csv_export.py

4. AUDIT_CODE
   Prompt: "Audita el código de exportación CSV"
   → Veredicto: NO-GO (falta paginación)

5. FIX_CODE
   Prompt: "Corrige código según auditoría"
   → Output: Código corregido con paginación

6. AUDIT_CODE (re-ejecución)
   Prompt: "Re-audita código corregido"
   → Veredicto: GO ✅
```

### Ejemplo 2: Modificar sistema de notificaciones existente (funcionalidad legacy)

```
0. EXISTING_FUNCTIONALLITY (opcional)
   Prompt: "Documenta el sistema de notificaciones existente"
   → Output: documentation/Notifications/AECF_01_DOCUMENTATION.md
             documentation/Notifications/AECF_01_FLOW.mmd

1. DISCOVERY
   Prompt: "Localiza todo el código del sistema de notificaciones"
   → Output: Lista de archivos y flujo funcional

2. PLAN
   Prompt: "Necesito añadir notificaciones por SMS al sistema existente"
   [Incluir output de DISCOVERY + EXISTING_FUNCTIONALLITY]
   → Output: documentation/Notifications/AECF_02_PLAN.md

3-6. [Igual que Ejemplo 1: AUDIT-PLAN → IMPLEMENT → AUDIT-CODE → FIX-CODE]
```

### Ejemplo 3: Implementar 2FA (funcionalidad nueva con iteraciones)

```
1. PLAN
   Prompt: "Añadir autenticación de dos factores (2FA) con TOTP"
   Output: PLAN con alcance, riesgos, decisiones

2. AUDIT_PLAN
   Prompt: "Audita el plan 2FA"
   Output: NO-GO
   Hallazgos:
   - No se especifica migración de usuarios existentes
   - Falta proceso de recuperación
   - Códigos de backup sin definir

3. FIX_PLAN
   Prompt: "Corrige plan según auditoría"
   Output: PLAN corregido con:
   - Proceso de activación opt-in
   - Recuperación via admin
   - 10 códigos de backup de 8 dígitos

4. AUDIT_PLAN (re-ejecución)
   Prompt: "Re-audita plan corregido"
   Output: GO

5. IMPLEMENT
   Prompt: "Implementa sistema 2FA según plan aprobado"
   Output: Código completo con todas las obligaciones técnicas

6. AUDIT_CODE
   Prompt: "Audita código 2FA"
   Output: NO-GO
   Hallazgos CRÍTICOS:
   - [C1] Secret TOTP sin encriptar en DB

7. FIX_CODE
   Prompt: "Corrige código según auditoría"
   Output: Secret encriptado con Fernet

8. AUDIT_CODE (re-ejecución)
   Prompt: "Re-audita código corregido"
   Output: GO ✅
```

---

## Reglas de oro AECF

1. **Siempre cargar contexto**: CONTEXT_GENERICS + CONTEXT_PROJECT antes de cualquier fase
2. **No saltarse fases**: cada fase valida la anterior
3. **Respetar prohibiciones**: cada fase tiene prohibiciones explícitas que invalidan la respuesta
4. **Veredictos inequívocos**: GO / GO CONDICIONAL / NO-GO (nunca ambiguo)
5. **Documentos secuenciales**: `AECF_<NN>_<nombre>` en `documentation/<TOPIC>/`
6. **Tests obligatorios**: todo código testeable debe incluir tests en `tests/`
7. **Compliance report**: IMPLEMENT y FIX_CODE deben incluir AECF_COMPLIANCE_REPORT

---

## Normativa oficial

Las reglas completas y vinculantes están en:

📄 **[AECF_RULES.md](aecf/AECF_RULES.md)** — Fuente de verdad para:
- Fases y su autoridad
- Reglas de cada fase
- Formatos obligatorios
- Restricciones
- Condiciones de GO / NO-GO

📄 **[AECF_POLICY.md](aecf/AECF_POLICY.md)** — Política de detección de violaciones

📄 **[aecf_flow.mmd](aecf/aecf_flow.mmd)** — Diagrama oficial del flujo

---

## Troubleshooting y preguntas frecuentes

### ¿Cuándo usar EXISTING_FUNCTIONALLITY vs DISCOVERY?

- **EXISTING_FUNCTIONALLITY**: Documentación técnica **detallada** del código (entry points, flujos, dependencias, riesgos)
- **DISCOVERY**: **Localización** rápida de archivos y delimitación de alcance

Puedes usar ambos secuencialmente: EXISTING_FUNCTIONALLITY proporciona entrada enriquecida para DISCOVERY.

### ¿Puedo saltarme DISCOVERY si conozco bien el código?

DISCOVERY es opcional pero **recomendado**. Si hay duda sobre alcance o ubicación de código, úsalo.

### ¿Qué hago si AUDIT_PLAN da NO-GO repetidamente?

1. Revisa si el problema está en la **comprensión del requisito original**
2. Asegúrate de que el **alcance está bien definido**
3. Verifica que las **suposiciones sean correctas**
4. Si persiste, considera si el requisito es viable con las restricciones del proyecto

### ¿Puedo combinar FIX_PLAN y FIX_CODE en una sola iteración?

**No**. Son fases independientes:
- **FIX_PLAN** corrige el **diseño**
- **FIX_CODE** corrige la **implementación**

Cada una requiere su propia auditoría posterior.

### ¿Qué significa GO CONDICIONAL?

El código puede ir a producción **aceptando explícitamente un riesgo residual**. Los WARNING deben:
- Estar documentados
- Tener justificación de por qué no se resuelven
- Tener aceptación explícita del riesgo

### ¿Cómo sé qué TOPIC y NN usar?

- **TOPIC**: Nombre descriptivo de la funcionalidad (ej: `SSO_Auth`, `CSV_Export`, `Notifications`)
- **NN**: Número secuencial de documento (01, 02, 03...) para mantener orden cronológico

Ejemplo: `documentation/CSV_Export/AECF_01_PLAN.md`, `documentation/CSV_Export/AECF_02_IMPLEMENT.md`

### ¿Qué hago si la IA genera código en fase PLAN?

**Descarta la respuesta completa**. Es una violación de fase que invalida el resultado. Re-ejecuta la fase con énfasis en las prohibiciones.

---

## Relación con otros enfoques

### AECF vs SPAD

- **SPAD**: Ligero, adecuado para exploración y prototipos
- **AECF**: Cerrado, estricto, orientado a **producción**

AECF añade:
- Control explícito de fases
- Responsabilidad clara en cada paso
- Trazabilidad completa
- Auditoría formal obligatoria
- Reducción de riesgo sistémico (seguridad, bugs, compliance)

### Cuándo usar cada uno

- **Usar SPAD**: Exploración, POCs, prototipos rápidos, demos
- **Usar AECF**: Código que va a producción, sistemas críticos, entornos regulados

---

## Declaración de principio

> **En Seachad no usamos IA para "programar".**
>
> **Usamos AI Engineering con flujo controlado (AECF).**

La IA amplifica la disciplina de ingeniería que ya existe. AECF garantiza que lo amplificado sea **disciplina, no fragilidad**.

---

## Herramientas complementarias

### GitHub CLI

```bash
# Instalación en Windows
winget install --id GitHub.cli

# Verificar instalación
gh --version

# Autenticación (seguir instrucciones en browser)
gh auth login

# Verificar estado de autenticación
gh auth status

# Comandos útiles
gh repo view                    # Ver info del repositorio
gh pr list                      # Listar pull requests
gh issue list                   # Listar issues
gh pr create                    # Crear pull request

# GitHub Copilot CLI (si está instalado)
gh copilot suggest "comando que necesito"
gh copilot explain "comando complejo"
```

### Git básico para AECF

```bash
# Crear rama para nueva funcionalidad
git checkout -b feature/nombre-funcionalidad

# Commits estructurados
git commit -m "AECF-PLAN: Definir exportación CSV"
git commit -m "AECF-IMPLEMENT: Implementar exportación CSV"
git commit -m "AECF-FIX: Corregir paginación en exportación"

# Push y crear PR
git push origin feature/nombre-funcionalidad
gh pr create --title "Feature: Exportación CSV" --body "AECF completo: PLAN → IMPLEMENT → AUDIT → FIX"
```

---

## Referencias y recursos

- [AECF_RULES.md](aecf/AECF_RULES.md) — Reglas vinculantes del flujo
- [AECF_POLICY.md](aecf/AECF_POLICY.md) — Política de detección de violaciones
- [aecf_flow.mmd](aecf/aecf_flow.mmd) — Diagrama oficial del flujo
- [README_SP.md](README_SP.md) — Visión general en español
- [README_ENG.md](README_ENG.md) — Overview in English

---

## Licencia y contribuciones

Este sistema de prompts es parte del framework **AECF** desarrollado por **Seachad**.

Para contribuir o reportar issues: [contacto del proyecto]

---

### Información de uso de GitHub Copilot chat (opcional)

#### GitHub CLI

```bash
# Instalación
winget install --id GitHub.cli

# Comprobación (tras cerrar y abrir la terminal)
gh --version

# Login (seguir instrucciones en el browser)
gh auth login

# Verificar autenticación
gh auth status

# Arrancar GitHub Copilot CLI (opcional)
gh copilot -i "chat"
```



**Versión del documento**: 1.0  
**Última actualización**: Febrero 2026  
**Estado**: Producción
