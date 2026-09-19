# 04 — SPAD Context & TOPIC Management

> **Legal notice and disclaimer.** SPAD is a reference methodology provided "as is" and for information purposes only. It does not constitute legal, regulatory or professional advice, does not guarantee results or compliance with any law or standard, and is not a certification. Each organisation that uses it is solely responsible for validating its results, verifying the regulation that applies to it and certifying its own regulatory compliance. The author and SEACHAD accept no liability for its use.

---

## 1. Purpose

This document defines how SPAD manages contexts and organizes artifacts through the TOPIC system to ensure traceability, auditability, and proper project governance.

---

## 2. Context Management

SPAD requires two mandatory context layers that must be loaded before executing any phase.

### 2.1 GLOBAL_CONTEXT

**Definition:**  
Universal rules applicable to ALL projects using SPAD, regardless of technology or domain.

**Must include:**
- Artifact location and naming conventions
- Documentation structure and format
- Testing requirements and minimum coverage
- Version management rules (semantic versioning)
- Security baselines
- Global prohibitions (e.g., no code in PLAN phase)
- Standard output formats
- Audit trail requirements

**Example structure:**
```markdown
# GLOBAL_CONTEXT

## Artifact Management
- All documentation in: documentation/{{TOPIC}}/
- Naming format: SPAD_<NN>_<PHASE_NAME>.md
- Diagrams in .mmd format (Mermaid)

## Testing Requirements
- Unit test coverage: minimum 80%
- Integration tests required for APIs
- E2E tests for critical user flows

## Version Management
- Semantic versioning: MAJOR.MINOR.PATCH
- Changelog required for every release
- Breaking changes must be documented

## Security Baseline
- No hardcoded secrets
- Input validation mandatory
- Authentication required for sensitive endpoints
- OWASP Top 10 compliance
```

---

### 2.2 PROJECT_CONTEXT

**Definition:**  
Project-specific rules that complement or override GLOBAL_CONTEXT for a particular implementation.

**Must include:**
- Technology stack (language, frameworks, runtime)
- Architecture patterns and constraints
- Domain-specific rules
- Compliance requirements (GDPR, HIPAA, PCI-DSS, etc.)
- Team conventions
- Deployment constraints
- Justified overrides of GLOBAL_CONTEXT rules

**Example structure:**
```markdown
# PROJECT_CONTEXT

## Technology Stack
- Language: Python 3.11+
- Framework: Flask 3.0
- Database: PostgreSQL 15
- Cache: Redis 7

## Architecture Constraints
- Multi-instance deployment with HAProxy
- Stateless design (no local file storage)
- All writes protected against race conditions

## Domain Rules
- Financial transactions require dual authentication
- Audit trail for all monetary operations
- Data retention: 7 years minimum

## Compliance
- GDPR compliant
- PCI-DSS Level 1
- Annual security audit required

## SPAD Overrides
- Test coverage reduced to 70% for legacy modules (justified: gradual migration)
```

---

### 2.3 Context Precedence Rules

When GLOBAL_CONTEXT and PROJECT_CONTEXT conflict:

1. **PROJECT_CONTEXT prevails** - if conflict is explicitly justified
2. **Justification is mandatory** - must document why the override is necessary
3. **Risk assessment required** - document the risk of deviating from global rule
4. **AI Reviewer approval needed** - AUDIT_PLAN must explicitly approve the override

**Example of valid override:**
```markdown
## Override: Test Coverage Reduction

GLOBAL_CONTEXT requires: 80% coverage
PROJECT_CONTEXT overrides to: 70% coverage

Justification: Legacy codebase with 10K LOC has 0% coverage.
Gradual migration plan over 6 months. 70% coverage for NEW code,
legacy code coverage increases 10% per sprint.

Risk: Lower coverage in short term, mitigated by phased approach.

AI Reviewer: APPROVED (AUDIT_PLAN Phase 2, 2026-02-10)
```

---

## 3. TOPIC Management

The TOPIC system organizes all artifacts of a workflow into logical, traceable units.

### 3.1 What is a TOPIC?

A TOPIC is a short identifier that:
- Represents a feature, bug fix, or initiative
- Groups all related SPAD artifacts
- Provides traceability from inception to deployment
- Enables easy auditing and documentation retrieval

---

### 3.2 TOPIC Naming Rules

**Format:** `snake_case` (mandatory)  
**Length:** Maximum 20 characters (Windows path compatibility)  
**Content:** Descriptive and meaningful

