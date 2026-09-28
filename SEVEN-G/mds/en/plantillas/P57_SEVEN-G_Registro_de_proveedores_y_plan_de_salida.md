# Supplier register and exit plan

**Maintains the company's register of AI suppliers, documents their periodic reviews and prepares, tests and closes the exit from each supplier with verified portability and certified deletion.**

| | |
|---|---|
| Document | Template P57 · Supplier register and exit plan |
| Version | 0.1 (working draft) |
| Date | 19-09-2026 |
| Author | Fernando García Varela |
| Status | Draft for review. |

---

> **Legal notice and disclaimer.** SEVEN-G is a reference methodological framework provided "as is" and for information purposes only. It does not constitute legal, regulatory, financial or professional advice, nor does it guarantee compliance with any law or standard. References to general regulation (such as the EU AI Act, the GDPR, DORA or NIS2), to technical standards and to regulation specific to each sector or jurisdiction may be incomplete, may not apply to a particular case or may become out of date as a result of regulatory changes, interpretations or supervisory positions after their consultation date. **Each organisation that uses SEVEN-G is solely responsible for identifying the regulation that applies to it, verifying that it is current and certifying its own regulatory compliance**, with the appropriate qualified advice. This methodology is a generic, free aid shared with the community so that nobody has to start from scratch; each person or organisation can and should adapt it to its own use. It must not be inferred that its legally sensitive parts have been reviewed by legal counsel: those reviews, for each company or sector, are the ultimate responsibility of the company, consultant or organisation that uses it. Although every effort is made to keep it up to date, some regulation may have changed without being reflected here. To the fullest extent permitted by law, the author accepts no responsibility whatsoever for the effects of its application in any organisation or for its full applicability. The methodology does not grant certification of any kind. The author accepts no liability for any use made of this content or for any decisions taken on the basis of it. The data, figures, companies and cases in the examples are fictitious or illustrative.

> **Why it matters.** Dependency on a supplier is measured across all systems, not just one (36 §2, principle 6), and the exit is planned before entering, not at termination (principle 3). Without a single register, nobody knows how many systems and how much value depend on the same supplier, which reviews are overdue or which contracts lack key clauses; and without a tested exit plan, replacing a supplier in a critical function becomes unfeasible in time or cost (RT-TER-01, RT-TER-05, RT-TER-07).

## 1. Instructions for use

| Aspect | Guidance |
|---|---|
| **When it is used** | Living company-level register. Each supplier–service relationship is registered at stage 1 of the supplier lifecycle (36 §5) and updated at each stage. Review minutes follow the frequency for the level; the exit plan is documented during integration (phases 4–5), tested according to the level and activated at stage 6 (phase 7). The concentration view is reviewed in C3 and reported in C4. |
| **Who completes it** | Procurement maintains the register (36 §11); the relationship manager and the AI Operations Owner, the reviews; the AI Technical Owner, the exit plan and the portability test; legal, the contractual closure and the deletion certificate. |
| **Who verifies it** | The AI Office checks that the register is complete and reviews are up to date; the AI Auditor verifies at G3, G5 and G7 that the assessment, the contract and the exit match the level (36 §11). |
| **Who decides or approves** | Approval of the supplier according to the level (36 §4.2). Concentration limits and acceptance of High third-party risks: AI Committee (36 §7.2). Quarterly report to the board or its board committee (36 §10). |
| **Stage, *gate* or moment** | C3 and C4 (concentration) · G3 (G3.20) · G5 (G5.20: supplier in the register) · R6 (R6.12) · G7 (G7.12: certified deletion and revocation of access). |
| **Tool** | T09 · AI supplier register, a module of T01 built on the *Supplier* entity of the common data model (03 §4). This template is its working format and uses the same fields (36 §9). |
| **Reference document** | Document 36 §4.2 (requirements by level), §5 (supplier lifecycle), §6.2 (DORA), §7 (dependency, portability and concentration), §9 (fields) and §10 (indicators). |
| **Lite versus Enterprise** | The register is single for the company. The depth of the review and of the exit depends on the N1–N3 level; fields marked **(Enterprise)** may be omitted for N1 suppliers. |

Completion rules:

- **Each supplier–service relationship is a record**, with code PRV-AAAA-NNN. The same supplier may have different levels for different services (36 §4.1).
- Exit by level (36 §4.2): N1, guaranteed data export; N2, documented exit plan; N3, exit plan with an identified alternative and a documented rehearsal or test, and a portability test at least once a year or before renewal (36 §7.1).
- Review by level (36 §4.2): N1 annual; N2 half-yearly with service indicators; N3 quarterly, with monthly indicators and a relationship governance meeting.
- If the company is subject to DORA, T09 feeds the register of information under Art. 28(3) (36 §6.2).
- *This document does not constitute legal advice.*

---

## 2. Register identification

| Field | Content | Guidance |
|---|---|---|
| Company or perimeter | | Entity or group to which it applies. |
| Register owner | | Procurement, with the AI Office. |
| Cut-off date | | DD-MM-AAAA. |
| Applicable concentration limits | | Approved in C2 (document 13). |
| Subject to DORA | | Yes · No. |
| Document version | | |

---

## 3. Supplier register (T09)

### 3.1 Identification and service

| Code | Legal name · group · country | Type of third party (36 §1.1) | Service (plain-language description) | Models and versions | Type of sourcing | Systems and initiatives | Relationship manager |
|---|---|---|---|---|---|---|---|
| PRV-AAAA-NNN | | | | | Build on · Buy · Adapt · Partner | SIA-AAAA-NNN · IA-AAAA-NNN | |
| *(illustrative example)* PRV-2026-003 | Supplier Alfa, S.A. (fictitious) · Alfa Group · Ireland | Model provider | Language model via programming interface for the enquiries assistant | General model, version pinned 2026-06 | Build on | SIA-2026-007 · IA-2026-012 | Technical owner in the customer area |

### 3.2 Classification and data

| Code | Criticality | Data | Autonomy | Substitutability | Level | Critical or important function | Regulatory role (supplier · company) | Personal data | Location and transfer safeguard | Retention | Use for training |
|---|---|---|---|---|---|---|---|---|---|---|---|
| | N1 · N2 · N3 | N1 · N2 · N3 | N1 · N2 · N3 | N1 · N2 · N3 | The highest | Yes · No | | Yes · No | | | Excluded · Authorised · Unverified |
| *(illustrative example)* PRV-2026-003 | N2 | N2 | N1 | N2 | N2 | No | Provider of a general-purpose AI model · deployer | Yes | EU; no transfers | 30 days | Excluded |

### 3.3 Contract and assessment

| Code | Contract reference | Start · renewal · end | Notice period | Status of the 16 clauses (P56 §3) | Due diligence (P55 · P14): date and result | Certifications and reports and validity | Security assessment | Conditions imposed | DORA register of information |
|---|---|---|---|---|---|---|---|---|---|
| | | | | Present · partial · absent (numbers) | | | | | Yes · No · Not applicable |
| *(illustrative example)* PRV-2026-003 | Contract 2026/044 (fictitious) | 01-11-2026 · 01-11-2027 · — | 90 days | 14 present; partial: 8; absent: 11 | 10-10-2026 · Conformant with observations | ISO/IEC 27001 until 03-2028 | Document-based, conformant | Configuration screenshot before G5 | Not applicable |

### 3.4 Risk, monitoring, dependency and status

| Code | Linked risks (T06) | Main residual level | Service indicators | Attributable incidents | Model changes notified | Last · next review | Estimated substitutability | Identified alternative | Exit plan (test date) | Dependent portfolio value | Status |
|---|---|---|---|---|---|---|---|---|---|---|---|
| | RT-TER-NN · IA-AAAA-NNN · Rnn | Low · Medium · High · Critical | | INC-AAAA-NNN | | | | | Yes · No | | Under assessment · Approved · Approved with conditions · Rejected · Exiting · Terminated |
| *(illustrative example)* PRV-2026-003 | RT-TER-01, RT-TER-03 | Medium | Availability 99.8 % | None | 1 (evaluated before taking effect) | 15-01-2027 · 15-07-2027 | 6 months | Supplier Beta (fictitious) | Yes (no test; N2) | 8 % of validated value | Approved with conditions |

