# C1 diagnosis report

**Brings together in a single verified report the actual situation of AI in the company: inventory, maturity, sphere map, transformation index, value and cost, risks and opportunities by sphere, and recommendations for the C2 decision.**

| | |
|---|---|
| Document | Template P33 · C1 diagnosis report |
| Version | 0.1 (working draft) |
| Date | 19-09-2026 |
| Author | Fernando García Varela |
| Status | Draft for review. |

---

> **Legal notice and disclaimer.** SEVEN-G is a reference methodological framework provided "as is" and for information purposes only. It does not constitute legal, regulatory, financial or professional advice, nor does it guarantee compliance with any law or standard. References to general regulation (such as the EU AI Act, the GDPR, DORA or NIS2), to technical standards and to regulation specific to each sector or jurisdiction may be incomplete, may not apply to a particular case or may become out of date as a result of regulatory changes, interpretations or supervisory positions after their consultation date. **Each organisation that uses SEVEN-G is solely responsible for identifying the regulation that applies to it, verifying that it is current and certifying its own regulatory compliance**, with the appropriate qualified advice. This methodology is a generic, free aid shared with the community so that nobody has to start from scratch; each person or organisation can and should adapt it to its own use. It must not be inferred that its legally sensitive parts have been reviewed by legal counsel: those reviews, for each company or sector, are the ultimate responsibility of the company, consultant or organisation that uses it. Although every effort is made to keep it up to date, some regulation may have changed without being reflected here. To the fullest extent permitted by law, the author accepts no responsibility whatsoever for the effects of its application in any organisation or for its full applicability. The methodology does not grant certification of any kind. The author accepts no liability for any use made of this content or for any decisions taken on the basis of it. The data, figures, companies and cases in the examples are fictitious or illustrative.

> **Why it matters.** The board cannot set a thesis, an ambition or a risk appetite without knowing what AI the company has, how much it contributes on the evidence and what risks it takes on. The C1 report is the diagnostic basis of C2: each component of the board's decision must cite it (13 §14, criterion 1). Without it, direction is set by opinion, maturity is inflated and transformation is declared without evidence.

## 1. Instructions for use

| Aspect | Guidance |
|---|---|
| **When it is used** | In C1: in the first implementation, at the end of month 1 (90 §4.2, week 4, milestone 1); section 10 is completed in month 2 (90 §4.3). In subsequent cycles, the diagnosis is integrated into the C5 annual review (P37). |
| **Who completes it** | The AI Office as lead assessor, with the assessment team, management control (value and cost) and the AI Risk Owner (section 10). |
| **Who verifies it** | An independent verifier: internal audit, AI Auditor or a third party with no involvement in the practices assessed (11 §4.2). |
| **Who decides or approves** | The AI Committee approves the report and presents it to the board (01 §5.1). The committee does not modify answers: it may only request a new verification. |
| **Corporate cycle stage** | C1 · Diagnosis. It is the input to C2 (P35) and C3 (P36). |
| **Tools** | T02 (inventory), T15 and P34 (maturity), T16 (sphere map), T14 (transformation index), T12 and T13 (value and cost), T06 (risks). |
| **Reference documents** | 01 §5.1 and §5.3; 11 §6; 10 §8 and §9.1; 12 §4, §5 and §10; 13 §15.A; 90 §4.2 and §4.3; 91 §4.2. |
| **Lite versus Enterprise scope** | Both scopes use all sections. Fields marked **(Enterprise)** may be omitted in a Lite scope. |

Completion rules:

- **Verified assessment.** Maturity is based on a verified assessment; a self-assessment does not produce a valid level and is not used in C1 (11 §4.1).
- **Explicit no data.** Anything not measured is shown as "no data", never as zero or as an estimate (measurement rule 8; 12 §6).
- **Status of amounts.** Every amount carries a formula and a status: validated, declared or estimated. Released capacity is reported separately and is not added.
- **Cut-off date.** Only evidence that exists and is applied at the cut-off date counts.
- **Urgent risks.** Anything the diagnosis reveals as unacceptable risk is treated immediately as a nonconformity (01 §12), without waiting for the report to be approved.

