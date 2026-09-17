# Opportunity portfolio and screening notes

**Records the opportunities identified by the business, the non-AI alternatives considered and the reason why each opportunity proceeds, is held or is discarded.**

| | |
|---|---|
| Document | Template P06 · Opportunity portfolio and screening notes |
| Version | 0.1 (working draft) |
| Date | 16-09-2026 |
| Author | Fernando García · SEACHAD |
| Status | Draft for review. |

---

> **Legal notice and disclaimer.** SEVEN-G is a reference methodological framework provided "as is" and for information purposes only. It does not constitute legal, regulatory, financial or professional advice, nor does it guarantee compliance with any law or standard. References to general regulation (such as the EU AI Act, the GDPR, DORA or NIS2), to technical standards and to regulation specific to each sector or jurisdiction may be incomplete, may not apply to a particular case or may become out of date as a result of regulatory changes, interpretations or supervisory positions after their consultation date. **Each organisation that uses SEVEN-G is solely responsible for identifying the regulation that applies to it, verifying that it is current and certifying its own regulatory compliance**, with the appropriate qualified advice. The author and SEACHAD accept no liability for any use made of this content or for any decisions taken on the basis of it. The data, figures, companies and cases in the examples are fictitious or illustrative.

## 1. Instructions for use

| Aspect | Guidance |
|---|---|
| **When it is used** | In phase 1 (Opportunity discovery), after G0 and before G1. |
| **Who completes it** | The AI Product Owner, with the business area. They consult the technical owner (data and preliminary feasibility) and the risk owner (red lines). |
| **Who verifies it** | Lite: AI Office. Enterprise: AI Auditor. |
| **Who decides** | Lite: sponsor. Enterprise: sponsor, informing the AI Committee. |
| **Gate at which it is reviewed** | G1 · Opportunity. |
| **Tool** | T01 · Initiative register (opportunities that proceed are linked to the initiative). |
| **Lite versus Enterprise** | Lite may omit the fields and blocks marked **(Enterprise)**. Screening and non-AI alternatives are mandatory in both. |

Completion rules:

- Opportunities start from a **business need**, not from an available technology.
- Every opportunity that proceeds must have compared **non-AI alternatives** (01 §6.3).
- Value in this phase is an **estimated order of magnitude**. Quantification with a formula is done in P08.
- Discarded opportunities are kept with their reason: they are learning for the portfolio.

---

## 2. Identification

| Field | Content | Guidance |
|---|---|---|
| Initiative code | | IA-AAAA-NNN. |
| Initiative name | | |
| Document version | | |
| Date | | DD-MM-AAAA. |
| Author | | Name and role. |
| Applicable intensity | | Lite · Enterprise. |

---

## 3. Discovery method

| Field | Content | Guidance |
|---|---|---|
| Scope analysed | | Processes, decisions or customer experiences reviewed. |
| Method | | Interviews, workshops, process data analysis, complaints, employee suggestions, other. |
| Period | | Dates of the discovery work. |
| Participants | | Areas and functions that have taken part. |
| Data sources consulted **(Enterprise)** | | Reports, indicators or samples used for sizing. |

---

## 4. Screening criteria

Each opportunity is checked against these criteria. A "No" answer in F1, F3 or F6 prevents the opportunity from proceeding.

| Code | Criterion | Question | Blocking |
|---|---|---|---|
| F1 | Business need | Does it respond to an identifiable business problem or opportunity, with an area that takes ownership of it? | Yes |
| F2 | Strategic fit | Does it fit with the AI thesis and with the ambition approved for the sphere in C2? | No, but it must be justified |
| F3 | Contribution of AI | Does AI provide something that non-AI alternatives do not? | Yes |
| F4 | Plausible value | Does the order of magnitude of the value justify formulating a hypothesis? | No, but it must be justified |
| F5 | Data | Does the necessary data exist, or can it be obtained lawfully and within a reasonable time? | No, but it must be justified |
| F6 | Red lines | Does it respect the red lines in P02, the corporate policy and the practices prohibited by regulation? | Yes |
| F7 | Capacity | Is there sponsorship and capacity to take it on within the planned timeframe? | No, but it must be justified |

---

## 5. Opportunity register

### 5.1 Description

| ID | Opportunity | Business need | Process or decision | Area | Proposed sphere | Proposed ambition | Value type |
|---|---|---|---|---|---|---|---|
| OP-01 | | | | | | Optimise · Augment · Transform | Efficiency · Return · Avoided risk · Compliance |
| OP-02 | | | | | | | |
| *(illustrative example)* OP-01 | Assistant for responding to order queries | Slow response in peak season | Handling of order status queries | Customer service | 01 Customer | Optimise | Efficiency |
| *(illustrative example)* OP-02 | Personalised delivery date recommendation | Lost sales due to generic delivery times | Delivery time offered at purchase | E-commerce | 02 Product and service | Augment | Return |

