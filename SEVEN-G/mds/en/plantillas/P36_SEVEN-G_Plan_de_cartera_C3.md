# C3 portfolio plan

**Turns the C2 decision into an executable portfolio: envelopes by lane, prioritisation with the six criteria, capacity of scarce profiles, portfolio and concentration limits, calendar, programme traffic light and regularisation plan for existing systems.**

| | |
|---|---|
| Document | Template P36 · C3 portfolio plan |
| Version | 0.1 (working draft) |
| Date | 19-09-2026 |
| Author | Fernando García Varela |
| Status | Draft for review. |

---

> **Legal notice and disclaimer.** SEVEN-G is a reference methodological framework provided "as is" and for information purposes only. It does not constitute legal, regulatory, financial or professional advice, nor does it guarantee compliance with any law or standard. References to general regulation (such as the EU AI Act, the GDPR, DORA or NIS2), to technical standards and to regulation specific to each sector or jurisdiction may be incomplete, may not apply to a particular case or may become out of date as a result of regulatory changes, interpretations or supervisory positions after their consultation date. **Each organisation that uses SEVEN-G is solely responsible for identifying the regulation that applies to it, verifying that it is current and certifying its own regulatory compliance**, with the appropriate qualified advice. The author accepts no liability for any use made of this content or for any decisions taken on the basis of it. The data, figures, companies and cases in the examples are fictitious or illustrative.

> **Why it matters.** An approved thesis changes nothing if the portfolio is still decided by whoever pushes hardest or by immediate return. The portfolio plan makes visible the criteria and weights used to rank each lane, how much scarce capacity there really is, which risk limits cannot be exceeded and by when the systems that already existed are brought into the framework. Without it, Transform bets compete with optimisations and lose, risk concentration is not seen and regularisation remains open indefinitely.

## 1. Instructions for use

| Aspect | Guidance |
|---|---|
| **When it is used** | In C3: in the first implementation, in weeks 11–12 (90 §4.4); thereafter, every year after C2 or C5. It is updated at each quarterly portfolio review (14 §7.2). |
| **Who completes it** | The AI Office prepares it; management control provides amounts and consumption; the AI Risk Owner provides limits and concentration; sponsors provide the entry records. |
| **Who verifies it** | The AI Office checks the calculation and the second line the risk limits; the AI Auditor reviews the application of the method by sampling **(Enterprise)**. |
| **Who decides or approves** | The AI Committee. The board approves Transform initiatives and any transfer out of their envelope (14 §2.1). |
| **Corporate cycle stage** | C3 · Portfolio, with monitoring in C4. Inputs: P33 (C1) and P35 (C2). |
| **Tools** | T01 (entry record, scoring, lanes, tranches, alerts, "Programme" and "Regularisation" tags), T16 (balance by sphere), T22 (retirements), T06 (risk concentration). |
| **Reference document** | Document 14 (full method); 01 §5.1; 90 §4.4 and §5. |
| **Lite versus Enterprise** | Both scopes use the plan. Blocks marked **(Enterprise)** may be omitted in a Lite scope, with justification. |

Completion rules:

- **Each ambition competes with its peers.** Initiatives are scored and ranked only within their lane (14 §4.4).
- **No data is not a measured zero.** A criterion with no data scores 0 and is shown as "no data"; with no data on additional net value per euro, G2 cannot be passed (14 §4.3).
- **The order may be altered** with a written justification recorded in T01; if it affects the Transform lane, the board is informed.
- **Funding is staged.** Money is released *gate* by *gate* in tranches (14 §6.2).
- Regularisation documentation is identified as such and bears its actual date; it does not substantiate past *gates*.

---

## 2. Identification

| Field | Content | Guidance |
|---|---|---|
| Document code | | |
| Company or group | | In the examples, always fictitious. |
| Financial year or portfolio period | | |
| Reference C2 decision | | Version of P35 and DEC-AAAA-NNN. |
| Reference C1 report | | Version of P33. |
| C2 return horizon (years) | | For the multiple in section 4. |
| Date of AI Committee approval | | Reference to the minutes. |
| Plan version | | Incremented at each quarterly review with changes. |

---

## 3. Envelopes by lane and budget

Amounts approved in the C2 framework budget (P35, section 11) and their C3 structure (14 §6.1). Committed recurring cost is reserved first.

