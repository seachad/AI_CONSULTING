# Regulatory classification and impact assessments

**Classifies the AI system under the EU AI Act, determines the applicable impact assessments and maps the resulting obligations to phases, evidence and owners.**

| | |
|---|---|
| Document | Template P11 · Regulatory classification and impact assessments |
| Version | 0.1 (working draft) |
| Date | 16-09-2026 |
| Author | Fernando García Varela |
| Status | Draft for review. |

> *This document does not constitute legal advice.* The classification must be carried out with qualified legal judgement (01 §13). References consulted in September 2026. The EU AI Act (Regulation (EU) 2024/1689) applies in stages and there are initiatives to amend the timetable for some obligations: verify the timetable and the text in force.

---

> **Legal notice and disclaimer.** SEVEN-G is a reference methodological framework provided "as is" and for information purposes only. It does not constitute legal, regulatory, financial or professional advice, nor does it guarantee compliance with any law or standard. References to general regulation (such as the EU AI Act, the GDPR, DORA or NIS2), to technical standards and to regulation specific to each sector or jurisdiction may be incomplete, may not apply to a particular case or may become out of date as a result of regulatory changes, interpretations or supervisory positions after their consultation date. **Each organisation that uses SEVEN-G is solely responsible for identifying the regulation that applies to it, verifying that it is current and certifying its own regulatory compliance**, with the appropriate qualified advice. The author accepts no liability for any use made of this content or for any decisions taken on the basis of it. The data, figures, companies and cases in the examples are fictitious or illustrative.

## 1. Instructions for use

| Aspect | Guidance |
|---|---|
| **When it is used** | Preliminary analysis in phase 0 (for P04 and P05). Full classification in phase 3, before G3. It is reviewed at each R6 and whenever the intended purpose, the scope, the company's role or the regulation changes. |
| **Who completes it** | The AI Risk Owner, with legal counsel and the data protection officer. The product owner provides the description of the system. |
| **Who verifies it** | Lite: AI Risk Owner; if they have prepared it, the AI Office or the AI Auditor verifies it. Enterprise: AI Auditor. |
| **Who decides** | Lite: sponsor with risk clearance. Enterprise: AI Committee. Legal validation is a prerequisite; it does not replace the decision. |
| **Gate at which it is reviewed** | G3 · Feasibility; checked at G5 and R6. |
| **Tool** | T07 · Regulatory classifier. |
| **Lite versus Enterprise** | Lite may omit the fields marked **(Enterprise)**. The full classification tree is mandatory in both. |

Completion rules:

- **Each AI system** is classified (one template per P05 record) according to its **intended purpose**, using the taxonomy of 03 §3.3 verbatim.
- If a system is high-risk and also has transparency obligations, the tag records the most demanding category and section 8 records all the obligations.
- A prohibited practice does not get past phase 3 under any circumstances (01 §6.5).

---

## 2. Identification

| Field | Content | Guidance |
|---|---|---|
| Initiative code | | IA-AAAA-NNN. |
| System code and name | | From P05. |
| Intended purpose | | Copy from P05. The classification is valid only for this purpose. |
| Document version | | |
| Date | | DD-MM-AAAA. |
| Author | | Name and role. |
| Legal validation | | Person, function and date. |

---

## 3. Classification tree

It is followed in order and stops at the first result that applies, except at step 4, which also requires step 5 to be checked.

| Step | Question | If the answer is yes | If the answer is no |
|---|---|---|---|
| 1 | Is it an AI system according to the definition in the Regulation (section 4)? | Step 2 | Out of scope (record "Rules (not AI)" in P05 where appropriate) |
| 2 | Does any exclusion from the scope apply (section 4)? | Out of scope | Step 3 |
| 3 | Does it match any prohibited practice (section 5)? | **Prohibited** | Step 4 |
| 4 | Is it high-risk (section 6)? | **High risk** and step 5 | Step 5 |
| 5 | Does it have transparency obligations (section 7)? | **Transparency obligations** (or they are added to High risk) | **Minimal risk** if it was not high-risk |

If any answer cannot be given with the information available, the result is **Pending classification**, with an owner and a date, and P04 treats it as a pending Enterprise criterion.

---

## 4. Definition and scope

| Question | Answer | Justification |
|---|---|---|
| Is it a machine-based system that, with some level of autonomy, infers from the input it receives how to generate outputs (predictions, content, recommendations or decisions) that can influence physical or virtual environments? | Yes · No | |
| Does an exclusion from the scope apply? Among others: use exclusively for military, defence or national security purposes; use for the sole purpose of scientific research and development; research, testing or development activities prior to placing on the market, without testing in real-world conditions. | Yes · No | State which, with legal validation. |

