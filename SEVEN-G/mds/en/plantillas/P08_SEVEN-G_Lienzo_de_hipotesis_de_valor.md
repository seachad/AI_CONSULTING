# Value hypothesis canvas

**Formulates the initiative's expected value as a falsifiable, measurable hypothesis expressed in money, with its attribution method and stop criteria set before investing.**

| | |
|---|---|
| Document | Template P08 · Value hypothesis canvas |
| Version | 0.1 (working draft) |
| Date | 16-09-2026 |
| Author | Fernando García Varela |
| Status | Draft for review. |

---

> **Legal notice and disclaimer.** SEVEN-G is a reference methodological framework provided "as is" and for information purposes only. It does not constitute legal, regulatory, financial or professional advice, nor does it guarantee compliance with any law or standard. References to general regulation (such as the EU AI Act, the GDPR, DORA or NIS2), to technical standards and to regulation specific to each sector or jurisdiction may be incomplete, may not apply to a particular case or may become out of date as a result of regulatory changes, interpretations or supervisory positions after their consultation date. **Each organisation that uses SEVEN-G is solely responsible for identifying the regulation that applies to it, verifying that it is current and certifying its own regulatory compliance**, with the appropriate qualified advice. This methodology is a generic, free aid shared with the community so that nobody has to start from scratch; each person or organisation can and should adapt it to its own use. It must not be inferred that its legally sensitive parts have been reviewed by legal counsel: those reviews, for each company or sector, are the ultimate responsibility of the company, consultant or organisation that uses it. Although every effort is made to keep it up to date, some regulation may have changed without being reflected here. To the fullest extent permitted by law, the author accepts no responsibility whatsoever for the effects of its application in any organisation or for its full applicability. The methodology does not grant certification of any kind. The author accepts no liability for any use made of this content or for any decisions taken on the basis of it. The data, figures, companies and cases in the examples are fictitious or illustrative.

## 1. Instructions for use

| Aspect | Guidance |
|---|---|
| **When it is used** | In phase 2 (Value hypothesis), before G2. It is compared with the pilot results in phase 5 (P22) and with the value realised in phases 6 and 7 (P28). |
| **Who completes it** | The AI Product Owner. Management control reviews the unit values and the formula. |
| **Who verifies it** | Lite: AI Office. Enterprise: AI Auditor. |
| **Who decides** | Lite: sponsor. Enterprise: AI Committee. Transform: in addition, the board or its board committee. |
| **Gate at which it is reviewed** | G2 · Hypothesis. |
| **Tool** | T11 · Value hypothesis canvas and calculator. |
| **Lite versus Enterprise** | Lite may omit the fields marked **(Enterprise)**. The hypothesis, main metric, baseline, threshold, attribution method, formula and stop criteria are mandatory in both. |

Rules that apply (00 §6):

- Every amount has a **formula** (units × unit value), is **incremental** relative to the baseline and has a **status**: validated, declared or estimated.
- **Efficiencies**, **return** and **recurring cost** are kept separate. **Annual net value = efficiencies + return − recurring cost.**
- **Released capacity does not count** until it is realised or explicitly reassigned.
- Each euro is attributed to **a single case**; if there are shared outcomes, the allocation is declared.
- **A hypothesis that cannot fail is not valid.** The stop criteria may not be relaxed afterwards without the approval of the body that authorised the initiative (01 §7.4).

The figures in the examples are **fictitious**.

---

## 2. Identification

| Field | Content | Guidance |
|---|---|---|
| Initiative code | | IA-AAAA-NNN. |
| Initiative name | | |
| Confirmed ambition level | | Optimise · Augment · Transform (P07, Confirmed column). |
| Primary sphere | | Taxonomy in 03 §3.3. |
| Intensity | | Lite · Enterprise. |
| Document version | | |
| Date | | DD-MM-AAAA. |
| Author | | Name and role. |

---

## 3. Problem, users and solution

| Field | Content | Guidance |
|---|---|---|
| Understandable description | | What it is and what it is used for (rule 10). |
| Problem or opportunity | | Current situation with baseline data (P09). |
| Users and beneficiaries | | Who uses the system and who receives the benefit. |
| Proposed solution | | What the system will do and what people will continue to do. |
| Critical assumptions | | Conditions without which the hypothesis does not hold. |

---

## 4. Falsifiable value hypothesis

**Format:** *If* [intervention], *then* [main metric] will move from [baseline] to [target] in [scope] within [timeframe], measured with [attribution method]. *The hypothesis will be considered refuted if* [measurable condition].

