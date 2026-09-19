# Checklists by gate

**Binary controls to verify and audit each decision gate**

| | |
|---|---|
| Document | Document 22 · Checklists by *gate* |
| Version | 0.1 (working draft) |
| Date | 16-09-2026 |
| Author | Fernando García · SEACHAD |
| Status | Draft for review. The codes match the criteria in document 21. |

<!-- cifras: 8 | checklists by gate ; 128 | gate controls ; 14 | evidence controls ; 21 | agent controls -->

---

> **Legal notice and disclaimer.** SEVEN-G is a reference methodological framework provided "as is" and for information purposes only. It does not constitute legal, regulatory, financial or professional advice, nor does it guarantee compliance with any law or standard. References to general regulation (such as the EU AI Act, the GDPR, DORA or NIS2), to technical standards and to regulation specific to each sector or jurisdiction may be incomplete, may not apply to a particular case or may become out of date as a result of regulatory changes, interpretations or supervisory positions after their consultation date. **Each organisation that uses SEVEN-G is solely responsible for identifying the regulation that applies to it, verifying that it is current and certifying its own regulatory compliance**, with the appropriate qualified advice. The author and SEACHAD accept no liability for any use made of this content or for any decisions taken on the basis of it. The data, figures, companies and cases in the examples are fictitious or illustrative.

<!-- esencial: recomendado | Ready-to-use checklists for each gate. They are the practical way of applying document 21; the company may use another medium if it keeps the same criterion codes. The LV-AG checklist applies only to agents. -->

## 1. Purpose and scope

This document converts the criteria in document 21 into **verifiable binary controls**. It contains:

- One checklist per gate: **LV-G0, LV-G1, LV-G2, LV-G3, LV-G4, LV-G5, LV-R6 and LV-G7**.
- A cross-cutting evidence validation checklist: **LV-EV**.
- A checklist for agents: **LV-AG**, aligned with tool T10.

Each item carries the **criterion code** from document 21 (G3.07, R6.11…) or the evidence rule code (EV.05…). If a criterion changes, document 21 is amended first and the checklist afterwards. The checklists do not add requirements: in the event of any discrepancy, document 21 prevails, and document 21, in turn, cannot contradict document 01.

---

## 2. Instructions for use

### 2.1 Who uses the checklists

| User | When | Purpose |
|---|---|---|
| **Verifier** (01 §7.5: AI Office in Lite; AI Auditor in Enterprise) | After the *gate* request and before the decision. | Check criteria and evidence and issue the verification opinion. |
| **AI Auditor** | In the subsequent audit, on the sample (21 §10.3). | Re-perform the verification and compare it with what was recorded. |
| **Initiative team** | Before requesting the *gate*. | Self-assess. Its self-assessment does not replace verification. |

### 2.2 How to verify

1. **Define the scope.** Record intensity, ambition level, technology, autonomy level, suppliers and, at G7, the proposed outcome. Mark out-of-scope items as *Not applicable*, with their justification.
2. **Validate the evidence** with LV-EV before reviewing the gate checklist.
3. **Answer each item** solely on the basis of what the evidence shows. "Partially" means *no*. Each item requires both a result (**R**) and documentation (**D**) (21 §3.1).
4. **Record the status** in the *gate* manager (T03): *yes* answer with R and D → **Met**; *no* → **Not met**; missing evidence or verification → **Pending**; justified out of scope → **Not applicable**.
5. **Apply the blocking rule** (2.4) and calculate the degree of compliance (21 §5.1).
6. **Issue the opinion**: Conformant · Conformant with observations · Nonconformant (21 §10.2), and sign.

### 2.3 Key

| Column | Values |
|---|---|
| **☐** | Checkbox. Marked ☒ only if the answer is *yes* with result and documentation. |
| **Code** | Criterion from document 21 or EV rule. |
| **Question** | Worded to be answered yes or no. |
| **Where to look** | Template (P), tool (T) or record where the evidence is found. |
| **Type** | **Yes ◆** not conditionable and a critical control for security, legal compliance or human oversight · **Yes** not conditionable · **Cond.** conditionable · **Rec.** recommended. |
| **L · E** | Application in Lite and Enterprise: **Yes** · **Simpl.** (simplified template) · **Rec.** · **—** (not applicable). |
| **Tags** | **[GEN]** generative AI and agents · **[AG]** agents (A1–A3) · **[TER]** third-party AI. |

### 2.4 Blocking rule

- An unchecked **Yes** or **Yes ◆** item prevents **Proceed** and **Proceed with conditions**.
- An unchecked **Cond.** item allows at most **Proceed with conditions**, with a time limit, owner and means of verification.
- An unchecked **Rec.** item requires a recorded justification; without one, it is an observation.
- Rules EV.05 (prior existence) and EV.09 (segregation) admit no exception.

