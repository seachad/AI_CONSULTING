# Non-human identity and component inventory

**Records the non-human identities of AI systems and agents —with permissions, human owner, credentials and periodic reviews— and the models and software components on which they depend, with version, origin, licence and vulnerabilities.**

| | |
|---|---|
| Document | Template P54 · Non-human identity and component inventory |
| Version | 0.1 (working draft) |
| Date | 19-09-2026 |
| Author | Fernando García Varela |
| Status | Draft for review. |

---

> **Legal notice and disclaimer.** SEVEN-G is a reference methodological framework provided "as is" and for information purposes only. It does not constitute legal, regulatory, financial or professional advice, nor does it guarantee compliance with any law or standard. References to general regulation (such as the EU AI Act, the GDPR, DORA or NIS2), to technical standards and to regulation specific to each sector or jurisdiction may be incomplete, may not apply to a particular case or may become out of date as a result of regulatory changes, interpretations or supervisory positions after their consultation date. **Each organisation that uses SEVEN-G is solely responsible for identifying the regulation that applies to it, verifying that it is current and certifying its own regulatory compliance**, with the appropriate qualified advice. The author accepts no liability for any use made of this content or for any decisions taken on the basis of it. The data, figures, companies and cases in the examples are fictitious or illustrative.

> **Why it matters.** An agent acts with credentials and permissions; if nobody knows which identities exist, who is accountable for them and what they can do, a stolen credential or an inherited permission becomes the cheapest route of attack (35 §3.2, identity and privilege abuse). Likewise, an AI system depends on models, libraries, connectors and tool servers that may be manipulated or vulnerable: without an inventory it is impossible to react when a vulnerability is published or to withdraw a component. This inventory is the evidence for AG-01, AG-03, AG-13, AG-20 and SEG-09, and makes it possible to show the board that there are no excessive permissions, unrotated credentials or orphaned identities (35 §10).

## 1. Instructions for use

| Aspect | Guidance |
|---|---|
| **When it is used** | Identities and components are registered in phase 4, when security is designed (P18), and confirmed before G5. They are kept up to date in phase 6: every registration, permission change, rotation, review or removal is an event. At G7, retirement revokes identities and credentials. |
| **Who completes it** | The AI Technical Owner registers identities and components; the human owner of each identity certifies its permissions at each AG-20 review; information security provides the vulnerability analysis. |
| **Who verifies it** | Information security reviews it and issues clearance. The AI Auditor (Enterprise) or the AI Office (Lite) checks at G4, G5 and R6 that the inventory matches the actual configuration, not just the document. |
| **Who decides or approves** | The human owner of each identity approves its permissions. The incorporation of a new component or connector is approved by the AI Technical Owner with clearance from information security (AG-13). Exceptions to vulnerability remediation time limits follow the approved time limits of SEG-13. |
| **Stage, *gate* or moment** | G4 (G4.15, G4.16), G5, R6 (R6.11) and G7 (G7.11). At corporate level, C4 for the board indicators. |
| **Tool** | T10 · Agent security assessment (status of AG-01, AG-03, AG-13, AG-20 and SEG-09) and T02 · Inventory (human owner of the agent, P05). The component list can be generated with the company's dependency analysis tool; this template captures the fields that SEVEN-G requires. |
| **Reference document** | Document 35 §4.1–4.3 (identity, permissions and credentials), §5.3 (frequencies), §7 (AG-01, AG-02, AG-03, AG-13, AG-20) and §6 (SEG-09, SEG-13); document 53 §7.4–7.5 (components, dependencies and licences); document 36 (suppliers). |
| **Lite versus Enterprise** | The identity inventory and the inventory of models and components with version and provenance are mandatory in both. Lite may omit the fields marked **(Enterprise)**; the full software bill of materials (SBOM) is **(Enterprise)** (53 §7.4). |

Completion rules:

