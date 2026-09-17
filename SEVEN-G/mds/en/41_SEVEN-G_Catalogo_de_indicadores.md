# Indicator catalogue

**Indicators with code, formula, source and owner to measure AI from the initiative to the board**

| | |
|---|---|
| Document | Document 41 · Indicator catalogue |
| Version | 0.1 (working draft) |
| Date | 16-09-2026 |
| Author | Fernando García · SEACHAD |
| Status | Draft for review. Living catalogue: thresholds are set by each company and recalibrated in C5. |

<!-- cifras: 156 | coded indicators ; 13 | families ; 4 | levels of use ; 26 | indicators in the Lite minimum set -->

---

> **Legal notice and disclaimer.** SEVEN-G is a reference methodological framework provided "as is" and for information purposes only. It does not constitute legal, regulatory, financial or professional advice, nor does it guarantee compliance with any law or standard. References to general regulation (such as the EU AI Act, the GDPR, DORA or NIS2), to technical standards and to regulation specific to each sector or jurisdiction may be incomplete, may not apply to a particular case or may become out of date as a result of regulatory changes, interpretations or supervisory positions after their consultation date. **Each organisation that uses SEVEN-G is solely responsible for identifying the regulation that applies to it, verifying that it is current and certifying its own regulatory compliance**, with the appropriate qualified advice. The author and SEACHAD accept no liability for any use made of this content or for any decisions taken on the basis of it. The data, figures, companies and cases in the examples are fictitious or illustrative.

## 1. Purpose and scope

This document establishes the SEVEN-G indicator catalogue. Each indicator has a persistent code, a definition, a formula, a unit, a data source, a frequency, an owner, the level at which it is used, its application in the cycle and, where appropriate, an indicative threshold.

The catalogue:

- Applies the measurement rules in document 40 and uses its official formulas (F1–F10).
- Includes the funnel metrics in document 03 §3.5 and the eight transformation index signals in document 00 §5.3.
- Feeds the initiative register (T01), value tracking (T12), the cost calculator (T13), the transformation index (T14), the maturity diagnosis (T15) and the board dashboard (T17).
- Marks a **recommended minimum set for Lite intensity**.

No company needs all the indicators. They are selected in C2 according to the AI thesis, the portfolio and the intensity, and the selection is recorded.

---

## 2. Rules of use

1. **Persistent code.** The code `IND-<FAMILIA>-NN` is not reused. A retired indicator is marked as retired and keeps its code.
2. **Every formula is explicit.** If an indicator cannot be calculated with its formula, it is shown as "no data" (rule 8 in document 40). It is not replaced by an approximation without saying so.
3. **Thresholds are set by the company.** "To be set" means that the company approves it in C2 (document 13). The only thresholds shown as a value are those derived from rules of the framework itself (for example, zero systems in production without a *gate*) or the indicative time limits in 03 §3.6. None is a market benchmark.
4. **Value indicators inherit the status.** Every indicator calculated on amounts shows its validated proportion or is calculated in two versions: total and validated only.
5. **Segmentation.** All portfolio indicators can be segmented by the tags of the controlled taxonomy (03 §3.3): sphere, ambition, intensity, technology, exposure, regulatory classification, area and supplier.
6. **Medians rather than means** for times, with the 80th percentile.
7. **Reading in pairs.** Speed or automation indicators are read together with the quality and risk indicators that balance them (for example, containment with ungrounded responses and complaints).
8. **New indicators.** They are added using the record in section 5 and approved by the AI Office with management control clearance.

---

## 3. Legend

| Column | Values |
|---|---|
| **Freq.** (frequency) | **M** monthly · **Q** quarterly · **H** half-yearly · **A** annual · **G** at each *gate* or event |
| **Resp.** (owner) | **SP** sponsor · **BO** business owner of the benefit · **PO** AI Product Owner · **TO** technical owner · **OO** operations owner · **RO** risk owner · **AUD** AI Auditor · **AIO** AI Office · **MC** management control · **AIC** AI Committee · **ISEC** information security · **DO** data owner · **PPL** people function · **BS** board secretariat |
| **Level** | **I** initiative · **P** portfolio · **Co** company · **B** board |
| **Application** | Phases **F0–F7**, *gates* **G0–G7**, stages **C1–C5**, spheres **E01–E09** and ambition **Opt** (Optimise), **Aug** (Augment), **Tra** (Transform). "All" if it applies generally. |
| **Source** | Tool from document 03 (T01–T22) and, where one exists, board dashboard (T17) field in backticks. |
| **Lite** | **●** part of the recommended minimum set for Lite (section 19). |
| **To be defined by the company** | The source document of the indicator does not set that item; the company approves it in C2 when it selects the indicator (section 21). |

---

## 4. Families

| Code | Family | Indicators |
|---|---|---|
| **VAL** | Value | 18 |
| **COS** | Cost | 11 |
| **EMB** | Funnel | 13 |
| **AGI** | Agility | 6 |
| **RIE** | Risk and compliance | 17 |
| **OPE** | Operations and model quality | 23 |
| **ADO** | Adoption and people | 15 |
| **DAT** | Data and knowledge | 20 |
| **CLI** | Customer and product | 9 |
| **TRA** | Transformation | 9 |
| **MAD** | Maturity | 4 |
| **CON** | Board | 5 |
| **PRO** | Processes and decision-making | 6 |
| | **Total** | **156** |

---

## 5. Indicator record

Each indicator in the catalogue, and any in-house indicator added by the company, is documented with this record in T01.

| Field | Content |
|---|---|
| Code | `IND-<FAMILIA>-NN` |
| Name and definition | What it measures, in one understandable sentence. |
| Formula | Numerator, denominator, exclusions and the applicable official formula from document 40. |
| Unit | €, %, days, no., points, index. |
| Source | Tool, field and source system. |
| Frequency | Frequency of calculation and review. |
| Owner | Who calculates it and who is accountable for the result. |
| Level | Initiative, portfolio, company or board. |
| Application | Phase, stage, sphere and ambition. |
| Threshold | Value approved in C2 or "to be set"; traffic-light reading where appropriate. |
| Counterpart indicator | Indicator with which it must be read. |
| Status | Active, in testing or retired; date of registration. |

---

## 6. Value · VAL

