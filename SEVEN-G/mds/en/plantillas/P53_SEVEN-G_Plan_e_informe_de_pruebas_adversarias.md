# Adversarial testing plan and report

**Plans an adversarial testing campaign on an AI system or an agent —or on the company's exposure to offensive AI— with scope, rules of engagement and test cases linked to threats and controls, and records its results, findings and retests.**

| | |
|---|---|
| Document | Template P53 · Adversarial testing plan and report |
| Version | 0.1 (working draft) |
| Date | 19-09-2026 |
| Author | Fernando García Varela |
| Status | Draft for review. |

---

> **Legal notice and disclaimer.** SEVEN-G is a reference methodological framework provided "as is" and for information purposes only. It does not constitute legal, regulatory, financial or professional advice, nor does it guarantee compliance with any law or standard. References to general regulation (such as the EU AI Act, the GDPR, DORA or NIS2), to technical standards and to regulation specific to each sector or jurisdiction may be incomplete, may not apply to a particular case or may become out of date as a result of regulatory changes, interpretations or supervisory positions after their consultation date. **Each organisation that uses SEVEN-G is solely responsible for identifying the regulation that applies to it, verifying that it is current and certifying its own regulatory compliance**, with the appropriate qualified advice. This methodology is a generic, free aid shared with the community so that nobody has to start from scratch; each person or organisation can and should adapt it to its own use. It must not be inferred that its legally sensitive parts have been reviewed by legal counsel: those reviews, for each company or sector, are the ultimate responsibility of the company, consultant or organisation that uses it. Although every effort is made to keep it up to date, some regulation may have changed without being reflected here. To the fullest extent permitted by law, the author accepts no responsibility whatsoever for the effects of its application in any organisation or for its full applicability. The methodology does not grant certification of any kind. The author accepts no liability for any use made of this content or for any decisions taken on the basis of it. The data, figures, companies and cases in the examples are fictitious or illustrative.

> **Why it matters.** The effectiveness of an AI security control is demonstrated by testing it as an adversary would, not by declaring it (35 §2, principle 8). Without an approved plan, tests are improvised, do not cover every input channel or every tool of the agent, and can cause real harm if nobody has set the rules of engagement. Without a report showing the success rate per scenario and a retest after remediation, the AI Committee cannot know whether G5 can be passed or whether exposure to offensive AI is improving from one year to the next.

## 1. Instructions for use

| Aspect | Guidance |
|---|---|
| **When it is used** | Before G5 in every generative AI system or agent (SEG-11, AG-18); after relevant changes to the model, instructions, tools or supplier; and at the frequency in 35 §5.3 (A1: before G5 and after changes; A2: in addition, annually; A3: in addition, half-yearly). At corporate level (C4), for the annual assessment of exposure to offensive AI and the annual synthetic impersonation fraud drill (35 §9.2). |
| **Who completes it** | The plan, the AI Technical Owner with information security. The report, the independent test team or the third party carrying out the tests. In corporate campaigns, information security. |
| **Who verifies it** | Information security reviews the plan and issues clearance. The AI Auditor (Enterprise) or the AI Office (Lite) verifies the report against the LV-AG checklist in document 22 §12. |
| **Who decides or approves** | The rules of engagement and authorisations are approved by the AI Sponsor with information security (and the owner of each affected system). Acceptance of uncorrected findings follows the residual risk acceptance table (P12 §6). Corporate campaigns are reported to the AI Committee and the board committee. |
| **Stage, *gate* or moment** | Phase 5 before G5; phase 6 (periodic campaigns and after changes); G7 when scaling; C4 for corporate exposure. |
| **Tool** | T10 · Agent security assessment (status of SEG-11, AG-18 and the controls tested). |
| **Reference document** | Document 35 §3 (threats), §5.3 (frequencies), §5.4 (critical controls), §8 (testing by phase and minimum content of a campaign) and §9.2 (offensive AI); document 22 §12 (LV-AG); P18 §3 and §11. |
| **Lite versus Enterprise** | Lite may omit the fields marked **(Enterprise)**. The rules of engagement, the independence of the testers at G5 and the retest of failed scenarios are mandatory in both. |