| Field | Content | Guidance |
|---|---|---|
| Company role for this system | | Provider · Deployer · Importer · Distributor · Authorised representative · Product manufacturer (consistent with P05). |
| Justification of the role | | |
| Could the company come to be considered a provider? | | Yes · No. Check whether it puts its name or trademark on a high-risk system, substantially modifies it or changes its intended purpose in such a way that it becomes high-risk. |

---

## 5. Prohibited practices

Does the system carry out or enable any of these practices? A single "Yes" answer, legally confirmed, classifies the system as **Prohibited**.

| # | Practice | Answer | Justification |
|---|---|---|---|
| 1 | Subliminal, purposefully manipulative or deceptive techniques that materially distort behaviour and cause or are reasonably likely to cause significant harm. | Yes · No | |
| 2 | Exploitation of vulnerabilities due to age, disability or a specific social or economic situation, with the same effect. | | |
| 3 | Evaluation or classification of persons based on their social behaviour or personal characteristics leading to unjustified or disproportionate detrimental treatment (social scoring). | | |
| 4 | Assessment of the risk of a person committing a criminal offence based solely on profiling or on personality traits. | | |
| 5 | Creation or expansion of facial recognition databases through untargeted scraping of facial images from the internet or CCTV footage. | | |
| 6 | Inference of emotions in the workplace or in educational institutions, except for medical or safety reasons. | | |
| 7 | Biometric categorisation to deduce race, political opinions, trade union membership, religious or philosophical beliefs, sex life or sexual orientation. | | |
| 8 | Real-time remote biometric identification in publicly accessible spaces for the purposes of law enforcement, outside the exceptions provided for. | | |

---

## 6. High risk

### 6.1 Safety component or regulated product

| Question | Answer | Justification |
|---|---|---|
| Is the system a product, or a safety component of a product, covered by the Union harmonisation legislation listed in the Regulation, that is required to undergo a third-party conformity assessment? | Yes · No | |

### 6.2 High-risk areas

Does the intended purpose correspond to any of these areas? The specific use case must be checked in the annex to the Regulation, not just the area.

| # | Area | Answer | Specific use case |
|---|---|---|---|
| 1 | Biometrics (remote identification, categorisation, emotion recognition, in the permitted cases). | Yes · No | |
| 2 | Critical infrastructure (safety components in its management and operation). | | |
| 3 | Education and vocational training (access, evaluation, monitoring of tests). | | |
| 4 | Employment, workers' management and access to self-employment (recruitment and selection, decisions on terms and conditions, promotion, termination, task allocation, performance evaluation). | | |
| 5 | Access to and enjoyment of essential private services and essential public services and benefits (among others, creditworthiness or credit scoring except for fraud detection, and risk assessment and pricing in life and health insurance). | | |
| 6 | Law enforcement. | | |
| 7 | Migration, asylum and border control management. | | |
| 8 | Administration of justice and democratic processes. | | |

### 6.3 Documented exception

A system in the areas in 6.2 may not be considered high-risk if it does not pose a significant risk of harm to health, safety or fundamental rights, for example because it performs a narrow procedural task, improves the result of a previously completed human activity, detects decision-making patterns without replacing human assessment or performs a preparatory task. **The exception does not apply if the system performs profiling of natural persons.**

| Field | Content | Guidance |
|---|---|---|
| Is the exception invoked? | | Yes · No. |
| Condition that is met | | Which and why. |
| Does it perform profiling of natural persons? | | If "Yes", the exception does not apply. |
| Documentation of the assessment | | Reference; the provider must document it and, in the cases provided for, register the system. |

---

## 7. Transparency obligations

| # | Situation | Answer | Main obligation |
|---|---|---|---|
| 1 | The system interacts directly with natural persons. | Yes · No | Design that informs them that they are interacting with an AI system, unless this is obvious (provider). |
| 2 | The system generates synthetic audio, image, video or text content. | | Marking of the content in a machine-readable format (provider). |
| 3 | The system performs emotion recognition or biometric categorisation. | | Inform the persons exposed (deployer). |
| 4 | The system generates or manipulates deep fakes. | | Disclose that the content has been generated or manipulated. |
| 5 | The system generates or manipulates text published to inform the public on matters of public interest. | | Disclose it, unless subject to human review with editorial responsibility. |

**General-purpose AI models (Enterprise).** If the company develops, or modifies in such a way that it may be considered the provider of, a general-purpose AI model, the chapter of the Regulation dedicated to these models must be analysed separately.

Notice texts and register in P49.

---

## 8. Classification result

| Field | Content | Guidance |
|---|---|---|
| **Regulatory classification** | | Prohibited · High risk · Transparency obligations · Minimal risk · Out of scope · Pending classification. |
| Additional obligations | | For example, transparency in addition to high risk. |
| Company role | | From section 4. |
| Reasoning | | Summary of the path through the tree. |
| Pending items | | What is missing, owner and date. |
| Legal validation | | Person, date and reference. |

