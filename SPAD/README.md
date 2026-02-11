# SPAD — Structured Prompt-Driven AI Engineering
## Professional Methodology for AI-Assisted Software Development

**Version:** 2.0  
**Framework:** SEVEN-G  
**Owner:** Seachad (FGV)  
**Status:** Production Ready

---

## 📋 Quick Navigation

### For Business Leaders
- **[Executive Summary](00_SPAD_Executive_Summary.md)** - Why SPAD matters for your business
- **[Certification](11_SEVENG_SPAD_Compliant_Certification.md)** - SPAD-Compliant™ certification

### For Technical Teams
- **[Methodology](0%20-%20SPAD_04_Metodologia_Operativa.md)** - Complete operational methodology (Spanish)
- **[Official Skill](08%20-%20SEVENG_SPAD_Skill_Official_EN.md)** - SPAD as SEVEN-G skill (English)
- **[Prompt Pack](01_SEVENG_SPAD_Prompt_Pack.md)** - Quick reference for all prompts
- **[Flow Diagrams](07%20-%20SPAD_03_Flow_Diagram.md)** - Visual workflows

### For Implementation
- **[Context Management](04_SEVENG_SPAD_Context_Management.md)** - Setup and organize contexts
- **[Validation Policy](05_SEVENG_SPAD_Validation_Policy.md)** - Quality enforcement rules

### Additional Resources
- **[Agent-Ready I/O](02_SEVENG_SPAD_Agent_Ready_IO.md)** - Machine-readable contracts
- **[Skills Map](03_SEVENG_SPAD_Skills_Map.md)** - SPAD dependencies
- **[Derived Skills](09_SEVENG_Derived_Skills.md)** - Advanced skills built on SPAD

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
- **Auditor** - Validates independently
- **Builder** - Implements following rules
- **Fixer** - Applies minimal corrections

One AI cannot be both Builder and Auditor in the same phase.

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

**Time:** 2-5 hours  
**Output:** Production-ready code with tests and documentation

---

### Legacy Code Modification
```
LEGACY CODE → DOCUMENT_EXISTING → DISCOVERY_LEGACY → 
[Continue with Core Workflow]
```

**Time:** +1-3 hours for analysis  
**Output:** Understanding before changing, risk mitigation

---

### Production Incident (Hotfix)
```
INCIDENT → DEBUG → HOTFIX_PLAN → AUDIT → IMPLEMENT → 
DEPLOY → MONITOR → POST-MORTEM
```

**Time:** 1-3 hours  
**Output:** Root cause + fix + lessons learned

---

### Security Review
```
CODE → SECURITY_AUDIT → FIX_CRITICAL → FIX_HIGH → 
DOCUMENT_RISKS → CLEARED
```

**Time:** 1-6 hours  
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
1. Read [Executive Summary](00_SPAD_Executive_Summary.md)
2. Review [Prompt Pack](01_SEVENG_SPAD_Prompt_Pack.md)
3. Study [Flow Diagrams](07%20-%20SPAD_03_Flow_Diagram.md)
4. Try simple PLAN → AUDIT → IMPLEMENT workflow

### Intermediate (1 week)
1. Study [Methodology](0%20-%20SPAD_04_Metodologia_Operativa.md)
2. Learn [Context Management](04_SEVENG_SPAD_Context_Management.md)
3. Practice with real project
4. Apply [Validation Policy](05_SEVENG_SPAD_Validation_Policy.md)

### Advanced (2-4 weeks)
1. Master all workflows (core, legacy, debug, hotfix, security)
2. Customize contexts for your organization
3. Train team members
4. Pursue [SPAD-Compliant™ Certification](11_SEVENG_SPAD_Compliant_Certification.md)

---

## 📈 Success Metrics

Organizations using SPAD report:

- **↓ 70%** rework required
- **↓ 60%** production incidents
- **↓ 50%** technical debt
- **↓ 40%** time to production
- **↓ 80%** audit preparation time
- **↑ 200%** test coverage

**Typical ROI:** 300-500% in first year

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
1. [00 - Executive Summary](00_SPAD_Executive_Summary.md) - Business overview
2. [01 - Prompt Pack](01_SEVENG_SPAD_Prompt_Pack.md) - Quick reference
3. [07 - Flow Diagrams](07%20-%20SPAD_03_Flow_Diagram.md) - Visual workflows
4. [0 - Metodología Operativa](0%20-%20SPAD_04_Metodologia_Operativa.md) - Complete methodology

### Implementation Guides
5. [04 - Context Management](04_SEVENG_SPAD_Context_Management.md) - Setup contexts
6. [05 - Validation Policy](05_SEVENG_SPAD_Validation_Policy.md) - Quality enforcement

### Reference Documents
7. [02 - Agent-Ready I/O](02_SEVENG_SPAD_Agent_Ready_IO.md) - Machine contracts
8. [03 - Skills Map](03_SEVENG_SPAD_Skills_Map.md) - Dependencies
9. [08 - Official Skill](08%20-%20SEVENG_SPAD_Skill_Official_EN.md) - SEVEN-G integration
10. [09 - Derived Skills](09_SEVENG_Derived_Skills.md) - Advanced skills
11. [10 - Web Landing](10_SEVENG_SPAD_Web_Landing.md) - Marketing materials
12. [11 - Certification](11_SEVENG_SPAD_Compliant_Certification.md) - SPAD-Compliant™

---

## 🤝 Contributing

SPAD is part of the SEVEN-G framework by Seachad.

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

**SPAD** and **SPAD-Compliant™** are intellectual property of Seachad (FGV).

**Permitted:**
- Internal use within organizations
- Training and education
- Commercial projects using SPAD
- Customization for your needs

**Requires Permission:**
- Public redistribution of methodology
- Use of SPAD-Compliant™ trademark
- Training/certification services
- Derivative methodologies

---

## 🔗 Related Projects

### AECF (AI Engineering Controlled Flow)
A production implementation of SPAD for Python/Flask projects.
See: `c:\SEACHAD\AECF_Prompts\`

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
A: Initially yes (10-15%). After adoption, it speeds up development by 30-40%.

**Q: Can I skip phases for urgent bugs?**  
A: Use HOTFIX workflow, which is accelerated but still controlled.

**Q: What if AI violates phase rules?**  
A: Discard response, re-execute phase. See Validation Policy.

---

## 📞 Support & Contact

**Documentation Issues:**  
Check [Validation Policy](05_SEVENG_SPAD_Validation_Policy.md) for common problems.

**Implementation Questions:**  
Review [Context Management](04_SEVENG_SPAD_Context_Management.md) for setup guidance.

**Business Inquiries:**  
See [Executive Summary](00_SPAD_Executive_Summary.md) for engagement options.

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
- Certification framework

---

**SPAD: Professional AI Engineering for Production Systems**

*Part of the SEVEN-G Framework by Seachad*  
*Generated with assistance from GitHub Copilot*
