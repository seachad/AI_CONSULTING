# AI governance profile (NIST AI RMF)

**Describes, for each NIST AI RMF subcategory, the current level with its evidence, the target level set by the company, the gap and the action that closes it, on the SEVEN-G 0–5 scale.**

| | |
|---|---|
| Document | Template P73 · AI governance profile (NIST AI RMF) |
| Version | 0.1 (working draft) |
| Date | 25-09-2026 |
| Author | Fernando García Varela |
| Status | Draft for review. |

---

> **Legal notice and disclaimer.** SEVEN-G is a reference methodological framework provided "as is" and for information purposes only. It does not constitute legal, regulatory, financial or professional advice, nor does it guarantee compliance with any law or standard. References to general regulation (such as the EU AI Act, the GDPR, DORA or NIS2), to technical standards and to regulation specific to each sector or jurisdiction may be incomplete, may not apply to a particular case or may become out of date as a result of regulatory changes, interpretations or supervisory positions after their consultation date. **Each organisation that uses SEVEN-G is solely responsible for identifying the regulation that applies to it, verifying that it is current and certifying its own regulatory compliance**, with the appropriate qualified advice. This methodology is a generic, free aid shared with the community so that nobody has to start from scratch; each person or organisation can and should adapt it to its own use. It must not be inferred that its legally sensitive parts have been reviewed by legal counsel: those reviews, for each company or sector, are the ultimate responsibility of the company, consultant or organisation that uses it. Although every effort is made to keep it up to date, some regulation may have changed without being reflected here. To the fullest extent permitted by law, the author accepts no responsibility whatsoever for the effects of its application in any organisation or for its full applicability. The methodology does not grant certification of any kind. The author accepts no liability for any use made of this content or for any decisions taken on the basis of it. The data, figures, companies and cases in the examples are fictitious or illustrative.

> **Why it matters.** The NIST AI RMF organises AI governance into verifiable outcomes, but it does not set a scale to measure how far each one has progressed. This profile uses the SEVEN-G maturity scale and derives each level from the already verified questionnaire of document 11: the board sees a single number per outcome, the characteristics of trustworthy AI (bias, transparency, accountability, human oversight) are visible and the gap against the target turns into actions with an owner, without a second assessment.

## 1. Instructions for use

| Aspect | Guidance |
|---|---|
| **When it is used** | After each verified maturity assessment in **C1** and **C5** (P34), and when the company wants to report with the NIST AI RMF to its risk committee, a customer or a supervisor. The target level is set in **C2**. |
| **Who completes it** | The AI Office, on the basis of the P34 answer sheet; the "Own" subcategories are assessed by the same assessment team with the rules in 11 §4. |
| **Who verifies it** | The independent verifier of the maturity assessment (11 §4.2), who also reviews all "Own" subcategories at level 3 or above. |
| **Who decides or approves** | The AI Committee approves the profile and the proposed target levels; the board or its board committee approves the target levels in C2. |
| **Stage of the corporate cycle** | C1 and C5 (current profile), C2 (target profile), C4 (monitoring of actions). |
| **Tool** | T15 · Maturity assessment calculates this profile in its "AI RMF profile" view: level derived from the questionnaire, own levels, targets, gap, equivalent *tier* and CSV export, and saves its summary into the T01 register. This template is its paper or Word equivalent. |
| **Reference document** | Document 34 §5.4 (subcategories, coverage in SEVEN-G and associated questions); document 11 §2.2 (levels and equivalence with *tiers*) and §7.5 (derivation rule). |
| **Lite versus Enterprise** | In Lite scope the company may select only the GOVERN subcategories and those that correspond to its Enterprise initiatives, and leave the others out of the profile with a reason. |

Completion rules:

