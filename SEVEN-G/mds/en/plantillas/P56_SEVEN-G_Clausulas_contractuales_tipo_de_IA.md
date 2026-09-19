# Model AI contractual clauses

**Provides starting wording for the sixteen key clauses of document 36, with their requirement by N1–N3 level, an AI annex for existing contracts and an addendum for AI embedded in software already contracted.**

| | |
|---|---|
| Document | Template P56 · Model AI contractual clauses |
| Version | 0.1 (working draft) |
| Date | 19-09-2026 |
| Author | Fernando García · SEACHAD |
| Status | Draft for review. |

---

> **Legal notice and disclaimer.** SEVEN-G is a reference methodological framework provided "as is" and for information purposes only. It does not constitute legal, regulatory, financial or professional advice, nor does it guarantee compliance with any law or standard. References to general regulation (such as the EU AI Act, the GDPR, DORA or NIS2), to technical standards and to regulation specific to each sector or jurisdiction may be incomplete, may not apply to a particular case or may become out of date as a result of regulatory changes, interpretations or supervisory positions after their consultation date. **Each organisation that uses SEVEN-G is solely responsible for identifying the regulation that applies to it, verifying that it is current and certifying its own regulatory compliance**, with the appropriate qualified advice. The author and SEACHAD accept no liability for any use made of this content or for any decisions taken on the basis of it. The data, figures, companies and cases in the examples are fictitious or illustrative.

> **Why it matters.** What is not in the contract cannot be enforced: neither that the supplier does not train on the company's data, nor that it gives notice before changing the model, nor that it returns and deletes the data on exit. Document 36 states what each clause must ensure; this template provides starting text for negotiation, prevents every contract from starting from scratch and makes it possible to check at G3, G5 and R6 which clauses are present.

**Warning.** The texts in this template are **starting texts**. They must be reviewed and adapted by the company's legal advisers to the contract, the applicable law, the jurisdiction and sector regulation before use. The elements in square brackets are replaced or chosen in each case.

## 1. Instructions for use

| Aspect | Guidance |
|---|---|
| **When it is used** | At stage 3 of the supplier lifecycle (36 §5), phases 3–4: when preparing the contract or AI annex for a new supplier; when reviewing existing contracts (section 7); when incorporating embedded AI features in software already contracted (section 8, 36 §8.1 step 5); and on renewal. |
| **Who completes it** | Legal and procurement draft and negotiate; the AI Technical Owner validates the technical content (model changes, logs, exit); data protection validates clauses 2 and 3. |
| **Who verifies it** | The AI Risk Owner checks that the list in section 3 matches the level; the AI Auditor verifies it at G3 and G5 (Enterprise). |
| **Who decides or approves** | According to the level (36 §4.2): N1, AI Product Owner with procurement clearance; N2, AI Sponsor with risk and data protection clearance; N3, AI Committee with clearance from risk, information security, data protection and legal. |
| **Stage or *gate*** | G3 (G3.21: clauses set as a contracting requirement) · G4 (G4.22: incorporated into the contract or draft) · G5 (G5.20: contract signed) · R6 (R6.12) · G7 (G7.12: deletion and revocation of access). |
| **Tool** | T09 · AI supplier register: the status of the 16 clauses is entered in the *Contract* block (P57 §3.3). |
| **Reference document** | Document 36 §6 (clauses), §6.1 (AI Act along the value chain), §6.2 (DORA) and §8 (embedded AI). P14 §5 records the verification. |
| **Lite versus Enterprise** | The requirement depends on the supplier's N1–N3 level, not on intensity. |

Completion rules:

- **Yes** = must be included · **Rec.** = recommended · **—** = not required (36 §6).
- At N1 many clauses are not negotiable: they are checked in the supplier's standard terms and, if missing, the risk is recorded in P12 together with who accepts it (section 9).
- At N1 the standard terms are reviewed at least against clauses 1 to 4; at N2 an AI annex and a data processing agreement are signed with the clauses marked for N2; at N3 the contract is negotiated with all the clauses (36 §4.2).
- *This document does not constitute legal advice.* References consulted in September 2026; their current validity must be verified.

