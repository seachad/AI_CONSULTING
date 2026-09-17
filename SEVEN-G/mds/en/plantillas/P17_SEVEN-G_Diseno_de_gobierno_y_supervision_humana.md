# Governance and human oversight design

**Establishes what the system decides, what a person validates and what is never delegated, with what autonomy level and with what human oversight modes.**

| | |
|---|---|
| Document | Template P17 · Governance and human oversight design |
| Version | 0.1 (working draft) |
| Date | 16-09-2026 |
| Author | Fernando García · SEACHAD |
| Status | Draft for review. |

---

> **Legal notice and disclaimer.** SEVEN-G is a reference methodological framework provided "as is" and for information purposes only. It does not constitute legal, regulatory, financial or professional advice, nor does it guarantee compliance with any law or standard. References to general regulation (such as the EU AI Act, the GDPR, DORA or NIS2), to technical standards and to regulation specific to each sector or jurisdiction may be incomplete, may not apply to a particular case or may become out of date as a result of regulatory changes, interpretations or supervisory positions after their consultation date. **Each organisation that uses SEVEN-G is solely responsible for identifying the regulation that applies to it, verifying that it is current and certifying its own regulatory compliance**, with the appropriate qualified advice. The author and SEACHAD accept no liability for any use made of this content or for any decisions taken on the basis of it. The data, figures, companies and cases in the examples are fictitious or illustrative.

## 1. Instructions for use

| Aspect | Guidance |
|---|---|
| **When it is used** | Phase 4 (Solution design), before requesting G4. It is reviewed at G5 with what was observed in the pilot and at every R6, or earlier if the autonomy level or the affected population changes. |
| **Who completes it** | AI Product Owner and AI Technical Owner, with the business area that will use the system. |
| **Who verifies it** | AI Office under Lite; AI Auditor under Enterprise. The AI Risk Owner issues clearance. |
| **At which *gate* it is reviewed** | G4; its actual operation is checked at G5 (P22) and at R6. |
| **Lite versus Enterprise** | Lite may omit the fields marked **(Enterprise)**. A system at level A2 or A3 whose actions affect third parties, money, personal data or production systems is Enterprise (criterion "agents with the ability to act", 01 §9.2). |
| **Relationship** | P04 Intensity determination · P11 Regulatory classification · P18 Security design · P19 Rollback plan · P24 Operations manual · P25 Monitoring · document 35 (autonomy and AG controls) · document 52. |

Rules:

- Human oversight controls do not allow **Proceed with conditions** at the *gate*: if they are not resolved, the result is Iterate (01 §7.3).
- Oversight is designed so that a person can **understand, correct, override and interrupt**, not merely so that they "are present".
- Any increase in the autonomy level or in the affected population should be treated as a relevant change (P27) and be subject to verification and a decision equivalent to G4.

This template does not constitute legal advice. Obligations regarding human oversight and automated decisions are confirmed with the regulatory mapping (document 34).

---

## 2. Identification

| Field | Content | Guidance |
|---|---|---|
| Initiative code | | IA-AAAA-NNN (T01). |
| Initiative name | | |
| AI system(s) | | Identifier in the inventory (T02). |
| Intensity | | Lite · Enterprise. |
| Ambition level | | Optimise · Augment · Transform. |
| Regulatory classification | | Prohibited · High risk · Transparency obligations · Minimal risk · Out of scope · Pending classification. |
| Document version | | |
| Author | | Role and name. |
| Date | | DD-MM-AAAA. |
| Document status | | Draft · Submitted for verification · Verified · Approved · Superseded. |

---

## 3. Decision context

| Field | Content | Guidance |
|---|---|---|
| Process or decision in which the system intervenes | | Describe it in business language (P31). |
| Users | | Who uses the output. |
| Affected persons | | Who receives the effect: customers, employees, citizens, suppliers. |
| Does it significantly influence decisions about people? | | Yes · No. If Yes, it is an Enterprise criterion. |
| Are there decisions based solely on automated processing with legal or similarly significant effects? | | Yes · No · To be determined. If Yes or To be determined, data protection must analyse Article 22 of the GDPR. |
| Consequence of a system error | | What happens if the output is incorrect and who bears it. |
| Reversibility of the decision or action | | Reversible at no cost · Reversible at a cost · Irreversible. |

---

## 4. Autonomy level

Tick a single level. The levels are defined in document 35.

| Level | Name | What the system does | Human role | Tick |
|---|---|---|---|---|
| **A0** | Assistance | Informs, summarises or generates content. | The person decides and executes. | ☐ |
| **A1** | Recommendation | Proposes a specific decision or action. | The person validates each action before it is executed. | ☐ |
| **A2** | Supervised action | Executes actions within defined limits. | Supervises, can interrupt and reviews after the fact. | ☐ |
| **A3** | Autonomous action | Executes sequences of actions without individual review within strict limits. | Sets limits, supervises aggregates and has a kill switch. | ☐ |

| Field | Content | Guidance |
|---|---|---|
| Justification for the level chosen | | Why a lower level is not enough. The lowest level that achieves the objective is preferable. |
| Level in the pilot | | It may be lower than the target (for example, A1 in the pilot and A2 in production). |
| Conditions for moving up a level **(Enterprise)** | | Evidence required (results, override rate, incidents) and the body that authorises it. |
| Conditions for moving down a level | | Thresholds that require autonomy to be reduced; they are carried over to P19 as a degraded mode. |

