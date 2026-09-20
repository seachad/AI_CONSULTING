# R6 continuity review package

**Brings together in a single document the period data that the continuity review needs —value, cost, stability, incidents, risks and compliance— and the team's proposal, so that the verifier can check and the body can decide.**

| | |
|---|---|
| Document | Template P65 · R6 continuity review package |
| Version | 0.1 (working draft) |
| Date | 19-09-2026 |
| Author | Fernando García Varela |
| Status | Draft for review. |

---

> **Legal notice and disclaimer.** SEVEN-G is a reference methodological framework provided "as is" and for information purposes only. It does not constitute legal, regulatory, financial or professional advice, nor does it guarantee compliance with any law or standard. References to general regulation (such as the EU AI Act, the GDPR, DORA or NIS2), to technical standards and to regulation specific to each sector or jurisdiction may be incomplete, may not apply to a particular case or may become out of date as a result of regulatory changes, interpretations or supervisory positions after their consultation date. **Each organisation that uses SEVEN-G is solely responsible for identifying the regulation that applies to it, verifying that it is current and certifying its own regulatory compliance**, with the appropriate qualified advice. The author accepts no liability for any use made of this content or for any decisions taken on the basis of it. The data, figures, companies and cases in the examples are fictitious or illustrative.

> **Why it matters.** A system in production can remain available while it loses value, accumulates cost, drifts or stops complying. R6 is the periodic control that detects this in time, but its evidence is spread across ten templates and tools. If nobody brings it together with the same data for the same period, the review becomes a conversation and the body decides without seeing the whole picture. The package orders the ten blocks of 52 §8.2, shows which R6 criterion each one covers and requires a conclusion on whether G7 must be brought forward. Skipping an R6 is a major nonconformity.

## 1. Instructions for use

| Aspect | Guidance |
|---|---|
| **When it is used** | At each R6: at least quarterly in Enterprise and half-yearly in Lite. It is brought forward after an S1 or S2 incident, a substantial change or a relevant change by the provider (52 §8.1). It may coincide with the 6- or 12-month review (43 §8.1); in that case the P62 report is attached. |
| **Who completes it** | The AI Product Owner and the AI Operations Owner, with the data for the period (52 §8.2). |
| **Who verifies it** | AI Office in Lite; AI Auditor in Enterprise, with checklist LV-R6 in document 22. |
| **Who decides** | AI Sponsor in Lite; AI Committee in Enterprise (21 §6.7). |
| **Stage, *gate* or moment** | R6 · Continuity review (phase 6). The outcome is recorded in P29. |
| **Tool** | T01 (R6 events and dates), T03 (verification), T08, T10, T12 and T13 as sources. |
| **Reference document** | Document 52 §8; criteria R6.01–R6.16 in document 21 §6.7; LV-R6 in document 22 §9. |
| **Lite versus Enterprise** | Lite may omit the fields marked **(Enterprise)** and present the value, cost and risk blocks in simplified form. R6.13 does not apply in Lite. |

Completion rules:

- **Same period for all blocks.** Each item of data states its cut-off date; data from another period is flagged.
- **The evidence is provided, not a summary of it:** each block links the version in force of its template or the report from its tool.
- **"No data" is not zero.** A block without data is marked as such and its criterion remains *Pending*.
- This package is the **team's proposal**. It does not replace the verification (LV-R6) or the decision, which are recorded in P29.

---

## 2. Identification

| Field | Content | Guidance |
|---|---|---|
| Initiative code | | IA-AAAA-NNN (T01). |
| AI systems | | SIA-AAAA-NNN (P05). |
| Type of system and autonomy level | | Predictive ML · Generative AI · Agent; A0–A3. |
| Intensity, ambition level and regulatory classification | | P04, P07, P11. |
| R6 number and period reviewed | | For example, 3rd R6 · 01-01-2027 to 31-03-2027. |
| Type of R6 | | Ordinary · Brought forward (reason) · Coincides with the 6- or 12-month review. |
| Date of the previous R6 and its outcome | | P29. |
| Deadline according to the frequency (R6.01) | | |
| Date the package was submitted | | Before the review is requested. |

---

## 3. Summary for the decision

One line per block. **Situation:** Within what was approved · Variance with action · Significant variance · No data.