| Code | Indicator and definition | Formula | Unit | Source | Freq. | Resp. | Level | Application | Indicative threshold | Lite |
|---|---|---|---|---|---|---|---|---|---|---|
| IND-VAL-01 | **Annual net value.** Value contributed by the use case or the portfolio after deducting its recurring cost. | Realised efficiencies + return − recurring cost (40 F2) | €/year | T01 · T12 · `economia` (net) | Q | SP · AIO | I · P · B | F5–F7 · all | ≥ 0 per use case in steady state | ● |
| IND-VAL-02 | **Realised efficiencies.** Lower actual cost or budgeted avoided cost. | Σ incremental units × unit value (40 F1), excluding unrealised capacity | €/year | T12 · `economia.eficiencias[]` | Q | BO | I · P | F5–F7 · Opt, Aug | To be set | |
| IND-VAL-03 | **Return.** Additional attributable revenue or margin. | Σ incremental units × unit margin or revenue (40 F1) | €/year | T12 · `economia.retorno[]` | Q | BO | I · P | F5–F7 · E01, E02 · Aug, Tra | To be set | |
| IND-VAL-04 | **Value by status.** Gross realised value broken down by status. | Σ validated amounts; Σ declared; Σ estimated | € | T12 · `valor_por_estado` | Q | MC | I · P · B | F6–F7 · C4 | — | |
| IND-VAL-05 | **Validated proportion.** Share of gross realised value validated by management control or audit. | Validated ÷ (validated + declared + estimated) (40 F6) | % | T12 · `valor_por_estado` | Q | MC | P · B | C4, C5 | Always visible; target to be set | ● |
| IND-VAL-06 | **Validated net value.** Net value with validated value only and full cost. | Validated efficiencies + validated return − recurring cost (40 F2v) | €/year | T12 · T13 | Q | MC | P · B | C4 | To be set | |
| IND-VAL-07 | **Released capacity.** Net hours released and their valuation. | Volume × (reference time − time with AI); × fully loaded hourly cost (40 F4) | h/year · €/year | T12 · `eficiencias[capacidad_liberada]` | Q | PO | I · P | F5–F7 · E03, E04 · Opt, Aug | — | |
| IND-VAL-08 | **Realisation rate.** Share of released capacity converted into lower cost or avoided cost. | Realised hours ÷ net released hours (40 F5) | % | T12 · T20 | Q | BO | I · P | F6–F7 · Opt | To be set; at G7 Opt realised savings are required | ● |
| IND-VAL-09 | **Reassignment rate.** Capacity explicitly reassigned to new activities. | Reassigned hours ÷ net released hours (40 F5) | % | T20 | Q | BO | I · P | F6–F7 · Aug | To be set | |
| IND-VAL-10 | **Additional net value per euro.** Annual net value contributed by each euro of additional investment. | (Potential net value − current net value) ÷ additional investment (40 F3) | € per € | T01 · `economia.inversion.adicional_potencial` | G · Q | AIO | I · P | F2, F3, F7 · C3 | Ranks the portfolio; no threshold | ● |
| IND-VAL-11 | **Net present value.** Single economic feasibility criterion. | −I + Σ net_t ÷ (1 + r)^t, t = 1…H (40 F7) | € | T11 | G | MC | I | G3, G7 · Opt, Aug | ≥ 0 with H and r from C2 | |
| IND-VAL-12 | **ROI.** Return on initial investment, for information. | (Σ net_t − I) ÷ I (40 F8) | % | T11 | G | MC | I | G3, G7 | No threshold | |
| IND-VAL-13 | **Payback period.** Years to recover the initial investment, for information. | First year with cumulative net value ≥ I, interpolated (40 F9) | years | T11 | G | MC | I | G3, G7 | No threshold | |
| IND-VAL-14 | **Value realisation.** Realised value against the value expected in the plan. | Realised value for the period ÷ expected value for the period (40 F10) | % | T12 · P28 | Q | BO | I · P | F6–F7 · R6 | Indicative: ≥ 90% green; 70–90% amber; < 70% red (to be set) | ● |
| IND-VAL-15 | **Use cases with negative net value.** Use cases in production whose cost exceeds their value. | No. of use cases with F2 < 0, with a named list | no. | T01 | Q | AIO | P · B | C4 · R6 | 0 without an approved plan | ● |
| IND-VAL-16 | **Use cases with no value data.** Use cases in production without reported efficiencies, return or cost. | No. of use cases with any F2 block null | no. | T01 | Q | AIO | P · B | C4 | 0 | |
| IND-VAL-17 | **Declared pending validation.** Declared value that has exceeded the validation period. | Declared older than the period (40 §4.1) ÷ total declared | % · € | T12 | Q | MC | P | C4 | 0% | |
| IND-VAL-18 | **Overlaps with declared allocation.** Use cases with shared results that have an approved allocation key. | Use cases with overlap and an approved key ÷ use cases with overlap | % | T12 · `comparte_valor_con` · `clave_reparto` | Q | AIO | P | C4 | 100% | |

---

## 7. Cost · COS

| Code | Indicator and definition | Formula | Unit | Source | Freq. | Resp. | Level | Application | Indicative threshold | Lite |
|---|---|---|---|---|---|---|---|---|---|---|
| IND-COS-01 | **Annual recurring cost.** Full annual cost of the use case, direct plus allocated shared cost. | Σ recurring parts of the nine categories (42 §4) | €/year | T13 · `economia.inversion.recurrente_anual` | M · Q | MC | I · P | F5–F7 | Approved budget | ● |
| IND-COS-02 | **Initial investment.** Build plus initial adoption. | Build cost + initial adoption cost (40 §8.2) | € | T13 · `economia.inversion.construccion` | G | MC | I · P | G3–G5 · Tra per stage | Limit approved at G3 | |
| IND-COS-03 | **Total cost of ownership.** Cost of the use case over the whole horizon. | I + Σ recurring cost_t (t = 1…H) + retirement cost (42 §5) | € | T13 | G · A | MC | I | G3, G7 | — | |
| IND-COS-04 | **Budget variance.** Difference between actual cost and budget. | (Actual cost − budget) ÷ budget | % | T13 · accounting | M | MC | I · P | F3–F7 | To be set | |
| IND-COS-05 | **Cost per unit of outcome.** Cost of producing one unit of useful outcome. | Recurring cost for the period ÷ units of useful outcome (42 §9) | € per unit | T13 · source system | M | PO | I | F5–F7 | ≤ baseline unit cost (Opt) | ● |
| IND-COS-06 | **Consumption against budget.** Cumulative model and compute consumption against budget. | Cumulative consumption ÷ budget for the period | % | T13 · supplier billing | M (daily for agents) | OO | I · P | F5–F7 · generative AI, agents | Alerts at 50, 80 and 100% (42 §8) | ● |
| IND-COS-07 | **Tagged cost.** Cloud and AI cost with a valid initiative tag. | Cost with a valid tag ÷ total cloud and AI cost | % | Cloud billing · T13 | M | AIO | Co | C4 | To be set | |
| IND-COS-08 | **Unattributed cost.** AI cost not allocated to use cases or to corporate use. | Unattributed cost ÷ total AI cost | % | T13 | Q | MC | Co · B | C4 | To be set | |
| IND-COS-09 | **Idle licence cost.** Licences paid for but unused in the period. | Assigned unused licences × unit cost | € | T21 · `adopcion` (licences) | M | AIO | Co | C4 | To be set | |
| IND-COS-10 | **Investment avoided through stops.** Approved but uncommitted budget of stopped or retired initiatives. | Σ approved budget − Σ committed, in stopped initiatives (42 §10) | € | T01 · T13 | Q | AIO | P · B | C4, C5 | For information; does not add to value | |
| IND-COS-11 | **Company AI cost.** Total AI cost, including corporate use. | Σ recurring cost + Σ investment for the year across all systems | €/year | T13 | Q | MC | Co · B | C1, C4 | C2 framework budget | ● |

---

## 8. Funnel · EMB

| Code | Indicator and definition | Formula | Unit | Source | Freq. | Resp. | Level | Application | Indicative threshold | Lite |
|---|---|---|---|---|---|---|---|---|---|---|
| IND-EMB-01 | **Time in phase.** Days in each phase excluding time on hold. | Exit date − entry date − days on hold; median and P80 | days | T01 (events) | M | AIO | P | F0–F5, F7 | Time limits in 03 §3.6 | |
| IND-EMB-02 | **Stalled initiatives.** Initiatives that exceed the reference time limit for their phase. | No. with time in phase > reference time limit | no. | T01 | M | AIO | P | All | 0 without committee review | ● |
| IND-EMB-03 | **Conversion per gate.** Proportion of favourable decisions at each *gate*. | (Proceed + Proceed with conditions) ÷ *gate* decisions | % | T03 | Q | AIO | P | G0–G7 | For information | |
| IND-EMB-04 | **Iterations per gate.** Average iterations before the decision. | Σ iterations ÷ no. of *gate* decisions | no. | T03 | Q | AIO | P | G0–G7 | ≤ 2 (01 §7.4) | |
| IND-EMB-05 | **Time on hold.** Days halted for an external cause, by reason. | Σ days in On hold status, by reason | days | T01 | M | AIO | P | All | For information | |
| IND-EMB-06 | **Stop and retirement reasons.** Distribution of coded reasons. | Stops and retirements by reason ÷ total stops and retirements | % | T01 | H | AIC | P | C5 | For information | |
| IND-EMB-07 | **Gate compliance.** Criteria met out of those applicable. | Criteria Met ÷ (applicable criteria) | % | T03 | G | AUD | I · P | G0–G7 | 100% of mandatory criteria for Proceed | |
| IND-EMB-08 | **Expired conditions.** Open conditions past their deadline. | No. of open conditions past their deadline | no. | T03 | M | AIC | P · B | G0–G7 | 0 | ● |
| IND-EMB-09 | **Value by phase.** Expected annual net value of the initiatives in each phase. | Σ expected annual net value by phase | € | T01 | Q | AIO | P · B | C3, C4 | For information | |
| IND-EMB-10 | **Weighted value.** Expected value adjusted by the historical probability of reaching production. | Σ expected value × historical probability from the current phase (IND-EMB-12) | € | T01 | Q | AIO | B | C4 | Only with sufficient history | |
| IND-EMB-11 | **Ambition mix by phase.** Distribution of ambition in each phase. | Initiatives at each level in the phase ÷ initiatives in the phase | % | T01 | Q | AIO | P · B | C3, C4 | For information (signal 7) | |
| IND-EMB-12 | **Historical probability of reaching production.** Historical rate of progression to G5 from each phase. | Initiatives that reached G5 from phase f ÷ initiatives that passed through f (closed cohorts) | % | T01 | H | AIO | P | C3, C5 | For information | |
| IND-EMB-13 | **Ability to stop.** Initiatives stopped or retired with a coded reason compared with those that receive a *gate* decision. | Initiatives stopped or retired with a coded reason in 12 months ÷ initiatives with a *gate* decision in 12 months | % | T01 · T03 | To be defined by the company | To be defined by the company | P · B | C4, C5 · E09 | To be defined by the company | |

