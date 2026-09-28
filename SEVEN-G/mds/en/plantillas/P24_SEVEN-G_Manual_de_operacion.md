# Operations manual

**Brings together what is needed to operate the AI system in production in a stable and controlled manner: owners, routines, changes, common situations, continuity and records.**

| | |
|---|---|
| Document | Template P24 · Operations manual |
| Version | 0.1 (working draft) |
| Date | 16-09-2026 |
| Author | Fernando García Varela |
| Status | Draft for review. |

---

> **Legal notice and disclaimer.** SEVEN-G is a reference methodological framework provided "as is" and for information purposes only. It does not constitute legal, regulatory, financial or professional advice, nor does it guarantee compliance with any law or standard. References to general regulation (such as the EU AI Act, the GDPR, DORA or NIS2), to technical standards and to regulation specific to each sector or jurisdiction may be incomplete, may not apply to a particular case or may become out of date as a result of regulatory changes, interpretations or supervisory positions after their consultation date. **Each organisation that uses SEVEN-G is solely responsible for identifying the regulation that applies to it, verifying that it is current and certifying its own regulatory compliance**, with the appropriate qualified advice. This methodology is a generic, free aid shared with the community so that nobody has to start from scratch; each person or organisation can and should adapt it to its own use. It must not be inferred that its legally sensitive parts have been reviewed by legal counsel: those reviews, for each company or sector, are the ultimate responsibility of the company, consultant or organisation that uses it. Although every effort is made to keep it up to date, some regulation may have changed without being reflected here. To the fullest extent permitted by law, the author accepts no responsibility whatsoever for the effects of its application in any organisation or for its full applicability. The methodology does not grant certification of any kind. The author accepts no liability for any use made of this content or for any decisions taken on the basis of it. The data, figures, companies and cases in the examples are fictitious or illustrative.

## 1. Instructions for use

| Aspect | Guidance |
|---|---|
| **When it is used** | It is drafted in phase 5 (a requirement of P23) and approved at the start of phase 6. It is kept alive throughout operation. |
| **Who completes it** | AI Operations Owner, with the AI Technical Owner. |
| **Who verifies it** | AI Office at Lite intensity; AI Auditor at Enterprise intensity. |
| **At which *gate* it is reviewed** | Prerequisite for G5; its currency is checked at each R6 continuity review. |
| **Lite versus Enterprise** | Lite may omit the fields marked **(Enterprise)**. |
| **Relationship** | P16 Lineage · P17 Human oversight · P18 Security · P19 Rollback · P25 Monitoring and alerts · P26 Incident response · P27 Incident and change log · P28 Value tracking · document 52 (AI operations manual). |

Rules:

- The manual must be usable by an on-call person who **has not taken part in the build**.
- Detailed technical procedures may reside in the company's operations tool; here they are linked with their version.
- Every change in production is classified and recorded in P27 before it is executed, except emergency changes, which are recorded immediately afterwards.

---

## 2. Identification

| Field | Content | Guidance |
|---|---|---|
| Initiative code | | IA-AAAA-NNN (T01). |
| AI system(s) | | Identifier in the inventory (T02). |
| Version in production | | Model, instructions and configuration (P16). |
| Go-live date | | As per P23. |
| Intensity | | Lite · Enterprise. Determines the frequency of R6: quarterly at Enterprise and half-yearly at Lite. |
| Autonomy level | | A0 · A1 · A2 · A3. |
| Document version | | |
| Author | | Role and name. |
| Date | | DD-MM-YYYY. |
| Document status | | Draft · Submitted for verification · Verified · Approved · Superseded. |

---

## 3. Operational description

| Field | Content | Guidance |
|---|---|---|
| What the system does | | Summary of P31, in plain language. |
| Users and service hours | | Who uses it and when it must be available. |
| Committed service levels | | Availability, response time, resolution time. |
| Internal dependencies | | Systems and data on which it depends. |
| Suppliers and support **(Enterprise)** | | Supplier, service, support channel and contracted service level (P14). |
| Known limitations | | From P16 and P21; what the system must not be asked to do. They are carried over to the internal instructions for use (P49 §5). |

---

## 4. Operational roles and contacts

Roles and channels are indicated; personal contact details are kept in the corporate directory.

| Role | Holder | Deputy | Availability | Channel |
|---|---|---|---|---|
| AI Operations Owner | | | | |
| Technical on-call | | | | |
| AI Technical Owner | | | | |
| AI Product Owner | | | | |
| Designated supervisors (P17) | | | | |
| Information security | | | | |
| Data protection | | | | |
| AI Risk Owner | | | | |

---

## 5. Operational routines

**Frequency:** Continuous · Daily · Weekly · Monthly · Quarterly · Half-yearly.

| Activity | Frequency | Owner | Procedure or link | Record |
|---|---|---|---|---|
| Review open alerts and their handling | Daily | Technical on-call | P25 | Alerting tool |
| Check the quality and freshness of input data | Daily | | | |
| Review a sample of outputs (after-the-fact oversight) | As per P17 | Designated supervisors | P17 block 6 | |
| Review the agent action log and blocks | Weekly | | P18 block 10 | |
| Review consumption and cost against budget | Monthly | | P25 | |
| Review drift (including usage drift), bias and performance against the reference | Monthly | | P25 | |
| Review system permissions and identities | Quarterly | | P18 blocks 4 and 5 | |
| Update value tracking | As per P28 | AI Product Owner | P28 | |
| Prepare the R6 continuity review | Quarterly (Enterprise) · Half-yearly (Lite) | AI Operations Owner | Block 10 | P29 |
| | | | | |

