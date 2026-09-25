# Consumption budget and cost reconciliation

**Sets the consumption budget for each use case with its alerts and its degradation cascade, records the allocation keys for shared costs, reconciles AI cost with the accounts and calculates the cost of stopping.**

| | |
|---|---|
| Document | Template P63 · Consumption budget and cost reconciliation |
| Version | 0.1 (working draft) |
| Date | 19-09-2026 |
| Author | Fernando García Varela |
| Status | Draft for review. |

---

> **Legal notice and disclaimer.** SEVEN-G is a reference methodological framework provided "as is" and for information purposes only. It does not constitute legal, regulatory, financial or professional advice, nor does it guarantee compliance with any law or standard. References to general regulation (such as the EU AI Act, the GDPR, DORA or NIS2), to technical standards and to regulation specific to each sector or jurisdiction may be incomplete, may not apply to a particular case or may become out of date as a result of regulatory changes, interpretations or supervisory positions after their consultation date. **Each organisation that uses SEVEN-G is solely responsible for identifying the regulation that applies to it, verifying that it is current and certifying its own regulatory compliance**, with the appropriate qualified advice. This methodology is a generic, free aid shared with the community so that nobody has to start from scratch; each person or organisation can and should adapt it to its own use. It must not be inferred that its legally sensitive parts have been reviewed by legal counsel: those reviews, for each company or sector, are the ultimate responsibility of the company, consultant or organisation that uses it. Although every effort is made to keep it up to date, some regulation may have changed without being reflected here. To the fullest extent permitted by law, the author accepts no responsibility whatsoever for the effects of its application in any organisation or for its full applicability. The methodology does not grant certification of any kind. The author accepts no liability for any use made of this content or for any decisions taken on the basis of it. The data, figures, companies and cases in the examples are fictitious or illustrative.

> **Why it matters.** The cost of generative AI and agents is variable and can soar within days. If consumption has no budget, alerts and a defined response, when the money runs out only two bad options remain: cut the service or keep spending. If shared costs are allocated without approved keys, the cost of each use case is argued at every committee meeting and the net value stops being comparable. And if AI cost is not reconciled with the accounts, the board cannot rely on any net value figure. This template records all three and makes them verifiable.

## 1. Instructions for use

| Aspect | Guidance |
|---|---|
| **When it is used** | Budget, alerts, limits and cascade (sections 3 to 7): approved at G5 and reviewed at each R6. Tracking (section 8): every month. Allocation keys (section 9): at C3, once per financial year. Reconciliation (section 10): at each monthly close. Cost of stopping (section 11): when a stop or a retirement is recorded. |
| **Who completes it** | Sections 3 to 8: AI Operations Owner with the AI Technical Owner. Sections 9 and 10: management control with the AI Office. Section 11: AI Product Owner with management control. |
| **Who verifies it** | AI Office in Lite; AI Auditor in Enterprise (42 §11.2). |
| **Who decides or approves** | The consumption budget is approved with the G5 decision (body in 01 §7.5). Allocation keys: the AI Committee with management control at C3. Budget supplements: the AI Sponsor with the AI Office. |
| **Stage, *gate* or moment** | G5, R6, C3, monthly close and annual close; stop or retirement. |
| **Tool** | T13 · Cost calculator per use case (parameters, consumption, shared costs, reconciliation and stops modules, 42 §12). |
| **Reference document** | Document 42 (§6, §7, §8, §10, §11); document 52 §10.3 (cost-driven degradation cascade); P24 and P25. |
| **Lite versus Enterprise** | Lite may omit the fields marked **(Enterprise)**. In the cascade, Lite defines at least N1 and N4; Enterprise defines it in full and tests it before G5 (52 §14). |

Completion rules:

- **Cost is not reduced:** it is charged in full from day one; an unknown cost is "no data" and so is the net value (42 §2).
- **No tag, no resource:** each resource, model access key and licence carries the tag of its initiative (42 §7). Tagging is verified at G5.
- **Allocation keys are not changed mid-year** except in the event of an error, and the change is recorded.
- **The cascade reduces cost, not controls:** no degradation deactivates filters, human oversight, agent limits or records (52 §10.3, rule 6).
- The thresholds in this template are indicative; the company sets them at C2 (document 13).

---

## 2. Identification

| Field | Content | Guidance |
|---|---|---|
| Initiative code | | IA-AAAA-NNN (T01). In sections 9 and 10, "portfolio" or the platform (`PLAT-` in the tag, 42 §7.1). |
| AI systems | | SIA-AAAA-NNN (P05). |
| Type of system | | Predictive ML · Generative AI · Agent · Embedded third-party AI. |
| Intensity | | Lite · Enterprise. |
| Financial year and period | | For example, 2027 · March. |
| Version of the T13 parameters | | Parameters versioned by financial year. |
| Document version, author and date | | DD-MM-AAAA. |

