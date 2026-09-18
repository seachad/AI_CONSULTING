# SPAD — Structured Prompt-Driven AI Engineering
## Professional Methodology for AI-Assisted Software Development

> **Legal notice and disclaimer.** SPAD is a reference methodology provided "as is" and for information purposes only. It does not constitute legal, regulatory or professional advice, does not guarantee results or compliance with any law or standard, and is not a certification. Each organisation that uses it is solely responsible for validating its results, verifying the regulation that applies to it and certifying its own regulatory compliance. The author and SEACHAD accept no liability for its use.

**Version:** 2.0  
**Relationship:** Independent methodology, related to SEVEN-G and referenced from its document 53 (building solutions with AI)  
**Owner:** Seachad (FGV)  
**Status:** Under construction / not yet released as a final commercial deliverable

---

## 📋 Quick Navigation

### For Business Leaders
- **[Executive Summary](Documents/00_SPAD_Executive_Summary.md)** - Why SPAD matters for your business
- **[Self-Assessment](Documents/11_SPAD_Compliant_Certification.md)** - SPAD self-assessment of conformity (not a certification)

### For Technical Teams
- **[Methodology](Documents/0%20-%20SPAD_Metodologia_Operativa.md)** - Complete operational methodology (Spanish)
- **[Official Skill](Documents/08_SPAD_Skill_Official_EN.md)** - Official SPAD skill (English)
- **[Prompt Pack](Documents/01_SPAD_Prompt_Pack.md)** - Quick reference for all prompts
- **[Flow Diagrams](Documents/07_SPAD_03_Flow_Diagram.md)** - Visual workflows

### For Implementation
- **[Context Management](Documents/04_SPAD_Context_Management.md)** - Setup and organize contexts
- **[Validation Policy](Documents/05_SEVENG_SPAD_Validation_Policy.md)** - Quality enforcement rules

### Additional Resources
- **[Agent-Ready I/O](Documents/02_SPAD_Agent_Ready_IO.md)** - Machine-readable contracts
- **[Skills Map](Documents/03_SPAD_Skills_Map.md)** - SPAD dependencies
- **[Derived Skills](Documents/09_SPAD_Derived_Skills.md)** - Advanced skills built on SPAD

---

## 🎯 What is SPAD?

SPAD is a **professional engineering methodology** that transforms AI-assisted development from ad-hoc experimentation into **governed, auditable, production-grade software engineering**.

### Core Value Proposition

**Problem:**  
AI generates plausible code, but without structure it produces:
- Hidden design decisions
- Insufficient testing
- Security vulnerabilities
- Technical debt
- Compliance gaps

**Solution:**  
SPAD enforces:
- ✅ **Design before code** - Explicit, auditable plans
- ✅ **Independent audits** - Quality gates at every phase
- ✅ **Mandatory testing** - Built-in, not bolted-on
- ✅ **Security by design** - Proactive, not reactive
- ✅ **Complete traceability** - Compliance-ready documentation

---

## 🏗️ Key Concepts

### 1. Blocking Phases
No phase starts until previous phase is approved.

```
PLAN → AUDIT ✓ → IMPLEMENT → AUDIT ✓ → PRODUCTION
       ❌           (blocked)
```

### 2. Role Separation
- **Planner** - Designs architecture
- **AI Reviewer** - Validates independently
- **Builder** - Implements following rules
- **Fixer** - Applies minimal corrections

One AI cannot be both Builder and AI Reviewer in the same phase.

> **Note:** The AI role formerly called *AI Auditor* is now named *AI Reviewer* (*IA revisora*) to distinguish it from the human AI Auditor of SEVEN-G.

### 3. Context Layers
- **GLOBAL_CONTEXT** - Universal rules for all projects
- **PROJECT_CONTEXT** - Project-specific constraints

### 4. TOPIC Organization
All artifacts grouped by feature/bug/initiative in `documentation/{{TOPIC}}/`

### 5. Validation Policy
Human-enforced rules: process compliance > output quality

---

## 🔄 Core Workflows

### New Feature Development
```
CONTEXT → PLAN → AUDIT_PLAN → TEST_STRATEGY → 
IMPLEMENT → TEST_IMPL → AUDIT_TESTS → AUDIT_CODE → 
VERSION → PRODUCTION
```

**Time:** indicative; depends on the team and the scope  
**Output:** Production-ready code with tests and documentation

---

### Legacy Code Modification
```
LEGACY CODE → DOCUMENT_EXISTING → DISCOVERY_LEGACY → 
[Continue with Core Workflow]
```

**Time:** additional analysis time; indicative, depends on the team and the scope  
**Output:** Understanding before changing, risk mitigation

---

### Production Incident (Hotfix)
```
INCIDENT → DEBUG → HOTFIX_PLAN → AUDIT → IMPLEMENT → 
DEPLOY → MONITOR → POST-MORTEM
```