| Block | Situation | Key data for the period | R6 criteria |
|---|---|---|---|
| 1 · Value | | | R6.02 |
| 2 · Released capacity | | | R6.02, R6.14 |
| 3 · Cost | | | R6.03 |
| 4 · Stability, performance and quality | | | R6.04, R6.05 |
| 5 · Incidents and changes | | | R6.06, R6.07, R6.15 |
| 6 · Agents | | | R6.11 |
| 7 · Human oversight and adoption | | | R6.10, R6.14 |
| 8 · Risk and compliance | | | R6.08, R6.09, R6.13 |
| 9 · Continuity | | | R6.12 |
| 10 · Proposal | | | R6.16 |

---

## 4. Block 1 · Value (P28, T12)

| Field | Content | Guidance |
|---|---|---|
| Realised value for the period by type (efficiencies, return) and status | | Validated · Declared · Estimated. |
| Realisation for the period and cumulative (F10) | | Against the P62 curve. |
| Validated proportion (F6) | | |
| Annualised net value (F2) and validated net value (F2v) | | |
| Stop criteria | | Has any been reached? |
| Reading by ambition | | Optimise: materialised savings or reassigned capacity. Augment: sustained performance and adoption. Transform: progress against the stage milestones. |
| Evidence | | P28 version and date. |

---

## 5. Block 2 · Released capacity (T20)

| Net hours released | Materialised | Reassigned | Undecided | Materialisation rate (F5) | Reassignment rate (F5) | Evidence |
|---|---|---|---|---|---|---|
| | | | | | | |

---

## 6. Block 3 · Cost (T13)

| Field | Content | Guidance |
|---|---|---|
| Actual recurring cost against the budget and against the G3 estimate | | Variance and explanation (R6.03). |
| Cost per transaction or per unit of output | | IND-COS-05. |
| Activations and days in cost-driven degraded mode, by level | | N1–N4 (P63 §8). |
| Quality measured during the mode against the P25 minimum | | OPE-18. |
| More than one month at N2 or above | | Yes · No. If Yes, proposal: supplement, optimisation or change of the primary model. |

---

## 7. Block 4 · Stability, performance and quality (P25)

| Metric | Warning threshold | Critical threshold | Value for the period | Critical alerts | Action |
|---|---|---|---|---|---|
| Availability | | | | | |
| Main model metric or response quality | | | | | |
| Data or usage drift (OPE-19) | | | | | |
| Bias, including in responses (OPE-20) | | | | | |
| Alert noise (OPE-16) **(Enterprise)** | | | | | |

---

## 8. Block 5 · Incidents and changes (P27, T08)

| Field | Content | Guidance |
|---|---|---|
| Incidents by severity | | S1 · S2 · S3 · S4, with containment and closure. |
| Regulatory notifications and deadline met | | As per P26. |
| Open nonconformities and deadline | | NC-AAAA-NNN. |
| Changes by class | | Minor · Significant · Substantial; changes by the provider. |
| Substantial changes and the *gate* they returned to | | Without a *gate*: major nonconformity (52 §6.4). |
| Conditions from previous *gates* | | Open, met or expired (P29). |

---

## 9. Block 6 · Agents (P25, T10)

Only if there are agents (A1–A3).

| Actions blocked by limits | Intent anomalies detected and reviewed | Kill switch test (date and result) | Permission and credential review (date) |
|---|---|---|---|
| | | | |

---

## 10. Block 7 · Human oversight and adoption (document 50)

| Field | Content | Guidance |
|---|---|---|
| Human modification rate | | Close to 0% for 30 days is reviewed (52 §5.2). |
| Adoption against the target | | P20. |
| Supervisors designated and trained | | |
| Records retained and stop mechanism available | | R6.10. |

---

## 11. Block 8 · Risk and compliance (P11, P12, T04, T07)

| Field | Content | Guidance |
|---|---|---|
| New risks or risks rising in level and their acceptance | | Body according to the residual level (P12 §6). |
| Validity of the regulatory classification and of the intensity | | T07, T04. |
| Validity of the impact assessments | | P11. |
| Information to workers' representatives | | Updated after changes affecting working conditions (52 §6.4). |
| Post-market monitoring **(Enterprise)** | | Where regulation requires it (52 §9). |

---

## 12. Block 9 · Continuity (P19, P14)

