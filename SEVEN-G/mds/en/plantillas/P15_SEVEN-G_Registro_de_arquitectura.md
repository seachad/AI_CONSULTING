# Architecture record

**Documents the solution architecture, the design decisions with their alternatives and the traceability between the phase 3 risks and requirements and the designed controls.**

| | |
|---|---|
| Document | Template P15 · Architecture record |
| Version | 0.1 (working draft) |
| Date | 16-09-2026 |
| Author | Fernando García Varela |
| Status | Draft for review. |

---

> **Legal notice and disclaimer.** SEVEN-G is a reference methodological framework provided "as is" and for information purposes only. It does not constitute legal, regulatory, financial or professional advice, nor does it guarantee compliance with any law or standard. References to general regulation (such as the EU AI Act, the GDPR, DORA or NIS2), to technical standards and to regulation specific to each sector or jurisdiction may be incomplete, may not apply to a particular case or may become out of date as a result of regulatory changes, interpretations or supervisory positions after their consultation date. **Each organisation that uses SEVEN-G is solely responsible for identifying the regulation that applies to it, verifying that it is current and certifying its own regulatory compliance**, with the appropriate qualified advice. The author accepts no liability for any use made of this content or for any decisions taken on the basis of it. The data, figures, companies and cases in the examples are fictitious or illustrative.

## 1. Instructions for use

| Aspect | Guidance |
|---|---|
| **When it is used** | In phase 4 (Solution design), before G4. It is kept alive in phases 5 and 6: every relevant architecture change adds a decision and updates the version. |
| **Who completes it** | The AI Technical Owner, who is accountable for and carries out the work in phase 4. Information security, the AI Operations Owner and the AI Risk Owner are consulted. |
| **Who verifies it** | Lite: AI Office. Enterprise: AI Auditor. |
| **Who decides** | Lite: AI Technical Owner with risk clearance (01 §7.5). Enterprise: AI Committee. |
| **Gate at which it is reviewed** | G4 · Design. It is checked again at G5 (what was built matches what was designed) and at R6 (changes). |
| **Tool** | It has no tool of its own; it is linked as evidence in T03. |
| **Lite versus Enterprise** | Lite may omit the fields and blocks marked **(Enterprise)**. The overview, the components, the decisions and the traceability of controls are mandatory in both. |

Completion rules:

- The architecture must cover the **controls required by the risk classification** and the phase 3 risks must have a **designed control** (01 §6.6).
- There must be a **stop mechanism** and a rollback path (P19).
- Diagrams are attached as a linked file or as a Mermaid block; they are not drawn in text.
- This record summarises and links: data and model lineage goes in P16, human oversight in P17, security in P18, rollback in P19 and monitoring in P25.

---

## 2. Identification

| Field | Content | Guidance |
|---|---|---|
| Initiative code | | IA-AAAA-NNN. |
| AI systems covered | | Codes from P05. |
| Regulatory classification and intensity | | From P11 and P04. |
| Autonomy level | | A0 · A1 · A2 · A3. |
| Document version | | |
| Date | | DD-MM-AAAA. |
| Author | | Name and role. |

---

## 3. Overview

| Field | Content | Guidance |
|---|---|---|
| Solution description | | What it does, for whom and how it fits into the process, in plain language. |
| Context diagram | | Link to the diagram: users, external systems, suppliers and solution boundaries. |
| Component diagram | | Link to the diagram of components and main flows. |
| Scope of this version | | What the design includes and what is left for later versions. |
| P02 constraints applied | | Mandatory platforms, data location, maximum autonomy, red lines. |

---

## 4. Components

| Component | Function | Type | Supplier or team | Version | Hosting environment | Data processed | Criticality |
|---|---|---|---|---|---|---|---|
| | | Model · Orchestration · Data · Integration · Interface · Control · Monitoring | | | | | Low · Medium · High |
| *(illustrative example)* Language model | Draft responses based on the order information | Model | Supplier X (P14, N2) | Version pinned by contract | Supplier's cloud, EU region | Enquiry text and order data | High |
| *(illustrative example)* Order lookup service | Return only the authenticated customer's orders | Integration | Internal team | 1.0 | Corporate cloud | Order data | High |
| *(illustrative example)* Output filter | Block personal data not belonging to the customer | Control | Internal team | 1.0 | Corporate cloud | Generated response | High |

---

## 5. Models

Summary; details of versions, training data and evaluations go in P16.

| Model | Type | Origin | Use | Selection criterion | Evaluation performed | Planned replacement |
|---|---|---|---|---|---|---|
| | Predictive ML · Generative AI · Agent · Other | In-house · Third-party · Open source | | | Metrics and date | |

---

## 6. Data flows and integrations

| Flow | Source | Destination | Data | Frequency | Protection in transit | Transfer outside the EEA |
|---|---|---|---|---|---|---|
| | | | | Real time · Batch | | Yes · No |