---

## 2. Identification

| Field | Content | Guidance |
|---|---|---|
| Supplier–service relationship code | | PRV-AAAA-NNN (P57). |
| Supplier | | Legal name and country. |
| Service | | |
| Requirement level | | N1 · N2 · N3 (P14 §3). |
| Critical or important function | | Yes · No. If the company is subject to DORA, see section 6. |
| Instrument | | New contract · AI annex to an existing contract · Embedded AI addendum · Renewal. |
| Contract reference | | |
| Linked initiatives and systems | | IA-AAAA-NNN · SIA-AAAA-NNN. |
| Document version and date | | DD-MM-AAAA. |

---

## 3. Clause map by level and status

Status: **Present · Partial · Absent · Not applicable** (36 §9).

| # | Clause | N1 | N2 | N3 | Embedded AI addendum | Status | Observations |
|---|---|---|---|---|---|---|---|
| 1 | Use of data for training | Yes | Yes | Yes | Minimum | | |
| 2 | Confidentiality and data processing | Yes | Yes | Yes | According to level | | |
| 3 | Location and transfers | Yes | Yes | Yes | Minimum | | |
| 4 | Security | Yes | Yes | Yes | According to level | | |
| 5 | Sub-processors | Rec. | Yes | Yes | According to level | | |
| 6 | Intellectual property and outputs | Rec. | Yes | Yes | According to level | | |
| 7 | Incident notification | Rec. | Yes | Yes | According to level | | |
| 8 | Model changes | Rec. | Yes | Yes | Minimum | | |
| 9 | Service levels | — | Yes | Yes | According to level | | |
| 10 | Logs and traceability | — | Yes | Yes | According to level | | |
| 11 | Audit and access | — | Rec. | Yes | According to level | | |
| 12 | AI Act obligations along the value chain | Rec. | Yes | Yes | According to level | | |
| 13 | Transparency on AI features | Rec. | Yes | Yes | Minimum | | |
| 14 | Continuity | — | Rec. | Yes | According to level | | |
| 15 | Exit and transition | Rec. | Yes | Yes | According to level | | |
| 16 | Termination | Rec. | Yes | Yes | According to level | | |
| *(illustrative example)* 8 | Model changes | Rec. | Yes | Yes | Minimum | Partial | 30 days' notice accepted; the supplier does not allow version pinning. Risk RT-TER-03 in P12. |

---

## 4. Definitions

For the purposes of the following clauses:

- **Company Data:** any data, document or information that the Company or its users provide to the Supplier or that the Service generates on behalf of the Company, including Inputs and Outputs.
- **Inputs:** prompts, queries, contexts, documents and other content entered into the Service.
- **Outputs:** content, predictions, recommendations or actions generated by the Service.
- **Model:** any AI model, proprietary or third-party, used by the Service.
- **Relevant change:** a change to the version, behaviour or configuration of the Model or the Service that may affect quality, security, compliance or cost; and the deprecation of a Model.
- **AI feature:** functionality of the Service based on a Model.
- **Sub-processor:** a third party engaged by the Supplier to provide the Service or process Company Data.
- **Incident:** an event that affects or may affect the availability, integrity or confidentiality of the Service or of Company Data, or the expected behaviour of the Model.

---

## 5. Model clauses

### 5.1 Clause 1 · Use of data for training

**Model text.** The Supplier shall not use Company Data, including Inputs and Outputs, to train, fine-tune, evaluate or improve any Model, proprietary or third-party, or for any purpose other than the provision of the Service, unless the Company has given prior, express, written and specific authorisation stating the data, the purpose and the period. The Supplier shall keep any option allowing such use [disabled by default / disabled through a verifiable configuration].

**Usage note.** Required at N1, N2 and N3. At N1 it is checked in the standard terms and in the environment configuration; the evidence is retained. It controls RT-TER-02.

### 5.2 Clause 2 · Confidentiality and data processing