---

## 9. Agility · AGI

Definitions of the segments are in document 40 §9. All are segmented by residual risk level, ambition and intensity.

| Code | Indicator and definition | Formula | Unit | Source | Freq. | Resp. | Level | Application | Indicative threshold | Lite |
|---|---|---|---|---|---|---|---|---|---|---|
| IND-AGI-01 | **Idea → approval.** Time from registration to the favourable G3 decision. | Date of favourable G3 decision − registration date − days on hold; median and P80 | days | T01 · `agilidad.tia_dias_por_tier` | Q | AIO | P · B | F0–F3 | Lite 70 · Enterprise 125 (indicative) | ● |
| IND-AGI-02 | **Approval → production.** Time from G3 to G5. | Date of favourable G5 − date of favourable G3 − days on hold; median and P80 | days | T01 · `agilidad.ttp_dias_por_tier` | Q | AIO | P · B | F4–F5 | Lite 80 · Enterprise 135 (indicative) | ● |
| IND-AGI-03 | **Idea → production.** Total time to production. | Date of favourable G5 − registration date − days on hold; median and P80 | days | T01 | Q | AIO | P · B | F0–F5 | Lite 150 · Enterprise 260 (indicative) | |
| IND-AGI-04 | **Decision time.** Days between the request and the decision on a *gate*. | Decision date − request date; median and P80 | working days | T03 | M | AIC | P · B | G0–G7 | Lite 5 · Enterprise 10 | |
| IND-AGI-05 | **Decisions on time.** *Gate* decisions taken within the approved time limit. | Decisions on time ÷ decisions | % | T03 · `agilidad.sla_dias_por_tier` | Q | AIC | B | G0–G7 | To be set | |
| IND-AGI-06 | **Awaiting risk analysis.** Registered initiatives without a risk assessment started within the time limit. | No. of initiatives with days since registration > time limit and no assessment started | no. | T01 · T06 · `agilidad.backlog_sin_analisis` | M | RO | P · B | F0–F3 | 0 outside the time limit | |

---

## 10. Risk and compliance · RIE

| Code | Indicator and definition | Formula | Unit | Source | Freq. | Resp. | Level | Application | Indicative threshold | Lite |
|---|---|---|---|---|---|---|---|---|---|---|
| IND-RIE-01 | **Inventory coverage.** Inventoried systems with regulatory classification, intensity and owner. | Systems with the three fields ÷ inventoried systems | % | T02 | Q | AIO | Co · B | F0 · C1, C4 | 100% | ● |
| IND-RIE-02 | **Systems in production without a gate.** Systems operating without an approved G5 or regularisation. | No. of systems in production without G5 or a review equivalent to G7 (01 §14) | no. | T02 · T03 | M | AUD | Co · B | F6 · C4 | 0 (critical nonconformity) | ● |
| IND-RIE-03 | **High and critical residual risks.** Open risks with a High or Critical residual level. | No. of risks with residual P × I ≥ 10, by level (specification §5.1) | no. | T06 | M | RO | I · P · B | F3–F7 | Critical: 0 without board approval | |
| IND-RIE-04 | **Pending impact assessments.** Required assessments not completed. | Required assessments not completed ÷ required | % | T07 | M | RO | P · B | F3–F4 · E08 | 0 before G5 | |
| IND-RIE-05 | **Open nonconformities.** Nonconformities by type. | No. open by type: minor, major, critical | no. | T08 | M | AUD | P · B | All | For information | |
| IND-RIE-06 | **Overdue nonconformities.** Containment or action plan overdue. | No. of nonconformities with the containment or plan time limit exceeded (01 §12) | no. | T08 | M | AUD | P · B | All | 0 | |
| IND-RIE-07 | **Incidents by severity.** Incidents in the period by system and severity. | No. of S1, S2, S3 and S4 incidents | no. | T08 · `seguimiento.incidentes` | M | OO | I · P · B | F6 | To be set; S1 is always reported | ● |
| IND-RIE-08 | **Detection and containment.** Speed of response to incidents. | Median hours from onset → detection and detection → containment | hours | T08 · `horas_detectar` · `horas_contener` | Q | OO | P · B | F6 | To be set | |
| IND-RIE-09 | **Lapsed continuity reviews.** Systems in production with an overdue R6. | Systems with an overdue R6 ÷ systems in production | % | T03 | M | AIO | P · B | F6 · R6 | 0 | ● |
| IND-RIE-10 | **Unauthorised use.** AI tools or uses without approval detected and regularised. | No. detected in the period; regularised ÷ detected | no. · % | T21 · `adopcion.shadow_ai_detectada` | Q | ISEC | Co · B | C4 · E09 | To be set | ● |
| IND-RIE-11 | **Critical suppliers assessed.** N3 suppliers with a current assessment and exit strategy. | N3 suppliers with a current assessment and exit strategy ÷ N3 suppliers | % | T09 · `proveedor_dora` | H | RO | Co · B | F3 · C4 | 100% | |
| IND-RIE-12 | **Timely analysis of regulatory changes.** Relevant regulatory changes with an impact analysis within the set time limit. | Relevant regulatory changes with an impact analysis within the set time limit ÷ relevant regulatory changes identified | % | To be defined by the company | To be defined by the company | To be defined by the company | Co · B | C4 · E08 | To be defined by the company | |
| IND-RIE-13 | **Early adaptation.** Obligations with a future application date and an approved adaptation plan. | Obligations with a future application date and an approved adaptation plan ÷ obligations with an application date in the next 24 months | % | To be defined by the company | To be defined by the company | To be defined by the company | Co · B | C2, C4 · E08 | To be defined by the company | |
| IND-RIE-14 | **Ethical review applied.** Initiatives that require ethical review and have it recorded before G3. | Initiatives that require ethical review and have it recorded before G3 ÷ initiatives that require it | % | To be defined by the company | To be defined by the company | To be defined by the company | P · B | F3 · G3 · E08 | To be defined by the company | |
| IND-RIE-15 | **Effective veto power.** Initiatives modified or stopped by decision of the ethics body. | No. of initiatives modified or stopped by decision of the ethics body in the last 12 months, reported together with the number of initiatives reviewed | no. | To be defined by the company | To be defined by the company | To be defined by the company | Co · B | C4, C5 · E08 | To be defined by the company | |
| IND-RIE-16 | **Public transparency.** Systems with direct exposure to people described in the company's public information. | Systems with direct exposure to people described in the company's public information ÷ systems with direct exposure | % | To be defined by the company | To be defined by the company | To be defined by the company | Co · B | C4 · E08 | To be defined by the company | |
| IND-RIE-17 | **Concentration in the main model supplier.** Weight of the main supplier in spending on models. | Spending on the main model supplier ÷ total spending on models | % | To be defined by the company | To be defined by the company | To be defined by the company | Co · B | C3, C4 · E09 | To be defined by the company | |

---

## 11. Operations and model quality · OPE

### 11.1 Common

