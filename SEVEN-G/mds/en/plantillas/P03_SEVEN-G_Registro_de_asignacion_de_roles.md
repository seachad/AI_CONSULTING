# Role assignment record

**Designates the people who take on each role in the initiative and demonstrates that segregation of duties and incompatibilities are respected.**

| | |
|---|---|
| Document | Template P03 · Role assignment record |
| Version | 0.1 (working draft) |
| Date | 16-09-2026 |
| Author | Fernando García Varela |
| Status | Draft for review. |

---

> **Legal notice and disclaimer.** SEVEN-G is a reference methodological framework provided "as is" and for information purposes only. It does not constitute legal, regulatory, financial or professional advice, nor does it guarantee compliance with any law or standard. References to general regulation (such as the EU AI Act, the GDPR, DORA or NIS2), to technical standards and to regulation specific to each sector or jurisdiction may be incomplete, may not apply to a particular case or may become out of date as a result of regulatory changes, interpretations or supervisory positions after their consultation date. **Each organisation that uses SEVEN-G is solely responsible for identifying the regulation that applies to it, verifying that it is current and certifying its own regulatory compliance**, with the appropriate qualified advice. This methodology is a generic, free aid shared with the community so that nobody has to start from scratch; each person or organisation can and should adapt it to its own use. It must not be inferred that its legally sensitive parts have been reviewed by legal counsel: those reviews, for each company or sector, are the ultimate responsibility of the company, consultant or organisation that uses it. Although every effort is made to keep it up to date, some regulation may have changed without being reflected here. To the fullest extent permitted by law, the author accepts no responsibility whatsoever for the effects of its application in any organisation or for its full applicability. The methodology does not grant certification of any kind. The author accepts no liability for any use made of this content or for any decisions taken on the basis of it. The data, figures, companies and cases in the examples are fictitious or illustrative.

## 1. Instructions for use

| Aspect | Guidance |
|---|---|
| **When it is used** | In phase 0, before G0. It is updated whenever a person changes, when the intensity changes and before each *gate* involving roles not yet assigned. |
| **Who completes it** | The AI Product Owner, with the AI Office. |
| **Who verifies it** | Lite: AI Office. Enterprise: AI Auditor. If the AI Office has prepared the record, the AI Auditor verifies it. |
| **Who decides** | It is approved with G0: sponsor (Lite) · AI Committee (Enterprise). The AI Auditor is designated by the third line, not by the sponsor. |
| **Gate at which it is reviewed** | G0 · Authorisation. At every *gate* it is checked that the recorded verifier and decision-maker are those in this document. |
| **Tool** | T01 · Initiative register (*Owners* block of the record). |
| **Lite versus Enterprise** | Lite may omit the fields marked **(Enterprise)**. In Lite the AI Auditor intervenes on a sample basis, but who would do so must be identified. |

Completion rules:

- Nobody approves their own work and whoever builds does not control (01 §8).
- One person may take on more than one role only if the incompatibility table allows it (01 §8.2).
- Each person expressly accepts their role, with a date.

---

## 2. Identification

| Field | Content | Guidance |
|---|---|---|
| Initiative code | | IA-AAAA-NNN. |
| Initiative name | | |
| Applicable intensity | | Lite · Enterprise (P04). If it changes, this record is reviewed. |
| Ambition level | | Optimise · Augment · Transform. In Transform the board intervenes at G2 and G7. |
| Document version | | |
| Date | | DD-MM-AAAA. |
| Author | | Name and role. |

---

## 3. Initiative roles

| Role | Function | Person | Position and unit | Planned time commitment | Acceptance date | Substitute **(Enterprise)** |
|---|---|---|---|---|---|---|
| AI Sponsor | Decides | | | | | |
| AI Product Owner | Builds | | | | | |
| AI Technical Owner | Builds | | | | | |
| AI Operations Owner | Builds | | | | | |
| AI Risk Owner | Controls | | | | | |
| AI Auditor | Controls | | | | | |
| *(illustrative example)* AI Product Owner | Builds | Person A | Head of customer experience | 30% | 02-10-2026 | Person B |

Guidance on time commitment: percentage of the working day or days per month during the current phase. If a role will be assigned later, state the phase in which it will be designated.

---

## 4. Incompatibility check

Mark whether the same person takes on both roles. Any "Yes" in an incompatible combination prevents passing G0.

| Combination | Rule (01 §8.2) | Same person? | Result |
|---|---|---|---|
| Sponsor and product owner | Compatible only in Lite | Yes · No | Compatible · Incompatible |
| Sponsor and technical owner | Compatible only in Lite | | |
| Sponsor and operations owner | Compatible only in Lite | | |
| Sponsor and risk owner | Incompatible | | |
| Sponsor and auditor | Incompatible | | |
| Product, technical or operations with each other | Compatible | | |
| Product, technical or operations and risk owner | Incompatible | | |
| Product, technical or operations and auditor | Incompatible | | |
| Risk owner and auditor | Incompatible in Enterprise | | |

Independence checks:

