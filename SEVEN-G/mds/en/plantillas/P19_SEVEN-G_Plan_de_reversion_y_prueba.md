# Rollback plan and test

**Defines when and how the AI system is stopped or rolled back, who does it and how quickly, and records that the plan has been tested.**

| | |
|---|---|
| Document | Template P19 · Rollback plan and test |
| Version | 0.1 (working draft) |
| Date | 16-09-2026 |
| Author | Fernando García · SEACHAD |
| Status | Draft for review. |

---

> **Legal notice and disclaimer.** SEVEN-G is a reference methodological framework provided "as is" and for information purposes only. It does not constitute legal, regulatory, financial or professional advice, nor does it guarantee compliance with any law or standard. References to general regulation (such as the EU AI Act, the GDPR, DORA or NIS2), to technical standards and to regulation specific to each sector or jurisdiction may be incomplete, may not apply to a particular case or may become out of date as a result of regulatory changes, interpretations or supervisory positions after their consultation date. **Each organisation that uses SEVEN-G is solely responsible for identifying the regulation that applies to it, verifying that it is current and certifying its own regulatory compliance**, with the appropriate qualified advice. The author and SEACHAD accept no liability for any use made of this content or for any decisions taken on the basis of it. The data, figures, companies and cases in the examples are fictitious or illustrative.

## 1. Instructions for use

| Aspect | Guidance |
|---|---|
| **When it is used** | The plan (blocks 3 to 9) is prepared in phase 4 and reviewed at G4. The test (block 10) is performed in phase 5 and is mandatory evidence for G5. It is updated after each relevant change (P27). |
| **Who completes it** | AI Technical Owner (plan) and AI Operations Owner (performance of the test). |
| **Who verifies it** | AI Office or AI Risk Owner under Lite; AI Auditor under Enterprise. |
| **At which *gate* it is reviewed** | G4 (plan) and G5 (test). Its currency is checked at R6. |
| **Lite versus Enterprise** | Lite may omit the fields marked **(Enterprise)**, but not the test: the reversibility principle requires a tested plan before go-live (01 §3, principle 4). |
| **Relationship** | P16 Lineage (previous versions) · P17 Human oversight (degraded mode) · P18 Kill switch · P24 Operations manual · P25 Alerts · P26 Incident response · P27 Change log · document 52. |

Rules:

- Triggers must be **measurable** and connected to monitoring (P25). "If the system malfunctions" is not a trigger.
- Rollback always has a known **safe target state**: previous version, degraded mode or process without AI.
- A paper-only drill does not demonstrate the test; it must be performed in controlled production or in an equivalent environment, and which one must be declared.

---

## 2. Identification

| Field | Content | Guidance |
|---|---|---|
| Initiative code | | IA-AAAA-NNN (T01). |
| AI system(s) | | Identifier in the inventory (T02). |
| System version covered by the plan | | Version of model, prompts and configuration (P16). |
| Autonomy level | | A0 · A1 · A2 · A3 (P17). |
| Intensity | | Lite · Enterprise. |
| Document version | | |
| Author | | Role and name. |
| Date | | DD-MM-AAAA. |
| Document status | | Draft · Submitted for verification · Verified · Approved · Superseded. |

---

## 3. Rollback scope

| Field | Content | Guidance |
|---|---|---|
| Components that can be rolled back | | Model, system prompts, knowledge base, agent tools, integration, configuration. |
| Safe target state | | Previous version (identifier) · Degraded mode · Process without AI. |
| Dependencies | | Systems affected by the rollback. |
| Effect on outputs already produced | | What happens to decisions, content or actions already executed (block 8). |

---

## 4. Triggers

**Type:** Performance · Security · Compliance · Incident · Cost · Value · Decision by a body. **Activation:** Automatic · Manual.

| ID | Trigger | Type | Measurable threshold | Detection source (P25 alert) | Who decides to roll back | Activation |
|---|---|---|---|---|---|---|
| D-01 *(illustrative example)* | Degradation in the quality of proposals | Performance | Human override rate above 25 % for two consecutive days | Human oversight alert | AI Operations Owner | Manual |
| D-02 *(illustrative example)* | Agent action outside limits | Security | A single executed action that exceeded a limit in P18 | Action log | Automatic; informs security | Automatic |
| D-03 *(illustrative example)* | Incident classified as S1 | Incident | S1 classification according to document 37 | P26 | Incident coordinator | Manual |
| D-04 *(illustrative example)* | Consumption budget exhausted | Cost | Month-to-date consumption ≥ 100% of the budget | P25 cost alert | AI Operations Owner | Manual |
| | | | | | | |

---

## 5. Rollback options

Tick those that are prepared and indicate which one applies to each trigger.

