# Intensity determination

**Decides, using eight yes-or-no questions, whether the initiative is governed at Lite or Enterprise intensity, and records the justification.**

| | |
|---|---|
| Document | Template P04 · Intensity determination |
| Version | 0.1 (working draft) |
| Date | 16-09-2026 |
| Author | Fernando García · SEACHAD |
| Status | Draft for review. |

---

> **Legal notice and disclaimer.** SEVEN-G is a reference methodological framework provided "as is" and for information purposes only. It does not constitute legal, regulatory, financial or professional advice, nor does it guarantee compliance with any law or standard. References to general regulation (such as the EU AI Act, the GDPR, DORA or NIS2), to technical standards and to regulation specific to each sector or jurisdiction may be incomplete, may not apply to a particular case or may become out of date as a result of regulatory changes, interpretations or supervisory positions after their consultation date. **Each organisation that uses SEVEN-G is solely responsible for identifying the regulation that applies to it, verifying that it is current and certifying its own regulatory compliance**, with the appropriate qualified advice. The author and SEACHAD accept no liability for any use made of this content or for any decisions taken on the basis of it. The data, figures, companies and cases in the examples are fictitious or illustrative.

## 1. Instructions for use

| Aspect | Guidance |
|---|---|
| **When it is used** | In phase 0, before G0. It must be repeated at G3 and at each continuity review (R6), and whenever a fact affecting a criterion changes (01 §9.1). |
| **Who completes it** | The AI Product Owner, with the AI Risk Owner. |
| **Who verifies it** | Lite: AI Office. Enterprise: AI Auditor. If the result is Lite, verification should pay particular attention to the "No" answers. |
| **Who decides** | The result is automatic: no decision is required. The *gate* body merely checks that the answers are justified. |
| **Gate at which it is reviewed** | G0 · Authorisation, G3 · Feasibility and R6 · Continuity review. |
| **Tool** | T04 · Intensity determination (module of T01). |
| **Lite versus Enterprise** | This template is the same at both intensities, because it is the one that determines which applies. Only block 7 is **(Enterprise)**. |

Completion rules:

- **A single Enterprise criterion is enough for that intensity to apply** (01 §9.1).
- Every answer, whether "Yes" or "No", is justified with facts and, where available, with linked evidence.
- In this template, a "Pending" answer counts as "Yes" until it is resolved, with an owner and a date. This prevents progressing with less control owing to a lack of information. It is a prudential rule proposed by the template, which document 21 should confirm.
- Intensity cannot be lowered to speed up a *gate*. An initiative that meets no criterion may voluntarily apply Enterprise.

---

## 2. Identification

| Field | Content | Guidance |
|---|---|---|
| Initiative code | | IA-AAAA-NNN. |
| Initiative name | | |
| Timing of the determination | | Phase 0 · G3 · R6 · Relevant change. |
| Previously determined intensity | | Lite · Enterprise · None (first determination). |
| Document version | | |
| Date | | DD-MM-YYYY. |
| Author | | Name and role. |

---

## 3. Sources consulted

| Source | Reference | Guidance |
|---|---|---|
| Initiative charter | P01 | Scope and exposure. |
| Context and constraints statement | P02 | Data, maximum autonomy, critical function. |
| Inventory record | P05 | Technology, exposure, autonomy, regulatory role. |
| Ambition classification | P07 | Criterion 7. |
| Regulatory classification | P11 | Criterion 1 (from phase 3 onwards). |
| Investment threshold approved in C2 | Document 13 | Criterion 8. |

---

## 4. Enterprise criteria

Answer the eight questions. Reference: 01 §9.2.

| # | Criterion | Question | Answer | Justification | Evidence |
|---|---|---|---|---|---|
| 1 | High regulatory risk | Is the system classified, or are there reasonable indications that it will be classified, as high-risk under applicable regulation? | Yes · No · Pending | | P11 or preliminary analysis |
| 2 | Decisions about people | Does the output significantly influence decisions about people, such as employment, credit, insurance or access to services? | Yes · No · Pending | | |
| 3 | Direct exposure | Do customers, patients, citizens or other external persons interact directly with the system? | Yes · No · Pending | | Exposure in P05 |
| 4 | Agents capable of acting | Does the system execute actions, such as writing to systems, sending communications or making payments, without a person validating each action before it is executed (A2 or A3), and do those actions have an effect on third parties, money, personal data or production systems? | Yes · No · Pending | | Autonomy level in P05 |
| 5 | Specially protected data | Does it process special categories of personal data or critical confidential information? | Yes · No · Pending | | P02 §6 |
| 6 | Critical function | Does it support a critical or important business function, or one subject to sector-specific operational resilience regulation? | Yes · No · Pending | | |
| 7 | Transform level | Is the initiative classified as Transform? | Yes · No | | P07 |
| 8 | Investment | Does the planned investment exceed the threshold approved by the board in C2? | Yes · No · Pending | State the threshold and the estimated investment. | P01 §7 |

Guidance for the questions that raise the most doubts:

