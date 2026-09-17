# *Gate* decision record

**Provides an auditable record of each *gate* decision: evidence, status of each criterion, degree of compliance, outcome, conditions, reason, and who verified and who decided.**

| | |
|---|---|
| Document | Template P29 · *Gate* decision record |
| Version | 0.1 (working draft) |
| Date | 16-09-2026 |
| Author | Fernando García · SEACHAD |
| Status | Draft for review. |

---

> **Legal notice and disclaimer.** SEVEN-G is a reference methodological framework provided "as is" and for information purposes only. It does not constitute legal, regulatory, financial or professional advice, nor does it guarantee compliance with any law or standard. References to general regulation (such as the EU AI Act, the GDPR, DORA or NIS2), to technical standards and to regulation specific to each sector or jurisdiction may be incomplete, may not apply to a particular case or may become out of date as a result of regulatory changes, interpretations or supervisory positions after their consultation date. **Each organisation that uses SEVEN-G is solely responsible for identifying the regulation that applies to it, verifying that it is current and certifying its own regulatory compliance**, with the appropriate qualified advice. The author and SEACHAD accept no liability for any use made of this content or for any decisions taken on the basis of it. The data, figures, companies and cases in the examples are fictitious or illustrative.

## 1. Instructions for use

| Aspect | Guidance |
|---|---|
| **When it is used** | At all the gates of the lifecycle: G0, G1, G2, G3, G4, G5, the R6 continuity review and G7. One record for each iteration of the same *gate*. |
| **Who completes it** | The team submits the evidence (block 3); the verifier completes blocks 4 to 7; the decision-maker, blocks 8 to 11; block 12 is reviewed by the AI Auditor (at Lite, by sampling, 01 §9.3). The AI Office keeps custody of the record. |
| **Who verifies it and who decides** | As per 01 §7.5 (table in block 13). |
| **Lite versus Enterprise** | Lite may omit the fields marked **(Enterprise)**. At Lite, G0, G1 and G2 may be resolved in a single session, as may G4 and G5; one decision is recorded per *gate* even if the session is shared, and each piece of evidence is verified. |
| **Tool** | T03 *Gate* manager (module of T01). The statuses and the calculation of the degree of compliance follow 03 §3.4. |
| **Relationship** | Document 21 (criteria `G<n>.<nn>` and `R6.<nn>`) · document 22 (LV checklists) · P04 Intensity · P07 Ambition · P23 Go-live sign-off · P28 Value tracking · P30 Scale or retirement decision. |

Decision rules (01 §7.4):

1. **Nobody decides on their own work.** Whoever provides evidence neither verifies it nor decides.
2. **No mandatory evidence, no decision.**
3. **Evidence must exist before the *gate*.** Documentation prepared after the fact to justify progress already made invalidates the *gate* and is a major nonconformity.
4. **Conditions have a deadline and an owner.** An expired condition that has not been fulfilled turns the outcome into Iterate.
5. **Iteration limit.** After two iterations at the same *gate*, the decision is escalated to the higher body.
6. **Stop criteria are set in advance** and are not relaxed without the approval of the body that authorised the initiative.
7. **Every decision is recorded** with outcome, reason, conditions, decision-maker and verifier.

---

## 2. Identification

| Field | Content | Guidance |
|---|---|---|
| Initiative code | | IA-AAAA-NNN (T01). |
| Initiative name | | |
| *Gate* | | G0 Authorisation · G1 Opportunity · G2 Hypothesis · G3 Feasibility · G4 Design · G5 Go-live · R6 Continuity review · G7 Scale or retire. |
| Iteration | | 1, 2, 3… If it is the 3rd or later, the decision falls to the higher body (rule 5). |
| Grouped session (Lite) | | No · G0–G2 · G4–G5. |
| Intensity | | Lite · Enterprise (P04). |
| Ambition level | | Optimise · Augment · Transform (P07). |
| Regulatory classification | | Prohibited · High risk · Transparency obligations · Minimal risk · Out of scope · Pending classification. |
| Request date | | Date on which the team submits the evidence. |
| Verification date | | |
| Decision date | | |
| Days to decision | | Working days between request and decision. Indicative reference time limit: 5 (Lite) · 10 (Enterprise), as approved in C2 (03 §3.6). |
| Record version | | |

---

## 3. Evidence submitted

The mandatory evidence for each phase is set out in 01 §6.10.