- Proposed identity code: **IDN-AAAA-NNN** (year of registration). Components are numbered within each system: SIA-AAAA-NNN · C*nn*.
- Each agent has its own non-human identity, distinct from that of any employee and from those of other agents (AG-01). A shared identity is never recorded.
- When the agent acts on behalf of a user, it cannot obtain more permissions than that user (35 §4.1).
- Secrets are kept in a secrets manager; this inventory records **where** they are and **when** they were rotated, never their value.
- Any permission not listed is denied; read and write access are recorded separately (AG-02).
- An identity without a current human owner or without an active system is an orphaned identity: it is revoked or regularised.

---

## 2. Identification

| Field | Content | Guidance |
|---|---|---|
| Scope of the inventory | | System (SIA-AAAA-NNN) · Initiative (IA-AAAA-NNN) · Company. |
| Autonomy level | | A0 · A1 · A2 · A3. Determines the AG-20 review frequency. |
| Intensity | | Lite · Enterprise. |
| Inventory owner | | AI Technical Owner. |
| Date of last update | | DD-MM-AAAA. |
| Date of last AG-20 review | | |
| Document version | | |

---

## 3. Non-human identity inventory

**Type:** Agent · Service account · API key · Certificate · Connector or tool server identity · Build agent (53 §7.4). **Acts on behalf of:** A user (delegation) · The company (process). **Status:** Active · Suspended · Revoked.

| Code | Technical name | Type | System | Purpose | Acts on behalf of | Human owner | Deputy **(Enterprise)** | Status | Date registered |
|---|---|---|---|---|---|---|---|---|---|
| | | | | | | | | | |
| | | | | | | | | | |
| IDN-2026-012 *(illustrative example)* | refunds-agent-prod | Agent | SIA-2026-004 | Process refunds for the company's own orders | The company (process) | AI Operations Owner | AI Technical Owner | Active | 02-10-2026 |

---

## 4. Permissions of each identity

Consistent with the permission matrix in P18 §5. **Operation:** Read · Write · Delete · External send · Financial operation · Configuration change.

| Identity | System or tool | Operation | Specific scope | Justification | Prior human validation | Matches the actual configuration? (Yes · No) |
|---|---|---|---|---|---|---|
| | | | | | | |
| IDN-2026-012 *(illustrative example)* | Refunds gateway | Financial operation | Refunds of the company's own orders up to the limit in P18 §7 | Resolve refunds | Yes, above the limit | Yes |

---

## 5. Credentials

| Identity | Credential type | Location (secrets manager) | Lifetime | Scope | Rotation period | Last rotation | Next rotation | Revocation linked to the kill switch? | Tested revocation time |
|---|---|---|---|---|---|---|---|---|---|
| | | | | | | | | | |
| IDN-2026-012 *(illustrative example)* | Short-lived token | Corporate secrets manager | 1 hour | Refunds gateway | Root key quarterly | 01-10-2026 | 01-01-2027 | Yes | 40 seconds |

A credential outside its rotation period is flagged and reported in the "Credentials not rotated on time" indicator (35 §10).

---

## 6. Periodic permission reviews (AG-20)

Minimum frequency (35 §5.3): **A1** annual · **A2** half-yearly · **A3** quarterly. For A0 it is recommended.

| Date | Identities reviewed | Reviewed by (human owner) | Permissions removed | Credentials rotated or revoked | Orphaned identities detected | Findings | Minutes reference |
|---|---|---|---|---|---|---|---|
| | | | | | | | |
| *(illustrative example)* 15-01-2027 | IDN-2026-010 to IDN-2026-014 | AI Operations Owner | 1 (read access to an unused history) | 0 | 0 | Permission inherited from a testing phase | AG-20 minutes for the first quarter of 2027 |

Findings of excessive permissions are reported in the "Agent identities with excessive permissions" indicator (35 §10), whose target is zero. Disabling a critical control in production (AG-01 in A2 and A3; AG-02 and AG-03 from A1 to A3; 35 §5.4) is a critical nonconformity (P50).

---

## 7. Model and component inventory

Evidence for SEG-09 and AG-13. **Type:** Model (own, supplier or open) · Weights · Library or dependency · Connector · Tool server · Image or container · Supplier service · Evaluation dataset. **Status:** Approved · Under evaluation · Obsolete · Retired.