---

## 5. Allocation of decisions

One row per decision or action in the process. **Allocation:** The system decides · A person validates · Never delegated.

| Decision or action | Allocation | Justification | Role that validates or decides | Information needed by the validator |
|---|---|---|---|---|
| Prioritise the queue of incoming requests *(illustrative example)* | The system decides | Reversible, with no direct effect on the person; processing remains human | — | — |
| Propose the resolution of a request *(illustrative example)* | A person validates | Affects the applicant; requires checking of documentation | Case handler | Proposed outcome, main reasons and documents consulted |
| Reject a request *(illustrative example)* | Never delegated | Significant effect on the person; requires human reasoning | Head of the area | Complete case file |
| | | | | |
| | | | | |

Decisions that the company has declared non-delegable in its corporate policy (document 31) and that apply to this system:

| Non-delegable decision | Reference in the policy | How it is technically guaranteed |
|---|---|---|
| | | |

---

## 6. Human oversight modes

**Modes:** Prior validation (a person approves each output before it takes effect) · Real-time oversight (a person observes and can intervene while the system acts) · Sample-based after-the-fact review · Aggregate oversight through indicators and thresholds.

| Mode | Applies? (Yes · No) | Scope | Responsible role | Frequency or sample size | Intervention criterion | Where it is recorded |
|---|---|---|---|---|---|---|
| Prior validation | | | | | | |
| Real-time oversight | | | | | | |
| Sample-based after-the-fact review | | | | | | |
| Aggregate oversight | | | | | | |

Guidance: A1 requires prior validation; A2 requires at least real-time oversight or after-the-fact review, and a kill switch; A3 requires aggregate oversight, strict limits (P18) and a tested kill switch (P19).

---

## 7. Effective capability of the overseer

| Requirement | How it is guaranteed | Evidence |
|---|---|---|
| Understands the capabilities and limitations of the system | | Training recorded in P20; limitations from P16. |
| Is aware of the risk of over-relying on the automated output | | Training and interface design. |
| Can correctly interpret the output | | Explanation or reasons shown alongside the output. |
| Can decide not to use, correct, override or reverse the output | | Function available and logged. |
| Can interrupt the system | | Kill switch (P18) and who can activate it. |
| Has time and a workload compatible with oversight **(Enterprise)** | | Expected volume per person and time per review. |

In high-risk systems, these requirements are checked against Article 14 of the EU AI Act (document 34).

---

## 8. Transparency and rights of affected persons

| Field | Content | Guidance |
|---|---|---|
| Are people informed that they are interacting with an AI system or that the content is generated? | | Yes · No · Not applicable. How and at what point. |
| Information on the logic and the reasons for the output | | What is explained and to whom. |
| Channel for requesting human review or contesting | | Channel, internal response time limit and role that reviews. |
| Log of complaints related to the system **(Enterprise)** | | Where they are recorded and how they feed P25 and P27. |

---

## 9. Responsibilities and escalation

| Role | Holder | Deputy | Oversight responsibility | Escalates to |
|---|---|---|---|---|
| AI Product Owner | | | Design of the allocation of decisions and of adoption | AI Sponsor |
| AI Operations Owner | | | Day-to-day operation of oversight and alerts | AI Committee in S1–S2 incidents (P26) |
| Designated overseers | | | Validation, review and override | AI Operations Owner |
| AI Risk Owner | | | Clearance on the sufficiency of oversight | AI Committee |

---

## 10. Oversight indicators

They are carried over to P25 with their thresholds.

| Indicator | Definition | Alert threshold | Frequency |
|---|---|---|---|
| Human override rate | Outputs corrected or rejected ÷ outputs reviewed | | |
| Average validation time | Time between proposal and validation | | |
| After-the-fact review coverage | Outputs reviewed ÷ outputs produced | | |
| Acceptance without effective review **(Enterprise)** | Validations taking less than the reasonable minimum time | | |
| Complaints from affected persons | Number per period | | |

---

## 11. Quality criteria

The formal G4 criteria on human oversight are in document 21 (and its checklist LV-G4 in document 22); autonomy controls are in the AG controls of document 35.

| # | Check | Status (Met · Not met · Not applicable · Pending) |
|---|---|---|
| 1 | A single autonomy level is assigned and justified. | |
| 2 | Each relevant decision in the process has an allocation, and the non-delegable ones are identified. | |
| 3 | The oversight modes are consistent with the autonomy level. | |
| 4 | The overseer can override and interrupt, and is trained to do so. | |
| 5 | There is a human review channel for affected persons where appropriate. | |
| 6 | The oversight indicators have a threshold and have been carried over to P25. | |
| 7 | Data protection has reviewed the applicability of Article 22 of the GDPR where appropriate. | |

---

## 12. Approval and verification

| Function | Role | Name | Date | Signature or reference |
|---|---|---|---|---|
| Author | AI Product Owner | | | |
| Co-author | AI Technical Owner | | | |
| Clearance | AI Risk Owner | | | |
| Verifier | AI Office (Lite) · AI Auditor (Enterprise) | | | |
| *Gate* decision-maker | According to 01 §7.5 (recorded in P29) | | | |

Segregation of duties: the AI Risk Owner and the verifier are not part of the team that builds; no one verifies or approves their own work.

---

## 13. Version control

| Version | Date | Changes |
|---|---|---|
| 0.1 | 16-09-2026 | First version of the template. |
