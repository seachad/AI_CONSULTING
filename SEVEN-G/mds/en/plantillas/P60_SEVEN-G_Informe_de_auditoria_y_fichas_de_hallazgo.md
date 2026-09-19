# Audit report and finding records

**Communicates the outcome of an AI audit with an opinion, scope, limitations, classified findings, recommendations and the management response, in a format that management and the board can read and follow up.**

| | |
|---|---|
| Document | Template P60 · Audit report and finding records |
| Version | 0.1 (working draft) |
| Date | 19-09-2026 |
| Author | Fernando García · SEACHAD |
| Status | Draft for review. |

---

> **Legal notice and disclaimer.** SEVEN-G is a reference methodological framework provided "as is" and for information purposes only. It does not constitute legal, regulatory, financial or professional advice, nor does it guarantee compliance with any law or standard. References to general regulation (such as the EU AI Act, the GDPR, DORA or NIS2), to technical standards and to regulation specific to each sector or jurisdiction may be incomplete, may not apply to a particular case or may become out of date as a result of regulatory changes, interpretations or supervisory positions after their consultation date. **Each organisation that uses SEVEN-G is solely responsible for identifying the regulation that applies to it, verifying that it is current and certifying its own regulatory compliance**, with the appropriate qualified advice. The author and SEACHAD accept no liability for any use made of this content or for any decisions taken on the basis of it. The data, figures, companies and cases in the examples are fictitious or illustrative.

> **Why it matters.** The report is what reaches those who decide: the *gate* body, the AI Committee, the board committee or the board. If it does not separate facts, criterion, cause and effect, the finding is debated instead of corrected; if it does not declare its limitations, a Conformant conclusion appears to give more assurance than it does. Finding records turn each breach into an action with an owner and a time limit, and link to the nonconformity register so that nothing is lost.

## 1. Instructions for use

| Aspect | Guidance |
|---|---|
| **When it is used** | At the end of the fieldwork of any AI audit: continuity, framework, thematic, supplier, value and post-*gate* audits. For the verification of a *gate*, the abridged version integrated into P29 and T03 is used (section 3.1). |
| **Who completes it** | The lead auditor drafts it; the responsible management completes section 11 (management response). |
| **Who verifies it** | The head of AI audit reviews the draft against the working papers (P59). |
| **Who decides or approves** | The lead auditor issues the opinion. The actions are approved by the body corresponding to the class of finding (30 §8.2: AI Office for minor, AI Committee for major, AI Committee and board committee for critical). |
| **Stage, *gate* or moment** | According to the annual plan (P58). The framework audit and the value audit feed into C5. Indicative time limits (38 §6.1): draft within 10 working days after closing, management response within 10 and final within 5. |
| **Tool** | T08 (registration of each nonconformity with NC-AAAA-NNN and a link to its originating audit) · T03 and T01 (verification and audit outcome) · T12 (value audit). |
| **Reference document** | Document 38 §8–§10; document 21 §10.2, §10.5–§10.7; document 43 §12; document 37. |
| **Lite versus Enterprise** | The report structure does not change. In Lite, documentary verification of minor actions may be carried out by the AI Office (38 §10). |

Completion rules:

- The audit is identified with **AUD-AAAA-NNN** and each finding with **H-01, H-02…** within the report (38 §9). Every nonconformity is also recorded in T08 with **NC-AAAA-NNN**.
- Classification follows the **most serious effect** on the decision, people or compliance, and the aggregation and recurrence rules in 38 §8.1 and 21 §10.5 are applied.
- The audit outcome **is not the *gate* decision**: the auditor does not recommend whether the initiative should proceed on the basis of its business value.
- Every critical nonconformity is communicated **before the report**, as soon as it is confirmed (30, E-5).
- The recommendation states **what** must be corrected, not how to design it in detail: the auditor does not design the controls they later audit.

---

## 2. Identification

| Field | Content | Guidance |
|---|---|---|
| Audit code | | AUD-AAAA-NNN. |
| Type | | Continuity · Framework · Thematic · Supplier · Value · Post-*gate* · Re-audit. |
| Subject matter | | SIA-AAAA-NNN, IA-AAAA-NNN, supplier, process or theme. |
| Period audited | | |
| Dates of the work | | Opening, closing, draft and final report. |
| Lead auditor and experts | | With reference to their declarations of independence (P41). |
| Recipients | | According to section 13. |
| Report version | | Draft · Final. |

---

## 3. Summary for management

