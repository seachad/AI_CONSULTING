# Dataset record and knowledge source inventory

**Catalogues each dataset and each knowledge source used by AI with its owner, legal basis, quality and validity, and maps the critical knowledge that depends on a few people together with its capture plan.**

| | |
|---|---|
| Document | Template P64 · Dataset record and knowledge source inventory |
| Version | 0.1 (working draft) |
| Date | 19-09-2026 |
| Author | Fernando García · SEACHAD |
| Status | Draft for review. |

---

> **Legal notice and disclaimer.** SEVEN-G is a reference methodological framework provided "as is" and for information purposes only. It does not constitute legal, regulatory, financial or professional advice, nor does it guarantee compliance with any law or standard. References to general regulation (such as the EU AI Act, the GDPR, DORA or NIS2), to technical standards and to regulation specific to each sector or jurisdiction may be incomplete, may not apply to a particular case or may become out of date as a result of regulatory changes, interpretations or supervisory positions after their consultation date. **Each organisation that uses SEVEN-G is solely responsible for identifying the regulation that applies to it, verifying that it is current and certifying its own regulatory compliance**, with the appropriate qualified advice. The author and SEACHAD accept no liability for any use made of this content or for any decisions taken on the basis of it. The data, figures, companies and cases in the examples are fictitious or illustrative.

> **Why it matters.** An AI system is only as reliable as the data it learns from and the sources it answers from. If a dataset has no owner, legal basis or measured quality, the initiative cannot be defended before an auditor or a regulator; if a knowledge source has no owner or review date, the assistant will end up citing out-of-date documents to customers or employees. And if critical knowledge depends on two people, their departure paralyses processes and systems. This template gives each asset an owner and a date, and makes it possible to measure DAT-02, CNC-01, CNC-06 and CNC-07.

## 1. Instructions for use

| Aspect | Guidance |
|---|---|
| **When it is used** | Dataset records (sections 3 to 5): phase 3 assessment with real data and full record in phase 4; versioned when datasets are frozen in phase 5. Source inventory (sections 6 and 7): phase 4, before each source is connected, and at each validity review. Dependence map and capture plan (sections 8 and 9): at C1 and at C5. |
| **Who completes it** | Records: AI Technical Owner with the data owner and the data custodian. Sources: content or knowledge owner. Map and plan: the AI Office coordinates with the areas that own each domain, with the people function (document 50). |
| **Who verifies it** | AI Office in Lite; AI Auditor in Enterprise. The data protection officer reviews the personal data and legal basis fields; the AI Risk Owner assesses the RT-DAT risks. |
| **Who decides or approves** | The data owner authorises use for the initiative at G3. The *gate* is decided by the body in 01 §7.5. The capture plan is approved by the AI Committee at C1. |
| **Stage, *gate* or moment** | G3 (data available, quality and legal basis), G4 (lineage and records), G5 (frozen datasets, cleaned sources), R6 (validity); C1 and C5 for the dependence map. |
| **Tool** | The company's data catalogue, if there is one; system attributes in T02. There is no dedicated tool (51 §15). |
| **Reference document** | Document 51 (§4.2, §4.3, §4.5, §8, §10.1–10.6); P16 for the lineage that uses these records. |
| **Lite versus Enterprise** | Lite may omit the fields marked **(Enterprise)**. In high-risk systems all fields are completed, regardless of intensity. |

Completion rules:

- **No data without an owner** and **no source without a content owner** (51 §3, principles 1 and 7).
- If the company already has a data catalogue, the record is implemented as an extension of that catalogue and is only linked here.
- Dataset (CD-NN) and source (F-NN) identifiers are the same as those used in P16; knowledge sources are numbered FC-NN and critical domains DC-NN.
- Quality is measured on real data, with thresholds set per use case in phase 3.
- This template does not constitute legal advice. The legal basis is validated by data protection.

---

## 2. Identification

| Field | Content | Guidance |
|---|---|---|
| Initiative code | | IA-AAAA-NNN (T01). Not applicable to the dependence map. |
| AI systems | | SIA-AAAA-NNN (T02, P05). |
| Regulatory classification | | P11. |
| Intensity | | Lite · Enterprise. |
| Reference in the corporate data catalogue | | If there is one. |
| Document version, author and date | | DD-MM-AAAA. |