- **Current level**: the one that results from 11 §7.5: the level of the reference dimension, lowered to the level below that of the lowest-level associated question that is not at "Yes" or "Not applicable". For "Own" subcategories, the level evidenced, without exceeding the level of its dimension.
- **Without verified evidence, no level is evidenced**: a subcategory assessed without evidence stays at 0; one that was not assessed is left blank ("no data"), which is not 0.
- **Evidence**: for derived subcategories it is enough to cite the P34 questions and their answer; for "Own" ones, the traceable reference to the evidence (author, date and version). P34 evidence is not copied here.
- **Gap** = target level − current level. **Equivalent *tier***: a view calculated with the table in 11 §2.2 (0–1 → 1; 2 → 2; 3 → 3; 4–5 → 4), never a separate data item.
- The description of each subcategory is in 34 §5.4; the NIST text is not reproduced here.

---

## 2. Identification

| Field | Content | Guidance |
|---|---|---|
| Company and perimeter | | The same as the maturity assessment from which it is derived. |
| Profile identifier | | Proposed format PG-YYYY-MM. |
| Source maturity assessment | | Identifier (EM-YYYY-MM), assessment type and cut-off date of P34. |
| AI RMF version | | NIST AI 100-1, version 1.0, until NIST publishes another. |
| Selected subcategories | | By default, all 72; excluded ones are listed with their reason in section 7. |
| Date of approval of the target profile | | C2 minutes. |

---

## 3. GOVERN

| Subcategory | Level from document 11 | Current level (0–5) | Evidence or P34 questions | Target level | Gap | Equiv. *tier* | Action |
|---|---|---|---|---|---|---|---|
| GOVERN 1.1 | D6 · D6.05, D6.12 | | | | | | |
| GOVERN 1.2 | D1 · D1.04 | | | | | | |
| GOVERN 1.3 | D1 · D1.05, D1.06 | | | | | | |
| GOVERN 1.4 | D6 · D6.04, D6.06 | | | | | | |
| GOVERN 1.5 | D6 · D6.09 | | | | | | |
| GOVERN 1.6 | D6 · D6.03, D6.05 | | | | | | |
| GOVERN 1.7 | D2 · D2.10 | | | | | | |
| GOVERN 2.1 | D1 · D1.07, D1.08 | | | | | | |
| GOVERN 2.2 | D5 · D5.05, D5.06 | | | | | | |
| GOVERN 2.3 | D1 · D1.05, D1.09 | | | | | | |
| GOVERN 3.1 | Own (D5) | | | | | | |
| GOVERN 3.2 | D6 · D6.08 | | | | | | |
| GOVERN 4.1 | Own (D1) | | | | | | |
| GOVERN 4.2 | D6 · D6.06 | | | | | | |
| GOVERN 4.3 | D6 · D6.07, D6.10 | | | | | | |
| GOVERN 5.1 | Own (D6) | | | | | | |
| GOVERN 5.2 | Own (D2) | | | | | | |
| GOVERN 6.1 | D6 · D6.08 | | | | | | |
| GOVERN 6.2 | D6 · D6.08 | | | | | | |
| *(illustrative example)* GOVERN 1.6 | D6 · D6.03, D6.05 | 2 | D6 at 3; D6.05 at "Partial": third-party systems missing from the inventory. | 3 | 1 | 2 | AM-2026-01 |

## 4. MAP

| Subcategory | Level from document 11 | Current level (0–5) | Evidence or P34 questions | Target level | Gap | Equiv. *tier* | Action |
|---|---|---|---|---|---|---|---|
| MAP 1.1 | D2 · D2.05 | | | | | | |
| MAP 1.2 | Own (D5) | | | | | | |
| MAP 1.3 | D1 · D1.05 | | | | | | |
| MAP 1.4 | D2 · D2.08 | | | | | | |
| MAP 1.5 | D1 · D1.05, D1.06 | | | | | | |
| MAP 1.6 | Own (D4) | | | | | | |
| MAP 2.1 | D6 · D6.05 | | | | | | |
| MAP 2.2 | Own (D6) | | | | | | |
| MAP 2.3 | D3 · D3.04, D3.07 | | | | | | |
| MAP 3.1 | D2 · D2.08 | | | | | | |
| MAP 3.2 | D6 · D6.06 | | | | | | |
| MAP 3.3 | D2 · D2.05 | | | | | | |
| MAP 3.4 | D5 · D5.05, D5.06 | | | | | | |
| MAP 3.5 | D4 · D4.06 | | | | | | |
| MAP 4.1 | D6 · D6.08 | | | | | | |
| MAP 4.2 | D6 · D6.08 | | | | | | |
| MAP 5.1 | D6 · D6.06 | | | | | | |
| MAP 5.2 | Own (D6) | | | | | | |

