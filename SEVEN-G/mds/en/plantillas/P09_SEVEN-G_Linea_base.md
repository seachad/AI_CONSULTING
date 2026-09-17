# Baseline

**Measures the starting position of the value hypothesis metrics, with a reproducible method, so that subsequent value is incremental and verifiable.**

| | |
|---|---|
| Document | Template P09 · Baseline |
| Version | 0.1 (working draft) |
| Date | 16-09-2026 |
| Author | Fernando García · SEACHAD |
| Status | Draft for review. |

---

> **Legal notice and disclaimer.** SEVEN-G is a reference methodological framework provided "as is" and for information purposes only. It does not constitute legal, regulatory, financial or professional advice, nor does it guarantee compliance with any law or standard. References to general regulation (such as the EU AI Act, the GDPR, DORA or NIS2), to technical standards and to regulation specific to each sector or jurisdiction may be incomplete, may not apply to a particular case or may become out of date as a result of regulatory changes, interpretations or supervisory positions after their consultation date. **Each organisation that uses SEVEN-G is solely responsible for identifying the regulation that applies to it, verifying that it is current and certifying its own regulatory compliance**, with the appropriate qualified advice. The author and SEACHAD accept no liability for any use made of this content or for any decisions taken on the basis of it. The data, figures, companies and cases in the examples are fictitious or illustrative.

## 1. Instructions for use

| Aspect | Guidance |
|---|---|
| **When it is used** | In phase 2, before G2, in parallel with the value hypothesis canvas (P08). The baseline is frozen at G2 and used in phases 5, 6 and 7. |
| **Who completes it** | The AI Product Owner, with the owner of the process data. Management control reviews the unit values. |
| **Who verifies it** | Lite: AI Office. Enterprise: AI Auditor. |
| **Who decides** | It is approved with G2: sponsor (Lite) · AI Committee (Enterprise). |
| **Gate at which it is reviewed** | G2 · Hypothesis. It is consulted again at G5, R6 and G7. |
| **Tool** | T11 · Value hypothesis canvas and calculator. |
| **Lite versus Enterprise** | Lite may omit the fields and blocks marked **(Enterprise)**. The definition of metrics, the period, the method and the results are mandatory in both. |

Completion rules:

- The baseline is **measured**; it is only estimated if it is justified why it cannot be measured and how this will be corrected (01 §6.4).
- "No data" is not zero: missing data is shown as missing and is never filled in without saying so (rule 8).
- The metrics must be **the same**, with the same definition, as those that will be used to measure the result.

---

## 2. Identification

| Field | Content | Guidance |
|---|---|---|
| Initiative code | | IA-AAAA-NNN. |
| Initiative name | | |
| Version of the associated canvas | | Version of P08 to which this baseline corresponds. |
| Document version | | |
| Date | | DD-MM-AAAA. |
| Author | | Name and role. |
| Freeze date | | Date of G2. Thereafter it is only modified in accordance with section 9. |

---

## 3. Definition of the metrics

| Metric | Type | Operational definition | Formula | Unit | Data source | Data owner |
|---|---|---|---|---|---|---|
| | Main · Secondary · Safeguard | | | | | |
| *(illustrative example)* Average time to first response | Secondary | Hours from receipt of the query to the first useful response to the customer | Sum of times ÷ no. of queries | hours | Customer service tool | Head of customer service operations |
| *(illustrative example)* External customer service hours | Main (economic) | Hours invoiced by the external customer service supplier | Monthly sum of invoiced hours | h | Supplier invoices | Management control |

The operational definition answers: what is counted, what is excluded, from when and until when, and in which system it is recorded.

---

## 4. Measurement period and method

| Field | Content | Guidance |
|---|---|---|
| Reference period | | Start and end dates. |
| Justification of the duration | | It must cover the relevant cycles of the process (weeks, months, campaigns). |
| Scope or population | | Channels, units, customers or cases included. |
| Sample **(Enterprise)** | | If the whole population is not measured: size, selection criterion and representativeness. |
| Measured or estimated | | Measured · Estimated. If estimated, justification and plan to measure it before G5. |
| Extraction method | | Query, report or system from which it is obtained. |
| Exclusions | | Cases excluded and reason. |
| Treatment of missing data | | How they are shown and how many there are. |
| Data quality | | Completeness and known problems. |

