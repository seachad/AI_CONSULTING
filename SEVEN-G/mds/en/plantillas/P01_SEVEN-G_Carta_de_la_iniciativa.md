# Initiative charter

**Formally authorises an AI initiative and sets its objective, scope, preliminary ambition, budget and owners.**

| | |
|---|---|
| Document | Template P01 · Initiative charter |
| Version | 0.1 (working draft) |
| Date | 16-09-2026 |
| Author | Fernando García Varela |
| Status | Draft for review. |

---

> **Legal notice and disclaimer.** SEVEN-G is a reference methodological framework provided "as is" and for information purposes only. It does not constitute legal, regulatory, financial or professional advice, nor does it guarantee compliance with any law or standard. References to general regulation (such as the EU AI Act, the GDPR, DORA or NIS2), to technical standards and to regulation specific to each sector or jurisdiction may be incomplete, may not apply to a particular case or may become out of date as a result of regulatory changes, interpretations or supervisory positions after their consultation date. **Each organisation that uses SEVEN-G is solely responsible for identifying the regulation that applies to it, verifying that it is current and certifying its own regulatory compliance**, with the appropriate qualified advice. The author accepts no liability for any use made of this content or for any decisions taken on the basis of it. The data, figures, companies and cases in the examples are fictitious or illustrative.

## 1. Instructions for use

| Aspect | Guidance |
|---|---|
| **When it is used** | In phase 0 (Context and constraints), before requesting G0. It is updated if the scope, the authorised budget or the owners change, and when scaling at G7 (new phase 0 for the extended scope). |
| **Who completes it** | The AI Product Owner, with the AI Sponsor, who is accountable for its content. |
| **Who verifies it** | Lite: AI Office. Enterprise: AI Auditor. |
| **Who decides** | Lite: AI Sponsor. Enterprise: AI Committee. |
| **Gate at which it is reviewed** | G0 · Authorisation. |
| **Tool** | T01 · Initiative register (the identification and classification fields feed the initiative record). |
| **Lite versus Enterprise** | Lite may omit the fields marked **(Enterprise)**. The rest is mandatory in both intensities. |
| **Related templates** | P02 (constraints), P03 (roles), P04 (intensity), P05 (inventory), P07 (ambition), P29 (*gate* decision), P31 (use case record). |

Completion rules:

- Without an approved G0 the initiative is not authorised: it may not consume budget or access production data (01 §6.2).
- The figures in this charter are orders of magnitude and are marked as *estimated*. The value commitment is formulated in P08.
- "No data" is not zero: if a field is not known, write "no data" and state when it will be obtained.
- Rows and text marked *(illustrative example)* are fictitious and must be deleted before the charter is submitted.

---

## 2. Identification

| Field | Content | Guidance |
|---|---|---|
| Initiative code | | Format IA-AAAA-NNN, assigned by the initiative register (T01). It is not reused. |
| Initiative name | | Short, descriptive name, without internal acronyms. |
| Sponsoring area | | Business unit that has the need. |
| Document version | | 0.1, 0.2… while in draft; 1.0 when submitted to G0. |
| Date | | DD-MM-AAAA. |
| Author | | Name and role in SEVEN-G. |
| Phase and status | | Phase 0 · Registered or In phase (03 §3.2). |
| Evidence location | | Link to the company's document repository. |

---

## 3. Business problem or opportunity

| Field | Content | Guidance |
|---|---|---|
| Understandable description | | What it is and what it will be used for, in language for non-specialists (measurement rule 10). Three to five sentences. Reused in P31. |
| Business need | | The problem or the opportunity, not the technology. *Illustrative example: the response time to customer queries about the status of their orders exceeds 24 hours in peak season.* |
| Process or decision affected | | Specific business process, task or decision. |
| People affected | | Internal users, customers or other external persons, and how they are affected. |
| Why now | | Reason for the opportunity or urgency. |
| Consequence of not acting | | What happens if the initiative is not authorised. |

---

## 4. Objective and strategic fit

| Field | Content | Guidance |
|---|---|---|
| Initiative objective | | Business outcome pursued, in one sentence. Metrics and thresholds are set in P08. |
| Fit with the AI thesis | | Reference to the AI thesis and to the ambition approved in C2 for the sphere. |
| Primary sphere | | 01 Customer · 02 Product and service · 03 People · 04 Operations · 05 Data · 06 Knowledge · 07 Decision · 08 Regulation, ethics and accountability · 09 AI governance |
| Secondary sphere | | Same list, or "none". |
| Preliminary ambition level | | Optimise · Augment · Transform. It is formally classified with P07 in phase 1. |
| Type of AI use | | AI initiative · Third-party AI embedded in processes · Corporate use of general-purpose AI · Regularisation of unauthorised use (01 §1.2). |
| Inclusion in the portfolio (C3) | | Yes · No. If it does not appear in the prioritised portfolio, justify why it is proposed outside the cycle. |
| Related initiatives **(Enterprise)** | | IA-AAAA-NNN codes with dependencies or shared outcomes. If they share value, the allocation will be declared in P08 (rule 5). |

---

## 5. Scope

| Field | Content | Guidance |
|---|---|---|
| In scope | | Processes, units, channels, geographies and users included. |
| Out of scope | | Express exclusions. Anything not included is understood to be excluded. |
| Planned AI systems | | Provisional name and link to its P05 record (inventory registration). |
| Planned suppliers | | Third parties that could provide models, platforms or services. They will be assessed with P14 in phase 3. |
| Initial assumptions | | Facts taken as true which, if they fail, change the charter. |