### 2.5 Use by the auditor

- Repeats the verification on the sample and compares their answers with the statuses recorded in T03.
- Applies, where appropriate, temporal traceability, re-performance and observation tests (21 §10.4).
- Classifies each discrepancy as an observation or a minor, major or critical nonconformity (21 §10.5) and records it in T08 with code NC-AAAA-NNN.
- In Lite, when G0–G2 or G4–G5 are decided in a single session, checks that each checklist has been completed separately.

### 2.6 Closing each checklist

At the end of each checklist, record: **applicable criteria · degree of compliance · blocking criteria · open conditionable criteria · opinion (☐ Conformant ☐ Conformant with observations ☐ Nonconformant) · verifier · date**.

---

## 3. LV-G0 · Authorisation

Verifies: AI Office (Lite) · AI Auditor (Enterprise). Decides: sponsor (Lite) · AI Committee (Enterprise).

| ☐ | Code | Question | Where to look | Type | L | E |
|---|---|---|---|---|---|---|
| ☐ | G0.01 | Does the charter define the problem, scope and budget for phases 1 to 3, and is it signed by the sponsor? | P01 | Yes | Simpl. | Yes |
| ☐ | G0.02 | Are the AI thesis, the sphere and the priority in the approved portfolio referenced? | P01 · C3 portfolio | Cond. | Yes | Yes |
| ☐ | G0.03 | Are the regulatory, ethical, data, budgetary and time constraints recorded? | P02 | Cond. | Simpl. | Yes |
| ☐ | G0.04 | Does the preliminary screening rule out prohibited practices? | P02 | Yes ◆ | Yes | Yes |
| ☐ | G0.05 | Are the roles required by the intensity assigned by name? | P03 | Yes | Yes | Yes |
| ☐ | G0.06 | Are the incompatibilities in 01 §8.2 respected, and is the auditor independent of the sponsor? | P03 · organisation chart | Yes | Yes | Yes |
| ☐ | G0.07 | Have the eight Enterprise criteria been answered and justified? | P04 · T04 | Yes | Yes | Yes |
| ☐ | G0.08 | Does it have an IA-AAAA-NNN code, and are its systems included in the inventory? | T01 · T02 · P05 | Yes | Yes | Yes |
| ☐ | G0.09 | Do the events confirm that there was no build expenditure and no access to production data before G0? | T01 (events) · access logs | Yes | Yes | Yes |
| ☐ | G0.10 | Has data protection been informed if personal data are expected? | P02 | Cond. | Rec. | Yes |

## 4. LV-G1 · Opportunity

Verifies: AI Office (Lite) · AI Auditor (Enterprise). Decides: sponsor (in Enterprise, informing the committee).

| ☐ | Code | Question | Where to look | Type | L | E |
|---|---|---|---|---|---|---|
| ☐ | G1.01 | Are the affected process or decision, the accountable area and the business problem described? | P06 | Yes | Yes | Yes |
| ☐ | G1.02 | Is the use case sheet understandable to a non-specialist? | P31 | Cond. | Simpl. | Yes |
| ☐ | G1.03 | Were non-AI alternatives analysed, and is what AI contributes justified? | P06 | Yes | Yes | Yes |
| ☐ | G1.04 | Are the discarded opportunities recorded with their reason? | P06 · screening notes | Cond. | Simpl. | Yes |
| ☐ | G1.05 | Does the potential value have an order of magnitude, assumptions and "estimated" status? | P06 | Cond. | Yes | Yes |
| ☐ | G1.06 | Were the sphere and ambition proposed using the five classifier questions? | P07 · T05 | Yes | Yes | Yes |
| ☐ | G1.07 | Are prohibited practices ruled out, and was the intensity reviewed against new Enterprise criteria? | P07 · P04 | Yes ◆ | Yes | Yes |
| ☐ | G1.08 | Was it confirmed that the data exist, have an owner and that their use is plausibly lawful? | P06 | Cond. | Yes | Yes |
| ☐ | G1.09 | [TER] Are the candidate supplier and its preliminary requirement level identified? | P06 | Cond. | Rec. | Yes |
| ☐ | G1.10 | Are the affected roles and teams identified? (Optimise: recommended) | P06 | Cond. | Yes | Yes |

## 5. LV-G2 · Hypothesis

Verifies: AI Office (Lite) · AI Auditor (Enterprise). Decides: sponsor (Lite) · AI Committee (Enterprise) · board in Transform.