**Model text.** The Supplier shall treat Company Data as confidential information for the term of the contract and [number] years thereafter. Where it processes personal data on behalf of the Company, it shall do so as a processor in accordance with Art. 28 of the GDPR and the data processing agreement set out in [annex]. The Supplier shall retain Company Data only for [period] or for the time needed to provide the Service, and shall delete them at the end of that period.

**Usage note.** Required at N1, N2 and N3. Data protection validates the data processing agreement and the retention period.

### 5.3 Clause 3 · Location and transfers

**Model text.** The Supplier shall process and store Company Data only in [authorised regions or countries]. Any international transfer shall comply with the safeguards of Chapter V of the GDPR. The Supplier shall notify the Company of any change of location [number] days in advance, and the Company may object or terminate the contract without penalty if the change does not offer equivalent safeguards.

**Usage note.** Required at N1, N2 and N3; minimum in the embedded AI addendum. It controls RT-TER-04.

### 5.4 Clause 4 · Security

**Model text.** The Supplier shall apply the security measures described in [annex of measures], keep the certifications [specify] in force throughout the contract with a scope covering the Service, manage vulnerabilities within the time frames in [annex] and apply protections against AI-specific threats, such as prompt injection, information leakage and model extraction. It shall report without delay any loss or reduction in scope of any certification.

**Usage note.** Required at N1, N2 and N3. At N2 and N3, information security checks the annex against the applicable SEG and AG controls of document 35.

### 5.5 Clause 5 · Sub-processors

**Model text.** The Supplier shall make available to the Company an up-to-date list of Sub-processors with their location and function. [It shall not engage new Sub-processors without the Company's prior written authorisation / It shall notify the Company of any change [number] days in advance, and the Company may object on reasoned grounds]. The Supplier shall impose on each Sub-processor obligations equivalent to those of this contract and shall be liable for their compliance.

**Usage note.** Recommended at N1; required at N2 and N3. For DORA, see section 6.

### 5.6 Clause 6 · Intellectual property and outputs

**Model text.** The Outputs [belong to the Company / may be used by the Company without restriction for its purposes]. Anything developed specifically for the Company shall be its property from creation. The Supplier shall indemnify the Company against third-party claims for infringement of intellectual or industrial property rights arising from the Model or its training data, [with the following scope and limits].

**Usage note.** Recommended at N1; required at N2 and N3. Particularly relevant with integrators (ownership of what is built).

### 5.7 Clause 7 · Incident notification

**Model text.** The Supplier shall notify the Company of any Incident within a maximum of [number] hours of its detection, with at least: description, systems and data affected, known cause, measures taken and contact person. It shall cooperate in the investigation and provide in good time the information the Company needs for its regulatory notifications.

**Usage note.** Recommended at N1; required at N2 and N3. The time limit must be compatible with the company's own obligations (document 37); at N3, indicatively 24 hours or less (36 §4.2).

### 5.8 Clause 8 · Model changes

**Model text.** The Supplier shall give notice of any Relevant change at least [number] days in advance, with sufficient information for the Company to evaluate its effect before it takes place. The Company may keep the version in use pinned for [period] from the notice. The deprecation of a Model shall be notified [number] months in advance. If the change affects compliance or the agreed performance, the Company may terminate the contract without penalty.

**Usage note.** Recommended at N1; required at N2 and N3; minimum in the embedded AI addendum. It controls RT-TER-03.

### 5.9 Clause 9 · Service levels

**Model text.** The Supplier shall provide the Service with the availability, latency and support levels set out in [service level annex], measured according to the method described therein. Failure to meet them shall give rise to the penalties in [annex], without prejudice to other rights.

**Usage note.** Not required at N1; required at N2 and N3.

### 5.10 Clause 10 · Logs and traceability

**Model text.** The Supplier shall generate and retain for [period] the logs needed for oversight, incident investigation and the Company's regulatory obligations, and shall give the Company access to them in [format and time frame].

**Usage note.** Not required at N1; required at N2 and N3. The retention period is aligned with the architecture record (P15).

### 5.11 Clause 11 · Audit and access

**Model text.** The Company, the auditors it designates and the competent supervisors may audit, inspect and access the information, premises and systems related to the Service, [with [number] days' notice except where required by the supervisor]. [At N2: the Supplier shall provide annual independent reports covering the Service.]

**Usage note.** Not required at N1; recommended at N2 (annual independent reports); required at N3 (right of audit, directly or through a designated third party).

### 5.12 Clause 12 · AI Act obligations along the value chain

**Model text.** The parties declare that, in respect of the Service, the Supplier acts as [provider of the system / provider of a general-purpose AI model / other] and the Company as [deployer / other]. The Supplier shall deliver the technical documentation and instructions for use, and shall report on the capabilities and limitations of the system, so that the Company can meet its obligations. It shall cooperate on human oversight, log retention, post-market monitoring and the handling of serious incidents. [Where the Supplier supplies tools, services, components or processes to a high-risk system of the Company, the parties sign the written agreement under Art. 25(4) of the AI Act as [annex], with the necessary information, capabilities, technical access and assistance.]

**Usage note.** Recommended at N1; required at N2 and N3. Apply the relevant situation in 36 §6.1: deployment of a provider's high-risk system (Art. 26); the company becomes a provider (Art. 25(1) and 25(2)); third-party components for the company's own high-risk system (Art. 25(4)); integration of a general-purpose AI model (Art. 53). Long-term contracts signed before 2 December 2027 **should** already include it.

### 5.13 Clause 13 · Transparency on AI features

**Model text.** The Supplier shall notify the Company at least [number] days in advance of any new AI feature in the Service. The Company may keep each new AI feature disabled until it has assessed it, at no additional cost and without losing other functionality.

**Usage note.** Recommended at N1; required at N2 and N3; minimum in the embedded AI addendum. It controls RT-TER-06.

### 5.14 Clause 14 · Continuity

**Model text.** The Supplier shall maintain continuity and recovery plans for the Service, test them at least [frequency] and inform the Company of their results and of the corrective measures.

**Usage note.** Not required at N1; recommended at N2; required at N3.

### 5.15 Clause 15 · Exit and transition

**Model text.** On termination of the contract for any reason, the Supplier shall: a) maintain the Service for a transition period of [number] months; b) provide reasonable assistance to migrate to the Company or to a new supplier; c) deliver the Company's data, configurations, prompts and logs in usable formats [specify formats]; d) thereafter delete Company Data, including data held by its Sub-processors, and deliver a deletion certificate within [number] days; e) revoke all access.

