# Value realisation tracking

**Measures, period by period, the value that the initiative in production actually delivers, with the formula and status of each amount, and compares it with the approved hypothesis.**

| | |
|---|---|
| Document | Template P28 · Value realisation tracking |
| Version | 0.1 (working draft) |
| Date | 16-09-2026 |
| Author | Fernando García Varela |
| Status | Draft for review. |

---

> **Legal notice and disclaimer.** SEVEN-G is a reference methodological framework provided "as is" and for information purposes only. It does not constitute legal, regulatory, financial or professional advice, nor does it guarantee compliance with any law or standard. References to general regulation (such as the EU AI Act, the GDPR, DORA or NIS2), to technical standards and to regulation specific to each sector or jurisdiction may be incomplete, may not apply to a particular case or may become out of date as a result of regulatory changes, interpretations or supervisory positions after their consultation date. **Each organisation that uses SEVEN-G is solely responsible for identifying the regulation that applies to it, verifying that it is current and certifying its own regulatory compliance**, with the appropriate qualified advice. The author accepts no liability for any use made of this content or for any decisions taken on the basis of it. The data, figures, companies and cases in the examples are fictitious or illustrative.

## 1. Instructions for use

| Aspect | Guidance |
|---|---|
| **When it is used** | From go-live (phase 6) until the G7 decision. It is updated at the set frequency (monthly or quarterly) and always before each R6 and before G7. |
| **Who completes it** | AI Product Owner. |
| **Who validates the amounts** | Management control or audit for the *validated* status; the responsible area for *declared*; the committee, the board or the assessment team for *estimated* (01 §11). |
| **Who verifies it** | AI Office at Lite intensity; AI Auditor at Enterprise intensity. |
| **At which *gate* it is reviewed** | R6 and G7. It feeds the board dashboard (T17) and the portfolio (document 14). |
| **Lite versus Enterprise** | Lite may omit the fields marked **(Enterprise)**. |
| **Tool** | T12 Value realisation tracking. |
| **Relationship** | P08 Value hypothesis canvas · P09 Baseline · P20 Adoption and capacity plan · P22 Pilot results · P30 Scale or retire decision · P31 Use case record · P62 Benefits realisation plan (curve, owners, enablers; reference for the expected value per period) · documents 40, 42 and 43. |

Applicable measurement rules (00 §6):

- **Rule 1.** Every amount has a **formula** (units × unit value) and is **incremental** against the baseline or the control group.
- **Rule 2.** Every amount has a **status**: validated, declared or estimated. The validated proportion is always reported.
- **Rule 3.** **Released capacity is not counted** as savings until it is realised or explicitly reassigned; it is reported separately (block 6).
- **Rule 5.** **Each euro is attributed to a single use case**; allocations are declared (block 8).
- **Rule 6.** **Efficiencies, return and recurring cost** are kept separate. **Annual net value = efficiencies + return − recurring cost.**
- **Rule 7.** Every magnitude is translated into money, or it is stated that it could not be quantified.
- **Rule 8.** **"No data" is not zero.**

---

## 2. Identification

| Field | Content | Guidance |
|---|---|---|
| Initiative code | | IA-AAAA-NNN (T01). |
| Initiative name | | |
| Ambition level | | Optimise · Augment · Transform (confirmed in phase 2). |
| Intensity | | Lite · Enterprise. |
| Go-live date | | |
| Tracking frequency | | Monthly · Quarterly. |
| Reported period | | For example, Q3-2026. |
| Document version | | |
| Author | | Role and name. |
| Date | | DD-MM-YYYY. |
| Document status | | Draft · Submitted for verification · Verified · Approved · Superseded. |

---

## 3. Reference to the approved hypothesis

It is copied from P08 and P09 and is not modified during tracking. If the hypothesis changes, this is a Pivot or a new decision of the competent body.

| Field | Content | Guidance |
|---|---|---|
| Main metric and baseline | | Value and measurement date (P09). |
| Target and success threshold | | |
| Attribution method | | Control group · Before and after · Other, justified. |
| Expected annual value: efficiencies (€) | | |
| Expected annual value: return (€) | | |
| Expected annual recurring cost (€) | | |
| Expected annual net value (€) | | Efficiencies + return − recurring cost. |
| Approved investment (€) | | |
| Timeframe set in C2 | | |
| Stop criteria | | Those approved in phase 2. |

---

## 4. Value by period

One row per item and period. **Type:** Efficiencies · Return · Recurring cost. **Status:** Validated · Declared · Estimated.

| Period | Item | Type | Formula | Units | Unit value (€) | Amount (€) | Status | Who validates, declares or estimates | Evidence |
|---|---|---|---|---|---|---|---|---|---|
| Q3-2026 *(illustrative example)* | Reduction in outsourcing of document review | Efficiencies | Documents not outsourced × cost per document | 6,000 | 2.50 | 15,000 | Validated | Management control (external supplier invoices) | Q3 cost report |
| Q3-2026 *(illustrative example)* | Attributable retained customers | Return | Additional customers retained against control group × annual margin per customer ÷ 4 | 40 | 180 | 7,200 | Declared | Sales management | Q3 retention analysis |
| Q3-2026 *(illustrative example)* | Model consumption, licences and operation | Recurring cost | Invoices for the period + operating hours × cost per hour | — | — | 9,400 | Validated | Management control | Q3 cost report |
| | | | | | | | | | |
| | | | | | | | | | |

