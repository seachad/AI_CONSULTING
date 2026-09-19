# Audit working papers

**Documents each AI audit from start to finish: planning, opening, tests with their sample and evidence, closing and follow-up of recommendations.**

| | |
|---|---|
| Document | Template P59 · Audit working papers |
| Version | 0.1 (working draft) |
| Date | 19-09-2026 |
| Author | Fernando García · SEACHAD |
| Status | Draft for review. |

---

> **Legal notice and disclaimer.** SEVEN-G is a reference methodological framework provided "as is" and for information purposes only. It does not constitute legal, regulatory, financial or professional advice, nor does it guarantee compliance with any law or standard. References to general regulation (such as the EU AI Act, the GDPR, DORA or NIS2), to technical standards and to regulation specific to each sector or jurisdiction may be incomplete, may not apply to a particular case or may become out of date as a result of regulatory changes, interpretations or supervisory positions after their consultation date. **Each organisation that uses SEVEN-G is solely responsible for identifying the regulation that applies to it, verifying that it is current and certifying its own regulatory compliance**, with the appropriate qualified advice. The author and SEACHAD accept no liability for any use made of this content or for any decisions taken on the basis of it. The data, figures, companies and cases in the examples are fictitious or illustrative.

> **Why it matters.** An audit conclusion is only as good as the evidence that supports it. Working papers allow another auditor, the quality review, the statutory auditor or a supervisor to reconstruct what was tested, on which sample, with what result and why that conclusion was reached. Without them, a finding can be disputed as an opinion and a Conformant conclusion proves nothing. A justified sample size prevents conclusions being drawn from three conveniently chosen cases.

## 1. Instructions for use

| Aspect | Guidance |
|---|---|
| **When it is used** | In every audit in the annual plan (P58) and in unplanned ones: *gate*, continuity, framework, thematic, supplier and value audits. It is opened at planning and closed with the last follow-up note. |
| **Who completes it** | The lead auditor and the auditors on the team; technical experts document their tests under the direction of the lead auditor (38 §3.1). |
| **Who verifies it** | The head of AI audit or a different auditor reviews the papers before the report (quality review, 38 §12.2). |
| **Who decides or approves** | The lead auditor is accountable for the conclusion, which is issued with P60. |
| **Stage, *gate* or moment** | According to the annual plan. In *gate* audits the stages are compressed to respect the decision time limit (38 §6.1): Enterprise verification should be completed within a maximum of 7 working days from when the evidence is complete. |
| **Tool** | It has no dedicated tool. The tests draw on T01, T02, T03, T08, T10 and T12. The formulas in section 7 allow sample sizes to be calculated in a spreadsheet. |
| **Reference document** | Document 38 §6 (process and programmes), §7 (techniques and sampling) and §10 (follow-up); document 21 §10.3–10.4. |
| **Lite versus Enterprise** | In a sample-based Lite *gate* audit, sections 4 and 8 (opening and closing minutes) may be omitted and replaced by a written communication. The rest is mandatory. |

Completion rules:

- The **declaration of independence** of the lead auditor and of each expert is signed **before** work starts, using template P41, and is cited in section 2. Without it, work does not begin.
- Each test has its own working paper (section 6), with a consecutive reference within the audit: AUD-AAAA-NNN/PT-01, PT-02…
- Whenever possible, the **entire population** is analysed. If sampling is used, the size is justified with section 7 and the selection method and seed are documented.
- Technical tests are carried out **without altering production** and with the exact version of the system recorded (38 §7.3).
- Findings are agreed with the owner to confirm the facts, **not to negotiate the classification**.

---

## 2. Engagement identification

| Field | Content | Guidance |
|---|---|---|
| Audit code | | AUD-AAAA-NNN (P58). |
| Type | | *Gate* · Continuity · Framework · Thematic · Supplier · Value · Follow-up · Re-audit. |
| Subject matter | | SIA-AAAA-NNN, IA-AAAA-NNN, supplier, process or theme. |
| Period audited | | DD-MM-AAAA to DD-MM-AAAA. |
| Lead auditor | | |
| Team and experts | | Name, speciality and scope of their work. |
| Declarations of independence (P41) | | Reference and date of each; all prior to the start. |
| Owner of the subject matter audited | | Audit counterpart. |
| Previous audits of the same subject matter | | Codes and open findings. |

---

## 3. Planning memorandum

| Field | Content | Guidance |
|---|---|---|
| Objective | | What conclusion the audit must allow. |
| Scope | | Systems, versions, processes, periods and locations included. |
| Out of scope | | What is not audited and why. |
| Criteria | | G*n*.*nn* or R6.*nn* codes in document 21, LV checklists in document 22, applicable documents and standards. |
| Information reviewed for planning | | Inventory record (P05), risk register (P12), incidents (P27, T08), previous audits, R6. |
| Key risks identified | | What could go wrong in the subject matter and where testing is concentrated. |
| Planned tests | | PT references in section 5. |
| Use of the work of others | | Independent reports or reports from other assurance functions relied on by the auditor, with the assessment of their independence, competence, scope and date (38 §7.3 and §12.2). |
| Access and data required | | With minimisation of personal data. |
| Timetable | | Opening, fieldwork, closing, draft, management response and final report (indicative time limits in 38 §6.1). |
| Information request | | List of documents and records requested, with delivery date. |

