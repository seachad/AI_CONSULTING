# Go-live sign-off

**Records the multi-level sign-off with veto power that authorises an AI system to go live: who signs, with what position, when and why.**

| | |
|---|---|
| Document | Template P23 · Go-live sign-off |
| Version | 0.1 (working draft) |
| Date | 16-09-2026 |
| Author | Fernando García Varela |
| Status | Draft for review. |

---

> **Legal notice and disclaimer.** SEVEN-G is a reference methodological framework provided "as is" and for information purposes only. It does not constitute legal, regulatory, financial or professional advice, nor does it guarantee compliance with any law or standard. References to general regulation (such as the EU AI Act, the GDPR, DORA or NIS2), to technical standards and to regulation specific to each sector or jurisdiction may be incomplete, may not apply to a particular case or may become out of date as a result of regulatory changes, interpretations or supervisory positions after their consultation date. **Each organisation that uses SEVEN-G is solely responsible for identifying the regulation that applies to it, verifying that it is current and certifying its own regulatory compliance**, with the appropriate qualified advice. This methodology is a generic, free aid shared with the community so that nobody has to start from scratch; each person or organisation can and should adapt it to its own use. It must not be inferred that its legally sensitive parts have been reviewed by legal counsel: those reviews, for each company or sector, are the ultimate responsibility of the company, consultant or organisation that uses it. Although every effort is made to keep it up to date, some regulation may have changed without being reflected here. To the fullest extent permitted by law, the author accepts no responsibility whatsoever for the effects of its application in any organisation or for its full applicability. The methodology does not grant certification of any kind. The author accepts no liability for any use made of this content or for any decisions taken on the basis of it. The data, figures, companies and cases in the examples are fictitious or illustrative.

## 1. Instructions for use

| Aspect | Guidance |
|---|---|
| **When it is used** | Phase 5, once the evidence for the phase is complete and before the G5 decision. Also in the event of a relevant change that entails a new go-live (P27). |
| **Who completes it** | The AI Office prepares the record; each signatory completes their own row. |
| **Who verifies it** | AI Auditor (Enterprise); AI Office (Lite) (01 §7.5). |
| **At which *gate* it is reviewed** | G5 · Go-live. At Enterprise, the AI Committee decides **after** the multi-level sign-off (01 §7.5). |
| **Lite versus Enterprise** | **Enterprise:** multi-level sign-off is mandatory, with the four signatories in block 5 (01 §6.7). **Lite:** risk clearance from the AI Risk Owner is sufficient; only the corresponding row and blocks 3, 4 and 7 are used. The fields that Lite may omit are marked **(Enterprise)**. |
| **Tool** | T03 *Gate* manager. |
| **Relationship** | P12 Risk register · P17 Human oversight · P18 Security design · P19 Rollback test · P21 Delivery report · P22 Validation and pilot results · P29 *Gate* decision record. |

Sign-off rules:

1. **Position of the sign-off:** Favourable · Favourable with conditions · Veto. Every sign-off carries a date and a reason, including a favourable one.
2. **A veto blocks** the go-live. It cannot be overridden by the sponsor or by the AI Committee; it is lifted only when the person who issued it (or whoever formally replaces them in their function) records a new sign-off once the reason has been resolved. Persistent disagreement over a veto should be escalated to the higher body, which may decide not to go live, but may not substitute the sign-off.
3. **Favourable with conditions** is only possible on non-critical aspects. If the condition affects a critical control for security, legal compliance or human oversight, the position must be Veto (01 §7.3).
4. Each signatory reviews the evidence within their remit; signing without having reviewed it is a nonconformity.
5. Second-line signatories are not part of the team building the initiative (01 §8.1 and §8.3).
6. A **Critical** residual risk without the express approval of the board or its board committee blocks G5 (document 33).

This template does not constitute legal advice.

---

## 2. Identification

| Field | Content | Guidance |
|---|---|---|
| Initiative code | | IA-AAAA-NNN (T01). |
| Initiative name | | |
| AI system(s) | | Identifier in the inventory (T02). |
| Intensity | | Lite · Enterprise. |
| Ambition level | | Optimise · Augment · Transform. |
| Regulatory classification | | Prohibited · High risk · Transparency obligations · Minimal risk · Out of scope · Pending classification. A *Prohibited* or *Pending classification* system cannot be signed off. |
| Autonomy level | | A0 · A1 · A2 · A3 (P17). |
| Type of go-live | | Initial · Relevant change · Scope extension. |
| Document version | | |
| Date the record was opened | | DD-MM-YYYY. |
| Record status | | Open for sign-off · Sign-offs complete · Blocked by veto · Closed. |

---

## 3. Prerequisites

If any mandatory prerequisite is *Not met* or *Pending*, the sign-off round is not opened.

| # | Prerequisite | Evidence | Status (Met · Not met · Not applicable · Pending) |
|---|---|---|---|
| 1 | G4 approved and its conditions fulfilled | P29 for G4 · P21 block 5 | |
| 2 | Delivery report verified | P21 | |
| 3 | Validation and pilot results verified | P22 | |
| 4 | Rollback test passed | P19 block 10 | |
| 5 | Security and prompt injection tests executed and critical findings resolved | P18 block 11 | |
| 6 | Risk register updated; no Critical residual risk without board approval | P12 | |
| 7 | Regulatory classification and applicable impact assessments completed | P11 | |
| 8 | Human oversight operational and supervisors trained | P17 · P20 | |
| 9 | Operations manual, monitoring and incident response plan available | P24 · P25 · P26 | |
| 10 | AI system inventory updated | P05 · T02 | |
| 11 | Supplier contracts and guarantees in force **(Enterprise)** | P14 | |

