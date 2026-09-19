# Fundamental rights impact assessment

**Documents the fundamental rights impact assessment that the AI Act requires of certain deployers of high-risk systems before first use, and prepares its notification to the market surveillance authority.**

| | |
|---|---|
| Document | Template P48 · Fundamental rights impact assessment |
| Version | 0.1 (working draft) |
| Date | 19-09-2026 |
| Author | Fernando García · SEACHAD |
| Status | Draft for review. |

> *This template does not constitute legal advice.* References consulted in September 2026; the obligation applies with the high-risk obligations of Annex III (2-12-2027 following Regulation (EU) 2026/1744). Verify that they are current (document 34 §3.1 and §3.10).

---

> **Legal notice and disclaimer.** SEVEN-G is a reference methodological framework provided "as is" and for information purposes only. It does not constitute legal, regulatory, financial or professional advice, nor does it guarantee compliance with any law or standard. References to general regulation (such as the EU AI Act, the GDPR, DORA or NIS2), to technical standards and to regulation specific to each sector or jurisdiction may be incomplete, may not apply to a particular case or may become out of date as a result of regulatory changes, interpretations or supervisory positions after their consultation date. **Each organisation that uses SEVEN-G is solely responsible for identifying the regulation that applies to it, verifying that it is current and certifying its own regulatory compliance**, with the appropriate qualified advice. The author and SEACHAD accept no liability for any use made of this content or for any decisions taken on the basis of it. The data, figures, companies and cases in the examples are fictitious or illustrative.

> **Why it matters.** A high-risk system that decides on credit, insurance or access to public services can harm entire groups without any economic indicator showing it. This assessment requires the company to describe, before first use, the processes in which the system will be used, whom it affects, what harm it may cause and what the company will do if that harm materialises; without it the system cannot lawfully be deployed in the cases where it is mandatory and *gate* G5 cannot be passed. Carried out from the design stage, it also avoids late redesigns.

## 1. Instructions for use

| Aspect | Guidance |
|---|---|
| **When it is used** | It is opened when P11 §9.2 concludes that the assessment is **Required**, or **Recommended** and the company decides to carry it out. It is prepared in phase 3, updated in phase 4 with the design, notified before G5 and reviewed in phase 5, at every R6 and whenever any of its elements changes (Article 27.2). |
| **Who completes it** | The AI Risk Owner, with the second line (legal counsel and compliance) and the AI Product Owner (34 §3.10). The business area that will use the system describes the processes. |
| **Who verifies it** | Lite: AI Office or AI Auditor. Enterprise: AI Auditor. In practice, high-risk systems are always Enterprise. |
| **Who decides or approves** | AI Committee; acceptance of the residual risk, according to P12 §6. |
| **Gate or moment** | G3 · Feasibility (determined and started, G3.09); G4 · Design (completed and measures in the design, G4.13); G5 · Go-live (notified, G5.15); R6 (current, R6.08). |
| **Tool** | T07 · Regulatory classifier (status, date, link and notification date, 32 §3.5). |
| **Reference document** | 32 §6.2, 34 §3.10 and §8.2, document 33 (risk scales), document 50 §8 (decisions about people). |
| **Lite versus Enterprise** | When it is mandatory, all its content is mandatory. Every Enterprise initiative with decisions about people **should** apply this content even if not obliged to (34 §3.10); in that voluntary use it may omit section 10. |

Completion rules:

- **One assessment per high-risk system and per use.** If the same system (SIA-AAAA-NNN) is used in different processes, all of them are described.
- The assessment focuses on the **affected persons and groups**, not on the company. It relies on the information that the provider supplies with the instructions for use.
- **It complements, without duplicating,** the data protection impact assessment (P47): what is already recorded there is referenced (section 11).
- The AI Act provides for a European AI Office questionnaire for the notification: at the consultation date, the European AI Office template is pending confirmation (34 §3.10). When it becomes available, it is the notification format; **this SEVEN-G template does not replace it**: it serves to prepare the content, integrate it into the initiative lifecycle and keep internal traceability.
- Voluntary use: it may rely on ISO/IEC 42005:2025 (32 §6.2).

---

## 2. Identification