## 5. MEASURE

| Subcategory | Level from document 11 | Current level (0–5) | Evidence or P34 questions | Target level | Gap | Equiv. *tier* | Action |
|---|---|---|---|---|---|---|---|
| MEASURE 1.1 | D7 · D7.03 | | | | | | |
| MEASURE 1.2 | D7 · D7.09; D6 · D6.11 | | | | | | |
| MEASURE 1.3 | D6 · D6.10 | | | | | | |
| MEASURE 2.1 | D4 · D4.08 | | | | | | |
| MEASURE 2.2 | Own (D6) | | | | | | |
| MEASURE 2.3 | D4 · D4.08 | | | | | | |
| MEASURE 2.4 | D4 · D4.05, D4.09 | | | | | | |
| MEASURE 2.5 | D4 · D4.08 | | | | | | |
| MEASURE 2.6 | D4 · D4.06 | | | | | | |
| MEASURE 2.7 | D6 · D6.10 | | | | | | |
| MEASURE 2.8 | Own (D6) | | | | | | |
| MEASURE 2.9 | Own (D4) | | | | | | |
| MEASURE 2.10 | D3 · D3.06 | | | | | | |
| MEASURE 2.11 | Own (D6) | | | | | | |
| MEASURE 2.12 | Own (D4) | | | | | | |
| MEASURE 2.13 | Own (D7) | | | | | | |
| MEASURE 3.1 | D6 · D6.09 | | | | | | |
| MEASURE 3.2 | Own (D6) | | | | | | |
| MEASURE 3.3 | Own (D6) | | | | | | |
| MEASURE 4.1 | Own (D7) | | | | | | |
| MEASURE 4.2 | D7 · D7.09 | | | | | | |
| MEASURE 4.3 | D2 · D2.10; D7 · D7.09 | | | | | | |
| *(illustrative example)* MEASURE 2.11 | Own (D6) | 2 | Bias tests with counterfactual pairs in two of five initiatives with decisions about people (P22, 06-2026). | 3 | 1 | 2 | AM-2026-03 |

## 6. MANAGE

| Subcategory | Level from document 11 | Current level (0–5) | Evidence or P34 questions | Target level | Gap | Equiv. *tier* | Action |
|---|---|---|---|---|---|---|---|
| MANAGE 1.1 | D2 · D2.06 | | | | | | |
| MANAGE 1.2 | D6 · D6.06 | | | | | | |
| MANAGE 1.3 | D6 · D6.06 | | | | | | |
| MANAGE 1.4 | D6 · D6.06 | | | | | | |
| MANAGE 2.1 | D2 · D2.08 | | | | | | |
| MANAGE 2.2 | D2 · D2.10 | | | | | | |
| MANAGE 2.3 | D6 · D6.07 | | | | | | |
| MANAGE 2.4 | D4 · D4.06 | | | | | | |
| MANAGE 3.1 | D6 · D6.08 | | | | | | |
| MANAGE 3.2 | D4 · D4.08 | | | | | | |
| MANAGE 4.1 | D4 · D4.05, D4.07 | | | | | | |
| MANAGE 4.2 | D4 · D4.12 | | | | | | |
| MANAGE 4.3 | D6 · D6.07 | | | | | | |

---

## 7. Characteristics of trustworthy AI