**Good examples:**
```
user_auth           (user authentication)
pdf_export          (PDF export functionality)
payment_gateway     (payment gateway integration)
cache_mem_leak      (memory leak in cache)
api_v2_migration    (API version 2 migration)
```

**Bad examples:**
```
feature_123         (not descriptive)
UserAuthenticationSystemRefactor  (too long, not snake_case)
tmp                 (too vague)
fix                 (too generic)
```

---

### 3.3 TOPIC Establishment

The TOPIC must be established at the **first phase** of any workflow.

#### Option A: Explicit TOPIC (User-Provided)
```
User: "TOPIC: user_auth
       I need to implement JWT authentication"

AI: ✅ TOPIC established: user_auth
    Creating: documentation/user_auth/SPAD_01_PLAN.md
```

#### Option B: Inferred TOPIC (AI-Deduced)
```
User: "I need to implement a PDF export functionality for reports"

AI: ℹ️ TOPIC inferred as: pdf_export
    Creating: documentation/pdf_export/SPAD_01_PLAN.md
    
    (If you prefer a different TOPIC name, please specify it now)
```

---

### 3.4 TOPIC Persistence

Once established, the TOPIC:
- **Persists throughout the entire workflow** - no changes mid-workflow
- **Appears in all artifact names** - for traceability
- **Is maintained across all phases** - PLAN, AUDIT, IMPLEMENT, etc.
- **Cannot be reused for different features** - each feature gets unique TOPIC

---

### 3.5 Artifact Organization

All artifacts for a TOPIC are stored in a dedicated directory:

```
documentation/
├── {{TOPIC_1}}/
│   ├── SPAD_01_PLAN.md
│   ├── SPAD_01_AUDIT_PLAN.md
│   ├── SPAD_01_CODE_PRIMER.md
│   ├── SPAD_01_TEST_STRATEGY.md
│   ├── SPAD_01_IMPLEMENTATION.md
│   ├── SPAD_01_TEST_IMPLEMENTATION.md
│   ├── SPAD_01_AUDIT_TESTS.md
│   ├── SPAD_01_AUDIT_CODE.md
│   ├── SPAD_01_VERSION.md
│   └── flow_diagram.mmd
├── {{TOPIC_2}}/
│   └── ...
└── {{TOPIC_3}}/
    └── ...
```

---

### 3.6 Sequential Numbering

Artifacts within a TOPIC use sequential numbering:

**First iteration:**
```
SPAD_01_PLAN.md
SPAD_01_AUDIT_PLAN.md
SPAD_01_IMPLEMENT.md
```

**If NO-GO and restart (second iteration):**
```
SPAD_01_PLAN.md          (first attempt)
SPAD_01_AUDIT_PLAN.md    (first audit - NO-GO)
SPAD_02_PLAN.md          (second attempt after fixes)
SPAD_02_AUDIT_PLAN.md    (second audit - GO)
SPAD_02_IMPLEMENT.md     (implementation proceeds)
```

This numbering provides:
- **Full audit trail** - see all iterations
- **Decision history** - understand why changes were made
- **Learning opportunities** - review what didn't work
- **Compliance evidence** - prove process was followed

---

## 4. Benefits of Context + TOPIC System

### 4.1 Traceability
- Every artifact traces back to a TOPIC
- Every TOPIC has complete context (GLOBAL + PROJECT)
- Full workflow history preserved

### 4.2 Auditability
- Easy to find all artifacts for a feature
- Clear separation between projects
- Compliance evidence readily available

### 4.3 Reusability
- GLOBAL_CONTEXT reused across all projects
- PROJECT_CONTEXT templates for similar projects
- TOPIC patterns for common features

### 4.4 Governance
- Context conflicts are explicit and justified
- Override decisions are documented
- Audit trail is automatic

### 4.5 Collaboration
- Clear naming conventions
- Consistent structure across teams
- Easy onboarding for new team members

---

## 5. Implementation Checklist

Before starting any SPAD workflow:

- [ ] GLOBAL_CONTEXT loaded and available
- [ ] PROJECT_CONTEXT loaded and available
- [ ] Context conflicts identified and resolved
- [ ] TOPIC established (explicit or inferred)
- [ ] TOPIC normalized (snake_case, ≤20 chars)
- [ ] Documentation directory created: `documentation/{{TOPIC}}/`
- [ ] Ready to proceed with Phase 1 (PLAN)

---

**Owner:** Seachad (FGV)  
**Relationship:** Independent methodology, related to SEVEN-G and referenced from its document 53 (building solutions with AI)  
**Status:** Official SPAD Documentation  
**Generated with assistance from GitHub Copilot**
