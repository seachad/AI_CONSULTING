# Transfer plan and exit note

**Plans how capability passes from the third party to the company and records, at the end of the engagement, what was delivered, the status of the portfolio and the tools, what is pending and the open risks, with an internal owner for each item.**

| | |
|---|---|
| Document | Template P71 · Transfer plan and exit note |
| Version | 0.1 (working draft) |
| Date | 19-09-2026 |
| Author | Fernando García Varela |
| Status | Draft for review. |

---

> **Legal notice and disclaimer.** SEVEN-G is a reference methodological framework provided "as is" and for information purposes only. It does not constitute legal, regulatory, financial or professional advice, nor does it guarantee compliance with any law or standard. References to general regulation (such as the EU AI Act, the GDPR, DORA or NIS2), to technical standards and to regulation specific to each sector or jurisdiction may be incomplete, may not apply to a particular case or may become out of date as a result of regulatory changes, interpretations or supervisory positions after their consultation date. **Each organisation that uses SEVEN-G is solely responsible for identifying the regulation that applies to it, verifying that it is current and certifying its own regulatory compliance**, with the appropriate qualified advice. The author accepts no liability for any use made of this content or for any decisions taken on the basis of it. The data, figures, companies and cases in the examples are fictitious or illustrative.

> **Why it matters.** The aim of every SEVEN-G support service is for the company to govern its AI without depending on the third party (91 §3, principle 3). If the transfer is not planned with milestones and evidence, the service continues through inertia or ends leaving registers that nobody knows how to maintain, decisions without an owner and risks that nobody monitors. The exit note turns the end of the engagement into a verifiable handover: the company must be able to read and maintain everything delivered without the third party (91 §7.3).

## 1. Instructions for use

| Aspect | Guidance |
|---|---|
| **When it is used** | The transfer plan (section 3) is drafted at the start of the engagement, together with P70, and reviewed at each milestone; in M5 it is a mandatory deliverable with a date for exit or reduction of the service (91 §4.6). The exit note (sections 4 to 9) is completed at the end of any model M1 to M5 (91 §7.3). |
| **Who completes it** | The third party's service lead, with the company's AI Office. |
| **Who verifies it** | The AI Office checks that it can operate each capability without the third party; management control, the portfolio figures; the AI Risk Owner, the open risks note. |
| **Who decides or approves** | Whoever commissioned the service (P70, section 11) accepts the exit; in M5, the AI Committee approves the transfer plan and its annual review. |
| **Stage or point** | End of the engagement; in M5, each annual review of the service and before C5. |
| **Tool** | T01 · Initiative register (complete JSON of the register), T17 · Board AI dashboard (data file and fingerprint), T18 · Board recommendations register; and any others used (T02, T03, T06, T14, T15). |
| **Reference document** | Document 91 (§3 principles, §4.6 M5, §5.3 cooling-off period, §7 quality and exit); document 90 (6 to 18-month roadmap). |
| **Lite versus Enterprise** | The same in both. In M1 the transfer may be limited to section 4 and the internal owners in section 9. |

Completion rules:

- **Every capability, deliverable, pending item and risk has a named internal owner.** A "team" or an "area" is not an owner.
- **Transferring means demonstrating that the company does it alone**: the evidence is a deliverable prepared by the company, not training received.
- **Open and maintainable formats** (91 §7.1, commitment 9): editable documents, spreadsheets, JSON.
- **No data is not zero**: whatever is not known at the exit date is declared as *no data*.

---

## 2. Identification

| Field | Content | Guidance |
|---|---|---|
| Engagement reference | | Proposal and engagement letter (P70). |
| Company and perimeter | | |
| Third party | | |
| Support model | | M1 · M2 · M3 · M4 · M5. |
| Service start date | | |
| Planned exit or reduction date | | |
| Actual exit date | | |
| Receiving internal owner | | Normally the head of the AI Office. |
| SEVEN-G version and adaptations | | The same as declared in the deliverables. |
| Version of this document | | |

---

## 3. Capability transfer plan

### 3.1 Capabilities

Method: **The third party does it** (the company observes) → **The company does it with support** → **The company does it alone** (the third party only reviews, if asked).

| # | Capability | Receiving internal role | Current situation | Next method | Milestone and date | Evidence that the company does it alone | Status |
|---|---|---|---|---|---|---|---|
| 1 *(illustrative example)* | Prepare the quarterly pack (P67) | AI Office | The company does it with support | The company does it alone | Pack for the first quarter of 2027 · 15-03-2027 | Pack submitted at D−7 prepared by the AI Office; the third party only reviewed it | In progress |
| 2 | Maintain the initiative register and the inventory (T01, T02) | | | | | | |
| 3 | Prepare *gate* evidence with the teams (P29, T03) | | | | | | |
| 4 | Calculate funnel and agility metrics | | | | | | |
| 5 | Update the board dashboard and save the snapshot of each session (T17) | | | | | | |
| 6 | Maintain the register of decisions and recommendations (P69, T18) | | | | | | |
| 7 | Validate figures with management control (document 40) | | | | | | |
| 8 | Prepare R6 continuity reviews | | | | | | |
| 9 | Prepare the C5 annual review (maturity, index, thesis) | | | | | | |
| | | | | | | | |

Status: Not started · In progress · Transferred · Not transferred (with reason).

### 3.2 Service reduction milestones

| Milestone | Condition for reaching it | Third-party time commitment after the milestone | Planned date | Accepted by |
|---|---|---|---|---|
| 1 | | | | |
| 2 | | | | |
| Exit | All capabilities "Transferred" or "Not transferred" with an accepted reason. | None | | |

