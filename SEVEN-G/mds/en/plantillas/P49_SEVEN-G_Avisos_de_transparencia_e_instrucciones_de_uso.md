# Transparency notices and instructions for use

**Brings together the texts that inform people that they are dealing with an AI system or with generated content, the information for those affected by its decisions and the internal instructions for use for those who use it, with a register of where and since when each notice is shown.**

| | |
|---|---|
| Document | Template P49 · Transparency notices and instructions for use |
| Version | 0.1 (working draft) |
| Date | 19-09-2026 |
| Author | Fernando García Varela |
| Status | Draft for review. |

> *This template does not constitute legal advice.* The model texts are indicative and must be validated for each case. References consulted in September 2026; verify that they are current (document 34 §3.11).

---

> **Legal notice and disclaimer.** SEVEN-G is a reference methodological framework provided "as is" and for information purposes only. It does not constitute legal, regulatory, financial or professional advice, nor does it guarantee compliance with any law or standard. References to general regulation (such as the EU AI Act, the GDPR, DORA or NIS2), to technical standards and to regulation specific to each sector or jurisdiction may be incomplete, may not apply to a particular case or may become out of date as a result of regulatory changes, interpretations or supervisory positions after their consultation date. **Each organisation that uses SEVEN-G is solely responsible for identifying the regulation that applies to it, verifying that it is current and certifying its own regulatory compliance**, with the appropriate qualified advice. This methodology is a generic, free aid shared with the community so that nobody has to start from scratch; each person or organisation can and should adapt it to its own use. It must not be inferred that its legally sensitive parts have been reviewed by legal counsel: those reviews, for each company or sector, are the ultimate responsibility of the company, consultant or organisation that uses it. Although every effort is made to keep it up to date, some regulation may have changed without being reflected here. To the fullest extent permitted by law, the author accepts no responsibility whatsoever for the effects of its application in any organisation or for its full applicability. The methodology does not grant certification of any kind. The author accepts no liability for any use made of this content or for any decisions taken on the basis of it. The data, figures, companies and cases in the examples are fictitious or illustrative.

> **Why it matters.** The transparency obligations of Article 50 of the AI Act have applied since 2-08-2026 and are checked at G4 and G5; a person who does not know they are talking to an AI, or does not know how to ask for a person to review a decision that affects them, is both a breach and a loss of trust. Internal instructions for use are the basis of effective human oversight: whoever uses the system must know what it does, what not to ask of it and how to report a failure. Without a register of notices, the company cannot demonstrate which text each person saw or since when.

## 1. Instructions for use

| Aspect | Guidance |
|---|---|
| **When it is used** | It is drafted in phase 4, based on P11 §7 (transparency obligations) and P17 §8 (transparency and rights). It is tested in phase 5 (P22) and verified at G5. It is kept alive in phase 6: every change of text or channel is recorded in section 7. |
| **Who completes it** | The AI Product Owner, with the AI Technical Owner (technical marking and presentation in the interface), the data protection function and, for texts addressed to workers, employee relations. |
| **Who verifies it** | Lite: AI Office. Enterprise: AI Auditor. The AI Risk Owner issues clearance on the adequacy of the notices. |
| **Who decides or approves** | The AI Sponsor, with legal validation of the texts. |
| **Gate or moment** | G4 · Design (G4.05); G5 · Go-live (G5.15, evidence that they are shown); R6 (currency). |
| **Tool** | T07 · Regulatory classifier (applicable paragraphs of Article 50, 32 §3.4). |
| **Reference document** | 34 §3.7, §3.9 and §3.11; 50 §7 and §8.3; P17 §8; P24. |
| **Lite versus Enterprise** | Lite may omit the fields marked **(Enterprise)**. The notices required by the classification are mandatory in both. |

Completion rules:

- **One template per AI system** (SIA-AAAA-NNN). Only the notices that section 3 marks as applicable are completed.
- The information is provided in a **clear and distinguishable manner, at the latest at the time of the first interaction or exposure** (Article 50.5), in the person's language and with accessibility criteria.
- Texts in [square brackets] are replaced with the details of the case. No text with outstanding brackets is published.
- Support: the Commission's Guidelines on transparency obligations (Art. 50) and the code of practice on marking and labelling (34 §3.3).
- If the system performs emotion recognition, first check in P11 §5 that it is not a prohibited practice (inference of emotions in the workplace or in education institutions, Article 5.1.f).

---

## 2. Identification

| Field | Content | Guidance |
|---|---|---|
| Initiative code | | IA-AAAA-NNN. |
| System code and name | | SIA-AAAA-NNN from P05 (T02). |
| Regulatory classification | | From P11 §8. |
| Applicable paragraphs of Article 50 | | None · 50.1 · 50.2 · 50.3 · 50.4 (P11 §7; 32 §3.4). |
| Company role | | Provider · Deployer (determines who owes each notice). |
| Channels in which the system is used | | Web, app, telephone, email, documents, internal tool. |
| Document version | | |
| Date | | DD-MM-AAAA. |
| Status | | Draft · Legal validation · Approved · Published · Superseded. |

