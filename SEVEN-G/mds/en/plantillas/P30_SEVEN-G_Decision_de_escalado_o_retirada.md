# Scale or retire decision

**Substantiates the G7 decision —scale, iterate or retire— with evidence, plans the retirement where appropriate and captures the lessons learned.**

| | |
|---|---|
| Document | Template P30 · Scale or retire decision |
| Version | 0.1 (working draft) |
| Date | 16-09-2026 |
| Author | Fernando García Varela |
| Status | Draft for review. |

---

> **Legal notice and disclaimer.** SEVEN-G is a reference methodological framework provided "as is" and for information purposes only. It does not constitute legal, regulatory, financial or professional advice, nor does it guarantee compliance with any law or standard. References to general regulation (such as the EU AI Act, the GDPR, DORA or NIS2), to technical standards and to regulation specific to each sector or jurisdiction may be incomplete, may not apply to a particular case or may become out of date as a result of regulatory changes, interpretations or supervisory positions after their consultation date. **Each organisation that uses SEVEN-G is solely responsible for identifying the regulation that applies to it, verifying that it is current and certifying its own regulatory compliance**, with the appropriate qualified advice. This methodology is a generic, free aid shared with the community so that nobody has to start from scratch; each person or organisation can and should adapt it to its own use. It must not be inferred that its legally sensitive parts have been reviewed by legal counsel: those reviews, for each company or sector, are the ultimate responsibility of the company, consultant or organisation that uses it. Although every effort is made to keep it up to date, some regulation may have changed without being reflected here. To the fullest extent permitted by law, the author accepts no responsibility whatsoever for the effects of its application in any organisation or for its full applicability. The methodology does not grant certification of any kind. The author accepts no liability for any use made of this content or for any decisions taken on the basis of it. The data, figures, companies and cases in the examples are fictitious or illustrative.

## 1. Instructions for use

| Aspect | Guidance |
|---|---|
| **When it is used** | Phase 7 (Evolution or retirement), before G7. Also when an R6 continuity review brings G7 forward due to relevant deviations, and in the regularisation of systems pre-dating the adoption of the framework (01 §14). |
| **Who completes it** | AI Product Owner (evidence, options and lessons), with the AI Operations Owner (retirement plan). |
| **Who verifies it** | AI Office at Lite intensity; AI Auditor at Enterprise intensity. |
| **Who decides** | Sponsor at Lite intensity; AI Committee at Enterprise intensity. Scaling a Transform initiative also requires board approval (01 §7.5). The decision is recorded in P29. |
| **Lite versus Enterprise** | Lite may omit the fields marked **(Enterprise)**. The retirement plan (block 8) is always completed when the outcome is Retire. |
| **Tool** | T22 Retirement manager. |
| **Relationship** | P07 Ambition classification (review in phase 7) · P12 Risk register · P16 Lineage · P20 Adoption and capacity · P27 Incident and change log · P28 Value tracking · P29 *Gate* decision record · document 14 (Portfolio management). |

Rules:

- **Evolve or retire:** no initiative remains in the portfolio without evidence to justify it (01 §3, principle 6).
- Every retirement records the **date, reason, deciding body, replacement if any, treatment of data and models, and communication to those affected** (01 §6.9).
- The initiative only moves to *Retired* status in the register when the retirement plan has been **executed and verified** (03 §3.2).
- A well-founded decision to retire is a valid outcome of the method.

This template does not constitute legal advice. The retention and deletion of data must be validated with data protection and legal counsel.

---

## 2. Identification

| Field | Content | Guidance |
|---|---|---|
| Initiative code | | IA-AAAA-NNN (T01). |
| Initiative name | | |
| AI system(s) | | Identifier in the inventory (T02). |
| Confirmed ambition level | | Optimise · Augment · Transform. |
| Intensity | | Lite · Enterprise. |
| Origin of the decision | | Ordinary G7 · G7 brought forward by R6 · Regularisation · Portfolio decision. |
| Go-live date | | |
| Document version | | |
| Author | | Role and name. |
| Date | | DD-MM-YYYY. |
| Document status | | Draft · Submitted for verification · Verified · Approved · Superseded. |

