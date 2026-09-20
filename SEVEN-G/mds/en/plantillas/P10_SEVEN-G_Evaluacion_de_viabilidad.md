# Feasibility assessment

**Brings together the technical, data, economic, organisational, regulatory and risk evidence needed to decide at G3 whether the initiative proceeds or stops.**

| | |
|---|---|
| Document | Template P10 · Feasibility assessment |
| Version | 0.1 (working draft) |
| Date | 16-09-2026 |
| Author | Fernando García Varela |
| Status | Draft for review. |

---

> **Legal notice and disclaimer.** SEVEN-G is a reference methodological framework provided "as is" and for information purposes only. It does not constitute legal, regulatory, financial or professional advice, nor does it guarantee compliance with any law or standard. References to general regulation (such as the EU AI Act, the GDPR, DORA or NIS2), to technical standards and to regulation specific to each sector or jurisdiction may be incomplete, may not apply to a particular case or may become out of date as a result of regulatory changes, interpretations or supervisory positions after their consultation date. **Each organisation that uses SEVEN-G is solely responsible for identifying the regulation that applies to it, verifying that it is current and certifying its own regulatory compliance**, with the appropriate qualified advice. The author accepts no liability for any use made of this content or for any decisions taken on the basis of it. The data, figures, companies and cases in the examples are fictitious or illustrative.

## 1. Instructions for use

| Aspect | Guidance |
|---|---|
| **When it is used** | In phase 3 (Feasibility and risk), before G3, which is the main stop gate in the lifecycle. |
| **Who completes it** | The AI Product Owner (economic and organisational feasibility) and the AI Technical Owner (technical and data feasibility). The risk owner provides the summary of P11, P12, P13 and P14. |
| **Who verifies it** | Lite: AI Risk Owner. Enterprise: AI Auditor. If the risk owner has prepared parts of this document, in Lite the AI Office or the AI Auditor verifies it. |
| **Who decides** | Lite: sponsor with risk clearance. Enterprise: AI Committee. |
| **Gate at which it is reviewed** | G3 · Feasibility. |
| **Tool** | It has no tool of its own; costs can be calculated with T13 and value with T11. |
| **Lite versus Enterprise** | Lite may omit the fields and blocks marked **(Enterprise)**. |

Completion rules:

- Feasibility is **demonstrated with real data**, not with assumptions (01 §6.5).
- Practices prohibited by regulation **do not get past this phase under any circumstances**.
- No Critical residual risk without the approval provided for in P12 may pass G3.
- Costs are **complete**: build, recurring and adoption.

---

## 2. Identification

| Field | Content | Guidance |
|---|---|---|
| Initiative code | | IA-AAAA-NNN. |
| Initiative name | | |
| Confirmed ambition level | | Optimise · Augment · Transform. |
| Intensity | | Lite · Enterprise (reviewed at G3 with P04). |
| Document version | | |
| Date | | DD-MM-AAAA. |
| Authors | | Names and roles by block. |

---

## 3. Summary and recommendation

| Field | Content | Guidance |
|---|---|---|
| Technical conclusion | | Feasible · Feasible with conditions · Not feasible. |
| Data conclusion | | Feasible · Feasible with conditions · Not feasible. |
| Economic conclusion | | Feasible · Feasible with conditions · Not feasible. |
| Organisational conclusion | | Feasible · Feasible with conditions · Not feasible. |
| Regulatory and risk conclusion | | Feasible · Feasible with conditions · Not feasible. |
| **Recommendation to the decision-making body** | | Proceed · Proceed with conditions · Iterate · Pivot · Stop. |
| Main reason | | Two or three sentences. |

---

## 4. Technical feasibility

| Field | Content | Guidance |
|---|---|---|
| Technical approach assessed | | Type of solution, models, build or buy. |
| Tests carried out | | Proof of concept or experiment, with dates and real data used. |
| Integration | | Systems with which it must be integrated and complexity identified. |
| Scalability and performance | | Expected volumes and test results. |
| Maturity of the technology and the supplier | | Stability, support, roadmap. |
| Internal capabilities | | Available knowledge and gaps. |
| Preliminary reversibility | | How it could be stopped or reverted to the previous process. |

| Requirement | Required threshold | Result obtained | Met |
|---|---|---|---|
| | | | Yes · No · Partial |
| *(illustrative example)* Correct answers on order status (reviewed sample) | ≥ 95% | 96.8% over 1,000 test conversations | Yes |
| *(illustrative example)* Response time | ≤ 5 s in 95% | 3.2 s | Yes |
| *(illustrative example)* Resistance to prompt injection | 0 leaks of other customers' data | 2 leaks in 300 test attacks | No |

---

## 5. Data feasibility

| Source | Availability | Quality | Legal basis and purpose | Biases or limitations | Action required | Result |
|---|---|---|---|---|---|---|
| | Available · Partial · Not available | Completeness, accuracy, timeliness | | | | Feasible · With conditions · Not feasible |
| *(illustrative example)* Order logistics system | Available via API | 99% of orders with status updated in less than 1 h | Performance of the contract with the customer | Does not reflect issues with external carriers | Integrate carrier notifications | With conditions |

