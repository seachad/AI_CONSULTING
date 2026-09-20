# Board decisions register

**Keeps, with persistent identifiers, what the board decides (DEC), recommends and assigns (REC), who carries it out, with what evidence and whether someone independent considers it met; with columns ready to be kept in a spreadsheet.**

| | |
|---|---|
| Document | Template P69 · Board decisions register |
| Version | 0.1 (working draft) |
| Date | 19-09-2026 |
| Author | Fernando García Varela |
| Status | Draft for review. |

---

> **Legal notice and disclaimer.** SEVEN-G is a reference methodological framework provided "as is" and for information purposes only. It does not constitute legal, regulatory, financial or professional advice, nor does it guarantee compliance with any law or standard. References to general regulation (such as the EU AI Act, the GDPR, DORA or NIS2), to technical standards and to regulation specific to each sector or jurisdiction may be incomplete, may not apply to a particular case or may become out of date as a result of regulatory changes, interpretations or supervisory positions after their consultation date. **Each organisation that uses SEVEN-G is solely responsible for identifying the regulation that applies to it, verifying that it is current and certifying its own regulatory compliance**, with the appropriate qualified advice. The author accepts no liability for any use made of this content or for any decisions taken on the basis of it. The data, figures, companies and cases in the examples are fictitious or illustrative.

> **Why it matters.** What the board decides and assigns is only delivered if someone follows it up with a code, an owner, a date and evidence, and if whoever assesses it is not whoever carries it out. This register separates what the recipient **declares** from what has been **verified**, keeps the original date even when it is rescheduled and links each decision to its initiative and its *gate*. It is the "backup spreadsheet" cited in document 62 while T18 does not cover all its fields; without it, follow-up depends on the memory of the minutes and discrepancies never reach the board.

## 1. Instructions for use

| Aspect | Guidance |
|---|---|
| **When it is used** | After every session of the board or its board committee at which something on AI is decided, recommended or assigned (recording within 5 working days, 62 §8), and before each pack cut-off date (P67), when recipients update the status. |
| **Who completes it** | The board secretariat records codes, bodies, texts and closures; the AI Office, areas, spheres and links; each recipient, their status and evidence; the independent assessor, the assessment. |
| **Who verifies it** | The independent assessor appointed by the issuing body (internal audit, AI Auditor, second line or director or adviser with AI experience with no interest in the execution, 62 §6.1). |
| **Who decides or approves** | The issuing body accepts closures, discardings and, from the second one onwards, reschedulings. |
| **Stage or point** | C2, C4 and C5; Transform decisions at G2 and G7 and Critical risk acceptances before G3 or G5. |
| **Tool** | T18 · Board recommendations register. Until its adaptation to the fields in 62 §12.2 is complete, this register is kept in a spreadsheet with the sheets in sections 4 to 9 and imported later. Links to T01 (IA-AAAA-NNN), T03 (*gate* decisions) and T08 (INC and NC); effect measured in T17. |
| **Reference document** | Document 62 (identifiers, fields, statuses, assessment, evidence, lifecycle, decisions and indicators); 60 §5.1 (decision sheet). |
| **Lite versus Enterprise** | The same in both. At Lite, the history sheet (section 8) may be omitted if every change is recorded in the observations column with date and author. |

Completion rules:

- **One sheet per table and one row per record.** The first row of each sheet carries exactly the column names in this template; the code (REC or DEC) is the key that joins the sheets.
- **Identifiers are never reset or reused** (62 §3.2): NNN continues the numbering even when the year or the session changes; a discarded, cancelled or merged code is not used again.
- **The original committed date is not overwritten.** New dates go to the reschedulings sheet.
- **The assessment is shown alongside the declared status, never in its place.**
- **Nothing is closed silently**: closure and discarding require the acceptance of the issuing body with a reference to the minutes.
- Dates in DD-MM-AAAA format; list values exactly as they appear here, so that they can be filtered and counted.

---

## 2. Register identification

| Field | Content | Guidance |
|---|---|---|
| Company and perimeter | | Companies and bodies covered. |
| Issuing bodies | | Full board; board committees (which ones); director or adviser with AI experience with the board's acceptance. |
| Register custodian | | Board secretariat, with the AI Office. |
| Last REC assigned | | For example, REC-2026-017. |
| Last DEC assigned | | For example, DEC-2026-015. |
| Assessors appointed by type | | Who assesses each area (62 §6.1). |
| Assessment time limit | | By default, before the next session of the issuing body. |
| Cut-off date | | That of the quarterly pack (P67). |
| Version | | |

---

## 3. What is recorded

| Matter (62 §10.1) | Recording | Sheet |
|---|---|---|
| Approval of the AI thesis, ambition by sphere, risk appetite, corporate policy and framework budget (C2). | Mandatory | DEC |
| Approval of Transform at G2 and of its scaling at G7. | Mandatory | DEC |
| Exceptional acceptance of Critical residual risks. | Mandatory | DEC |
| Decisions of the C5 annual review: adjustments to the thesis, thresholds and time limits. | Mandatory | DEC |
| Notings of stops, retirements, S1 incidents and critical nonconformities. | Mandatory | DEC |
| Assignments to management. | Mandatory | REC (type Assignment) |
| Recommendations of the board, its committees or the adviser accepted by the board. | Mandatory | REC (type Recommendation) |
| Other decisions on AI by the board or the committee. | Recommended | DEC |