---

## 3. Tagging and access keys

| Tag or key | Value | Verified at G5 (Yes · No) |
|---|---|---|
| `iniciativa` | | |
| `sistema` | | |
| `entorno` | development · testing · pre-production · production | |
| `centro_coste` | | |
| Model access key per use case and environment | | |
| Own credentials and budget for each agent | | |

---

## 4. Use case consumption budget

| Variable cost category | Monthly budget (€) | Annual budget (€) | Volume assumption | Consumption source | Non-linear profile (closes, campaigns) |
|---|---|---|---|---|---|
| Model consumption | | | | Model gateway or provider billing | |
| Compute and infrastructure | | | | Cloud billing | |
| Other variable costs | | | | | |
| *(illustrative example)* Model consumption of the customer service assistant | 12,000 | 144,000 | 60,000 queries per month | Model gateway | Peak in the last week of the month |

**Month-end forecast = cumulative consumption ÷ days elapsed × days in the month.** It is recalculated daily for agents and use cases with direct exposure, and weekly for the rest (42 §8.1).

---

## 5. Alerts and response

| Threshold | Approved value | Alert to | Response | Link to P25 |
|---|---|---|---|---|
| Consumption against budget (indicative 50%) | | AI Operations Owner | Review the forecast. | |
| Consumption against budget (indicative 80%) or month-end forecast > 100% | | AI Operations Owner and AI Product Owner | Analyse the cause and decide measures; activate N1 if defined. | |
| Consumption against budget (indicative 100%) | | AI Sponsor and AI Office | Applicable level of the cascade or a supplement with reasons. | |
| Anomalous consumption | | AI Operations Owner and security | Treat it as a possible incident (document 37). | |

---

## 6. Technical limits per agent

Only if the system includes agents. Configured in P18 and checked at G5 (42 §8.3).

| Agent | Maximum cost per run | Maximum calls per run | Maximum daily and monthly spend | Concurrent runs | Action on reaching the limit |
|---|---|---|---|---|---|
| | | | | | Stop · Refer to a person · Degraded mode, with a record |

The agent's kill switch can also be activated for cost reasons.

---

## 7. Cost-driven degradation cascade

Defined in P24, with the minimum quality from P25 and the fallback model recorded in P16 (52 §10.3).

| Level | What is done in this system | Trigger | Who activates it | Condition met (Yes · No · Not applicable) | Minimum quality during the level |
|---|---|---|---|---|---|
| N0 · Normal operation | Primary model and G5 configuration | — | — | — | — |
| N1 · Optimisation without a model change | | *(illustrative example)* 80% of the budget | | Parameters within the G5 ranges | |
| N2 · Fallback model **(Enterprise; optional in Lite)** | | *(illustrative example)* 100% of the budget | | Evaluated before G5 with the reference set and the bias tests; version in P16 | |
| N3 · Reduced scope | | | | Allocation criterion in P24 and people available | |
| N4 · Alternative without AI | | | | Tested rollback plan (P19) | |

| Field | Content | Guidance |
|---|---|---|
| Does the system decide or recommend about people, support a critical function or is it high-risk? | | If Yes, N2 is not used unless specifically validated for that use; move to N3, N4 or a supplement (52 §10.3, rule 2). |
| Cascade test before G5 | | Date and result, together with the rollback test. |

---

## 8. Monthly consumption tracking

| Month | Budget (€) | Actual consumption (€) | % | Days at N1 · N2 · N3 · N4 | Quality measured in the mode against the minimum (OPE-18) | Supplements approved | Cause and action |
|---|---|---|---|---|---|---|---|
| *(illustrative example)* March 2027 | 12,000 | 12,600 | 105% | 6 · 5 · 0 · 0 | 91% against 88% | No | Actual volume growth; the R6 adjusts the budget |
| | | | | | | | |

Each activation and each return to N0 is recorded in P27. More than one month at N2 or above is taken to the next R6 with a proposal: supplement, permanent optimisation (42 §8.5) or change of the primary model.

---

## 9. Allocation keys for shared costs

Approved at C3 by the AI Committee with management control, for the whole financial year (42 §6 and §11.2). Method in the order of 42 §6.1: direct charging · measured consumption · cost driver · weighted allocation.