| Check | Answer | Guidance |
|---|---|---|
| The AI Auditor does not report hierarchically to the sponsor. | Yes · No | State the auditor's reporting line. |
| The AI Auditor does not take part in design, construction or operation. | Yes · No | |
| The risk owner is not part of the team that builds. | Yes · No | |
| If the risk owner prepares phase 3 evidence (P11, P12, P13), G3 verification in Lite is carried out by another person. | Yes · No · Not applicable | Prevents the risk owner from verifying their own work (01 §7.4, rule 1). |

---

## 5. Verification and decision by *gate*

Reference: 01 §7.5. State the specific person or body that will act at each gate.

| Gate | Verifies (Lite · Enterprise) | Decides (Lite · Enterprise) | Specific designation |
|---|---|---|---|
| G0 · Authorisation | AI Office · AI Auditor | Sponsor · AI Committee | |
| G1 · Opportunity | AI Office · AI Auditor | Sponsor · Sponsor, informing the committee | |
| G2 · Hypothesis | AI Office · AI Auditor | Sponsor · AI Committee | |
| G3 · Feasibility | Risk owner · AI Auditor | Sponsor with risk clearance · AI Committee | |
| G4 · Design | AI Office · AI Auditor | Technical owner with risk clearance · AI Committee | |
| G5 · Go-live | Risk owner · AI Auditor | Sponsor with risk clearance · AI Committee after multi-level sign-off | |
| R6 · Continuity | AI Office · AI Auditor | Sponsor · AI Committee | |
| G7 · Scale or retire | AI Office · AI Auditor | Sponsor · AI Committee | |

For **Transform** initiatives, in addition, the board or its board committee approves at G2 and at G7 when the decision is to scale.

**Go-live signatories (Enterprise)**

| Sign-off with veto power | Person and position |
|---|---|
| Technical owner | |
| Risk and compliance | |
| Information security | |
| Data protection | |

---

## 6. Consulted and informed participants

| Function | Person and position | When they intervene | Type |
|---|---|---|---|
| Data protection officer | | Phases 0, 3, 4 and 5 | Consulted |
| Information security | | Phases 3, 4 and 5 | Consulted |
| Legal counsel and compliance | | Phases 0 and 3 | Consulted |
| People and organisation | | Phases 3, 4 and 7 | Consulted |
| Management control | | Phases 2, 5, 6 and 7 (value validation) | Consulted |
| Workers' representatives **(Enterprise)** | | Where appropriate | Informed |
| Suppliers | | Phases 3 to 6 | Informed |

---

## 7. Responsibility matrix by phase **(Enterprise)**

The starting point is 01 §8.4. Any change from the reference matrix must be justified and may not break segregation of duties.

| Phase | Sponsor | Product | Technical | Operations | Risk | Auditor | Change and justification |
|---|---|---|---|---|---|---|---|
| 0 · Context | A | R | C | I | C | V | |
| 1 · Discovery | A | R | C | I | C | V | |
| 2 · Value hypothesis | A | R | C | I | C | V | |
| 3 · Feasibility and risk | A | R | R | C | R | V | |
| 4 · Design | I | C | A/R | C | C | V | |
| 5 · Delivery and validation | I | A | R | C | C | V | |
| 6 · Operation | I | C | C | A/R | C | V | |
| 7 · Evolution or retirement | A | R | C | C | C | V | |

**A** is accountable for the outcome · **R** does the work · **C** is consulted · **I** is informed · **V** verifies.

---

## 8. Conflict of interest declaration

| Person | Role | Conflict of interest? | Description | Measure adopted |
|---|---|---|---|---|
| | | Yes · No | | |
| *(illustrative example)* Person C | Risk owner | Yes | Took part in selecting the supplier in another initiative. | Abstains from the P14 clearance; their substitute issues it. |

---

## 9. Assignment change log

| Date | Role | Previous person | New person | Reason | Approved by |
|---|---|---|---|---|---|
| | | | | | |

Each change generates an event in the initiative register (03 §3.3).

---

## 10. Quality criteria

The formal G0 criteria are in document 21 (see criteria G0.xx).

| # | Check | Status |
|---|---|---|
| 1 | The six roles are assigned or have a planned designation phase. | Met · Not met · Not applicable · Pending |
| 2 | There are no incompatible combinations for the applicable intensity. | |
| 3 | The AI Auditor is independent of the team and of the sponsor. | |
| 4 | Each person has accepted their role with a date. | |
| 5 | The verifier and decision-maker for each *gate* are identified. | |
| 6 | In Enterprise, the go-live signatories are identified. | |
| 7 | Conflicts of interest have been declared. | |

---

## 11. Approval and verification

| Function | Role in SEVEN-G | Name and position | Date | Signature or reference |
|---|---|---|---|---|
| Prepares | AI Product Owner | | | |
| Verifies | AI Office (Lite) · AI Auditor (Enterprise) | | | |
| Decides | AI Sponsor (Lite) · AI Committee (Enterprise), with G0 | | | |

Segregation of duties: nobody verifies a record in which they appear with a role incompatible with verification.

---

## 12. Version control

**Completed document**

| Version | Date | Author | Changes |
|---|---|---|---|
| | | | |

**Template**

| Version | Date | Changes |
|---|---|---|
| 0.1 | 16-09-2026 | First version. Converts into record format the roles, incompatibilities, allocation of verification and decision, and responsibilities by phase in 01 §7.5 and §8. |
