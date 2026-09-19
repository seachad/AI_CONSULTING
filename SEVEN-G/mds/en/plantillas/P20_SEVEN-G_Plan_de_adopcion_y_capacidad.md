# Adoption and capacity plan

**Plans how people will adopt the AI system, what training they need and what will be done with the released capacity, and allows it to be monitored with indicators.**

| | |
|---|---|
| Document | Template P20 · Adoption and capacity plan |
| Version | 0.1 (working draft) |
| Date | 16-09-2026 |
| Author | Fernando García · SEACHAD |
| Status | Draft for review. |

---

> **Legal notice and disclaimer.** SEVEN-G is a reference methodological framework provided "as is" and for information purposes only. It does not constitute legal, regulatory, financial or professional advice, nor does it guarantee compliance with any law or standard. References to general regulation (such as the EU AI Act, the GDPR, DORA or NIS2), to technical standards and to regulation specific to each sector or jurisdiction may be incomplete, may not apply to a particular case or may become out of date as a result of regulatory changes, interpretations or supervisory positions after their consultation date. **Each organisation that uses SEVEN-G is solely responsible for identifying the regulation that applies to it, verifying that it is current and certifying its own regulatory compliance**, with the appropriate qualified advice. The author and SEACHAD accept no liability for any use made of this content or for any decisions taken on the basis of it. The data, figures, companies and cases in the examples are fictitious or illustrative.

## 1. Instructions for use

| Aspect | Guidance |
|---|---|
| **When it is used** | It is prepared in phase 4 (G4 evidence), executed in phase 5, monitored in phase 6 and evaluated in phase 7. |
| **Who completes it** | AI Product Owner, with the user area and the people function. |
| **Who verifies it** | AI Office under Lite; AI Auditor under Enterprise. |
| **At which *gate* it is reviewed** | G4 (plan), G5 (adoption in the pilot), R6 (monitoring) and G7 (capacity materialised or reallocated). |
| **Lite versus Enterprise** | Lite may omit the fields marked **(Enterprise)**. Augment and Transform initiatives must have an adoption and people plan (01 §3, principle 10). |
| **Tool** | T20 Adoption and capacity plan. |
| **Relationship** | P17 Human oversight · P22 Pilot results · P28 Value realisation monitoring · P31 Use case record · documents 23 (Adoption and change) and 50 (People and organisation). |

Rules:

- **Released capacity does not count as savings** until it materialises as a lower actual cost or is explicitly reallocated (measurement rule 3, 00 §6). This plan sets its destination; P28 records what actually happens.
- Training for those who operate or oversee the system forms part of the AI literacy that the company must ensure (document 34).

---

## 2. Identification

| Field | Content | Guidance |
|---|---|---|
| Initiative code | | IA-AAAA-NNN (T01). |
| Initiative name | | |
| Ambition level | | Optimise · Augment · Transform. |
| Intensity | | Lite · Enterprise. |
| User area or areas | | |
| Document version | | |
| Author | | Role and name. |
| Date | | DD-MM-AAAA. |
| Document status | | Draft · Submitted for verification · Verified · Approved · Superseded. |

---

## 3. Affected people and change in their work

**Change in work:** No change · Automated tasks · New tasks · Change of role · Change of organisational position.

| Group | No. of people | Change in work | Description of the change | Expected impact (Low · Medium · High) | Contact person |
|---|---|---|---|---|---|
| Claims handlers *(illustrative example)* | 40 | Automated tasks and new tasks | They no longer classify and draft the first response; they review proposals and handle complex cases | Medium | Head of claims |
| | | | | | |

| Field | Content | Guidance |
|---|---|---|
| Information to employee representatives | | Yes · No · Not applicable. Date, form and reference to P46. Mandatory in the same way in Lite and Enterprise where applicable (23 §13.2). Where the system affects working conditions, check with employment law advisers the applicable information and consultation obligations (within the scope of the EU AI Act and national employment legislation). |
| Organisational risks identified | | Reference to the ORG category risks in P12. |

---

## 4. Adoption targets