---

## 4. DEC sheet · Board decisions

### 4.1 Decisions

| Code | Body | Session date | Minutes reference | Type | Text of the decision | Decision sheet | Outcome | Limits | Validity | Execution owner | Initiatives | Other links | Review date |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| DEC-2026-014 *(illustrative example)* | Full board | 24-09-2026 | Minutes 09/2026, item 4 | Authorise with limits | Authorise stage 1 of IA-2026-018 with a limit of €400,000 and a continuity decision within nine months. | P67, sheet DEC-2026-014 | Approved with conditions | €400,000; stage 1; nine months | 24-06-2027 | Sales management | IA-2026-018 | REC-2026-006; P29 G2 of IA-2026-018 | 10-12-2026 |
| | | | | | | | | | | | | | |
| | | | | | | | | | | | | | |

Values: **Type** Approve · Authorise with limits · Accept a risk · Take note (assignments go to the REC sheet). **Outcome** Approved · Approved with conditions · Deferred · Rejected. A deferred decision keeps its code and is presented again with it.

### 4.2 Conditions of decisions

One row per condition.

| DEC code | No. | Condition | Owner | Time limit | Status | Evidence | Verification date | Observations |
|---|---|---|---|---|---|---|---|---|
| DEC-2026-014 *(illustrative example)* | 1 | Pilot contract approved by legal counsel before the first signature. | Sales management | 23-11-2026 | In progress | | | |
| | | | | | | | | |

Status: Pending · In progress · Met · Overdue. An overdue condition is reported to the body, which decides whether the decision remains valid; an initiative does not pass a *gate* with overdue conditions of a board decision that affect it (62 §10.3 and §11.1). A risk acceptance lapses on its validity date and the risk once again blocks the *gate*.

---

## 5. Recommendation sheet

To create or review a recommendation with all its fields (62 §4). Its data are then copied to the sheets in section 6.

| Block | Field | Content | Guidance |
|---|---|---|---|
| Identification | Code | | REC-AAAA-NNN. |
| | Previous identifier | | Code in a previous tool, if any. |
| | Issuing body | | Full board, board committee (which one) or director or adviser with AI experience with the board's acceptance. |
| | Session of origin | | Body, date and reference to the minutes. |
| | Type | | Recommendation · Assignment. |
| Content | Text | | Worded so that it can be checked whether it has been met (62 §4, wording table). |
| | Reason | | One or two sentences. |
| | Compliance criterion | | What evidence will demonstrate compliance. |
| | Area | | Value · Risk · Compliance · Security · Data · People · Governance · Suppliers. |
| | Sphere | | 01 to 09. |
| | Priority | | High · Medium · Low, using the issuing body's criterion. |
| Accountability | Recipient | | One accountable person and their area. |
| | Original committed date | | Not overwritten. |
| | Current committed date | | After reschedulings (section 7.2). |
| Follow-up | Declared status and date | | Pending · In progress · Met · Discarded. |
| | Evidence provided | | Section 7.1. Mandatory to declare *Met*. |
| | Independent assessment | | Conformant · Conformant with observations · Nonconformant · Not assessed. |
| | Assessor, date and comment | | Comment mandatory if not conformant. |
| Closure | Situation | | Open · Closed · Discarded · Superseded. |
| | Closure date, body and minutes | | Who accepted the closure or discarding. |
| Links | Initiatives; INC, NC and systems; DEC | | IA-AAAA-NNN, INC-AAAA-NNN, NC-AAAA-NNN, SIA-AAAA-NNN, DEC-AAAA-NNN. |
| | Dashboard block | | T17 block where the effect is measured (62 §11.2). |

*(illustrative example)* Text: "Break down the value of each use case in production into efficiencies, return and recurring cost, with management control validation, before the year-end close." Compliance criterion: "All use cases in production with the three components and their status; management control report".

---

## 6. REC sheet · Recommendations and assignments

### 6.1 Identification and content

| Code | Previous identifier | Issuing body | Session of origin | Type | Text | Reason | Compliance criterion | Area | Sphere | Priority |
|---|---|---|---|---|---|---|---|---|---|---|
| REC-2026-003 *(illustrative example)* | R-04 | Board committee | 18-03-2026 · minutes 03/2026 | Recommendation | Break down the value of each use case in production… | Declared value not broken down | Three components and status per use case; management control report | Value | 09 | High |
| | | | | | | | | | | |

### 6.2 Accountability and follow-up

| Code | Recipient | Original committed date | Current committed date | No. of reschedulings | Declared status | Status date | Independent assessment | Assessor | Assessment date | Assessment comment |
|---|---|---|---|---|---|---|---|---|---|---|
| REC-2026-003 *(illustrative example)* | Management control department | 30-06-2026 | 30-09-2026 | 1 | Met | 25-09-2026 | Conformant with observations | Internal audit | 05-10-2026 | Two generative AI use cases keep their value as declared. |
| | | | | | | | | | | |