| Field | Content | Guidance |
|---|---|---|
| Hypothesis statement | | A single sentence in the format above. |
| Refutation condition | | Specific result that would show the hypothesis to be false. |
| Testing horizon | | Date or period in which it will be tested. |

*(illustrative example)* If a response assistant is introduced for order queries in the web channel, then the rate of queries resolved without the intervention of an agent will move from 0% to 35% in that channel within six months of the start of the pilot, measured with a control group. The hypothesis will be considered refuted if the rate is below 20% or if the satisfaction of the customers served falls by more than 5 points relative to the control group.

Falsifiability test:

| Question | Yes · No |
|---|---|
| Is there a possible result that would refute the hypothesis? | |
| Are the metric, threshold, scope and timeframe numerical or verifiable? | |
| Is the baseline measured or is its estimate justified (P09)? | |

---

## 5. Metrics

| Type | Metric | Definition and formula | Unit | Baseline (P09) | Target | Success threshold | Frequency |
|---|---|---|---|---|---|---|---|
| Main | | | | | | | |
| Secondary | | | | | | | |
| Safeguard | | | | | | | |
| *(illustrative example)* Main | Resolution rate without an agent | Queries closed without handover ÷ queries handled by the assistant | % | 0% | 35% | 20% | Weekly |
| *(illustrative example)* Safeguard | Satisfaction of the customer served | Average of the follow-up survey (0–100) | points | 78 | ≥ 78 | ≥ 73 | Weekly |

- **Target**: expected result.
- **Success threshold**: minimum for the hypothesis to be considered validated.
- **Safeguard metric**: what must not get worse (quality, satisfaction, errors, complaints, fairness).

---

## 6. Attribution method

| Field | Content | Guidance |
|---|---|---|
| Method | | Control group · Before and after · Other, justified. A control group is preferred whenever possible. |
| Design | | How the groups or periods are formed, size and duration. |
| Threats to validity | | Seasonality, simultaneous changes in the process, novelty effect, selection of favourable cases. |
| How they are controlled | | Measures to neutralise each threat. |
| Who validates the measurement | | Management control or audit (condition for *validated* status). |
| Allocation with other initiatives | | If another initiative contributes to the same outcome, percentage attributed to each and criterion (rule 5). |

---

## 7. Value in money

### 7.1 Annual amounts

| Type | Item | Units | Unit value (€) and source | Formula | Annual amount (€) | Amount status | Assumptions |
|---|---|---|---|---|---|---|---|
| Efficiencies | | | | | | validated · declared · estimated | |
| Return | | | | | | | |
| Recurring cost | | | | | | | |
| *(illustrative example)* Efficiencies | External customer service hours no longer contracted | 4,000 h | €21.00/h (current contract) | 4,000 × 21.00 | 84,000 | estimated | Contractual reduction agreed with the supplier from the second quarter. |
| *(illustrative example)* Return | Orders not cancelled thanks to an immediate response | 1,200 orders | €9.00 margin per order | 1,200 × 9.00 | 10,800 | estimated | Cancellation rate of the control group. |
| *(illustrative example)* Recurring cost | Model consumption | 200,000 queries | €0.03 per query | 200,000 × 0.03 | 6,000 | estimated | Supplier's public rate. |
| *(illustrative example)* Recurring cost | Platform licences | 1 | €12,000 per year | 1 × 12,000 | 12,000 | estimated | Offer received. |
| *(illustrative example)* Recurring cost | Operations staff | 0.3 FTE | €55,000 per FTE | 0.3 × 55,000 | 16,500 | estimated | Average cost of the function. |

### 7.2 Economic summary

| Item | Amount (€) | Guidance |
|---|---|---|
| Efficiencies | | Sum from 7.1. |
| Return | | Sum from 7.1. |
| Recurring cost | | Sum from 7.1. |
| **Annual net value** | | Efficiencies + return − recurring cost. |
| Additional investment required | | Build, integration, adoption and control up to production. |
| **Additional net value per euro** | | Expected additional annual net value ÷ additional investment required. |
| Time to first value | | Months. |
| Return horizon set in C2 **(Enterprise)** | | Period within which the net value must be positive. |

*(illustrative example)* 84,000 + 10,800 − 34,500 = **€60,300** of annual net value. With an additional investment of €90,000, the additional net value per euro is 60,300 ÷ 90,000 = **0.67**.

### 7.3 Released capacity (does not count)

| Capacity | Quantity | Realisation or reassignment plan | Owner | Date |
|---|---|---|---|---|
| | | Realisation (lower actual cost) · Explicit reassignment to another activity · No plan | | |
| *(illustrative example)* Internal agent hours | 2,500 h/year | Reassignment to handling complex issues | Customer service management | Third quarter |

