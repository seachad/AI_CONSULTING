# ISO/IEC 42001 statement of applicability

**Records, for each control in Annex A of ISO/IEC 42001, whether it applies to the company, why, where SEVEN-G covers it, with what evidence and its implementation status.**

| | |
|---|---|
| Document | Template P74 · ISO/IEC 42001 statement of applicability |
| Version | 0.1 (working draft) |
| Date | 25-09-2026 |
| Author | Fernando García Varela |
| Status | Draft for review. It must be reviewed by legal counsel or an ISO/IEC 42001 auditor before it is offered to a company. |

---

> **Legal notice and disclaimer.** SEVEN-G is a reference methodological framework provided "as is" and for information purposes only. It does not constitute legal, regulatory, financial or professional advice, nor does it guarantee compliance with any law or standard. References to general regulation (such as the EU AI Act, the GDPR, DORA or NIS2), to technical standards and to regulation specific to each sector or jurisdiction may be incomplete, may not apply to a particular case or may become out of date as a result of regulatory changes, interpretations or supervisory positions after their consultation date. **Each organisation that uses SEVEN-G is solely responsible for identifying the regulation that applies to it, verifying that it is current and certifying its own regulatory compliance**, with the appropriate qualified advice. The author accepts no liability for any use made of this content or for any decisions taken on the basis of it. The data, figures, companies and cases in the examples are fictitious or illustrative.

> **Warnings for this template.** (1) **It does not reproduce the standard**: it identifies the Annex A controls by their code only and summarises their topic in its own terms; the company's statement **must be checked against the text of ISO/IEC 42001 purchased** by the company (34 §4.2). (2) **SEVEN-G does not certify**, and this template does not evidence conformity with the standard (01 §14; document 93): certification of an AI management system can only be issued by an accredited certification body (38 §12). (3) The NIST AI RMF subcategories column is indicative: SEVEN-G proposes it on the basis of 34 §5.4 and of the AIRC crosswalk between the AI RMF and ISO/IEC 42001, prepared on the final draft of the standard.

> **Why it matters.** ISO/IEC 42001 requires the organisation to state which controls it applies, which it excludes and why (clause 6.1.3). This is the piece that turns "aligned with 42001" into something an auditor can verify: without it, the company cannot show that the treatment of its AI risks is complete or prepare for certification. Basing it on SEVEN-G avoids building a second evidence system: each control points to the template, document or tool where the company already keeps the proof.

## 1. Instructions for use

| Aspect | Guidance |
|---|---|
| **When it is used** | In **C2 · Direction**, when the scope of the AI management system is defined, and whenever that scope, risk treatment or controls change; it is reviewed in **C5**. Only if the company uses ISO/IEC 42001 as a reference or aims to be certified. |
| **Who completes it** | The AI Office with the AI Risk Owner, who propose the applicability and the justification of each control. |
| **Who verifies it** | The AI Auditor or the third line, who checks the evidence and the implementation status (38 §12.1). A certification audit, where applicable, is carried out by the accredited body. |
| **Who decides or approves** | Senior management approves the statement, as part of the risk treatment in clause 6.1.3; the AI Committee and the board committee are informed. |
| **Stage of the corporate cycle** | C2 (approval), C4 (monitoring of implementation status) and C5 (review). |
| **Tool** | It has no application of its own in version 0.x. The status of the evidence comes from the initiative register (T01), *gate* verification (T03) and the records cited in each row. |
| **Reference document** | Document 34 §4 (ISO/IEC 42001: clauses 4 to 10 and Annex A by group) and §5.4 (AI RMF profile); document 38 §12 (relationship with ISO/IEC 42001 and with certification). |
| **Lite versus Enterprise** | The statement is the same. In Lite scope, evidence may be grouped by process instead of by initiative. |

Completion rules:

- **Applicable**: Yes · No. Excluding a control requires a specific justification (for example, the company does not develop systems and only uses them); "it does not affect us" is not a justification.
- **Implementation status**: Implemented · Partly implemented · Planned · Not started. "Implemented" requires evidence that exists, is approved and is applied at the date of the statement, with the same criterion as 11 §4.5.
- The "Where SEVEN-G covers it" column is proposed; the company adjusts it to its actual implementation and its own procedures.
- A cell with no data is left blank: a control is never considered implemented without evidence.

---

## 2. Identification