| Option | Prepared (Yes · No) | Triggers it responds to | Observations |
|---|---|---|---|
| Return to the previous version of the model | | | |
| Return to the previous version of prompts, knowledge base or configuration | | | |
| Reduce the autonomy level (degraded mode, for example from A2 to A1) | | | |
| Move to a level of the cost-driven degradation cascade: validated fallback model or reduced scope (document 52 §10.3) | | | Only with the fallback model recorded in P16 and evaluated before G5; not in uses that decide about people unless specifically validated. It never deactivates critical controls. |
| Deactivate the AI function and return to the process without AI | | | |
| Full stop using the kill switch | | | Always prepared at A2 and A3. |

---

## 6. Execution steps

One table per prepared option. The steps must be followable without knowledge of the internal design.

| # | Step | Owner (role) | Estimated time | How completion is checked |
|---|---|---|---|---|
| 1 *(illustrative example)* | Record the decision to roll back and the trigger | AI Operations Owner | 5 min | Event in P27 |
| 2 *(illustrative example)* | Activate degraded mode A1 in the configuration | On-call technician | 10 min | New proposals remain pending validation |
| 3 *(illustrative example)* | Notify the overseers of the mode change | AI Product Owner | 15 min | Read confirmation |
| 4 *(illustrative example)* | Verify that no queued actions are executing | On-call technician | 10 min | Empty queue in the action log |
| | | | | |

---

## 7. Owners, communication and target time

| Field | Content | Guidance |
|---|---|---|
| Who authorises the rollback | | Role and deputy. For automatic triggers, who confirms after the fact. |
| Who executes | | Role and hours of cover. |
| Who is informed | | AI Sponsor, users, support, risk; customers where appropriate. |
| Target rollback time | | From the decision to reaching the safe state. |
| Maximum tolerable time **(Enterprise)** | | Time beyond which the impact is considered unacceptable for the business. |
| Who authorises returning to the rolled-back version | | A role different from the one that executed the rollback when there was an incident. |

---

## 8. Process continuity and outputs already produced

| Field | Content | Guidance |
|---|---|---|
| Alternative process | | How the service continues to be provided without the system or in degraded mode. |
| Capacity available for the alternative process | | People and hours required; if the released capacity has been reallocated (P20), how it is recovered. |
| Review of outputs produced during the failure | | Criterion for identifying and reviewing affected decisions or actions. |
| Communication to affected persons **(Enterprise)** | | When and how, coordinated with P26. |

---

## 9. Plan review

| Field | Content | Guidance |
|---|---|---|
| Review after relevant changes | | The plan is reviewed with each relevant change recorded in P27. |
| Frequency of retesting **(Enterprise)** | | As set by the company; it should be repeated after changes of model, autonomy or supplier. |

---

## 10. Rollback test record

One block per test performed.

| Field | Content | Guidance |
|---|---|---|
| Test date | | DD-MM-AAAA. It must be before G5 is requested. |
| Environment | | Controlled production · Equivalent pre-production. Justify the equivalence if it is not production. |
| Scenario and simulated trigger | | For example, D-01. |
| Rollback option tested | | From block 5. |
| Participants | | Roles; whoever would be on call in a real case should take part. |
| Measured time | | From the decision to the safe state. |
| Target time | | From block 7. |
| Result | | Passed · Passed with observations · Failed. |
| Issues during the test | | Steps that failed or were not documented. |
| Resulting actions | | What is corrected, owner and date. |
| Evidence | | Linked logs, screenshots or minutes. |
| Verified by | | Role external to the team that builds. |

Example *(illustrative example)*: test in equivalent pre-production, trigger D-01, rollback to mode A1; target time 30 minutes, measured time 42 minutes; result *Passed with observations* because notifying the overseers depended on one person without a deputy; action: appoint a deputy and repeat step 3 before G5.

---

## 11. Quality criteria

Formal G4 and G5 criteria in document 21; checklists LV-G4 and LV-G5 in document 22.

| # | Check | Status (Met · Not met · Not applicable · Pending) |
|---|---|---|
| 1 | Each trigger has a measurable threshold and an associated alert in P25. | |
| 2 | There is at least one prepared rollback option with an identified safe state. | |
| 3 | The steps have an owner, time and check. | |
| 4 | There is a target rollback time and owners with deputies. | |
| 5 | The alternative process has sufficient capacity. | |
| 6 | The test has been performed before G5, in a valid environment, and its result is *Passed* or its observations have been resolved. | |
| 7 | For systems with variable consumption, activation of the cost-driven degradation cascade has been tested together with the rollback. | |

---

## 12. Approval and verification

| Function | Role | Name | Date | Signature or reference |
|---|---|---|---|---|
| Author of the plan | AI Technical Owner | | | |
| Owner of the test | AI Operations Owner | | | |
| Verifier | AI Office or AI Risk Owner (Lite) · AI Auditor (Enterprise) | | | |
| *Gate* decision-maker | According to 01 §7.5 (recorded in P29) | | | |

Segregation of duties: whoever verifies the test has not taken part in performing it or in designing the plan.

---

## 13. Version control

| Version | Date | Changes |
|---|---|---|
| 0.1 | 16-09-2026 | First version of the template. |
| 0.1 | 18-09-2026 | Example cost trigger, option to move to the cost-driven degradation cascade and test criterion (document 52 §10.3). |
