# Sphere and ambition classification

**Classifies the initiative into an impact sphere and an ambition level using five verifiable questions, and compares the proposed, confirmed and actual classification.**

| | |
|---|---|
| Document | Template P07 · Sphere and ambition classification |
| Version | 0.1 (working draft) |
| Date | 16-09-2026 |
| Author | Fernando García Varela |
| Status | Draft for review. |

---

> **Legal notice and disclaimer.** SEVEN-G is a reference methodological framework provided "as is" and for information purposes only. It does not constitute legal, regulatory, financial or professional advice, nor does it guarantee compliance with any law or standard. References to general regulation (such as the EU AI Act, the GDPR, DORA or NIS2), to technical standards and to regulation specific to each sector or jurisdiction may be incomplete, may not apply to a particular case or may become out of date as a result of regulatory changes, interpretations or supervisory positions after their consultation date. **Each organisation that uses SEVEN-G is solely responsible for identifying the regulation that applies to it, verifying that it is current and certifying its own regulatory compliance**, with the appropriate qualified advice. This methodology is a generic, free aid shared with the community so that nobody has to start from scratch; each person or organisation can and should adapt it to its own use. It must not be inferred that its legally sensitive parts have been reviewed by legal counsel: those reviews, for each company or sector, are the ultimate responsibility of the company, consultant or organisation that uses it. Although every effort is made to keep it up to date, some regulation may have changed without being reflected here. To the fullest extent permitted by law, the author accepts no responsibility whatsoever for the effects of its application in any organisation or for its full applicability. The methodology does not grant certification of any kind. The author accepts no liability for any use made of this content or for any decisions taken on the basis of it. The data, figures, companies and cases in the examples are fictitious or illustrative.

## 1. Instructions for use

| Aspect | Guidance |
|---|---|
| **When it is used** | Three times on the same document: in phase 1 the **Proposed** column is completed; in phase 2, the **Confirmed** column; in phase 7, the **Actual** column, with operational evidence (00 §5.2). |
| **Who completes it** | The AI Product Owner. In phase 7, with the data from P28 (value realisation tracking). |
| **Who verifies it** | Lite: AI Office. Enterprise: AI Auditor. |
| **Who decides** | The body for the corresponding *gate*. If the result is Transform, confirmation at G2 and scaling at G7 require approval by the board or its board committee (01 §7.5). |
| **Gate at which it is reviewed** | G1 (proposed), G2 (confirmed) and G7 (actual). |
| **Tool** | T05 · Ambition classifier (module of T01). |
| **Lite versus Enterprise** | The five questions and the decision rule are mandatory in both intensities. Lite may omit the blocks marked **(Enterprise)**. |

Completion rules:

- Ambition is not determined by the technology, but by **what changes in the business and where the value appears** (00 §5.1).
- If questions 1 to 4 are negative, the initiative is **Optimise**, regardless of how it has been presented (00 §5.2).
- The answers in the Actual column are based on operational evidence, not on intentions.

---

## 2. Identification

| Field | Content | Guidance |
|---|---|---|
| Initiative code | | IA-AAAA-NNN. |
| Initiative name | | |
| Document version | | |
| Date of the last column completed | | DD-MM-AAAA. |
| Author | | Name and role. |
| Applicable intensity | | Lite · Enterprise. Transform implies Enterprise (P04, criterion 7). |

---

## 3. Impact sphere

| Field | Proposed (phase 1) | Confirmed (phase 2) | Actual (phase 7) | Guidance |
|---|---|---|---|---|
| Primary sphere | | | | 01 Customer · 02 Product and service · 03 People · 04 Operations · 05 Data · 06 Knowledge · 07 Decision · 08 Regulation, ethics and accountability · 09 AI governance |
| Secondary sphere | | | | Same list or "none". |
| Justification | | | | Where the main effect appears. |

Spheres 08 and 09 are not assessed on the three ambition levels (00 §4.1). If the primary sphere is one of them, complete this table instead of sections 4 to 6:

| Sphere | Level | Justification |
|---|---|---|
| 08 Regulation, ethics and accountability | Compliance · Anticipation · Ethical leadership | |
| 09 AI governance | Structure · Balance between speed and control · Supplier ecosystem | |

---

## 4. The five questions

Reference: 00 §5.2. Answer "Yes" or "No" in each column.

| # | Question | If the answer is yes, it points to… | Proposed (phase 1) | Confirmed (phase 2) | Actual (phase 7) |
|---|---|---|---|---|---|
| 1 | Does it change the value proposition received by the customer or end user? | Transform | | | |
| 2 | Is the process redesigned end to end, and not just a task within the process? | Augment or Transform | | | |
| 3 | Do roles, organisational structure or who makes which decisions change? | Augment or Transform | | | |
| 4 | Does it generate revenue, services or markets that did not exist before? | Transform | | | |
| 5 | Could it be retired without affecting the business model, simply returning to the previous cost? | Optimise | | | |

**Justification and evidence**

| # | Proposed (phase 1) | Confirmed (phase 2) | Actual (phase 7) |
|---|---|---|---|
| 1 | | | |
| 2 | | | |
| 3 | | | |
| 4 | | | |
| 5 | | | |

