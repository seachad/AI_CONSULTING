# Catalogue of authorised tools and requests

**Publishes which AI tools may be used, with what information and under what conditions, and records requests for new tools and employee reports of incidents or questionable uses.**

| | |
|---|---|
| Document | Template P43 · Catalogue of authorised tools and requests |
| Version | 0.1 (working draft) |
| Date | 19-09-2026 |
| Author | Fernando García Varela |
| Status | Draft for review. |

---

> **Legal notice and disclaimer.** SEVEN-G is a reference methodological framework provided "as is" and for information purposes only. It does not constitute legal, regulatory, financial or professional advice, nor does it guarantee compliance with any law or standard. References to general regulation (such as the EU AI Act, the GDPR, DORA or NIS2), to technical standards and to regulation specific to each sector or jurisdiction may be incomplete, may not apply to a particular case or may become out of date as a result of regulatory changes, interpretations or supervisory positions after their consultation date. **Each organisation that uses SEVEN-G is solely responsible for identifying the regulation that applies to it, verifying that it is current and certifying its own regulatory compliance**, with the appropriate qualified advice. This methodology is a generic, free aid shared with the community so that nobody has to start from scratch; each person or organisation can and should adapt it to its own use. It must not be inferred that its legally sensitive parts have been reviewed by legal counsel: those reviews, for each company or sector, are the ultimate responsibility of the company, consultant or organisation that uses it. Although every effort is made to keep it up to date, some regulation may have changed without being reflected here. To the fullest extent permitted by law, the author accepts no responsibility whatsoever for the effects of its application in any organisation or for its full applicability. The methodology does not grant certification of any kind. The author accepts no liability for any use made of this content or for any decisions taken on the basis of it. The data, figures, companies and cases in the examples are fictitious or illustrative.

> **Why it matters.** The acceptable use policy (31 §4.2) refers employees to a catalogue of authorised tools: if the catalogue does not exist or does not state with what information each tool may be used, the policy cannot be complied with and unauthorised use grows for lack of an alternative. This template turns that reference into a publishable register, gives new needs —the most frequent cause of unauthorised use— a channel with a time limit, and captures employee reports, which are often the first signal of an incident.

## 1. Instructions for use

| Aspect | Guidance |
|---|---|
| **When it is used** | It is created in C2, when the acceptable use policy is approved, and is a living register: it is updated with each resolved request, each regularisation of unauthorised use (31 §5.5), each activation of embedded AI (31 §5.6) and at the annual review in C5. Sections 4 and 5 are used each time a request or a report arrives. |
| **Who completes it** | The AI Office maintains the catalogue and assesses requests, with information security, data protection and procurement. The employee completes the request (section 4.1) and the report (section 5.1). |
| **Who verifies it** | The AI Auditor or internal audit, by sampling, within the audit plan (document 38). |
| **Who decides or approves** | Additions and changes of category are decided by the AI Office, or by the AI Committee if the tool meets an Enterprise criterion (31 §5.5; 30 §7.5). Blocking is decided by information security with the AI Office. |
| **Corporate cycle stage, *gate* or moment** | C2 (initial catalogue with the policy), C4 (T21 monitor reviewed by the AI Committee) and C5 (annual review). In an initiative, G3 and G5 check that the tools used are in the catalogue or in the inventory. |
| **Tool** | T21 · Corporate AI use monitor (catalogue, pending requests and response time). Each authorised tool is registered in T02 (P05); reports that turn out to be incidents or nonconformities, in T08 (P27). |
| **Reference document** | 31 §4.2, §4.3, §4.7, §4.8 and §5 (including §5.2 to §5.7); 32 §2.1 and §3.3; 37 §4; P05; P14. |
| **Lite versus Enterprise** | The catalogue, the request and the report are mandatory in both implementation scopes (90 §2.1). In a Lite scope, the fields marked **(Enterprise)** may be omitted. |

Completion rules:

- **One row per tool and edition.** The corporate version and the free or personal version of the same tool are separate entries; the personal one is listed as *Not authorised* (31 §4.2.3).
- **Every tool in the catalogue has an inventory code** SIA-AAAA-NNN with the type of use *Corporate use of general-purpose AI* (32 §2.1). No registration in T02, no entry in the catalogue.
- The information levels are those of the company's classification (in the models of document 31: [Public] · [Internal] · [Confidential] · [Restricted]). The seven categories of 31 §4.3 are prohibited unless the row expressly authorises them.
- A tool that meets an Enterprise criterion, is configured to act (A2 or A3) or is integrated into a shared process is not resolved here: it moves to the full cycle as an initiative (31 §3.6 and §5.1).

---

## 2. Identification

| Field | Content | Guidance |
|---|---|---|
| Company or perimeter | | Company, country or unit to which it applies (90 §2.3). |
| Catalogue version | | Incremented with each addition, removal or change of conditions. |
| Publication date | | DD-MM-AAAA. |
| Approved by | | AI Office or AI Committee, with reference to the minutes. |
| Reference acceptable use policy | | Version and date (document 31, section 4). |
| Place of publication | | Intranet or another channel accessible to all employees. |
| Tool request channel | | Form, mailbox or request manager. |
| Response time for requests | | Indicative: [15 working days] (31 §4.2.5). |
| Channel for reporting incidents and questionable uses | | The one in 31 §4.8 and, for confidential reports, the internal reporting system (Law 2/2023). |
| Next review | | At the latest, at the annual review in C5. |