| Code | Indicator and definition | Formula | Unit | Source | Freq. | Resp. | Level | Application | Indicative threshold | Lite |
|---|---|---|---|---|---|---|---|---|---|---|
| IND-OPE-01 | **Performance within threshold.** Systems whose main metric meets the threshold approved at G5. | Systems with main metric within threshold ÷ systems in production | % | P25 · monitoring | M | OO | I · P | F6 | 100% | ● |
| IND-OPE-02 | **Availability.** Uptime against committed service time. | Available time ÷ committed service time | % | Monitoring | M | OO | I | F6 | Agreed service level | |
| IND-OPE-16 | **Monitoring coverage.** Systems in production with a current monitoring plan and tested alerts. | Systems in production with a current P25 and tested alerts ÷ systems in production | % | P25 | Q | To be defined by the company | P | F6 | 100% | |
| IND-OPE-17 | **Substantial changes without a gate.** Substantial changes applied without returning to the corresponding *gate*. | Substantial changes applied without returning to the *gate* ÷ substantial changes | % | Change log (document 52 §6) | Q | To be defined by the company | I · P | F6 | 0% | |
| IND-OPE-18 | **Failed change rate.** Changes reverted or giving rise to an incident. | Changes reverted or giving rise to an incident ÷ changes applied | % | Change log (document 52 §6) · T08 | Q | To be defined by the company | I · P | F6 | Downward trend | |
| IND-OPE-21 | **Tested rollback.** Systems with a rollback plan test on time. | Systems with a rollback test on time ÷ systems in production | % | P19 | H | To be defined by the company | I · P | F5–F6 | 100% | |
| IND-OPE-22 | **Alert noise.** Alerts closed without action. | Alerts closed without action ÷ alerts generated | % | Monitoring · P25 | M | To be defined by the company | I · P | F6 | Downward trend | |
| IND-OPE-23 | **Supplier versions at risk.** Systems whose provider model version has an announced deprecation and no migration plan. | Systems whose provider model version has an announced deprecation with no migration plan ÷ systems with a provider model | % | To be defined by the company | M | To be defined by the company | P | F6 | 0% | |

### 11.2 Predictive machine learning

| Code | Indicator and definition | Formula | Unit | Source | Freq. | Resp. | Level | Application | Indicative threshold | Lite |
|---|---|---|---|---|---|---|---|---|---|---|
| IND-OPE-03 | **Main model metric.** Discrimination or error of the model in production. | Metric approved at G5 (for example, AUC or mean absolute error) over the production window | depending on metric | Monitoring · `operacion.auc` | M | TO | I | F5–F6 · predictive ML | G5 threshold | |
| IND-OPE-04 | **Data drift.** Change in the distribution of variables relative to the reference. | PSI = Σ (% current − % reference) × ln(% current ÷ % reference), by bins | index | Monitoring · `operacion.psi` | M | TO | I | F6 · predictive ML | To be set per model | |
| IND-OPE-05 | **Straight-through processing.** Cases resolved without manual intervention. | Cases resolved without intervention ÷ eligible cases | % | Source system · `operacion.stp_pct` | M | PO | I | F6 · E04 · Opt | To be set | |
| IND-OPE-06 | **Difference in outcomes between groups.** Bias indicator for decisions about people. | Maximum difference in favourable outcome rate between the groups defined in the impact assessment | percentage points | Bias testing · P22 | H | RO | I | F5–F6 · decisions about people | To be set (document 33) | |
| IND-OPE-19 | **Untreated drift.** Models with drift at critical level with no action recorded on time. | Models with drift at critical level with no action recorded within the P25 time limit ÷ monitored models | % | Monitoring · P25 | M | To be defined by the company | I · P | F6 · predictive ML | 0% | |

### 11.3 Generative AI

| Code | Indicator and definition | Formula | Unit | Source | Freq. | Resp. | Level | Application | Indicative threshold | Lite |
|---|---|---|---|---|---|---|---|---|---|---|
| IND-OPE-07 | **Accuracy in evaluation.** Correct and grounded responses in the evaluation set. | Correct and grounded responses ÷ responses evaluated | % | Evaluations · `operacion.evals_fecha` (date) | M and at each change | TO | I | F5–F6 · generative AI | G5 threshold | |
| IND-OPE-08 | **Ungrounded responses.** Responses with statements not supported by the sources. | Ungrounded responses ÷ responses reviewed in the human review sample | % | Sample review · `operacion.qa_humano_pct` | M | PO | I | F6 · generative AI | To be set | |
| IND-OPE-09 | **Containment.** Conversations resolved without handover to a person. | Conversations without handover ÷ conversations | % | Logs · `operacion.contencion_pct` | M | PO | I | F6 · E01 · generative AI | To be set; read with OPE-08 and CLI-03 | |
| IND-OPE-10 | **Prompt injection success in testing.** Test attacks that manage to alter behaviour. | Successful attacks ÷ attacks executed | % | T10 · `ia_ofensiva` | H and at each change | ISEC | I · B | F5–F6 · generative AI, agents | 0 for actions with effect | |

### 11.4 Agents

| Code | Indicator and definition | Formula | Unit | Source | Freq. | Resp. | Level | Application | Indicative threshold | Lite |
|---|---|---|---|---|---|---|---|---|---|---|
| IND-OPE-11 | **Least privilege.** Agent identities with permissions reviewed and limited to what is necessary. | Identities with a current least-privilege review ÷ agent identities | % | T10 · `agente.minimo_privilegio` | Q | ISEC | I · Co · B | F4–F6 · A2, A3 | 100% | |
| IND-OPE-12 | **Action traceability.** Actions logged with identity, intent and outcome. | Complete logged actions ÷ actions executed | % | Logs · `agente.logging_acciones_pct` | M | OO | I | F6 · agents | 100% | |
| IND-OPE-13 | **Human validation of sensitive actions.** Sensitive actions validated by a person before execution. | Sensitive actions with prior validation ÷ sensitive actions | % | Logs · `agente.validacion_humana_escrituras` | M | OO | I | F6 · A1, A2 | 100% where the design requires it | |
| IND-OPE-14 | **Kill switch test.** Days since the last successful test. | Calculation date − date of the last successful test | days | T10 · `agente.kill_switch` | Q | OO | I · B | F5–F6 · agents | According to the test plan (P19, P24) | |
| IND-OPE-15 | **Task completion.** Agent tasks completed correctly without intervention. | Tasks completed correctly ÷ tasks started | % | Logs | M | PO | I | F6 · agents | G5 threshold | |
| IND-OPE-20 | **Blocked agent actions.** Actions blocked by the agent's limits and review of intent anomalies. | Actions blocked by limits ÷ actions attempted; and intent anomalies reviewed ÷ detected | % | Logs | M | To be defined by the company | I | F6 · agents | 100% of anomalies reviewed | |

---

## 12. Adoption and people · ADO

