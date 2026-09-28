# AI supplier assessment

**Determines the requirement level of an AI supplier, summarises its due diligence assessment, the dependency it creates and its exit plan, and checks that the contract includes the key clauses.**

| | |
|---|---|
| Document | Template P14 · AI supplier assessment |
| Version | 0.2 (working draft) |
| Date | 19-09-2026 |
| Author | Fernando García Varela |
| Status | Draft for review. |

---

> **Legal notice and disclaimer.** SEVEN-G is a reference methodological framework provided "as is" and for information purposes only. It does not constitute legal, regulatory, financial or professional advice, nor does it guarantee compliance with any law or standard. References to general regulation (such as the EU AI Act, the GDPR, DORA or NIS2), to technical standards and to regulation specific to each sector or jurisdiction may be incomplete, may not apply to a particular case or may become out of date as a result of regulatory changes, interpretations or supervisory positions after their consultation date. **Each organisation that uses SEVEN-G is solely responsible for identifying the regulation that applies to it, verifying that it is current and certifying its own regulatory compliance**, with the appropriate qualified advice. This methodology is a generic, free aid shared with the community so that nobody has to start from scratch; each person or organisation can and should adapt it to its own use. It must not be inferred that its legally sensitive parts have been reviewed by legal counsel: those reviews, for each company or sector, are the ultimate responsibility of the company, consultant or organisation that uses it. Although every effort is made to keep it up to date, some regulation may have changed without being reflected here. To the fullest extent permitted by law, the author accepts no responsibility whatsoever for the effects of its application in any organisation or for its full applicability. The methodology does not grant certification of any kind. The author accepts no liability for any use made of this content or for any decisions taken on the basis of it. The data, figures, companies and cases in the examples are fictitious or illustrative.

## 1. Instructions for use

| Aspect | Guidance |
|---|---|
| **When it is used** | In phase 3, before G3, for each supplier that provides AI models, platforms, data or services to the initiative. It is reviewed before signing or renewing the contract, upon any reassessment trigger (36 §5) and at the frequency set by the requirement level. |
| **Who completes it** | The AI Technical Owner, with procurement and the AI Risk Owner. Information security, data protection and legal counsel are consulted. |
| **Who verifies it** | Lite: AI Risk Owner; if the AI Risk Owner has prepared the assessment, the AI Office or the AI Auditor verifies it. Enterprise: AI Auditor. |
| **Who decides** | It is approved with G3, according to the requirement level (36 §4.2): N1, AI Product Owner with procurement clearance · N2, AI Sponsor with risk and data protection clearance · N3, AI Committee with clearance from risk, information security, data protection and legal. |
| **Gate at which it is reviewed** | G3 · Feasibility; check of signed clauses at G5. |
| **Tool** | T09 · AI supplier register (working format in P57). |
| **Supporting documents** | P55 · Due diligence questionnaire (detail of the twelve blocks summarised in section 4) · P56 · Standard contractual clauses (model text of the clauses in section 5) · P57 · Supplier register and exit plan. |
| **Lite versus Enterprise** | The depth depends on the requirement level (N1, N2, N3), not on the intensity (36 §2, principle 2). An N3 supplier normally implies Enterprise intensity (01 §9.2). |

Completion rules:

- The requirement level is determined by the **most demanding factor** (36 §4.1).
- The requirements by level are those of document 36 §4.2: due diligence, security, contract, approval, audit, monitoring, exit, incidents and register.
- This template **summarises** the assessment: the detail of the questions, answers and evidence is in P55.
- *This document does not constitute legal advice.* References consulted in September 2026; their currency must be verified.

---

## 2. Identification