| Field | Content | Guidance |
|---|---|---|
| Organisation and scope of the AI management system | | The approved scope (clause 4.3): units, systems, processes and role regarding AI (provider, deployer, user). |
| Edition of the standard checked | | ISO/IEC 42001:2023 or a later one; the company states that it has checked the statement against the purchased text. |
| Statement identifier and version | | Proposed format DA-YYYY-NN. |
| Date | | DD-MM-YYYY. |
| Owner of the statement | | AI Office. |
| Reference risk assessment and treatment plan | | Document 33; P12 and P13 of the initiatives; P35 (risk appetite). |
| Reference AI RMF profile, if any | | P73, with its cut-off date. |

---

## 3. Statement by Annex A control

One row per control. The topic is our own summary of the control's objective; the binding text is that of the standard.

| Control | Topic (own summary) | Applicable | Justification | Where SEVEN-G covers it | Evidence | Implementation status | Related AI RMF subcategories (indicative) |
|---|---|---|---|---|---|---|---|
| A.2.2 | Documented AI policy | | | Document 31; 13 §15; P35 | | | GOVERN 1.1, GOVERN 1.2 |
| A.2.3 | Consistency of the AI policy with other policies | | | Documents 31 and 35; 01 §13 | | | GOVERN 1.2, MEASURE 2.7, MEASURE 2.10 |
| A.2.4 | Periodic review of the AI policy | | | C5; P37 | | | GOVERN 1.5 |
| A.3.2 | Roles and responsibilities for AI | | | 01 §8; document 30; P03, P38 | | | GOVERN 2.1, GOVERN 3.2 |
| A.3.3 | Channel for reporting concerns | | | Document 31; document 37 | | | GOVERN 4.3, MEASURE 3.3 |
| A.4.2 | Documentation of the resources of each system | | | P10, P15 | | | GOVERN 1.6, MAP 2.1 |
| A.4.3 | Data resources | | | P16, P64; document 51 | | | GOVERN 1.6, MAP 2.3 |
| A.4.4 | Tooling resources | | | P15, P54; document 53 | | | GOVERN 1.6, MANAGE 3.2 |
| A.4.5 | System and computing resources | | | P15, P63; document 42 | | | GOVERN 1.6, MEASURE 2.12 |
| A.4.6 | People and competences | | | P03, P20, P45; document 50 | | | GOVERN 3.1, MAP 3.4 |
| A.5.2 | Impact assessment process | | | P11; 32 §6 | | | MAP 1.1, MAP 5.1 |
| A.5.3 | Documentation of impact assessments | | | P11, P47, P48 | | | MAP 5.1, MANAGE 1.4 |
| A.5.4 | Impact on individuals and groups | | | P11, P48 | | | MAP 5.1, MEASURE 2.11 |
| A.5.5 | Impact on society | | | P11, P48 | | | MAP 5.1, MEASURE 2.12 |
| A.6.1.2 | Objectives for responsible development | | | Documents 20 and 53; 01 §3 | | | GOVERN 1.2, GOVERN 4.1 |
| A.6.1.3 | Responsible design and development processes | | | Documents 20, 21 and 53; P29 | | | MAP 2.3, MANAGE 1.1 |
| A.6.2.2 | System requirements and specification | | | P01, P15, P17 | | | MAP 1.4, MAP 1.6 |
| A.6.2.3 | Documentation of design and development | | | P15, P16; document 53 | | | MAP 2.1 |
| A.6.2.4 | Verification and validation | | | P22; G5 | | | MEASURE 2.1, MEASURE 2.5 |
| A.6.2.5 | Deployment | | | P21, P23; G5 | | | MEASURE 2.5, MANAGE 1.1 |
| A.6.2.6 | Operation and monitoring | | | P24, P25; document 52; R6 | | | MEASURE 2.4, MANAGE 4.1 |
| A.6.2.7 | Technical documentation | | | P15, P21; document 53 | | | MAP 2.2, MEASURE 2.9 |
| A.6.2.8 | Recording of system events | | | P25; AG-10; 34 §3.7 | | | MEASURE 2.4 |
| A.7.2 | Data for developing and enhancing the system | | | P16, P64; document 51 | | | MAP 2.3 |
| A.7.3 | Acquisition of data | | | P14, P64; document 51 | | | MAP 2.3, MEASURE 2.10 |
| A.7.4 | Data quality | | | P16; document 51 | | | MAP 2.3, MEASURE 2.3 |
| A.7.5 | Data provenance | | | P16; SEG-08 | | | MAP 2.3, MEASURE 2.9 |
| A.7.6 | Data preparation | | | P16; document 51 | | | MAP 2.3 |
| A.8.2 | Documentation and information for users | | | P17, P24, P49 | | | MAP 2.2, MEASURE 2.9 |
| A.8.3 | External reporting | | | P51; document 60 | | | GOVERN 5.1, MEASURE 3.3 |
| A.8.4 | Communication of incidents | | | P26, P51; document 37 | | | GOVERN 4.3, MANAGE 4.3 |
| A.8.5 | Information for interested parties | | | P46, P49; document 60 | | | GOVERN 4.2, MANAGE 4.3 |
| A.9.2 | Responsible use processes | | | Document 31; P43 | | | GOVERN 4.1, MANAGE 1.1 |
| A.9.3 | Responsible use objectives | | | Document 31; P17 | | | GOVERN 1.2, MAP 2.2 |
| A.9.4 | Intended use of the system | | | P01, P17, P49 | | | MAP 1.4, MANAGE 2.4 |
| A.10.2 | Allocation of responsibilities with third parties | | | Document 36; P56 | | | GOVERN 6.1, MANAGE 3.1 |
| A.10.3 | Suppliers | | | Document 36; P14, P55, P57 | | | GOVERN 6.1, GOVERN 6.2 |
| A.10.4 | Customers | | | P49, P56; 34 §3.8 | | | GOVERN 5.1, MANAGE 4.1 |
| *(illustrative example)* A.10.3 | Suppliers | Yes | The company integrates two third-party models into customer service processes. | Document 36; P14, P55, P57 | P14 assessments of both suppliers (03-2026) and current P57 register. | Partly implemented | GOVERN 6.1, GOVERN 6.2 |

