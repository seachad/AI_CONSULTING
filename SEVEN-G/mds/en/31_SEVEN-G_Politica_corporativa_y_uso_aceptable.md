# Corporate AI policy and acceptable use policy

**Two templates ready to adapt, covering AI that is not a project and an AI literacy programme**

| | |
|---|---|
| Document | Document 31 · Corporate policy and acceptable use |
| Version | 0.1 (working draft) |
| Date | 16-09-2026 |
| Author | Fernando García Varela |
| Status | Draft for review. Regulatory references consulted in September 2026; verify that they remain current before approving the policies. |

<!-- cifras: 2 | policy templates ; 4 | types of AI use covered ; 3 | regularisation decisions ; 8 | AI literacy profiles -->

---

> **Legal notice and disclaimer.** SEVEN-G is a reference methodological framework provided "as is" and for information purposes only. It does not constitute legal, regulatory, financial or professional advice, nor does it guarantee compliance with any law or standard. References to general regulation (such as the EU AI Act, the GDPR, DORA or NIS2), to technical standards and to regulation specific to each sector or jurisdiction may be incomplete, may not apply to a particular case or may become out of date as a result of regulatory changes, interpretations or supervisory positions after their consultation date. **Each organisation that uses SEVEN-G is solely responsible for identifying the regulation that applies to it, verifying that it is current and certifying its own regulatory compliance**, with the appropriate qualified advice. This methodology is a generic, free aid shared with the community so that nobody has to start from scratch; each person or organisation can and should adapt it to its own use. It must not be inferred that its legally sensitive parts have been reviewed by legal counsel: those reviews, for each company or sector, are the ultimate responsibility of the company, consultant or organisation that uses it. Although every effort is made to keep it up to date, some regulation may have changed without being reflected here. To the fullest extent permitted by law, the author accepts no responsibility whatsoever for the effects of its application in any organisation or for its full applicability. The methodology does not grant certification of any kind. The author accepts no liability for any use made of this content or for any decisions taken on the basis of it. The data, figures, companies and cases in the examples are fictitious or illustrative.

<!-- esencial: siempre | Approved corporate AI policy and acceptable use policy, handling of general-purpose AI and embedded AI ('the AI that is not a project') and AI literacy for those who use or oversee AI systems. The model texts are adapted to each company. -->

## 1. Purpose and scope

This document provides the company with two policy templates that the board and senior management can adapt and approve at stage C2 of the corporate cycle:

1. **Corporate AI policy** (section 3): sets out the principles, responsibilities, classification, mandatory lifecycle, red lines and the regime for exceptions and breaches. It is approved by the board.
2. **AI acceptable use policy for employees** (section 4): translates the corporate policy into rules of conduct for anyone who uses AI in their work. It is approved by the AI Committee under delegation from the board (document 30 §7.5).

In addition, the document develops two topics that the foundational methodology sets out and that no other document covers:

- The treatment of **AI that is not a project** (section 5): AI embedded in third-party software, AI-enabled productivity suites, individual use and unauthorised use (*shadow AI*), with its detection, recording, regularisation and treatment as a nonconformity.
- The **AI literacy programme** (section 6), linked to Article 4 of Regulation (EU) 2024/1689.

Text in **[square brackets]** must be customised. The templates are drafted for a generic company; their adaptation should be reviewed by legal counsel and, insofar as it affects labour relations, by the people function, with such involvement of workers' representatives as may be appropriate. The templates and the regulatory obligations they reflect are for guidance only: responsibility for the regulatory classification of its systems and for compliance with the applicable general and sector-specific regulation lies with the organisation (document 93, section 11).

### 1.1 How to use the templates

| Step | Activity | Owner |
|---|---|---|
| 1 | Replace the square brackets and delete the options that do not apply. | AI Office |
| 2 | Cross-check against existing policies (information security, data protection, use of technology resources, procurement, code of ethics) to avoid contradictions and duplication. | Second line |
| 3 | Legal and employment law review. | Legal counsel and people |
| 4 | Approval: corporate policy by the board; acceptable use policy by the AI Committee. | Bodies (document 30) |
| 5 | Communication, training and express acceptance of the acceptable use policy. | AI Office and people |
| 6 | Annual review in C5, or earlier if regulation changes. | AI Office |

---

## 2. Regulatory references used

Consulted on 16-09-2026. Dates and articles must be verified before approving the policies.

| Reference | Content relevant to the policies |
|---|---|
| **Regulation (EU) 2024/1689** (AI Act) | Article 4 (AI literacy); Article 5 (prohibited practices); Article 26 (obligations of deployers of high-risk AI systems, including informing workers, paragraph 7); Article 50 (transparency obligations). |
| **Regulation (EU) 2026/1744** (Digital Omnibus on AI) | Published in the Official Journal on 24-07-2026 and in force since 27-07-2026. Among other things, it amends Article 4, which now requires providers and deployers **to take measures to support the development** of AI literacy among their staff, without requiring them to ensure a specific level; it adds a prohibition on systems that generate non-consensual sexually explicit content or child sexual abuse material, applicable from 2-12-2026; and it postpones the high-risk obligations of Annex III to 2-12-2027 and those of Annex I to 2-8-2028. The transparency obligations of Article 50 apply from 2-8-2026, with a transitional period until 2-12-2026 for the marking under Article 50(2) of systems already placed on the market. |
| **Regulation (EU) 2016/679** (GDPR) | Principles in Article 5; automated individual decision-making (Article 22); impact assessment (Article 35); personal data breaches (Articles 33 and 34). |
| **Organic Law 3/2018** (LOPDGDD), Spain | Article 87: criteria for the use of digital devices in the workplace, with the involvement of workers' representatives. |
| **Workers' Statute** (Estatuto de los Trabajadores), Spain | Article 64.4.d): right of the works council to be informed of the parameters, rules and instructions of the algorithms or AI systems that affect decisions on working conditions, access to and retention of employment, including profiling. |
| **Law 2/2023**, Spain | Internal reporting system and protection of whistleblowers. |
| **Directive (EU) 2022/2555 (NIS2)** and **Regulation (EU) 2022/2554 (DORA)**, where applicable | ICT, third-party and incident risk management. |