Only when it is realised or reassigned in a verifiable way does it move to 7.1 as an efficiency.

### 7.4 Non-additive value and non-monetary measures **(Enterprise)**

| Type | Description | Translated into money? | Formula or reason why it could not be quantified |
|---|---|---|---|
| Avoided risk · Compliance · Other measure | | Yes · No | |

Avoided risk and compliance are not added to the net value unless they are translated into money with a formula (rule 7).

---

## 8. Stop criteria

| # | Criterion | Indicator and threshold | Evaluation point | Decision if triggered | Who evaluates it |
|---|---|---|---|---|---|
| 1 | | | | Stop · Pivot · Iterate | |
| 2 | | | | | |
| *(illustrative example)* 1 | Insufficient resolution | Resolution rate < 20% after 8 weeks of pilot | End of the pilot | Stop | AI Committee |
| *(illustrative example)* 2 | Deterioration of the experience | Satisfaction < 73 points for two consecutive weeks | Weekly | Suspend the pilot and Iterate | Product owner; the sponsor decides |

They must include, at a minimum, one criterion on the main metric, one on the safeguard and one economic criterion (maximum cost or investment).

---

## 9. Transform only

### 9.1 Learning milestones and investment limit per stage

| Stage | Learning question | Expected evidence | Metric and threshold | Date | Maximum investment for the stage (€) | Maximum cumulative investment (€) | Decision at close | Body |
|---|---|---|---|---|---|---|---|---|
| 1 | | | | | | | Proceed · Pivot · Stop | |
| 2 | | | | | | | | |
| *(illustrative example)* 1 | Would business customers pay for a stock-out forecasting service? | Letters of intent from pilot customers | ≥ 5 customers with signed intent | 31-03-2027 | 60,000 | 60,000 | Proceed if achieved; Stop if not | AI Committee |
| *(illustrative example)* 2 | Is paid use sustained? | Paid trial contracts | ≥ 3 customers renew after 3 months | 30-09-2027 | 150,000 | 210,000 | Proceed · Pivot · Stop | Board |

### 9.2 Approval of the bet

| Field | Content | Guidance |
|---|---|---|
| Return hypothesis | | What revenue, services or change in operating model are expected, and when. |
| Main uncertainties | | What is not yet known and will be resolved with the milestones. |
| Option value | | What capability or position the company gains even if the bet does not scale. Documented for G3. |
| Total investment limit | | Maximum authorised before a new board decision. |
| Board decision | | Date, body and reference of the minutes. |

---

## 10. Check by ambition level at G2

Reference: 01 §7.6.

| Level | What the canvas must contain | Met |
|---|---|---|
| Optimise | Baseline for cost, time or errors; expected savings with a formula. | Yes · No · Not applicable |
| Augment | Performance and cost metrics; adoption target. | |
| Transform | Return hypothesis with learning milestones; investment limit per stage; board approval. | |

---

## 11. Quality criteria

The formal G2 criteria are in document 21 (see criteria G2.xx).

| # | Check | Status |
|---|---|---|
| 1 | The hypothesis is falsifiable: it has a refutation condition, threshold, scope and timeframe. | Met · Not met · Not applicable · Pending |
| 2 | The baseline is measured or its estimate is justified in P09. | |
| 3 | There is a main metric and at least one safeguard metric. | |
| 4 | The attribution method is explicit and controls the main threats. | |
| 5 | Every amount has a formula, type and status. | |
| 6 | Released capacity is shown separately and does not count. | |
| 7 | Annual net value and additional net value per euro are calculated. | |
| 8 | The stop criteria exist and predate the investment. | |
| 9 | For Transform: milestones, limit per stage, option value and board approval. | |

---

## 12. Approval and verification

| Function | Role in SEVEN-G | Name and position | Date | Signature or reference |
|---|---|---|---|---|
| Prepares | AI Product Owner | | | |
| Reviews unit values | Management control | | | |
| Verifies | AI Office (Lite) · AI Auditor (Enterprise) | | | |
| Decides | AI Sponsor (Lite) · AI Committee (Enterprise) | | | |
| Approves Transform | Board or board committee | | | |

Segregation of duties: the verifier has not prepared the canvas; the sponsor is accountable for the value, but does not verify.

---

## 13. Version control

**Completed document**

| Version | Date | Author | Changes |
|---|---|---|---|
| | | | |

**Template**

| Version | Date | Changes |
|---|---|---|
| 0.1 | 16-09-2026 | First version. Applies the measurement rules in 00 §6, the G2 criteria by ambition level in 01 §7.6 and the value parameters in the common specification §5.7. |