---

## 4. Inventory of deliverables

| # | Deliverable | Template or tool | Version | Format | Location in the company's repository | Accepted by and date | Internal owner responsible for maintaining it |
|---|---|---|---|---|---|---|---|
| 1 *(illustrative example)* | C1 diagnosis report | P33 | 1.0 | Editable document | AI Office document repository | Implementation sponsor · 30-11-2026 | AI Office |
| | | | | | | | |
| | | | | | | | |

Each deliverable states the SEVEN-G version, the adaptations and credit for authorship with the legal notice in 93 §11.9.

---

## 5. Registers, data and tools

### 5.1 Status of the tools

| Tool | Schema or tool version | Data file delivered | Last update | How it is updated or regenerated | Internal owner | Pending items |
|---|---|---|---|---|---|---|
| T01 · Initiative register | | Complete JSON of the register | | | | |
| T02 · AI system inventory | | | | | | |
| T06 · Risk matrix and register | | CSV or JSON export from T01 | | | | |
| T17 · Board AI dashboard | | Dashboard data file and fingerprint | | | | |
| T18 · Board recommendations register | | JSON or spreadsheet (P69) | | | | |
| *(others used)* | | | | | | |

### 5.2 Third-party access

| System or repository | Type of access | Withdrawn (Yes · No) | Date | Checked by |
|---|---|---|---|---|
| | | | | |

Access is withdrawn on the exit date; if any is retained, the reason and the withdrawal date are stated.

### 5.3 Evidence and its location

| Type of evidence | Location | Internal owner | Observations |
|---|---|---|---|
| Evidence of verified *gates* | | | |
| Maturity evidence | | | |
| Value validations | | | |
| Minutes and decisions | | | |

---

## 6. Status of the portfolio at the exit date

Data at the stated cut-off date, with the source (T01, T12) and the rules in document 40.

| Field | Content | Guidance |
|---|---|---|
| Cut-off date | | |
| Initiatives by phase and status | | Phases 0–2, 3–5, in production, at G7; stopped and retired. |
| Stalled initiatives and expired conditions | | With code. |
| Overdue R6 in production | | |
| Annual net value and validated proportion | | Efficiencies, return and recurring cost separately; released capacity shown separately. |
| Use cases with negative annual net value | | Individually. |
| Systems pending regularisation | | With an approved time limit (90 §5). |
| Pending regulatory classification | | Systems not classified with legal judgement. |
| Programme traffic light | | Latest version (P67 §6). |

---

## 7. Pending decisions and recommendations

| Code | Type | Abbreviated text | Body | Internal owner | Current committed date | Declared status | Assessment |
|---|---|---|---|---|---|---|---|
| | DEC · REC | | | | | | |

Extract from P69. If the third party was the assessor of any recommendation, a new independent assessor is appointed.

---

## 8. Open risks note

| # | Risk | Initiative or area | Residual level | Internal owner | Next review | Observation |
|---|---|---|---|---|---|---|
| 1 *(illustrative example)* | The AI Office does not yet have a second person trained in maintaining the register | Transfer | Medium | Head of the AI Office | 30-04-2027 | Training of a deputy included in the annual plan |
| | | | | | | |

It includes the High and Critical risks in the portfolio (P12, T06), open nonconformities (P50) and the risks of the transfer itself (dependence on the third party, key people, tools without an owner). P×I 5×5 risk scale from document 33.

---

## 9. Independence after exit and lessons

| Field | Content | Guidance |
|---|---|---|
| Areas in which the third party may not audit or assess | | Those implemented, supported or audited (91 §5.2). |
| Cooling-off period | | At least one full C5 (91 §5.3); date from which it ends. |
| People moving from the third party to the company or vice versa | | The incompatibilities apply to them during the cooling-off period. |
| Lessons from the engagement | | What worked, what did not and what the company would change. |
| Subsequent support agreed | | If any, with scope and date; never as a condition for reading or maintaining what was delivered. |

---

## 10. Quality criteria

| # | Check | Status (Met · Not met · Not applicable · Pending) |
|---|---|---|
| 1 | Each capability has a receiving role, a milestone and evidence that the company exercises it alone. | |
| 2 | All deliverables are in an open format, with location and internal owner. | |
| 3 | The company can update T01, T17 and T18 without the third party (91 §7.3). | |
| 4 | Pending decisions and recommendations have an internal owner and, where applicable, a new assessor. | |
| 5 | The open risks note includes those of the transfer. | |
| 6 | Third-party access has been withdrawn or justified. | |
| 7 | In M2, the criteria in 90 §4.5 are met and the AI Office has prepared at least one *gate* decision and one pack with support, not by delegation (91 §4.3). | |

---

## 11. Approval and verification

| Function | Role | Name and position | Date | Signature or reference |
|---|---|---|---|---|
| Prepares | Third party's service lead | | | |
| Receives and verifies the capabilities | AI Office | | | |
| Verifies the portfolio figures | Management control | | | |
| Verifies the open risks note | AI Risk Owner | | | |
| Accepts the exit | Whoever commissioned the service · AI Committee in M5 | | | |

Segregation of duties: the third party does not declare a capability transferred; the AI Office does so with evidence that it exercises it alone.

---

## 12. Version control

**Completed document**

| Version | Date | Author | Changes |
|---|---|---|---|
| | | | |

**Template**

| Version | Date | Changes |
|---|---|---|
| 0.1 | 19-09-2026 | First version. Capability transfer plan with service reduction milestones and exit note with inventory of deliverables, status of tools and portfolio, pending items, open risks, access and cooling-off period (91 §4.6, §5.3 and §7.3). |