References to Spanish legislation are included as an example jurisdiction; a company in another Member State must replace them with the equivalent provisions.

---

## 3. Corporate AI policy template

> **ARTIFICIAL INTELLIGENCE CORPORATE POLICY OF [COMPANY NAME]**
>
> Approved by the Board of Directors on [date]. Version [n]. Responsible for maintenance: [AI Office]. Next review: [date, no later than twelve months].

### 3.1 Purpose

This policy establishes the principles, responsibilities and rules under which [the Company] implements, governs and measures artificial intelligence, so that its use:

a) generates measurable business value consistent with the AI thesis approved by the Board;
b) respects the law, people's rights and the values of [the Company];
c) remains within the approved risk appetite;
d) is capable of oversight, reversible and auditable.

[The Company] adopts SEVEN-G (*Seven-phase Enterprise Value & Governance*) and its supporting documents as its reference framework.

### 3.2 Scope

1. **Personal scope.** It applies to [the Company] and [the companies in its group over which it exercises control], to their directors, executives and employees, and to persons acting on their behalf, including suppliers and collaborators when they use AI systems on behalf of [the Company].
2. **Material scope.** It applies to every **AI system**, understood as a machine-based system that, with varying levels of autonomy, infers from the input it receives how to generate outputs —predictions, content, recommendations or decisions— that can influence physical or virtual environments, regardless of whether:
   - it is developed by [the Company] or by a third party;
   - it is integrated into other software or a service;
   - it is used for internal processes, with customers or with third parties;
   - its use is authorised or not.
3. **Types of use.** For the purposes of this policy, four types of use are distinguished, with the treatment set out in paragraph 3.6: (i) AI initiatives; (ii) third-party AI embedded in processes; (iii) corporate use of general-purpose AI; (iv) unauthorised use.
4. **Exclusions.** [Indicate, where appropriate, justified exclusions, for example research activities without real data in isolated environments, which must nonetheless be recorded.]

### 3.3 Principles

[The Company] adopts the ten principles of SEVEN-G and specifies them as follows:

| # | Principle | Commitment of [the Company] |
|---|---|---|
| 1 | Value before technology | No investment is made in construction without an approved value hypothesis. |
| 2 | Governance is not optional | No AI system is used in business processes unless it is in the inventory and receives the treatment corresponding to its type of use. |
| 3 | Production is the only truth | Value is reported with its status: validated, declared or estimated. |
| 4 | Reversibility | Every system in production has a stop mechanism and a tested rollback plan. |
| 5 | Risk is systemic | Risks are managed per system and at portfolio level. |
| 6 | Evolve or retire | Every system in production has a current continuity review. |
| 7 | Segregation of duties | Whoever builds does not verify or decide on their own work. |
| 8 | Evidence, not declaration | What is not documented and verified is not considered done. |
| 9 | A conscious decision on ambition | Every initiative is classified as Optimise, Augment or Transform, and Transform initiatives are approved by the Board. |
| 10 | People at the centre of change | The effect of AI on work is assessed; workers' representatives are informed and, where appropriate, consulted; people are trained. |

In addition, [the Company] commits to: **lawfulness** (complying with applicable regulation, in particular Regulation (EU) 2024/1689 and data protection legislation); **human oversight** proportionate to the impact; **transparency** towards people who interact with AI systems or are subject to their outputs; **fairness** (preventing bias and discrimination); **security** against misuse and attacks; and **accountability** (each system has an identified owner).

### 3.4 Organisation and responsibilities

| Body or role | Responsibility under this policy |
|---|---|
| **Board of Directors** | Approves this policy, the AI thesis, the ambition per sphere and the risk appetite; oversees compliance. |
| **[Audit / Risk / Technology Committee]** | Oversees risks, compliance, incidents, major and critical nonconformities and AI audits. |
| **AI Committee** | Manages the portfolio; decides Enterprise *gates*; approves the acceptable use policy and the exceptions at its level. |
| **AI Office** | Maintains the inventory, the methodology and the literacy programme; detects and regularises unauthorised use. |
| **[Risk, Compliance, Information Security, Data Protection]** | Assess risks and compliance, issue clearances and sign off Enterprise go-live. |
| **[Internal Audit]** | Verifies independently and audits compliance with this policy. |
| **Heads of business areas** | Ensure that the AI systems in their area are inventoried and used in accordance with this policy. |
| **Employees and collaborators** | Comply with the acceptable use policy and report incidents and misuse. |