---

## 4. Opening meeting minutes

| Field | Content | Guidance |
|---|---|---|
| Date and attendees | | Audit and owners of the subject matter audited. |
| Scope and criteria presented | | |
| Agreed timetable | | |
| Access granted and pending | | Systems, test environments, logs. |
| Counterparts by area | | |
| Restrictions communicated by the auditee | | If they limit the work, they are also recorded as a limitation in P60. |

---

## 5. Test programme

The tests that apply to the type of audit are marked and each is assigned its working paper. In thematic, supplier and value audits, the programme is built from the questions for the theme (38 §4.1), document 36 or the tests in 43 §12.3.

### 5.1 *Gate* audit (38 §6.2)

| # | Test | Applies (Yes · No) | PT reference | Status |
|---|---|---|---|---|
| 1 | Completeness of mandatory evidence against LV-G*n* | | | Met · Not met · Not applicable · Pending |
| 2 | Traceability: author, date, version and verification | | | |
| 3 | Prior existence of the evidence before the request | | | |
| 4 | Tangible results re-performed or recalculated | | | |
| 5 | Applicable G*n*.*nn* criteria Met with valid evidence | | | |
| 6 | Criteria by ambition level (01 §7.6) | | | |
| 7 | Segregation of duties (P03, T03) | | | |
| 8 | Prior conditions met or expired condition rule applied | | | |
| 9 | Classification, intensity and acceptance of residual risk | | | |
| 10 | Critical controls designed or tested (G4 and G5) | | | |
| 11 | Multi-level sign-off with no pending veto (Enterprise G5, P23) | | | |

### 5.2 Continuity audit (38 §6.3)

| # | Area | Applies (Yes · No) | PT reference | Status |
|---|---|---|---|---|
| 1 | Inventory | | | |
| 2 | Classification | | | |
| 3 | Monitoring | | | |
| 4 | Performance and degradation | | | |
| 5 | Human oversight | | | |
| 6 | Incidents and changes | | | |
| 7 | Agents | | | |
| 8 | Value | | | |
| 9 | Cost | | | |
| 10 | Compliance | | | |
| 11 | R6 reviews | | | |

---

## 6. Working paper per test

This block is copied for each test.

| Field | Content | Guidance |
|---|---|---|
| Reference | | AUD-AAAA-NNN/PT-NN. |
| Test and area | | Number in the programme in section 5. |
| Objective | | What is to be checked. |
| Criterion | | Requirement with its exact reference (document 21 code, EV rule, section of a document, template). |
| Population | | Which items make up the population, how many there are and their source. |
| Technique | | Review of evidence · Inquiry · Observation · Inspection of configurations · Re-performance · Data analytics · External confirmation · Forensic analysis of versions (38 §7.1). |
| Sample | | Size, calculation (section 7), selection method and seed; or "entire population". |
| Procedure | | Steps followed, so that another auditor can repeat them. |
| Result | | Items tested, deviations found and their nature. |
| Evidence | | Documents, extracts, screenshots or records obtained, with their location in the audit file. |
| Conclusion | | No deviations · Finding H-NN (provisional class). |
| Prepared by and date | | |
| Reviewed by and date | | Quality review. |

Sample detail:

| Item | Identifier | Attribute checked | Result (Met · Not met) | Evidence | Comment |
|---|---|---|---|---|---|
| 1 | | | | | |
| 2 | | | | | |

*(illustrative example)* PT-05 of a continuity audit: **objective**, to check that the human oversight defined in P17 is exercised over the answers that the assistant flags as doubtful; **population**, 1,240 flagged answers in the period according to the system log; **sample**, 29 (95 % confidence, 10 % tolerable rate), random selection with seed 4817; **result**, 28 with a recorded review and 1 without review owing to a gap in the night shift; **conclusion**, finding H-02, provisional minor nonconformity, pending assessment of whether the deviation is systematic.

---

## 7. Sample size calculation

### 7.1 Attribute sampling for controls

With zero expected deviations, confidence *C* and tolerable rate *T* (38 §7.2): *n = ln(1 − C) ÷ ln(1 − T)*, rounded up. With a small population *N*: *n' = n ÷ (1 + (n − 1) ÷ N)*, rounded up; if *N* is equal to or smaller than the sample, the entire population is reviewed.

In a spreadsheet:

- Size: `=ROUNDUP(LN(1-C)/LN(1-T),0)`
- Population correction: `=IF(N<=n,N,ROUNDUP(n/(1+(n-1)/N),0))`

| Confidence | Tolerable rate | Size | Indicative use |
|---|---|---|---|
| 90 % | 20 % | 11 | Low-risk Lite *gates*; low-risk controls |
| 95 % | 20 % | 14 | Moderate-risk controls with a small population |
| 90 % | 10 % | 22 | Inventory records for corporate use |
| 95 % | 10 % | 29 | Relevant controls |
| 95 % | 5 % | 59 | Critical controls |
| 99 % | 5 % | 90 | Critical controls with high exposure or a history of incidents |

