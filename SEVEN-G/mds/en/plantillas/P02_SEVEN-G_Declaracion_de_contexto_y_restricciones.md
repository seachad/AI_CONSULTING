# Context and constraints statement

**Records in writing, before investing, the strategic, regulatory, ethical, data, economic and organisational framework within which the initiative must be developed.**

| | |
|---|---|
| Document | Template P02 · Context and constraints statement |
| Version | 0.1 (working draft) |
| Date | 16-09-2026 |
| Author | Fernando García Varela |
| Status | Draft for review. |

---

> **Legal notice and disclaimer.** SEVEN-G is a reference methodological framework provided "as is" and for information purposes only. It does not constitute legal, regulatory, financial or professional advice, nor does it guarantee compliance with any law or standard. References to general regulation (such as the EU AI Act, the GDPR, DORA or NIS2), to technical standards and to regulation specific to each sector or jurisdiction may be incomplete, may not apply to a particular case or may become out of date as a result of regulatory changes, interpretations or supervisory positions after their consultation date. **Each organisation that uses SEVEN-G is solely responsible for identifying the regulation that applies to it, verifying that it is current and certifying its own regulatory compliance**, with the appropriate qualified advice. This methodology is a generic, free aid shared with the community so that nobody has to start from scratch; each person or organisation can and should adapt it to its own use. It must not be inferred that its legally sensitive parts have been reviewed by legal counsel: those reviews, for each company or sector, are the ultimate responsibility of the company, consultant or organisation that uses it. Although every effort is made to keep it up to date, some regulation may have changed without being reflected here. To the fullest extent permitted by law, the author accepts no responsibility whatsoever for the effects of its application in any organisation or for its full applicability. The methodology does not grant certification of any kind. The author accepts no liability for any use made of this content or for any decisions taken on the basis of it. The data, figures, companies and cases in the examples are fictitious or illustrative.

## 1. Instructions for use

| Aspect | Guidance |
|---|---|
| **When it is used** | In phase 0, together with the initiative charter (P01). It is reviewed at G3 and whenever a relevant constraint changes (regulation, budget, supplier, data). |
| **Who completes it** | The AI Product Owner. They consult the risk owner, data protection, information security and legal counsel. |
| **Who verifies it** | Lite: AI Office. Enterprise: AI Auditor. |
| **Who decides** | It is approved with G0: sponsor (Lite) · AI Committee (Enterprise). |
| **Gate at which it is reviewed** | G0 · Authorisation; checked again at G3 · Feasibility. |
| **Tool** | T01 · Initiative register (link as G0 evidence). |
| **Lite versus Enterprise** | Lite may omit the fields marked **(Enterprise)**. In Lite, constraints that do not apply are marked "Not applicable" with a one-line reason. |

Completion rules:

- A constraint is something the initiative **cannot change**. If it can be negotiated, it is an assumption and goes in section 10.
- This statement does not replace the regulatory classification (P11) or the risk matrix (P12): it identifies what is known in phase 0 so that it is not discovered late.
- *This document does not constitute legal advice.* The applicability of each regulation must be confirmed by whoever has legal competence in the company. Regulatory references consulted in September 2026; their currency must be verified.

---

## 2. Identification

| Field | Content | Guidance |
|---|---|---|
| Initiative code | | IA-AAAA-NNN. |
| Initiative name | | Same as in P01. |
| Document version | | |
| Date | | DD-MM-AAAA. |
| Author | | Name and role. |
| People consulted | | Second-line functions and legal counsel consulted, with date. |
| Applicable intensity | | Lite · Enterprise (P04). |

---

## 3. Strategic context

| Field | Content | Guidance |
|---|---|---|
| Applicable AI thesis | | Extract from or reference to the thesis approved in C2 that supports the initiative. |
| Ambition approved for the sphere | | Ambition level set by the board in C2 for the primary sphere. |
| Applicable risk appetite | | C2 limits affecting this initiative: acceptable residual risk level, maximum autonomy, customer exposure, economic thresholds. |
| Current state of the process | | How it is done today, with what resources and with what known problems. |
| Existing initiatives or systems | | Other AI systems in the inventory that already cover part of the process. |
| Return horizon set in C2 **(Enterprise)** | | Period within which the expected net value must be positive for Optimise and Augment. |

---

## 4. Regulatory constraints

State for each reference whether it applies. "To be determined" requires it to be resolved before G3.

| Reference | Does it apply? | Reason | Implication for the initiative | Who confirms it |
|---|---|---|---|---|
| EU AI Act (Regulation (EU) 2024/1689) | Yes · No · To be determined | | Classification and obligations according to the company's role (P11). | |
| GDPR (Regulation (EU) 2016/679) and national data protection legislation | | | Legal basis, minimisation, data protection impact assessment, automated decision-making. | |
| DORA (Regulation (EU) 2022/2554) | | Only financial entities within its scope. | ICT third-party risk, incidents, critical or important functions. | |
| NIS2 (Directive (EU) 2022/2555) and its national transposition | | Essential or important entities. | Cybersecurity risk management and incident notification. | |
| Sector regulation | | Supervisors and sector rules. | | |
| Employment legislation | | If the system affects working conditions, access to employment or the evaluation of workers. | Information to the workers' legal representatives (in Spain, Article 64.4.d of the Workers' Statute). | |
| Consumer protection, advertising and distance contracts | | If there is interaction with customers. | Pre-contractual information, commercial practices, complaints. | |
| Intellectual property and trade secrets **(Enterprise)** | | Use of third-party content or content generation. | Licences for data and outputs. | |
| Accessibility **(Enterprise)** | | Products or services covered by Directive (EU) 2019/882 on accessibility requirements (in Spain, Law 11/2023). | | |
| Internal rules | | Corporate AI and acceptable use policy (document 31), security, data protection, procurement. | | |