The sphere uses the list in 03 §3.3. The proposed ambition is justified with P07.

### 5.2 Screening

| ID | F1 | F2 | F3 | F4 | F5 | F6 | F7 | Annual value (order of magnitude, estimated) | Result | Reason |
|---|---|---|---|---|---|---|---|---|---|---|
| OP-01 | Yes · No | | | | | | | | Proceeds · On reserve · Discarded | |
| OP-02 | | | | | | | | | | |
| *(illustrative example)* OP-01 | Yes | Yes | Yes | Yes | Yes | Yes | Yes | €50,000–100,000 | Proceeds | — |
| *(illustrative example)* OP-02 | Yes | Yes | Yes | No data | No | Yes | Yes | No data | On reserve | Insufficient data |

Possible results:

- **Proceeds**: moves on to formulating the value hypothesis (phase 2).
- **On reserve**: meets the blocking criteria, but a condition is missing (data, capacity, priority). State what must change and when to review it.
- **Discarded**: does not proceed. The reason is taken from the coded list in 03 §3.3: No plausible value · Hypothesis refuted · Insufficient data · Technically unfeasible · Cost exceeds value · Unacceptable risk · Regulation · No adoption · Replaced by another solution · Change in strategic priority.

---

## 6. Non-AI alternatives

For each opportunity that proceeds or is placed on reserve.

| ID | Alternative | Description | Estimated cost | Estimated value | Why it is or is not sufficient | Decision |
|---|---|---|---|---|---|---|
| | Process redesign · Business rules · Automation without AI · Training · Policy change · Standard non-AI solution · Do nothing | | | | | Discarded · Combined with AI · Replaces AI |
| *(illustrative example)* OP-01 | Automation without AI | Automatic message with the order status extracted from the logistics system. | Low | Resolves simple status queries | Does not resolve queries involving issues or open questions. | Combined with AI: automatic first response and assistant for the rest. |
| *(illustrative example)* OP-01 | Do nothing | Keep the current model with external reinforcement in peak season. | Current cost | — | Rising cost and response times outside target. | Discarded |

If a non-AI alternative achieves an equivalent result at lower cost or risk, the opportunity is discarded with the reason "Replaced by another solution".

---

## 7. Screening notes

One note for each opportunity that proceeds.

| Field | Content | Guidance |
|---|---|---|
| Opportunity ID | | |
| Decision summary | | Why it proceeds, in three to five lines. |
| What AI contributes | | What the alternatives do not achieve. |
| Main assumptions | | Facts taken as true when estimating the value. |
| Uncertainties that phase 2 must resolve | | Specific questions for the value hypothesis and the baseline. |
| Data required | | Sources, availability and known constraints. |
| Preliminary risks | | Risks worth anticipating for phase 3. |
| Proposed sphere and ambition | | Reference to P07 ("Proposed" column). |

---

## 8. Prioritisation **(Enterprise)**

When several opportunities proceed and there is not capacity for all of them.

| ID | Value (order of magnitude) | Investment (order of magnitude) | Complexity | Preliminary risk | Strategic fit | Priority | Justification |
|---|---|---|---|---|---|---|---|
| | | | Low · Medium · High | Low · Medium · High | Low · Medium · High | 1, 2, 3… | |

In this phase prioritisation is qualitative. The additional net value per additional euro invested (rule 9) is calculated once P08 and P10 exist.

---

## 9. Quality criteria

The formal G1 criteria are in document 21 (see criteria G1.xx).

| # | Check | Status |
|---|---|---|
| 1 | Each opportunity arises from a business need with a responsible area. | Met · Not met · Not applicable · Pending |
| 2 | All opportunities have a screening result. | |
| 3 | Discarded opportunities have a coded reason. | |
| 4 | Those that proceed have compared at least one non-AI alternative, in addition to "do nothing". | |
| 5 | Those that proceed have a screening note with uncertainties for phase 2. | |
| 6 | Proposed sphere and ambition use the taxonomy and are consistent with P07. | |
| 7 | Amounts are presented as an estimated order of magnitude and "no data" is shown as such. | |

---

## 10. Approval and verification

| Function | Role in SEVEN-G | Name and position | Date | Signature or reference |
|---|---|---|---|---|
| Prepares | AI Product Owner | | | |
| Verifies | AI Office (Lite) · AI Auditor (Enterprise) | | | |
| Decides | AI Sponsor (in Enterprise, informing the AI Committee) | | | |

Segregation of duties: the verifier has not taken part in the screening. The decision is recorded in P29.

---

## 11. Version control

**Completed document**

| Version | Date | Author | Changes |
|---|---|---|---|
| | | | |

**Template**

| Version | Date | Changes |
|---|---|---|
| 0.1 | 16-09-2026 | First version. Structure aligned with 01 §6.3 and with the coded reasons in 03 §3.3. |
