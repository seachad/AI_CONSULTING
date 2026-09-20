# Build annexes with SPAD

**Records the artefacts of AI-assisted building —plan review, implementation rules, test strategy, reviews, fixes, breaches and versions— and links them to the SEVEN-G evidence they feed.**

| | |
|---|---|
| Document | Template P66 · Build annexes with SPAD |
| Version | 0.1 (working draft) |
| Date | 19-09-2026 |
| Author | Fernando García Varela |
| Status | Draft for review. |

---

> **Legal notice and disclaimer.** SEVEN-G is a reference methodological framework provided "as is" and for information purposes only. It does not constitute legal, regulatory, financial or professional advice, nor does it guarantee compliance with any law or standard. References to general regulation (such as the EU AI Act, the GDPR, DORA or NIS2), to technical standards and to regulation specific to each sector or jurisdiction may be incomplete, may not apply to a particular case or may become out of date as a result of regulatory changes, interpretations or supervisory positions after their consultation date. **Each organisation that uses SEVEN-G is solely responsible for identifying the regulation that applies to it, verifying that it is current and certifying its own regulatory compliance**, with the appropriate qualified advice. The author accepts no liability for any use made of this content or for any decisions taken on the basis of it. The data, figures, companies and cases in the examples are fictitious or illustrative.

> **Why it matters.** When design, code and tests are generated with AI, quality depends on the process having been followed: plan reviewed before building, explicit rules, tests defined before implementing, review by a different AI and recorded human validation. The SPAD artefacts demonstrate this, but they are not SEVEN-G evidence until a person references them with a date, version and verification (53 §2.2). Without this annex, the G4 and G5 verifier only sees the result, not whether it was reached by following the process, and code generated without a plan or self-approved by an AI can reach production without anyone noticing.

## 1. Instructions for use

| Aspect | Guidance |
|---|---|
| **When it is used** | In phases 4 and 5 when the solution is built with SPAD or another AI-assisted engineering method; in phase 6 for urgent fixes and changes generated with AI. Sections 3 to 6 before G4; sections 7 to 11 before G5. |
| **Who completes it** | The orchestrator of the work topic, under the responsibility of the AI Technical Owner (53 §5.1). |
| **Who verifies it** | AI Office in Lite; AI Auditor in Enterprise. The auditor may consult the outputs of the AI Reviewer, but does not base the verification on them alone (53 §5.3). |
| **Who decides or approves** | Every acceptance of an artefact is recorded by an identified person. The *gate* is decided by the body in 01 §7.5. |
| **Stage, *gate* or moment** | G4 (plan, rules and test strategy), G5 (reviews, fixes, versions) and R6 (subsequent changes and urgent fixes, 53 §8). |
| **Tool** | T01 (link from the work topic to the initiative), T02 (build tools inventoried), T06, T08, T09 and T10. |
| **Reference document** | Document 53 (§3.1, §4, §5, §6, §7 and §8). SPAD is an independent methodology referenced from SEVEN-G, not part of it (53 §2.1). |
| **Lite versus Enterprise** | Lite may omit the fields marked **(Enterprise)** and group the plan, its review, the rules and the test strategy into one artefact, and the implementation, the tests and their review into another (53 §4.3). |

Completion rules:

- **SPAD verdicts are not *gate* decisions.** GO does not mean Proceed; NO-GO prevents the *gate* from being requested (53 §4.4).
- **No AI approves.** An approval without an identified person is null and void.
- **The same AI configuration does not generate and review the same artefact in the same phase.** In Enterprise, the AI Reviewer should use a different model, provider or configuration.
- Each artefact is cited by identifier, version and date; the full content remains in the work topic repository.
- If SPAD is not used, this template works in the same way with the equivalent artefacts of the chosen method, which must meet the requirements of 53 §7.

---

## 2. Identification

