# Exception request and register

**Processes each temporary exception to the policy or the framework with its justification, risk, compensating measures, approving body, conditions and expiry, and maintains the company's exception register.**

| | |
|---|---|
| Document | Template P40 · Exception request and register |
| Version | 0.1 (working draft) |
| Date | 19-09-2026 |
| Author | Fernando García Varela |
| Status | Draft for review. |

---

> **Legal notice and disclaimer.** SEVEN-G is a reference methodological framework provided "as is" and for information purposes only. It does not constitute legal, regulatory, financial or professional advice, nor does it guarantee compliance with any law or standard. References to general regulation (such as the EU AI Act, the GDPR, DORA or NIS2), to technical standards and to regulation specific to each sector or jurisdiction may be incomplete, may not apply to a particular case or may become out of date as a result of regulatory changes, interpretations or supervisory positions after their consultation date. **Each organisation that uses SEVEN-G is solely responsible for identifying the regulation that applies to it, verifying that it is current and certifying its own regulatory compliance**, with the appropriate qualified advice. This methodology is a generic, free aid shared with the community so that nobody has to start from scratch; each person or organisation can and should adapt it to its own use. It must not be inferred that its legally sensitive parts have been reviewed by legal counsel: those reviews, for each company or sector, are the ultimate responsibility of the company, consultant or organisation that uses it. Although every effort is made to keep it up to date, some regulation may have changed without being reflected here. To the fullest extent permitted by law, the author accepts no responsibility whatsoever for the effects of its application in any organisation or for its full applicability. The methodology does not grant certification of any kind. The author accepts no liability for any use made of this content or for any decisions taken on the basis of it. The data, figures, companies and cases in the examples are fictitious or illustrative.

> **Why it matters.** An exception is a conscious decision not to comply with a requirement for a period of time, with the risk in view and an owner. Without a request and a register, exceptions become tolerated breaches that nobody approves or monitors, and the board committee cannot receive those in force each quarter, as 30 §7.4 requires. An expired exception that has not been closed is a major nonconformity (31 §3.8).

## 1. Instructions for use

| Aspect | Guidance |
|---|---|
| **When it is used** | Before ceasing to comply with any requirement of the corporate policy, the acceptable use policy or the framework that admits an exception. Never after the event. |
| **Who completes it** | Whoever proposes according to the type (section 5): AI Product Owner, requesting area, AI Sponsor or AI Committee. The AI Office assigns the code and keeps the register. |
| **Who verifies it** | The AI Office checks admissibility and completeness; the second line assesses the risk and issues clearance where required. |
| **Who decides or approves** | The body in the delegation matrix of 30 §7.4, according to the type. Whoever proposes does not approve (30, I-9). |
| **Stage, *gate* or moment** | At any time; those in force are reviewed at each monthly meeting of the AI Committee and reported quarterly to the board committee (C4). |
| **Tool** | T01 · Initiative register (exceptions linked to initiatives and decisions, 30 §13). |
| **Reference document** | 30 §7.4 and §8.3; 31 §3.7, §3.8 and §4; 37 §3. |

Completion rules:

- Exceptions are **never** allowed for prohibited practices, legal obligations, segregation of duties at any *gate*, Enterprise multi-level sign-off or the existence of a stop mechanism (30 §7.4), or for the red lines of the corporate policy (31 §3.7).
- An exception does not replace a "Proceed with conditions" at a *gate*: if the matter is decided at a *gate*, it is dealt with in P29.
- Proposed code: **EXC-AAAA-NNN**, with the year of the request and a sequential number that is never reused, even if the request is refused.
- An extension is processed as a **new request** linked to the previous one, approved by the same body (rule proposed by this template).

---

## 2. Identification

| Field | Content | Guidance |
|---|---|---|
| Code | | EXC-AAAA-NNN. |
| Date of request | | DD-MM-AAAA. |
| Requester and area | | |
| Type of exception | | Minor methodological · Use policy · Lifecycle requirement · Corporate threshold (30 §7.4). |
| Scope | | Initiative (IA-AAAA-NNN), system (SIA-AAAA-NNN), tool, area or company. |
| Linked previous exception | | If it is an extension. |

---

## 3. Admissibility check

If any answer is Yes, the request is inadmissible and is filed with the reason.

| # | Does the exception affect…? | Yes · No |
|---|---|---|
| 1 | A practice prohibited by Article 5 of Regulation (EU) 2024/1689 or any other red line of the corporate policy. | |
| 2 | A legal or regulatory obligation. | |
| 3 | Segregation of duties at any *gate* (whoever builds verifies or decides). | |
| 4 | The Enterprise multi-level go-live sign-off. | |
| 5 | The existence of a stop mechanism (kill switch or alternative process). | |

| Field | Content |
|---|---|
| Result | Admissible · Inadmissible |
| Checked by (AI Office) and date | |

---

## 4. Request

Minimum fields of 31 §3.8.

| Field | Content | Guidance |
|---|---|---|
| Requirement affected | | Document, section and text; *gate* criterion from document 21 or SEG-NN or AG-NN control if applicable. |
| Justification | | Why it cannot be complied with now and what would be lost without the exception. |
| Risk | | What may happen while it lasts (section 6). |
| Compensating measures | | Temporary controls that reduce the risk. |
| Term requested | | Within the maximum for the type (section 5). |
| Owner | | Person accountable for the measures and for closure. |
| Closure plan | | What will be done to comply with the requirement on expiry. |
| *(illustrative example)* Requirement affected | Acceptable use policy 31 §4.2: only tools in the authorised catalogue. | Four-week pilot of an uncatalogued summarisation tool, with fictitious data only. |