### 3.5 Sub-processors **(Enterprise)**

| PRV code | Sub-processor | Location | Function | Does it subcontract a critical function? | Common to other N2 or N3 suppliers? |
|---|---|---|---|---|---|
| | | | | Yes · No | Yes · No |

### 3.6 History

| Date | PRV code | Event | Author | Reason |
|---|---|---|---|---|
| | | Registration · Level change · Review · Trigger · Incident · Status change · Exit | | |

---

## 4. Portfolio concentration and dependency

Indicators from 36 §7.2, measured at portfolio level (33 §10). When a limit is exceeded, the AI Committee decides between diversifying, strengthening the exit or accepting the risk (33 §7).

| Indicator | Value per supplier | Approved limit (C2) | Situation | AI Committee decision |
|---|---|---|---|---|
| Systems in production per model provider and platform provider | | | Within · Exceeded | |
| Dependent value (proportion of validated value) | | | | |
| Dependent critical or important functions | | | | |
| N3 suppliers without a tested exit (number and age) | | | | |
| Sub-processors common to several N2 or N3 suppliers | | | | |

Quarterly report to the board or its board committee (36 §10): concentration, N3 suppliers without a tested exit, S1 and S2 incidents attributable to third parties and acceptances of High-level third-party risks.

---

## 5. Periodic supplier review minutes

One per review and per relationship (36 §5, stage 5). Frequency according to the level (section 1).

| Field | Content | Guidance |
|---|---|---|
| PRV code and supplier | | |
| Date and type of review | | Periodic · Triggered · Prior to renewal. |
| Attendees | | Relationship manager, AI Operations Owner and, at N3, supplier representatives (relationship governance meeting). |
| Service indicators for the period | | Against the levels in clause 9. |
| Attributable incidents | | INC-AAAA-NNN and severity. |
| Model changes, versions and deprecations | | Were they notified and evaluated before taking effect? |
| Changes of sub-processors or location | | |
| Contract compliance | | Clauses breached or partially met. |
| New AI features (embedded AI) | | Review of updates and configuration (36 §8.1, step 6). |
| Reassessment triggers | | Change of model or major version · change of sub-processors or location · S1 or S2 incident · change of ownership · change of use or autonomy · new regulatory obligation · deterioration in indicators · notice of a model's deprecation (36 §5). |
| Level reassessment | | Maintained · Changes to N*n* (update P14 and, where appropriate, P55). |
| Conclusion | | Proceed · Proceed with conditions · Activate the exit plan. |

| # | Agreement or action | Owner | Deadline | Status |
|---|---|---|---|---|
| | | | | Open · Met · Expired |
| *(illustrative example)* 1 | Evaluate the announced new version with the in-house evaluation set before it takes effect | AI Technical Owner | 30-06-2027 | Open |

---

## 6. Exit plan

One per N2 or N3 relationship (36 §4.2). It is documented during integration and reviewed at each periodic review.

### 6.1 Approach

| Field | Content | Guidance |
|---|---|---|
| PRV code and service | | |
| Activation causes | | Termination, serious breach, regulatory change, unresolved trigger, decision to retire at G7 (P30). |
| Identified alternative | | Supplier, model or in-house solution. Mandatory at N3. |
| Target replacement time | | Consistent with the substitutability for the level (36 §4.1). |
| Estimated exit cost | | Categories in document 42; included in the total cost in P10. |
| Continuity during the transition | | Contractual transition period (clause 15) and service measures. |

### 6.2 What is recovered

| Item | Export format | Owner | Checked (date) |
|---|---|---|---|
| Company data | | | |
| Configurations | | | |
| Prompts and workflows | | | |
| Logs | | | |
| Indexes, memories and knowledge bases | | | |
| In-house evaluation set and results | | | |
| Integrator documentation and knowledge **(Enterprise)** | | | |

### 6.3 Exit steps

| # | Step | Owner | Deadline | Evidence |
|---|---|---|---|---|
| 1 | Notice to the supplier and activation of the transition | Legal | | |
| 2 | Export and integrity check | AI Technical Owner | | |
| 3 | Start-up of the alternative and validation | AI Technical Owner | | P22 if there is a relevant change |
| 4 | Revocation of access, identities and credentials | AI Technical Owner | | |
| 5 | Deletion by the supplier and its sub-processors; certificate | Legal | | Section 8 |
| 6 | Closure of the relationship and lessons | Relationship manager | | Section 9 |