| ☐ | Code | Question | Where to look | Type | L | E |
|---|---|---|---|---|---|---|
| ☐ | G2.01 | Does the hypothesis state which result would refute it? | P08 · T11 | Yes | Yes | Yes |
| ☐ | G2.02 | Does each metric have a definition, formula, source and owner? | P08 | Yes | Simpl. | Yes |
| ☐ | G2.03 | Is the baseline measured with real data, or is its estimate justified and approved? | P09 | Cond. | Yes | Yes |
| ☐ | G2.04 | Are the target and the success threshold quantified? | P08 | Yes | Yes | Yes |
| ☐ | G2.05 | Is the attribution method justified (in Enterprise, control group or reason)? | P08 | Cond. | Yes | Yes |
| ☐ | G2.06 | Does the expected value have a formula, is it incremental, and does it separate efficiencies, return and recurring cost? | P08 · T11 | Yes | Yes | Yes |
| ☐ | G2.07 | Is released capacity shown separately from savings, with the means of realising or reassigning it? | P08 | Cond. | Yes | Yes |
| ☐ | G2.08 | Do the stop criteria have a threshold and a date or milestone, dated before the investment? | P08 · T01 | Yes | Yes | Yes |
| ☐ | G2.09 | Is the ambition confirmed, and is any change since G1 explained? | P07 · T05 | Yes | Yes | Yes |
| ☐ | G2.10 | Is there an adoption target with users, usage and frequency? (Optimise: recommended) | P08 · P20 | Cond. | Yes | Yes |
| ☐ | G2.11 | Transform: are there learning milestones, an investment cap and stop criteria for each stage? | P08 | Yes | — | Yes |
| ☐ | G2.12 | Transform: is the express approval of the board or its board committee recorded? | P29 · minutes | Yes | — | Yes |
| ☐ | G2.13 | Have the investment up to G5 and the preliminary additional net value per additional euro invested been calculated? | P08 · T11 | Cond. | Simpl. | Yes |

## 6. LV-G3 · Feasibility

Verifies: AI Office (Lite) · AI Auditor (Enterprise). Decides: sponsor with risk clearance (Lite) · AI Committee (Enterprise). Main stop gate.

| ☐ | Code | Question | Where to look | Type | L | E |
|---|---|---|---|---|---|---|
| ☐ | G3.01 | Was technical feasibility demonstrated with the company's real data? | P10 · technical test results | Yes | Yes | Yes |
| ☐ | G3.02 | Has data quality been assessed, and do the data have an owner? | P10 | Cond. | Simpl. | Yes |
| ☐ | G3.03 | Does data protection confirm the legal basis and minimisation? | P11 | Yes ◆ | Yes | Yes |
| ☐ | G3.04 | Are build, recurring and adoption costs estimated by category? | P10 · T13 | Yes | Simpl. | Yes |
| ☐ | G3.05 | Is the expected net value consistent with the C2 appetite and horizon for the ambition level, and is there a draft benefits realisation plan with a business owner? | P10 · P08 · P62 · C2 thesis | Yes | Yes | Yes |
| ☐ | G3.06 | Are the stop criteria those approved at G2, or has their change been approved? | P08 (versions) · P29 | Yes | Yes | Yes |
| ☐ | G3.07 | Is the regulatory classification dated, signed off with legal judgement, and does it state the company's role? | P11 · T07 | Yes ◆ | Yes | Yes |
| ☐ | G3.08 | Is any prohibited practice ruled out? (If not: Stop) | P11 | Yes ◆ | Yes | Yes |
| ☐ | G3.09 | Have the impact assessments been determined, and have those required before processing been completed or started? | P11 | Yes ◆ | Yes | Yes |
| ☐ | G3.10 | Does each applicable obligation have a phase, role and evidence? | P11 | Cond. | Simpl. | Yes |
| ☐ | G3.11 | Do the risks have probability, impact and inherent and residual level using the scale in document 33? | P12 · T06 | Yes | Simpl. | Yes |
| ☐ | G3.12 | Does every Critical residual risk have board approval, and do High and Medium risks have the corresponding acceptance? | P12 · P29 | Yes ◆ | Yes | Yes |
| ☐ | G3.13 | Does each High or Critical residual risk have a control, owner and time limit? | P13 | Yes | Yes | Yes |
| ☐ | G3.14 | Does each Medium risk have a decided response and owner? | P13 | Cond. | Simpl. | Yes |
| ☐ | G3.15 | Was the intensity reviewed with the information from phase 3? | P04 · T04 | Yes | Yes | Yes |
| ☐ | G3.16 | Has the impact on people been assessed according to the ambition level? | P10 · P20 | Cond. | Simpl. | Yes |
| ☐ | G3.17 | [GEN] Have prompt injection, information leakage, erroneous content, excessive permissions and unauthorised actions been assessed? | P12 (RT-GEN, RT-SEG) | Yes ◆ | Yes | Yes |
| ☐ | G3.18 | [GEN] Is the autonomy level justified, and is the intensity consistent with it (A2 or A3 with effects on third parties, money, personal data or production systems → Enterprise)? | P04 · P12 | Yes ◆ | Yes | Yes |
| ☐ | G3.19 | [GEN] Are test sets, metrics and evaluation thresholds defined? | P10 | Cond. | Simpl. | Yes |
| ☐ | G3.20 | [TER] Is the supplier assessed at the N1–N3 level that applies to it, including dependency? | P14 · T09 | Yes | Simpl. | Yes |
| ☐ | G3.21 | [TER] Are the minimum contractual conditions included as a procurement requirement? | P14 | Yes ◆ | Yes | Yes |
| ☐ | G3.22 | [TER] Does the supplier provide, or undertake to provide, the necessary regulatory documentation? | P14 · P11 | Cond. | Rec. | Yes |

