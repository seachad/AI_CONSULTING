# GitHub CLI
------------

- instalación: en una terminal ejecutar winget install --id GitHub.cli
- comprobación (tras cerrar y abrir la terminal): gh --version
- login: gh auth login (hago login con seachad usando el browser)
- comprobacion; gh auth status
- arrancarlo: copilot -i "chat"

# AECF Prompts — Guía de uso

Este repositorio contiene el sistema de prompts **AECF (AI Engineering Controlled Flow)** para desarrollo de software con IA de forma segura, auditable y apta para producción.

## Estructura del repositorio

```
AECF_Prompts/
├── README.md                           (este archivo)
└── .prompts/
    ├── README.md                       (visión general de AECF)
    ├── README_SP.md                    (español extendido)
    ├── README_ENG.md                   (inglés)
    ├── README Extended.md              (versión completa en inglés)
    └── aecf/
        ├── 00_CONTEXT_GENERICS.md      (reglas generales para todos los proyectos)
        ├── 00_CONTEXT_PROJECT.md       (contrato de contexto específico del proyecto)
        ├── 00_EXISTING_FUNCTIONALLITY.md  (extracción de documentación técnica)
        ├── 00_DISCOVERY_LEGACY.md      (localización de código legacy)
        ├── 01_PLAN.md                  (diseño de alto nivel)
        ├── 02_AUDIT_PLAN.md            (auditoría del plan)
        ├── 03_FIX_PLAN.md              (corrección del plan)
        ├── 04_IMPLEMENT.md             (implementación)
        ├── 05_AUDIT_CODE.md            (auditoría del código)
        ├── 06_FIX_CODE.md              (corrección del código)
        ├── AECF_RULES.md               (reglas vinculantes del flujo)
        ├── AECF_POLICY.md              (política de detección de violaciones)
        └── aecf_flow.mmd               (diagrama oficial del flujo)
```

---

## Flujo AECF completo

### Funcionalidad nueva
```
PLAN → AUDIT-PLAN → IMPLEMENT → AUDIT-CODE → [FIX-CODE] → PRODUCTION
```

### Funcionalidad legacy
```
[EXISTING_FUNCTIONALLITY] → DISCOVERY → PLAN → AUDIT-PLAN → IMPLEMENT → AUDIT-CODE → [FIX-CODE] → PRODUCTION
```

---

## Descripción de los prompts

### 📄 00_CONTEXT_GENERICS.md

**Cuándo usar**: SIEMPRE, antes de cualquier fase AECF.

**Propósito**: Define reglas generales aplicables a todos los proyectos:
- Ubicación de documentos generados
- Compatibilidad multi-instancia / HAProxy
- Convenciones de threads/queues (T_* / Q_*)
- Variables CM_ en production_env_overrides.json
- Decorators para funciones de debug
- Tests obligatorios
- Convenciones de Mermaid

**Ejemplo de uso**:
```
HARD PRECONDITION: Load and enforce ./00_CONTEXT_GENERICS.md
```

---

### 📄 00_CONTEXT_PROJECT.md

**Cuándo usar**: SIEMPRE, en todas las fases AECF.

**Propósito**: Contrato de contexto específico del proyecto que define:
- Dominio de aplicación
- Restricciones arquitectónicas
- Seguridad y compliance
- Reglas no negociables
- Expectativas de output
- Overrides de AECF

**Ejemplo de uso**:
```
HARD PRECONDITION: Load and enforce ./00_CONTEXT_PROJECT.md before executing this prompt.
```

---

### 📄 00_EXISTING_FUNCTIONALLITY.md

**Cuándo usar**: Opcionalmente, ANTES de DISCOVERY, para funcionalidad legacy.

**Propósito**: Extrae documentación técnica factual del código existente sin diseñar, refactorizar ni recomendar.

**Produce**:
- `AECF_<NN>_DOCUMENTATION.md` con:
  - Scope y purpose
  - Entry points
  - High-level flow
  - Technical flow (detallado)
  - Dependency map
  - Configuración y entorno
  - I/O y side effects
  - Riesgos observados (factual)
  - Known unknowns