**Time:** indicative; depends on the team and the scope  
**Output:** Root cause + fix + lessons learned

---

### Security Review
```
CODE → SECURITY_AUDIT → FIX_CRITICAL → FIX_HIGH → 
DOCUMENT_RISKS → CLEARED
```

**Time:** indicative; depends on the team and the scope  
**Output:** Vulnerability report + fixes + compliance evidence

---

## 📊 Extended Capabilities (v2.0)

### What's New in SPAD 2.0

1. **Testing Framework** (Phases 4, 6, 7)
   - TEST_STRATEGY defines approach
   - TEST_IMPLEMENTATION generates tests
   - AUDIT_TESTS validates coverage

2. **Security Audit** (Phase 5A)
   - Specialized security review
   - OWASP compliance checking
   - Vulnerability classification
   - Risk documentation

3. **Hotfix Workflow** (Phase 4A)
   - Accelerated but controlled
   - Mandatory post-mortem
   - Monitoring requirements

4. **Skills System**
   - Composed workflows
   - Automated sequences
   - Reusable patterns

5. **Context Management**
   - Global + Project separation
   - Override governance
   - Conflict resolution

---

## 🎓 Learning Path

### Beginner (1-2 days)
1. Read [Executive Summary](Documents/00_SPAD_Executive_Summary.md)
2. Review [Prompt Pack](Documents/01_SPAD_Prompt_Pack.md)
3. Study [Flow Diagrams](Documents/07_SPAD_03_Flow_Diagram.md)
4. Try simple PLAN → AUDIT → IMPLEMENT workflow

### Intermediate (1 week)
1. Study [Methodology](Documents/0%20-%20SPAD_Metodologia_Operativa.md)
2. Learn [Context Management](Documents/04_SPAD_Context_Management.md)
3. Practice with real project
4. Apply [Validation Policy](Documents/05_SEVENG_SPAD_Validation_Policy.md)

### Advanced (2-4 weeks)
1. Master all workflows (core, legacy, debug, hotfix, security)
2. Customize contexts for your organization
3. Train team members
4. Run a [SPAD self-assessment of conformity](Documents/11_SPAD_Compliant_Certification.md) (not a certification)

---

## 📈 Success Metrics

SPAD aims to help organizations:

- reduce rework
- reduce production incidents
- reduce technical debt
- shorten time to production
- shorten audit preparation time
- increase test coverage

These are objectives, not measured results. Any improvement, and any return on investment, must be measured by each organization against its own baseline.

---

## 🚀 Quick Start

### 1. Choose Your Approach

**Self-Implementation:**
```bash
# 1. Read core documentation
# 2. Create GLOBAL_CONTEXT for your org
# 3. Create PROJECT_CONTEXT for your project
# 4. Run pilot with one feature
# 5. Measure and iterate
```

**Guided Implementation:**
- Expert consultation
- Customized setup
- Hands-on training
- Pilot support

### 2. Run Your First SPAD Workflow

```markdown
## Step 1: Setup
- Load GLOBAL_CONTEXT
- Load PROJECT_CONTEXT
- Establish TOPIC (e.g., "user_auth")

## Step 2: Execute PLAN Phase
- Use PLAN prompt
- Generate architecture document
- Save to documentation/user_auth/SPAD_01_PLAN.md

## Step 3: Execute AUDIT_PLAN Phase
- Use AUDIT_PLAN prompt
- Review plan independently
- Get GO/NO-GO/GO_WITH_CHANGES verdict

## Step 4: Continue or Iterate
- If GO: proceed to CODE_PRIMER
- If NO-GO: return to PLAN with feedback
- If GO_WITH_CHANGES: update PLAN, re-audit
```

### 3. Validate Results

- ✅ All phases produced artifacts?
- ✅ Audits were independent?
- ✅ Tests were generated?
- ✅ Documentation is complete?
- ✅ Ready for production?

---

## 🎯 When to Use SPAD

### ✅ Strongly Recommended

- Financial services (compliance critical)
- Healthcare (patient safety)
- E-commerce (PCI-DSS)
- SaaS platforms (multi-tenant security)
- Government/public sector (accountability)
- Enterprise software (long-term maintenance)

### ✅ Recommended

- Production systems with paying customers
- Systems handling sensitive data
- Projects with high technical debt
- Teams with multiple developers
- Code requiring audit trails

### 🤔 Optional but Beneficial

- Internal tools with business impact
- MVPs intended to become production
- Learning projects (for discipline)

### ❌ Overkill

- Throwaway prototypes
- Scripts for personal use
- Pure research/experimentation

---

## 📚 Document Index

### Core Documents (Read First)
1. [00 - Executive Summary](Documents/00_SPAD_Executive_Summary.md) - Business overview
2. [01 - Prompt Pack](Documents/01_SPAD_Prompt_Pack.md) - Quick reference
3. [07 - Flow Diagrams](Documents/07_SPAD_03_Flow_Diagram.md) - Visual workflows
4. [0 - Metodología Operativa](Documents/0%20-%20SPAD_Metodologia_Operativa.md) - Complete methodology

