# Delivery report

**Records what has been built or integrated against the design approved at G4, at what cost and in what time, and in what state it is handed over to operations.**

| | |
|---|---|
| Document | Template P21 · Delivery report |
| Version | 0.1 (working draft) |
| Date | 16-09-2026 |
| Author | Fernando García Varela |
| Status | Draft for review. |

---

> **Legal notice and disclaimer.** SEVEN-G is a reference methodological framework provided "as is" and for information purposes only. It does not constitute legal, regulatory, financial or professional advice, nor does it guarantee compliance with any law or standard. References to general regulation (such as the EU AI Act, the GDPR, DORA or NIS2), to technical standards and to regulation specific to each sector or jurisdiction may be incomplete, may not apply to a particular case or may become out of date as a result of regulatory changes, interpretations or supervisory positions after their consultation date. **Each organisation that uses SEVEN-G is solely responsible for identifying the regulation that applies to it, verifying that it is current and certifying its own regulatory compliance**, with the appropriate qualified advice. This methodology is a generic, free aid shared with the community so that nobody has to start from scratch; each person or organisation can and should adapt it to its own use. It must not be inferred that its legally sensitive parts have been reviewed by legal counsel: those reviews, for each company or sector, are the ultimate responsibility of the company, consultant or organisation that uses it. Although every effort is made to keep it up to date, some regulation may have changed without being reflected here. To the fullest extent permitted by law, the author accepts no responsibility whatsoever for the effects of its application in any organisation or for its full applicability. The methodology does not grant certification of any kind. The author accepts no liability for any use made of this content or for any decisions taken on the basis of it. The data, figures, companies and cases in the examples are fictitious or illustrative.

## 1. Instructions for use

| Aspect | Guidance |
|---|---|
| **When it is used** | Phase 5 (Delivery and validation), on completion of the build or integration and before requesting G5. |
| **Who completes it** | AI Technical Owner, with the AI Product Owner. If there is a supplier, it provides the information, but the report is signed by the company's AI Technical Owner. |
| **Who verifies it** | AI Risk Owner under Lite; AI Auditor under Enterprise. |
| **At which *gate* it is reviewed** | G5 · Go-live. |
| **Lite versus Enterprise** | Lite may omit the fields marked **(Enterprise)**. |
| **Relationship** | P15–P20 (approved design) · P22 Validation and pilot results · P23 Go-live sign-off · P24 Operations manual · P29 G4 decision record (conditions) · documents 42 (Costs) and 53 (Building solutions). |

Rules:

- The report compares what was delivered with **what was approved**, not with what was intended at the end. Every change from the design is declared and justified.
- The conditions imposed at G4 are verified here; an expired, unmet condition turns the result into Iterate (01 §7.4, rule 4).
- Actual costs are expressed in euros by cost category, distinguishing investment from recurring cost.

---

## 2. Identification

| Field | Content | Guidance |
|---|---|---|
| Initiative code | | IA-AAAA-NNN (T01). |
| Initiative name | | |
| AI system(s) | | Identifier in the inventory (T02). |
| Version delivered | | Version of model, prompts and configuration (P16). |
| Intensity | | Lite · Enterprise. |
| Ambition level | | Optimise · Augment · Transform. |
| Suppliers involved | | Name and reference to P14. |
| Document version | | |
| Author | | Role and name. |
| Date | | DD-MM-AAAA. |
| Document status | | Draft · Submitted for verification · Verified · Approved · Superseded. |

---

## 3. Delivery summary

| Field | Content | Guidance |
|---|---|---|
| What has been delivered | | In three to five lines, in plain language. |
| Main differences from the approved design | | Summary of block 4. |
| Readiness for go-live | | Ready · Ready with non-critical outstanding items · Not ready. |
| Critical outstanding items | | If any exist, the status cannot be "Ready". |

---

## 4. Scope delivered against the approved design

**Status:** Delivered as designed · Delivered with changes · Not delivered.

| Design element | Design evidence | Status | Changes and justification | Does it affect risks, oversight or security? (Yes · No) | Approval of the change |
|---|---|---|---|---|---|
| Architecture and integrations | P15 | | | | |
| Data and models | P16 | | | | |
| Human oversight | P17 | | | | |
| Security and agent controls | P18 | | | | |
| Rollback mechanism and kill switch | P19 | | | | |
| Training and adoption | P20 | | | | |
| Monitoring and alerts | P25 | | | | |
| Integration with the supplier's system *(illustrative example)* | P15 | Delivered with changes | The real-time connection is replaced by an hourly load due to supplier limitations | Yes: delay of up to one hour in the input data | AI Technical Owner with risk clearance |