The AI RMF describes seven characteristics of trustworthy AI. This table makes them visible to the board: it takes the **lowest** level of the subcategories that assess them most directly.

| Characteristic | Subcategories that assess it | Current level (minimum) | Target level | Gap |
|---|---|---|---|---|
| Valid and reliable | MEASURE 2.5, MEASURE 2.3 | | | |
| Safe for people (free from harm) | MEASURE 2.6, MANAGE 2.4 | | | |
| Secure and resilient against attacks | MEASURE 2.7, MANAGE 3.2 | | | |
| Accountable and transparent | MEASURE 2.8, GOVERN 2.1, GOVERN 2.3 | | | |
| Explainable and interpretable | MEASURE 2.9, MAP 2.2 | | | |
| Privacy-enhanced | MEASURE 2.10 | | | |
| Fair, with harmful bias managed | MEASURE 2.11, GOVERN 3.1 | | | |
| **Human oversight** (cross-cutting) | MAP 3.5, GOVERN 3.2 | | | |

**Subcategories excluded from the profile**

| Subcategory | Reason for exclusion | Who decides it |
|---|---|---|
| | | |

---

## 8. Summary by function

| Function | Selected subcategories | With level · no data | Minimum current level | Most frequent current level | Subcategories with a gap |
|---|---|---|---|---|---|
| GOVERN | 19 | | | | |
| MAP | 18 | | | | |
| MEASURE | 22 | | | | |
| MANAGE | 13 | | | | |
| **Total** | **72** | | | | |

---

## 9. Action plan

Actions are added to the improvement plan of the maturity report (P34 §6.6) with the same code; here they are only linked to the subcategories they close.

| Code | Subcategories | Action | Owner | Deadline | Closure criterion |
|---|---|---|---|---|---|
| AM-YYYY-NN | | | | | |
| *(illustrative example)* AM-2026-03 | MEASURE 2.11 | Apply bias tests with counterfactual pairs to all initiatives with decisions about people, with a threshold in P17. | AI Risk Owner | 31-12-2026 | Subcategory at level 3 with verified evidence in the next assessment. |

---

## 10. Quality criteria

| # | Check | Status |
|---|---|---|
| 1 | The profile is derived from a verified maturity assessment, identified in section 2. | Met · Not met · Not applicable · Pending |
| 2 | Each derived level applies the rule in 11 §7.5 with the questions in 34 §5.4; no level has been set by hand without evidence. | |
| 3 | Subcategories that were not assessed appear as "no data", not as 0. | |
| 4 | No "Own" subcategory exceeds the level of its reference dimension. | |
| 5 | The target levels are approved in C2 and proportionate to ambition and risk (11 §8). | |
| 6 | The equivalent *tier* has been calculated with the table in 11 §2.2 and is not presented as the company's CSF *tier*. | |
| 7 | Each gap has an action with an owner, deadline and closure criterion in P34 §6.6. | |

---

## 11. Approval and verification

| Function | SEVEN-G role | Name and position | Date | Signature or reference |
|---|---|---|---|---|
| Prepares the profile | AI Office | | | |
| Verifies | Independent verifier of the maturity assessment | | | |
| Approves the profile and proposes the targets | AI Committee | | | |
| Approves the target levels | Board or its board committee (C2) | | | |

Segregation of duties: whoever is responsible for a dimension does not assess its subcategories; the verifier has not taken part in the assessment.

---

## 12. Version control

**Completed document**

| Version | Date | Author | Changes |
|---|---|---|---|
| | | | |

**Template**

| Version | Date | Changes |
|---|---|---|
| 0.1 | 25-09-2026 | First version. Current and target profile of the 72 subcategories of the NIST AI RMF 1.0 on the 0–5 scale of document 11, with the level derived from the questionnaire (11 §7.5), the gap, the equivalent *tier* as a view, the seven characteristics of trustworthy AI plus human oversight and the action plan linked to P34. |