### 3.1 Additional controls

Clause 6.1.3 allows controls from other sources to be added. If the company applies SEVEN-G controls with no direct equivalent in Annex A (for example, the AG agent controls of document 35), it declares them here.

| Additional control | Source | Why it is added | Evidence | Implementation status |
|---|---|---|---|---|
| | | | | |
| *(illustrative example)* AG-09 · Kill switch | Document 35 §7 | The company operates agents with A2 autonomy. | Kill switch tests in P19 and P24. | Implemented |

---

## 4. Summary

| Item | Number | Guidance |
|---|---|---|
| Annex A controls declared | 38 | If the edition checked has a different number of controls, the table is adjusted and this is stated here. |
| Applicable | | |
| Excluded, with justification | | Each exclusion has a specific justification. |
| Implemented · partly · planned · not started | | Only for applicable controls. |
| Additional controls | | Section 3.1. |
| Open actions to complete implementation | | With owner and deadline, in the treatment plan (P13) or in the improvement plan of the maturity report (P34 §6.6). |

---

## 5. Quality criteria

| # | Check | Status |
|---|---|---|
| 1 | The company has checked the statement against the purchased text of ISO/IEC 42001 and states so in section 2. | Met · Not met · Not applicable · Pending |
| 2 | All Annex A controls of the edition checked appear in the table, without reproducing the text of the standard. | |
| 3 | Each exclusion has a specific justification, consistent with the scope of the management system and with the risk assessment. | |
| 4 | Each control marked "Implemented" has evidence that exists, is approved and is applied at the date of the statement. | |
| 5 | The statement is consistent with the risk treatment plan (P13) and with the AI RMF profile (P73), if any. | |
| 6 | No text of the statement claims that the company is certified or that SEVEN-G certifies conformity. | |

---

## 6. Approval and verification

| Function | SEVEN-G role | Name and position | Date | Signature or reference |
|---|---|---|---|---|
| Prepares the statement | AI Office with the AI Risk Owner | | | |
| Verifies evidence and status | AI Auditor or third line | | | |
| Approves | Senior management | | | |
| Receives | AI Committee and board committee | | | |

Segregation of duties: whoever prepares the statement does not verify it; the AI Auditor does not verify controls whose implementation they have led.

---

## 7. Version control

**Completed document**

| Version | Date | Author | Changes |
|---|---|---|---|
| | | | |

**Template**

| Version | Date | Changes |
|---|---|---|
| 0.1 | 25-09-2026 | First version. Statement of applicability of the 38 controls in Annex A of ISO/IEC 42001:2023, identified by their code and with the topic summarised in our own terms, with the proposed coverage in SEVEN-G and the related NIST AI RMF subcategories (indicative). Pending review by legal counsel or an ISO/IEC 42001 auditor. |