---

## 3. Summary of the evidence

| Magnitude | Value | Status or source | Guidance |
|---|---|---|---|
| Realised annual efficiencies (€) | | Validated · Declared · Estimated | P28. |
| Realised annual return (€) | | | P28. |
| Actual annual recurring cost (€) | | | P28. |
| **Annual net value (€)** | | | Efficiencies + return − recurring cost. |
| Proportion of validated value | | | P28. |
| Expected annual net value in the hypothesis (€) | | | P08. |
| Released capacity: realised · reassigned · pending (hours) | | | P28 block 6; not counted. |
| Total investment made (€) | | | |
| Main residual risk and trend | | Low · Medium · High · Critical | P12. |
| S1–S2 incidents since go-live | | | P27. |
| Open nonconformities | | | Document 37. |
| Adoption against target | | | P20. |
| Currency of the regulatory classification | | Current · Requires review | P11. |

---

## 4. Declared versus actual ambition

The five classification questions are answered again using actual evidence (00 §5.2).

| # | Question | Answer in phase 2 (Yes · No) | Answer with actual evidence (Yes · No) | Evidence |
|---|---|---|---|---|
| 1 | Does it change the value proposition received by the customer or end user? | | | |
| 2 | Is the process redesigned end to end, and not just a task? | | | |
| 3 | Do roles, organisational structure or who makes which decisions change? | | | |
| 4 | Does it generate revenue, services or markets that did not exist before? | | | |
| 5 | Could it be retired without affecting the business model, simply returning to the previous cost? | | | |

| Field | Content | Guidance |
|---|---|---|
| Actual ambition level | | Optimise · Augment · Transform. If it differs from the confirmed level, P07 and the register are updated. |
| Compliance with the G7 criterion for the level (01 §7.6) | | Optimise: realised savings · Augment: sustained performance and reassigned capacity · Transform: measured return and verified change. Status: Met · Not met · Pending. |

---

## 5. Options assessed

| Option | Arguments for | Arguments against | Additional investment (€) | Expected additional annual net value (€) | Additional net value per euro | Timeframe |
|---|---|---|---|---|---|---|
| Scale | | | | | | |
| Iterate | | | | | — | |
| Retire | | | Retirement cost | Recurring cost savings minus value lost | — | |

A scaling potential without additional investment, hypothesis and timeframe is not a data point (measurement rule 4).

---

## 6. Decision

| Field | Content | Guidance |
|---|---|---|
| Outcome | | Scale · Iterate · Retire. |
| Reason | | Based on blocks 3 to 5. |
| Coded reason (if Retire) | | No plausible value · Hypothesis refuted · Insufficient data · Technically unfeasible · Cost exceeds value · Unacceptable risk · Regulation · No adoption · Replaced by another solution · Change in strategic priority. |
| Deciding body and date | | Sponsor (Lite) · AI Committee (Enterprise). |
| Board approval | | Mandatory for Scale in Transform. Date and reference of the minutes. |
| *Gate* decision record | | Reference to P29. |

---

## 7. If scaling or iterating

| Field | Content | Guidance |
|---|---|---|
| Extended scope (Scale) | | New areas, countries, users, use cases or functions. |
| New phase 0 (Scale) | | The extended scope starts a new phase 0 with its charter (P01); its treatment in the register is governed by document 14. |
| Planned changes in intensity or classification (Scale) | | For example, the extended scope introduces direct exposure to customers. |
| Phase to return to (Iterate) | | And what must change in order to return to G7. |
| Planned date of the new review (Iterate) | | |

---

## 8. Retirement plan

### 8.1 General information

| Field | Content | Guidance |
|---|---|---|
| Date of the decision | | |
| Effective retirement date | | Date on which the system ceases to produce effects. |
| Coded reason | | The one in block 6. |
| Deciding body | | |
| Replacement | | Another AI system · Non-AI solution · Manual process · None. Identifier if it is a system. |
| Transition to the replacement | | Coexistence period, cut-over criteria and capacity required. |
| Estimated cost of the retirement (€) **(Enterprise)** | | |