---

## 5. Summary for the period and cumulative

Amounts in euros. The net value in the example is 15,000 + 7,200 − 9,400 = €12,800 for the quarter *(illustrative example)*.

| Magnitude | Validated | Declared | Estimated | Total for the period | Year to date | Expected for the same period | Variance |
|---|---|---|---|---|---|---|---|
| Efficiencies | | | | | | | |
| Return | | | | | | | |
| Recurring cost | | | | | | | |
| **Net value = efficiencies + return − recurring cost** | | | | | | | |

| Indicator | Value | Guidance |
|---|---|---|
| Proportion of validated value | | (Validated efficiencies + validated return) ÷ (total efficiencies + return). |
| Annualised net value | | State the annualisation method and mark it as estimated. |
| Cumulative investment made (€) | | |
| Additional net value per additional euro invested **(Enterprise)** | | Only if an extension is proposed: expected additional annual net value ÷ additional investment required. Without investment, hypothesis and timeframe it is not a data point (rule 4). |

---

## 6. Released capacity (separate, not counted)

**Destination:** Realised as lower cost · Explicitly reassigned · Destination pending.

| Period | Group or activity | Hours released | Formula | Status of the hours (Validated · Declared · Estimated) | Destination | Destination activity or reduced budget line | Realised amount (€) | Evidence |
|---|---|---|---|---|---|---|---|---|
| Q3-2026 *(illustrative example)* | Internal case handlers | 900 | 3,600 cases × 15 min saved ÷ 60 | Declared | Explicitly reassigned | Review of high-value contracts, previously not reviewed | — (reassignment, not savings) | Minutes of the area's management |
| | | | | | | | | |

Only the amount **realised** as lower actual cost may be carried over to block 4 as an efficiency, and only once. Reassigned capacity is reported here and valued by what the new activity produces, if measured.

---

## 7. Non-additive value

| Type | Description | Translated into money? (Yes · No) | Formula and amount, if translated | Status |
|---|---|---|---|---|
| Risk avoided | | | | |
| Compliance | | | | |

If it is not translated into money with a formula, it is not counted in block 5 and is marked "not quantified".

---

## 8. Attribution and allocation **(Enterprise)**

| Shared outcome | Other use cases or initiatives that contribute | Declared allocation (%) | Allocation criterion | Approved by |
|---|---|---|---|---|
| | | | | |

---

## 9. Missing data

| Magnitude | Reason why there is no data | Since when | Action to obtain it | Owner |
|---|---|---|---|---|
| | | | | |

---

## 10. Stop criteria and reading by ambition

| Stop criterion (phase 2) | Threshold | Value in the period | Triggered? (Yes · No) |
|---|---|---|---|
| | | | |

| Level | What will be required at G7 (01 §7.6) | Situation in the period |
|---|---|---|
| Optimise | Realised savings, not merely released capacity. | |
| Augment | Sustained performance and reassigned capacity. | |
| Transform | Measured return and verified change in the operating model or the offering. | |

---

## 11. Conclusion for the period

| Field | Content | Guidance |
|---|---|---|
| Assessment | | In line with the hypothesis · Below, within the approved tolerance · Relevant deviation. |
| Is it proposed to bring G7 forward? | | Yes · No. A relevant deviation at R6 brings G7 forward (01 §6.8). |
| Explanation | | Causes of the deviation and actions. |

---

## 12. Quality criteria

Formal R6 and G7 criteria in document 21; rules in document 40.

| # | Check | Status (Met · Not met · Not applicable · Pending) |
|---|---|---|
| 1 | Every amount has a formula, type, status and evidence. | |
| 2 | Validated amounts have been validated by management control or audit. | |
| 3 | Net value is calculated as efficiencies + return − recurring cost. | |
| 4 | Released capacity is shown separately and only what has been realised is counted, once. | |
| 5 | Missing data are shown as missing, not as zero. | |
| 6 | The reference hypothesis has not been modified without a decision of the competent body. | |
| 7 | The proportion of validated value is reported. | |

---

## 13. Approval and verification

| Function | Role | Name | Date | Signature or reference |
|---|---|---|---|---|
| Author | AI Product Owner | | | |
| Validation of amounts | Management control | | | |
| Verifier | AI Office (Lite) · AI Auditor (Enterprise) | | | |
| Review | R6 or G7 decision-maker (recorded in P29) | | | |

Segregation of duties: whoever declares an amount does not validate it; the verifier is not part of the team that builds.

---

## 14. Version control

| Version | Date | Changes |
|---|---|---|
| 0.1 | 16-09-2026 | First version of the template. |
