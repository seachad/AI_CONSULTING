# SPAD – Prompt Pack v1.0

> **Legal notice and disclaimer.** SPAD is a reference methodology provided "as is" and for information purposes only. It does not constitute legal, regulatory or professional advice, does not guarantee results or compliance with any law or standard, and is not a certification. Each organisation that uses it is solely responsible for validating its results, verifying the regulation that applies to it and certifying its own regulatory compliance. The author and SEACHAD accept no liability for its use.

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