---

## 3. Required notices

| # | Situation | Basis | Obliged party | Applies? | Model text |
|---|---|---|---|---|---|
| 1 | People who interact directly with the system | AI Act, Art. 50.1 (unless it is obvious) | Provider | Yes · No | 4.1 |
| 2 | Synthetic audio, image, video or text content | Art. 50.2 (machine-readable marking) | Provider | | 4.2 (technical marking, P18) |
| 3 | Deep fakes and texts published to inform the public on matters of public interest | Art. 50.4 (except human review with editorial responsibility, for texts) | Deployer | | 4.2 |
| 4 | People exposed to emotion recognition or biometric categorisation | Art. 50.3 | Deployer | | 4.3 |
| 5 | People subject to an Annex III system that takes decisions or assists in taking them | Art. 26.11 | Deployer | | 4.4 |
| 6 | Automated decisions and logic involved; right of access | GDPR, Arts. 13.2.f, 14.2.g, 15.1.h and 22 | Controller | | 4.4 |
| 7 | Explanation of individual decisions | AI Act, Art. 86 | Deployer of an Annex III high-risk system | | 4.5 |
| 8 | Workers and their representatives | AI Act, Art. 26.7; Estatuto de los Trabajadores (Workers' Statute), Art. 64.4.d) | Employer | | 4.6 |
| 9 | People who use the system within the company | Instructions for use (Arts. 13 and 26.1 for high risk; good practice in all cases) | Provider and deployer | Yes | Section 5 |

---

## 4. Model texts

### 4.1 Interaction with an AI system

| Channel | Model text | Moment |
|---|---|---|
| Written assistant | "You are talking to [assistant name], an artificial intelligence assistant from [company]. It may make mistakes. If you would prefer to be helped by a person, type [keyword] or call [channel]." | When the conversation opens, before the first message. |
| Voice | "You are being assisted by an automated artificial intelligence assistant from [company]. To speak to a person, say [keyword] at any time." | At the start of the call. |
| Email or message generated and sent without human review | "This message has been drafted by an artificial intelligence system from [company]. For any queries, reply to this message or write to [channel]." | In the message itself. |

### 4.2 Generated or manipulated content

| Situation | Model text | Guidance |
|---|---|---|
| Image, audio or video that is a deep fake | "Content generated or modified with artificial intelligence." | Visible next to the content; form and exceptions according to the Commission guidelines on Art. 50. |
| Text published to inform the public on matters of public interest | "This text has been generated [or modified] with artificial intelligence [and reviewed by [role]]." | Not required if there is human review with editorial responsibility; in that case, record who assumes it. |
| Machine-readable marking of synthetic content | It is not a text: it is a technical measure of the provider (metadata, watermarks or others). | Documented in P18 and tested in P22. |

### 4.3 Emotion recognition or biometric categorisation

| Model text | Moment |
|---|---|
| "At [place or service], [company] uses an artificial intelligence system that [analyses facial expressions or voice to estimate emotions / classifies people according to biometric characteristics] for the purpose of [purpose]. The data are processed in accordance with [reference to the data protection information]. Further information and exercise of rights: [channel]." | Before exposure, at the point of access or at first contact. |

### 4.4 Information to people affected by decisions

| Situation | Model text |
|---|---|
| Annex III system that takes or supports decisions about the person | "In the [assessment / processing] of your [application], [company] uses an artificial intelligence system that [describes what it does: calculates a score, ranks, proposes]. The final decision is taken by [role]. You may ask for an explanation of the decision, express your point of view and request that a person review it at [channel], within [internal time limit]." |
| Decision based solely on automated processing, where permitted | "This decision has been taken by automated means. The main factors considered are [factors in plain language] and its consequence is [effect]. You have the right to obtain human intervention, to express your point of view and to contest the decision at [channel]." |

Meaningful information about the logic involved is written in plain terms and does not require disclosing source code (50 §7.3); its scope is analysed in light of the CJEU judgment C-203/22 (Dun & Bradstreet Austria) (34 §6.2).

### 4.5 Response to a request for explanation

| Element of the response | Content |
|---|---|
| Which decision is explained | [decision, date and reference] |
| Role of the AI system | [what the system did and what a person decided] |
| Main elements of the decision | [factors and their relative weight, in plain language] |
| What the person can do | [human review, complaint, time limit and channel] |
| Who responds | [reviewing role, never the system itself] |

### 4.6 Workers and their representatives

The information sheet in document 50 §7.3 is used (identification, decisions affected, data, parameters and rules, human intervention, controls, rights and changes). Short notice to the affected workforce:

"Since [date], [system name], an artificial intelligence system that [what it does], has been used in [process]. The final decision rests with [role]. The workers' representatives were informed on [date]. You can consult the system information sheet at [location] and request human review at [channel]."

---

## 5. Internal instructions for use

For the people who use or oversee the system. For high-risk systems, they are based on the provider's instructions for use (Article 13) and the company must use the system in accordance with them (Article 26.1). They are delivered with the training in P20 and linked from the operations manual (P24).

| Section | Model content | Guidance |
|---|---|---|
| What it is and what it is for | "[System name] [what it does] in order to [purpose]. It must only be used for [permitted uses]." | Consistent with the intended purpose (P05). |
| What must not be done | "Do not use it for [excluded uses]. Do not enter [categories of information not permitted under the acceptable use policy]." | Document 31. |
| Known limitations | "It may be wrong in [situations]. Its performance is lower when [conditions]." | From P16 and P21. |
| How to interpret the output | "The output is [a proposal / a score / a draft]. Always check [elements] before [action]." | P17 §7. |
| Human oversight | "You must validate [decisions]. You may decline to use, correct or override the output in [function]. [Non-delegable decisions] are never decided automatically." | P17 §5 and §6. |
| Risk of over-reliance | "The system may appear confident even when it is wrong. If the output does not seem reasonable, do not apply it and ask." | P17 §7. |
| How to report a failure | "If you detect an error, a discriminatory output, an information leak or unusual behaviour, report it at [channel] stating [minimum details]. In an emergency, [stop procedure or on-call contact]." | P26 and P27. |
| Contact | [responsible role and channel] | P24 §4. |
| Version | [version of the system and of these instructions, date] | Updated with every relevant change (P27). |

---

## 6. Requests for explanation and review **(Enterprise)**

Register of requests received through the channels in sections 4.4 and 4.5. No identifying personal data: the case reference is used.

| No. | Date | Case reference | Type | Internal time limit | Response and date | Reviewing role | Did the decision change? |
|---|---|---|---|---|---|---|---|
| | | | Explanation · Human review · Complaint · Access | | | | Yes · No |
| *(illustrative example)* 01 | 03-02-2027 | EXP-00871 | Human review | 10 working days | Reviewed and upheld, 11-02-2027 | Head of the area | No |

Complaints and changed decisions feed the indicators in P17 §10 and P25.

---

## 7. Register of notices

| No. | Notice (section) | Channel and location | Text version | Publication date | Owner | Test in P22 | Status |
|---|---|---|---|---|---|---|---|
| AV01 | | | | | | Passed · Failed · Pending | Current · Superseded · Withdrawn |
| AV02 | | | | | | | |
| *(illustrative example)* AV01 | 4.1 Written assistant | Chat window on the website, before the first message | 1.1 | 15-01-2027 | AI Product Owner | Passed | Current |

The AVnn numbering is local to each system. A superseded text is kept with its period of validity.

---

## 8. Quality criteria

The formal criteria are in document 21 (G4.05 and G5.15).

| # | Check | Status |
|---|---|---|
| 1 | The applicable notices match P11 §7 and the company's role. | Met · Not met · Not applicable · Pending |
| 2 | Each notice is shown at the latest at the first interaction or exposure, clearly and accessibly. | |
| 3 | No texts with unreplaced [square brackets] remain and the texts have legal validation. | |
| 4 | People affected by decisions know how to request an explanation and human review (G4.05). | |
| 5 | The technical marking of synthetic content is documented in P18 and tested in P22, where applicable. | |
| 6 | The internal instructions for use cover purpose, limits, human oversight and how to report failures, and have been delivered with the training. | |
| 7 | The presence of each notice was tested before G5 (G5.15) and the register is up to date. | |

---

## 9. Approval and verification

| Function | Role in SEVEN-G | Name and position | Date | Signature or reference |
|---|---|---|---|---|
| Prepares | AI Product Owner | | | |
| Implements in the interface and marks the content | AI Technical Owner | | | |
| Validates legally | Legal counsel or compliance; data protection officer | | | |
| Issues clearance | AI Risk Owner | | | |
| Verifies | AI Office (Lite) · AI Auditor (Enterprise) | | | |
| Approves | AI Sponsor | | | |

Segregation of duties: whoever drafts the texts does not verify their presence in production.

---

## 10. Version control

**Completed document**

| Version | Date | Author | Changes |
|---|---|---|---|
| | | | |

**Template**

| Version | Date | Changes |
|---|---|---|
| 0.1 | 19-09-2026 | First version. Model texts and register of Article 50 transparency notices, information to people affected by decisions and internal instructions for use, based on 34 §3.7, §3.9 and §3.11, 50 §7, P17 §8 and P24. References consulted in September 2026. |
