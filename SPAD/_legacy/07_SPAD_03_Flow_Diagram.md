# SPAD – Methodology Flows

> **Legal notice and disclaimer.** SPAD is a reference methodology provided "as is" and for information purposes only. It does not constitute legal, regulatory or professional advice, does not guarantee results or compliance with any law or standard, and is not a certification. Each organisation that uses it is solely responsible for validating its results, verifying the regulation that applies to it and certifying its own regulatory compliance. The author and SEACHAD accept no liability for its use.

## Core Workflow (New Functionality)

```mermaid
flowchart TD
    A[Context & Objective]
    B[PLAN]
    C[AUDIT_PLAN]
    D[CODE_PRIMER]
    TS[TEST_STRATEGY]
    E[IMPLEMENTATION]
    TI[TEST_IMPLEMENTATION]
    AT[AUDIT_TESTS]
    F[AUDIT_CODE]
    G[FIX_PRIMERS]
    V[VERSION_MANAGEMENT]
    H[STABLE SYSTEM]

    A --> B
    B --> C
    C -->|GO| D
    C -->|CHANGES| B
    C -->|NO-GO| A
    D --> TS
    TS --> E
    E --> TI
    TI --> AT
    AT -->|GO| F
    AT -->|NO-GO| TI
    F -->|OK| V
    F -->|ISSUES| G
    G --> E
    V --> H
```

## Legacy Workflow

```mermaid
flowchart TD
    LEG[Legacy Code]
    DOC[DOCUMENT_EXISTING]
    DISC[DISCOVERY_LEGACY]
    PLAN[Continue Core Workflow]
    
    LEG --> DOC
    DOC --> DISC
    DISC --> PLAN
```

## Debug Workflow

```mermaid
flowchart TD
    INC[Incident]
    DBG[DEBUG]
    RCA[RCA Report]
    DEC{Type}
    
    INC --> DBG
    DBG --> RCA
    RCA --> DEC
    DEC -->|CODE| PLAN[Core Workflow]
    DEC -->|CONFIG| CFG[Config Adjustment]
    DEC -->|INFRA| CMD[System Command]
```

## Hotfix Workflow (P1/P2 Emergencies)

```mermaid
flowchart TD
    P1[🚨 P1/P2 Incident]
    DBG[Fast DEBUG]
    HF[HOTFIX Plan]
    AUD[Accelerated AUDIT]
    IMP[IMPLEMENT]
    DEP[DEPLOY]
    MON[MONITOR 30min]
    PM[POST-MORTEM]
    FUT[Future Definitive PLAN]
    
    P1 --> DBG
    DBG --> HF
    HF --> AUD
    AUD -->|GO| IMP
    AUD -->|NO-GO| HF
    IMP --> DEP
    DEP --> MON
    MON --> PM
    PM -->|Temporary Fix| FUT
    PM -->|Definitive Fix| DONE[Complete]
```

## Security Review Workflow

```mermaid
flowchart TD
    CODE[Implemented Code]
    SEC[SECURITY_AUDIT]
    CLASS{Classify}
    CRIT[FIX Critical]
    HIGH[FIX High]
    DEC{Decision}
    MED[FIX Medium]
    DOC[Document Residual Risk]
    CLEAR[Security Cleared]
    
    CODE --> SEC
    SEC --> CLASS
    CLASS -->|CRITICAL| CRIT
    CLASS -->|HIGH| HIGH
    CLASS -->|MEDIUM/LOW| DEC
    CRIT --> SEC
    HIGH --> SEC
    DEC -->|Mitigate| MED
    DEC -->|Accept| DOC
    MED --> DOC
    DOC --> CLEAR
```