| Code | Indicator and definition | Formula | Unit | Source | Freq. | Resp. | Level | Application | Indicative threshold | Lite |
|---|---|---|---|---|---|---|---|---|---|---|
| IND-ADO-01 | **Active licences.** AI licences used in the period. | Licences used ÷ licences assigned | % | T21 · `adopcion` (active and assigned licences) | M | AIO | Co · B | C4 · corporate use | To be set | |
| IND-ADO-02 | **Active users.** Users with weekly use against target users. | Weekly active users ÷ target users | % | T20 · `adopcion` (weekly active users) | M | PO | I | F5–F7 · Aug | G2 adoption target | |
| IND-ADO-03 | **Usage rate in the process.** Transactions in which AI is used. | Transactions with AI ÷ eligible transactions | % | Source system | M | PO | I | F5–F7 | G2 hypothesis | ● |
| IND-ADO-04 | **Acceptance of proposals.** System proposals accepted without changes. | Proposals accepted without changes ÷ proposals | % | Logs | M | PO | I | F6 · A1 | For information; extreme values are analysed with OPE-08 | |
| IND-ADO-05 | **AI literacy.** People in the required group who have completed training. | People trained ÷ people in the required group | % | T20 · people function | Q | PPL | Co · B | C2, C4 · E03 | 100% of the required group | ● |
| IND-ADO-06 | **Redesigned roles.** Jobs whose functions have been formally redesigned due to AI. | Redesigned jobs ÷ jobs affected by initiatives in production | % | T20 · people function | H | PPL | I · Co | F6–F7 · E03 · Aug, Tra | For information (signal 5) | |
| IND-ADO-07 | **Critical AI capabilities covered.** Critical AI positions filled. | Critical positions filled ÷ critical positions needed | % | People function · `adopcion` (vacancies) | H | PPL | Co | C1, C4 | To be set | |
| IND-ADO-08 | **Employee-promoted initiatives.** Weight of employee proposals in the register and their progression through G1. | Registered initiatives originating from employee proposals ÷ registered initiatives; and employee-originated initiatives that pass G1 ÷ employee-originated initiatives registered | % | T01 (origin field) | H | To be defined by the company | P · Co | F1 · G1 · E03 | Trend | |
| IND-ADO-09 | **Effect assessment coverage.** Initiatives with a recorded assessment of the effect on work. | Initiatives in phase 3 or later with a recorded effect assessment ÷ initiatives in phase 3 or later | % | T01 · T20 | Q | To be defined by the company | P | F3–F7 · E03 | 100% | |
| IND-ADO-10 | **Qualified overseers.** Systems whose designated overseers have recorded oversight training. | A1–A3 systems in production whose designated overseers have recorded PER-PD training ÷ A1–A3 systems in production | % | T02 · training system | Q | To be defined by the company | I · Co | F5–F6 · A1–A3 | 100% | |
| IND-ADO-11 | **Released capacity without a decision.** Released hours with no destination decided beyond the C2 time limit. | Hours in PER-D5 older than the C2 time limit ÷ measured released hours | % | T20 | Q | To be defined by the company | I · P | F6–F7 · E03 · Opt, Aug | Decreasing trend | |
| IND-ADO-12 | **Prior information to workers' representatives.** Systems with an effect on working conditions or employment reported before use. | Systems with an effect on working conditions or employment reported before use ÷ systems with that effect | % | Information record (document 50 §7.2) | Q | To be defined by the company | Co · B | F4–F5 · G5 · E03 | 100% | |
| IND-ADO-13 | **Human review in decisions about people.** AI-assisted decisions about people with documented human review. | AI-assisted decisions about people with documented human review ÷ AI-assisted decisions about people | % | System logs | M | To be defined by the company | I | F6 · decisions about people | 100% in A1 | |
| IND-ADO-14 | **Challenges to assisted decisions.** Review requests or complaints about AI-assisted decisions. | Review requests or complaints ÷ decisions communicated; and proportion upheld | % | Complaints channel | Q | To be defined by the company | I · Co | F6 · decisions about people | Trend and causes | |
| IND-ADO-15 | **Perception of affected groups.** Favourable responses on support, workload and autonomy in the pulse survey. | Favourable responses to the questions on support, workload and autonomy ÷ valid responses | % | Pulse survey | G (phase 5, at 3 months and at Enterprise R6) | To be defined by the company | I · Co | F5–F6 · R6 · E03 | Trend; action if it worsens | |

---

## 13. Data and knowledge · DAT

| Code | Indicator and definition | Formula | Unit | Source | Freq. | Resp. | Level | Application | Indicative threshold | Lite |
|---|---|---|---|---|---|---|---|---|---|---|
| IND-DAT-01 | **Data with an owner.** Datasets used by AI systems with an assigned owner. | Datasets with an owner ÷ datasets used by AI systems | % | Data catalogue · P16 | Q | DO | Co | F3–F4 · E05 | 100% | |
| IND-DAT-02 | **Quality of critical data.** Critical datasets that meet their quality thresholds. | Critical datasets within completeness, accuracy and timeliness thresholds ÷ critical datasets | % | Quality monitoring | M | DO | I · Co | F3–F6 · E05 | To be set per dataset | |
| IND-DAT-03 | **Verified legal basis.** Datasets with personal data whose legal basis and purpose have been verified for AI use. | Verified datasets ÷ datasets with personal data used by AI | % | Record of processing activities · P11 | Q | RO | Co · B | F3 · E05, E08 | 100% | |
| IND-DAT-04 | **Documented lineage.** Systems in production with data and model lineage. | Systems with documented lineage ÷ systems in production | % | P16 | Q | TO | Co | F4–F6 | 100% in Enterprise | |
| IND-DAT-05 | **Currency of the knowledge base.** Documents reviewed on time in the bases used by assistants. | Documents reviewed within their time limit ÷ documents in the base | % | Document management system | M | DO | I | F6 · E06 · generative AI | To be set | |
| IND-DAT-06 | **Critical knowledge available.** Critical processes with documented and accessible knowledge. | Critical processes with documented knowledge ÷ critical processes identified | % | Knowledge map (document 51) | H | DO | Co | C1, C5 · E06 | To be set | |
| IND-DAT-07 | **Catalogue coverage.** Datasets used by AI with a complete record. | Datasets used by AI with a complete record ÷ datasets used by AI | % | Data catalogue | Q | To be defined by the company | Co | F3–F6 · E05 | 100% in Enterprise | |
| IND-DAT-08 | **Quality by dimension.** Records that pass the rules of each quality dimension. | Records that pass the dimension's rules ÷ records assessed, by dataset and dimension | % | Quality monitoring | According to load frequency | To be defined by the company | I | F3–F6 · E05 | Threshold set per use case in phase 3 | |
| IND-DAT-09 | **Retention compliance.** Datasets with a defined and applied retention period. | Datasets with a defined and applied retention period ÷ datasets used by AI | % | Data catalogue | H | To be defined by the company | Co | F4–F7 · E05 | 100% | |
| IND-DAT-10 | **Incidents caused by data.** AI incidents whose root cause lies in data. | AI incidents whose root cause lies in data ÷ closed AI incidents | % | T08 | Q | To be defined by the company | P · Co | F6 · E05 | Decreasing trend | |
| IND-DAT-11 | **Time to data access.** Days until the data requested by an initiative are available. | Median days between a data access request for an initiative and its availability in the authorised environment | days | T01 (events) · access requests | Q | To be defined by the company | P · Co | F2–F4 · E05 | Decreasing trend | |
| IND-DAT-12 | **Validated synthetic data.** Synthetic datasets in use with utility and privacy validation. | Synthetic datasets in use with recorded utility and privacy validation ÷ synthetic datasets in use | % | Data catalogue | H | To be defined by the company | I · Co | F4–F6 · E05 | 100% | |
| IND-DAT-13 | **Knowledge sources with an owner.** Sources connected to AI with a content owner. | Knowledge sources connected to AI with a content owner ÷ connected sources | % | Source inventory | Q | To be defined by the company | Co | F4–F6 · E06 · generative AI | 100% | |
| IND-DAT-14 | **Use of expired content.** Responses citing documents that are no longer valid. | Sampled responses citing documents that are no longer valid ÷ sampled responses with a citation | % | Continuous evaluation | M | To be defined by the company | I | F6 · E06 · generative AI | Close to 0% | |
| IND-DAT-15 | **Improper exposure of knowledge.** Access to content without permission detected in testing or in production. | Findings of access to content without permission detected in testing or in production, per period | no. | Permission testing · T08 | Q | To be defined by the company | I · Co | F5–F6 · E06 · generative AI | 0 | |
| IND-DAT-16 | **Critical knowledge dependence.** Critical domains that depend on few people and have no usable documentation. | Critical domains mastered by two people or fewer and without usable documentation ÷ critical domains | % | Dependence map (document 51 §10.6) | A | To be defined by the company | Co | C1, C5 · E06 | Decreasing trend | |
| IND-DAT-17 | **Capture coverage.** Dependent critical domains with captured and validated content. | Dependent critical domains with captured and validated content ÷ dependent critical domains | % | Capture plan | H | To be defined by the company | Co | C4, C5 · E06 | As per plan | |
| IND-DAT-18 | **Queries without a relevant source.** Queries for which no relevant document is retrieved. | Queries with no relevant document retrieved ÷ evaluated queries | % | Continuous evaluation | M | To be defined by the company | I | F6 · E06 · generative AI | Decreasing trend | |
| IND-DAT-19 | **Useful resolution.** Queries resolved according to the user and confirmed by sampling. | Queries marked as resolved by the user and confirmed by sampling ÷ total queries | % | Assistant telemetry | To be defined by the company | To be defined by the company | I | F6 · E06 · generative AI | To be defined by the company | |
| IND-DAT-20 | **Time to autonomy.** Days until a new joiner reaches autonomy in their role. | Median days until a new joiner reaches autonomy in their role, compared with the baseline | days | People function | To be defined by the company | To be defined by the company | I · Co | F6–F7 · E06 | To be defined by the company | |

---

## 14. Customer and product · CLI