---

## 5. Ethical and usage constraints

| Field | Content | Guidance |
|---|---|---|
| Applicable corporate principles | | Principles of the corporate AI policy that shape the design. |
| Non-permitted uses | | Uses expressly prohibited by the company, in addition to the practices prohibited by regulation. |
| Vulnerable persons or groups | | Minors, older people, persons with disabilities, situations of financial hardship. |
| Minimum human oversight required | | Which decisions must always remain in the hands of a person. |
| Maximum autonomy permitted | | A0 Assistance · A1 Recommendation · A2 Supervised action · A3 Autonomous action (document 35). |
| Red lines | | What the initiative will not do under any circumstances. *Illustrative example: the assistant will not modify orders or issue refunds.* |

---

## 6. Data constraints

| Field | Content | Guidance |
|---|---|---|
| Planned data sources | | Systems, files or suppliers. |
| Personal data | | Yes · No. If yes, categories of data subjects. |
| Special categories or specially protected data | | Yes · No · To be determined. If yes, it triggers Enterprise criterion 5 in P04. |
| Critical confidential information | | Trade secrets, inside information, customer data subject to secrecy. |
| Legal basis and purpose | | Reference to the record of processing activities. Use compatible with the original purpose. |
| Location and international transfers | | Where the data will be processed and whether it leaves the European Economic Area. |
| Use of data by suppliers | | Whether the supplier may use data or prompts to train or improve its models. It must be prohibited or regulated by contract. |
| Known quality | | Quality, completeness or bias problems already known. |
| Retention and deletion **(Enterprise)** | | Retention periods for inputs, outputs and logs. |

---

## 7. Budgetary and time constraints

| Field | Content | Guidance |
|---|---|---|
| Maximum budget | | Authorised cap and review point (consistent with P01). |
| Recurring cost constraints | | Maximum acceptable annual cost in operation. |
| External deadlines | | Regulatory, contractual or business dates that cannot be moved. |
| Change windows | | Periods during which deployments cannot be made (closings, campaigns). |

---

## 8. Technological and third-party constraints

| Field | Content | Guidance |
|---|---|---|
| Corporate architecture and platforms | | Mandatory or excluded platforms. |
| Approved suppliers | | Whether the company requires already approved suppliers or a specific procurement process. |
| Security requirements | | Information classification, identity and access requirements, permitted environments. |
| Dependency and substitutability **(Enterprise)** | | Limits on concentration in one supplier; requirement for an exit plan. |
| Critical or important functions **(Enterprise)** | | Whether the system will support a critical function, with the corresponding resilience requirements. |

---

## 9. Organisational and people constraints

| Field | Content | Guidance |
|---|---|---|
| Available capacity | | People and time commitment the area can contribute. |
| Expected effect on work | | Tasks, roles or jobs that could change. |
| Training and AI literacy | | Level of knowledge required for users and supervisors. |
| Labour relations | | Obligations to inform or consult workers' representatives. |
| Languages, channels and accessibility | | Usage requirements for internal or external users. |

---

## 10. Assumptions and open questions

| No. | Assumption or open question | Effect if it proves false | Owner | Deadline | Status |
|---|---|---|---|---|---|
| 1 | | | | | Open · Resolved |
| 2 | | | | | |
| *(illustrative example)* | The customer service platform supplier allows the use of conversations for training to be disabled. | The supplier would have to be changed or data anonymised before sending. | Technical owner | Before G3 | Open |

---

## 11. Quality criteria

The formal G0 and G3 criteria are in document 21 (see criteria G0.xx and G3.xx).

| # | Check | Status |
|---|---|---|
| 1 | All regulatory references have an answer; those marked "To be determined" have an owner and a date before G3. | Met · Not met · Not applicable · Pending |
| 2 | The data constraints identify personal data, special categories and transfers. | |
| 3 | The maximum autonomy permitted and the decisions that are not delegated are declared. | |
| 4 | The red lines are specific and verifiable. | |
| 5 | The economic limits are consistent with P01. | |
| 6 | The second-line functions consulted and the date are recorded. | |
| 7 | Assumptions are kept separate from constraints. | |
| 8 | The document has an author, date and version, and existed before the *gate* was requested. | |

---

## 12. Approval and verification

| Function | Role in SEVEN-G | Name and position | Date | Signature or reference |
|---|---|---|---|---|
| Prepares | AI Product Owner | | | |
| Consulted | AI Risk Owner · data protection · security · legal counsel | | | |
| Verifies | AI Office (Lite) · AI Auditor (Enterprise) | | | |
| Decides | AI Sponsor (Lite) · AI Committee (Enterprise), with G0 | | | |

Segregation of duties: consulting the second line is not equivalent to verification. The verifier has not prepared the document.

---

## 13. Version control

**Completed document**

| Version | Date | Author | Changes |
|---|---|---|---|
| | | | |

**Template**

| Version | Date | Changes |
|---|---|---|
| 0.1 | 16-09-2026 | First version. Structure aligned with 01 §6.2 and §13. |