## 7. LV-G4 · Design

Verifies: AI Office (Lite) · AI Auditor (Enterprise). Decides: sponsor with risk clearance (Lite) · AI Committee (Enterprise).

| ☐ | Code | Question | Where to look | Type | L | E |
|---|---|---|---|---|---|---|
| ☐ | G4.01 | Does the architecture record include components, integrations, environments, third parties and decisions? | P15 | Cond. | Simpl. | Yes |
| ☐ | G4.02 | Is automatic logging of inputs, outputs, versions and decisions designed, with a defined retention period? | P15 | Yes ◆ | Simpl. | Yes |
| ☐ | G4.03 | Does the lineage cover data, model versions and third-party foundation models? | P16 | Cond. | Simpl. | Yes |
| ☐ | G4.04 | Is it established what the system decides, what a person validates, what is not delegated and who intervenes? | P17 | Yes ◆ | Yes | Yes |
| ☐ | G4.05 | Are the transparency notices and the human review of automated decisions designed? | P17 | Yes ◆ | Yes | Yes |
| ☐ | G4.06 | Does each Medium or higher risk have a designed and traceable control? | P12 · P18 | Yes | Yes | Yes |
| ☐ | G4.07 | Does the security design cover access, encryption, environments, secrets and AI-specific threats? | P18 | Yes ◆ | Simpl. | Yes |
| ☐ | G4.08 | Does monitoring have metrics, thresholds, alerts and an assigned operations owner? | P15 · P03 | Cond. | Simpl. | Yes |
| ☐ | G4.09 | Is there a shutdown mechanism with an owner and target time? | P19 | Yes ◆ | Yes | Yes |
| ☐ | G4.10 | Does the rollback plan have criteria, procedure, owner, fallback and a planned test? | P19 | Yes | Simpl. | Yes |
| ☐ | G4.11 | Does the adoption plan cover training, communication, support, measurement and what is specific to the ambition level, and is the benefits realisation plan complete and signed? | P20 · P62 · T20 | Cond. | Simpl. | Yes |
| ☐ | G4.12 | Do the test plan and the pilot design have acceptance criteria and the approved attribution method? | P22 | Cond. | Simpl. | Yes |
| ☐ | G4.13 | Are the required impact assessments closed and their measures incorporated? | P11 | Yes ◆ | Yes | Yes |
| ☐ | G4.14 | High risk: are the company's obligations according to its role planned, with an owner? | P11 · P15 | Yes ◆ | — | Yes |
| ☐ | G4.15 | [AG] Does the agent have its own identity with managed, rotated and revocable credentials? | P18 · T10 | Yes ◆ | Yes | Yes |
| ☐ | G4.16 | [AG] Are least privilege and limits on tools, operations, amounts, recipients and volumes defined? | P18 · T10 | Yes ◆ | Yes | Yes |
| ☐ | G4.17 | [AG] Is each action linked to its instruction and purpose, and are sensitive actions checked before execution? | P18 · T10 | Yes ◆ | Yes | Yes |
| ☐ | G4.18 | [AG] Is there a kill switch that stops the agent and revokes credentials, with an owner and a planned test? | P18 · P19 | Yes ◆ | Yes | Yes |
| ☐ | G4.19 | [AG] Do sensitive or irreversible actions require prior human validation according to the autonomy level? | P17 | Yes ◆ | Yes | Yes |
| ☐ | G4.20 | [GEN] Are there defences against prompt injection and information leakage? | P18 · T10 | Yes ◆ | Yes | Yes |
| ☐ | G4.21 | [GEN] Are the evaluation set and its thresholds approved before building? | P22 | Cond. | Simpl. | Yes |
| ☐ | G4.22 | [TER] Are the clauses from G3.21 in the contract or draft, and is the integration documented? | P14 · P15 | Cond. | Yes | Yes |