| Field | Content | Guidance |
|---|---|---|
| Initiative code | | IA-AAAA-NNN (T01). |
| Work topic (*TOPIC*) | | Includes or references the initiative code. |
| Type of flow | | Main · Legacy code · Security · Debugging · Urgent fix. |
| Method | | Full SPAD · Reduced SPAD (Lite) · Other documented method. |
| AI build tools | | Name, provider, version; approved by the company (P14) and inventoried in T02. |
| Autonomy level of the build agents | | A0–A3 (document 35). If they act on production or personal data at A2 or A3, the initiative is Enterprise. |
| Orchestrator and human reviewer | | Designated in P03. |
| Intensity | | Lite · Enterprise. |
| Document version, author and date | | DD-MM-AAAA. |

---

## 3. Contexts and exceptions

| Field | Content | Guidance |
|---|---|---|
| Global context | | Derived from documents 31 and 35 and from the company's technical standards; version. |
| Project context | | Derived from P02, P11, P15, P17 and P18; version. |

| No. | Exception to the global context | Justification | Risk in P12 | AI Risk Owner clearance if it affects a critical control | Approved in the plan review |
|---|---|---|---|---|---|
| EX-01 | | | | | Yes · No |

---

## 4. Plan review (annex to P15)

| Field | Content | Guidance |
|---|---|---|
| Plan reviewed: identifier and version | | Logical architecture, components, data flows, decisions and risks. No code. |
| Planner AI (model and configuration) | | |
| AI Reviewer (model, provider and configuration) | | Different from the planner. |
| Main findings | | Coupling, cohesion, scalability, concurrency, security and observability. |
| Technical verdict | | GO · GO with changes · NO-GO. |
| Human validation | | Name, date and result. |
| Decisions transferred to P15 and flows to P16 | | Design decisions are recorded in P15, not only in conversations with the tool (53 §7.2). |
| New technical risks | | Number in P12. |

---

## 5. Implementation rules (annex to P15)

| Field | Content | Guidance |
|---|---|---|
| Identifier and version | | SPAD code guide. |
| Project structure and conventions | | |
| Contracts between components | | |
| Strict rules and prohibited anti-patterns | | |
| Critical components that require a second human review **(Enterprise)** | | Authentication, authorisation, personal data, payments, human oversight, agent limits, decisions about people (53 §7.1). |

---

## 6. Test strategy (annex to P22)

It must exist before G4 in Enterprise.

| Field | Content | Guidance |
|---|---|---|
| Identifier and version | | |
| Critical cases and minimum coverage | | |
| Test layers | | Unit, integration, end-to-end, performance. |
| AI-specific tests | | Performance, bias, robustness and security; prompt injection in generative AI and agents (53 §7.3). |
| Test data | | Synthetic or anonymised; if personal, the measures in P11 and P16. |

---

## 7. Test, code and security reviews

| Review | Artefact reviewed and version | AI Reviewer (model) | Findings critical · high · medium · low | Verdict | Human validation (name and date) | Template that records the result |
|---|---|---|---|---|---|---|
| Test review | | | | | | P22 |
| Code review | | | | | | P21 |
| Security review | | | | | | P18 and P22 |
| *(illustrative example)* Code review | Limit calculation module v0.4 | Model different from the builder | 0 · 1 · 3 · 2 | GO with changes | AI Technical Owner, 12-02-2027 | P21 |

Critical and high security findings block G5 unless the risk is formally accepted (53 §7.4).

---

## 8. Fix log (P21)

| No. | Finding or problem | Minimal change | Justification | Expected impact | Fixer AI | Reviewed by (person and date) |
|---|---|---|---|---|---|---|
| C-01 | | | | | | |

---

## 9. Breach log **(Enterprise)** (P21)

SPAD considers it optional; SEVEN-G recommends it in Enterprise (53 §6).

| No. | Date | Phase | Type of breach | Tool or model | Action | Nonconformity (NC-AAAA-NNN) where applicable |
|---|---|---|---|---|---|---|
| I-01 | | | Phase violation · Artefact missing or altered · Decision outside the plan · Implementation without plan or review · AI self-approval | | Discard and repeat · Return to the plan · Update P15–P18 | |