| Evidence | Template | Version | Date of the evidence | Link | Prior to the request? (Yes · No) | Verified (Yes · No) | Verifier's observations |
|---|---|---|---|---|---|---|---|
| Value hypothesis canvas *(illustrative example, G2)* | P08 | 1.0 | 02-03-2026 | Document repository | Yes | Yes | — |
| Baseline *(illustrative example, G2)* | P09 | 0.9 | 28-02-2026 | Document repository | Yes | No | Baseline estimated without justification; measurement is required |
| | | | | | | | |
| | | | | | | | |

---

## 4. *Gate* criteria

The criteria in document 21 for the *gate*, the intensity and the ambition level are listed. No codes are invented: they are copied from document 21. **Status:** Met · Not met · Not applicable · Pending (03 §3.4).

| Code (document 21) | Criterion | Mandatory (Yes · No) | Status | Linked evidence | Justification (mandatory for *Not met* and *Not applicable*) | Does it block the decision? (Yes · No) |
|---|---|---|---|---|---|---|
| *[code from document 21]* *(illustrative example)* | The baseline is measured, not estimated, unless justified | Yes | Not met | P09 v0.9 | An estimate from the business area is provided without measurement | Yes |
| | | | | | | |
| | | | | | | |
| | | | | | | |

Binary checklist applied: LV-G*n* from document 22 · version: ______.

---

## 5. Degree of compliance

| Measure | Value | Calculation |
|---|---|---|
| Total criteria | | |
| *Not applicable* criteria | | |
| Applicable criteria | | Total − Not applicable. |
| *Met* criteria | | |
| **Degree of compliance** | % | Met ÷ applicable × 100. |
| Mandatory criteria *Not met* | | If greater than zero, Proceed cannot be recorded. |
| Mandatory criteria *Pending* | | If greater than zero, Proceed cannot be recorded. |
| Does any criterion not met affect critical controls for security, legal compliance or human oversight? | Yes · No | If Yes, Proceed with conditions is not possible (01 §7.3). |

---

## 6. Criteria differentiated by ambition level

Only at G2, G3, G5 and G7 (01 §7.6). The column for the initiative's level is assessed.

| *Gate* | Optimise | Augment | Transform | Status |
|---|---|---|---|---|
| G2 | Baseline for cost, time or errors; expected savings with a formula. | Performance and cost metrics; adoption target. | Return hypothesis with learning milestones; investment limit per stage; board approval. | |
| G3 | Positive expected annual net value within the horizon set in C2. | Feasibility of adoption and of the role change, in addition to the expected net value. | Feasibility of the first stage; stop criteria per stage; documented option value. | |
| G5 | Efficiency validated against the baseline; plan to realise the released capacity. | Actual adoption and performance improvement measured. | Verified market or customer evidence. | |
| G7 | Realised savings, not just released capacity. | Sustained performance and reassigned capacity. | Measured return and verified change in the operating model or the offering. | |

---

## 7. Dual validation

| Condition (01 §7.2) | Is it met? (Yes · No) | Verifier's comment |
|---|---|---|
| Tangible results: the criteria are met with real data, tests or results. | | |
| Verified documentation: the mandatory evidence exists, is traceable and has been verified. | | |

If either is *No*, the *gate* cannot be passed.

---

## 8. Outcome

Tick a single outcome permitted for the *gate*.

| *Gate* | Permitted outcomes |
|---|---|
| G0 | Proceed · Proceed with conditions · Iterate · Stop |
| G1, G2, G3 | Proceed · Proceed with conditions · Iterate · Pivot · Stop |
| G4, G5 | Proceed · Proceed with conditions · Iterate · Stop |
| R6 | Proceed with operation · Proceed with conditions · Bring G7 forward (01 §7.3) |
| G7 | Scale · Iterate · Retire. Keeping the system unchanged is recorded as Iterate with a return to phase 6. |

| Outcome | Tick |
|---|---|
| Proceed | ☐ |
| Proceed with operation (R6 only) | ☐ |
| Proceed with conditions | ☐ |
| Iterate | ☐ |
| Pivot | ☐ |
| Stop | ☐ |
| Scale (G7 only) | ☐ |
| Retire (G7 only) | ☐ |
| Bring G7 forward (R6 only) | ☐ |

| Field | Content | Guidance |
|---|---|---|
| Reason for the decision | | Brief reasoning based on blocks 4 to 7. Mandatory for all outcomes. |
| If Iterate: what must be repeated and planned date of the new request | | At G7, the phase to which it returns (phase 6 if the system is kept unchanged). |
| If Pivot: new hypothesis to be formulated in phase 2 | | The approved context is retained. |
| If Scale: reference to the new phase 0 | | Detailed in P30. |
| Risks accepted in this decision **(Enterprise)** | | Risk, residual level and who accepts it according to its level (document 33). |