## 8. LV-G5 · Go-live

Verifies: AI Office (Lite) · AI Auditor (Enterprise). Decides: sponsor with risk clearance (Lite) · AI Committee after multi-level sign-off (Enterprise).

| ☐ | Code | Question | Where to look | Type | L | E |
|---|---|---|---|---|---|---|
| ☐ | G5.01 | Does the delivery report record what was built and the approved deviations from G4? | P21 | Cond. | Simpl. | Yes |
| ☐ | G5.02 | Do the functional and performance tests meet the acceptance criteria? | P22 | Yes | Yes | Yes |
| ☐ | G5.03 | If it affects people, are the bias tests within thresholds? | P22 | Yes ◆ | Yes | Yes |
| ☐ | G5.04 | Do the robustness and security tests leave no critical or high vulnerabilities open? | P22 | Yes ◆ | Simpl. | Yes |
| ☐ | G5.05 | [GEN] Do the evaluations reach the thresholds, and were the injection and leakage tests passed? | P22 · T10 | Yes ◆ | Yes | Yes |
| ☐ | G5.06 | [AG] Do the tests demonstrate that limits, intent-based access control and the kill switch work? | P22 · P19 · T10 | Yes ◆ | Yes | Yes |
| ☐ | G5.07 | [AG] Is the authorised autonomy level the one that was tested? | P18 · P23 | Yes ◆ | Yes | Yes |
| ☐ | G5.08 | Does the pilot, using the approved attribution method, reach the threshold for the ambition level or with accepted conditions? | P22 · T11 | Cond. | Yes | Yes |
| ☐ | G5.09 | Has no stop criterion been reached, or is there an express decision by the body that authorised it? | P22 · P29 | Yes | Yes | Yes |
| ☐ | G5.10 | Is there a plan, with an owner and date, to realise or reassign the released capacity? | P20 | Cond. | Yes | Yes |
| ☐ | G5.11 | Was rollback tested, and does the actual time meet the target? | P19 | Yes | Yes | Yes |
| ☐ | G5.12 | Does the risk register incorporate the test results and acceptances at the correct level? | P12 · T06 | Yes ◆ | Yes | Yes |
| ☐ | G5.13 | Are the critical controls active and checked in production? | P22 · P25 | Yes ◆ | Yes | Yes |
| ☐ | G5.14 | Are those who oversee the system designated, trained and given the authority and means to intervene? | P17 · P20 | Yes ◆ | Yes | Yes |
| ☐ | G5.15 | Have the regulatory obligations prior to putting into service been fulfilled according to the role? | P11 | Yes ◆ | Yes | Yes |
| ☐ | G5.16 | Are monitoring and alerts configured and tested? | P25 | Yes | Simpl. | Yes |
| ☐ | G5.17 | Does the incident plan define S1–S4, escalation and regulatory notifications with time limits? | P26 · T08 | Yes ◆ | Simpl. | Yes |
| ☐ | G5.18 | Has the operations manual been accepted by the operations owner? | P24 | Cond. | Simpl. | Yes |
| ☐ | G5.19 | Is there evidence of user training and AI literacy for those who use or oversee the system? | P20 | Cond. | Yes | Yes |
| ☐ | G5.20 | [TER] Is the contract signed with the required clauses, and is the supplier registered? | P14 · T09 | Yes ◆ | Yes | Yes |
| ☐ | G5.21 | Is value tracking configured, and do the pilot results have a status? | P28 · T12 | Cond. | Simpl. | Yes |
| ☐ | G5.22 | Are the previous conditions closed or, if not critical, within their time limit? | P29 · T03 | Yes | Yes | Yes |
| ☐ | G5.23 | Is the risk clearance (Lite) or the four sign-offs with no veto in force (Enterprise) recorded? | P23 · T03 | Yes ◆ | Yes | Yes |

**Multi-level sign-off (Enterprise).** Before checking G5.23, check for each signatory (technical, risk and compliance, information security, data protection): ☐ sign-off recorded with date and system version · ☐ direction (favourable, with reservations or veto) · ☐ no signatory took part in the build · ☐ previous vetoes have been lifted by whoever issued them (21 §9.2).

## 9. LV-R6 · Continuity review

