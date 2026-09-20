# Information to workers and their representatives

**Prepares the information sheet for an AI system that affects work, records each instance of information and consultation of workers' representatives and maintains the internal register of systems that affect employees.**

| | |
|---|---|
| Document | Template P46 · Information to workers and their representatives |
| Version | 0.1 (working draft) |
| Date | 19-09-2026 |
| Author | Fernando García Varela |
| Status | Draft for review. |

---

> **Legal notice and disclaimer.** SEVEN-G is a reference methodological framework provided "as is" and for information purposes only. It does not constitute legal, regulatory, financial or professional advice, nor does it guarantee compliance with any law or standard. References to general regulation (such as the EU AI Act, the GDPR, DORA or NIS2), to technical standards and to regulation specific to each sector or jurisdiction may be incomplete, may not apply to a particular case or may become out of date as a result of regulatory changes, interpretations or supervisory positions after their consultation date. **Each organisation that uses SEVEN-G is solely responsible for identifying the regulation that applies to it, verifying that it is current and certifying its own regulatory compliance**, with the appropriate qualified advice. The author accepts no liability for any use made of this content or for any decisions taken on the basis of it. The data, figures, companies and cases in the examples are fictitious or illustrative.

> **Why it matters.** When an AI system plays a part in decisions on working conditions or employment, informing before using it is legal compliance, not internal communication: for systems that require it, G5 cannot be resolved as *Proceed* without evidence that the information has been provided, and the lack of it does not allow *Proceed with conditions* (50 §7.2). This template gives the company an understandable sheet and a record with date, content and response that shows what was communicated, to whom and when. Without it, risk RT-ORG-07 (failure to inform and consult) is only discovered when the workers' representatives raise it.

## 1. Instructions for use

| Aspect | Guidance |
|---|---|
| **When it is used** | Per system: in phase 3 it is determined whether there is an obligation (section 3); in phase 4 the sheet is prepared (section 4); information or consultation takes place before the pilot with real people and, in any case, before use in production (section 5); it is updated at each relevant change and reviewed at R6 (50 §7.2 and §13). Per company: the internal register in section 6 is maintained continuously. |
| **Who completes it** | The AI Product Owner with the people function or, if there is one, the labour relations lead for AI (50 §4.2). The determination in section 3 is made by labour relations and legal counsel. |
| **Who verifies it** | AI Office in Lite; AI Auditor in Enterprise. |
| **Who decides or approves** | The AI Sponsor and the Head of People approve the sheet and the timing of delivery (34 §3.9). The *gate* body checks the evidence at G5. |
| **Stage, *gate* or moment** | G3 (obligation analysed, criterion G3.16), G5 (information provided when mandatory) and R6 (information updated). The internal register is reviewed in C4. |
| **Tool** | T20 · Adoption and capacity plan (34 §3.9). The internal register is derived from the T02 inventory, field *Information to workers and their representatives* (32 §3.5). |
| **Reference document** | 50 §7 and §8; 23 §9.3, §11.1 and §13.2; 32 §3.5; 34 §3.9; P11; P17; P20. |
| **Lite versus Enterprise** | **The same in both intensities when it is mandatory** (23 §13.2): no field of this template may be omitted in Lite if section 3 concludes that there is an obligation. |

Completion rules:

- **Understandable to non-specialists** (measurement rule 10): the sheet explains parameters and rules without disclosing source code (50 §7.3).
- **Those affected first:** affected groups and their representatives learn of the changes before the rest of the organisation and before external parties (50 §10.1).
- **Jurisdiction.** The references in section 3 are those of Spain and the European Union set out in 50 §7.1 and 34 §3.9; in other countries they are replaced by those identified in the context statement (P02).
- This template does not constitute legal advice. The obligation, its content and its timing are determined by legal and labour counsel.

---

## 2. Identification

| Field | Content | Guidance |
|---|---|---|
| Initiative code | | IA-AAAA-NNN. |
| AI system | | SIA-AAAA-NNN (P05). |
| System name | | Functional name. |
| Intensity and regulatory classification | | P04 and P11. |
| Affected groups and number of people | | From the effect analysis in P20. |
| Sites and countries | | |
| Existing representative bodies | | Works council · staff delegates · trade union delegates · none. |
| Owner of the sheet | | |
| Version and date | | DD-MM-AAAA. |

---

## 3. Determination of the obligation

### 3.1 Identification questions (50 §7.2, step 1)

| # | Question | Answer (Yes · No · No data) | Source |
|---|---|---|---|
| 1 | Does the system play a part in decisions that may have an impact on working conditions? | | P20 |
| 2 | Does it play a part in access to or retention of employment? | | P20; P11 |
| 3 | Does it profile workers or candidates? | | P11 |
| 4 | Is it a high-risk system under Annex III, point 4 (employment and workers management), used in the workplace? | | P11 |
| 5 | Does it change the organisation of work even if it is not a decision-making algorithm? | | P20 |

### 3.2 Applicable references (50 §7.1; 34 §3.9)

