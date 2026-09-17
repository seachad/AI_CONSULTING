# AI system inventory record

**Registers and keeps up to date each AI system in the company's inventory, with its type of use, classification, regulatory role and owners.**

| | |
|---|---|
| Document | Template P05 · AI system inventory record |
| Version | 0.1 (working draft) |
| Date | 16-09-2026 |
| Author | Fernando García · SEACHAD |
| Status | Draft for review. |

---

> **Legal notice and disclaimer.** SEVEN-G is a reference methodological framework provided "as is" and for information purposes only. It does not constitute legal, regulatory, financial or professional advice, nor does it guarantee compliance with any law or standard. References to general regulation (such as the EU AI Act, the GDPR, DORA or NIS2), to technical standards and to regulation specific to each sector or jurisdiction may be incomplete, may not apply to a particular case or may become out of date as a result of regulatory changes, interpretations or supervisory positions after their consultation date. **Each organisation that uses SEVEN-G is solely responsible for identifying the regulation that applies to it, verifying that it is current and certifying its own regulatory compliance**, with the appropriate qualified advice. The author and SEACHAD accept no liability for any use made of this content or for any decisions taken on the basis of it. The data, figures, companies and cases in the examples are fictitious or illustrative.

## 1. Instructions for use

| Aspect | Guidance |
|---|---|
| **When it is used** | In phase 0 the planned system is registered. It is completed in phases 3 to 5, updated at each R6 and at each relevant change, and closed on retirement. It is also used in C1 to inventory existing systems, corporate use of general-purpose AI and detected unauthorised uses. |
| **Who completes it** | The AI Product Owner (or the head of the user area for corporate use). The AI Office maintains the inventory. |
| **Who verifies it** | Lite: AI Office. Enterprise: AI Auditor. |
| **Who decides** | It is not a decision: it is a record. Registration is mandatory evidence for G0. |
| **Gate at which it is reviewed** | G0 (registration), G3 (full classification), G5 (production data), R6 (currency) and G7 (retirement). |
| **Tool** | T02 · AI system inventory (module of T01). Detailed structure in document 32. |
| **Lite versus Enterprise** | Lite may omit the fields marked **(Enterprise)**. The controlled taxonomy tags are mandatory in both. |

Completion rules:

- **One record per AI system.** An initiative may have several systems and a system may serve several initiatives.
- The classification fields use the controlled taxonomy of 03 §3.3 **verbatim**.
- "No data" is not zero: anything not yet known is marked "no data" with the phase in which it will be completed.

---

## 2. Record identification

| Field | Content | Guidance |
|---|---|---|
| System code | | Persistent code assigned by the inventory in accordance with document 32. |
| System name | | Functional name, not the commercial name of the product. |
| Linked initiatives | | IA-AAAA-NNN codes. Empty only for corporate use or unauthorised use. |
| Record version | | |
| Inventory registration date | | DD-MM-AAAA. |
| Last update date | | DD-MM-AAAA. |
| Author of the last update | | Name and role. |

---

## 3. Description

| Field | Content | Guidance |
|---|---|---|
| Understandable description | | What it does and what it is used for, in language for non-specialists (rule 10). |
| Intended purpose | | Specific use for which the system is designed or acquired, with its limits. It is the basis of the regulatory classification. |
| Unintended or excluded uses | | Uses that must not be made of the system. |
| User area | | |
| Users | | Profiles and approximate number. |
| System status | | Planned · In construction or integration · In pilot · In production · Suspended · Retired. Proposed list, to be confirmed in document 32. |
| Initiative phase and status | | Phase 0–7 and status (03 §3.2): Registered · In phase · Awaiting gate · On hold · In production · Awaiting G7 · Stopped · Retired. |
| Go-live date | | |

---

## 4. Type of use and classification

| Field | Content | Guidance |
|---|---|---|
| Type of AI use | | AI initiative · Third-party AI embedded in processes · Corporate use of general-purpose AI · Unauthorised use (01 §1.2). |
| Primary sphere | | 01 Customer · 02 Product and service · 03 People · 04 Operations · 05 Data · 06 Knowledge · 07 Decision · 08 Regulation, ethics and accountability · 09 AI governance |
| Secondary sphere | | Same list or "none". |
| Ambition level | | Optimise · Augment · Transform. |
| Intensity | | Lite · Enterprise (P04). |
| Technology | | Predictive ML · Generative AI · Agent · Language and document processing · Vision · Optimisation · Embedded third-party AI · Rules (not AI). More than one may be marked. |
| Exposure | | Internal · Employees · Customers indirectly · Customers or external persons directly. |
| Autonomy level | | A0 Assistance · A1 Recommendation · A2 Supervised action · A3 Autonomous action. |
| Regulatory classification | | Prohibited · High risk · Transparency obligations · Minimal risk · Out of scope · Pending classification (P11). |
| Value type | | Efficiency · Return · Avoided risk · Compliance. |

If the technology is "Rules (not AI)", the reason is documented and it is assessed whether it should remain in the inventory.

---

## 5. Company role under the EU AI Act

Mark all the roles that apply. The final determination is validated in P11 with legal judgement. *This document does not constitute legal advice.*