---

## 6. Change management

| Type of change | Examples | Required testing | Who approves | Does it require reviewing classification, intensity or risks? |
|---|---|---|---|---|
| **Minor** | Adjustment of interface texts; alert threshold with no effect on behaviour | Functional verification | AI Operations Owner | No |
| **Relevant** | New version of the model, instructions or knowledge base; new tools or permissions for the agent; change in autonomy level; extension of population or purpose; change of supplier | Regression, bias, security and injection testing as applicable; rollback prepared | As per document 52; if autonomy, purpose or classification changes, a decision equivalent to G4/G5 and a new sign-off (P23) | Yes |
| **Emergency** | Containment of an incident | Whatever is possible without delaying containment | Incident coordinator, with immediate recording | Reviewed afterwards |

---

## 7. Common situations

| Situation | Symptom or alert | First action | Escalate to | Reference |
|---|---|---|---|---|
| Performance degradation | Performance alert or increase in overrides | Check input data and version; assess rollback trigger | AI Technical Owner | P19 · P25 |
| Missing or late input data | Freshness alert | Activate degraded mode if thresholds are exceeded | Data owner | P19 |
| Model provider unavailable | Service errors | Apply the planned alternative; inform users | AI Operations Owner | P14 · P19 |
| Consumption cost above threshold | Cost alert | Review anomalous usage; apply the level of the cost-driven degradation cascade in block 8 | AI Product Owner | P18 block 7 · document 52 §10.3 |
| Change in what users ask (usage drift) | Alert on queries outside the validated scope or on a change of topics | Expand the evaluation set with the new cases and evaluate; if the use falls outside the purpose, restrict the scope | AI Product Owner | P25 · document 52 §4.2.6 |
| Suspected prompt injection or anomalous agent action | Repeated blocks or action outside purpose | Assess kill switch; preserve logs | Information security | P18 · P26 |
| Complaint from an affected person | Complaint received | Record; activate human review | AI Product Owner | P17 block 8 |
| Possible discriminatory output | Fairness alert, unequal responses in counterfactual pairs or complaint | Treat as an incident and classify severity | AI Risk Owner | P26 |
| | | | | |

---

## 8. Continuity and degraded mode

| Field | Content | Guidance |
|---|---|---|
| Degraded mode available | | Description and how it is activated (P19). |
| Process without AI | | Who performs it and with what capacity. |
| Maximum acceptable time without service | | Consistent with P19. |
| Recovery after degraded mode | | Checks before returning to normal operation and who authorises it. |
| Cost-driven degradation cascade | | Only systems with variable consumption. Applicable levels (N1 optimisation, N2 fallback model, N3 reduced scope, N4 without AI), the trigger for each (for example, N1 at 80% and N2 at 100% of the budget), who activates them and uses excluded from N2 (document 52 §10.3). |
| Fallback model | | Identifier in P16, result of its evaluation before G5 and minimum quality required in P25. |

---

## 9. Access, records and retention

| Field | Content | Guidance |
|---|---|---|
| Management of user onboarding and offboarding | | Procedure and owner. |
| Periodic access review | | Frequency and evidence. |
| Records retained | | Inference logs, agent actions, human validations, changes, alerts. |
| Retention period | | No shorter than that required by applicable regulation (document 34). |
| Monitoring required by regulation **(Enterprise)** | | What is monitored after go-live, who does it and how the provider or the authority is informed where appropriate (document 34). |

---

## 10. Continuity review (R6)

| Field | Content | Guidance |
|---|---|---|
| Frequency | | At least quarterly at Enterprise and half-yearly at Lite (01 §6.8). |
| Next date | | |
| Information prepared | | Realised value against hypothesis (P28), stability (P25), incidents and changes (P27), compliance and currency of the risk classification and intensity (P04, P11, P12). |
| Criterion for proposing to bring G7 forward | | Relevant deviations in value, risk or compliance. |

---

## 11. Quality criteria

Formal G5 and R6 criteria in document 21.

| # | Check | Status (Met · Not met · Not applicable · Pending) |
|---|---|---|
| 1 | All operational roles have a holder and a deputy. | |
| 2 | Routines have a frequency, an owner and a record. | |
| 3 | The types of change and their approval are defined and connected with P27. | |
| 4 | Common situations have a first action and escalation. | |
| 5 | Degraded mode and the process without AI are described and are consistent with P19. | |
| 6 | The date of the next R6 is set according to intensity. | |
| 7 | For systems with variable consumption, the cost-driven degradation cascade is defined, does not deactivate critical controls and has been tested. | |

---

## 12. Approval and verification

| Function | Role | Name | Date | Signature or reference |
|---|---|---|---|---|
| Author | AI Operations Owner | | | |
| Co-author | AI Technical Owner | | | |
| Verifier | AI Office (Lite) · AI Auditor (Enterprise) | | | |
| Approval | Sponsor (Lite) · AI Committee (Enterprise), within the G5 decision | | | |

Segregation of duties: the operations owner does not verify evidence of their own operation (01 §8.1).

---

## 13. Version control

| Version | Date | Changes |
|---|---|---|
| 0.1 | 16-09-2026 | First version of the template. |
| 0.1 | 18-09-2026 | Cost-driven degradation cascade and fallback model in block 8; usage drift and counterfactual pairs in the common situations; quality criterion 7. |