Guidance on evidence: in phase 1 reasoning is sufficient; in phase 2, the value hypothesis (P08) must be consistent with the answers; in phase 7 data is used: composition of validated value (efficiencies versus return), redesigned processes, approved role changes and attributable revenue.

---

## 5. Decision rule

Apply the steps in order:

| Step | Condition | Result |
|---|---|---|
| 1 | Questions 1, 2, 3 and 4 are "No". | **Optimise** (rule in 00 §5.2). |
| 2 | Question 1 or 4 is "Yes". | **Transform**. |
| 3 | Questions 1 and 4 are "No" and 2 or 3 is "Yes". | **Augment**, unless the redesign or the organisational change alters how the company competes or how it is organised; in that case, **Transform** with express justification. |
| 4 | Consistency check against question 5. | If 5 is "Yes" and the result is Transform, there is an inconsistency: it is justified or reclassified. If 5 is "No" and the result is Optimise, check whether the initiative supports a critical function (P04, criterion 6). |

Steps 2 to 4 are this template's operational rule for the questions that 00 §5.2 leaves open ("Augment or Transform"). Document 12 may calibrate it.

---

## 6. Classification result

| Point in time | Level resulting from the rule | Level declared by the team | Do they match? | Confirming body | Date |
|---|---|---|---|---|---|
| Proposed (phase 1, G1) | Optimise · Augment · Transform | | Yes · No | | |
| Confirmed (phase 2, G2) | | | | | |
| Actual (phase 7, G7) | | | | | |

If the declared level does not match the level from the rule, the rule prevails unless the competent body takes a reasoned decision, which is recorded in P29.

**Who decides according to the level** (00 §4.1):

| Level | Who should decide | Consequences in SEVEN-G |
|---|---|---|
| Optimise | Management of the area, within the portfolio framework. | G2 criteria focused on a baseline for cost, time or errors and savings with a formula. |
| Augment | Senior management, with visibility for the AI Committee. | Performance and cost metrics, adoption target and people plan. |
| Transform | Board or senior management, explicitly. | Enterprise intensity; board approval at G2 and G7; learning milestones and investment limit per stage in P08. |

*(illustrative example)* Assistant for responding to order queries. Proposed: questions 1–4 "No", 5 "Yes". Result: **Optimise**. Actual (phase 7): the company redesigns customer service and creates a conversation supervision role; question 3 changes to "Yes". Actual result: **Augment**. The discrepancy is recorded in section 7.

---

## 7. Discrepancy analysis in phase 7 **(Enterprise)**

| Field | Content | Guidance |
|---|---|---|
| Confirmed versus actual level | | For example: "confirmed Transform, actual Optimise". |
| Evidence of the actual level | | Validated value by type, process and role changes, attributable revenue. |
| Cause of the discrepancy | | Reduced scope, partial adoption, change of strategy, optimistic initial classification. |
| Effect on the transformation index | | Signals affected (00 §5.3), in particular value mix, depth of change, operating model and move to production. |
| Lesson for the portfolio | | What must change in the classification of future initiatives. |

An initiative confirmed as Transform whose actual classification is Optimise contributes to the "Declared but unevidenced transformation" profile and must be reported to the AI Committee.

---

## 8. Classification change log

| Date | Field | Previous value | New value | Reason | Decision-maker |
|---|---|---|---|---|---|
| | Sphere · Ambition | | | | |

Each change generates a classification change event in the initiative register (03 §3.3) and requires P04 to be reviewed.

---

## 9. Quality criteria

The formal criteria are in document 21 (see criteria G1.xx, G2.xx and G7.xx).

| # | Check | Status |
|---|---|---|
| 1 | The five questions have an answer and a justification in the column for the point in time. | Met · Not met · Not applicable · Pending |
| 2 | The result applies the decision rule, including the question 5 check. | |
| 3 | The sphere uses the controlled taxonomy. | |
| 4 | Discrepancies between the declared level and the result of the rule are reasoned. | |
| 5 | For Transform, board approval at G2 (and at G7 if scaled) is recorded. | |
| 6 | The Actual column is based on operational evidence. | |
| 7 | Classification changes are recorded and P04 has been reviewed. | |

---

## 10. Approval and verification

| Function | Role in SEVEN-G | Name and position | Date | Signature or reference |
|---|---|---|---|---|
| Prepares | AI Product Owner | | | |
| Verifies | AI Office (Lite) · AI Auditor (Enterprise) | | | |
| Decides | *Gate* body (01 §7.5) | | | |
| Approves Transform | Board or board committee | | | |

Segregation of duties: the verifier has not answered the questions; the sponsor does not confirm a Transform classification alone.

---

## 11. Version control

**Completed document**

| Version | Date | Author | Changes |
|---|---|---|---|
| | | | |

**Template**

| Version | Date | Changes |
|---|---|---|
| 0.1 | 16-09-2026 | First version. Applies the five questions in 00 §5.2 with proposed, confirmed and actual columns, and proposes an operational decision rule. |