| Code | Indicator and definition | Formula | Unit | Source | Freq. | Resp. | Level | Application | Indicative threshold | Lite |
|---|---|---|---|---|---|---|---|---|---|---|
| IND-CLI-01 | **Incremental satisfaction.** Difference in satisfaction in interactions with AI. | Satisfaction with AI − satisfaction of the control group or baseline | points | Surveys | Q | BO | I | F5–F7 · E01 | ≥ 0 (no deterioration) | |
| IND-CLI-02 | **Resolution time.** Change in the time taken to resolve the customer's request. | Median with AI − reference median | hours | Customer service system | M | PO | I | F6 · E01, E04 | To be set | |
| IND-CLI-03 | **AI-related complaints.** Complaints attributed to responses or decisions of the system. | Attributed complaints ÷ interactions × 10,000 | per 10,000 | Complaints management | M | BO | I · B | F6 · direct exposure | To be set | |
| IND-CLI-04 | **Incremental conversion.** Difference in conversion against the control group. | Conversion rate with AI − control group rate | percentage points | A/B test · sales system | M | BO | I | F5–F7 · E01, E02 · Aug, Tra | G2 hypothesis | |
| IND-CLI-05 | **Incremental retention.** Difference in retention against the control group. | Retention rate with AI − control group rate | percentage points | Customer system | Q | BO | I | F5–F7 · E01 | G2 hypothesis | |
| IND-CLI-06 | **Use of AI features.** Active users of the product who use AI features. | Active users who use AI features in the period ÷ active users of the product | % | Product telemetry | To be defined by the company | To be defined by the company | I | F6–F7 · E02 | To be defined by the company | |
| IND-CLI-07 | **Reduction in time to launch.** Reduction in the median days from idea to launch compared with the baseline. | (Median days from idea to launch in the baseline − current median) ÷ baseline median | % | Product management | To be defined by the company | To be defined by the company | I · Co | F6–F7 · E02 · Aug, Tra | To be defined by the company | |
| IND-CLI-08 | **Margin of the AI-enabled offering.** Margin of the AI-enabled offering after its direct costs, including AI cost. | (Revenue from the AI-enabled offering − direct costs, including allocated AI cost) ÷ revenue from the AI-enabled offering | % | Management control | To be defined by the company | To be defined by the company | I · Co | F6–F7 · E02 · Aug, Tra | To be defined by the company | |
| IND-CLI-09 | **Defects contained before launch.** Defects detected in testing out of all defects. | Defects detected in testing ÷ (defects detected in testing + defects detected in production) | % | Quality management | To be defined by the company | To be defined by the company | I | F5–F7 · E02 | To be defined by the company | |

---

## 15. Transformation · TRA

The eight signals in document 00 §5.3. The 0–3 score for each signal, its initial thresholds "to be calibrated" and the determination of the profile are defined in document 12.

| Code | Indicator and definition | Formula | Unit | Source | Freq. | Resp. | Level | Application | Indicative threshold | Lite |
|---|---|---|---|---|---|---|---|---|---|---|
| IND-TRA-01 | **Signal 1 · Investment mix.** Weight of Augment and Transform in AI spending. | (Recurring cost + investment) of Aug and Tra ÷ total (recurring cost + investment) | % | T01 · T13 | A | AIO | Co · B | C1, C5 | Document 12 | ● |
| IND-TRA-02 | **Signal 2 · Value mix.** Weight of return in validated value. | Validated return ÷ (validated efficiencies + validated return) | % | T12 | A | MC | Co · B | C1, C5 | Document 12 | ● |
| IND-TRA-03 | **Signal 3 · Materialisation.** Released capacity converted into savings or reassigned. | (Realised hours + reassigned hours) ÷ net released hours of the portfolio | % | T12 · T20 | A | AIO | Co · B | C1, C5 | Document 12 | |
| IND-TRA-04 | **Signal 4 · Depth of change.** Initiatives that redesign processes end to end. | Initiatives in production with end-to-end redesign ÷ initiatives in production | % | T05 (question 2) | A | AIO | Co · B | C1, C5 | Document 12 | |
| IND-TRA-05 | **Signal 5 · Operating model.** Initiatives with a verified change in roles, structure or decisions. | Aug and Tra initiatives in production with verified change and defined oversight ÷ Aug and Tra initiatives in production | % | T05 (question 3) · T20 | A | AIO | Co · B | C1, C5 | Document 12 | |
| IND-TRA-06 | **Signal 6 · AI-enabled revenue.** Revenue that would not exist without AI. | Revenue from products, services or channels that would not exist without AI ÷ total revenue | % | Accounting · T01 | A | MC | Co · B | C1, C5 · E02 | Document 12 | |
| IND-TRA-07 | **Signal 7 · Progression to production.** Arrival in production of the bets with the highest ambition. | Aug and Tra initiatives that reach G5 ÷ those that passed G2 (closed cohort); and median idea → production for Aug and Tra ÷ median for Opt | % · ratio | T01 | A | AIO | Co · B | C1, C5 | Document 12 | |
| IND-TRA-08 | **Signal 8 · Board decision.** Transformation decisions adopted and followed up. | No. of Tra decisions adopted by the board with follow-up in the register | no. | T18 | A | BS | B | C2, C5 | Document 12 | |
| IND-TRA-09 | **Transformation profile.** Position of the company between efficiency and transformation. | 0–3 score for each signal and resulting profile (document 12) | profile | T14 | A | AIO | Co · B | C1, C5 | — | |

---

## 16. Maturity · MAD

| Code | Indicator and definition | Formula | Unit | Source | Freq. | Resp. | Level | Application | Indicative threshold | Lite |
|---|---|---|---|---|---|---|---|---|---|---|
| IND-MAD-01 | **Overall maturity level.** Company level with the cap based on governance and risk. | Minimum of ⌊weighted average of D1–D7⌋ and (minimum of D1 and D6) + 1 | level 0–5 | T15 | A | AIO | Co · B | C1, C5 | C2 target | ● |
| IND-MAD-02 | **Level by dimension.** Highest level with all its criteria and those of lower levels met with evidence. | Maximum n such that the criteria of levels 1…n are met | level 0–5 | T15 | A | AIO | Co | C1, C5 | C2 target | |
| IND-MAD-03 | **Maturity gap.** Distance to the target by dimension. | C2 target level − current level | levels | T15 | A | AIO | B | C2, C5 | 0 at the end of the plan | |
| IND-MAD-04 | **Criteria with verified evidence.** Robustness of the self-assessment. | Criteria with verified evidence ÷ criteria declared as met | % | T15 | A | AUD | Co | C1, C5 | 100% | |

---

## 17. Board · CON

| Code | Indicator and definition | Formula | Unit | Source | Freq. | Resp. | Level | Application | Indicative threshold | Lite |
|---|---|---|---|---|---|---|---|---|---|---|
| IND-CON-01 | **Open recommendations.** Board recommendations not closed, by status. | No. of open recommendations by status | no. | T18 | Q | BS | B | C4 | For information | |
| IND-CON-02 | **Overdue recommendations.** Recommendations past their committed date. | Open past their date ÷ open | % | T18 | Q | BS | B | C4 | 0% | ● |
| IND-CON-03 | **Closures with independent assessment.** Closures supported by evidence and independent assessment. | Closed with evidence and independent assessment ÷ closed | % | T18 | Q | AUD | B | C4 | 100% | |
| IND-CON-04 | **Coverage of board information.** Indicators in the board pack with data. | Indicators with data ÷ indicators in the pack | % | T17 | Q | AIO | B | C4 | To be set; "no data" always visible | |
| IND-CON-05 | **Use cases presented in detail.** Number of use cases discussed in detail per session. | No. of use cases presented in detail in the session | no. | Agenda · T18 | Q | AIO | B | C4 | ≤ 3 | |

---

## 18. Processes and decision-making · PRO

Outcome indicators for spheres 04 (Operations) and 07 (Decision) taken from document 10. They are read together with IND-OPE-05, IND-TRA-04 and IND-ADO-04.