The roles of each initiative (sponsor, product, technical, operations, risk and auditor) and their incompatibilities are governed by [the Company's AI governance model, based on SEVEN-G document 30].

### 3.5 Classification

Every AI system is classified in the inventory with at least:

| Classification | Values | Who determines it | When |
|---|---|---|---|
| **Type of use** | AI initiative · Third-party AI embedded in processes · Corporate use of general-purpose AI · Unauthorised use | AI Office | Inventory registration |
| **Regulatory classification** | Prohibited · High risk · Transparency obligations · Minimal risk · Out of scope · Pending classification | AI Risk Owner with legal input | Phase 0 (provisional) and phase 3 (final) |
| **Intensity** | Lite · Enterprise | Sponsor, verified in accordance with the governance model | Phase 0; review at G3 and R6 |
| **Ambition level** | Optimise · Augment · Transform | AI Product Owner; confirmed by the *gate* body | Phases 1, 2 and 7 |
| **Autonomy** | A0 Assistance · A1 Recommendation · A2 Supervised action · A3 Autonomous action | AI Technical Owner with security | Phase 4; review upon changes |
| **Main residual risk level** | Low · Medium · High · Critical | AI Risk Owner | Phase 3; ongoing monitoring |
| **Third-party requirement level** | N1 Standard · N2 Enhanced · N3 Critical | Second line | Phase 3, if there is a supplier |

Meeting any one of the following criteria is sufficient to apply **Enterprise** intensity: high regulatory risk; significant decisions about people; direct exposure to external persons; agents with the ability to act (A2 or A3 with an effect on third parties, money, personal data or production systems); specially protected data; critical function; Transform level; investment above [threshold approved by the Board].

### 3.6 Mandatory lifecycle

| Type of use | Mandatory treatment |
|---|---|
| **AI initiatives** | Full lifecycle (phases 0–7) with its *gates*, at the appropriate intensity. Without an approved G0, no budget is spent and no production data is accessed. Without an approved G5, nothing goes into production. |
| **Third-party AI embedded in processes** | Full lifecycle; phases 4 and 5 focus on the selection, integration, contract and controls of the supplier. |
| **Corporate use of general-purpose AI** | Prior authorisation of the tool, inventory registration, subjection to the acceptable use policy, training and technical controls. It moves to the full cycle if it meets an Enterprise criterion. |
| **Unauthorised use** | Detection, recording, regularisation (authorise, replace or block) and treatment as a nonconformity, in accordance with section 5 of SEVEN-G document 31. |

Initiatives in production that predate this policy are regularised before [date approved by the Board] by means of a continuity review equivalent to G7.

### 3.7 Red lines

Regardless of their expected value, [the Company] **does not develop, procure, deploy or use** AI systems that:

1. Constitute a practice prohibited by Article 5 of Regulation (EU) 2024/1689, including those added by its amendments.
2. Take decisions based solely on automated processing that produce legal effects concerning a person or similarly significantly affect them, outside the cases and without the safeguards of Article 22 of the GDPR.
3. Are used to **monitor employees** or infer their emotions, except for uses permitted by law, notified in advance and approved by [the AI Committee with clearance from Data Protection and People].
4. Generate or disseminate content that impersonates real people or simulates communications from [the Company] without being identified as AI-generated where required by law or by this policy.
5. Act as agents with the ability to execute actions (A2 or A3) on customers, payments, personal data or production systems **without** their own identity, least privilege, action logging, intent-based access control and a kill switch.
6. Process **special categories of personal data, trade secrets or information classified as [Restricted]** in tools not authorised for that level of information.
7. Are put into production without an approved *gate* or with a Critical residual risk not accepted by the Board or [the Committee].
8. [Add red lines specific to the sector or to the Company's values, for example: use of AI in decisions on [area] without individual human review.]

The red lines **admit no exceptions**.

### 3.8 Exceptions

1. Any other requirement of this policy may be temporarily waived by means of a reasoned request that includes: the requirement affected, justification, risk, compensating measures, time limit and owner.
2. Exceptions are approved by the bodies indicated in [the delegation matrix of the Governance model]. Whoever proposes does not approve.
3. Exceptions have a maximum term of [six months], are recorded with the code EXC-AAAA-NNN (P40) and are reported quarterly to [the Committee].
4. An expired exception that has not been closed is treated as a major nonconformity.

### 3.9 Breach

1. Any breach of this policy is a **nonconformity** and is classified as minor, major or critical using the SEVEN-G criteria (document 37).
2. In the event of a critical nonconformity, [the Company] will adopt containment measures within a maximum of 48 hours, including suspension of the system if necessary.
3. Treatment as a nonconformity **does not preclude** such disciplinary measures as may be appropriate under [the applicable disciplinary regime / collective agreement], nor action against third parties under contract.
4. [The Company] encourages early reporting: anyone who reports in good faith a misuse, their own error or an incident will not suffer retaliation. Reports may be made to [the AI Office] or through [the Internal reporting system].
5. Voluntary and early reporting of one's own error without harm will be considered a mitigating circumstance.

### 3.10 Review

This policy is reviewed at least once a year at stage C5 and, in addition, when: applicable regulation changes; the AI thesis or risk appetite is modified; an S1 incident or a critical nonconformity reveals a gap; or an audit recommends it. The AI Office proposes the changes and the Board approves them.

> End of the corporate policy template.

---

## 4. AI acceptable use policy template

> **ARTIFICIAL INTELLIGENCE ACCEPTABLE USE POLICY OF [COMPANY NAME]**
>
> Approved by the AI Committee on [date], implementing the Corporate AI policy. Version [n]. Applicable from [date]. Requires express acceptance.

### 4.1 What this policy is for

This policy tells you how you may use artificial intelligence in your work at [the Company]: which tools you may use, what information you must never enter, how you must review what AI produces and what you must do if something goes wrong. It applies to employees, executives, interns and external collaborators who work with information or systems of [the Company].

### 4.2 Authorised tools

1. For work purposes, you may only use the AI tools listed in the **catalogue of authorised tools** published at [intranet link], with your corporate account and under the conditions indicated for each one.
2. The catalogue classifies each tool as follows:

| Category | Meaning | Examples of conditions |
|---|---|---|
| **Authorised** | May be used for the stated purposes with information up to the [Confidential] level. | Corporate account; no use of the data by the supplier for training; logs retained by [the Company]. |
| **Authorised with restrictions** | Only for certain uses, groups or information levels. | Only [Public or Internal] information; only team [X]; not connected to email or documents. |
| **Not authorised** | May not be used for work. | Free or personal versions of assistants; AI-enabled browser extensions; unapproved transcription applications. |

3. **Do not use personal accounts** of AI tools for tasks of [the Company], even if the corporate version of the tool is listed in the catalogue.
4. **Do not install** extensions, plug-ins, desktop or mobile applications with AI functions, or **enable AI functions** in corporate software in which they are disabled, without authorisation from [Technology / the AI Office].
5. If you need a tool that is not in the catalogue, request it through [channel]. The AI Office will respond within an indicative period of [15 working days].

### 4.3 Information that is never entered

Unless the catalogue expressly states that the tool is authorised for that type of information, **never enter** into an AI tool:

| # | Type of information | Illustrative examples |
|---|---|---|
| 1 | Credentials and secrets | Passwords, API keys, tokens, certificates, access codes. |
| 2 | Special categories of personal data | Health, ethnic origin, political opinions, religious beliefs, trade union membership, genetic or biometric data, sex life or sexual orientation. |
| 3 | Personal data of customers, employees or third parties | Names with contact details, identifiers, financial data, case files. |
| 4 | Information classified as [Restricted] | Unpublished strategic plans, corporate transactions, inside information, results before their publication. |
| 5 | Trade secrets and sensitive intellectual property | Source code of [critical systems], proprietary algorithms, formulas, internal prices. |
| 6 | Third-party information subject to confidentiality | Customer or supplier documents protected by contract or by professional secrecy. |
| 7 | Security information | Systems architecture, vulnerabilities, security configurations. |

If in doubt, **do not enter it** and consult [the AI Office / Data Protection]. Anonymising personal data requires appropriate techniques: removing the name is usually not enough.

### 4.4 Human verification of outputs

1. **You are responsible** for the work you deliver, even if it was prepared by an AI tool.
2. Before using an AI output, **verify** its accuracy, its sources, its calculations and its suitability for the context. Generative AI tools can invent plausible-looking data, quotations, regulations or references.
3. The degree of verification depends on the use:

| Use of the output | Minimum verification |
|---|---|
| Personal support use (summarising, organising ideas, drafting internal drafts) | Critical reading before using it. |
| Internal document that others will use to make decisions | Checking of data, figures and sources; review by the person responsible for the document. |
| Communication to customers, suppliers, authorities or the public | Full review by a competent person and, where appropriate, approval under the usual procedure for that type of communication. |
| Code to be incorporated into systems of [the Company] | Code review, testing and security analysis in accordance with [the development standard]. |
| Legal, tax, medical, financial or technical advice with effects for third parties | Review and sign-off by a qualified professional. AI does not replace that judgement. |
| Decisions about people (recruitment, evaluation, credit, complaints, among others) | Only with systems approved through the lifecycle and with the human oversight defined in their design. |

4. **Do not use general-purpose AI tools to take decisions about people.**

### 4.5 Transparency towards customers and third parties

1. When an external person **interacts directly** with an AI system of [the Company] (for example, a conversational assistant), they must know that they are interacting with AI, unless this is obvious. This is ensured by the design of the system; do not disable it.
2. If you disseminate externally **images, audio or video generated or manipulated with AI** that may appear authentic, you must disclose that they have been artificially generated or manipulated, in accordance with [the communication guide].
3. AI-generated text published to inform the public on matters of public interest must be identified as such, unless it has undergone human review or editorial control and a person holds responsibility for its publication.
4. Do not present AI-generated content as the opinion or personal work of a professional when the recipient has a legitimate expectation to the contrary (for example, [expert reports, signed opinions]).
5. If a customer asks whether AI has been used in a service, answer truthfully in accordance with [the response guide].

### 4.6 Intellectual property

1. Do not enter protected third-party content (books, paid reports, databases, code under a restrictive licence) into AI tools unless the licence permits it.
2. Do not ask AI to reproduce protected works, imitate third-party brands or generate content that impersonates real people.
3. Check that generated code does not incorporate fragments under licences incompatible with its use at [the Company], using the available analysis tools.
4. The outputs you generate with AI tools in the performance of your duties belong to [the Company] under the terms of [your contract / the applicable legislation]. Intellectual property protection for AI-generated content may be limited; consult [Legal Counsel] before registering or licensing this type of content.
5. Do not use the brands, logos or image of [the Company] in AI-generated content outside authorised channels.

### 4.7 Personal agents and automations

A **personal agent** is an AI tool that acts on your behalf: it reads and sends emails, manages your calendar, fills in forms, makes purchases, executes code or interacts with other systems.

| Autonomy level | What you may do |
|---|---|
| **A0 Assistance** (informs, summarises, drafts) | Permitted with authorised tools. |
| **A1 Recommendation** (proposes an action that you validate and execute) | Permitted with authorised tools. Review each proposal before acting. |
| **A2 Supervised action** (executes actions within limits and you supervise) | Only with tools expressly authorised for A2 and within the actions permitted in the catalogue. |
| **A3 Autonomous action** (executes sequences without individual review) | Not permitted for personal agents. Requires an initiative approved through the lifecycle. |

In addition:

1. **Do not share your credentials** with an agent or grant it broader permissions than necessary. Use the delegated authorisation mechanisms enabled by [Technology].
2. An agent **may not**, without your express validation of each action: send external communications, accept terms, make payments or financial commitments, modify data in production systems or share documents outside [the Company].
3. You are responsible for what an agent acting on your behalf does. If you detect an unexpected action, deactivate it and report it (paragraph 4.8).
4. Automations that use AI and affect other employees, customers or shared processes must be registered as an initiative.
5. Be wary of instructions contained in emails, documents or web pages processed by the agent: they may attempt to manipulate it (prompt injection).

### 4.8 Reporting incidents and misuse

Report **immediately** to [channel: security operations centre / AI Office / email / telephone]:

- That you have mistakenly entered information referred to in paragraph 4.3 into a tool not authorised for it.
- An AI output that has caused or may cause harm to a customer, to a person or to [the Company].
- Unexpected behaviour of an AI system or agent (unrequested actions, discriminatory responses, disclosure of information).
- An attempt to manipulate an AI system or an attack that appears to rely on AI (voice or image impersonation of executives, highly personalised fraudulent messages).
- The use by other people of unauthorised tools with sensitive information.

Reporting your own error early and in good faith is what is expected of you and is regarded as a mitigating factor. No one will suffer retaliation for reporting in good faith.

### 4.9 Training and acceptance

1. Before using corporate AI tools, you must complete the basic training [course name] and accept this policy.
2. If your role uses high-risk AI systems, oversees AI systems or takes part in initiatives, you must complete the specific training for your profile.
3. [The Company] may log the use of corporate AI tools for security, compliance and service improvement purposes, with the safeguards and information provided for in [the policy on the use of technology resources], in accordance with data protection and employment legislation.

### 4.10 Breach

Breach of this policy is dealt with in accordance with paragraph 3.9 of the Corporate AI policy.

> **Acceptance.** I have read and understand the AI Acceptable Use Policy of [the Company] and undertake to comply with it. Name: [ ] · Date: [ ] · Signature or electronic acceptance: [ ]

> End of the acceptable use policy template.

---

## 5. AI that is not a project

A growing share of AI use in companies does not originate as an initiative: it arrives with an update to software already under contract, with the licence for a productivity suite or with an individual employee's decision. SEVEN-G governs it through a common process of **detection, recording, assessment and regularisation**, proportionate to its risk.

### 5.1 Types and treatment

| Type | Description | Characteristic risks | Baseline treatment | Moves to the full cycle if… |
|---|---|---|---|---|
| **AI embedded in third-party software** | AI functions that a supplier incorporates into a product already under contract (CRM, ERP, people management, customer service, cybersecurity). | Activation by default without assessment; use of company data by the supplier; changes in behaviour with each version; decisions about people built into the process. | Registration in T02 as third-party AI; proportionate supplier assessment (document 36); express decision on whether or not to activate; contractual review. | It plays a part in decisions, operations or customer relationships with any Enterprise criterion: it is then **third-party AI embedded in processes** (01 §1.2). |
| **AI-enabled productivity suites** | Assistants integrated into corporate email, office software, meetings and storage. | Assistant access to documents with excessive permissions (information overexposure); transcription of meetings without informing participants; log retention; cost of unused licences. | Authorisation as corporate use; secure configuration of the environment; prior review of permissions; sensitivity labelling; acceptable use policy; training; adoption measurement. | It is configured to act (A2 or A3) or is integrated into processes with an Enterprise criterion. |
| **Authorised individual use** | Employees who use catalogue tools for their work. | Inappropriate data; unverified outputs; dependency. | Acceptable use policy; training; technical controls; T21. | It becomes a shared process or affects third parties. |
| **Unauthorised use (*shadow AI*)** | Tools used without approval, personal accounts, extensions, enabling of functions without permission. | Information leakage; breach of data protection; contractual commitments; unverified outputs in decisions; hidden cost. | Detection, recording, regularisation and nonconformity (sections 5.2 to 5.6). | — |

### 5.2 Detection

The AI Office, together with information security, must maintain a detection plan with complementary sources. No single source is sufficient on its own.

| Source | What it detects | Owner | Indicative frequency |
|---|---|---|---|
| Browsing, proxy or cloud access security broker logs | Access to uncatalogued AI services and volume of use. | Information security | Continuous, monthly report |
| Data loss prevention tools | Sending of sensitive information to AI services. | Information security | Continuous |
| Device and browser extension management | Installed AI-enabled applications and extensions. | Technology | Monthly |
| Corporate application administration console | Third-party applications with permissions over email, documents or calendar; AI functions enabled. | Technology | Monthly |
| Expense claims, corporate cards and procurement | Subscriptions to AI tools paid for by employees or areas. | Finance and procurement | Quarterly |
| Review of supplier contracts and release notes | AI functions added to contracted software; changes in the use of data. | Procurement with system owners | At each renewal and relevant update |
| Anonymous usage survey | Tools used and unmet needs. | AI Office | Annual |
| Reports from employees and from the internal reporting system | Specific cases. | AI Office | Continuous |
| Audit | Uninventoried use in audited areas. | Internal audit | According to plan (document 38) |

**Safeguards.** Monitoring of the use of technology resources must be proportionate, provided for in the company's policy on the use of technology resources, notified to employees in advance and compliant with data protection and employment legislation (in Spain, among others, Article 87 of the LOPDGDD and Article 20.3 of the Workers' Statute). Detection focuses on **tools and information flows**, not on monitoring the content of individual activity beyond what is necessary. Data protection should assess whether an impact assessment of the monitoring system itself is required.

### 5.3 Recording

Every detected use is recorded in the inventory (T02) with the type of use **"Unauthorised use"** and the minimum fields of document 32: tool and supplier, area or users (in aggregate unless it is necessary to identify them), apparent purpose, type of information exposed, detection date, detection source and owner of the regularisation. The record automatically generates a **nonconformity** in T08.

### 5.4 Assessment and classification as a nonconformity

| Classification | Criteria (any one is sufficient) | Containment |
|---|---|---|
| **Critical** | Exposure of special categories of data, trade secrets or [Restricted] information; use in decisions about people; possible prohibited practice; unauthorised agent with the ability to act on customers, payments or production systems; possible notifiable personal data breach. | Within 48 hours at most: blocking, revocation of permissions, request for deletion to the supplier where possible, assessment of notification. |
| **Major** | Exposure of non-special personal data or [Confidential] information; systematic use by an area; enabling of AI functions in third-party software with customer data without assessment; repeat occurrence after a regularisation. | Within 10 days at most. |
| **Minor** | Occasional use with [Public or Internal] information; extension installed without sensitive data; individual subscription without company data. | Not required; regularisation within 30 days. |

The classification is adjusted using the criteria of document 37. The time limits are reference time limits (01 §12) and the company may adjust them in C2.

### 5.5 Regularisation

The AI Office proposes, and the corresponding body decides, one of three outcomes:

| Decision | When | What it involves | Decided by |
|---|---|---|---|
| **Authorise** | The tool meets a real need, the supplier passes the assessment and the risks are acceptable. | Corporate procurement, secure configuration, addition to the catalogue with category and conditions, user training and migration from personal accounts. | AI Office, or AI Committee if it meets an Enterprise criterion (document 30 §7.5). |
| **Replace** | The need is real but an equivalent authorised tool already exists, or the detected tool does not pass the assessment. | Communication of the alternative, migration support, time limit to stop using the unauthorised tool, subsequent blocking. | AI Office. |
| **Block** | The tool is not acceptable (risk, supplier, data use conditions) and there is no need that justifies an alternative. | Technical blocking, communication to users with the reason and a reminder of the policy. | Information security with the AI Office. |

**Initial regularisation period.** When approving the policy for the first time, the company may open a period of [60–90 days] during which voluntarily declared uses are regularised without disciplinary consequences, except in cases of harm or bad faith. This period brings actual use to the surface and feeds the catalogue with genuine needs.

**Closure.** The nonconformity is closed when the decision has been executed and verified (for example, the blocking is effective or personal accounts have been migrated), and the root cause has been analysed: if the unauthorised use responds to an unmet need, the corrective action includes meeting it.

### 5.6 Enabling AI functions in third-party software

| Step | Activity | Owner |
|---|---|---|
| 1 | Detect the new function (release notes, renewal, supplier notice, administration console). | System owner and procurement |
| 2 | Keep it **disabled** until the decision, if the product allows it. | System owner |
| 3 | Register in T02 and carry out a preliminary classification (type of use, data, exposure, autonomy, possible high risk). | AI Office |
| 4 | Review contractual terms: use of data by the supplier, training, location, sub-processors, logs, liability. | Procurement, legal and data protection |
| 5 | Decide: do not activate · activate as corporate use with conditions · treat as third-party AI embedded in processes (full cycle). | AI Office or AI Committee |
| 6 | Configure, inform users and, where appropriate, workers' representatives; train. | System owner |
| 7 | Include in the periodic supplier review. | Second line |

### 5.7 Productivity suites: minimum controls before deployment

| Control | Description |
|---|---|
| Review of permissions and overexposure | Identify and correct shared spaces with excessive access before the assistant can search them. |
| Sensitivity labelling | Labels applied to [Confidential] and [Restricted] information and rules limiting its use by the assistant. |
| Data use conditions | Contractual confirmation that data are not used to train general models, and of their location. |
| Logs and retention | Retention of prompts and responses in accordance with the retention policy and incident investigation requirements. |
| Transcription and recording | Configuration that informs participants and complies with applicable legislation. |
| Agentic functions | Disabled by default; enabled per group and with the permitted autonomy level (paragraph 4.7). |
| Licence assignment | Based on need and with a quarterly review of active use (T21). |
| Prior training | Basic training and accepted policy before the licence is assigned. |

---

## 6. AI literacy

### 6.1 Regulatory basis and SEVEN-G requirement

Article 4 of Regulation (EU) 2024/1689 has applied since 2-2-2025. Following its amendment by Regulation (EU) 2026/1744 (in force since 27-07-2026), it requires providers and deployers of AI systems **to take measures to support the development of AI literacy** among their staff and other persons dealing with the operation and use of AI systems on their behalf, taking into account their technical knowledge, experience, education and training, the context of use and the persons affected, without requiring them to ensure a specific level for each person. *Paraphrase; consult the official consolidated text.*

Regardless of that legal minimum, **SEVEN-G requires** the company to have a literacy programme by profile, with a record of participation and an assessment of effectiveness, because without capable people there is no real human oversight, verification of outputs or detection of misuse. In addition, Article 26(2) requires deployers of high-risk AI systems to assign human oversight to natural persons who have the necessary competence, training and authority.

### 6.2 Programme by profile

Durations are **indicative** as a starting point and must be adjusted to the size of the company and the actual use of AI.

| # | Profile | Objective | Minimum content | Format and indicative duration | Frequency | Evidence |
|---|---|---|---|---|---|---|
| F1 | **All employees and collaborators with AI tools** | Use AI in a useful, secure and compliant way. | What AI is and is not; limitations of generative AI; acceptable use policy; information that is never entered; verification of outputs; incident reporting; AI-enabled attacks (impersonation). | Online, 60–90 minutes, with assessment. | On joining and annually (brief update). | Record of completion and acceptance of the policy. |
| F2 | **Power users and users of personal agents** | Obtain value with control. | Usage techniques; assessment of output quality; agents and autonomy levels; prompt injection; protection of information in automated flows. | Practical workshop, 3–4 hours. | When the licence or permission is assigned; annually. | Record and practical exercise. |
| F3 | **Human overseers of systems in production** (including high-risk systems) | Exercise the human oversight defined in the design. | Operation and limits of the specific system; instructions for use; automation bias; when and how not to follow the recommendation; activation of the kill switch; recording and reporting of anomalies. | System-specific training, 2–8 hours, with practice. | Before go-live; upon relevant changes; annually. | Record per system; condition for G5 when human oversight is a control. |
| F4 | **Initiative roles** (sponsor, product, technical, operations) | Apply the SEVEN-G lifecycle. | Phases, *gates* and evidence; value hypothesis and measurement rules; risk and regulatory classification; segregation of duties; templates. | 1 day plus support on the first initiative. | On taking up the role; update with each relevant version of the framework. | Record linked to P03. |
| F5 | **Technical construction** (data science, engineering, AI-assisted development) | Build compliant and secure systems. | Technical requirements according to classification; documentation; evaluation of models and agents; bias and robustness testing; AI and agent security (document 35); data lineage; use of AI in development. | 2–3 days, with technology-specific modules. | On joining; annually. | Record and exercises. |
| F6 | **Second and third line** (risk, compliance, security, data protection, internal audit) | Challenge and verify with sound judgement. | AI Act and regulatory mapping; classification; impact assessments; specific risks of generative AI and agents; AI audit techniques (document 38). | 2 days and continuous training. | Annually, and upon regulatory changes. | Record; AI Auditor competence plan. |
| F7 | **Board and senior management** | Oversee and decide. | Thesis, ambition and risk appetite; efficiency versus transformation; reading the board dashboard; regulatory responsibilities; oversight questions; reputational and security risks. | 2–3 hour session. | Annually and on joining the body. | Minutes or attendance record. |
| F8 | **People, labour relations and workers' representatives** | Manage the effect of AI on work. | Impact on roles and capabilities; information and consultation; rights in automated decisions; high-risk systems in the employment domain. | 2–3 hour session. | Annually. | Attendance record. |
| F9 | **Middle managers of areas that use or introduce AI** | Lead the change in their area. | F1 content applied to the area; assessment of the effect on work (document 50); human oversight and its limits; transition, communication and destination of released capacity; when to escalate. | 3–4 hour workshop with a case from the area. | On taking up the post or when the first initiative reaches the area; annually. | Record and participation in an effect assessment. |

### 6.3 Programme management

| Element | Rule |
|---|---|
| **Owner** | AI Office, with the people function. |
| **Annual plan** | Approved in C2 together with the policy; includes groups, priorities and budget (cost category "adoption and training"). |
| **Record** | Per person: assigned profiles, completed training, dates, assessments and expiry dates. The record (P45) is maintained in T20, is linked to P03 and its indicators are shown in T21. |
| **Access conditions** | F1 before receiving AI licences; F3 before overseeing a system in production; F4 before taking up a role in an initiative. |
| **Effectiveness** | Measured by outcomes, not just attendance: assessments passed, incidents caused by misuse, detections of unauthorised use, verifications of outputs in sampling. |
| **Updating** | Content reviewed at least annually and upon changes in regulation, tools or relevant incidents. |
| **Suppliers and collaborators** | Contracts with those who operate systems on behalf of the company should require training equivalent to the corresponding profile. |

### 6.4 Programme indicators

| Indicator | Formula | Use |
|---|---|---|
| F1 coverage | People with current F1 ÷ people with access to AI tools | Access condition; target close to 100 %. |
| Overseer coverage | Overseers with current F3 ÷ overseers assigned to systems in production | Control at G5 and R6. |
| Role coverage | People with an initiative role and F4 ÷ people with a role | Verification at G0. |
| Expired training | People with expired mandatory training | Monthly alert to the AI Office. |
| Pass rate | Assessments passed ÷ assessments taken, by profile | Content quality. |
| Incidents due to misuse | Incidents and nonconformities with root cause "lack of awareness of the policy" | Programme effectiveness. |

---

## 7. Corporate AI use monitor (T21)

Tool T21 (document 03) consolidates the information from this policy for the AI Committee and for the board dashboard.

### 7.1 Content

| Block | Indicators | Source | Frequency |
|---|---|---|---|
| **Licences and use** | Licences assigned per tool; active licences (use in the last 30 days) ÷ assigned; cost of unused licences. | Administration consoles; procurement | Monthly |
| **Catalogue** | Authorised, restricted and unauthorised tools; pending requests and average response time. | AI Office | Monthly |
| **Unauthorised use** | Detections by source; users or areas affected (aggregated); nonconformities by classification; regularisation decisions (authorise, replace, block); time to regularisation. | T02, T08 | Monthly |
| **Embedded AI** | AI functions detected in third-party software; enabled, disabled and pending decision. | T02, procurement | Quarterly |
| **Technical controls** | Data loss prevention events towards AI services; blocked extensions; authorised personal agents by level. | Security | Monthly |
| **Literacy** | Indicators in section 6.4. | Training record | Monthly |
| **Exceptions** | Current and expired use exceptions. | T01 | Monthly |

### 7.2 Presentation rules

- Data are presented **aggregated by area** unless the management of a nonconformity requires individuals to be identified, and with restricted access.
- "No data" is shown as no data (measurement rule 8); if a detection source has not been implemented, the monitor states so expressly instead of showing zero detections.
- The board dashboard receives the adoption and unauthorised use block with the `seguimiento.adopcion` fields of the dashboard data schema.

---

## 8. Relationship with the lifecycle and the *gates*

| Moment | What is checked from this policy |
|---|---|
| **C2** | Corporate policy approved by the board; acceptable use policy approved; annual literacy plan. |
| **G0** | Roles with F4 training or a plan to obtain it; no red lines in the proposal. |
| **G3** | Regulatory classification with no prohibited practice; no red line affected. |
| **G5** | Overseers with F3; transparency towards users implemented where applicable; compliance with 4.5. |
| **R6** | Compliant use in production; overseers with current training; no unauthorised uses associated with the process. |
| **C4** | T21 monitor reviewed by the AI Committee; exceptions reported to the board committee. |
| **C5** | Annual review of both policies and of the literacy programme. |

The specific *gate* criteria are set out in document 21.

---

## 9. Associated tools and templates

| Code | Name | Use in this document |
|---|---|---|
| **T21** | Corporate AI use monitor | Licences, unauthorised use, embedded AI, technical controls and literacy. |
| **T02** | AI system inventory | Registration of authorised tools, embedded AI and unauthorised uses. |
| **T08** | Nonconformity and incident register | Nonconformities due to unauthorised use and incidents reported by employees. |
| **T09** | AI supplier register | Assessment of suppliers of tools and of software with embedded AI. |
| **T01** | Initiative register | Exceptions and move to the full cycle. |
| **P05** | AI system inventory record | Registration of tools and uses. |
| **P14** | AI supplier assessment | Before authorising a tool or enabling embedded AI. |
| **P20** | Adoption and capacity plan | Training of overseers and users of initiatives. |
| **P40** | Exception request and register | Request, approval and register of exceptions to the policy (section 3.8). |
| **P43** | Catalogue of authorised tools and requests | Catalogue of authorised tools and requests for new tools (section 4.2). |
| **P44** | AI use and perception survey | Staff use and perception of AI, including unauthorised use (section 5.2). |
| **P45** | Literacy and training plan and record | Programme by profile and record per person (section 6). |

---

## 10. Related documents

| Document | Relationship |
|---|---|
| **01 · Foundational methodology** | Types of use (§1.2), Enterprise criteria (§9.2), nonconformities (§12). |
| **13 · AI thesis, ambition and risk appetite** | The corporate policy is approved together with the thesis in C2. |
| **23 · Adoption and change** | Training and adoption in each initiative. |
| **30 · Governance model** | Bodies that approve the policies and exceptions. |
| **32 · Inventory and regulatory classification** | Inventory fields and classification. |
| **34 · Regulatory mapping** | Obligations under Articles 4, 5, 26 and 50 of the AI Act. |
| **35 · AI and agent security** | Autonomy levels and agent controls. |
| **36 · AI third parties and suppliers** | Supplier assessment and embedded AI. |
| **37 · Nonconformities and incidents** | Classification and time limits. |
| **50 · People and organisation** | Effect on work and information to workers' representatives. |

This document does not constitute legal advice. The policy templates must be adapted, with qualified legal and employment law advice, to the situation of each company and jurisdiction.

---

## 11. Version control

| Version | Date | Changes |
|---|---|---|
| 0.1 | 16-09-2026 | First version. Templates for the corporate AI policy and the acceptable use policy; treatment of embedded AI, productivity suites, individual use and unauthorised use with detection, recording, classification as a nonconformity and regularisation; AI literacy programme across eight profiles with the wording of Article 4 as amended by Regulation (EU) 2026/1744; content of the T21 monitor. |