### 7.2 Periodic controls

Practical reference, not statistical: 1 of 1 annual · 2 of 4 quarterly · 2 to 5 of 12 monthly · 5 to 15 weekly · 20 to 40 daily or multiple times a day. The auditor may increase these sizes depending on risk.

### 7.3 Estimating proportions in model outputs

With 95 % confidence and the least favourable proportion (50 %): *n = 1.96² × 0.5 × 0.5 ÷ e²*. In a spreadsheet: `=ROUNDUP(1.96^2*0.25/e^2,0)` (± 10 points: 97 · ± 5: 385 · ± 3: 1,068). In bias tests, the size is calculated **per group**.

### 7.4 Record of the calculation per test

| PT reference | Sampling type | Population *N* | Confidence | Tolerable rate or margin | Calculated size | Size after correction | Selection method and seed |
|---|---|---|---|---|---|---|---|
| | Attributes · Periodic · Proportion · Targeted · Entire population | | | | | | |
| *(illustrative example)* PT-05 | Attributes | 1,240 | 95 % | 10 % | 29 | 29 | Random · seed 4817 |

If a deviation appears in a sample designed with zero expected deviations, it is not concluded that the control operates at the planned level: its cause is assessed and, if the sample is extended, it is re-planned with a non-zero expected rate and documented. Targeted selection detects problems but does not allow extrapolation.

---

## 8. Agreement of findings and closing meeting minutes

| Finding | Communicated to | Date | Facts confirmed (Yes · No) | Owner's comments | Auditor's position |
|---|---|---|---|---|---|
| H-01 | | | | | |

| Field | Content | Guidance |
|---|---|---|
| Date and attendees | | |
| Findings presented and classification | | Observation · Minor · major · critical nonconformity (38 §8.1). |
| Provisional outcome | | Conformant · Conformant with observations · Nonconformant. |
| Management disagreements | | Recorded in the management response in P60. |
| Critical nonconformities communicated through escalation | | Every critical nonconformity is communicated as soon as it is confirmed, before the report (30, E-5). |
| Agreed time limits | | Draft, management response and final report. |

---

## 9. Follow-up note on recommendations

One note per verification (38 §10).

| Field | Content | Guidance |
|---|---|---|
| Originating audit and finding | | AUD-AAAA-NNN · H-NN · NC-AAAA-NNN (T08). |
| Class | | Observation · Minor · major · critical nonconformity. |
| Committed action, owner and time limit | | From the management response in P60. |
| Verification performed | | Documentary (minor) · Of effectiveness over a reasonable period (major and critical) · Technical test where appropriate. |
| Evidence obtained | | |
| Result | | Corrected · Corrected without demonstrated effectiveness · Not corrected · Risk accepted. |
| If risk accepted | | Body with a sufficient level that accepts (30 §7.2), date and minutes. Not possible if the breach is a legal one. |
| If overdue | | Escalation in accordance with 30 §8.2; a major nonconformity not corrected on time is reclassified as critical if the risk it controls is High or Critical. |
| Status in T08 | | Open · Closed. |
| Verified by and date | | |

Closing is not implementing: an action implemented without evidence of effectiveness does not close a major or critical nonconformity.

---

## 10. Quality criteria

| # | Check | Status |
|---|---|---|
| 1 | The declarations of independence (P41) predate the start and cover the whole team and the experts. | Met · Not met · Not applicable · Pending |
| 2 | The memorandum sets the objective, scope, criteria and key risks before fieldwork. | |
| 3 | Each test has a working paper with objective, criterion, population, sample, procedure, result, evidence and conclusion. | |
| 4 | Sample sizes are justified and the selection method is reproducible. | |
| 5 | Prior-existence tests compare evidence dates with the events in T01 (38 §6.2, test 3). | |
| 6 | Technical tests record the system version and did not alter production. | |
| 7 | Each finding was agreed with the owner and refers to its working paper. | |
| 8 | Follow-up notes verify effectiveness for major and critical nonconformities. | |

---

## 11. Approval and verification

| Function | Role in SEVEN-G | Name and position | Date | Signature or reference |
|---|---|---|---|---|
| Prepares | AI Auditor (lead auditor) and team | | | |
| Provides specialist tests | Supporting technical expert | | | |
| Reviews quality | Head of AI audit or another auditor | | | |
| Receives the closing minutes | Owner of the subject matter audited | | | |

Segregation of duties: anyone who has had a role in the design, construction or operation of the subject matter, or has advised on its controls in the previous twelve months, does not prepare or review these papers (30, I-10 and I-11).

---

## 12. Version control

**Completed document**

| Version | Date | Author | Changes |
|---|---|---|---|
| | | | |

**Template**

| Version | Date | Changes |
|---|---|---|
| 0.1 | 19-09-2026 | First version. Applies the standard work programme, the *gate* and continuity programmes, the techniques, the sampling formulas and the follow-up in 38 §6, §7 and §10; proposes the working paper reference AUD-AAAA-NNN/PT-NN. |