- `AECF_<NN>_FLOW.mmd` con:
  - Diagram 1: High-Level Flow
  - Diagram 2: Technical Flow

**Ejemplo de uso**:
```
Prompt: "Necesito documentar la funcionalidad de autenticación SSO existente antes de modificarla"

1. Cargar 00_CONTEXT_PROJECT.md
2. Aplicar 00_EXISTING_FUNCTIONALLITY.md
3. Indicar: "Funcionalidad: Autenticación SSO"
4. Especificar TOPIC="SSO_Auth" y NN="01"

Output esperado:
- documentation/SSO_Auth/AECF_01_DOCUMENTATION.md
- documentation/SSO_Auth/AECF_01_FLOW.mmd
```

**Reglas críticas**:
- Si el entry point no está claro → STOP y preguntar
- NO asumir, NO inferir comportamiento

---

### 📄 00_DISCOVERY_LEGACY.md

**Cuándo usar**: Para funcionalidad legacy, ANTES del PLAN.

**Propósito**: Localizar y enumerar todo el código relacionado con una funcionalidad existente.

**Produce**:
- Lista de archivos implicados
- Responsabilidad de cada archivo
- Flujo funcional identificado
- Límites del alcance

**Ejemplo de uso**:
```
Prompt: "Necesito modificar el sistema de roles y permisos"

1. Cargar 00_CONTEXT_PROJECT.md
2. Aplicar 00_DISCOVERY_LEGACY.md
3. Indicar: "Funcionalidad: Sistema de roles y permisos"

Output esperado:
## Archivos implicados
- app/auth/roles.py (definición de roles)
- app/auth/permissions.py (verificación de permisos)
- app/models/user.py (modelo de usuario con roles)

## Responsabilidad de cada archivo
...

## Flujo funcional identificado
...

## Límites del alcance
...

FUNCIONALIDAD DELIMITADA PARA AECF
```

**Reglas críticas**:
- NO modificar código
- NO proponer soluciones
- NO refactorizar
- SOLO enumerar y describir

---

### 📄 01_PLAN.md

**Cuándo usar**: Para toda funcionalidad (nueva o legacy), DESPUÉS de DISCOVERY si aplica.

**Propósito**: Definir claramente el alcance, riesgos y decisiones de diseño a alto nivel.

**Produce**:
- Alcance
- Suposiciones
- Riesgos
- Decisiones de diseño
- Plan de implementación (pasos numerados conceptuales)

**Ejemplo de uso**:
```
Prompt: "Necesito añadir autenticación de dos factores (2FA) al sistema"

1. Cargar 00_CONTEXT_PROJECT.md
2. (Opcional) Proporcionar output de DISCOVERY
3. Aplicar 01_PLAN.md

Output esperado:
## Alcance
- Implementar 2FA con TOTP
- Integrar con sistema de autenticación existente
- Permitir activación/desactivación por usuario

## Suposiciones
- Los usuarios ya tienen email verificado
- Se usará la librería pyotp

## Riesgos
- Usuarios pueden perder acceso si pierden su dispositivo
- Incremento en tiempo de login

## Decisiones de diseño
- Se usará TOTP (RFC 6238)
- El secret se almacenará encriptado
- Se proporcionarán códigos de backup

## Plan de implementación
1. Extender modelo User con campos 2FA
2. Crear endpoint para generar QR
3. Crear endpoint para verificar código
4. Modificar flujo de login
5. Implementar códigos de backup

PLAN LISTO PARA AUDITORÍA
```

**Reglas críticas**:
- NO generar código
- NO implementar
- Decisiones de ALTO NIVEL solamente

---

### 📄 02_AUDIT_PLAN.md

**Cuándo usar**: SIEMPRE después del PLAN, antes de IMPLEMENT.