---

## 2. Identification

| Field | Content | Guidance |
|---|---|---|
| Document code | | Identifier of the report; cited by the C2 decision (13 §15.A, "Reference C1 report"). |
| Company or group | | In the examples, always fictitious. |
| Perimeter | | That of the mandate (P32). The inventory covers the whole company. |
| Implementation scope | | Lite · Enterprise (90 §2). |
| Period diagnosed and cut-off date | | DD-MM-YYYY. |
| Maturity assessment type | | Verified assessment · Independent assessment (11 §4.1). |
| Maturity questionnaire version and weights | | Equal weights unless others are declared. |
| Index threshold version | | 0.1 if those in 12 §4.5 are used. |
| Lead assessor | | |
| Independent verifier | | |
| Report version and date | | |
| Date of committee approval and of presentation to the board | | Reference to the minutes or DEC-AAAA-NNN. |

---

## 3. Executive summary

One page maximum. Written last.

| Field | Content | Guidance |
|---|---|---|
| Three key messages | | Facts, not opinions, each with its evidence. |
| AI systems inventoried | | Total and in production; how many with Enterprise criteria. |
| Overall maturity level | | Stating whether the D1 or D6 cap has been applied. |
| Transformation index profile | | Assigned profile and, where applicable, underlying profile; provisional if coverage is below 6 out of 8. |
| Annual net value and proportion of validated value | | With the status of the amounts. |
| Risks requiring immediate action | | And the nonconformities opened for them. |
| Conditions in 01 §14 already substantiated | | Out of 7. |
| What is asked of the committee and the board | | Accept the report and use it as the basis for C2. |

---

## 4. Scope and method

| Field | Content | Guidance |
|---|---|---|
| Assessment team | | Nobody assesses a dimension whose practices they lead. |
| Interviews by role | | At least two per dimension, from different functions (11 §4.4). |
| Samples | | Size and stratification according to 11 §4.6. |
| Inventory sources | | Procurement, licences, contracts, security controls, interviews. |
| Limitations | | Information not available, areas not covered, time constraints. |

---

## 5. AI system inventory

Source: T02 and the completeness statements in the annex to P32.

| Type (01 §1.3) | Idea | Pilot | Under construction | In production | Total |
|---|---|---|---|---|---|
| In-house AI initiatives | | | | | |
| Third-party AI embedded in processes | | | | | |
| Corporate use of general-purpose AI | | | | | |
| Unauthorised use detected | | | | | |
| **Total** | | | | | |

| Field | Content | Guidance |
|---|---|---|
| Regulatory classification | | Number per category: prohibited, high risk, transparency obligations, minimal risk, out of scope, pending classification. |
| Systems with any Enterprise criterion (01 §9.2) | | By criterion. |
| Possible prohibited practices | | Escalated and with a critical nonconformity, or ruled out in a documented manner. |
| Coverage of the completeness statements | | Areas signed ÷ areas in the perimeter. |
| Unauthorised use recorded as a nonconformity | | Codes NC-AAAA-NNN. |

---

## 6. Maturity

Result of the maturity assessment recorded in P34, with the calculation rules in 11 §5.

| Dimension | Level | Progress to the next | Main blocking criterion | Criteria met in advance | Main strength | Main gap |
|---|---|---|---|---|---|---|
| D1 · Strategy and governance | | | | | | |
| D2 · Value and portfolio | | | | | | |
| D3 · Data and knowledge | | | | | | |
| D4 · Technology and operations | | | | | | |
| D5 · People and adoption | | | | | | |
| D6 · Risk, security and compliance | | | | | | |
| D7 · Measurement and evidence | | | | | | |
| *(illustrative example)* D6 · Risk, security and compliance | 1 | 75 % | D6.03 (Partial): the inventory does not include corporate use | — | Corporate risk register including AI risks | No independent AI Risk Owner |