---

## 3. Tool catalogue

### 3.1 Categories

| Category | Meaning (31 §4.2) |
|---|---|
| **Authorised** | May be used for the stated purposes with information up to the [Confidential] level, with a corporate account. |
| **Authorised with restrictions** | Only for certain uses, groups or information levels. |
| **Not authorised** | May not be used for work. |

### 3.2 Catalogue register

| Code (T02) | Tool, edition and supplier | Category | Authorised purposes | Groups | Maximum autonomy | Permitted connections | Conditions of use | Required training | Supplier assessment (P14) | Service owner | Added · next review |
|---|---|---|---|---|---|---|---|---|---|---|---|
| SIA-AAAA-NNN | | Authorised · Authorised with restrictions | | | A0 · A1 · A2 (31 §4.7; A3 not permitted) | Email · documents · calendar · none | Corporate account; no training on company data; logs retained | F1 · F2 (31 §6.2) | N1 · N2 · N3, date | | |
| | | | | | | | | | | | |
| *(illustrative example)* SIA-2026-014 | Generative writing assistant, corporate edition, fictitious supplier | Authorised with restrictions | Drafting and summarising internal documents | All employees with F1 | A0 | None | Corporate account; the supplier does not use the data for training; logs retained for 12 months | F1 | N1, 10-09-2026 | Technology department | 15-09-2026 · 15-09-2027 |

### 3.3 Conditions by information level

Mark each cell: **Permitted** · **With conditions** (state which) · **Not permitted**.

| Code (T02) | [Public] | [Internal] | [Confidential] | [Restricted] | Personal data | Special categories | Credentials and secrets |
|---|---|---|---|---|---|---|---|
| | | | | | | | Not permitted |
| *(illustrative example)* SIA-2026-014 | Permitted | Permitted | With conditions: no customer data | Not permitted | Not permitted | Not permitted | Not permitted |

### 3.4 Tools not authorised

| Tool or type | Reason | Catalogue alternative | Technical blocking (Yes · No) | Date of decision |
|---|---|---|---|---|
| *(illustrative example)* Free or personal versions of generative assistants | Use of the data by the supplier; no corporate logs | SIA-2026-014 | Yes | 15-09-2026 |
| | | | | |

### 3.5 Embedded AI and productivity suites

| Code (T02) | Product and AI function | Detection source (31 §5.6, step 1) | Status | Decision (31 §5.6, step 5) | Controls of 31 §5.7 met **(Enterprise)** | Decided by · date |
|---|---|---|---|---|---|---|
| | | Release notes · renewal · supplier notice · console | Disabled · Under assessment · Enabled | Do not activate · Activate as corporate use with conditions · Full cycle | Permissions · labelling · data use · logs · transcription · agentic functions · licences · prior training | |

---

## 4. Request for a new tool

### 4.1 Request (completed by the employee)

| Field | Content | Guidance |
|---|---|---|
| Request code | | SOL-AAAA-NNN (code proposed by this template). |
| Requester, position and area | | |
| Date | | DD-MM-AAAA. |
| Tool, edition and supplier | | |
| Need | | Which task it is meant to solve and why the current catalogue is not enough. |
| Group and number of users | | |
| Information that would be used | | Highest level ([Public] · [Internal] · [Confidential] · [Restricted]) and whether it includes personal data or any category of 31 §4.3. |
| Agent functions or connections | | Whether it would act on the user's behalf (31 §4.7) or connect to email, documents or other systems. |
| Is it already in use? | | Yes · No. If Yes, it is also recorded as declared unauthorised use (31 §5.3 and §5.5; initial regularisation period, if open). |
| Estimated cost | | Licences per user per year, if known. |

### 4.2 Assessment (completed by the AI Office)

| Field | Content | Guidance |
|---|---|---|
| Is there an alternative in the catalogue? | | If there is and it meets the need, *Refer to the catalogue* is proposed. |
| Preliminary classification | | Type of use, provisional regulatory classification, exposure and autonomy (32 §3.3 and §3.4). |
| Does it meet any Enterprise criterion? | | The eight in 31 §3.5. If any is met, *Treat as an initiative* is proposed and the AI Committee decides. |
| Supplier assessment | | P14 with level N1 · N2 · N3 (document 36). |
| Contractual terms | | Use of the data for training, location, sub-processors, logs and liability (31 §5.6, step 4). |
| Data protection and security | | Need for a data protection impact assessment (GDPR); controls of document 35. |
| Annual cost and licences | | *Licences* category of document 42. |
| Proposed category and conditions | | Proposed rows for sections 3.2 and 3.3. |

### 4.3 Resolution