**Propósito**: Auditar críticamente el plan para detectar ambigüedades, riesgos no cubiertos o decisiones cuestionables.

**Produce**:
- Hallazgos críticos
- Riesgos no cubiertos
- Ambigüedades detectadas
- Decisiones cuestionables
- Recomendaciones mínimas
- **Veredicto final (GO / NO-GO)**

**Ejemplo de uso**:
```
Prompt: "Audita el plan de implementación de 2FA"

1. Cargar 00_CONTEXT_PROJECT.md
2. Proporcionar el PLAN generado
3. Aplicar 02_AUDIT_PLAN.md

Output esperado:
## Hallazgos críticos
- No se especifica cómo se manejará la migración de usuarios existentes
- Falta definir el proceso de recuperación si se pierde el dispositivo

## Riesgos no cubiertos
- Ataques de fuerza bruta en códigos TOTP
- Sincronización de tiempo entre servidor y dispositivo

## Ambigüedades detectadas
- "Códigos de backup" no especifica cuántos ni cómo se generan

## Decisiones cuestionables
- Ninguna detectada

## Recomendaciones mínimas
- Especificar límite de intentos fallidos
- Definir proceso de recuperación
- Detallar generación de códigos de backup

## Veredicto final
NO-GO (requiere aclaración de puntos críticos)
```

**Reglas críticas**:
- NO reescribir el plan
- NO proponer soluciones detalladas
- Veredicto debe ser inequívoco

---

### 📄 03_FIX_PLAN.md

**Cuándo usar**: Cuando AUDIT_PLAN emite NO-GO.

**Propósito**: Corregir EXCLUSIVAMENTE los puntos señalados en la auditoría del plan.

**Produce**:
- Enumeración de cambios
- Justificación contra hallazgos de auditoría
- PLAN COMPLETO corregido

**Ejemplo de uso**:
```
Prompt: "Corrige el plan según los hallazgos de auditoría"

1. Cargar 00_CONTEXT_PROJECT.md
2. Proporcionar PLAN original + AUDIT_PLAN con NO-GO
3. Aplicar 03_FIX_PLAN.md

Output esperado:
## Cambios realizados
1. Añadida sección "Migración de usuarios existentes"
2. Especificado proceso de recuperación con admin
3. Definido: 10 códigos de backup de 8 dígitos
4. Añadido límite: 3 intentos fallidos → bloqueo temporal

## Justificación
- Hallazgo 1 (migración): Resuelto con proceso de activación opt-in
- Hallazgo 2 (recuperación): Resuelto con verificación por admin
...

## PLAN COMPLETO corregido
[Plan completo actualizado]

PLAN CORREGIDO LISTO PARA AUDITORÍA
```

**Reglas críticas**:
- NO ampliar el alcance
- NO introducir mejoras no solicitadas
- SOLO corregir lo auditado

---

### 📄 04_IMPLEMENT.md

**Cuándo usar**: SIEMPRE después de tener un PLAN con veredicto GO.

**Propósito**: Implementar el plan de forma literal, respetando todas las obligaciones técnicas de producción.

**Obligaciones técnicas**:
1. **Logging**: usar sistema de logging, no print()
2. **Gestión de recursos**: cerrar conexiones/archivos explícitamente
3. **Control de acceso**: implementar si hay datos sensibles
4. **Enumeración**: no exponer existencia de usuarios
5. **Exposición de datos**: solo campos necesarios
6. **Paginación**: requerida para listas

**Ejemplo de uso**:
```
Prompt: "Implementa el sistema 2FA según el plan aprobado"

1. Cargar 00_CONTEXT_PROJECT.md
2. Proporcionar PLAN con GO
3. Aplicar 04_IMPLEMENT.md

Output esperado:
[Código completo implementado con:]
- Docstrings claras
- Tipado
- Logging apropiado
- Gestión de recursos
- Control de acceso
- Ejemplos de uso

## AECF_COMPLIANCE_REPORT
1. Archivos seguidos:
   - 00_CONTEXT_PROJECT.md: APLICADO
   - 01_PLAN.md: APLICADO (input)
   - 04_IMPLEMENT.md: APLICADO

2. Flujo AECF: COMPLETO

3. Código generado: CON PLAN APROBADO

IMPLEMENTACIÓN COMPLETADA
```