| Calculation of the overall level (11 §5.3) | Value |
|---|---|
| Weighted average (two decimal places) | |
| Average rounded down | |
| Cap = min (D1, D6) + 1 | |
| **Overall level** | |
| Has the cap been applied? | Yes · No |
| **(§14)** questions answered "Yes" (out of 10) | |

---

## 7. Current sphere map

Built with the rules in 10 §8.1 and 10 §9.1. Amounts in euros for the period.

| Sphere | Optimise | Augment | Transform | Level achieved | Level in the portfolio | Markers |
|---|---|---|---|---|---|---|
| 01 · Customer | | | | | | |
| 02 · Product and service | | | | | | |
| 03 · People | | | | | | |
| 04 · Operations | | | | | | |
| 05 · Data | | | | | | |
| 06 · Knowledge | | | | | | |
| 07 · Decision | | | | | | |
| Enablement band (08 and 09) | | | | — | — | |
| *(illustrative example)* 04 · Operations | 6 initiatives · €1.60M · High | — | — | Optimise | Optimise | No evidence in 2 initiatives |

Content of each cell: number of initiatives (total and in production) · investment and recurring cost · validated annual net value · colour (No activity, Low, Medium, High). Markers: Gap · Outside the thesis · No evidence · Secondary (in C1 there are no C2 targets yet: the Gap marker is added in C3).

| Sphere | Dimension | Current grade (Absent · Basic · Systematic · Advanced) | Supporting indicators |
|---|---|---|---|
| 08 | Compliance | | |
| 08 | Anticipation | | |
| 08 | Ethical leadership | | |
| 09 | Structure | | |
| 09 | Speed and control | | |
| 09 | Supplier ecosystem | | |

---

## 8. Transformation index

Formal calculation with T14 and the rules in document 12. It is presented with the three elements in 12 §10.

| Baseline condition | Data | Result |
|---|---|---|
| B1 · Governed portfolio | | Met · Not met · No data |
| B2 · Proportion of validated value | | |
| B3 · Scale in production | | |

| Signal | Measured value | Score (0–3) | Remarks |
|---|---|---|---|
| 1 · Investment mix | | | |
| 2 · Value mix | | | |
| 3 · Materialisation | | | |
| 4 · Depth of change | | | |
| 5 · Operating model | | | |
| 6 · AI-enabled revenue | | | |
| 7 · Progression to production | | | |
| 8 · Board decision | | | In C1 it is usually 0 or 1: there is no approved thesis yet. |
| **Sum (reference)** | | | |

| Field | Content | Guidance |
|---|---|---|
| Coverage (signals with data ÷ 8) | | If it is below 6 out of 8, the profile is provisional and a data plan with owner and deadline is added. |
| Transformation declaration (IT-D1 to IT-D3) | | Yes · No, with the evidence. |
| Evidenced profile | | 12 §5.2, step 1. |
| Assigned profile | | Step 2. |
| Complementary alerts | | 12 §5.3. |
| What would change the profile | | Two or three conditions, with owner and deadline. |

---

## 9. Current value and cost

Measurement rules in documents 40 and 42. Annual amounts for the period.

| Item | Validated | Declared | Estimated | Total | Source |
|---|---|---|---|---|---|
| Realised efficiencies | | | | | T12 |
| Return | | | | | T12 |
| Recurring cost | | | | | T13 |
| **Annual net value** | | | | | Efficiencies + return − recurring cost |
| Released capacity (hours; not added) | | | | | T12, T20 |
| Build investment executed in the period | | | | | T13 |

| Cost category (document 42) | Amount | Remarks |
|---|---|---|
| Licences · Model consumption · Compute and infrastructure · Data · Build staff · Operations staff · Suppliers and services · Control and compliance · Adoption and training | | One row per category; "no data" if not known. |

---

## 10. Risk and opportunity map by sphere

Prepared in month 2 through workshops by sphere (01 §5.3; 90 §4.3) and incorporated as a new version of the report. It is the basis of milestone 2. Risks use the scale in document 33 (level = likelihood × impact: Low 1–4, Medium 5–9, High 10–15, Critical 16–25).