Completion rules:

- Proposed campaign code: **PA-AAAA-NNN**; findings PA-AAAA-NNN · H*nn*. If the company already codes its penetration tests, its code is used and recorded here.
- Whoever builds the agent does not carry out its G5 *red teaming* (35 §11).
- Test cases are derived from the threat model in P18 §3 (SEG-01) and cover every input channel and every tool of the agent.
- A successful scenario in a **sensitive action** is a finding that blocks G5 until it is remediated (35 §8). Critical and High findings are closed or accepted in accordance with 33 §7 before G5.
- Tests are run in isolated environments and without production credentials (AG-11) unless expressly authorised in the rules of engagement.
- The technical references are those of document 35 (OWASP Top 10 for LLM Applications, OWASP Top 10 for Agentic Applications, MITRE ATLAS and, for offensive AI, CCN-CERT BP/36).

---

## 2. Identification

| Field | Content | Guidance |
|---|---|---|
| Campaign code | | PA-AAAA-NNN. |
| Campaign type | | Pre-G5 · Periodic · After a relevant change · After an incident · Annual offensive AI assessment · Synthetic impersonation drill. |
| System and initiative | | SIA-AAAA-NNN · IA-AAAA-NNN; *Not applicable* in corporate campaigns. |
| Autonomy level | | A0 · A1 · A2 · A3 (P17, P18). |
| Technology and exposure | | As per P18 §2. |
| Intensity | | Lite · Enterprise. |
| Change that triggers it | | P27 reference, if applicable. |
| Testing team | | Independent internal team · Third party. Name of the team and declaration of independence from the team that builds the system. |
| Execution dates | | From DD-MM-AAAA to DD-MM-AAAA. |
| Version tested | | Model, instructions, tools and configuration (P16). |

---

## 3. Scope and rules of engagement

| Field | Content | Guidance |
|---|---|---|
| Campaign objectives | | What is to be demonstrated (for example, that intent-based access control blocks unauthorised external sends). |
| In scope | | Systems, input channels (chat, email, documents, web, voice, tool responses), tools and data. |
| Out of scope | | What is not touched and why. |
| Environment | | Isolated · Pre-production · Production with restrictions. If production, justification and safeguards. |
| Test data | | Synthetic or anonymised; never real personal data without a legal basis (53 §7.6). |
| Permitted techniques | | Direct and indirect injection, extraction, tool misuse, escalation, limit evasion, manipulation of the approver, consumption. |
| Prohibited techniques | | For example, denial of service on shared systems, social engineering of uninformed people outside an authorised drill. |
| Action limits during the test | | Maximum amounts, recipients and volumes; test accounts. |
| Conditions for stopping the test | | Unforeseen real effect, real data exposed, service degradation. Who can stop it. |
| Communication and escalation channel | | On-call contact, security and system owner. |
| Handling of critical findings during the test | | Immediate communication to the AI Technical Owner and security; possible opening of an incident (P27). |
| Retention and confidentiality of results | | Who has access to the report and for how long. |

### 3.1 Authorisations

| Authorisation | Role | Name | Date | Reference |
|---|---|---|---|---|
| Approval of the scope and the rules | AI Sponsor | | | |
| Clearance | Information security | | | |
| Owner of the affected system or environment | AI Operations Owner or platform owner | | | |
| Clearance from the data protection officer **(Enterprise)** | If personal data are involved | | | |
| Third-party contract and confidentiality | Legal counsel, if a third party carries out the tests | | | |

---

## 4. Test cases

Each case is linked to a threat in P18 §3, to its typical risk (document 33) and to the SEG or AG controls it is intended to test. **Expected result:** Blocked · Detected and alerted · Human validation requested · No leakage.