| Field | Content | Guidance |
|---|---|---|
| Initiative code | | IA-AAAA-NNN. |
| AI systems affected | | Codes from P05. |
| Supplier–service relationship code | | PRV-AAAA-NNN from the T09 register (P57). |
| Supplier | | Registered name and country of establishment. |
| Service or component assessed | | Model via API, platform, software with embedded AI, data, professional services. |
| Sourcing option | | Build · Buy · Adapt · Partner (36 §3.1). |
| Document version | | |
| Date | | DD-MM-AAAA. |
| Author | | Name and role. |

---

## 3. Requirement level

| Factor | N1 · Standard | N2 · Enhanced | N3 · Critical | Assessment |
|---|---|---|---|---|
| **Service criticality** | Internal process whose interruption would have an impact of 1–2 (document 33). | Relevant process with impact 3; direct exposure to customers; decisions about people. | Critical or important function (including the DORA definition where applicable); impact 4–5; high-risk system under the AI Act. | N1 · N2 · N3 |
| **Data processed** | Public or non-sensitive internal data. | Personal data or confidential information. | Special categories of data, large-scale personal data, trade secrets or critical confidential information. | |
| **Autonomy** | A0: the supplier's system assists. | A1, or A2 without effects on third parties, money, personal data or production. | A2 or A3 with effects on third parties, money, personal data or production systems. | |
| **Substitutability** | Replaceable in less than 3 months without relevant cost. | Replaceable in 3 to 12 months or with relevant cost. | More than 12 months, cost above the materiality threshold M, or no alternative. | |

The substitutability time frames are indicative and are approved in C2 (document 13).

| Field | Content | Guidance |
|---|---|---|
| **Requirement level** | | N1 Standard · N2 Enhanced · N3 Critical. The highest of the four factors. |
| Justification | | |
| ICT third-party service provider supporting critical or important functions (DORA) | | Yes · No · Not applicable. Only entities subject to DORA. |

*(illustrative example)* Supplier of a language model via API for the enquiries assistant: criticality N2 (direct exposure to customers), data N2 (personal data from orders), autonomy N1 (A0), substitutability N2 (replaceable in about six months). Level: **N2 Enhanced**.

---

## 4. Supplier assessment

### 4.1 Result by due diligence block

Completed from the summary in P55 §5, with the twelve blocks of document 36 §4.3. Result: **Conformant · Conformant with observations · Nonconformant · Not assessed**.

| Block | Result | Observations |
|---|---|---|
| 1 · Identity and soundness | | |
| 2 · Service and model | | |
| 3 · Data | | |
| 4 · Sub-processors and supply chain | | |
| 5 · Security | | |
| 6 · AI Act compliance | | |
| 7 · Data protection | | |
| 8 · Intellectual property | | |
| 9 · Continuity | | |
| 10 · Incidents | | |
| 11 · Exit | | |
| 12 · Ethics and responsible use | | |
| Performance in in-house tests (P10) | | Results of in-house tests with representative data, not only the supplier's figures. |

### 4.2 Dependency and exit plan

| Field | Content | Guidance |
|---|---|---|
| Concentration | | Other company systems that depend on the same supplier (T09; 36 §7.2). |
| Alternatives | | Alternative suppliers or solutions identified. |
| **Exit required by the level** | | N1: guaranteed data export · N2: documented exit plan · N3: exit plan with an identified alternative and a documented rehearsal or test (36 §4.2). |
| Exit plan | | Reference to the exit plan and, at N3, to the portability test in P57 §6 and §7. |

---

## 5. Key contractual clauses

The sixteen clauses of document 36 §6. **Yes** = must be included · **Rec.** = recommended · **—** = not required. Status: **Present · Partial · Absent · Not applicable** (36 §9). The model text of each clause is in P56.

