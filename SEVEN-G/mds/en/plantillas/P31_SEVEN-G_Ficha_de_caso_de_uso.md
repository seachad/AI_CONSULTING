# Use case record

**Explains in one or two pages, in language that non-specialists can understand, what an AI use case is, what it is used for, what value it delivers, what risks it carries and who is accountable for it.**

| | |
|---|---|
| Document | Template P31 · Use case record |
| Version | 0.1 (working draft) |
| Date | 16-09-2026 |
| Author | Fernando García · SEACHAD |
| Status | Draft for review. |

---

> **Legal notice and disclaimer.** SEVEN-G is a reference methodological framework provided "as is" and for information purposes only. It does not constitute legal, regulatory, financial or professional advice, nor does it guarantee compliance with any law or standard. References to general regulation (such as the EU AI Act, the GDPR, DORA or NIS2), to technical standards and to regulation specific to each sector or jurisdiction may be incomplete, may not apply to a particular case or may become out of date as a result of regulatory changes, interpretations or supervisory positions after their consultation date. **Each organisation that uses SEVEN-G is solely responsible for identifying the regulation that applies to it, verifying that it is current and certifying its own regulatory compliance**, with the appropriate qualified advice. The author and SEACHAD accept no liability for any use made of this content or for any decisions taken on the basis of it. The data, figures, companies and cases in the examples are fictitious or illustrative.

## 1. Instructions for use

| Aspect | Guidance |
|---|---|
| **When it is used** | It is created in phase 1, when the opportunity is added to the portfolio, and updated at the close of each phase up to phase 7. It is the description that feeds the initiative register, the portfolio and the board dashboard. |
| **Who completes it** | AI Product Owner. |
| **Who verifies it** | AI Office, which checks above all the clarity of the language and the consistency of the data with the other evidence. |
| **At which *gate* it is reviewed** | At all of them, as a summary of the initiative (G1 to G7). |
| **Lite versus Enterprise** | Lite may omit the fields marked **(Enterprise)**. |
| **Tool** | T01 Initiative register ("plain-language description" field, 03 §3.3). |
| **Relationship** | P06 Opportunity portfolio · P07 Sphere and ambition classification · P08 Value hypothesis canvas · P12 Risk register · P17 Human oversight · P28 Value tracking · documents 10, 40 and 60. |

Rules:

- **Measurement rule 10** applies: each use case explains what it is and what it is used for, in language that non-specialists can understand (00 §6).
- Clarity test: a board member without technical training must be able to explain the use case after reading block 3. No technical acronyms or product names unless they are essential.
- Value, risk and status data **are not rewritten**: they are taken from the corresponding evidence and cited. If they differ, the verified evidence prevails.
- An initiative may include several use cases; one record is completed per use case.

---

## 2. Identification

| Field | Content | Guidance |
|---|---|---|
| Initiative code | | IA-AAAA-NNN (T01). |
| Use case | | Short name and use case number within the initiative (for example, "use case 1"). |
| AI system(s) | | Identifier in the inventory (T02), where it exists. |
| Responsible area | | |
| Record version | | |
| Author | | Role and name. |
| Update date | | DD-MM-YYYY. |
| Document status | | Draft · Submitted for verification · Verified · Approved · Superseded. |

---

## 3. What it is and what it is used for

| Field | Content | Guidance |
|---|---|---|
| In one sentence | | What it does, for whom and with what result. Maximum 30 words. |
| Problem or opportunity | | What happens today and why it matters to the business. |
| How it was done before | | Current process or alternative without AI. |
| What changes with AI | | What the system does and what the person continues to do. |
| Who uses it | | Users. |
| Who it affects | | Customers, employees or other people who receive the effect. |
| What the system decides and what a person decides | | Autonomy level A0 · A1 · A2 · A3 and, in one line, what is never delegated (P17). |
| What it does not do | | Limits that should be made clear to avoid mistaken expectations. |

Example *(illustrative example)*:

| Field | Content |
|---|---|
| In one sentence | An assistant reads customer complaints, classifies them and proposes a first response that a case handler reviews before sending it. |
| Problem or opportunity | Complaints take an average of six days to receive a first response and dissatisfied customers leave the service. |
| How it was done before | A case handler read each complaint, looked up the customer's history and drafted the response from scratch. |
| What changes with AI | The system prepares the classification, the summary of the history and a draft; the case handler checks, corrects and decides. |
| Who uses it | Forty case handlers in the customer service area. |
| Who it affects | Customers who submit complaints. |
| What the system decides and what a person decides | A1 · Recommendation. No response is sent without the case handler's validation; the refusal of compensation is never delegated. |
| What it does not do | It does not decide on compensation or respond to the customer on its own. |

---

## 4. Classification