### 6.3 Closure and links

| Code | Situation | Closure date | Closing body and minutes | Initiatives | INC, NC and systems | DEC | Dashboard block | Superseding or derived recommendation |
|---|---|---|---|---|---|---|---|---|
| REC-2026-003 *(illustrative example)* | Open (closure proposed) | | | All in production | | | Value against potential | REC-2026-017 (observation) |
| | | | | | | | | |

---

## 7. Evidence and rescheduling sheets

### 7.1 Evidence

| REC code | No. | Link | Type | Author | Date | Version | Part of the criterion covered | Prior verification |
|---|---|---|---|---|---|---|---|---|
| | | | Approved document · Record or data from a system · Test result · Minutes or decision · Audit report · Verifiable configuration | | | | | *Gate* or audit, who and when |

The following are not sufficient evidence on their own: a statement without a document, a plan when a result is required, a presentation without linked source data or documentation prepared after the fact (62 §7).

### 7.2 Reschedulings

| REC code | No. | Previous date | New date | Reason | Accepted by | Acceptance date |
|---|---|---|---|---|---|---|
| | 1 | | | | AI Office or board secretariat, if delegated | |
| | 2 | | | | Issuing body (mandatory from the second onwards) | |

---

## 8. History sheet

| Code (REC or DEC) | Date | Event | Author | Comment or reason |
|---|---|---|---|---|
| | | Creation · Acceptance by the recipient · Status change · Rescheduling · Evidence · Assessment · Closure · Discarding · Supersession · Reopening · Change of text or recipient | | |

A closed recommendation is reopened with its code if the evidence was incorrect or compliance has not been maintained; if the problem is different, a new linked one is recorded (62 §9.4).

---

## 9. Alerts and indicators

### 9.1 Alerts per row (they are not statuses)

| Alert | Condition in the sheet | Suggested column |
|---|---|---|
| Overdue | The cut-off date is later than the current committed date and the status is neither *Met* nor accepted *Discarded*. | `Overdue alert` |
| Not updated | The status date is earlier than the previous session of the issuing body. | `Not updated alert` |
| Awaiting assessment | Status *Met* and assessment *Not assessed* after the assessment time limit. | `Assessment alert` |
| Discrepancy | Status *Met* and assessment *Nonconformant*. | `Discrepancy alert` |
| Repeated rescheduling | Two or more reschedulings. | `Rescheduling alert` |
| Overdue DEC condition | Condition time limit exceeded and status other than *Met*. | Sheet 4.2, `Condition alert` |

### 9.2 Indicators for the pack (62 §11.3)

| Indicator | Value at the cut-off date | Previous period |
|---|---|---|
| Open, by issuing body and area | | |
| Overdue | | |
| Closed in the period | | |
| Discrepancies in the period | | |
| Time to closure (median days, by priority) | | |
| Percentage with at least one rescheduling · with two or more | | |
| Overdue conditions of decisions | | |
| Awaiting assessment | | |

---

## 10. Quality criteria

| # | Check | Status (Met · Not met · Not applicable · Pending) |
|---|---|---|
| 1 | No code has been reused or reset; discarded items remain in the register. | |
| 2 | Every recommendation has a verifiable compliance criterion and a single recipient. | |
| 3 | No recommendation is closed without *Met* status, a conformant assessment and acceptance by the issuing body. | |
| 4 | No assessment has been made by the recipient or by whoever carries out the work. | |
| 5 | The original date is kept and reschedulings from the second onwards were accepted by the issuing body. | |
| 6 | Transform decisions at G2 and G7 link both ways to their P29 *gate* record (criteria G2.12 and G7.09 of document 21). | |
| 7 | Critical risk acceptances have a validity date and link to P12 (criterion G3.12). | |
| 8 | The register makes it possible to answer "Yes" to question D1.10 of document 11. | |

---

## 11. Approval and verification

| Function | SEVEN-G role | Name and position | Date | Signature or reference |
|---|---|---|---|---|
| Records and keeps custody | Board secretariat | | | |
| Maintains areas, spheres and links | AI Office | | | |
| Declares status and evidence | Recipient of each recommendation or execution owner of each decision | | | |
| Assesses independently | Internal audit · AI Auditor · second line · director or adviser with AI experience | | | |
| Accepts closures, discardings and reschedulings | Issuing body | | | |

Segregation of duties: whoever declares the status does not assess it; the assessor does not rewrite the recommendation and, if they consider the criterion inadequate, proposes a change to the issuing body (62 §6.3).

---

## 12. Version control

**Completed document**

| Version | Date | Author | Changes |
|---|---|---|---|
| | | | |

**Template**

| Version | Date | Changes |
|---|---|---|
| 0.1 | 19-09-2026 | First version. Register of DEC decisions with conditions (62 §10) and REC recommendation sheet and sheets with all the fields in 62 §4–9 (compliance criterion, structured assessment, dates and reschedulings, evidence, history, body and closure), alerts and indicators, prepared for a spreadsheet while T18 does not cover all the fields. |