| # | Clause | N1 | N2 | N3 | Status |
|---|---|---|---|---|---|
| 1 | Use of data for training | Yes | Yes | Yes | |
| 2 | Confidentiality and data processing | Yes | Yes | Yes | |
| 3 | Location and transfers | Yes | Yes | Yes | |
| 4 | Security | Yes | Yes | Yes | |
| 5 | Sub-processors | Rec. | Yes | Yes | |
| 6 | Intellectual property and outputs | Rec. | Yes | Yes | |
| 7 | Incident notification | Rec. | Yes | Yes | |
| 8 | Model changes | Rec. | Yes | Yes | |
| 9 | Service levels | — | Yes | Yes | |
| 10 | Logs and traceability | — | Yes | Yes | |
| 11 | Audit and access | — | Rec. | Yes | |
| 12 | AI Act obligations along the value chain | Rec. | Yes | Yes | |
| 13 | Transparency on AI features | Rec. | Yes | Yes | |
| 14 | Continuity | — | Rec. | Yes | |
| 15 | Exit and transition | Rec. | Yes | Yes | |
| 16 | Termination | Rec. | Yes | Yes | |

At N1 many clauses are not negotiable: they are checked in the standard terms and, if missing, the risk and who accepts it are recorded (36 §6; P56 §9). For entities subject to DORA, every N3 service is reviewed against Art. 30(3) of that regulation (36 §6.2).

---

## 6. Conclusion

| Field | Content | Guidance |
|---|---|---|
| **Overall result** | | Conformant · Conformant with observations · Nonconformant. |
| Observations and conditions | | What must be resolved, owner and deadline (before signature or before G5). |
| Risks for P12 | | Risks in the TER category or others identified in the assessment. |
| Review frequency | | According to the level (36 §4.2): N1 annual review · N2 half-yearly review and service indicators · N3 quarterly review, monthly indicators and relationship governance meeting. |
| Next review | | Date. |

A **Nonconformant** result in blocks 3 (data), 5 (security) or 7 (data protection) of P55 prevents the supplier from being used with production data until it is resolved (P55 §5). Nor is it used with production data while a required clause (**Yes**) is absent without the risk being recorded and accepted by the competent body.

---

## 7. Quality criteria

The formal G3 criteria are in document 21 (see criteria G3.xx) and the third-party requirements in document 36.

| # | Check | Status |
|---|---|---|
| 1 | The requirement level is justified with the four factors. | Met · Not met · Not applicable · Pending |
| 2 | The twelve blocks have a result carried over from P55 and performance has been checked with in-house tests. | |
| 3 | The supplier's use of data is resolved by contract. | |
| 4 | The required clauses for the level are present or under negotiation with a date before G5; absent ones have a recorded and accepted risk. | |
| 5 | Dependency and exit have been assessed according to the level: at N2 there is a documented exit plan and at N3 an identified alternative and a documented test. | |
| 6 | The risks identified have been carried over to P12. | |
| 7 | The supplier is registered in T09 and in record P05. | |

---

## 8. Approval and verification

| Function | Role in SEVEN-G | Name and position | Date | Signature or reference |
|---|---|---|---|---|
| Prepares | AI Technical Owner | | | |
| Consulted | Procurement · security · data protection · legal counsel | | | |
| Issues clearance | The functions required by the level ("Decides" row) | | | |
| Verifies | AI Risk Owner (Lite) · AI Auditor (Enterprise) | | | |
| Decides | N1: AI Product Owner with procurement clearance · N2: AI Sponsor with risk and data protection clearance · N3: AI Committee with clearance from risk, information security, data protection and legal (36 §4.2) | | | |

Segregation of duties: whoever negotiated the contract does not verify the assessment; anyone with a conflict of interest with the supplier declares it in P03.

---

## 9. Version control

**Completed document**

| Version | Date | Author | Changes |
|---|---|---|---|
| | | | |

**Template**

| Version | Date | Changes |
|---|---|---|
| 0.1 | 16-09-2026 | First version. N1–N3 requirement levels of the common specification §5.6, assessment by blocks and key contractual clauses. |
| 0.2 | 19-09-2026 | Aligned with document 36: decision and review by level N1–N3, factors, 12 due diligence blocks (P55), 16 clauses (P56) and exit plan (P57). |