| Role | Does it apply? | Justification | Guidance |
|---|---|---|---|
| Provider | Yes · No | | Develops the system, or has it developed, and places it on the market or puts it into service under its own name or trademark, including for its own use. |
| Deployer | Yes · No | | Uses an AI system under its authority in the course of a professional activity. |
| Importer | Yes · No | | Places on the Union market a system bearing the name or trademark of a person established outside the Union. |
| Distributor | Yes · No | | Makes the system available on the market without being the provider or the importer. |
| Authorised representative **(Enterprise)** | Yes · No | | Mandate from a provider established outside the Union. |
| Product manufacturer **(Enterprise)** | Yes · No | | Integrates the system into its own product subject to harmonisation legislation. |

| Field | Content | Guidance |
|---|---|---|
| Possible change of role to provider | | Yes · No. Check whether the company puts its name or trademark on it, substantially modifies the system or changes its intended purpose. |
| Underlying general-purpose AI model | | Yes · No. If yes, provider, model and version. |
| Registration in the EU database **(Enterprise)** | | Yes · No · Not applicable. Only for the systems and roles that require it according to P11. |

---

## 6. Data

| Field | Content | Guidance |
|---|---|---|
| Data sources | | Source systems or suppliers. |
| Personal data | | Yes · No. Categories of data subjects. |
| Special categories | | Yes · No. Which. |
| Critical confidential information | | Yes · No. |
| Reference to the record of processing activities | | Processing activity into which it is integrated. |
| Processing location | | Country or region of hosting and processing. |
| International transfers | | Yes · No. Destination and safeguard. |
| Use of data by the supplier for training | | Prohibited by contract · Permitted with conditions · No data. |
| Log retention **(Enterprise)** | | Which inputs, outputs and logs are retained and for how long. |

---

## 7. Suppliers and components

| Supplier | Service or component | Requirement level | Contract | Assessment |
|---|---|---|---|---|
| | | N1 Standard · N2 Enhanced · N3 Critical | Reference and expiry | P14 and date |
| *(illustrative example)* Supplier X | Language model via API | N2 Enhanced | CT-0000, expires 30-06-2028 | P14 of 10-11-2026, Conformant with observations |

---

## 8. Owners

| Role | Person and position |
|---|---|
| AI Product Owner | |
| AI Technical Owner | |
| AI Operations Owner | |
| AI Risk Owner | |
| Business owner of the system **(Enterprise)** | |

For corporate use of general-purpose AI, at least the service owner and the risk owner are stated.

---

## 9. Compliance and control

| Field | Content | Guidance |
|---|---|---|
| Validated regulatory classification | | Date of P11 and person with legal judgement who validates it. |
| Data protection impact assessment | | Carried out (date) · Not required (reason) · Pending. |
| Fundamental rights impact assessment | | Carried out (date) · Not required (reason) · Pending. |
| Transparency obligations implemented | | What information is provided and where. |
| Human oversight | | Summary and reference to P17. |
| Main residual risk level | | Low · Medium · High · Critical (P12). |
| Open nonconformities | | NC-AAAA-NNN codes. |
| Incidents in the last 12 months **(Enterprise)** | | INC-AAAA-NNN codes and severity S1–S4. |
| Last and next continuity review | | R6 dates. |

---

## 10. Unauthorised use

Complete only if the type of use is "Unauthorised use".

| Field | Content | Guidance |
|---|---|---|
| Date and means of detection | | Technical controls, audit, internal report. |
| Tool and users | | Tool used, areas and approximate number of users. |
| Data that may have been exposed | | Type of data entered. |
| Associated nonconformity | | NC-AAAA-NNN. |
| Regularisation decision | | Authorisation · Replacement · Blocking. |
| Closure date | | |

---

## 11. Retirement

| Field | Content | Guidance |
|---|---|---|
| Retirement date | | |
| Reason | | No plausible value · Hypothesis refuted · Insufficient data · Technically unfeasible · Cost exceeds value · Unacceptable risk · Regulation · No adoption · Replaced by another solution · Change in strategic priority. |
| Replacement | | System or process that replaces it. |
| Treatment of data and models | | Deletion, retention or transfer. Reference to P30. |

---

## 12. Quality criteria

The formal criteria are in document 21 (see criteria G0.xx and R6.xx) and the inventory details in document 32.

| # | Check | Status |
|---|---|---|
| 1 | There is a record for each system in the initiative. | Met · Not met · Not applicable · Pending |
| 2 | The tags use the controlled taxonomy verbatim. | |
| 3 | The intended purpose is specific and has limits. | |
| 4 | The regulatory role is justified and consistent with P11. | |
| 5 | Personal data, special categories and transfers are identified. | |
| 6 | Suppliers have a requirement level and a linked assessment. | |
| 7 | Assigned owners are consistent with P03. | |
| 8 | The last update date is later than the last relevant change. | |

---

## 13. Approval and verification

| Function | Role in SEVEN-G | Name and position | Date | Signature or reference |
|---|---|---|---|---|
| Prepares | AI Product Owner | | | |
| Records in the inventory | AI Office | | | |
| Verifies | AI Office (Lite) · AI Auditor (Enterprise) | | | |

Segregation of duties: if the AI Office has prepared the record, the AI Auditor or the risk owner verifies it.

---

## 14. Version control

**Completed document**

| Version | Date | Author | Changes |
|---|---|---|---|
| | | | |

**Template**

| Version | Date | Changes |
|---|---|---|
| 0.1 | 16-09-2026 | First version. Fields consistent with 03 §3.3 and §4, the four types of use in 01 §1.2 and the roles under the EU AI Act. |
