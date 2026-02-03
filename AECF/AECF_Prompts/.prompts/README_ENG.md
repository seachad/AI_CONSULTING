# AECF — AI Engineering Controlled Flow

## What is AECF?

**AECF (AI Engineering Controlled Flow)** is a **mandatory AI engineering protocol** for this repository.

It is not a prompt.  
It is not a style guide.  
It is not optional.

AECF is a **controlled engineering workflow** designed to produce **secure, auditable, production-ready code** using Large Language Models.

---

## Why AECF exists

LLMs are excellent at generating plausible code, but they are weak at:
- understanding full system context
- preserving global invariants
- modeling production risk
- respecting implicit engineering discipline

Without structure, AI:
- jumps straight to implementation
- mixes reasoning and execution
- hides design decisions
- produces fragile systems

AECF exists to **separate thinking, validation, and execution**.

---

## Core principles

1. **Process over prompts**  
   Prompts are instructions.  
   AECF is a workflow.

2. **Explicit phases with authority**  
   Each phase defines:
   - clear responsibility
   - explicit permissions
   - explicit prohibitions

3. **Audit before trust**  
   No code reaches production without independent audit.

4. **Detection over blind obedience**  
   AECF assumes LLMs may violate instructions.
   Violations must be detectable and discardable.

5. **Minimal human control, maximum leverage**  
   Humans validate the flow, not every line of code.

---

## AECF flow

### New functionality

```
PLAN
 → AUDIT-PLAN (GO / NO-GO)
   → IMPLEMENT
     → AUDIT-CODE (GO / GO CONDITIONAL / NO-GO)
       → FIX-CODE (if needed)
```

### Legacy functionality

```
DISCOVERY
 → PLAN
   → AUDIT-PLAN (GO / NO-GO)
     → IMPLEMENT
       → AUDIT-CODE (GO / GO CONDITIONAL / NO-GO)
         → FIX-CODE
```

Skipping a phase **invalidates the result**.

---

## Phase responsibilities (high level)

- **DISCOVERY**: locate and delimit. Read-only.
- **PLAN**: define scope, risks, acceptance criteria.
- **AUDIT-PLAN**: validate the design.
- **IMPLEMENT**: write code strictly following the approved PLAN.
- **AUDIT-CODE**: audit code and emit verdict.
- **FIX-CODE**: correct only audited findings.

---

## GO states

- **GO**: production-ready.
- **GO CONDITIONAL**: production with accepted residual risk.
- **NO-GO**: blocked until FIX.

---

## Phase Violation Detection

Any flow violation invalidates the response:
- code generated during DISCOVERY or PLAN
- fixes proposed during audit
- redesign during FIX
- missing mandatory artefacts

Invalid responses are discarded and the phase is re-executed.

The full policy is defined in **AECF_POLICY.md**.  
The binding rules live in **AECF_RULES.md**.

---

## What AECF is NOT

- Not prompt engineering
- Not bureaucracy
- Not documentation theater
- Not a guarantee of perfect code

AECF is a **risk containment system**.

---

## Final principle

> **AI amplifies whatever engineering discipline already exists.**

AECF ensures what gets amplified is **discipline, not fragility**.

---

## Status

- AECF operational
- Prompts versioned
- Policy enforced
- Ready for production


## Official AECF Flow Diagram

The official visual reference for the AECF workflow is available here:

➡️ [View AECF flow diagram](docs/aecf_flow.mmd)

This diagram represents the canonical AECF process.