| Indicator | Definition | Baseline | Target | Time frame | Source |
|---|---|---|---|---|---|
| Effective use | People who use the system at least once a week ÷ expected people | | | | |
| Process coverage | Cases handled with the system ÷ total cases | | | | |
| Human override rate | Proposals rejected or corrected ÷ reviewed | | | | P25 |
| User satisfaction **(Enterprise)** | Pulse survey with a declared scale (P44) | | | | |
| | | | | | |

---

## 5. Training and AI literacy

| Group | Content | Format | Hours per person | Planned date | Evidence of completion |
|---|---|---|---|---|---|
| Designated overseers (P17) | Capabilities and limitations of the system; risk of over-reliance; how to correct, override and interrupt | In person with practical cases | | | Attendance record and test |
| Users | Use, limits and what must not be entered into the system | | | | |
| Managers and supervisors | Indicators, aggregate oversight and escalation | | | | |
| | | | | | |

---

## 6. Communication

| Message | Audience | Channel | Date | Owner |
|---|---|---|---|---|
| What the system is, what it is for and what does not change *(illustrative example)* | User area | Team meeting and internal note | Two weeks before the pilot | AI Product Owner |
| | | | | |

---

## 7. Released capacity and its destination

**Planned destination** (50 §6.4): PER-D1 Materialise as lower actual cost · PER-D2 Reassign to a defined activity · PER-D3 Absorb growth · PER-D4 Reinvest in quality, service or compliance · PER-D5 No decision. **Status of the estimate:** Validated · Declared · Estimated.

| Group or activity | Hours released per period | Formula | Status | Planned destination | Destination activity or cost item that is reduced | Decision owner | Planned date |
|---|---|---|---|---|---|---|---|
| Claims handlers *(illustrative example)* | 1,100 h/month | 5,500 cases/month × 12 min saved per case ÷ 60 | Estimated | Explicit reallocation | Proactive service to customers with repeat claims | Area management | Month 3 after go-live |
| | | | | | | | |

Notes:

- Absorption of volume growth only counts as value if the cost that would have been incurred without the system is documented (P08).
- PER-D4 does not add up unless translated into money with a formula (rule 7). "No decision" (PER-D5) is a valid answer in the plan, does not add up and is reported separately, but it must be resolved before G7; in Optimise, G7 requires materialised savings and in Augment, reassigned capacity (01 §7.6).

---

## 8. Monitoring

| Period | Indicator | Actual | Target | Deviation | Action and owner |
|---|---|---|---|---|---|
| | | | | | |
| | | | | | |

| Field | Content | Guidance |
|---|---|---|
| Monitoring frequency | | Monthly during the first six months; thereafter, at each R6. |
| Who receives the monitoring | | AI Sponsor and, under Enterprise, the AI Committee. |
| Adoption threshold that triggers a review | | For example, effective use below target for two periods; links to the stop reason *No adoption*. |

---

## 9. Quality criteria

Formal G4, G5 and G7 criteria in document 21.

| # | Check | Status (Met · Not met · Not applicable · Pending) |
|---|---|---|
| 1 | All affected groups are identified with their change in work. | |
| 2 | Adoption targets are measurable, with a baseline, time frame and source. | |
| 3 | The overseers designated in P17 have planned and recorded training. | |
| 4 | Released capacity has a formula, status and planned destination, and is not presented as savings. | |
| 5 | There is monitoring with a threshold that triggers a review. | |
| 6 | In Augment and Transform, the plan includes the effect on roles and responsibilities. | |

---

## 10. Approval and verification

| Function | Role | Name | Date | Signature or reference |
|---|---|---|---|---|
| Author | AI Product Owner | | | |
| Commitment on the destination of capacity | Management of the user area | | | |
| Verifier | AI Office (Lite) · AI Auditor (Enterprise) | | | |
| *Gate* decision-maker | According to 01 §7.5 (recorded in P29) | | | |

Segregation of duties: the verifier is not part of the team that builds.

---

## 11. Version control

| Version | Date | Changes |
|---|---|---|
| 0.1 | 16-09-2026 | First version of the template. |