| Field | Content | Guidance |
|---|---|---|
| Initiative code | | IA-AAAA-NNN. |
| System code and name | | SIA-AAAA-NNN from P05 (T02). |
| System provider | | Internal or third party (P14). |
| Intended purpose | | Copy from P05 and P11. |
| Classification and Annex III point | | From P11 §6.2 (for example, 5.b or 5.c). |
| Company role | | Deployer (and, where applicable, also provider). |
| Reference to P11 | | Version and date. |
| Reference to P47 | | If there is a DPIA of the same processing. |
| Document version | | |
| Date | | DD-MM-AAAA. |
| Status | | Draft · Submitted for verification · Approved · Notified · Under review · Superseded. |

---

## 3. Applicability

| Question | Answer | Justification |
|---|---|---|
| Is the system high-risk under Article 6.2 (Annex III) and not under point 2 (critical infrastructure)? | Yes · No | |
| Is the company a body governed by public law or a private entity providing public services? | | |
| Is the system in Annex III, point 5, letter b) (creditworthiness or credit score) or letter c) (risk assessment and pricing in life and health insurance)? | | |
| **Result** | Mandatory · Voluntary · Not applicable | Mandatory if the first answer is "Yes" and either of the other two is also "Yes". |
| Date from which it is required | | With the Annex III obligations. SEVEN-G recommends carrying it out from the design stage (32 §6.2). |

---

## 4. Processes in which the system will be used (Article 27.1.a)

| Field | Content | Guidance |
|---|---|---|
| Deployer's processes | | Description of each process in business language, in line with the intended purpose. |
| Decisions the system supports or takes | | What it decides, what it recommends and what a person validates (P17 §5). |
| Autonomy level | | A0–A3. |
| Excluded uses | | Uses that are not permitted even if the system could perform them. |

---

## 5. Period and frequency of use (Article 27.1.b)

| Field | Content | Guidance |
|---|---|---|
| Planned date of first use | | Date of G5. |
| Period of use | | Indefinite with review at R6, or end date. |
| Frequency | | Continuous, daily, on request, per campaign. |
| Volume | | Decisions or persons assessed per period (order of magnitude). |

---

## 6. Affected persons and groups (Article 27.1.c)

| Category of persons or group | How the system affects them | Approximate volume | Vulnerable group? | Guidance |
|---|---|---|---|---|
| | | | Yes · No | By age, disability, economic or social situation, or other. |
| | | | | |
| *(illustrative example)* Applicants for personal loans | Their score determines approval and price | Around 40,000 applications a year | Yes: people with a short credit history | |

---

## 7. Specific risks of harm (Article 27.1.d)

Take into account the information provided by the provider (instructions for use) and assess with the **common scale** (document 33): **Level = Likelihood × Impact**; Low 1–4 · Medium 5–9 · High 10–15 · Critical 16–25. The dominant axis will usually be "People and rights". Risks of Medium level or above are carried over to P12.

| No. | Risk of harm (cause, event and consequence) | Affected group | Right or interest affected | Inh. L | Inh. I | Inherent level | Measures (sections 8 and 9) | Residual level | Code in P12 |
|---|---|---|---|---|---|---|---|---|---|
| F01 | | | | 1–5 | 1–5 | | | | IA-AAAA-NNN · Rnn |
| F02 | | | | | | | | | |
| *(illustrative example)* F01 | Variables that act as proxies for origin or age cause one group to receive lower scores and to be refused credit or charged more for it. | Applicants with a short credit history | Non-discrimination; access to essential services | 3 | 4 | 12 High | Exclusion of proxy variables (P16); bias testing before the pilot and in production (P22, P25); human review of refusals (P17) | 6 Medium | IA-2026-021 · R02 |

---

## 8. Human oversight measures (Article 27.1.e)

In accordance with the provider's instructions for use and the design in P17.

| Field | Content | Guidance |
|---|---|---|
| Oversight modes | | Prior validation · Real-time oversight · Sample-based ex post review · Aggregate oversight (P17 §6). |
| People who exercise oversight | | Role, competence, training and authority (Article 26.2; P20). |
| Ability not to use, override or stop the system | | P17 §7; kill switch (P18, P19). |
| Consistency with the provider's instructions for use | | What the provider requires and how it is met. |