---

## 6. Economic feasibility

### 6.1 Full costs

| Category | One-off investment (€) | Annual recurring cost (€) | Assumptions |
|---|---|---|---|
| Licences | | | |
| Model consumption | | | |
| Compute and infrastructure | | | |
| Data | | | |
| Build staff | | | |
| Operations staff | | | |
| Suppliers and services | | | |
| Control and compliance | | | |
| Adoption and training | | | |
| **Total** | | | |

### 6.2 Economic result

| Item | Value | Guidance |
|---|---|---|
| Expected annual efficiencies (€) | | From P08, updated with what has been learned in phase 3. |
| Expected annual return (€) | | From P08. |
| Annual recurring cost (€) | | From 6.1. |
| **Expected annual net value (€)** | | Efficiencies + return − recurring cost. |
| Additional investment required (€) | | From 6.1. |
| **Additional net value per euro** | | Expected additional annual net value ÷ additional investment required. |
| Horizon set in C2 | | Is the expected net value consistent with the horizon? Yes · No. |
| Scenarios **(Enterprise)** | | Annual net value in prudent, central and favourable scenarios, with the assumptions that change. |
| Status of the amounts | | In this phase, normally *estimated*. |

---

## 7. Organisational and adoption feasibility

| Field | Content | Guidance |
|---|---|---|
| Users and change in their work | | Which tasks change, how many people and to what extent. |
| Effect on roles and jobs | | Role changes, capacity reassignment, training needs. |
| Readiness for adoption | | Evidence: user tests, resistance detected. |
| Capacity to operate | | Who will operate the system and whether they have the capacity. |
| Labour relations **(Enterprise)** | | Information or consultation obligations and status. |
| Preliminary adoption plan | | Reference to P20, which is completed in phase 4. |

---

## 8. Regulatory and risk feasibility

| Field | Content | Guidance |
|---|---|---|
| Regulatory classification | | Taxonomy in 03 §3.3, with reference to P11 and to the legal validation. |
| Prohibited practice | | Yes · No. If "Yes", the recommendation is **Stop**. |
| Impact assessments | | Data protection impact assessment and fundamental rights impact assessment: carried out, not required or pending. |
| High and Critical residual risks | | Number and reference to P12; acceptance approval where applicable. |
| Mitigation and contingency plan | | Reference to P13. |
| Suppliers | | Requirement level and conclusion of P14. |
| Fit with the C2 risk appetite | | Yes · No, with justification. |

---

## 9. Check by ambition level at G3

Reference: 01 §7.6.

| Level | What must be demonstrated | Result | Met |
|---|---|---|---|
| Optimise | Positive expected annual net value within the horizon set in C2. | | Yes · No · Not applicable |
| Augment | Feasibility of adoption and of the role change, in addition to the expected net value. | | |
| Transform | Feasibility of the first stage; stop criteria per stage; documented option value. | | |

---

## 10. Proposed conditions

| No. | Condition | Deadline | Owner | *Gate* at which it is verified |
|---|---|---|---|---|
| 1 | | | | |
| *(illustrative example)* 1 | Fix the prompt injection vulnerability and repeat the test with 0 leaks. | Before G4 | Technical owner | G4 |

"Proceed with conditions" is not permitted for critical security, legal compliance or human oversight controls (01 §7.3). In the example, the condition affects a critical security control: the correct recommendation would be **Iterate** until it is fixed.

---

## 11. Quality criteria

The formal G3 criteria are in document 21 (see criteria G3.xx).

| # | Check | Status |
|---|---|---|
| 1 | Technical feasibility is based on tests with real data. | Met · Not met · Not applicable · Pending |
| 2 | Each data source has its availability, quality and legal basis assessed. | |
| 3 | Costs cover the nine categories and distinguish investment from recurring cost. | |
| 4 | Annual net value and additional net value per euro are calculated with status. | |
| 5 | The impact on people is assessed. | |
| 6 | P11, P12, P13 and, if there are suppliers, P14 exist. | |
| 7 | There are no prohibited practices or Critical risks without the required approval. | |
| 8 | The G3 criteria for the ambition level are applied. | |
| 9 | The proposed conditions do not affect critical controls. | |

---

## 12. Approval and verification

| Function | Role in SEVEN-G | Name and position | Date | Signature or reference |
|---|---|---|---|---|
| Prepares (economic and organisational) | AI Product Owner | | | |
| Prepares (technical and data) | AI Technical Owner | | | |
| Issues risk clearance | AI Risk Owner | | | |
| Verifies | Risk owner (Lite) · AI Auditor (Enterprise) | | | |
| Decides | Sponsor with risk clearance (Lite) · AI Committee (Enterprise) | | | |

Segregation of duties: nobody verifies a block they have prepared. Risk clearance and verification are separate acts and must be recorded separately.

---

## 13. Version control

**Completed document**

| Version | Date | Author | Changes |
|---|---|---|---|
| | | | |

**Template**

| Version | Date | Changes |
|---|---|---|
| 0.1 | 16-09-2026 | First version. Structure aligned with 01 §6.5 and §7.6 and with the cost categories in the common specification §5.7. |