---

## 3. Dataset record

One record per dataset used to train, fine-tune, validate, test or feed an AI system in production (51 §4.2).

| Field | Content | Guidance |
|---|---|---|
| Identifier and name | | CD-NN, the same as in P16. |
| Owner (business) and custodian (technology) | | Name and function. |
| Description and origin | | What it contains, which systems it comes from and how it was generated. |
| Use | | Training · Fine-tuning · Validation · Testing · Knowledge base · Inference · Monitoring. |
| Period covered and volume | | Dates and number of records. |
| Personal data | | Yes · No. Categories; special categories; minors. |
| Review by the data protection officer | | Date and result. |
| Legal basis and authorised purposes | | By purpose (GDPR, Art. 6); compatibility analysis if the purpose is new (Art. 6.4). |
| Justification for each personal attribute used as a variable **(Enterprise)** | | Minimisation (51 §4.4). |
| Use and confidentiality restrictions | | Contractual, licensing, sectoral or territorial; information classification. |
| Retention | | Period and rule for deletion or anonymisation (51 §4.5). |
| Systems that use it | | Initiatives and model versions; link to P16 and T02. |
| Version and freeze date | | Mandatory if it was used for training. |
| Synthetic data | | Yes · No. If Yes, source dataset, generation method and version; utility and privacy validation (DAT-11). Until shown otherwise, they are treated as personal data. |

*(Illustrative example)* CD-01 · Maintenance work order history 2023–2025 · owner: head of maintenance · custodian: data platform team · 180,000 records · no personal data after pseudonymising the technician identifier · authorised purpose: estimate the probability of failure · frozen at version 3 on 15-11-2026.

---

## 4. Quality by dimension

Thresholds set in phase 3; they become monitoring controls in P25.

| Dimension | Rule applied | Threshold | Result | Measurement date | Sufficient · With actions · Insufficient |
|---|---|---|---|---|---|
| Accuracy | | | | | |
| Completeness | | | | | |
| Consistency | | | | | |
| Timeliness | | | | | |
| Validity | | | | | |
| Uniqueness | | | | | |
| Representativeness | | | | | |
| Label quality | | | | | |
| *(illustrative example)* Completeness | Proportion of nulls in the failure code | ≤ 5% | 4% | 20-10-2026 | Sufficient |

---

## 5. Representativeness and known biases

Mandatory in high-risk systems (51 §6); **(Enterprise)** for the rest.

| Field | Content | Guidance |
|---|---|---|
| Population and contexts of use of the system | | Geographical, behavioural, contextual or functional. |
| Populations covered and under-represented | | Distribution by segment against the population of use. |
| Known biases and measures | | Link to the tests in P22 and the risks in P12. |
| Use of special categories to detect bias | | Only with a decision documented with the data protection officer and safeguards (51 §9.4); reference to P11. |

---

## 6. Knowledge source inventory

One row per source used by a generative AI system through retrieval (51 §10.1).

| No. | Source | Content owner | Indexed scope and exclusions | Content type | Authority | Classification and source permissions | Validity (review every) | Index update | Third-party content |
|---|---|---|---|---|---|---|---|---|---|
| FC-01 *(illustrative example)* | Document space for customer service procedures | Head of service quality | Procedures in force; drafts and minutes excluded | Procedure | Official | Internal; permissions by team | 6 months | Daily | No |
| FC-01 | | | | Internal regulation · Procedure · Product · Technical · Legal · Commercial · Historical | Official · Supporting · Informative | | | Continuous · Daily · Weekly | |

---

## 7. Admission, curation and permissions for each source

A source **should not** be connected if any admission check fails (51 §10.2).

| Source | Has an owner | What is in force can be identified | Does not mix drafts and old versions | Permissions transferable to retrieval | Personal data and third parties analysed | Initial clean-up before G5 | Permission filtering at retrieval tested | Last validity review |
|---|---|---|---|---|---|---|---|---|
| FC-01 | Yes · No | Yes · No | Yes · No | Yes · No | Yes · No | Date | Date and result | Date |

