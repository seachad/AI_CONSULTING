# 05 — SEVEN-G Derived Skills
## Built on top of SPAD

This document defines the official **derived skills** that depend on SPAD.
SPAD is mandatory as the foundational skill for all of them.

---

## 5.1 Agent Design Skill

**Purpose**
Design autonomous or semi-autonomous agents in a controlled and auditable way.

**Depends on**
- SPAD (PLAN, AUDIT_PLAN, CODE_PRIMER)

**What it adds**
- Agent roles and responsibilities
- Tool definition and contracts
- Memory strategy (short / long-term)
- Decision boundaries
- Failure modes and safe-stops

**Why SPAD is required**
Agent behavior without prior architectural planning leads to unsafe autonomy.
SPAD guarantees reasoning separation and auditability.

---

## 5.2 Risk Skill

**Purpose**
Identify, classify, and mitigate technical, operational, and AI-related risks.

**Depends on**
- SPAD (AUDIT_PLAN, AUDIT_CODE, FIX_PRIMERS)

**What it adds**
- Risk taxonomy (technical, legal, financial, AI)
- Impact vs probability scoring
- Mitigation strategies
- Residual risk acceptance

**Why SPAD is required**
Risk assessment without explicit design artifacts is guesswork.
SPAD provides concrete, auditable inputs.

---

## 5.3 FinOps AI Skill

**Purpose**
Apply AI to financial operations with strict governance.

**Depends on**
- SPAD (all phases)

**What it adds**
- Cost models and constraints
- Optimization objectives
- Financial KPIs
- Decision explainability
- Audit-ready outputs

**Why SPAD is required**
Financial decisions amplified by AI must be explainable and defensible.
SPAD enforces traceability and controlled execution.

---

**Status:** Official SEVEN-G Derived Skills  
**Owner:** Seachad (FGV)