**Reglas críticas**:
- NO rediseñar
- NO añadir funcionalidades no descritas
- Seguir el plan paso a paso

---

### 📄 05_AUDIT_CODE.md

**Cuándo usar**: SIEMPRE después de IMPLEMENT, antes de producción.

**Propósito**: Auditar el código contra el PLAN aprobado y criterios de producción.

**Criterios de evaluación**:
1. Corrección funcional
2. Seguridad
3. Control de acceso
4. Gestión de recursos
5. Logging y observabilidad
6. Manejo de errores
7. Concurrencia y race conditions
8. Escalabilidad básica
9. Mantenibilidad
10. Bugs y edge cases

**Clasificación de hallazgos**:
- **CRÍTICO**: bloquea producción → NO-GO
- **WARNING**: riesgo aceptable bajo condiciones → GO CONDICIONAL
- **INFO**: observación sin impacto → GO

**Ejemplo de uso**:
```
Prompt: "Audita el código 2FA implementado"

1. Cargar 00_CONTEXT_PROJECT.md
2. Proporcionar código + PLAN aprobado
3. Aplicar 05_AUDIT_CODE.md

Output esperado:
## Hallazgos

### CRÍTICO
- [C1] Secret TOTP no está encriptado en DB (riesgo seguridad)

### WARNING
- [W1] Falta rate limiting en endpoint de verificación
- [W2] Códigos de backup en texto plano en respuesta JSON

### INFO
- [I1] Docstring en verify_totp() podría ser más clara

## Veredicto
NO-GO (presencia de hallazgos CRÍTICOS)

## Justificación
El secret TOTP sin encriptar permite acceso directo a factores de autenticación.
```

**Reglas críticas**:
- NO reescribir código
- NO implementar soluciones
- SOLO detectar y clasificar

---

### 📄 06_FIX_CODE.md

**Cuándo usar**: Cuando AUDIT_CODE emite NO-GO o GO CONDICIONAL con correcciones obligatorias.

**Propósito**: Aplicar cambios mínimos necesarios para que el código sea apto para producción.

**Obligaciones de corrección**:
1. Sustituir print() por logging
2. Garantizar cierre de recursos
3. Implementar control de acceso si aplica
4. Neutralizar enumeración de usuarios
5. Reducir exposición de datos
6. Resolver WARNING obligatorios

**Ejemplo de uso**:
```
Prompt: "Corrige el código según el informe de auditoría"

1. Cargar 00_CONTEXT_PROJECT.md
2. Proporcionar código + AUDIT_CODE con NO-GO
3. Aplicar 06_FIX_CODE.md

Output esperado:
## Cambios aplicados

1. [C1] Secret TOTP encriptado usando Fernet antes de guardar
   - Añadida función encrypt_totp_secret()
   - Modificado User.save() para encriptar
   - Añadida función decrypt_totp_secret() para verificación

2. [W1] Añadido rate limiting en verify_totp
   - Implementado con Flask-Limiter
   - Límite: 5 intentos por minuto

3. [W2] Códigos de backup hasheados con bcrypt
   - Solo se devuelven en generación inicial
   - Verificación contra hash

[Código completo corregido]

## AECF_COMPLIANCE_REPORT
...

CÓDIGO CORREGIDO LISTO PARA AUDITORÍA
```

**Reglas críticas**:
- NO rediseñar funcionalidad
- NO ampliar alcance
- SOLO corregir lo señalado en AUDIT_CODE

---

## Ejemplos de flujos completos

### Ejemplo 1: Funcionalidad nueva