---

## 9. Measures if the risks materialise (Article 27.1.f)

| Field | Content | Guidance |
|---|---|---|
| Internal governance | | Who decides to suspend or limit use, escalation and time limits (P26, document 30). |
| Complaint mechanisms | | Channel, internal response time and reviewing role (P17 §8; P49). |
| Explanation of individual decisions | | How requests are handled (Article 86; P49). |
| Redress for affected persons | | Review of decisions already taken, correction and communication. |
| Information to the provider and the authorities | | Monitoring and reporting of serious incidents (Article 26.5; P26, P27). |

---

## 10. Notification to the market surveillance authority (Article 27.3)

| Field | Content | Guidance |
|---|---|---|
| Competent authority | | Identified in P11 (AESIA or sector authority; 34 §8.2). |
| Format used | | The template provided by the European AI Office, when available; in the meantime, the one indicated by the authority. |
| Notification date | | Before G5 (P23). |
| Reference or acknowledgement | | |
| Update notifications | | Date and reason for each update notified. |

---

## 11. Relationship with the data protection impact assessment (P47)

| Element | Already recorded in P47? | Reference or complement in this assessment |
|---|---|---|
| Description of the processing and the data | Yes · No | |
| Data protection risks | | |
| Risks to other rights (non-discrimination, access to services, effective remedy, others) | | Only in this assessment. |
| Common measures | | |

---

## 12. Conclusion and review

| Field | Content | Guidance |
|---|---|---|
| Highest residual level | | From section 7. |
| Conclusion | | The system may be deployed · May be deployed with conditions · May not be deployed. |
| Conditions | | Measures that must be verified before G5. |
| Acceptance of the residual risk | | Body according to P12 §6. A Critical residual without approval from the board or its board committee blocks G3 and G5. |
| Next review | | Next R6 or change of process, group, frequency, provider or instructions for use (Article 27.2; P27). |

| Date | Reason | Changes | Residual level | Is the update notified? | Reviewed by |
|---|---|---|---|---|---|
| | Phase 5 · R6 · Change · Incident | | | Yes · No | |

---

## 13. Quality criteria

The formal criteria are in document 21 (G3.09, G4.13, G5.15 and R6.08).

| # | Check | Status |
|---|---|---|
| 1 | Applicability matches P11 §9.2 and is justified. | Met · Not met · Not applicable · Pending |
| 2 | The six elements of Article 27.1 are present: processes, period and frequency, affected persons, risks, human oversight and measures if risks materialise. | |
| 3 | The provider's information and instructions for use have been used. | |
| 4 | Risks are assessed with the common scale and those of Medium level or above are in P12. | |
| 5 | There is an operational complaint mechanism and explanation channel (P17, P49). | |
| 6 | The DPIA (P47) is reused without duplicating it. | |
| 7 | The notification to the authority is recorded before G5, with date and reference. | |
| 8 | It is current at the latest R6 and updates are notified. | |

---

## 14. Approval and verification

| Function | Role in SEVEN-G | Name and position | Date | Signature or reference |
|---|---|---|---|---|
| Coordinates and prepares | AI Risk Owner | | | |
| Describes processes and oversight | AI Product Owner and business area | | | |
| Validates legally | Second line (legal counsel or compliance) | | | |
| Consulted | Data protection officer | | | |
| Verifies | AI Auditor | | | |
| Approves | AI Committee; acceptance of the residual according to P12 §6 | | | |
| ☐ Statement: "The organisation confirms that this assessment has been carried out with qualified advice and accepts responsibility for it; SEVEN-G is only a methodological reference." | Same body that approves | | | |

Segregation of duties: whoever prepares the assessment does not verify it; the area that will use the system does not accept its residual risk.

---

## 15. Version control

**Completed document**

| Version | Date | Author | Changes |
|---|---|---|---|
| | | | |

**Template**

| Version | Date | Changes |
|---|---|---|
| 0.1 | 19-09-2026 | First version. Develops the assessment that P11 §9.2 declares necessary, with the elements of Article 27 set out in 32 §6.2 and 34 §3.10, the notification to the authority and the link with P47 and P12. References consulted in September 2026. |