| Code | Indicator and definition | Formula | Unit | Source | Freq. | Resp. | Level | Application | Indicative threshold | Lite |
|---|---|---|---|---|---|---|---|---|---|---|
| IND-PRO-01 | **Cycle time reduction.** Reduction in the process cycle time compared with the baseline. | (Baseline cycle time − current cycle time) ÷ baseline cycle time | % | Process systems | To be defined by the company | To be defined by the company | I · P | F5–F7 · E04 · Opt, Aug | To be defined by the company | |
| IND-PRO-02 | **Change in unit cost.** Change in the cost per unit processed compared with the baseline. | (Total process cost ÷ units processed) − baseline unit cost | € per unit | Management control | To be defined by the company | To be defined by the company | I · P | F5–F7 · E04 · Opt | To be defined by the company | |
| IND-PRO-03 | **Error or rework rate.** Units with errors or rework, compared with the baseline. | Units with errors or rework ÷ units processed, compared with the baseline | % | Quality management | To be defined by the company | To be defined by the company | I | F5–F7 · E04 | To be defined by the company | |
| IND-PRO-04 | **Decisions with assigned autonomy.** Decision types involving AI that have an assigned and documented autonomy level. | Decision types in which AI is involved with an assigned and documented A0–A3 level ÷ decision types in which AI is involved | % | T02 · P17 | To be defined by the company | To be defined by the company | P · Co | F4–F6 · E07 | To be defined by the company | |
| IND-PRO-05 | **Improvement in decision quality.** Difference in the outcome of decisions with AI compared with the control group, in money. | Average outcome of decisions with AI − average outcome of the control group, converted into money (for example, loss avoided) | € | T12 | To be defined by the company | To be defined by the company | I | F5–F7 · E07 · Aug, Tra | To be defined by the company | |
| IND-PRO-06 | **Decision latency.** Time from when the information is available until the decision is executed. | Median time from when the information is available until the decision is executed, compared with the baseline | hours or days | Process logs | To be defined by the company | To be defined by the company | I | F5–F7 · E07 | To be defined by the company | |

---

## 19. Recommended minimum set for Lite

A company that applies SEVEN-G with Lite intensity should start with these 26 indicators. They cover the ten measurement rules, control of the funnel, the risks that give rise to critical nonconformities and the first two transformation signals.

| Family | Indicators | Question they answer |
|---|---|---|
| Value | IND-VAL-01, 05, 08, 10, 14, 15 | Does it deliver net value, how much is validated, is it realised, where should we invest and which use cases are not sustainable? |
| Cost | IND-COS-01, 05, 06, 11 | How much does each use case and AI as a whole cost, and is consumption under control? |
| Funnel | IND-EMB-02, 08 | Are there stuck initiatives or unmet conditions? |
| Agility | IND-AGI-01, 02 | How long do we take to approve and to move into production? |
| Risk and compliance | IND-RIE-01, 02, 07, 09, 10 | Do we know what AI we have, is all of it approved, what incidents are there, is it reviewed and is there unauthorised use? |
| Operations | IND-OPE-01 | Do the systems perform within what was approved? |
| Adoption and people | IND-ADO-03, 05 | Is it used and is the workforce trained? |
| Transformation | IND-TRA-01, 02 | Do we invest and obtain value beyond efficiency? |
| Maturity | IND-MAD-01 | Where are we? |
| Board | IND-CON-02 | Are the board's recommendations being implemented? |

When an initiative moves to Enterprise, at least risk indicators IND-RIE-03, 04 and 11 are added and, depending on the technology, those in sections 11.2 to 11.4.

---

## 20. Selection for the board dashboard

The board dashboard (T17) does not show the entire catalogue. The selection is approved in C2 and should include:

1. **Value:** IND-VAL-01, 04, 05, 06, 07 and 15, with the validated proportion alongside each total (document 40 §11).
2. **Cost:** IND-COS-11 and, per use case, IND-COS-01.
3. **Agility:** IND-AGI-01, 02 and 04, segmented by risk and ambition.
4. **Risk:** IND-RIE-02, 03, 07, 09 and 10.
5. **Agents:** IND-OPE-11 to 14 when there are A2 or A3 agents.
6. **Adoption:** IND-ADO-01 and 05.
7. **Transformation:** IND-TRA-01 to 09 once a year.
8. **Board:** IND-CON-01 to 03.

---

## 21. Mapping of provisional codes

Documents 10, 50, 51 and 52 use provisional indicator codes. This table maps them to the `IND-` code in the catalogue. "Complementary" indicates that the catalogue indicator measures the opposite (for example, overdue versus on time); "related" indicates that it covers it in part; "added" indicates that the indicator, which had no equivalent, has been added to the catalogue with the name, formula, source, frequency and threshold of its source document, and with "To be defined by the company" for the items that document does not set. When two provisional codes measure the same thing (IE03.06 and PER-14, IE05.05 and DAT-10, IE06.02 and CNC-06), they share a code. The provisional knowledge codes in document 51 use the `CNC-` prefix so that they are not confused with the `IND-CON` family (board).

### 21.1 Indicators by sphere (document 10)

| Provisional code | Indicator | Catalogue equivalent |
|---|---|---|
| IE01.01 | AI coverage of the customer relationship | IND-ADO-03 (related) |
| IE01.02 | Effective resolution without handover | IND-OPE-09 (related) |
| IE01.03 | Satisfaction differential | IND-CLI-01 |
| IE01.04 | Incremental retention in monetary terms | IND-CLI-05 (as a rate; valuation with IND-VAL-03) |
| IE01.05 | Incremental conversion in monetary terms | IND-CLI-04 (as a rate; valuation with IND-VAL-03) |
| IE01.06 | Complaints attributable to AI | IND-CLI-03 |
| IE02.01 | AI-enabled revenue | IND-TRA-06 |
| IE02.02 | Use of AI features | IND-CLI-06 (added) |
| IE02.03 | Reduction in time to launch | IND-CLI-07 (added) |
| IE02.04 | AI cost per unit of service | IND-COS-05 |
| IE02.05 | Margin of the AI-enabled offering | IND-CLI-08 (added) |
| IE02.06 | Defects contained before launch | IND-CLI-09 (added) |
| IE03.01 | Effective adoption | IND-ADO-02 |
| IE03.02 | Realised released capacity | IND-VAL-08 |
| IE03.03 | Reassigned released capacity | IND-VAL-09 |
| IE03.04 | AI literacy by role | IND-ADO-05 |
| IE03.05 | Redesigned roles | IND-ADO-06 |
| IE03.06 | Employee-promoted initiatives | IND-ADO-08 (added) |
| IE04.01 | Cycle time reduction | IND-PRO-01 (added) |
| IE04.02 | Change in unit cost | IND-PRO-02 (added) |
| IE04.03 | Straight-through processing | IND-OPE-05 |
| IE04.04 | Error or rework rate | IND-PRO-03 (added) |
| IE04.05 | Processes redesigned end to end | IND-TRA-04 |
| IE04.06 | Validated realised savings | IND-VAL-02 in its validated-only version (rule 4) |
| IE05.01 | Catalogue coverage | IND-DAT-01 (related) |
| IE05.02 | Quality of critical data | IND-DAT-02 |
| IE05.03 | Documented legal basis | IND-DAT-03 |
| IE05.04 | Documented lineage | IND-DAT-04 |
| IE05.05 | Time to data access | IND-DAT-11 (added) |
| IE05.06 | Initiatives blocked by data | IND-EMB-05 and IND-EMB-06 (related, data reason) |
| IE06.01 | Coverage of critical knowledge | IND-DAT-06 |
| IE06.02 | Knowledge concentration | IND-DAT-16 (added) |
| IE06.03 | Verified accuracy | IND-OPE-07 |
| IE06.04 | Useful resolution | IND-DAT-19 (added) |
| IE06.05 | Currency of sources | IND-DAT-05 |
| IE06.06 | Time to autonomy | IND-DAT-20 (added) |
| IE07.01 | Decisions with assigned autonomy | IND-PRO-04 (added) |
| IE07.02 | Decision traceability | IND-OPE-12 (related, agents only) |
| IE07.03 | Human override rate | IND-ADO-04 (complementary) |
| IE07.04 | Tested kill switch | IND-OPE-14 (related: age of the test) |
| IE07.05 | Improvement in decision quality | IND-PRO-05 (added) |
| IE07.06 | Decision latency | IND-PRO-06 (added) |
| IE08.01 | Classified systems | IND-RIE-01 (related) |
| IE08.02 | Required assessments completed on time | IND-RIE-04 (complementary) |
| IE08.03 | Overdue regulatory nonconformities | IND-RIE-06 (related, regulatory origin) |
| IE08.04 | Timely analysis of regulatory changes | IND-RIE-12 (added) |
| IE08.05 | Early adaptation | IND-RIE-13 (added) |
| IE08.06 | Unauthorised use regularised | IND-RIE-10 |
| IE08.07 | Ethical review applied | IND-RIE-14 (added) |
| IE08.08 | Effective veto power | IND-RIE-15 (added) |
| IE08.09 | Public transparency | IND-RIE-16 (added) |
| IE09.01 | Register coverage | IND-RIE-01 (related) |
| IE09.02 | Current continuity | IND-RIE-09 (complementary) |
| IE09.03 | Board recommendations closed on time | IND-CON-02 (related) |
| IE09.04 | *Gate* decision time | IND-AGI-04 |
| IE09.05 | Time to production | IND-AGI-03 |
| IE09.06 | Ability to stop | IND-EMB-13 (added) |
| IE09.07 | Concentration in the main model supplier | IND-RIE-17 (added) |
| IE09.08 | Exit strategy | IND-RIE-11 |
| IE09.09 | Allocated AI cost | IND-COS-08 (complementary) |