| # | Guidance |
|---|---|
| 1 | Until P11 has been completed, the answer is based on the preliminary analysis. If the system falls within a high-risk area (for example, employment, access to essential services, critical infrastructure, education or biometrics) and this has not been ruled out in a documented manner, the answer is "Pending". |
| 2 | "Significantly" includes cases in which the person deciding usually follows the system's output, even if they formally have the final say. |
| 3 | Equivalent to the exposure "Customers or external persons directly" in the taxonomy (03 §3.3). Indirect exposure does not trigger the criterion, although it must be assessed under criterion 2. |
| 4 | The answer is "Yes" when the autonomy level is A2 (Supervised action) or A3 (Autonomous action) and the actions have an effect on third parties, money, personal data or production systems (01 §9.2; autonomy levels in document 35). With A0 or A1, or with A2 or A3 without that effect, the answer is "No" and it is justified. |
| 5 | Special categories include, among others, health data, biometric data for identification purposes, ethnic origin, political opinions, religious beliefs, trade union membership, sex life or sexual orientation. Data relating to criminal convictions and offences should be treated with the same criterion. |
| 6 | For entities subject to DORA, the critical or important functions that the entity has identified are considered. |
| 8 | The total planned investment in the initiative is considered, not only the budget authorised at G0. |

---

## 5. Result

**Calculation rule:** if at least one answer is "Yes" or "Pending", the intensity is **Enterprise**. If all are "No", the intensity is **Lite**.

In a spreadsheet: `=IF(COUNTIF(answer_range,"No")=8,"Lite","Enterprise")`.

| Field | Content | Guidance |
|---|---|---|
| Number of criteria answered "Yes" | | Automatic count. |
| Number of criteria answered "Pending" | | Automatic count. |
| **Resulting intensity** | | Lite · Enterprise. |
| Criteria that determine it | | Numbers of the criteria answered "Yes" or "Pending". |
| Voluntary application of Enterprise | | Yes · No. Only if the result is Lite and the company decides to apply Enterprise. |
| Pending items to be resolved | | Criterion, owner and date. |

*(illustrative example)* Assistant for responding to customer queries about orders: criterion 3 "Yes" (customers converse with the assistant); the rest "No". Resulting intensity: **Enterprise**.

---

## 6. Consequences of the intensity

Reference: 01 §9.3 and, for verification and decision, 01 §7.5.

| Aspect | Lite | Enterprise |
|---|---|---|
| Gates | G0–G2 and G4–G5 may be grouped | All separately |
| Evidence | Simplified templates | Full templates |
| Verification | AI Office; AI Auditor by sampling | AI Auditor at all *gates* |
| Decision | Sponsor, with risk clearance at G3, G4 and G5 | AI Committee; board for Transform |
| Go-live | Risk clearance | Multi-level sign-off with veto |
| Continuity review | Half-yearly | Quarterly |
| Visibility | Aggregated board dashboard | Board dashboard by initiative |

---

## 7. Change of intensity **(Enterprise)**

Complete only if the result differs from the previous determination.

| Date | From | To | Criterion that changes | Evidence to be completed | *Gates* affected | Recorded by |
|---|---|---|---|---|---|---|
| | Lite · Enterprise | Lite · Enterprise | | | | |
| *(illustrative example)* 15-01-2027 | Lite | Enterprise | 4: automatic action on orders is added | P17 and P18 complete; multi-level sign-off at G5 | G4 and G5 separately | AI Office |

A change from Lite to Enterprise requires the evidence for the pending *gates* to be completed using the full templates. A change from Enterprise to Lite is only possible if all the criteria disappear, and it must be recorded as a classification change event (03 §3.3).

---

## 8. Quality criteria

The formal criteria are in document 21 (see criteria G0.xx, G3.xx and R6.xx).

| # | Check | Status |
|---|---|---|
| 1 | All eight questions have been answered. | Met · Not met · Not applicable · Pending |
| 2 | Each answer has a fact-based justification. | |
| 3 | The answers are consistent with P01, P02, P05, P07 and, from phase 3 onwards, with P11. | |
| 4 | The result applies the "one is enough" rule. | |
| 5 | Pending criteria have an owner and a date. | |
| 6 | If there is a change of intensity, the evidence and *gates* affected have been identified. | |

---

## 9. Approval and verification

| Function | Role in SEVEN-G | Name and position | Date | Signature or reference |
|---|---|---|---|---|
| Prepares | AI Product Owner | | | |
| Consulted | AI Risk Owner | | | |
| Verifies | AI Office (Lite) · AI Auditor (Enterprise) | | | |
| Takes note | Body that decides the *gate* | | | |

Segregation of duties: the verifier has not answered the questionnaire.

---

## 10. Version control

**Completed document**

| Version | Date | Author | Changes |
|---|---|---|---|
| | | | |

**Template**

| Version | Date | Changes |
|---|---|---|
| 0.1 | 16-09-2026 | First version. Converts the eight Enterprise criteria of 01 §9.2 into questions with an automatic result and records changes of intensity. Consistency adjustments with 01 (segregation of duties at Lite, R6 outcomes, agents criterion) and with 34 and 37. |