| Field | Content | Guidance |
|---|---|---|
| Resolution | | Authorise · Authorise with restrictions · Refer to the catalogue · Refuse · Treat as an initiative (phase 0, T01). |
| Reason | | Mandatory in all cases. |
| Decided by | | AI Office; AI Committee if there is an Enterprise criterion. Never the requester. |
| Date of resolution and working days elapsed | | Against the time limit in section 2. |
| Resulting actions | | Registration in T02 (SIA code), catalogue update, F1 or F2 training, procurement and configuration. |
| Communication to the requester | | Date and channel. |

---

## 5. Reporting incidents and questionable uses

### 5.1 Report (completed by the employee)

Reporting your own error or a misuse in good faith does not lead to retaliation and is regarded as a mitigating factor (31 §3.9 and §4.8).

| Field | Content | Guidance |
|---|---|---|
| Code | | COM-AAAA-NNN (code proposed by this template). |
| Date and time | | Of the event and of the report. |
| Reporter | | Name and area, or *confidential* if the internal reporting system is used. |
| What happened | | Information mistakenly entered into a tool not authorised for it · Output that has caused or may cause harm · Unexpected behaviour of a system or agent · Attempted manipulation or AI-enabled attack · Use of unauthorised tools by other people · Doubt as to whether a use is permitted. |
| Tool or system | | Name and, if known, catalogue code. |
| Information affected | | Categories 1 to 7 of 31 §4.3, or none. |
| Description | | What happened, when and whom it affects, without copying the sensitive information into the form. |
| Measures already taken | | For example, agent deactivated or session closed. |

### 5.2 Triage (completed by the AI Office)

| Field | Content | Guidance |
|---|---|---|
| Classification | | Query resolved · Incident (INC-AAAA-NNN, P27) · Nonconformity due to unauthorised use (NC-AAAA-NNN) · Tool request (section 4) · Referral to the internal reporting system. |
| Incident severity | | S1 · S2 · S3 · S4 using the criteria of 37 §4.2. Triage meets the times in 37 §4.3. |
| Nonconformity classification | | Critical · Major · Minor using the criteria of 31 §5.4. |
| Assessment of notifications | | For example, personal data breach (GDPR) or serious incident (EU AI Act): document 37 §5. |
| Response to the reporter | | Date and content; for doubts, the answer is added to the catalogue's frequently asked questions. |

### 5.3 Report register

| Code | Date | Type | Tool | Classification | Reference (INC · NC · SOL) | Status | Closure |
|---|---|---|---|---|---|---|---|
| | | | | | | Received · In triage · Referred · Closed | |
| *(illustrative example)* COM-2026-031 | 02-10-2026 | Information mistakenly entered | Unauthorised free assistant | Major nonconformity | NC-2026-012 | Referred | |

---

## 6. Indicators for the T21 monitor

Data are presented aggregated by area (31 §7.2). *No data* is not zero.

| Indicator | Formula or content | Frequency |
|---|---|---|
| Catalogue composition | Authorised, restricted and not authorised tools | Monthly |
| Pending requests | Requests without a resolution at the end of the period | Monthly |
| Average response time | Average working days between request and resolution, against the time limit in section 2 | Monthly |
| Resolutions by type | Authorise · with restrictions · refer · refuse · initiative | Quarterly |
| Reports by type and classification | Count from section 5.3 | Monthly |
| Embedded AI awaiting decision | Functions with status *Under assessment* | Quarterly |

---

## 7. Quality criteria

| # | Check | Status |
|---|---|---|
| 1 | The catalogue is published, accessible to all employees and consistent with the acceptable use policy in force (question D1.04 of document 11). | Met · Not met · Not applicable · Pending |
| 2 | Each authorised tool has an SIA code in the inventory and a supplier assessment (question D6.03 of document 11). | |
| 3 | Each row states purposes, groups, maximum autonomy, conditions and maximum information level. | |
| 4 | Requests have a reasoned resolution, decided by the appropriate party and within the time limit, or the delay is explained. | |
| 5 | No tool with an Enterprise criterion or with A2 or A3 autonomy over third parties is listed as corporate use without an initiative. | |
| 6 | Each report has been triaged and, where applicable, has an INC or NC code linked in T08. | |
| 7 | The AI Committee reviews these indicators in the T21 monitor (question D6.09 of document 11). | |

---

## 8. Approval and verification

| Function | Role in SEVEN-G | Name and position | Date | Signature or reference |
|---|---|---|---|---|
| Maintains the catalogue and assesses | AI Office | | | |
| Security and data protection clearance | Second line | | | |
| Approves additions and changes with an Enterprise criterion | AI Committee | | | |
| Verifies by sampling | AI Auditor or internal audit | | | |

Segregation of duties: whoever requests a tool does not resolve the request, and whoever assesses it does not decide on those that meet an Enterprise criterion.

---

## 9. Version control

**Completed document**

| Version | Date | Author | Changes |
|---|---|---|---|
| | | | |

**Template**

| Version | Date | Changes |
|---|---|---|
| 0.1 | 19-09-2026 | First version. Catalogue with the categories and conditions by information level of 31 §4.2 and §4.3, request for a new tool (31 §4.2.5), reporting of incidents and questionable uses (31 §4.8) and indicators for T21. Proposes the codes SOL-AAAA-NNN and COM-AAAA-NNN. |
