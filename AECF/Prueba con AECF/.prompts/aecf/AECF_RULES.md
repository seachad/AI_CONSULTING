Toda generación de código en este repositorio debe seguir AECF.
PLAN aprobado + AUDIT GO son obligatorios.

Ciclo completo para funcionalidad nueva:

```mermaid
flowchart TD
    A[PROMPT_WRAPPER - PLAN] --> B[PLAN]
    B --> C{AUDIT-PLAN}
    C -->|NO-GO| D[FIX-PLAN]
    D --> C
    C -->|GO| E[IMPLEMENT]
    E --> F{AUDIT-CODE}
    F -->|NO-GO| G[FIX-CODE]
    G --> F
    F -->|GO| H[✓ COMPLETO]
    

```
Empieza siempre por PROMPT_WRAPPER - 01 - PLAN, está para ayudar en la secuencia de órdenes y fases


Ciclo completo para funcionalidad legacy (existente en un proyecto ya desarrollado anteriormente):

```mermaid
flowchart TD
    A[PROMPT_WRAPPER - DISCOVERY] --> B[DISCOVERY LEGACY]
    B --> C[PROMPT_WRAPPER - PLAN]
    C --> D[PLAN]
    D --> E{AUDIT-PLAN}
    E -->|NO-GO| F[FIX-PLAN]
    F --> E
    E -->|GO| G[IMPLEMENT]
    G --> H{AUDIT-CODE}
    H -->|NO-GO| I[FIX-CODE]
    I --> H
    H -->|GO| J[✓ COMPLETO]
```
Empieza siempre por PROMPT_WRAPPER - 00 - DISCOVERY_LEGACY, está para ayudar en la secuencia de órdenes y fases

COMO REGLA GENERAL
- Para funcionalidad nueva, se inicia el flujo con PROMPT_WRAPPER - PLAN.
- Para funcionalidad existente, se inicia el flujo con PROMPT_WRAPPER - DISCOVERY.
- El output de DISCOVERY se usa como contexto congelado de entrada al PLAN.
- PLAN es único y soberano.