### 21.2 People, data, knowledge and operations (documents 50, 51 and 52)

| Provisional code | Document | Indicator | Catalogue equivalent |
|---|---|---|---|
| PER-01 | 50 | Coverage of the effect assessment | IND-ADO-09 (added) |
| PER-02 | 50 | Literacy by profile | IND-ADO-05 |
| PER-03 | 50 | Qualified supervisors | IND-ADO-10 (added) |
| PER-04 | 50 | Realised released capacity | IND-VAL-08 |
| PER-05 | 50 | Reassigned released capacity | IND-VAL-09 |
| PER-06 | 50 | Released capacity without a decision | IND-ADO-11 (added) |
| PER-07 | 50 | Effective adoption | IND-ADO-02 |
| PER-08 | 50 | Prior information to workers' representatives | IND-ADO-12 (added) |
| PER-09 | 50 | Human review in decisions about people | IND-ADO-13 (added) |
| PER-10 | 50 | Human modification rate | IND-ADO-04 (complementary) |
| PER-11 | 50 | Adverse impact ratio | IND-OPE-06 (related: difference, not ratio) |
| PER-12 | 50 | Challenges to assisted decisions | IND-ADO-14 (added) |
| PER-13 | 50 | Redesigned roles | IND-ADO-06 |
| PER-14 | 50 | Employee proposals | IND-ADO-08 (added) |
| PER-15 | 50 | Perception of affected groups | IND-ADO-15 (added) |
| DAT-01 | 51 | Ownership coverage | IND-DAT-01 |
| DAT-02 | 51 | Catalogue coverage | IND-DAT-07 (added) |
| DAT-03 | 51 | Legal basis coverage | IND-DAT-03 |
| DAT-04 | 51 | Quality by dimension | IND-DAT-08 (added) |
| DAT-05 | 51 | Critical datasets within threshold | IND-DAT-02 |
| DAT-06 | 51 | Lineage coverage | IND-DAT-04 |
| DAT-07 | 51 | G3 decisions due to data | IND-EMB-06 (related, data reason) |
| DAT-08 | 51 | Retention compliance | IND-DAT-09 (added) |
| DAT-09 | 51 | Incidents caused by data | IND-DAT-10 (added) |
| DAT-10 | 51 | Time to data access | IND-DAT-11 (added) |
| DAT-11 | 51 | Validated synthetic data | IND-DAT-12 (added) |
| CNC-01 | 51 | Sources with an owner | IND-DAT-13 (added) |
| CNC-02 | 51 | Currency of content | IND-DAT-05 |
| CNC-03 | 51 | Use of outdated content | IND-DAT-14 (added) |
| CNC-04 | 51 | Faithfulness to sources | IND-OPE-08 (complementary) |
| CNC-05 | 51 | Improper exposure | IND-DAT-15 (added) |
| CNC-06 | 51 | Dependence on critical knowledge | IND-DAT-16 (added) |
| CNC-07 | 51 | Capture coverage | IND-DAT-17 (added) |
| CNC-08 | 51 | Queries without a relevant source | IND-DAT-18 (added) |
| OPE-01 | 52 | Availability | IND-OPE-02 |
| OPE-02 | 52 | Monitoring coverage | IND-OPE-16 (added) |
| OPE-03 | 52 | Mean time to detect | IND-RIE-08 (related: median, not mean) |
| OPE-04 | 52 | Mean time to contain | IND-RIE-08 (related: median, not mean) |
| OPE-05 | 52 | Incidents by severity | IND-RIE-07 |
| OPE-06 | 52 | Substantial changes without a *gate* | IND-OPE-17 (added) |
| OPE-07 | 52 | Failed change rate | IND-OPE-18 (added) |
| OPE-08 | 52 | Untreated drift | IND-OPE-19 (added) |
| OPE-09 | 52 | Responses with unsupported statements | IND-OPE-08 |
| OPE-10 | 52 | Cost per transaction and variance | IND-COS-05 and IND-COS-06 |
| OPE-11 | 52 | Blocked agent actions | IND-OPE-20 (added) |
| OPE-12 | 52 | Tested kill switch | IND-OPE-14 (related: age of the test) |
| OPE-13 | 52 | Reviewed agent permissions | IND-OPE-11 |
| OPE-14 | 52 | R6 on time | IND-RIE-09 (complementary) |
| OPE-15 | 52 | Tested rollback | IND-OPE-21 (added) |
| OPE-16 | 52 | Alert noise | IND-OPE-22 (added) |
| OPE-17 | 52 | Supplier versions at risk | IND-OPE-23 (added) |

---

## 22. Associated tools and templates

| Code | Name | Use in this document |
|---|---|---|
| **T01** | Initiative register | Main source: phases, events, tags, value. |
| **T02 · T03** | Inventory · *Gate* manager | Coverage, *gates*, conditions, continuity reviews. |
| **T06 · T07 · T08 · T09 · T10** | Risks · regulatory classifier · nonconformities and incidents · suppliers · agent security | RIE indicators and agent OPE indicators. |
| **T11 · T12 · T13** | Value hypothesis · value tracking · costs per use case | VAL and COS indicators. |
| **T14 · T15** | Transformation index · maturity diagnosis | TRA and MAD indicators. |
| **T17 · T18** | Board dashboard · recommendations register | Presentation and CON indicators. |
| **T20 · T21** | Adoption and capacity plan · corporate use monitor | ADO indicators, realisation and reassignment. |
| **P09 · P22 · P25 · P28** | Baseline · pilot results · monitoring · value tracking | G5 thresholds and periodic measurement. |

---

## 23. Related documents

| Document | Relationship |
|---|---|
| **00 · What SEVEN-G is and how it helps companies** | Measurement rules and eight transformation signals. |
| **03 · Tools and initiative register** | Funnel metrics, reference time limits and sources. |
| **10, 50, 51 and 52 · Spheres, people, data and operations** | Provisional codes IE, PER, DAT, CNC and OPE (section 21). |
| **11 · Maturity model** | Criteria and level calculation. |
| **12 · Transformation index** | Signal scoring and profiles. |
| **13 · AI thesis and risk appetite** | Approval of thresholds and selection of indicators. |
| **33 · AI risk methodology** | Risk levels and bias thresholds. |
| **35 · AI and agent security** | Controls measured by the agent indicators. |
| **40 · Value measurement rules** | Official formulas F1–F10 and statuses. |
| **42 · AI costs** | Definition of recurring cost, investment and cost per unit. |
| **43 · Benefits realisation** | Use of the value indicators in tracking. |
| **60 · Board pack** | Selection of indicators for the board. |

---

## 24. Version control

| Version | Date | Changes |
|---|---|---|
| 0.1 | 16-09-2026 | First version. Catalogue of 156 indicators in 13 families with code, formula, unit, source, frequency, owner, level, application and indicative threshold; Lite minimum set of 26 indicators; indicative selection for the board dashboard. Consistency adjustments with 01 (segregation of duties in Lite, R6 outcomes, agent criterion) and with 34 and 37; mapping of provisional codes from documents 10, 50, 51 and 52 (section 21). The 47 provisional indicators that had no equivalent added to the catalogue (families EMB, RIE, OPE, ADO, DAT and CLI, and new family PRO · Processes and decision-making, section 18); provisional knowledge prefix in document 51 renamed from CON- to CNC-. |