If code without a plan or review reaches production, it is a major nonconformity (critical if it affects a critical control). A self-approval used to advance a *gate* is a major nonconformity. Repeated patterns feed the lessons in P30 and, if they reveal an unsuitable tool, P14.

---

## 10. Human review, traceability, dependencies and licences

| Check (53 §7) | Evidence | Status |
|---|---|---|
| Every AI-generated artefact has a recorded human review before the main branch. | | Met · Not met · Not applicable · Pending |
| It is possible to identify which parts were generated with AI, with which tool and in which work topic. | | |
| The key prompts and outputs of plan and review are retained **(Enterprise)**. | | |
| Static analysis, secret detection and dependency analysis run before G5. | | |
| Dependencies proposed by the AI verified (existence, provenance, maintenance, vulnerabilities). | | |
| Software bill of materials **(Enterprise)**. | | |
| Licences of dependencies and third-party fragments checked; match filters activated **(Enterprise)**. | | |
| No personal data, secrets or credentials in tools not approved for that level. | | |

---

## 11. Version management (P21, P19)

| Version | Date | Changes | Breaking changes and migration | Rollback plan (P19) | Change record in P27 (from production) |
|---|---|---|---|---|---|
| | | | | | |

---

## 12. Correspondence with P15, P21 and P22

| Artefact in this annex | SEVEN-G template | Where it is referenced | *Gate* |
|---|---|---|---|
| Plan review (section 4) | P15 | Annex; decisions in section 7 of P15 | G4 |
| Implementation rules (section 5) | P15 | Annex | G4 |
| Test strategy (section 6) | P22 | Annex, as the planning of the tests whose results are recorded in section 3 of P22 | G4 |
| Test review (section 7) | P22 | Test results | G5 |
| Code review and fixes (sections 7 and 8) | P21 | Scope delivered and limitations | G5 |
| Security review (section 7) | P18 and P22 | Security results | G5 |
| Breach log (section 9) | P21 | Annex **(Enterprise)** | G5 |
| Versions (section 11) | P21, P19 and P27 | Delivery summary and rollback | G5 and R6 |

---

## 13. Quality criteria

Formal criteria in document 21 (G4.01, G4.12, G5.01, G5.02, G5.04 and R6.07); checks in 53 §8.

| # | Check | Status |
|---|---|---|
| 1 | Build tools approved and inventoried, and the autonomy of their agents classified. | Met · Not met · Not applicable · Pending |
| 2 | Plan reviewed by a different AI and validated by a person before implementing. | |
| 3 | Implementation rules and test strategy exist before G4 (Enterprise). | |
| 4 | Exceptions to the global context recorded as risks. | |
| 5 | Test, code and security reviews with human validation; no open critical or high findings at G5. | |
| 6 | Fixes and breaches recorded; no approval without an identified person. | |
| 7 | Each version linked to a tested rollback plan. | |
| 8 | Subsequent changes and urgent fixes meet the same requirements and are recorded in P27. | |

---

## 14. Approval and verification

| Function | SEVEN-G role | Name and position | Date | Signature or reference |
|---|---|---|---|---|
| Orchestrates and records | Orchestrator (designated in P03) | | | |
| Validates the AI outputs | AI Technical Owner | | | |
| Reviews security | Information security | | | |
| Verifies | AI Office (Lite) · AI Auditor (Enterprise) | | | |
| Decides the *gate* | Body in 01 §7.5 (recorded in P29) | | | |

Segregation of duties: the AI Reviewer is a tool of the team that builds and is not the AI Auditor; whoever orchestrated a critical component is not the only person who approves its incorporation; the verifier is not part of the team.

---

## 15. Version control

**Completed document**

| Version | Date | Author | Changes |
|---|---|---|---|
| | | | |

**Template**

| Version | Date | Changes |
|---|---|---|
| 0.1 | 19-09-2026 | First version. Covers the build artefacts in 53 §4.1 and §6 (plan review, implementation rules, test strategy, reviews, fixes, breaches and versions), the requirements in 53 §7 and their correspondence with P15, P21 and P22. |