| Field | Content | Guidance |
|---|---|---|
| Last rollback test and result | | Annual in Lite, half-yearly in Enterprise (OPE-15). |
| Provider situation | | Changes to model, terms or sub-processors; incidents; announced obsolescence (OPE-17). |

---

## 13. Check of the R6 criteria

Team self-assessment; it does not replace verification with LV-R6.

| Code | Criterion (summary) | Block | Status |
|---|---|---|---|
| R6.01 | Review within its frequency | Identification | Met · Not met · Not applicable · Pending |
| R6.02 | Value against the hypothesis with status and validated proportion | 1 | |
| R6.03 | Actual against estimated costs, with variances explained | 3 | |
| R6.04 | Performance within thresholds and model changes recorded | 4, 5 | |
| R6.05 | Bias within thresholds if it affects people | 4 | |
| R6.06 | Incidents recorded and notified on time | 5 | |
| R6.07 | Significant changes assessed and, where required, through G4 and G5 | 5 | |
| R6.08 | Classification, impact assessments and intensity in force | 8 | |
| R6.09 | Risk register up to date and acceptances at the correct level | 8 | |
| R6.10 | Critical controls working | 7 | |
| R6.11 | [AG] Permissions, intent, anomalous actions and kill switch | 6 | |
| R6.12 | [TER] Provider changes, incidents and contract | 9 | |
| R6.13 | Post-market monitoring where required | 8 | |
| R6.14 | Adoption against the target | 2, 7 | |
| R6.15 | Conditions and nonconformities within deadline | 5 | |
| R6.16 | Assessment of variances that require G7 to be brought forward | 10 | |

---

## 14. Block 10 · Variances and proposal

Variances that require G7 to be brought forward (21 §6.7):

| Variance | Does it apply? (Yes · No) | Evidence |
|---|---|---|
| A stop criterion has been reached. | | |
| Realised value falls below the success threshold in two consecutive reviews. | | |
| A residual risk rises to High or Critical without acceptance at the corresponding level. | | |
| An S1 incident, or recurring S2 incidents with the same cause. | | |
| The regulatory classification or the intensity changes. | | |
| The provider stops meeting non-conditionable terms or announces withdrawal of the service. | | |

| Field | Content | Guidance |
|---|---|---|
| Team proposal | | Proceed with operation · Proceed with conditions · Bring G7 forward (01 §7.3). |
| Reasons | | Based on blocks 1 to 9. |
| Proposed conditions | | Only non-critical variances, with action, deadline and owner. Not allowed for critical controls, legal compliance or human oversight. |
| Unacceptable risk detected | | If there is one, G7 is not awaited: incident procedure and, where appropriate, stop (52 §8.3). |

*(Illustrative example)* Cumulative realisation of 73.6% with two quarters below 90%; cost within budget; no S1 or S2 incidents; proposal: Proceed with conditions (validate the pending quarters and analyse the fall in realisation before the next R6).

---

## 15. Quality criteria

| # | Check | Status |
|---|---|---|
| 1 | The ten blocks are complete or marked *No data* with a reason. | Met · Not met · Not applicable · Pending |
| 2 | All data relate to the period reviewed and link their evidence in force. | |
| 3 | Each criterion R6.01–R6.16 has a status and a supporting block. | |
| 4 | The assessment of the six variances that require G7 to be brought forward is recorded. | |
| 5 | The proposal is a permitted R6 outcome and is consistent with the blocks. | |
| 6 | The package was submitted before the review was requested. | |

---

## 16. Approval and verification

| Function | SEVEN-G role | Name and position | Date | Signature or reference |
|---|---|---|---|---|
| Prepares the package | AI Product Owner and AI Operations Owner | | | |
| Verifies (LV-R6) | AI Office (Lite) · AI Auditor (Enterprise) | | | |
| Decides and records in P29 | AI Sponsor (Lite) · AI Committee (Enterprise) | | | |

Segregation of duties: whoever prepares the package neither verifies it nor decides; the verifier is not part of the team that builds or operates the system.

---

## 17. Version control

**Completed document**

| Version | Date | Author | Changes |
|---|---|---|---|
| | | | |

**Template**

| Version | Date | Changes |
|---|---|---|
| 0.1 | 19-09-2026 | First version. Orders the ten blocks of the R6 package in 52 §8.2 with criteria R6.01–R6.16 in document 21 and the variances that require G7 to be brought forward. |
