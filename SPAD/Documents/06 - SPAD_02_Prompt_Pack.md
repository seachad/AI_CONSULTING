# SPAD – Prompt Pack v1.0

## 1. PLAN Prompt
Design the system architecture without writing code.
Focus on components, responsibilities, data flows, decisions and risks.

## 2. AUDIT_PLAN Prompt
Audit the proposed plan for:
- Coupling and cohesion
- Scalability
- Concurrency
- Security
- Observability

Output a GO / GO WITH CHANGES / NO-GO decision.

## 3. CODE_PRIMER Prompt
Define strict rules for implementation:
- Structure
- Naming
- Contracts
- Anti-patterns
No architecture decisions allowed here.

## 4. AUDIT_CODE Prompt
Verify generated code against:
- Approved plan
- Architectural constraints
- Performance and safety requirements

## 5. FIX_PRIMERS Prompt
Apply minimal, justified corrections.
Each fix must state:
- Problem
- Change
- Justification
- Impact