| Field | Content | Guidance |
|---|---|---|
| Primary sphere | | 01 Customer · 02 Product and service · 03 People · 04 Operations · 05 Data · 06 Knowledge · 07 Decision · 08 Regulation, ethics and accountability · 09 AI governance. |
| Secondary sphere | | Same list, or none. |
| Ambition level | | Optimise · Augment · Transform. Indicate proposed (phase 1), confirmed (phase 2) and actual (phase 7). |
| Intensity | | Lite · Enterprise. |
| Regulatory classification | | Prohibited · High risk · Transparency obligations · Minimal risk · Out of scope · Pending classification. |
| Technology | | Predictive ML · Generative AI · Agent · Language and document processing · Vision · Optimisation · Embedded third-party AI · Rules (not AI). |
| Exposure | | Internal · Employees · Customers indirectly · Customers or external persons directly. |
| Value type | | Efficiency · Return · Avoided risk · Compliance. |

Answers to the five ambition questions (00 §5.2):

| # | Question | Yes · No |
|---|---|---|
| 1 | Does it change the value proposition received by the customer or end user? | |
| 2 | Is the process redesigned end to end, and not just a task? | |
| 3 | Do roles, organisational structure or who makes which decisions change? | |
| 4 | Does it generate revenue, services or markets that did not exist before? | |
| 5 | Could it be retired without affecting the business model, simply returning to the previous cost? | |

---

## 5. Value

Annual amounts in euros, taken from P08 (expected) or P28 (realised). **Status:** Validated · Declared · Estimated.

| Item | Type (Efficiencies · Return · Recurring cost) | Formula | Annual amount (€) | Status | Source |
|---|---|---|---|---|---|
| | | | | | |
| | | | | | |
| **Annual net value = efficiencies + return − recurring cost** | | | | | |

| Field | Content | Guidance |
|---|---|---|
| Expected or realised? | | Expected (hypothesis) · Realised (production). |
| Proportion of validated value | | Only if realised. |
| Investment (€) | | Made and pending. |
| Additional net value per additional euro invested **(Enterprise)** | | Expected additional annual net value ÷ additional investment required. |
| Released capacity | | Hours and destination (realised · reassigned · pending). Reported separately and not counted. |
| Unquantified value | | Avoided risk or compliance not translated into money; if a data point is missing, "No data". |

---

## 6. Main risks

Maximum five, taken from P12. **Residual level:** Low · Medium · High · Critical.

| Risk (in plain language) | Typical risk (RT-XXX-NN), if applicable | Residual level | Main control | Owner |
|---|---|---|---|---|
| The draft proposes an incorrect response and the case handler does not detect it *(illustrative example)* | Code from the catalogue in document 33 | Medium | Mandatory review and weekly sampling of responses sent | AI Operations Owner |
| | | | | |
| | | | | |

---

## 7. Owners

| Role | Name | Area |
|---|---|---|
| AI Sponsor | | |
| AI Product Owner | | |
| AI Technical Owner | | |
| AI Operations Owner | | |
| AI Risk Owner | | |
| Assigned AI Auditor **(Enterprise)** | | |

---

## 8. Status

| Field | Content | Guidance |
|---|---|---|
| Current phase | | 0 to 7. |
| Status | | Registered · In phase · Awaiting gate · On hold · In production · Awaiting G7 · Stopped · Retired (03 §3.2). |
| Last *gate* and outcome | | For example, G3 · Proceed with conditions · date (P29). |
| Open conditions | | Number and nearest expiry. |
| Open incidents and nonconformities **(Enterprise)** | | INC and NC codes. |
| Next milestone | | What and when. |

---

## 9. Quality criteria

Consistency with the evidence is checked against the criteria in document 21 for the current *gate*.

| # | Check | Status (Met · Not met · Not applicable · Pending) |
|---|---|---|
| 1 | Block 3 can be understood without technical knowledge and contains no unexplained acronyms. | |
| 2 | The classification uses the values of the controlled taxonomy. | |
| 3 | The answers to the five questions are consistent with the ambition level. | |
| 4 | The amounts match P08 or P28 and have a type, formula and status. | |
| 5 | Released capacity is shown separately. | |
| 6 | The risks and the status match P12 and P29. | |
| 7 | The record is up to date as of the close of the last phase. | |

---

## 10. Approval and verification

| Function | Role | Name | Date | Signature or reference |
|---|---|---|---|---|
| Author | AI Product Owner | | | |
| Verifier | AI Office | | | |
| Endorsement | AI Sponsor | | | |

Segregation of duties: the verifier is not part of the team that builds.

---

## 11. Version control

| Version | Date | Changes |
|---|---|---|
| 0.1 | 16-09-2026 | First version of the template. |