---

## 5. Approving body

Matrix of 30 §7.4. The company may tighten it in C2, not lower it.

| Type | Illustrative example | Proposes | Approves | Maximum term |
|---|---|---|---|---|
| **Minor methodological** | Using an equivalent in-house template. | AI Product Owner | AI Office | Until the next *gate* |
| **Use policy** | Uncatalogued tool in a pilot with fictitious data. | Requesting area | AI Office with security clearance | 90 days |
| **Lifecycle requirement** | Postponing a non-critical piece of evidence outside a "Proceed with conditions". | Sponsor | AI Committee | 6 months |
| **Corporate threshold** | Exceeding the investment limit per stage or the return horizon set in C2. | AI Committee | Board or board committee | As resolved |

In the AI Committee, exceptions require the presence and clearance of the second line (30 §3.3 and §8.3). If the second line withholds its clearance, the committee cannot approve the exception and may escalate the disagreement to the board committee (E-13).

---

## 6. Risk assessment

Scales of the common specification §5.1 and document 33.

| Field | Content | Guidance |
|---|---|---|
| Risk during the exception | | Cause, event and consequence. |
| Likelihood and impact without measures | | 1–5 × 1–5; impact: the highest of the five axes. |
| Level without measures | | Low 1–4 · Medium 5–9 · High 10–15 · Critical 16–25. |
| Effectiveness of the compensating measures | | Existing and tested; planned measures do not reduce the level. |
| Level with measures | | |
| Second-line clearance | | Mandatory for exceptions decided by the AI Committee and for use policy exceptions (security). |
| Consistency with risk acceptance | | If the level with measures is High, only the AI Committee accepts it; if it is Critical, the exception is not approved unless the board or its board committee expressly decides so within the appetite (30 §7.2). |

---

## 7. Resolution

| Field | Content | Guidance |
|---|---|---|
| Outcome | | Approved · Approved with conditions · Refused. |
| Body and reference | | Minutes (P39) or AI Office register. |
| Conditions | | Each with an owner and a deadline. |
| Start date of validity | | |
| Expiry date | | Never later than the maximum for the type. For corporate thresholds, as resolved. |
| Reason for refusal | | Mandatory if refused. |
| Communication to the requester | | Date. |

---

## 8. Monitoring and closure

**Proposed statuses:** Requested · Inadmissible · Under assessment · Refused · In force · Closed · Expired. An exception in force whose expiry date passes without closure becomes **Expired** and a major nonconformity is recorded (31 §3.8; document 37).

| Field | Content | Guidance |
|---|---|---|
| Reviews | | Date and result of each monthly review by the AI Committee. |
| Closure date | | When the requirement is met or the excepted activity ceases. |
| Evidence of closure | | Link. |
| Nonconformity opened on expiry | | NC-AAAA-NNN, if applicable. |

---

## 9. Company exception register

| Code | Type | Scope | Requirement affected | Risk level with measures | Approved by | Reference | Start | Expiry | Owner | Status |
|---|---|---|---|---|---|---|---|---|---|---|
| EXC-AAAA-NNN | | | | Low · Medium · High | | | | | | |
| *(illustrative example)* EXC-2026-003 | Use policy | Marketing area | 31 §4.2 | Low | AI Office with security clearance | Office register 2026-11 | 02-11-2026 | 30-11-2026 | Person G | In force |

**Quarterly summary for the board committee** (incorporated into P42):

| Period | In force | Approved | Refused | Closed | Expired | With High risk |
|---|---|---|---|---|---|---|
| AAAA-Qn | | | | | | |

---

## 10. Quality criteria

| # | Check | Status |
|---|---|---|
| 1 | The request predates the excepted activity. | Met · Not met · Not applicable · Pending |
| 2 | The admissibility check has been carried out and no answer is Yes. | |
| 3 | The six minimum fields of 31 §3.8 are present. | |
| 4 | Approval is by the body in 30 §7.4 and not by whoever proposes (I-9). | |
| 5 | Second-line clearance is recorded where required. | |
| 6 | The expiry does not exceed the maximum term for the type. | |
| 7 | Exceptions in force have been reported to the board committee in the quarter. | |
| 8 | No expired exception remains without a recorded nonconformity. | |

---

## 11. Approval and verification

| Function | SEVEN-G role | Name and position | Date | Signature or reference |
|---|---|---|---|---|
| Proposes | According to the type (section 5) | | | |
| Checks admissibility and records | AI Office | | | |
| Assesses the risk and gives clearance | Second line (security, risk or compliance) | | | |
| Approves | Body in 30 §7.4 | | | |

Segregation of duties: whoever proposes does not approve; if the AI Office proposes an exception, it is approved by the AI Committee.

---

## 12. Version control

**Completed document**

| Version | Date | Author | Changes |
|---|---|---|---|
| | | | |

**Template**

| Version | Date | Changes |
|---|---|---|
| 0.1 | 19-09-2026 | First version. Applies 30 §7.4 and 31 §3.8; proposes the code EXC-AAAA-NNN, the statuses and the rule that an extension is a new request. |