| Reference | What it requires | Applies? |
|---|---|---|
| EU AI Act, Art. 26(7) | Deployers who are employers inform workers' representatives and the affected workers before putting into service or using a high-risk AI system in the workplace. | |
| Estatuto de los Trabajadores (Workers' Statute), Article 64.4.d) | Right of the works council to be informed of the parameters, rules and instructions of the algorithms or AI systems that affect decisions that may have an impact on working conditions, access to and retention of employment, including profiling. | |
| Estatuto de los Trabajadores, Article 64 (remainder), and applicable collective agreement | Information and consultation on changes in the organisation of work; the collective agreement may extend obligations. | |
| GDPR, Arts. 13, 14, 15, 22 and 88 | Information to data subjects, right of access, automated individual decision-making and processing in the employment context. | |
| LOPDGDD, Arts. 87 to 91 | Digital rights in the workplace. | |
| Other jurisdictions (P02) | | |

### 3.3 Conclusion (50 §7.2, step 2)

| Field | Content | Guidance |
|---|---|---|
| Conclusion | | Information mandatory · Information and consultation mandatory · Information recommended · Not applicable. |
| Recipients | | Workers' representatives · affected workers · both. |
| Timing | | Before the pilot with real people · before production · other set by counsel. |
| Legal note | | Reference linked in P11. |
| Signed by | | Labour relations and legal counsel, with date. |

---

## 4. System information sheet

The eight points of 50 §7.3. The summarised version (points 1, 2, 5 and 7) feeds the internal register in section 6.

| # | Point | Content | Guidance |
|---|---|---|---|
| 1 | Identification | | System, purpose, area, owner and supplier. |
| 2 | Decisions affected | | Which decisions it supports or makes, about whom and with what autonomy (A0 · A1 · A2 · A3); limits in 50 §8.2. |
| 3 | Data | | Categories, origin and period; exclusion or justification of special categories. |
| 4 | Parameters and rules | | Main variables and their relative importance in understandable terms; rules and thresholds; instructions given to the system. |
| 5 | Human intervention | | Who reviews, with what authority and how to disagree (P17). |
| 6 | Controls | | Bias testing and summary result; monitoring; review (P22, P25). |
| 7 | Rights | | How to request information, an explanation or human review; complaints channel. |
| 8 | Changes | | Version, date and changes from the previous version. |

*(illustrative example, point 2)* "The system proposes the weekly shift allocation for the logistics centre based on the volume forecast and the recorded preferences. It acts with A1 autonomy: the shift manager validates or modifies each proposal before publishing it. It does not use health or trade union membership data."

---

## 5. Register of information and consultations

One row per delivery, meeting or response. **Moment:** Before the pilot · Before production · Relevant change · R6 · At the request of the representatives.

| Code | Date | Moment | Recipient | Type | Sheet version | Means | Questions or position of the representatives | Company response and date | Reference (minutes or acknowledgement) |
|---|---|---|---|---|---|---|---|---|---|
| INF-AAAA-NNN | | | Works council · delegates · affected workers | Information · Consultation | | Meeting · in writing · intranet | | | |
| *(illustrative example)* INF-2026-004 | 14-10-2026 | Before the pilot | Works council | Information | 1.0 | Meeting and delivery in writing | Asks whether productivity data will be used in individual performance evaluation | Written response on 21-10-2026: they are not used to evaluate people (50 §9.2) | Minutes of the meeting of 14-10-2026 |
| | | | | | | | | | |

---

## 6. Internal register of systems that affect employees

Company register, accessible to all employees (50 §7.4). It is derived from T02: systems with exposure to employees or with decisions about people in the *Employment and labour relations* scope (32 §3.3).

| Code (T02) | System | What it is used for | Groups | Decisions and autonomy | How to request human review | Sheet version | Latest information to the representatives | System status |
|---|---|---|---|---|---|---|---|---|
| SIA-AAAA-NNN | | | | | | | INF-AAAA-NNN, date | Pilot · In production · Suspended · Retired |
| *(illustrative example)* SIA-2026-030 | Shift allocation | Proposes the weekly shifts for the logistics centre | Warehouse staff | Shift allocation · A1 | Shift manager or the people complaints channel | 1.0 | INF-2026-004, 14-10-2026 | Pilot |

---

## 7. Indicator

| Indicator | Formula | Indicative reference | Result | Frequency |
|---|---|---|---|---|
| PER-08 · IND-ADO-12 · Prior information to workers' representatives | Systems with an effect on working conditions or employment informed before their use ÷ systems with that effect | 100 % | | Quarterly |

---

## 8. Quality criteria

| # | Check | Status |
|---|---|---|
| 1 | The obligation has been analysed in phase 3 with legal input (criterion G3.16 of document 21). | Met · Not met · Not applicable · Pending |
| 2 | The sheet covers the eight points of 50 §7.3 and is understandable to non-specialists. | |
| 3 | If information is mandatory, it is recorded as provided before the pilot with real people and, in any case, before G5 (23 §11.1; 50 §7.2). | |
| 4 | Each delivery has a date, recipient, sheet version and reference to minutes or acknowledgement, and the questions have a recorded response. | |
| 5 | Relevant changes have led to a new version of the sheet and to new information (reviewed at R6). | |
| 6 | The internal register is accessible to employees and matches the inventory. | |
| 7 | Information and consultation are recorded when regulations or agreements require it (question D5.08 of document 11). | |

---

## 9. Approval and verification

| Function | Role in SEVEN-G | Name and position | Date | Signature or reference |
|---|---|---|---|---|
| Prepares the sheet and the register | AI Product Owner with the people function | | | |
| Determines the obligation | Labour relations and legal counsel | | | |
| Approves the sheet and the timing of delivery | AI Sponsor and Head of People | | | |
| Verifies | AI Office (Lite) · AI Auditor (Enterprise) | | | |
| Decides the *gate* | Body in 01 §7.5 (recorded in P29) | | | |

Segregation of duties: whoever prepares the sheet does not verify that the information has been provided.

---

## 10. Version control

**Completed document**

| Version | Date | Author | Changes |
|---|---|---|---|
| | | | |

**Template**

| Version | Date | Changes |
|---|---|---|
| 0.1 | 19-09-2026 | First version. Determination of the obligation with the references of 50 §7.1 and 34 §3.9, eight-point information sheet (50 §7.3), register of information and consultations, mandatory in Lite and Enterprise (23 §13.2), and internal register of systems that affect employees (50 §7.4). Proposes the code INF-AAAA-NNN. |