### 8.2 Treatment of data and models

| Item | Treatment (Retain · Anonymise · Delete · Return · Archive) | Basis (legal obligation, audit, legal defence, end of purpose) | Time limit | Owner | Evidence (for example, deletion certificate, P57 §8) |
|---|---|---|---|---|---|
| Training data and datasets (P16) | | | | | |
| Knowledge base | | | | | |
| Inference and action logs | | | | | |
| Data held by suppliers | | | | | |
| Models and versions | | | | | |
| System instructions and configuration | | | | | |
| Technical documentation and lifecycle evidence | Archive | Audit and traceability | | | |

### 8.3 Technical and contractual decommissioning

| Action | Owner | Date | Status (Pending · Done · Verified) |
|---|---|---|---|
| Deactivate the system and its integrations | | | |
| Revoke agent identities, credentials and permissions (P18) | | | |
| Cancel licences and access to third-party models | | | |
| Terminate or adapt contracts; request deletion or return from the supplier | | | |
| Remove alerts and dashboards, retaining the history | | | |
| Update the AI system inventory (T02) | | | |
| Update regulatory registrations where appropriate **(Enterprise)** | | | |

### 8.4 Communication to those affected

| Recipient | Message | Channel | Date | Owner |
|---|---|---|---|---|
| Internal users | | | | |
| Customers or affected individuals | | | | |
| Employee representatives, where appropriate **(Enterprise)** | | | | |
| Suppliers | | | | |
| Authorities, where appropriate | | | | |

### 8.5 People and capacity

| Field | Content | Guidance |
|---|---|---|
| People who operated or oversaw the system | | New assignment. |
| Capacity needed again | | If the released capacity had been reassigned or realised, how the process is covered. |

### 8.6 Verification of the retirement

| Field | Content | Guidance |
|---|---|---|
| Verification date | | |
| Verified by | | AI Office (Lite) · AI Auditor (Enterprise). |
| Result | | Executed · Executed with pending items · Not executed. |
| Status in the register | | Only with *Executed* does it move to *Retired*. |

---

## 9. Lessons learned

**Applicable to:** This initiative · Portfolio · Company governance framework.

| # | What happened | Why it happened | What will be done differently | Applicable to | Owner for incorporating it | Taken to C5? (Yes · No) |
|---|---|---|---|---|---|---|
| 1 *(illustrative example)* | Adoption stalled at 40% of the target | The tool added a step to the process without removing any | Redesign the process before building in Augment initiatives | Portfolio | AI Office | Yes |
| | | | | | | |
| | | | | | | |

---

## 10. Quality criteria

Formal G7 criteria in document 21; LV-G7 checklist in document 22.

| # | Check | Status (Met · Not met · Not applicable · Pending) |
|---|---|---|
| 1 | The value evidence comes from P28, with statuses and validated proportion. | |
| 2 | The actual ambition has been reviewed using the five questions. | |
| 3 | The options have investment, additional net value and timeframe where applicable. | |
| 4 | The outcome is Scale, Iterate or Retire, with a reason, and with a coded reason if it is Retire. | |
| 5 | Scaling in Transform has board approval. | |
| 6 | The retirement plan covers date, reason, body, replacement, data and models, and communication. | |
| 7 | The retirement is verified before the initiative is marked as *Retired*. | |
| 8 | There are lessons learned with an owner. | |

---

## 11. Approval and verification

| Function | Role | Name | Date | Signature or reference |
|---|---|---|---|---|
| Author | AI Product Owner | | | |
| Retirement plan | AI Operations Owner | | | |
| Data review | Data protection | | | |
| Verifier | AI Office (Lite) · AI Auditor (Enterprise) | | | |
| Decision-maker | Sponsor (Lite) · AI Committee (Enterprise) · Board (Scale in Transform) | | | |

Segregation of duties: the verifier and the decision-maker are not part of the team that builds or operates the system.

---

## 12. Version control

| Version | Date | Changes |
|---|---|---|
| 0.1 | 16-09-2026 | First version of the template. |