Verifies: AI Office (Lite) · AI Auditor (Enterprise). Decides: sponsor (Lite) · AI Committee (Enterprise). Frequency: every six months (Lite) · quarterly (Enterprise). Outcomes (01 §7.3): Proceed with operation · Proceed with conditions · Bring G7 forward.

| ☐ | Code | Question | Where to look | Type | L | E |
|---|---|---|---|---|---|---|
| ☐ | R6.01 | Is the review carried out within its frequency? | T01 · previous P29 | Yes | Yes | Yes |
| ☐ | R6.02 | Is the realised value compared with the hypothesis, with status and validated proportion? | P28 · T12 | Yes | Simpl. | Yes |
| ☐ | R6.03 | Are the deviations between actual and estimated costs explained? | P28 · T13 | Cond. | Simpl. | Yes |
| ☐ | R6.04 | Is performance within thresholds, and are model changes recorded? | P25 · P27 | Cond. | Yes | Yes |
| ☐ | R6.05 | If it affects people, is the monitored bias within thresholds? | P25 | Yes ◆ | Yes | Yes |
| ☐ | R6.06 | Do the incidents have severity, containment and closure, and were the reportable ones notified on time? | P27 · T08 | Yes ◆ | Yes | Yes |
| ☐ | R6.07 | Were significant changes assessed and did they go through G4 and G5 where appropriate? | P27 · P29 | Yes | Yes | Yes |
| ☐ | R6.08 | Are the regulatory classification, the impact assessments and the intensity still valid? | P11 · P04 | Yes ◆ | Yes | Yes |
| ☐ | R6.09 | Is the risk register up to date, and have new risks been accepted at the correct level? | P12 · T06 | Cond. | Simpl. | Yes |
| ☐ | R6.10 | Is there evidence of human oversight exercised, logs retained and a shutdown mechanism available? | P25 · P17 · logs | Yes ◆ | Yes | Yes |
| ☐ | R6.11 | [AG] Were permissions, credentials, intent logs and anomalous actions reviewed, and was the kill switch tested? | P18 · P27 · T10 | Yes ◆ | Yes | Yes |
| ☐ | R6.12 | [TER] Were the supplier's changes, incidents and contractual compliance reviewed? | P14 · T09 | Cond. | Simpl. | Yes |
| ☐ | R6.13 | Is the required post-market monitoring being carried out? | P25 · P11 | Yes ◆ | — | Yes |
| ☐ | R6.14 | Is adoption measured against the target? (Optimise: recommended) | P20 · P28 | Cond. | Yes | Yes |
| ☐ | R6.15 | Are open conditions and nonconformities within their time limits? | P29 · T08 | Yes | Yes | Yes |
| ☐ | R6.16 | Is the assessment of deviations that require bringing G7 forward (21 §6.7) recorded? | P29 | Yes | Yes | Yes |

## 10. LV-G7 · Scale or retire

Verifies: AI Office (Lite) · AI Auditor (Enterprise). Decides: sponsor (Lite) · AI Committee (Enterprise) · board to scale in Transform. Mark items for the outcome not proposed as *Not applicable*. Keeping the system unchanged is verified as *Iterate* with a return to phase 6 (21 §5.3).

| ☐ | Code | Question | Where to look | Type | L | E |
|---|---|---|---|---|---|---|
| ☐ | G7.01 | Is the realised value consolidated with status and, in order to scale, validated according to the ambition level? | P28 · T12 | Yes | Yes | Yes |
| ☐ | G7.02 | Is there an explicit conclusion on the hypothesis against the threshold and the stop criteria? | P30 | Yes | Yes | Yes |
| ☐ | G7.03 | Was the actual ambition reviewed, and were the differences from the declared ambition recorded? | P07 · T05 | Yes | Yes | Yes |
| ☐ | G7.04 | Were accumulated risks, incidents and nonconformities for the period assessed? | P12 · P27 | Yes | Simpl. | Yes |
| ☐ | G7.05 | Are actual costs, actual annual net value and, if scaling, additional net value per additional euro invested recorded? | P28 · P30 | Cond. | Simpl. | Yes |
| ☐ | G7.06 | Are the lessons learned recorded? | P30 | Cond. | Simpl. | Yes |
| ☐ | G7.07 | Scale: are the scope, investment and new risks described, with a new phase 0 planned? | P30 | Yes | Yes | Yes |
| ☐ | G7.08 | Scale: are there no open S1 or S2 incidents, and can operations support the new volume? | P24 · P27 | Cond. | Yes | Yes |
| ☐ | G7.09 | Scale in Transform: is the express approval of the board recorded? | P29 · minutes | Yes | — | Yes |
| ☐ | G7.10 | Iterate: are the return phase, the reason and the time limit defined? | P30 | Yes | Yes | Yes |
| ☐ | G7.11 | Retire: does the plan cover date, coded reason, body, replacement, data and models, access, communication and inventory? | P30 · T22 | Yes ◆ | Yes | Yes |
| ☐ | G7.12 | [TER] Retire: is the return or certified deletion of data and the revocation of the supplier's access planned? | P14 · P30 | Yes ◆ | Yes | Yes |