---

## 9. Conditions

Only with *Proceed with conditions*. The conditions are verified at the next *gate* or on the date indicated. **Status:** Open · Fulfilled · Expired.

| # | Condition | Related criterion | Owner | Deadline | How it will be verified | Status |
|---|---|---|---|---|---|---|
| 1 *(illustrative example)* | Complete the training of the designated supervisors on the second shift | *[code from document 21]* | AI Product Owner | 30-06-2026 | Attendance record in P20 | Open |
| | | | | | | |
| | | | | | | |

---

## 10. Coded stop or retirement reason

Mandatory with *Stop* or *Retire*. Tick one main reason and, where appropriate, one secondary reason (03 §3.3).

| Reason | Main | Secondary |
|---|---|---|
| No plausible value | ☐ | ☐ |
| Hypothesis refuted | ☐ | ☐ |
| Insufficient data | ☐ | ☐ |
| Technically unfeasible | ☐ | ☐ |
| Cost exceeds value | ☐ | ☐ |
| Unacceptable risk | ☐ | ☐ |
| Regulation | ☐ | ☐ |
| No adoption | ☐ | ☐ |
| Replaced by another solution | ☐ | ☐ |
| Change in strategic priority | ☐ | ☐ |

| Field | Content | Guidance |
|---|---|---|
| Lessons learned | | Link to the lessons block in P30 or summary. |
| Resources released | | Unspent budget, people and licences. |
| Retirement plan (if *Retire*) | | P30. |

---

## 11. Escalation and board approval

| Field | Content | Guidance |
|---|---|---|
| Is it escalated to the higher body owing to the iteration limit? | | Yes · No. Body and date. |
| Does it require board approval? | | Yes for Transform at G2 and for Scale at G7 (01 §7.5). |
| Body, date and minutes reference **(Enterprise)** | | Board or board committee. |
| Linked board recommendation **(Enterprise)** | | Identifier in the recommendations register (document 62), if any. |

---

## 12. Quality criteria

The AI Auditor (at Lite, by sampling) checks the quality of the record itself, in addition to the criteria in document 21 for the specific *gate*:

| # | Check | Status (Met · Not met · Not applicable · Pending) |
|---|---|---|
| 1 | All mandatory evidence is recorded, dated prior to the request. | |
| 2 | Each criterion has a status, evidence and, where appropriate, justification. | |
| 3 | The degree of compliance is correctly calculated. | |
| 4 | The outcome is one of those permitted for the *gate* and is consistent with the mandatory criteria. | |
| 5 | The conditions do not affect critical controls and have an owner and a deadline. | |
| 6 | Stop and Retire have a coded reason. | |
| 7 | Verifier and decision-maker are different people and are not part of the team. | |
| 8 | The iteration limit is respected. | |

---

## 13. Approval and verification

| Function | Role as per 01 §7.5 | Name | Date | Part of the team that builds? | Declaration of no conflict of interest |
|---|---|---|---|---|---|
| Submits the evidence | AI Product Owner or another team role | | | Yes | — |
| Verifier | | | | Must be *No* | ☐ |
| Decision-maker | | | | Must be *No* | ☐ |
| Risk clearance (where required) | AI Risk Owner | | | Must be *No* | ☐ |

Reference from 01 §7.5:

| *Gate* | Verifies (Lite) | Decides (Lite) | Verifies (Enterprise) | Decides (Enterprise) |
|---|---|---|---|---|
| G0 | AI Office | Sponsor | AI Auditor | AI Committee |
| G1 | AI Office | Sponsor | AI Auditor | Sponsor, informing the committee |
| G2 | AI Office | Sponsor | AI Auditor | AI Committee |
| G3 | AI Office | Sponsor with risk clearance | AI Auditor | AI Committee |
| G4 | AI Office | Sponsor with risk clearance | AI Auditor | AI Committee |
| G5 | AI Office | Sponsor with risk clearance | AI Auditor | AI Committee after multi-level sign-off (P23) |
| R6 | AI Office | Sponsor | AI Auditor | AI Committee |
| G7 | AI Office | Sponsor | AI Auditor | AI Committee |

---

## 14. Version control

| Version | Date | Changes |
|---|---|---|
| 0.1 | 16-09-2026 | First version of the template. Consistency adjustments with 01 (segregation of duties at Lite, R6 outcomes, agents criterion) and with 34 and 37. |