---

## 6. Preliminary expected value

| Field | Content | Guidance |
|---|---|---|
| Expected value type | | Efficiency · Return · Avoided risk · Compliance (taxonomy in 03 §3.3). There may be several. |
| Preliminary hypothesis | | One sentence. *Illustrative example: a response assistant will resolve a significant share of order queries without human intervention.* |
| Order of magnitude of value | | Annual range in euros, with *estimated* status. A potential without investment, hypothesis and timeframe is not a data point (rule 4). |
| Order of magnitude of investment | | Range in euros. |
| Expected time to first evidence of value | | Months to the pilot (phase 5). |

---

## 7. Authorised budget and timelines

| Field | Content | Guidance |
|---|---|---|
| Budget authorised at G0 | | Spending cap up to the next decision point (usually G2 or G3). It is not the total budget. |
| Investment threshold approved in C2 | | If the total planned investment exceeds it, Enterprise intensity applies (P04, criterion 8). |
| Target dates for G1 and G2 | | Consistent with the reference time limits per phase approved in C2 (03 §3.6). |
| Planned cost categories **(Enterprise)** | | Licences · model consumption · compute and infrastructure · data · build staff · operations staff · suppliers and services · control and compliance · adoption and training. |
| Source of funding **(Enterprise)** | | Area budget, portfolio budget or other. |

---

## 8. Owners and bodies

| Role | Person and position | Guidance |
|---|---|---|
| AI Sponsor | | Accountable for the value and the investment. |
| AI Product Owner | | Accountable for the value hypothesis and adoption. |
| AI Technical Owner | | May be designated in phase 3 if the solution is not yet known. |
| AI Operations Owner | | May be designated before phase 4. |
| AI Risk Owner | | Second line. May not be part of the team that builds. |
| AI Auditor **(Enterprise)** | | Independent of the team and with no reporting line to the sponsor. |
| Body that decides G0 | | Sponsor (Lite) · AI Committee (Enterprise). |

Details, incompatibilities and substitutes are recorded in P03.

---

## 9. Constraints, intensity and inventory

| Field | Content | Guidance |
|---|---|---|
| Main constraints | | Summary of P02: regulatory, ethical, data, budgetary, time and technological. |
| Red lines | | What the initiative will not do under any circumstances. |
| Determined intensity | | Lite · Enterprise, with the criterion that determines it (P04). |
| Preliminary regulatory classification | | Prohibited · High risk · Transparency obligations · Minimal risk · Out of scope · Pending classification. In phase 0 it is usually "Pending classification"; it is resolved in P11. |
| Inventory registration | | Reference of the P05 record and registration date. |

---

## 10. Initial risks and dependencies

| No. | Risk or dependency | Type | Owner | Planned treatment |
|---|---|---|---|---|
| 1 | | Risk · Dependency | | |
| 2 | | | | |
| *(illustrative example)* | The assistant's responses could contain incorrect information about delivery times. | Risk | Product owner | To be assessed in P12; in the pilot, human review of a sample. |

The formal risk assessment is carried out in phase 3 with P12. Only known risks are noted here so that the G0 decision-maker is aware of them.

---

## 11. Conditions of the authorisation

| Field | Content | Guidance |
|---|---|---|
| What G0 authorises | | Activities, budget and access permitted up to the next *gate*. |
| What it does not authorise | | For example, access to production data or contracting suppliers before G3. |

| No. | Condition | Time limit | Owner | Status |
|---|---|---|---|---|
| 1 | | | | Open · Fulfilled · Expired |
| *(illustrative example)* | Designate the technical owner before starting phase 3. | 30 days | Sponsor | Open |

An expired, unfulfilled condition turns the outcome into **Iterate** (01 §7.4). The decision is recorded in P29.

---

## 12. Quality criteria

The verifier checks at least the following. The formal G0 criteria are in document 21 (see criteria G0.xx).

| # | Check | Status |
|---|---|---|
| 1 | The need is formulated in business terms, not technology terms. | Met · Not met · Not applicable · Pending |
| 2 | There is a description understandable to non-specialists. | |
| 3 | The sphere, the preliminary ambition and the type of use follow the controlled taxonomy. | |
| 4 | The fit with the AI thesis and with the portfolio is justified. | |
| 5 | The scope includes express exclusions. | |
| 6 | The figures have *estimated* status and are not presented as a commitment. | |
| 7 | The authorised budget has a cap and a decision point. | |
| 8 | There is a committed sponsor and the assigned roles appear in P03 without incompatibilities. | |
| 9 | P02, P04 and P05 exist and are consistent with this charter. | |
| 10 | The document has an author, date and version, and existed before the *gate* was requested. | |

---

## 13. Approval and verification

| Function | Role in SEVEN-G | Name and position | Date | Signature or reference |
|---|---|---|---|---|
| Prepares | AI Product Owner | | | |
| Accountable for content | AI Sponsor | | | |
| Verifies | AI Office (Lite) · AI Auditor (Enterprise) | | | |
| Decides | AI Sponsor (Lite) · AI Committee (Enterprise) | | | |

Segregation of duties: the verifier has not prepared the charter; the verification date is earlier than the decision date; in Enterprise the sponsor presents, but does not decide on their own initiative.

---

## 14. Version control

**Completed document**

| Version | Date | Author | Changes |
|---|---|---|---|
| | | | |

**Template**

| Version | Date | Changes |
|---|---|---|
| 0.1 | 16-09-2026 | First version. Structure aligned with 01 §6.2 and with the controlled taxonomy of 03 §3.3. |