*(illustrative example)* Assistant for responding to order queries. It is an AI system; there is no exclusion; it is not a prohibited practice; it does not correspond to high-risk areas; it interacts directly with customers. Role: provider (it develops the assistant on a third-party model and puts it into service under its own name) and deployer. Classification: **Transparency obligations**.

---

## 9. Impact assessments

### 9.1 Data protection impact assessment (GDPR)

| Question | Answer | Justification |
|---|---|---|
| Does it process personal data? | Yes · No | |
| Is there a systematic and extensive evaluation of personal aspects based on automated processing, including profiling, that produces legal effects or similarly significantly affects individuals? | | |
| Is there large-scale processing of special categories of data or of personal data relating to criminal convictions and offences? | | |
| Is there systematic monitoring of a publicly accessible area on a large scale? | | |
| Does the processing appear on the list of processing operations requiring an assessment published by the supervisory authority? | | |
| Are decisions taken based solely on automated processing with legal or similarly significant effects? | | If "Yes", also review the GDPR safeguards on automated decision-making. |
| **Result** | Required · Not required · Recommended | If required, it must be carried out before the processing. |
| Reference and date of the assessment | | Documented in P47. |
| Opinion of the data protection officer | | |

### 9.2 Fundamental rights impact assessment

It is required by the EU AI Act of certain deployers of high-risk systems, before their first use.

| Question | Answer | Justification |
|---|---|---|
| Is the system high-risk and is the company a deployer? | Yes · No | |
| Is the company a body governed by public law or a private entity providing public services? | | |
| Does the system evaluate the creditworthiness or credit score of natural persons, or carry out risk assessment and pricing in life or health insurance? | | |
| **Result** | Required · Not required · Recommended | Critical infrastructure systems are outside this obligation. |

Minimum content when required: processes in which the system will be used; period and frequency of use; categories of persons affected; specific risks of harm; human oversight measures; measures to be taken if the risks materialise, including internal governance and complaint mechanisms. The results are notified to the market surveillance authority and it may complement the data protection impact assessment. The assessment is documented in P48. Reference and date: ____.

### 9.3 Other assessments **(Enterprise)**

State whether they are required and where they are recorded: ICT or third-party risk assessment (DORA, NIS2), internal ethics assessment, information to workers' representatives and sector-specific assessments.

---

## 10. Resulting obligations

Each obligation is linked to a phase, a piece of evidence and an owner. The detailed mapping is in document 34.

| Obligation | Applies to the company as | Phase | Evidence | Owner | Status |
|---|---|---|---|---|---|
| | | | P code or document | | Pending · In progress · Fulfilled |
| AI literacy of the people who use the system | Provider or deployer | 4–5 | P20 | | |
| *(illustrative example)* Design the assistant so that the customer knows they are conversing with an AI system | Provider | 4 | P17 | Product owner | Pending |

For high-risk systems, as a deployer, review at least: use in accordance with the instructions, competent human oversight, relevant input data, monitoring, log retention, information to workers and affected persons, and explanation of individual decisions.

---

## 11. Quality criteria

The formal G3 criteria are in document 21 (see criteria G3.xx).

| # | Check | Status |
|---|---|---|
| 1 | The intended purpose is specific and matches P05. | Met · Not met · Not applicable · Pending |
| 2 | All steps of the tree have been answered in order. | |
| 3 | The company's role is justified. | |
| 4 | If the high-risk exception is invoked, it is documented and there is no profiling. | |
| 5 | The result uses the controlled taxonomy. | |
| 6 | The legal validation is recorded with a date. | |
| 7 | The need for each impact assessment has been determined and, if required, it exists or has a date prior to the processing or first use. | |
| 8 | The resulting obligations have a phase, evidence and owner. | |

---

## 12. Approval and verification

| Function | Role in SEVEN-G | Name and position | Date | Signature or reference |
|---|---|---|---|---|
| Prepares | AI Risk Owner | | | |
| Validates legally | Legal counsel or compliance | | | |
| Consulted | Data protection officer | | | |
| Verifies | AI Office or AI Auditor (Lite, if the risk owner prepares it) · AI Auditor (Enterprise) | | | |
| Decides | Sponsor with risk clearance (Lite) · AI Committee (Enterprise) | | | |
| ☐ Statement: "The organisation confirms that the regulatory classification and compliance have been verified with qualified advice and accepts responsibility for them; SEVEN-G is only a methodological reference." | Same body that decides | | | |

Segregation of duties: the risk owner does not verify a classification they have prepared.

---

## 13. Version control

**Completed document**

| Version | Date | Author | Changes |
|---|---|---|---|
| | | | |

**Template**

| Version | Date | Changes |
|---|---|---|
| 0.1 | 16-09-2026 | First version. Classification tree under the EU AI Act, data protection impact assessment and fundamental rights impact assessment, with the taxonomy of 03 §3.3. References consulted in September 2026. |
