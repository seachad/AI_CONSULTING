# 03 — SPAD Skills Map (Execution Order: THIRD)

> **Legal notice and disclaimer.** SPAD is a reference methodology provided "as is" and for information purposes only. It does not constitute legal, regulatory or professional advice, does not guarantee results or compliance with any law or standard, and is not a certification. Each organisation that uses it is solely responsible for validating its results, verifying the regulation that applies to it and certifying its own regulatory compliance. The author and SEACHAD accept no liability for its use.

SPAD is an independent methodology, related to SEVEN-G and referenced from its document 53 (building solutions with AI).

## SPAD as Foundation

All other SEVEN-G skills depend on SPAD core capabilities:
- Blocking phases
- Independent audits
- Context management
- TOPIC organization
- Validation policy
- Testing framework
- Security audits

---

## Derived Skills

### Agent Design Skill
**Purpose:** Design autonomous or semi-autonomous agents in a controlled way.

**Depends on SPAD phases:**
- PLAN (agent architecture and boundaries)
- AUDIT_PLAN (safety and autonomy limits)
- SECURITY_AUDIT (agent permissions and risks)
- TEST_STRATEGY (agent behavior validation)

**What it adds:**
- Agent roles and responsibilities
- Tool definition and contracts
- Memory strategy (short/long-term)
- Decision boundaries
- Failure modes and safe-stops
- Autonomous action governance

**Why SPAD is required:**  
Agent behavior without prior architectural planning leads to unsafe autonomy. SPAD is designed to enforce reasoning separation and auditability.

**Example:** An autonomous trading agent requires PLAN to define risk boundaries, AUDIT to validate safety mechanisms, and SECURITY_AUDIT to ensure it can't exceed authorization limits.

---

### Risk Management Skill
**Purpose:** Identify, classify, and mitigate technical, operational, and AI-related risks.

**Depends on SPAD phases:**
- PLAN (risk identification)
- AUDIT_PLAN (risk assessment)
- SECURITY_AUDIT (security risk analysis)
- DEBUG (incident risk analysis)
- VERSION_MANAGEMENT (deployment risk)

**What it adds:**
- Risk taxonomy (technical, legal, financial, AI, operational)
- Impact vs probability scoring
- Mitigation strategies
- Residual risk acceptance
- Risk monitoring framework

**Why SPAD is required:**  
Risk assessment without explicit design artifacts is guesswork. SPAD provides concrete, auditable inputs for risk analysis.

**Example:** Deploying a payment processing feature requires risk analysis of the PLAN, security audit findings, and incident history (DEBUG reports) to make informed go/no-go decisions.

---

### FinOps AI Skill
**Purpose:** Apply AI to financial operations with strict governance.

**Depends on SPAD phases:**
- All SPAD phases (complete traceability required)
- SECURITY_AUDIT (mandatory for financial code)
- VERSION_MANAGEMENT (audit trail of changes)
- TOPIC Management (regulatory compliance documentation)

**What it adds:**
- Cost models and constraints
- Optimization objectives
- Financial KPIs
- Decision explainability
- Audit-ready outputs
- Regulatory compliance checks

**Why SPAD is required:**  
Financial decisions amplified by AI must be explainable and defensible. SPAD enforces traceability and controlled execution. Every financial AI decision must trace back to an audited PLAN.

**Example:** An AI that optimizes cash flow must have documented:
- PLAN: Strategy and constraints
- AUDIT_PLAN: Risk boundaries validated
- SECURITY_AUDIT: No unauthorized transactions
- All decisions logged with TOPIC for audit trail

---

### Data Science Workflow Skill
**Purpose:** Apply SPAD discipline to ML/AI model development.

**Depends on SPAD phases:**
- PLAN (experiment design, model architecture)
- TEST_STRATEGY (model validation approach)
- AUDIT_CODE (model quality, bias detection)
- SECURITY_AUDIT (data privacy, model security)
- VERSION_MANAGEMENT (model versioning)
- DOCUMENT_EXISTING (document existing models)

**What it adds:**
- Experiment tracking
- Dataset versioning
- Model evaluation metrics
- Bias and fairness assessment
- Model governance
- Reproducibility requirements