---

## 11. LV-EV · Evidence validation

Applied to **each piece of evidence** linked in the *gate* request, before reviewing the gate checklist. It develops 21 §4. It applies equally in Lite and Enterprise, except EV.10, which in Lite requires only the fields not marked *(Enterprise)*.

| ☐ | Code | Question | Where to look | If the answer is no |
|---|---|---|---|---|
| ☐ | EV.01 | Does the evidence identify the initiative, the source template or record and the title? | Evidence cover page | Pending |
| ☐ | EV.02 | Is the author recorded with their role? | Evidence record | Pending |
| ☐ | EV.03 | Are the date of preparation and the date of last modification recorded? | Record · repository history | Pending |
| ☐ | EV.04 | Is the version linked in the request the version reviewed? | T03 · repository | Pending |
| ☐ | EV.05 | Is the date prior to the *gate* request, and is the activity described prior to the decision? | Repository history · T01 events | Not valid · major nonconformity |
| ☐ | EV.06 | Is it in the repository with version history and a link accessible from T01 or T03? | Repository · T03 | Pending |
| ☐ | EV.07 | Does it relate to this initiative, its scope and the system version, or is its reuse justified? | Content · P15 (version) | Not valid |
| ☐ | EV.08 | If it supports results, does it have a source, period, reproducible method and, for amounts, formula and status? | Content · T11 · T12 | Not valid |
| ☐ | EV.09 | Is it approved by the appropriate person, and are author, verifier and decision-maker different people? | Record · P03 · P29 | Not valid · major nonconformity if there is self-approval |
| ☐ | EV.10 | Are the mandatory fields complete, with an explicit "no data" where information is missing? | Template | Pending |
| ☐ | EV.11 | Do its figures and statements match those in the other evidence? | P08 · P10 · P12 · P18 · P28 | Not met until clarified |
| ☐ | EV.12 | Does it avoid unnecessary personal data, and does it have the appropriate restricted access? | Content · repository permissions | Observation or nonconformity |
| ☐ | EV.13 | If generated by a system, is it a dated export or a timestamped link? | Logs · dashboards · test results | Not valid |
| ☐ | EV.14 | If it comes from a third party, does it have an identifiable issuer, validity and a scope that covers the service? | P14 · supplier documentation | Not valid |

Evidence with a *no* in EV.05 or EV.09 cannot be used for any criterion. With shortcomings in EV.01–EV.04, EV.06 or EV.10, it may be accepted only if it does not support a *Yes* or *Yes ◆* criterion and is corrected before the decision (21 §4.2).

---

## 12. LV-AG · Agents

Brings together the controls for systems that execute actions or prepare them for human validation. It is the content of tool T10 (agent security assessment) and complements, without replacing, the checklists for each gate. It applies equally in Lite and Enterprise; the columns indicate what each autonomy level requires (21 §8.2): **Yes** mandatory · **Rec.** recommended · **—** not applicable. Several items may refer to the same criterion.