If a change affects risks, human oversight or security, the corresponding design evidence and the risk register (P12) must be updated before G5.

---

## 5. Outstanding conditions from previous *gates*

**Status:** Met · Not met · Expired.

| Condition | Originating *gate* | Owner | Deadline | Status | Evidence |
|---|---|---|---|---|---|
| | | | | | |
| | | | | | |

---

## 6. Documentation delivered

| Document | Delivered (Yes · No · Not applicable) | Version | Location |
|---|---|---|---|
| Technical documentation of the system | | | |
| Updated data and model lineage (P16) | | | |
| User manual | | | |
| Draft operations manual (P24) | | | |
| Monitoring and alert configuration (P25) | | | |
| Incident response plan (P26) | | | |
| Technical documentation required by regulation for high-risk systems **(Enterprise)** | | | Reference to the regulatory mapping (document 34). |
| Supplier documentation and warranties **(Enterprise)** | | | |

---

## 7. Actual versus planned costs

Amounts in euros. "Planned" is what was approved at G3 (P10) or, if updated, at G4.

| Cost category | Planned investment | Actual investment | Planned annual recurring cost | Updated annual recurring cost | Deviation and explanation |
|---|---|---|---|---|---|
| Licences | | | | | |
| Model consumption | | | | | |
| Compute and infrastructure | | | | | |
| Data | | | | | |
| Build people | | | — | — | |
| Operations people | — | — | | | |
| Suppliers and services | | | | | |
| Control and compliance | | | | | |
| Adoption and training | | | | | |
| **Total** | | | | | |

If the updated recurring cost changes the expected annual net value, it is recalculated in P22 and flagged to the *gate* decision-maker.

---

## 8. Timelines

| Milestone | Planned date | Actual date | Days of deviation | Cause |
|---|---|---|---|---|
| G4 approval | | | | |
| Start of build | | | | |
| End of build | | | | |
| Start of pilot | | | | |
| Planned G5 request | | | | |

If phase 5 exceeds the reference time limit approved in C2 (03 §3.6), indicate the periods on hold and the reason.

---

## 9. Known limitations, technical debt and open risks

| # | Description | Type (Limitation · Technical debt · Open risk) | Effect on operation | Treatment | Owner | Date |
|---|---|---|---|---|---|---|
| 1 *(illustrative example)* | Retraining requires manual intervention | Technical debt | Greater dependence on two people | Automate before the second R6 | AI Technical Owner | |
| | | | | | | |

---

## 10. Handover to operations

| Check | Status (Met · Not met · Not applicable · Pending) | Observations |
|---|---|---|
| The AI Operations Owner has received and reviewed the documentation. | | |
| Operational access, credentials and permissions configured and reviewed. | | |
| Alerts connected to the on-call recipients. | | |
| Operations staff trained in rollback and the kill switch. | | |
| Support agreements with suppliers in force **(Enterprise)** | | |
| AI system inventory updated with the version delivered. | | |

---

## 11. Quality criteria

Formal G5 criteria in document 21; checklist LV-G5 in document 22.

| # | Check | Status (Met · Not met · Not applicable · Pending) |
|---|---|---|
| 1 | Every design element has a delivery status and changes are justified and approved. | |
| 2 | Changes affecting risks, oversight or security have updated their evidence. | |
| 3 | All conditions from previous *gates* have been met or their expiry has been recorded. | |
| 4 | Actual costs are shown by category, separating investment and recurring cost. | |
| 5 | Limitations and open risks have a treatment and an owner. | |
| 6 | The handover to operations is complete or its outstanding items are not critical. | |

---

## 12. Approval and verification

| Function | Role | Name | Date | Signature or reference |
|---|---|---|---|---|
| Author | AI Technical Owner | | | |
| Co-author | AI Product Owner | | | |
| Receipt | AI Operations Owner | | | |
| Verifier | AI Risk Owner (Lite) · AI Auditor (Enterprise) | | | |
| *Gate* decision-maker | According to 01 §7.5 (recorded in P29) | | | |

Segregation of duties: the verifier is not part of the team that builds.

---

## 13. Version control

| Version | Date | Changes |
|---|---|---|
| 0.1 | 16-09-2026 | First version of the template. |
