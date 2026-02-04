# AECF — AI Engineering Controlled Flow

## What is AECF?

**AECF (AI Engineering Controlled Flow)** is a disciplined, auditable workflow for using Large Language Models (LLMs) in software engineering.

AECF does **not** try to make AI “smarter”.  
It makes AI **work inside an engineering process**.

The goal is simple:

> **Prevent AI-generated code from reaching production  
> without design, audit, and explicit acceptance of risk.**

---

## Mandatory context (CONTEXT_GENERICS / CONTEXT_PROJECT)

Before running any AECF phase, load and enforce:

- [\.prompts/aecf/00_CONTEXT_GENERICS.md](.prompts/aecf/00_CONTEXT_GENERICS.md)
- [\.prompts/aecf/00_CONTEXT_PROJECT.md](.prompts/aecf/00_CONTEXT_PROJECT.md)

Key points:

- **Hard precondition**: apply the generic context first.
- **Document delivery**: every phase artefact must be generated at documentation/<chat_title>/AECF_<num>_<document_name>.
- **Determinism & clarity**: no unjustified global state, no “magic” behavior, deterministic outputs.
- **Multi-instance / HAProxy compatibility**: shared writes must be race-safe.
- **Threads/queues**: any thread-based execution must also support queue-based execution; CM_ variables switch modes. Threads: T_*, queues: Q_*.
- **Production debug**: debug functions must use the `function_not_for_production` decorator.
- **CM_ variables**: must exist in production_env_overrides.json with the same structure and never be defaulted in .env.
- **.md documentation**: always under documentation.
- **Tests**: all testable code must include tests in tests/.
- **Mermaid**: flows go in documentation with .mmd extension and no markdown comments.

The project context contract additionally defines domain, architectural constraints, security/compliance, output expectations, and any overrides.

---

## Why AECF exists

LLMs are very good at generating plausible code.
They are not good at:
- understanding full system context
- preserving global invariants
- modeling production risk
- respecting implicit engineering discipline

Without structure, AI:
- jumps directly to implementation
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
   Each phase has:
   - a clear role
   - explicit permissions
   - explicit prohibitions

3. **Audit before trust**  
   No code is accepted without an independent audit phase.

4. **Detection over blind obedience**  
   AECF assumes LLMs can violate instructions.
   Violations must be **detectable and discardable**.

5. **Minimal human control, maximum leverage**  
   Humans validate flow compliance, not line-by-line code.

---

## The AECF flow

DISCOVERY (optional, legacy code)  
→ PLAN  
→ AUDIT PLAN (GO / NO-GO)  
→ IMPLEMENT  
→ AUDIT CODE (GO / GO CONDICIONAL / NO-GO)  
→ FIX PLAN (if needed)  
→ FIX CODE  
→ AUDIT CODE  
→ PRODUCTION

Skipping a phase invalidates the result.

---

## Phase responsibilities (high level)

### DISCOVERY
- Locate and delimit a functionality
- **Read-only**
- No code, no fixes, no proposals

### PLAN
- Define scope, risks, and acceptance criteria
- High-level decisions only
- No implementation details

### AUDIT PLAN
- Validate the PLAN
- Decide GO or NO-GO

### IMPLEMENT
- Write code strictly according to the approved PLAN
- Follow mandatory production obligations
  (logging, resource management, access control, etc.)

### AUDIT CODE
- Independent evaluation of the code
- Classify findings: CRITICAL / WARNING / INFO
- Emit a clear verdict

### FIX PLAN / FIX CODE
- Correct only what was flagged
- No redesign, no scope expansion
- Minimal, auditable changes

---

## GO states

- **GO**  
  Code is production-ready.

- **GO CONDICIONAL**  
  Code may reach production with explicit acceptance of residual risk.

- **NO-GO**  
  Code cannot be deployed without FIX-CODE.

---

## Phase Violation Detection

AECF assumes LLMs can violate instructions.

Any of the following **invalidates a response**:
- Code generated in DISCOVERY or PLAN
- Fixes proposed during AUDIT
- Design changes during FIX-CODE
- Missing mandatory artefacts or sentinels
- Decisions not present in the approved PLAN

Invalid responses are:
- discarded
- not corrected
- re-executed in the same phase

The full policy is defined in **AECF_POLICY.md**.

---

## Human control (minimal but mandatory)

Humans do **not** review all code.
They only verify:

- correct phase execution
- presence of mandatory artefacts
- absence of phase violations
- clarity of GO / NO-GO decisions

A simple checklist is enough.

---

## What AECF is NOT

- Not prompt engineering
- Not documentation theatre
- Not bureaucracy
- Not a guarantee of perfect code

AECF is a **risk-containment system**.

---

## What AECF gives you

- Deterministic AI workflows
- Auditable AI decisions
- Clear responsibility boundaries
- Early detection of unsafe code
- Production-grade AI assistance

---

## Final principle

> **AI amplifies whatever engineering discipline you already have.**

AECF ensures that what gets amplified is **discipline, not fragility**.

---

## Status

- AECF: operational  
- Prompts: versioned  
- Policy: enforced  
- Ready for production use


## Official AECF Flow Diagram

The official visual reference for the AECF workflow is available here:

➡️ [View AECF flow diagram](docs/aecf_flow.mmd)

This diagram represents the canonical AECF process.