| Item | Approved in C2 | Committed | Available | C2 band (% of portfolio cost) | Remarks |
|---|---|---|---|---|---|
| Committed recurring cost | | | | — | |
| Optimise envelope (tranches 2 and 3) | | | | | |
| Augment envelope (tranches 2 and 3, including each initiative's adoption) | | | | | |
| Staged Transform envelope | | | | | Only stages approved by the board. |
| Enablement (data, platform, spheres 08 and 09) | | | | — | |
| Adoption and training not charged to initiatives | | | | — | |
| Contingency | | | | — | Includes the discovery reserve (tranche 1, phases 0–3), the retirement and regularisation reserve and approved deviations (14 §6.1). |
| **Total** | | | | | |

---

## 4. Prioritisation

### 4.1 Criteria and weights

Four-step method in 14 §4.1: eliminatory filters · assignment to the confirmed lane · scoring · allocation of budget and capacity. Weights in 14 §4.2 (the company may adjust them in C2 and declares them here).

| Criterion | Optimise | Augment | Transform | Company weights, if different |
|---|---|---|---|---|
| Additional net value per euro | 40 | 30 | 15 | |
| Fit with the thesis | 15 | 15 | 25 | |
| Contribution to ambition per sphere | 5 | 10 | 15 | |
| Risk | 15 | 15 | 15 | |
| Data dependency | 15 | 15 | 15 | |
| Capacity | 10 | 15 | 15 | |
| **Total** | **100** | **100** | **100** | **100** |

**Score (0–100) = Σ (weight × criterion score) ÷ 5.** Scales from 1 to 5 in 14 §4.3.

Spreadsheet formulas (illustrative columns: C = additional net value per euro, H = horizon in years, D to I = scores for the six criteria, weights in row 2):

- Multiple over the horizon: `=C5*$H$2`
- Score for additional net value per euro: `=IF(C5="",0,IF(M5>=3,5,IF(M5>=2,4,IF(M5>=1.5,3,IF(M5>=1,2,1)))))`, where M = multiple. If after G2 the amount is still only *estimated*, it is capped at 3: `=MIN(score,3)`.
- Total score: `=SUMPRODUCT($D$2:$I$2,D5:I5)/5`

### 4.2 Eliminatory filters

They are recorded with a reason and do not enter prioritisation (14 §3.3 and §4.1).

| Initiative (IA-AAAA-NNN) | Filter | Treatment |
|---|---|---|
| | Prohibited practice · Duplicate · Does not require AI · Outside the appetite · Transform without senior management sponsorship · Critical residual risk without board approval | |

### 4.3 Prioritisation table by lane

One table per lane: Optimise, Augment and Transform.

**Lane:** ______

| Initiative | Additional net value per euro | Multiple | Net | Thesis | Ambition | Risk | Data | Capacity | Score | Rank | Change of order and justification |
|---|---|---|---|---|---|---|---|---|---|---|---|
| | | | | | | | | | | | |
| | | | | | | | | | | | |
| *(illustrative example, Optimise, 2-year horizon)* IA-2026-014 Complaint classification | 1.6 | 3.2 | 5 | 4 | 3 | 5 | 4 | 4 | **90** | 1 | — |

In Transform, additional net value per euro is calculated and shown, but it is not decisive on its own; without learning milestones, a cap per stage and stop criteria, the proposal does not enter (14 §4.4, rules 2 and 7).

### 4.4 Allocation by tranche

| Initiative | Lane | Tranche (1 · 2 · 3 · Scaling · Transform stage) | Amount | Released after | Status (Pending · Released · Consumed) |
|---|---|---|---|---|---|
| | | | | | |

---

## 5. Capacity

### 5.1 Capacity plan for scarce profiles

The AI Office maintains the plan (14 §6.3). Units: full-time equivalents per quarter.

| Profile | Available | Demand from the prioritised portfolio | Gap | Measure (hire, train, supplier, postpone) | Owner | Date |
|---|---|---|---|---|---|---|
| Technical owners | | | | | | |
| Data | | | | | | |
| Risk | | | | | | |
| AI Auditor | | | | | | |
| Security | | | | | | |
| Adoption | | | | | | |
| *Gate* verification and decision | | | | | | Decision time against the reference time limit (03 §3.6). |

### 5.2 Limit on simultaneous initiatives

| Field | Content | Guidance |
|---|---|---|
| Limit on initiatives in phases 3 to 5 | | Once the limit is exceeded, no new initiatives enter phase 4 until one passes G5 or is stopped. |
| Initiatives currently in phases 3 to 5 | | |

---

## 6. Portfolio and concentration limits

### 6.1 Portfolio risk limits

They translate the C2 appetite (14 §5.2). Exceeding a limit does not stop initiatives under way, but it prevents new ones from entering the affected category.

| Limit | Value set | Current value | Status (Within · Exceeded) | Measure or escalation |
|---|---|---|---|---|
| Initiatives in production with accepted High residual risk | | | | |
| High regulatory risk systems simultaneously in phases 4–5 | | | | |
| A2 or A3 agents in production (requires level 3 in D4 and D6) | | | | |
| Investment in systems with direct exposure without independent assessment | | | | |

### 6.2 Concentration and supplier dependency **(Enterprise)**

Quarterly analysis (14 §9). N3 suppliers must have an exit plan.

| Type | What is measured | Warning signal set in C2 | Current situation | Measure |
|---|---|---|---|---|
| Supplier | | | | |
| Base model | | | | |
| Data | | | | |
| People | | | | |
| Typical risk (RT-XXX-NN) | | | | |
| Sphere or area | | | | |

### 6.3 Ambition balance

| Lane | C2 band | Current proportion of cost | Deviation (points) | Quarters outside the band | Action (14 §5.1) |
|---|---|---|---|---|---|
| Optimise | | | | | |
| Augment | | | | | |
| Transform | | | | | |

The ambition mix by phase is also reviewed (03 §3.5): a portfolio that is balanced in phase 1 but with all its Transform bets halted before G5 is not balanced.

---

## 7. Review calendar

| Moment | What is reviewed (14 §2.2 and §7) | Dates | Owner |
|---|---|---|---|
| Annual (C3) | Construction or renewal of the portfolio. | | AI Committee |
| Quarterly | Balance, concentration, programmes, retirements, budget; report to the board in C4. | | AI Committee |
| Monthly | Funnel, stalled initiatives, expired conditions, holds and new entries. | | AI Committee |
| Ongoing | Registrations, T01 alerts and preparation of information. | — | AI Office |

---

## 8. Programme traffic light

Rules and initial thresholds in 14 §12: the programme's colour is the worst of its axes; no data is grey and the programme cannot be green; every programme in red presents a plan at the next monthly review.

| Programme | Schedule | Cost | Value | Risk | Governance | Adoption | Programme colour | Previous quarter's colour | Plan or decision |
|---|---|---|---|---|---|---|---|---|---|
| | | | | | | | | | |
| *(illustrative example)* Customer service | Green | Amber | Grey (no data) | Green | Green | Amber | Amber | Green | Measure value before the next monthly review |

---

## 9. Regularisation plan

Systems and initiatives pre-dating the framework (14 §11; 90 §5). First those that meet any Enterprise criterion. Reference time limit: six months from C2 approval for those with Enterprise criteria; 12 months for the rest, unless other time limits are approved in C2.

| Code (IA- · SIA-) | Name | Actual status (Idea · Pilot · Under construction · In production · Corporate use · Unauthorised use) | Enterprise criteria | Order | Treatment | Minimum evidence | Time limit | Owner | Review date | Outcome |
|---|---|---|---|---|---|---|---|---|---|---|
| | | | | | | | | | | |
| *(illustrative example)* SIA-2026-004 | Enquiries assistant | In production | Direct exposure | 1 | Review equivalent to G7 | P31, P03, P04, P11, P12, P28, P24, P25, P19 | 6 months from C2 | Head of customer service | 15-03-2027 | Pending |

Rules (14 §11.2): the scope is not extended during regularisation; an initiative in production that has not been regularised when the time limit expires is a major nonconformity and, if it meets Enterprise criteria without a regulatory classification, a critical one. Unauthorised use is regularised as a nonconformity: authorise, replace or block.

---

## 10. Quality criteria

| # | Check | Status |
|---|---|---|
| 1 | The portfolio is prioritised with a documented method that uses additional net value per euro and ambition balance, approved by the committee (question D2.07 in document 11). | Met · Not met · Not applicable · Pending |
| 2 | Each lane has its envelope and initiatives compete only within it; there are no transfers out of the Transform envelope without board approval. | |
| 3 | The scores can be reproduced with the formula; "no data" entries are recorded as such. | |
| 4 | Changes to the order have a recorded written justification. | |
| 5 | There is a capacity plan for scarce profiles and a limit on simultaneous initiatives in phases 3 to 5. | |
| 6 | Portfolio and concentration limits have a set value and a current situation. | |
| 7 | The regularisation plan has time limits, owners and an order by risk (90 §4.5, criterion 8). | |
| 8 | The committee reviews the funnel monthly and the balance quarterly, with recorded decisions (question D2.09). | |

---

## 11. Approval and verification

| Function | Role in SEVEN-G | Name and position | Date | Signature or reference |
|---|---|---|---|---|
| Prepares | AI Office | | | |
| Provides amounts and consumption | Management control | | | |
| Provides limits and concentration | AI Risk Owner (second line) | | | |
| Verifies the method **(Enterprise)** | AI Auditor | | | |
| Approves the portfolio | AI Committee | | | Reference to the minutes |
| Approves Transform initiatives and transfers out of their envelope | Board | | | DEC-AAAA-NNN |

Segregation of duties: a committee member who sponsors an initiative abstains from its prioritisation and does not count towards the quorum for that item (30 §3.3).

---

## 12. Version control

**Completed document**

| Version | Date | Author | Changes |
|---|---|---|---|
| | | | |

**Template**

| Version | Date | Changes |
|---|---|---|
| 0.1 | 19-09-2026 | First version. Covers the C3 outputs in document 14: envelopes, prioritisation with spreadsheet formulas, capacity, limits and concentration, balance, calendar, programme traffic light and regularisation plan (14 §11; 90 §5). |