| Field | Content | Guidance |
|---|---|---|
| Maximum permission synchronisation period | | Monitored (51 §10.4). |
| Review of excessive inherited permissions before connecting | | Date and result. |
| Content validity (CNC-02) and use of out-of-date content (CNC-03) | | Latest value. |
| Queries without a relevant source (CNC-08) **(Enterprise)** | | Gaps detected and content created or improved. |

---

## 8. Knowledge dependence map

Corporate; prepared at C1 and reviewed at C5 (51 §10.6, steps 1 and 2).

| No. | Critical domain | Owning area | People who master it | Usable documentation (Yes · Partial · No) | Departure risk within the thesis horizon | Dependent? (≤ 2 people and no documentation) |
|---|---|---|---|---|---|---|
| DC-01 *(illustrative example)* | Set-up and failures of a legacy production line | Technical department | 2 | Partial | High (retirement within 18 months) | Yes |
| DC-01 | | | | | Low · Medium · High | |

| Indicator | Value | Formula |
|---|---|---|
| CNC-06 · Critical knowledge dependence | | Dependent domains ÷ critical domains. |

---

## 9. Capture plan

For the prioritised domains (51 §10.6, steps 3 to 6).

| Domain | Capture method | Participating experts and informed consent | Owner | Target date | Second reviewer and validation date | Resulting governed source (FC-NN) | Status |
|---|---|---|---|---|---|---|---|
| DC-01 *(illustrative example)* | AI-assisted structured interviews and review of 30 resolved failures | Two technicians, informed voluntary participation recorded | Technical department | 30-06-2027 | Pending | FC-07 | In progress |
| | Interviews · Recording · Case review · Documentation of decisions | | | | | | Pending · In progress · Validated · Available |

| Indicator | Value | Formula |
|---|---|---|
| CNC-07 · Capture coverage | | Dependent domains with captured and validated content ÷ dependent domains. |

Capture is carried out with informed voluntary participation and recognition of the expert, and is not used as a prior step to dispensing with the person without assessing the effect in accordance with document 50.

---

## 10. Quality criteria

Formal criteria in document 21 (G3.02, G3.03 and G4.03); DAT and CNC indicators in document 51 §12.

| # | Check | Status |
|---|---|---|
| 1 | Each dataset has an owner, a custodian, a legal basis per purpose and restrictions. | Met · Not met · Not applicable · Pending |
| 2 | Quality has been measured with real data against thresholds per dimension. | |
| 3 | Datasets used for training are versioned and frozen. | |
| 4 | Synthetic data are marked and validated for utility and privacy. | |
| 5 | In high-risk systems, representativeness and known biases are recorded. | |
| 6 | Each knowledge source has an owner, authority, validity and permissions, and passed admission. | |
| 7 | Permission filtering is applied at retrieval and has been tested. | |
| 8 | The dependence map and the capture plan are up to date at C1 or C5. | |

---

## 11. Approval and verification

| Function | SEVEN-G role | Name and position | Date | Signature or reference |
|---|---|---|---|---|
| Prepares the records | AI Technical Owner | | | |
| Authorises use of the dataset | Data owner | | | |
| Reviews personal data and legal basis | Data protection officer | | | |
| Maintains the source inventory | Content or knowledge owner | | | |
| Verifies | AI Office (Lite) · AI Auditor (Enterprise) | | | |
| Approves the capture plan | AI Committee (C1) | | | |

Segregation of duties: whoever prepares the record does not verify it; the data owner authorises use but does not validate their own quality without the measurement in section 4.

---

## 12. Version control

**Completed document**

| Version | Date | Author | Changes |
|---|---|---|---|
| | | | |

**Template**

| Version | Date | Changes |
|---|---|---|
| 0.1 | 19-09-2026 | First version. Covers the dataset record (51 §4.2), quality by dimension (51 §4.3), the knowledge source inventory and admission (51 §10.1–10.4) and the dependence map with its capture plan (51 §10.6). |