**Why SPAD is required:**  
ML models without structured development create black boxes. SPAD ensures models are designed, validated, and audited like any other production system.

**Example:** Training a credit scoring model requires PLAN (model architecture, features, constraints), AUDIT (bias detection), SECURITY_AUDIT (data privacy), and complete documentation of decisions.

---

### DevSecOps Skill
**Purpose:** Integrate SPAD into CI/CD pipelines with security gates.

**Depends on SPAD phases:**
- AUDIT_CODE (pre-commit quality gate)
- AUDIT_TESTS (coverage gate)
- SECURITY_AUDIT (security gate)
- VERSION_MANAGEMENT (deployment gate)

**What it adds:**
- Automated quality gates in pipeline
- Security scanning integration
- Deployment automation
- Rollback procedures
- Monitoring and alerting
- Incident response integration (HOTFIX workflow)

**Why SPAD is required:**  
DevOps without quality gates deploys bugs faster. SPAD phases become automated gates in the pipeline, preventing bad code from reaching production.

**Example:** CI/CD pipeline blocks deployment if:
- AUDIT_CODE returns NO-GO
- Test coverage < TEST_STRATEGY threshold
- SECURITY_AUDIT finds CRITICAL vulnerabilities
- VERSION_MANAGEMENT missing or invalid

---

### Compliance & Audit Skill
**Purpose:** Ensure all development meets regulatory requirements.

**Depends on SPAD artifacts:**
- All SPAD documentation (complete audit trail)
- TOPIC organization (case-by-case evidence)
- Validation Policy enforcement (process compliance)
- Context Management (requirement traceability)

**What it adds:**
- Regulatory framework mapping
- Compliance evidence collection
- Audit report generation
- Gap analysis
- Remediation tracking
- Evidence support for the organization's own external certification processes (SPAD itself does not certify)

**Why SPAD is required:**  
Compliance requires full traceability. SPAD artifacts provide evidence of: design decisions, security measures, testing rigor, and change control.

**Example:** SOC2 audit requires evidence of:
- Documented architecture (PLAN)
- Independent review (AUDIT_PLAN)
- Security measures (SECURITY_AUDIT)
- Incident handling (DEBUG + HOTFIX)
All organized by TOPIC for easy retrieval.

---

## Skill Composition Example

A complex project might compose multiple skills:

```
Financial Trading Platform = 
  SPAD (foundation) +
  Agent Design (autonomous trading) +
  Risk Management (position limits) +
  FinOps AI (optimization) +
  DevSecOps (deployment) +
  Compliance (regulatory reporting)
```

Each skill builds on SPAD artifacts:
1. **SPAD** creates architecture (PLAN)
2. **Agent Design** defines trading agent boundaries (uses PLAN)
3. **Risk Management** assesses agent risks (uses AUDIT artifacts)
4. **FinOps AI** optimizes within constraints (uses SECURITY_AUDIT)
5. **DevSecOps** deploys with gates (uses all AUDIT phases)
6. **Compliance** generates reports (uses all TOPIC artifacts)

---

## Skill Development Guidelines

When creating new SEVEN-G skills:

### Must-Have Dependencies
- [ ] Depends on at least one SPAD phase
- [ ] Justifies why SPAD is required
- [ ] Specifies which SPAD artifacts are used
- [ ] Documents integration points

### Must-Have Additions
- [ ] Clear purpose statement
- [ ] Concrete examples
- [ ] Success metrics
- [ ] Failure modes and handling

### Quality Standards
- [ ] Does not contradict SPAD principles
- [ ] Respects SPAD validation policy
- [ ] Maintains audit trail
- [ ] Enforces quality gates

---

## Benefits of Skills System

### 1. Composability
Build complex workflows from proven components.

### 2. Specialization
Each skill focuses on specific domain expertise.

### 3. Reusability
Skills apply across multiple projects.

### 4. Governance
All skills inherit SPAD rigor and auditability.

### 5. Ecosystem
Growing library of validated skills.

---

**Status:** Official SEVEN-G Skills Map  
**Owner:** Seachad (FGV)  
**Relationship:** Independent methodology, related to SEVEN-G and referenced from its document 53 (building solutions with AI)  
**Generated with assistance from GitHub Copilot**