---

## 5. Baseline results

| Metric | Period | Value | Variability | No. of observations | Status | Remarks |
|---|---|---|---|---|---|---|
| | | | Minimum–maximum or standard deviation | | Measured · Estimated · No data | |
| *(illustrative example)* Average time to first response | 01-01-2026 to 30-06-2026 | 26.4 h | 9.1–41.7 h (monthly average) | 96,300 | Measured | Peaks during January campaigns. |
| *(illustrative example)* External customer service hours | 01-01-2026 to 30-06-2026 | 5,150 h | 610–1,240 h/month | 6 invoices | Measured | — |
| *(illustrative example)* Satisfaction of the customer served | 01-01-2026 to 30-06-2026 | No data | — | — | No data | The survey is activated in October; it will be measured four weeks before the pilot. |

---

## 6. Unit values for translation into money

| Item | Unit value (€) | Source | Reference date | Reviewed by management control |
|---|---|---|---|---|
| | | | | Yes · No |
| *(illustrative example)* Cost per hour of external customer service | 21.00 | Current contract with the supplier | 01-06-2026 | Yes |
| *(illustrative example)* Average margin per order | 9.00 | Channel income statement | First half of 2026 | Yes |

The unit values are used in the P08 formula (units × unit value). If they change after G2, this is recorded in section 9.

---

## 7. Control group

Complete if the attribution method in P08 is a control group.

| Field | Content | Guidance |
|---|---|---|
| Definition of the control group | | Which cases, customers or units do not receive the intervention. |
| Assignment criterion | | Random, by region, by shift or other, with justification. |
| Comparability | | Baseline values in the control group and in the treated group. |
| Risk of contamination | | How the control group is prevented from receiving effects of the intervention. |

| Metric | Treated group (baseline) | Control group (baseline) | Difference | Comparable? |
|---|---|---|---|---|
| | | | | Yes · No |

---

## 8. External factors and seasonality

| Factor | Expected effect on the metric | How it is corrected or controlled |
|---|---|---|
| | | |
| *(illustrative example)* Sales campaign | 60% increase in queries in January | Compare with the same period of the control group and not with the annual average. |

---

## 9. Freeze and subsequent changes

After G2, the baseline may only be modified because of a documented material error or a change in the definition of a metric, with the approval of the body that authorised the initiative. Modifying it to favour the result is a nonconformity.

| Date | Metric | Previous value | New value | Reason | Approved by |
|---|---|---|---|---|---|
| | | | | | |

---

## 10. Reproducibility **(Enterprise)**

| Field | Content | Guidance |
|---|---|---|
| Query or calculation procedure | | Link to the versioned query, script or report. |
| Version or snapshot of the data | | Identifier of the extraction used. |
| Location | | Repository where it is kept. |
| Person able to reproduce it | | Different from whoever calculated it. |

---

## 11. Quality criteria

The formal G2 criteria are in document 21 (see criteria G2.xx).

| # | Check | Status |
|---|---|---|
| 1 | Each P08 metric has an operational definition, formula and source. | Met · Not met · Not applicable · Pending |
| 2 | The period covers the relevant cycles of the process. | |
| 3 | The baseline is measured or its estimate is justified with a measurement plan. | |
| 4 | Missing data appears as "no data". | |
| 5 | The unit values have a source and management control review. | |
| 6 | If there is a control group, its comparability is demonstrated. | |
| 7 | The freeze date is recorded. | |

---

## 12. Approval and verification

| Function | Role in SEVEN-G | Name and position | Date | Signature or reference |
|---|---|---|---|---|
| Prepares | AI Product Owner | | | |
| Provides data | Owner of the process data | | | |
| Reviews unit values | Management control | | | |
| Verifies | AI Office (Lite) · AI Auditor (Enterprise) | | | |
| Decides | AI Sponsor (Lite) · AI Committee (Enterprise), with G2 | | | |

Segregation of duties: the verifier has not calculated the baseline.

---

## 13. Version control

**Completed document**

| Version | Date | Author | Changes |
|---|---|---|---|
| | | | |

**Template**

| Version | Date | Changes |
|---|---|---|
| 0.1 | 16-09-2026 | First version. Structure aligned with 01 §6.4 and with measurement rules 1 and 8 in 00 §6. |