Details of sources, transformations and versions in P16.

---

## 7. Architecture decisions

One row per relevant decision. Decisions are not deleted: if they are superseded, the previous one is marked as superseded.

| No. | Decision | Context | Alternatives considered | Reason for the choice | Consequences and risks | Date | Status |
|---|---|---|---|---|---|---|---|
| DA-01 | | | | | | | Proposed · Approved · Superseded by DA-NN |
| *(illustrative example)* DA-01 | The model does not access the order system directly; it only receives the data returned by an intermediate service. | Risk of leakage of other customers' data (P12, R01). | Direct access by the model through a tool; retrieval over an index containing all orders. | Limits by design the available data to those of the authenticated customer. | Higher latency; maintenance of the intermediate service. | 20-01-2027 | Approved |

---

## 8. Traceability of risks, obligations and controls

Each risk in P12 that requires treatment and each obligation in P11 must have at least one designed control.

| Risk or obligation | Origin | Designed control | Component | Detail template | How it will be tested in phase 5 |
|---|---|---|---|---|---|
| | P12 R.. · P11 | | | P16 · P17 · P18 · P19 · P25 | |
| *(illustrative example)* Leakage of another customer's data | P12 R01 | Intermediate service with filtering by authenticated customer and output filter | Order lookup service; output filter | P18 | 300 injection attacks with no leaks |
| *(illustrative example)* Disclose that the person is interacting with an AI system | P11 §10 | Notice at the start of each conversation | Interface | P17 | Functional review |

---

## 9. Non-functional requirements

| Requirement | Target | How it is measured | Responsible component |
|---|---|---|---|
| Availability | | | |
| Response time | | | |
| Capacity and volume | | | |
| Cost per transaction | | | |
| Activity logging and traceability | | What is logged, where and for how long it is retained | |
| Accessibility **(Enterprise)** | | | |

---

## 10. Oversight, security, operation and reversibility

| Field | Content | Guidance |
|---|---|---|
| Human oversight points | | Where a person intervenes and what is never delegated. Details in P17. |
| Identity and permissions of the system or agent | | Accounts, least permissions, limits on action. Details in P18. |
| Stop mechanism | | How the system is stopped, who can do so and how quickly. |
| Rollback | | How to return to the previous version or to the process without AI. Details in P19. |
| Monitoring | | Technical, quality, cost and security metrics. Details in P25. |
| Environments | | Development, testing, pre-production and production; data separation. |
| Change management **(Enterprise)** | | How changes to the model, prompts or configuration are approved. |

---

## 11. Estimated operating cost **(Enterprise)**

| Category | Annual recurring cost (€) | Assumptions | Change from P10 |
|---|---|---|---|
| Licences | | | |
| Model consumption | | | |
| Compute and infrastructure | | | |
| Operations people | | | |
| Suppliers and services | | | |
| Control and compliance | | | |

If the recurring cost significantly exceeds that in P10, P08 is updated and this is reported at G4.

---

## 12. Quality criteria

The formal G4 criteria are in document 21 (see criteria G4.xx).

| # | Check | Status |
|---|---|---|
| 1 | The overview and the linked diagrams reflect the complete solution, including suppliers. | Met · Not met · Not applicable · Pending |
| 2 | Each component has an owner, version, hosting and data processed. | |
| 3 | Relevant decisions have alternatives and a reason. | |
| 4 | Every risk in P12 that requires treatment and every obligation in P11 has a designed control and a means of testing. | |
| 5 | There is a stop mechanism and a rollback path. | |
| 6 | The permissions of the system or agent are limited to what is necessary and do not exceed the maximum autonomy in P02. | |
| 7 | The P02 constraints (location, platforms, red lines) are respected. | |
| 8 | P16, P17, P18, P19 and P25 exist and are consistent with this record. | |

---

## 13. Approval and verification

| Function | Role in SEVEN-G | Name and position | Date | Signature or reference |
|---|---|---|---|---|
| Prepares and is accountable | AI Technical Owner | | | |
| Consulted | Information security · AI Operations Owner · AI Risk Owner | | | |
| Issues clearance | AI Risk Owner | | | |
| Verifies | AI Office (Lite) · AI Auditor (Enterprise) | | | |
| Decides | AI Technical Owner with risk clearance (Lite) · AI Committee (Enterprise) | | | |

Segregation of duties: under Lite, the AI Technical Owner decides G4 on their own design only because 01 §7.5 allows it with risk clearance and independent verification by the AI Office; both must be on record before the decision.

---

## 14. Version control

**Completed document**

| Version | Date | Author | Changes |
|---|---|---|---|
| | | | |

**Template**

| Version | Date | Changes |
|---|---|---|
| 0.1 | 16-09-2026 | First version. Register of components, architecture decisions and traceability of risks and obligations to controls, aligned with 01 §6.6. |