---

## 4. Scope of what is authorised

| Field | Content | Guidance |
|---|---|---|
| Authorised version | | Model, instructions and configuration (P16). Any other version requires a new sign-off. |
| Population and perimeter | | Areas, channels, countries, customers or cases included. |
| Authorised autonomy level | | May not exceed that in P17. |
| Phased deployment | | Yes · No. If Yes, stages and criterion for moving from one to the next. |
| Planned go-live date | | |
| Enhanced monitoring period **(Enterprise)** | | Duration and what is monitored more frequently. |

---

## 5. Multi-level sign-offs

**Position:** Favourable · Favourable with conditions · Veto.

| Signatory | What they attest | Name and position | Date | Position | Reason | Evidence reviewed |
|---|---|---|---|---|---|---|
| **AI Technical Owner** | The solution delivered corresponds to the approved design, the technical tests are valid and rollback works. | | | | | |
| **Risk and compliance** | Risks are assessed and treated within the risk appetite; the applicable regulatory obligations are covered. | | | | | |
| **Information security** | Security controls, including those for agents, are implemented and tested. | | | | | |
| **Data protection** | The processing has a legal basis, the relevant impact assessments have been carried out and the rights of individuals are respected. | | | | | |
| AI Operations Owner *(recommended)* | Operations are ready to take on the system. | | | | | |
| **AI Sponsor** | Takes responsibility for the value and the investment and accepts the conditions. Does not replace or override any previous sign-off. | | | | | |

Example of a completed row *(illustrative example)*:

| Signatory | What they attest | Name and position | Date | Position | Reason | Evidence reviewed |
|---|---|---|---|---|---|---|
| Data protection | Legal basis, assessments and rights | Data Protection Officer | 12-05-2026 | Favourable with conditions | Processing compliant; the privacy notice for the web channel still needs to be updated, a non-critical aspect because the channel is not activated until the second stage of the deployment | P11 v1.2, P16 v1.0 |

---

## 6. Conditions of the sign-offs

| # | Signatory imposing it | Condition | Does it affect a critical control? (must be No) | Owner | Deadline | How it will be verified | Status (Open · Fulfilled · Expired) |
|---|---|---|---|---|---|---|---|
| 1 | | | | | | | |
| 2 | | | | | | | |

The conditions are carried over to P29 so that the body deciding G5 adopts them. An expired condition that has not been fulfilled turns the outcome into Iterate (01 §7.4, rule 4).

---

## 7. Outcome of the sign-off round

| Field | Content | Guidance |
|---|---|---|
| Outcome | | All favourable · Favourable with conditions · Blocked by veto. |
| Vetoes recorded | | Signatory, reason and what must be resolved to lift it. |
| Closing date of the round | | |
| Referral to the deciding body | | AI Committee (Enterprise) · Sponsor with risk clearance (Lite). Reference to P29. |
| Effective go-live date | | Completed after the G5 decision. |

---

## 8. History of changes of position

Every change to a sign-off is recorded; the previous sign-off is not overwritten.

| Date | Signatory | Previous position | New position | Reason for the change | Evidence |
|---|---|---|---|---|---|
| | | | | | |

---

## 9. Quality criteria

Formal G5 criteria in document 21; checklist LV-G5 in document 22.

| # | Check | Status (Met · Not met · Not applicable · Pending) |
|---|---|---|
| 1 | The mandatory prerequisites are *Met* before the first sign-off. | |
| 2 | At Enterprise, the four mandatory sign-offs are recorded, each with a date, position and reason. | |
| 3 | No condition affects critical controls for security, compliance or human oversight. | |
| 4 | Second-line signatories do not belong to the team that builds. | |
| 5 | There is no veto in force at the time of the G5 decision. | |
| 6 | The authorised scope matches the version and autonomy level tested. | |
| 7 | The sign-offs pre-date the G5 decision date and the go-live. | |

---

## 10. Approval and verification

| Function | Role | Name | Date | Signature or reference |
|---|---|---|---|---|
| Preparation of the record | AI Office | | | |
| Verifier | AI Office (Lite) · AI Auditor (Enterprise) | | | |
| G5 decision-maker | Sponsor with risk clearance (Lite) · AI Committee (Enterprise) | | | |
| ☐ Statement: "The organisation confirms that the regulatory classification and compliance have been verified with qualified advice and accepts responsibility for them; SEVEN-G is only a methodological reference." | G5 decision-maker | | | |

Segregation of duties: the verifier is not part of the team that builds. At Enterprise, the AI Auditor does not sign in block 5. At Lite, 01 §7.5 assigns verification to the AI Office and risk clearance to the AI Risk Owner, who cannot both verify and grant clearance.

---

## 11. Version control

| Version | Date | Changes |
|---|---|---|
| 0.1 | 16-09-2026 | First version of the template. Consistency adjustments with 01 (segregation of duties at Lite, R6 outcomes, agents criterion) and with 34 and 37. |