| ☐ | Code | Question | Where to look | Gate | A1 | A2 | A3 |
|---|---|---|---|---|---|---|---|
| | | **Risk and autonomy** | | | | | |
| ☐ | G3.17 | Are the agent's RT-GEN and RT-SEG risks assessed in the risk register? | P12 · T06 | G3 | Yes | Yes | Yes |
| ☐ | G3.18 | Is the autonomy level approved, and is the intensity consistent with it? | P04 · P12 | G3 | Yes | Yes | Yes |
| ☐ | G5.07 | Is the autonomy level configured in production the one tested and approved at G5? | P23 · agent configuration | G5 | Yes | Yes | Yes |
| | | **Identity** | | | | | |
| ☐ | G4.15 | Does the agent have its own technical identity, not shared with people or with other agents? | P18 · P54 · identity directory | G4 | Yes | Yes | Yes |
| ☐ | G4.15 | Are the credentials held in a secrets manager, rotated and immediately revocable? | P18 · secrets manager | G4 | Yes | Yes | Yes |
| ☐ | G4.15 | Is a human owner of the agent recorded in the inventory? | P05 · P54 · T02 | G4 | Yes | Yes | Yes |
| | | **Permissions and limits** | | | | | |
| ☐ | G4.16 | Do the actual permissions in the systems match the approved least privilege? (check the configuration, not just the document) | P18 · access configuration | G4, G5 | Yes | Yes | Yes |
| ☐ | G4.16 | Are there quantitative limits (amounts, volumes, recipients, frequency) that block actions exceeding them? | P18 | G4 | — | Yes | Yes |
| ☐ | G5.06 | Do the tests demonstrate that the limits block unauthorised actions? | P22 | G5 | — | Yes | Yes |
| | | **Intent-based access control** | | | | | |
| ☐ | G4.17 | Does each action log the instruction, the objective and the user or process that originates it? | P18 · logs | G4 | Rec. | Yes | Yes |
| ☐ | G4.17 | Are sensitive actions checked against the authorised purpose and blocked if they do not match? | P18 · P22 | G4, G5 | Rec. | Yes | Yes |
| | | **Human validation** | | | | | |
| ☐ | G4.19 | Are the actions requiring prior validation listed (A1: all; A2: sensitive or irreversible; A3: outside limits), and is the system unable to execute them without it? | P17 · P22 | G4, G5 | Yes | Yes | Yes |
| | | **Kill switch** | | | | | |
| ☐ | G4.18 | Is there a documented kill switch with an owner, a substitute and a target time? | P18 · P19 | G4 | Rec. | Yes | Yes |
| ☐ | G5.06 | Was it tested that the kill switch stops the agent and revokes credentials within the target time? | P22 · P19 | G5 | Rec. | Yes | Yes |
| ☐ | R6.11 | Has the kill switch been tested during the review period? | P27 · test log | R6 | — | Rec. | Yes |
| | | **Prompt injection and information leakage** | | | | | |
| ☐ | G4.20 | Is external content (documents, emails, web, tool responses) treated as untrusted and unable to alter instructions or permissions? | P18 | G4 | Yes | Yes | Yes |
| ☐ | G5.05 | Were direct and indirect injection tests passed within threshold? | P22 · T10 | G5 | Yes | Yes | Yes |
| ☐ | G5.05 | Were tests for leakage of personal data, secrets and system instructions passed? | P22 · T10 | G5 | Yes | Yes | Yes |
| | | **Operation** | | | | | |
| ☐ | R6.11 | Are blocked, anomalous or out-of-pattern actions reviewed and acted upon? | P27 · logs | R6 | Rec. | Yes | Yes |
| ☐ | R6.11 | Were permissions and credentials reviewed during the period, and were those no longer needed removed? | P18 · P54 · access configuration | R6 | Yes | Yes | Yes |
| | | **Retirement** | | | | | |
| ☐ | G7.11 | When the agent is retired, are its identity, credentials and permissions revoked and its logs retained for the defined period? | P30 · T22 | G7 | Yes | Yes | Yes |

An unchecked mandatory item in LV-AG is equivalent to *Not met* for the criterion it refers to, with the effects set out in 2.4.

---

## 13. Associated tools and templates

| Code | Name | Use |
|---|---|---|
| **T03** | *Gate* manager | Loads the checklists, records the status of each item, calculates the degree of compliance and applies the blocking rule. |
| **T10** | Agent security assessment | Implements LV-AG within T03. |
| **T01 · T08** | Initiative register · Nonconformities and incidents | Events to check prior existence; register of findings. |
| **P29** | *Gate* decision record | Records the result of the checklists and the verification opinion. |
| **P23** | Go-live sign-off | Check of the LV-G5 sign-offs. |
| **P01–P31** | Block H templates | Where to look for each piece of evidence. |

---

## 14. Related documents

| Document | Relationship |
|---|---|
| **01 · Foundational methodology** | Gates, decision rules, roles and intensity. |
| **03 · Tools and initiative register** | Criterion statuses and tools T03 and T10. |
| **21 · *Gate* and audit criteria** | Criteria, evidence rules, multi-level sign-off and audit criteria to which all the codes refer. |
| **35 · AI and agent security** | Agent controls developed by LV-AG. |
| **37 · Nonconformities and incidents** | Handling of findings. |
| **38 · AI audit framework** | Audit plan and sampling. |

---

## 15. Version control

| Version | Date | Changes |
|---|---|---|
| 0.1 | 16-09-2026 | First version. Replaces the checklists in the previous material: 128 binary controls in eight checklists by gate with the codes from document 21, LV-EV evidence validation checklist (14 controls), LV-AG checklist for agents aligned with T10 (21 controls) and instructions for the verifier and the auditor. Consistency adjustments with 01 (segregation of duties in Lite, R6 outcomes, agent criterion) and with 34 and 37. |