| No. | Threat (P18 §3) | Scenario and channel | Typical risk | Controls tested | Sensitive action? | Expected result | Planned attempts |
|---|---|---|---|---|---|---|---|
| C01 | Direct prompt injection | | RT-GEN-01 | SEG-02, SEG-03, SEG-11 | | | |
| C02 | Indirect prompt injection | | RT-GEN-02 | SEG-02, AG-05, AG-12, AG-18 | | | |
| C03 | Information leakage in responses or logs | | RT-GEN-05 | SEG-05, SEG-06, SEG-07 | | | |
| C04 | Poisoning of training data or the knowledge base | | RT-SEG-05 | SEG-08, AG-14 | | | |
| C05 | Model extraction or manipulation | | RT-SEG-06 | SEG-05, SEG-10, SEG-12 | | | |
| C06 | Inputs designed to deceive the model | | RT-GEN-01 | SEG-03, SEG-11 | | | |
| C07 | Excessive permissions of the system or agent | | RT-GEN-04 | AG-02, AG-20 | | | |
| C08 | Unauthorised actions or actions outside the purpose | | RT-GEN-03 | AG-05, AG-07, AG-08 | | | |
| C09 | Consumption and cost abuse | | RT-GEN-08 | SEG-10, AG-16 | | | |
| C10 | Supply chain (models, libraries, suppliers) | | RT-SEG-07 | SEG-09, AG-13 | | | |
| C11 | Lack of traceability of actions and intents | | — | AG-06, AG-10 | | | |
| C12 | Impersonation or synthetic content used against the process **(Enterprise)** | | RT-SEG-01 | SEG-16, SEG-18 | | | |
| C13 | Kill switch and credential revocation | | — | AG-03, AG-09 | | | |
| *(illustrative example)* C02 | Indirect prompt injection | PDF invoice with hidden text instructing the agent to forward the customer's history to an external address | RT-GEN-02 | AG-05, AG-12 | Yes (external send) | Blocked | 20 variants |

The typical risks in the table are the reference in 35 §3.1; they are adjusted to the initiative's risk register (P12).

---

## 5. Offensive AI exposure assessment and corporate drills

Corporate campaigns only (C4), with information security as owner (35 §9.2).

### 5.1 Annual exposure assessment

| Threat (35 §9.1) | Typical risk | Corporate controls | Control status (Designed · Implemented · Tested · Pending) | Test carried out | Result | Action |
|---|---|---|---|---|---|---|
| Identity impersonation | RT-SEG-01 | SEG-16, SEG-17, SEG-18 | | | | |
| Generated *phishing* | RT-SEG-02 | SEG-15, SEG-17 | | | | |
| CEO fraud with *deepfakes* | RT-SEG-01 | SEG-16, SEG-18; dual signature | | | | |
| Accelerated exploitation of vulnerabilities | RT-SEG-03 | SEG-13, SEG-19 | | | | |
| Attacks on identities and credentials | RT-SEG-04 | SEG-15; AG-01, AG-03, AG-20 | | | | |
| Attacks on the company's own agents | RT-GEN-02 | AG-05, AG-08, AG-12, AG-18 | | | | |
| Disinformation about the company | RT-REP-03 | Brand monitoring; crisis protocol | | | | |

In entities within the scope of the Spanish National Security Framework (Esquema Nacional de Seguridad), the self-assessment instruments published by the Spanish National Cryptologic Centre (Centro Criptológico Nacional) are also used.

### 5.2 Synthetic impersonation fraud drill and out-of-band verification

| Field | Content | Guidance |
|---|---|---|
| Scenario | | For example, synthetic audio or video call from an executive ordering an urgent and confidential payment. |
| Groups involved | | At least finance and senior management (35 §9.2). |
| Prior notice and authorisation | | Who knows about the drill; approval from senior management and human resources. |
| People exposed | | Number. |
| % who applied out-of-band verification (SEG-16) | | Confirmation through an independent, pre-established channel. |
| % who used the verification word or question (SEG-18) | | |
| % who executed or initiated the order | | |
| Does any payment process depend solely on voice, image or writing style? | | Yes · No; if Yes, action. |
| Improvement actions | | Training (SEG-17), procedural changes, authorisation limits. |

---

## 6. Success criteria

| Criterion | Threshold | Guidance |
|---|---|---|
| Successful injection in sensitive actions | 0 scenarios | Any success blocks G5 (35 §8). |
| Overall injection success rate | | Set by the company; downward trend between campaigns (35 §10). |
| Leakage of personal data, secrets or system instructions | 0 cases | G5.05. |
| Limits and intent-based access control | 100 % of unauthorised actions blocked | G5.06. |
| Kill switch time to take effect | Equal to or less than the target in P18 §9 | G5.06, R6.11. |
| Critical or High findings open at closure | 0, unless accepted in accordance with 33 §7 | 35 §8. |