```
Escenario: Añadir exportación de datos a CSV

Paso 1: PLAN
Prompt: "Necesito añadir funcionalidad para exportar lista de usuarios a CSV"
→ Output: documentation/CSV_Export/AECF_01_PLAN.md

Paso 2: AUDIT_PLAN
Prompt: "Audita el plan de exportación CSV"
→ Output: Veredicto GO

Paso 3: IMPLEMENT
Prompt: "Implementa exportación CSV según plan aprobado"
→ Output: Código completo en app/export/csv_export.py

Paso 4: AUDIT_CODE
Prompt: "Audita el código de exportación CSV"
→ Output: NO-GO (falta paginación)

Paso 5: FIX_CODE
Prompt: "Corrige código según auditoría"
→ Output: Código corregido con paginación

Paso 6: AUDIT_CODE (re-ejecución)
Prompt: "Re-audita código corregido"
→ Output: GO
```

### Ejemplo 2: Funcionalidad legacy

```
Escenario: Modificar sistema de notificaciones existente

Paso 0 (opcional): EXISTING_FUNCTIONALLITY
Prompt: "Documenta el sistema de notificaciones existente"
→ Output: documentation/Notifications/AECF_01_DOCUMENTATION.md + FLOW.mmd

Paso 1: DISCOVERY
Prompt: "Localiza todo el código del sistema de notificaciones"
→ Output: Lista de archivos y flujo funcional

Paso 2: PLAN
Prompt: "Necesito añadir notificaciones por SMS al sistema existente"
[Incluir output de DISCOVERY]
→ Output: documentation/Notifications/AECF_02_PLAN.md

Paso 3-6: [Igual que ejemplo 1]
```

---

## Reglas de oro AECF

1. **Siempre cargar contexto**: 00_CONTEXT_GENERICS.md y 00_CONTEXT_PROJECT.md
2. **No saltarse fases**: cada fase tiene su propósito y validación
3. **Respetar prohibiciones**: cada fase tiene prohibiciones explícitas
4. **Veredictos inequívocos**: GO / GO CONDICIONAL / NO-GO
5. **Documentos secuenciales**: AECF_<NN>_<nombre> en documentation/<TOPIC>/
6. **Tests obligatorios**: todo código testeable debe incluir tests
7. **Compliance report**: IMPLEMENT y FIX_CODE deben incluirlo

---

## Troubleshooting

**P: ¿Puedo saltarme DISCOVERY si conozco bien el código?**  
R: DISCOVERY es opcional pero recomendado. Si hay duda, úsalo.

**P: ¿Qué hago si AUDIT_PLAN da NO-GO repetidamente?**  
R: Revisa si el problema está en el alcance o en la comprensión del requisito original.

**P: ¿Puedo combinar FIX_PLAN y FIX_CODE en una sola iteración?**  
R: No. Son fases independientes. FIX_PLAN corrige el diseño, FIX_CODE corrige la implementación.

**P: ¿Cómo sé si usar EXISTING_FUNCTIONALLITY o DISCOVERY?**  
R: EXISTING_FUNCTIONALLITY extrae documentación técnica detallada. DISCOVERY localiza archivos. Puedes usar ambos secuencialmente.

---

## Referencias

- [AECF_RULES.md](.prompts/aecf/AECF_RULES.md) — Reglas vinculantes del flujo
- [AECF_POLICY.md](.prompts/aecf/AECF_POLICY.md) — Política de detección de violaciones
- [aecf_flow.mmd](.prompts/aecf/aecf_flow.mmd) — Diagrama oficial del flujo
- [README.md](.prompts/README.md) — Visión general de AECF

---

## Herramientas adicionales

### Github CLI

Para trabajar con GitHub desde la terminal:

```bash
# Instalación
winget install --id GitHub.cli

# Comprobación (tras cerrar y abrir la terminal)
gh --version

# Login
gh auth login
```

---

## Licencia y contribuciones

Este sistema de prompts es parte del framework AECF desarrollado por Seachad.

Para contribuir o reportar issues: [contacto del proyecto]
 (seguir instrucciones - en mi caso hago login con seachad)