### Implementation Guides
5. [04 - Context Management](Documents/04_SPAD_Context_Management.md) - Setup contexts
6. [05 - Validation Policy](Documents/05_SEVENG_SPAD_Validation_Policy.md) - Quality enforcement

### Reference Documents
7. [02 - Agent-Ready I/O](Documents/02_SPAD_Agent_Ready_IO.md) - Machine contracts
8. [03 - Skills Map](Documents/03_SPAD_Skills_Map.md) - Dependencies
9. [08 - Official Skill](Documents/08_SPAD_Skill_Official_EN.md) - Official SPAD skill
10. [09 - Derived Skills](Documents/09_SPAD_Derived_Skills.md) - Advanced skills
11. [10 - Web Landing](Documents/10_SPAD_Web_Landing.md) - Marketing materials
12. [11 - Self-Assessment](Documents/11_SPAD_Compliant_Certification.md) - SPAD self-assessment of conformity (not a certification)

---

## 🤝 Contributing

SPAD is an independent methodology by Seachad, related to SEVEN-G and referenced from its document 53 (building solutions with AI).

### Feedback Welcome
- Bug reports in methodology
- Improvement suggestions
- Case studies
- Implementation experiences

### Not Accepting
- Changes to core principles
- Shortcuts that bypass phases
- Workarounds for quality gates

---

## 📜 License & Usage

**SPAD** is published under the same conditions as SEVEN-G: content under **Creative Commons Attribution 4.0 International (CC BY 4.0)** and code under the **MIT** licence (see `LICENCIA_CONTENIDOS.md` and `LICENSE` at the root of the repository). It may be used, adapted, redistributed and extended, including for commercial purposes, provided that authorship is visibly credited: *SPAD · Fernando García · SEACHAD*.

There is no SPAD certification: conformity with SPAD can only be self-assessed by each organization, is not issued or endorsed by SEACHAD or any third party, and any public statement of conformity must be presented as a self-assessment, never as a certification. Use of the name does not imply endorsement by the author.

The public entry page of SPAD is `SPAD/html/<language>/00_SPAD_Que_es_y_para_que_sirve.html` (sources in `SPAD/mds/`). The documents in `Documents/` are working material and are not published.

---

## 🔗 Related Projects

### AECF (AI Engineering Controlled Flow)
A production implementation of SPAD for Python/Flask projects.
See: (ruta pendiente de confirmar)

**Relationship:** AECF is SPAD applied to a specific tech stack and project.

---

## ❓ FAQ

**Q: Is SPAD only for AI-generated code?**  
A: No. SPAD principles apply to any code, but are especially valuable when AI is involved.

**Q: Does SPAD work with my programming language?**  
A: Yes. SPAD is language-agnostic. Customize PROJECT_CONTEXT for your stack.

**Q: Is SPAD compatible with Agile/Scrum?**  
A: Yes. SPAD phases fit within sprints. One TOPIC might be one story.

**Q: How long does it take to learn SPAD?**  
A: Basic proficiency: 1-2 days. Mastery: 2-4 weeks of practice.

**Q: Does SPAD slow down development?**  
A: Initially yes, while the team learns the phases. The hypothesis is that, after adoption, it speeds up development; this must be measured by each organization against its own baseline.

**Q: Can I skip phases for urgent bugs?**  
A: Use HOTFIX workflow, which is accelerated but still controlled.

**Q: What if AI violates phase rules?**  
A: Discard response, re-execute phase. See Validation Policy.

---

## 📞 Support & Contact

**Documentation Issues:**  
Check [Validation Policy](Documents/05_SEVENG_SPAD_Validation_Policy.md) for common problems.

**Implementation Questions:**  
Review [Context Management](Documents/04_SPAD_Context_Management.md) for setup guidance.

**Business Inquiries:**  
See [Executive Summary](Documents/00_SPAD_Executive_Summary.md) for engagement options.

---

## Version History

**v2.0 (February 2026)**
- Added testing framework (TEST_STRATEGY, TEST_IMPL, AUDIT_TESTS)
- Added SECURITY_AUDIT phase
- Added HOTFIX workflow for emergencies
- Added Skills system for composed workflows
- Added Context Management system
- Added Validation Policy
- Expanded documentation for commercial readiness

**v1.0 (2024)**
- Initial release
- Core workflow (PLAN → AUDIT → IMPLEMENT)
- Basic role definitions
- Conformity self-assessment framework (formerly called "certification")

---

**SPAD: Professional AI Engineering for Production Systems**

*Independent methodology by Seachad, related to SEVEN-G and referenced from its document 53 (building solutions with AI)*  
*Generated with assistance from GitHub Copilot*