---

## 7. Results report

### 7.1 Result per case

**Result:** Passed · Passed with observations · Not passed · Not run.

| Case | Attempts | Attacker successes | Success rate | Result | Findings | Remarks |
|---|---|---|---|---|---|---|
| C01 | | | | | | |
| C02 | | | | | | |
| *(illustrative example)* C02 | 20 | 1 | 5 % | Not passed | PA-2026-004 · H01 | A variant embedded in a table managed to prepare the send; the decision point blocked it, but human validation was not requested |

### 7.2 Findings

**Finding severity** (risk level of document 33): Critical · High · Medium · Low. **Status:** Open · Being remediated · Remediated awaiting retest · Closed · Accepted.

| Code | Case | Description | Controls affected | Severity | Affects a critical control (35 §5.4)? | Corrective action and owner | Time limit | Retest (date and result) | Status |
|---|---|---|---|---|---|---|---|---|---|
| H01 | | | | | | | | | |
| H02 | | | | | | | | | |
| *(illustrative example)* PA-2026-004 · H01 | C02 | Content in embedded tables is not flagged as untrusted | AG-12 | High | Yes | Extend the delimitation of external content to tables and images · AI Technical Owner | 15-12-2026 | 18-12-2026 · 0 of 20 | Closed |

### 7.3 Conclusion

| Field | Content | Guidance |
|---|---|---|
| Are the success criteria met? | | Yes · No, with details. |
| Does it block G5? | | Yes · No. Reason. |
| Accepted findings | | Code, level, accepting body (P12 §6) and validity. |
| Risks updated in P12 | | |
| Scenarios added to automated evaluations **(Enterprise)** | | Scenarios are versioned and run before each relevant change (35 §8). |
| Next campaign | | Date in accordance with 35 §5.3 or reason. |

---

## 8. Quality criteria

Formal criteria in document 21 (G3.17, G4.20, G5.05, G5.06 and R6.11) and the LV-AG checklist in document 22 §12.

| # | Check | Status |
|---|---|---|
| 1 | The scope and the rules of engagement are approved before execution. | Met · Not met · Not applicable · Pending |
| 2 | Whoever runs the G5 tests is independent of the team that builds the system. | |
| 3 | The cases cover all applicable threats in P18 §3, all input channels and all tools. | |
| 4 | Each case states the SEG or AG controls it tests and the expected result. | |
| 5 | The results include the success rate per scenario and the severity of each finding. | |
| 6 | Failed scenarios have been re-run after remediation. | |
| 7 | There are no successes in sensitive actions and no Critical or High findings open without acceptance. | |
| 8 | The campaign has been carried out at the frequency required by the autonomy level or the corporate calendar. | |

---

## 9. Approval and verification

| Function | Role in SEVEN-G | Name and position | Date | Signature or reference |
|---|---|---|---|---|
| Prepares the plan | AI Technical Owner · Information security (corporate campaigns) | | | |
| Approves the plan and the rules | AI Sponsor, with clearance from information security | | | |
| Carries out the tests and prepares the report | Independent test team or third party | | | |
| Assesses the residual risk of findings | AI Risk Owner | | | |
| Verifies | AI Office (Lite) · AI Auditor (Enterprise) | | | |

Segregation of duties: whoever builds the system does not carry out its G5 *red teaming* or verify the report; whoever accepts a finding has not assessed it.

---

## 10. Version control

**Completed document**

| Version | Date | Author | Changes |
|---|---|---|---|
| | | | |

**Template**

| Version | Date | Changes |
|---|---|---|
| 0.1 | 19-09-2026 | First version. Campaign plan with rules of engagement and authorisations, cases linked to P18 §3 and to the SEG and AG controls, annual offensive AI assessment and synthetic impersonation drill (35 §9.2), success criteria and report with findings, retests and status. Proposes the code PA-AAAA-NNN. |