| Field | Content | Guidance |
|---|---|---|
| Outcome | | **Conformant** (no nonconformities) · **Conformant with observations** (minor only) · **Nonconformant** (at least one major or critical). |
| Findings by class | | Critical · major · minor · observations. |
| Three key messages | | In non-technical language. |
| Risk to the company if no action is taken | | Decision, people, compliance or value affected. |
| Express warning | | If a minor nonconformity affects critical security, legal compliance or human oversight controls, Proceed with conditions is not admissible (01 §7.3; 38 §8.2). |

### 3.1 Abridged version for the verification of a *gate*

It is recorded in P29 and T03 (38 §9.1): verification outcome, criteria Not met or Pending, findings and limitations. With a Nonconformant outcome, the request returns to the team **without a decision** (21 §10.2).

---

## 4. Objective, scope and criteria

| Field | Content | Guidance |
|---|---|---|
| Objective | | |
| What was audited | | Systems, versions, initiatives, *gates*, processes, period. |
| What was not audited | | And why. |
| Criteria applied | | G*n*.*nn* and R6.*nn* codes in document 21, LV checklists in document 22, EV rules, framework documents and applicable standards (for example, the AI Act or the GDPR depending on the system's classification). |

---

## 5. Limitations

| Limitation | Type | Effect on the conclusion |
|---|---|---|
| | Information not available · Access denied · Test not performed · Time limit · Dependence on the auditee for technical evidence | None · Conclusion qualified for the area · Unable to conclude on the area |
| | | |

---

## 6. Methodology

| Field | Content | Guidance |
|---|---|---|
| Techniques used | | 38 §7.1. |
| Populations, samples and selection method | | Summary of the record in P59 §7.4. |
| Technical tests and version of the system tested | | 38 §7.3. |
| Work of others relied on | | Report, author, date and assessment of their independence and competence. |

---

## 7. Summary of findings

### 7.1 By classification

| Class | Number | Codes | Containment (38 §8.1) | Action plan | Reported to |
|---|---|---|---|---|---|
| Critical nonconformity | | | Immediate, within 48 hours at most, including shutdown if necessary | Within 10 days at most | AI Committee and board committee |
| Major nonconformity | | | Within 10 days at most | Within 30 days at most | AI Committee |
| Minor nonconformity | | | Not required | Before the next *gate* or review | AI Office |
| Observation | | | — | Management decides whether to act | — |

The time limits are for reference; the company may adjust them in C2 without exceeding those set by regulation.

### 7.2 Outcome per audited item

Mandatory in post-*gate* audits and in thematic audits covering several systems (21 §10.7).

| Item (initiative, *gate*, system or supplier) | Outcome | Findings |
|---|---|---|
| | Conformant · Conformant with observations · Nonconformant | |

---

## 8. Finding records

One record per finding (38 §9.2).

| Field | Content | Guidance |
|---|---|---|
| Code | | H-NN; NC-AAAA-NNN in T08 if it is a nonconformity. |
| Title | | Brief, descriptive phrase. |
| Condition | | What has been found, with facts and figures. |
| Criterion | | Requirement not met, with its exact reference. |
| Cause | | Preliminary analysis; the full root cause is dealt with under document 37. |
| Effect | | Decision affected, risk, compliance or value. |
| Evidence | | AUD-AAAA-NNN/PT-NN references in P59. |
| Classification | | Observation · Minor · major · critical nonconformity, with the rule applied if it is aggregated or reclassified. |
| Recommendation | | What should be corrected. |
| Management action | | Action, owner and time limit. |

*(illustrative example)* **H-02 · Doubtful answers without human review on the night shift.** Condition: 1 of 29 answers flagged as doubtful in the period was not reviewed; the night shift had no designated supervisor for three weeks. Criterion: oversight defined in P17 and the corresponding R6 criterion in document 21. Cause: the supervisor's absence did not trigger a replacement. Effect: answers to customers without the review approved at G5. Evidence: PT-05. Classification: minor nonconformity; it affects human oversight, so it is not admissible as a condition for continuity. Recommendation: ensure oversight coverage on all shifts. Action: designation of deputies and an alert for shifts without a supervisor, AI Operations Owner, 30 days.

### 8.1 Variant: value audit (43 §12)

Additional fields in the record:

| Field | Content | Guidance |
|---|---|---|
| Use case and amount code | | IA-AAAA-NNN; value line in T12. |
| Test in 43 §12.3 affected | | Formula and sources · Baseline and attribution · Status and validity · Materialisation · Exclusivity · Full cost · Presentation. |
| Amount and status presented | | Validated · declared · estimated. |
| Correct amount and status according to the audit | | |
| Does it affect figures already presented to the board? | | Yes · No. If Yes, the AI Office presents at the next meeting the corrected figure alongside the one presented, with the explanation. |
| Minimum treatment (43 §12.4) | | Error with no impact on decisions: minor · Amount presented as validated without validation or with expired validation: major · Double counting or released capacity added to the net with an impact on decisions: major · Deliberate alteration of figures or stop criteria: at least major and communication to the board committee. |

### 8.2 Variant: post-*gate* audit (21 §10.7)

| Field | Content | Guidance |
|---|---|---|
| Initiative, *gate* and iteration | | IA-AAAA-NNN · G*n* · iteration. |
| Decision audited and date | | Outcome recorded in P29. |
| Criterion or rule affected | | G*n*.*nn*, R6.*nn* code or EV rule. |
| Does it invalidate the decision? | | Yes · No. Any finding that invalidates a *gate* decision is, at a minimum, a major nonconformity (21 §10.5). |
| Effect on the *gate* (21 §10.6) | | Critical: *gate* invalidated · Major that invalidates: the initiative returns to Awaiting gate and is verified again; if it is in production, the AI Committee decides whether to maintain operation with containment · Minor: the decision stands. |
| Owner | | |

---

## 9. Observations and recommendations

| No. | Observation | Recommendation | Management decision (acts · does not act) |
|---|---|---|---|
| | | | |

---

## 10. Follow-up of previous findings

| Audit and finding | Class | Committed action | Time limit | Status | Comment |
|---|---|---|---|---|---|
| | | | | Corrected · Corrected without demonstrated effectiveness · Within time limit · Overdue · Risk accepted | |

---

## 11. Management response

| Finding | Action | Owner | Time limit | Agrees with the finding? (Yes · No) | If No, management's position and the auditor's position |
|---|---|---|---|---|---|
| H-01 | | | | | |
| H-02 | | | | | |

Accepting the risk instead of correcting is only possible if the body with a sufficient level (30 §7.2) expressly accepts it and the breach is not a legal one; the finding is closed as "risk accepted", not as "corrected" (38 §10).

---

## 12. Conclusion

| Field | Content | Guidance |
|---|---|---|
| Auditor's opinion | | Conclusion on the subject matter and the period, consistent with the findings and the limitations. In post-*gate* audits, a conclusion on how the gates operated during the period. |
| Outcome | | Conformant · Conformant with observations · Nonconformant. |
| Consequence | | Closure of the audit file · Follow-up of actions · Action plan and re-audit; at R6, bring G7 forward if it affects the system's controls. |
| Open nonconformities in T08 | | NC-AAAA-NNN codes. |

---

## 13. Distribution and annexes

| Type of audit | Recipients (38 §9.3) |
|---|---|
| Continuity | Sponsor, operations owner, AI Risk Owner; AI Committee if the outcome is Nonconformant. |
| Framework | AI Committee, board committee; summary to the board in C5. |
| Thematic | AI Committee, board committee, owners of the systems affected. |
| Supplier | Owner of the supplier relationship, second line; AI Committee if it is N3. |
| Value | AI Committee and board committee; it feeds into C5 (43 §12). |

Annexes: evidence reviewed, samples, results of technical tests and declarations of independence (P41).

---

## 14. Quality criteria

| # | Check | Status |
|---|---|---|
| 1 | Each finding has a condition, criterion, cause, effect, evidence and classification, and refers to a working paper. | Met · Not met · Not applicable · Pending |
| 2 | Classification applies the most serious effect and the aggregation, recurrence and reclassification rules. | |
| 3 | The outcome is consistent with the findings: no major or critical finding with a Conformant or Conformant with observations outcome. | |
| 4 | Limitations are declared with their effect on the conclusion. | |
| 5 | Each nonconformity is recorded in T08 with an NC-AAAA-NNN code linked to the audit. | |
| 6 | The management response has an action, owner and time limit per finding, and disagreements show both positions. | |
| 7 | Critical nonconformities were communicated before the report. | |
| 8 | In the value audit, corrected figures that affect the board have a presentation date. | |

---

## 15. Approval and verification

| Function | Role in SEVEN-G | Name and position | Date | Signature or reference |
|---|---|---|---|---|
| Issues the opinion | AI Auditor (lead auditor) | | | |
| Reviews quality | Head of AI audit | | | |
| Responds and commits to actions | Management responsible for the subject matter audited | | | |
| Approves the actions | AI Office · AI Committee · Board committee, according to the class | | | |

Segregation of duties: whoever responds on behalf of management does not modify the opinion or the classification; if they disagree, their position appears alongside the auditor's.

---

## 16. Version control

**Completed document**

| Version | Date | Author | Changes |
|---|---|---|---|
| | | | |

**Template**

| Version | Date | Changes |
|---|---|---|
| 0.1 | 19-09-2026 | First version. Applies the report structure and finding record in 38 §9, the classification and follow-up in 38 §8 and §10, the minimum content in 21 §10.7 and the value audit in 43 §12. |
