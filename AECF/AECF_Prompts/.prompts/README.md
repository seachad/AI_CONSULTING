# AECF
# AI Engineering Controlled Flow

AECF es el **protocolo obligatorio de trabajo con IA** en este repositorio.

No es un prompt.  
No es una guía de estilo.  
No es opcional.

Es un **flujo de ingeniería controlado**, diseñado para generar código **seguro, auditable y apto para producción** mediante modelos de lenguaje.

---

## Contexto obligatorio (CONTEXT_GENERICS / CONTEXT_PROJECT)

Antes de ejecutar cualquier fase AECF, se debe cargar y respetar:

- [\.prompts/aecf/00_CONTEXT_GENERICS.md](.prompts/aecf/00_CONTEXT_GENERICS.md)
- [\.prompts/aecf/00_CONTEXT_PROJECT.md](.prompts/aecf/00_CONTEXT_PROJECT.md)

Puntos clave:

- **Precondición dura**: aplicar primero el contexto genérico.
- **Entrega de documentos**: cualquier artefacto de fase debe generarse en documentation/<chat_title>/AECF_<num>_<nombre_documento>.
- **Determinismo y claridad**: sin estado global injustificado, sin comportamiento “mágico”, salidas deterministas.
- **Compatibilidad multi-instancia / HAProxy**: toda escritura compartida debe estar protegida contra condiciones de carrera.
- **Threads/queues**: cualquier ejecución con thread debe poder hacerse con queue; variables CM_ controlan el modo. Threads: T_*, queues: Q_*.
- **Debug en producción**: funciones de debug deben usar el decorator `function_not_for_production`.
- **Variables CM_**: deben existir en production_env_overrides.json con la misma estructura y no ir por defecto en .env.
- **Documentación .md**: siempre en documentation.
- **Tests**: todo código testeable debe incluir tests en tests/.
- **Mermaid**: los flows se generan en documentation con extensión .mmd y sin comentarios markdown.

El contrato de contexto de proyecto define además el dominio, restricciones arquitectónicas, seguridad/compliance, expectativas de output y posibles overrides.

---

## Qué es AECF

**AI**  
Uso explícito de modelos de lenguaje como asistentes técnicos.

**Engineering**  
Aplicado a ingeniería real (software en producción, no demos ni prototipos).

**Controlled**  
El proceso está gobernado por reglas estrictas.  
No hay creatividad libre ni saltos de fase.

**Flow**  
Flujo secuencial obligatorio, con estados definidos y veredictos formales.

---

## AECF no es un prompt

AECF es un **protocolo de trabajo**.

Cada fase:
- tiene un rol claro
- tiene reglas explícitas
- produce un artefacto auditable
- bloquea la siguiente si no se cumple

El incumplimiento del flujo **invalida el resultado**.

---

## Normativa oficial

Las reglas completas y vinculantes del flujo están definidas en:

📄 **AECF_RULES.md**

Este archivo es la **fuente de verdad**:
- fases
- reglas
- formatos
- restricciones
- condiciones de GO / NO-GO

El README describe el flujo.  
`AECF_RULES.md` **lo gobierna**.

---

## Flujo AECF — Funcionalidad nueva

Se considera funcionalidad nueva aquella que **no existe previamente** en el repositorio.

### Flujo obligatorio

```
PLAN
 → AUDIT-PLAN
   → (GO / NO-GO)
     → IMPLEMENT
       → AUDIT-CODE
         → (GO / NO-GO)
           → FIX-CODE
```

### Principios clave

- El PLAN define el contrato funcional y técnico.
- AUDIT-PLAN decide si el diseño es aceptable.
- IMPLEMENT solo ocurre con PLAN aprobado.
- FIX es siempre reactivo a un NO-GO.
- No se avanza sin veredicto explícito.

---

## Flujo AECF — Funcionalidad legacy

Se considera funcionalidad legacy aquella que **ya existe en el código**,
aunque vaya a ser modificada, extendida o auditada.

### Flujo obligatorio

```
[EXISTING_FUNCTIONALLITY (opcional)]
 → DISCOVERY
   → PLAN
     → AUDIT-PLAN
       → (GO / NO-GO)
         → IMPLEMENT
           → AUDIT-CODE
             → (GO / NO-GO)
               → FIX-CODE
```

### Reglas importantes

- **EXISTING_FUNCTIONALLITY** es una fase previa **opcional** que extrae documentación técnica factual del código existente **antes de DISCOVERY**.
- EXISTING_FUNCTIONALLITY **no diseña**, **no refactoriza**, **no recomienda**.
- EXISTING_FUNCTIONALLITY produce:
  - `AECF_<NN>_DOCUMENTATION.md` (scope, entry points, flujo técnico, dependencias, I/O, riesgos observados, known unknowns)
  - `AECF_<NN>_FLOW.mmd` (diagramas high-level y técnico en formato mermaid)
- El output de EXISTING_FUNCTIONALLITY puede servir como **entrada enriquecida** para DISCOVERY.
- DISCOVERY **no diseña** ni evalúa calidad.
- DISCOVERY **solo localiza y delimita**.
- El output de DISCOVERY se usa como **contexto congelado** del PLAN.
- No existe `PLAN_LEGACY`.
- PLAN es único y soberano para todo el sistema.

EXISTING_FUNCTIONALLITY **documenta** el estado actual.  
DISCOVERY **prepara** el PLAN.  
PLAN **toma decisiones**.

---

## Cómo trabajar en este repositorio

### Funcionalidad nueva
1. Comienza por `PROMPT_WRAPPER - 01 - PLAN`
2. Sigue el flujo definido en `AECF_RULES.md`
3. No saltes fases

### Funcionalidad existente (legacy)
1. (Opcional) Comienza por `00_EXISTING_FUNCTIONALLITY` para extraer documentación técnica factual
   - Genera `AECF_<NN>_DOCUMENTATION.md` (scope, entry points, flujo, dependencias, I/O, riesgos)
   - Genera `AECF_<NN>_FLOW.mmd` (diagramas high-level y técnico)
   - Sirve como entrada enriquecida para DISCOVERY
2. Comienza o continúa por `PROMPT_WRAPPER - 00 - DISCOVERY_LEGACY`
3. Usa el resultado como entrada al PLAN
4. Continúa el flujo AECF normal

---

## Relación con otros enfoques

AECF se relaciona con SPAD en que ambos estructuran el trabajo con IA.

- **SPAD** es ligero y adecuado para exploración o prototipos.
- **AECF** es cerrado, estricto y orientado a producción.

AECF introduce:
- control explícito
- responsabilidad clara
- trazabilidad
- auditoría formal
- reducción de riesgo sistémico
  (seguridad, bugs, compliance)

---

## Declaración de principio

En Seachad no usamos IA para “programar”.

Usamos **AI Engineering con flujo controlado (AECF)**.


## Official AECF Flow Diagram

The official visual reference for the AECF workflow is available here:

➡️ [View AECF flow diagram](docs/aecf_flow.mmd)

This diagram represents the canonical AECF process.