**Usage note.** Recommended at N1 (at N1 guaranteed data export is sufficient); required at N2 and N3. The exit plan and the deletion certificate are documented in P57 §6 and §8. For DORA, see section 6.

### 5.16 Clause 16 · Termination

**Model text.** The Company may terminate the contract, without penalty, for: a) serious breach by the Supplier; b) a regulatory change that prevents the provision of the Service or makes it unlawful; c) a security breach; d) a change of control of the Supplier; e) an instruction from a competent supervisor. Termination triggers clause 15.

**Usage note.** Recommended at N1; required at N2 and N3.

---

## 6. Entities subject to DORA

Only if the company is a financial entity subject to DORA and the AI service is an ICT service provided by a third party (36 §6.2). If it is not, these requirements **may** be used as a good practice reference for N3 services.

| Requirement (36 §6.2) | Reference | Where it is covered | Checked |
|---|---|---|---|
| Minimum contractual clauses for all ICT services | Art. 30(2) | Section 5; legal review of the full contract. | Yes · No |
| Enhanced clauses for critical or important functions | Art. 30(3) | Every N3 service is reviewed against Art. 30(3). | Yes · No · Not applicable |
| Exit strategy for services supporting critical or important functions | Art. 28(8) | Clause 15; tested exit plan (P57 §6–7). | Yes · No · Not applicable |
| Subcontracting chain | Art. 29; Delegated Regulation (EU) 2025/532 | Clause 5. | Yes · No · Not applicable |
| Register of information | Art. 28(3); Implementing Regulation (EU) 2024/2956 | T09 feeds the register (P57). | Yes · No |

---

## 7. AI annex for existing contracts (model)

It is used when a current contract does not include the clauses for the level (36 §4.2: at N2, AI annex). Starting text:

**AI annex to contract [reference] between [the Company] and [the Supplier].**

1. **Purpose.** This annex supplements the contract with the terms applicable to the use of AI features and Models in the Service.
2. **Definitions.** The definitions in section 4 of this template apply.
3. **Incorporated clauses.** Clauses [list according to the level in section 3: at N2, 1 to 10, 12, 13, 15 and 16, and the recommended ones that are agreed; at N3, all of them] are incorporated.
4. **Precedence.** In the event of conflict with the contract, this annex prevails as regards Company Data, Models and AI features.
5. **Entry into force.** From signature; obligations concerning AI features already enabled shall be met within [period].

---

## 8. Embedded AI addendum (model)

It is used with suppliers of software already contracted that incorporate AI features (36 §8.1, step 5). It includes at least clauses 1, 3, 8 and 13, plus those corresponding to the level. Starting text:

**AI addendum to contract [reference] between [the Company] and [the Supplier].**

1. **Existing AI features.** The Supplier declares in [appendix] the AI features currently included in the software, the data they process, the Models and Model providers they use and where the data are processed (answers to annex A of P55).
2. **Activation status.** AI features that process personal or confidential data shall remain disabled until the Company has assessed and authorised them in writing. [If they cannot be disabled, the Supplier declares this and describes the measures available.]
3. **Incorporated clauses.** Clauses 1 (use of data for training), 3 (location and transfers), 8 (model changes) and 13 (transparency on AI features) are incorporated, together with [others according to the level].
4. **New features.** Any new AI feature is governed by clause 13.

---

## 9. Negotiation record and accepted risk

Required clauses that the supplier does not accept or accepts only in part. At N1, if they are missing from the standard terms, the risk is recorded together with who accepts it (36 §6).

| # | Clause | Supplier's position | Agreed alternative or compensating measure | Risk in P12 | Residual level | Accepted by (P12 §6) | Date |
|---|---|---|---|---|---|---|---|
| | | | | | | | |
| *(illustrative example)* 11 | Audit and access | Provides only annual independent reports. | Annual third-party report covering the service; supervisor's right of access. | IA-2026-021 · R04 | Medium | AI Sponsor with risk clearance | 02-10-2026 |

---

## 10. Quality criteria

| # | Check | Status |
|---|---|---|
| 1 | The minimum clauses are set as a contracting requirement before G3 (G3.21). | Met · Not met · Not applicable · Pending |
| 2 | The required clauses are in the contract or in the draft under negotiation before G4 (G4.22). | |
| 3 | The contract is signed with the required clauses before G5 and is recorded in T09 (G5.20). | |
| 4 | Each required clause that is absent or partial has a recorded risk and acceptance by the competent body. | |
| 5 | Clause 12 applies the correct situation in 36 §6.1. | |
| 6 | If DORA applies, the N3 service has been reviewed against Art. 30(3). | |
| 7 | The embedded AI addendum includes at least clauses 1, 3, 8 and 13. | |
| 8 | Legal advisers have reviewed and adapted the texts. | |

---

## 11. Approval and verification

| Function | Role in SEVEN-G | Name and position | Date | Signature or reference |
|---|---|---|---|---|
| Drafts and negotiates | Legal and procurement | | | |
| Validates technical and data content | AI Technical Owner · data protection | | | |
| Issues clearance | AI Risk Owner | | | |
| Verifies | AI Risk Owner (Lite) · AI Auditor (Enterprise) | | | |
| Approves | According to the level (36 §4.2) | | | |

Segregation of duties: whoever negotiates the contract does not verify the clause list; anyone with a conflict of interest with the supplier declares it in P03.

---

## 12. Version control

**Completed document**

| Version | Date | Author | Changes |
|---|---|---|---|
| | | | |

**Template**

| Version | Date | Changes |
|---|---|---|
| 0.1 | 19-09-2026 | First version. Starting text for the sixteen clauses of 36 §6 with their requirement by level, DORA requirements from 36 §6.2, AI annex for existing contracts and embedded AI addendum (36 §8.1). |