| No. | Shared cost | Annual amount (€) | Method | Preferred key | Alternative key | What is not allocated to use cases | Tolerance for untagged consumption | Approval date |
|---|---|---|---|---|---|---|---|---|
| CR-01 *(illustrative example)* | Shared model platform | 240,000 | Measured consumption | Consumption per access key | Calls per use case | Platform testing | 5% | 15-01-2027 |
| CR-02 *(illustrative example)* | AI Office | 280,000 | Weighted allocation | Hours charged | Use cases weighted by intensity (Enterprise 2, Lite 1) | 40% corporate structure | — | 15-01-2027 |
| CR-01 | | | | | | | | |

| Field | Content | Guidance |
|---|---|---|
| Key changes during the year | | Only for errors; date, reason and who approves it. |
| Check: amount allocated = total shared cost | | For each key (42 §12). |

---

## 10. Monthly reconciliation

**Total AI cost in the accounts = Σ cost charged to use cases + corporate use cost + governance structure cost + unattributed cost** (42 §11.3).

| Month | Total cost in the accounts (€) | Charged to use cases (€) | Corporate use (€) | Governance structure (€) | Unattributed (€) (IND-COS-08) | Difference (€) | Explanation or correction | Consecutive closes unexplained |
|---|---|---|---|---|---|---|---|---|
| | | | | | | | | |

| Close magnitude | Value | Guidance |
|---|---|---|
| Untagged consumption above tolerance | | If it exceeds it, it is not allocated: unattributed cost and a tagging action; two closes in a row, minor nonconformity (42 §6.3). |
| Idle licences (IND-COS-09) **(Enterprise)** | | Assigned licences without use × unit cost. |
| Budget variance per use case (IND-COS-04) | | Quarterly. |
| Difference unexplained for two consecutive closes | | Reported to the AI Committee. |

---

## 11. Cost of stopping and avoided investment

When a stop or a retirement is recorded in T01 and T13 (42 §10).

| Magnitude | Amount (€) | Treatment |
|---|---|---|
| Approved budget | | |
| Spent up to the decision (sunk cost) | | Plays no part in the decision; recorded for lessons. |
| Non-cancellable commitments | | Reported separately; their reuse is sought. |
| Cost of stopping (closure, penalties, retention or deletion) | | Cost of the initiative. |
| **Avoided investment = approved − spent − commitments** | | IND-COS-10. Does not add to value. |
| Estimated avoided recurring cost | | Estimated. Does not add to value. |

*(Illustrative example)* Approved €400,000; spent €45,000; commitments €20,000; penalty €8,000 and closure €5,000. Cost of stopping: €13,000. Avoided investment: €335,000.

---

## 12. Quality criteria

Formal criteria in document 21 (G3.04, G4.08, G4.16, G5.16, R6.03 and G7.05); rules in document 42.

| # | Check | Status |
|---|---|---|
| 1 | The use case has its own tags and keys, verified before G5. | Met · Not met · Not applicable · Pending |
| 2 | The consumption budget is monthly and annual, with a volume assumption, and approved at G5. | |
| 3 | Each alert threshold has a recipient and a response, and is configured in P25. | |
| 4 | Agents have technical limits and an action on reaching them. | |
| 5 | The cascade defines triggers, who activates and minimum quality; N2 only with a model evaluated before G5. | |
| 6 | No level of the cascade deactivates critical controls. | |
| 7 | Each shared cost has a key approved at C3 and the amount allocated matches the total. | |
| 8 | The monthly reconciliation has been done and differences explained or corrected. | |
| 9 | In a stop, the avoided investment and the cost of stopping are recorded and do not add to value. | |

---

## 13. Approval and verification

| Function | SEVEN-G role | Name and position | Date | Signature or reference |
|---|---|---|---|---|
| Prepares budget, alerts and cascade | AI Operations Owner | | | |
| Approves the consumption budget | Body that decides G5 (01 §7.5) | | | |
| Approves the allocation keys | AI Committee with management control (C3) | | | |
| Reconciles | Management control | | | |
| Verifies | AI Office (Lite) · AI Auditor (Enterprise) | | | |

Segregation of duties: whoever operates the system does not approve their own budget supplement; management control approves the keys and reconciles, but does not take part in building the initiatives.

---

## 14. Version control

**Completed document**

| Version | Date | Author | Changes |
|---|---|---|---|
| | | | |

**Template**

| Version | Date | Changes |
|---|---|---|
| 0.1 | 19-09-2026 | First version. Covers the consumption budget, alerts and limits in 42 §8, the cost-driven degradation cascade in 52 §10.3, the allocation keys in 42 §6 and §11.2, the reconciliation in 42 §11.3 and the cost of stopping in 42 §10. |