| No. | Sphere | Type (Risk · Opportunity) | Description | Systems or initiatives (SIA- or IA-) | Risk level or proposed ambition | Economic impact and status | Owner | Timeframe | Next step |
|---|---|---|---|---|---|---|---|---|---|
| 01 | | | | | | | | | |
| 02 | | | | | | | | | |
| *(illustrative example)* 01 | 01 · Customer | Risk | The enquiries assistant in production does not inform users that they are interacting with an AI | SIA-2026-004 | 12 High | Sanction and complaints; estimated | Head of customer service | 30-11-2026 | Regulatory classification (P11) and regularisation (P36) |
| *(illustrative example)* 02 | 04 · Operations | Opportunity | Automatic reconciliation of supplier invoices | — | Optimise | €0.40M a year; estimated with formula | Chief financial officer | Entry in C3 | Use case record (P31) |

| Summary | Value |
|---|---|
| High and Critical risks, all with an owner | |
| Systems with Enterprise criteria classified or with a classification date | |
| Spheres with opportunities identified, or a record that there are none | |

---

## 11. Findings and recommendations for C2

### 11.1 Findings

| No. | Finding | Evidence | Dimension or sphere | Severity (High · Medium · Low) | Nonconformity required? (NC-AAAA-NNN) |
|---|---|---|---|---|---|
| H01 | | | | | |
| H02 | | | | | |

### 11.2 Recommendations for the C2 decision

One row per component in 13 §2 for which the diagnosis provides a basis. If a component has no diagnostic basis, "no data" is stated.

| C2 component | Recommendation | Findings on which it is based | Priority |
|---|---|---|---|
| AI thesis | | | |
| Ambition per sphere | | | |
| Risk appetite | | | |
| Thresholds and time limits | | | |
| Framework budget | | | |
| Maturity targets by dimension | | | References in 11 §8. |
| Regularisation of existing systems | | | |

---

## 12. Quality criteria

| # | Check | Status |
|---|---|---|
| 1 | Each maturity level has linked evidence and the assessment is verified (91 §4.2; 11 §4.1). | Met · Not met · Not applicable · Pending |
| 2 | Absences are shown as "no data"; no signal is replaced by an estimate. | |
| 3 | Value distinguishes validated, declared and estimated, and released capacity is not added. | |
| 4 | The inventory includes in-house, third-party, corporate use and unauthorised use (question D6.03 in document 11), with signed completeness statements (D6.05). | |
| 5 | The index has been calculated with its eight signals and the threshold version is recorded (question D7.08). | |
| 6 | Risks and opportunities by sphere have an owner, economic impact and timeframe (90 §4.5, criterion 3). | |
| 7 | Urgent risks have been treated as a nonconformity without waiting for approval. | |
| 8 | The recommendations for C2 cite the findings on which they are based. | |

---

## 13. Approval and verification

| Function | Role in SEVEN-G | Name and position | Date | Signature or reference |
|---|---|---|---|---|
| Prepares | AI Office (lead assessor) | | | |
| Validates value and cost figures | Management control | | | |
| Prepares the risk map | AI Risk Owner | | | |
| Verifies | Independent verifier (internal audit, AI Auditor or third party) | | | Result: Conformant · Conformant with observations · Nonconformant |
| Approves | AI Committee | | | Reference to the minutes |
| Receives | Board or board committee | | | Reference to the minutes |

Segregation of duties: the verifier has not taken part in the fieldwork and does not lead the practices assessed; the committee approves the report but does not modify answers.

---

## 14. Version control

**Completed document**

| Version | Date | Author | Changes |
|---|---|---|---|
| | | | |

**Template**

| Version | Date | Changes |
|---|---|---|
| 0.1 | 19-09-2026 | First version. Brings together the mandatory C1 outputs (01 §5.1), the maturity report (11 §6), the current sphere map (10 §8), the presentation of the index (12 §10), value and cost with their status and the month-2 risk and opportunity map by sphere (01 §5.3). |