---

## 7. Portability test

Mandatory for N3 services at least once a year or before renewal (36 §7.1); at N2, it **should** be carried out before renewal.

| Field | Content | Guidance |
|---|---|---|
| PRV code | | |
| Test date | | |
| In-house evaluation set used | | Version and size. |
| Alternative tested | | Model or supplier. |
| Difference in results | | Quality metrics compared with the current supplier. |
| Difference in cost | | Cost per use or total annual cost. |
| Migration effort | | People, time frame and changes needed. |
| Conclusion | | Exit feasible · Feasible with conditions · Not feasible (reported to the AI Committee). |
| Next test | | |

| *(illustrative example)* | Content |
|---|---|
| Result | Quality of the alternative model 3 points lower on the evaluation set; cost 10 % lower; migration estimated at six weeks. Exit feasible with conditions: adjust prompts. |

---

## 8. Deletion certificate (model)

Starting text signed by the supplier on termination (clause 15 of P56). It must be reviewed by legal advisers.

**[The Supplier]**, represented by **[name and position]**, certifies that on **[date]** it irreversibly deleted the Company Data relating to contract **[reference]**, including Inputs, Outputs, logs, indexes, memories and backups, in its systems and in those of its Sub-processors **[list]**, by means of **[method]**, except for data it must retain by legal obligation, which are detailed in **[appendix]** with their basis and retention period. All of the Company's access has been revoked.

| Verification by the company | Content |
|---|---|
| Certificate received (date) | |
| Covers sub-processors and backups | Yes · No |
| Data retained by legal obligation justified | Yes · No · Not applicable |
| Revocation of access checked | Yes · No |
| Verified by (data protection) | |

---

## 9. Relationship closure record

| Field | Content | Guidance |
|---|---|---|
| PRV code and closure date | | |
| Reason for the exit | | |
| Transition completed | | Yes · No; issues. |
| Deletion certificate | | Reference (section 8). |
| Access revoked | | Date. |
| Actual exit cost compared with the estimate | | |
| Lessons learned | | Also in P30 if the exit accompanies a retirement. |
| Final status in T09 | | Terminated. |

---

## 10. Quality criteria

| # | Check | Status |
|---|---|---|
| 1 | Each supplier in use has one record per service with a level justified by the four factors (G3.20). | Met · Not met · Not applicable · Pending |
| 2 | Every supplier of a system in production is in the register with a signed contract (G5.20). | |
| 3 | No periodic review is overdue; the supplier's changes have been reviewed (R6.12). | |
| 4 | N2 suppliers have a documented exit plan and N3 suppliers an alternative and a documented test. | |
| 5 | Concentration indicators are compared with the C2 limits and any excess has an AI Committee decision. | |
| 6 | Each retirement records certified deletion and revocation of access (G7.12). | |
| 7 | If DORA applies, the register of information is up to date. | |
| 8 | Suppliers are assessed with the N1–N3 levels (D6.08 of document 11). | |

---

## 11. Approval and verification

| Function | Role in SEVEN-G | Name and position | Date | Signature or reference |
|---|---|---|---|---|
| Maintains the register | Procurement | | | |
| Reviews the relationship | Relationship manager · AI Operations Owner | | | |
| Prepares the exit plan and the portability test | AI Technical Owner | | | |
| Verifies | AI Office · AI Auditor (G3, G5 and G7) | | | |
| Decides on concentration and High risks | AI Committee | | | |

Segregation of duties: whoever manages the relationship with the supplier does not verify its reviews or the portability test; deletion is certified by the supplier and verified by data protection.

---

## 12. Version control

**Completed document**

| Version | Date | Author | Changes |
|---|---|---|---|
| | | | |

**Template**

| Version | Date | Changes |
|---|---|---|
| 0.1 | 19-09-2026 | First version. Register fields from 36 §9, concentration from 36 §7.2, periodic review minutes (36 §5), exit plan, portability test (36 §7.1), deletion certificate and closure record. Working format of T09. |