| Code | Component | Type | Pinned version | Origin or supplier | Approved source (Yes · No) | Integrity verification | Licence | Known vulnerabilities | Owner | Status |
|---|---|---|---|---|---|---|---|---|---|---|
| | | | | | | | | | | |
| | | | | | | | | | | |
| SIA-2026-004 · C03 *(illustrative example)* | Connector to the order system | Connector | 2.4.1 | In-house development | Yes | Signature verified at deployment | Internal | None in the last scan | AI Technical Owner | Approved |

### 7.1 Additional fields

| Field | Content | Guidance |
|---|---|---|
| Full software bill of materials (SBOM) **(Enterprise)** | | Reference of the generated file, tool and date. It is regenerated at each change (53 §7.4). |
| Dependencies proposed by AI tools | | Verified before being incorporated: existence, provenance, maintenance and known vulnerabilities (53 §7.4). |
| Licensing policy applied | | Check against the company's policy (53 §7.5). |
| Vulnerability analysis | | Tool, frequency and date of the last scan. |
| Applicable remediation time limits | | Those approved for exposed systems and AI components (SEG-13). |
| Model and connector suppliers | | Requirement level N1 · N2 · N3 and assessment in P14 (document 36). |

### 7.2 Component vulnerabilities and changes

| Date | Component | Vulnerability or change | Severity | Remediation time limit | Action | Closure date | Change recorded in P27 |
|---|---|---|---|---|---|---|---|
| | | | | | | | |

A change of version of a model, connector or tool server is a change that is recorded in P27 and assessed before it is executed (37 §7.2).

---

## 8. Removals and retirement

| Identity or component | Reason for removal | Date | Credentials revoked (Yes · No) | Permissions removed (Yes · No) | Logs retained until | Verified by |
|---|---|---|---|---|---|---|
| | | | | | | |

When the system is retired (G7, P30), identity, credentials and permissions are revoked and logs are retained for the defined period (G7.11); no orphaned identities or credentials must remain (35 §8, phase 7).

---

## 9. Quality criteria

Formal criteria in document 21 (G4.15, G4.16, R6.11 and G7.11) and the LV-AG checklist in document 22 §12.

| # | Check | Status |
|---|---|---|
| 1 | Each agent has its own identity, not shared, with a current human owner. | Met · Not met · Not applicable · Pending |
| 2 | The recorded permissions match the minimum permissions approved in P18 and the actual configuration. | |
| 3 | Credentials are in a secrets manager, within their rotation period and with revocation linked to the kill switch. | |
| 4 | AG-20 reviews have been carried out at the frequency of the autonomy level and are minuted. | |
| 5 | There are no orphaned identities or unjustified inherited permissions. | |
| 6 | All models, connectors and tool servers have a pinned version, verified origin and approval (AG-13, SEG-09). | |
| 7 | Licences and vulnerabilities have been reviewed and remediations are within their time limits. | |
| 8 | Under Enterprise, there is a full software bill of materials updated with the latest change. | |

---

## 10. Approval and verification

| Function | Role in SEVEN-G | Name and position | Date | Signature or reference |
|---|---|---|---|---|
| Prepares and maintains | AI Technical Owner | | | |
| Certifies the permissions of each identity | Human owner of the identity (normally the AI Operations Owner) | | | |
| Reviews and issues clearance | Information security | | | |
| Verifies | AI Office (Lite) · AI Auditor (Enterprise) | | | |

Segregation of duties: whoever administers the identities does not certify their own permissions; the AG-20 certification is signed by the human owner of each identity and verified by someone outside the team that builds the system.

---

## 11. Version control

**Completed document**

| Version | Date | Author | Changes |
|---|---|---|---|
| | | | |

**Template**

| Version | Date | Changes |
|---|---|---|
| 0.1 | 19-09-2026 | First version. Inventory of non-human identities with permissions, credentials, owner and AG-20 reviews (35 §4.1, §7) and inventory of models and components with version, origin, licence and vulnerabilities (SEG-09, AG-13, 53 §7.4). Proposes the code IDN-AAAA-NNN. |
