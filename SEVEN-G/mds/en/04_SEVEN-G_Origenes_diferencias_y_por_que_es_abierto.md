# Where SEVEN-G comes from, how it differs and why it is open

**The practical origin of the framework, what it corrects in the usual approaches to AI adoption, what it takes from sales funnel management and the reasons for its open licence**

| | |
|---|---|
| Document | Document 04 · Origins, differences and openness |
| Version | 0.1 (working draft) |
| Date | 19-09-2026 |
| Author | Fernando García Varela |
| Status | Draft for review. Explanatory document: it adds no rules to the framework. |

<!-- cifras: 6 | common shortcomings the framework corrects ; 6 | management disciplines it brings together ; 5 | differences from a sales funnel ; 0 | obligations to hire the author -->

---

> **Legal notice and disclaimer.** SEVEN-G is a reference methodological framework provided "as is" and for information purposes only. It does not constitute legal, regulatory, financial or professional advice, nor does it guarantee compliance with any law or standard. References to general regulation (such as the EU AI Act, the GDPR, DORA or NIS2), to technical standards and to regulation specific to each sector or jurisdiction may be incomplete, may not apply to a particular case or may become out of date as a result of regulatory changes, interpretations or supervisory positions after their consultation date. **Each organisation that uses SEVEN-G is solely responsible for identifying the regulation that applies to it, verifying that it is current and certifying its own regulatory compliance**, with the appropriate qualified advice. The author accepts no liability for any use made of this content or for any decisions taken on the basis of it. The data, figures, companies and cases in the examples are fictitious or illustrative.

<!-- esencial: consulta | Explanatory document. It tells where SEVEN-G was born (from practice, not from a specific methodology), what it corrects in the usual way of adopting AI, what it takes from sales funnel management and where it departs from it, and why the framework is free of charge and freely distributable. It contains no rules or mandatory evidence: it is read once, to understand the reasons behind the framework. -->

## 1. Purpose and scope

This document answers three questions asked by anyone who meets SEVEN-G for the first time: **where it comes from**, **how it differs** from what their company already does or already knows, and **why it is offered free of charge under an open licence**.

It is an explanatory document. It adds no rules, criteria or evidence: the rules of the framework are in document 01 and in the documents that develop it. It is aimed at directors, executives and AI leads who are considering adopting the framework, and at consultants and auditors who want to understand its approach before applying it.

> **Why it matters.** A framework is adopted better when people understand what problem its author set out to solve and what he decided not to do.

---

## 2. Where SEVEN-G comes from

### 2.1 Born from practice, not from another methodology

SEVEN-G **does not declare any specific methodology as a direct inspiration**, whether for project management, software development, data science, technology services or technology governance. No document in the framework presents itself as an adaptation, extension or profile of another methodology, and none needs to be known in order to apply it.

The origin lies elsewhere: direct observation of how organisations adopt AI and where that adoption fails. The framework was built as an **alternative to the usual approaches**, which tend to prioritise experimentation over business value and prototypes over stable production. What SEVEN-G corrects is not a rival methodology but a very widespread way of working that has no name because it is hardly ever decided: it simply happens.

This does not mean that the framework starts from scratch. It brings together **management disciplines that companies already practise** —described in section 3— and applies them, jointly, to a new object. What it does not do is borrow the structure of a branded methodology and add the word "AI" to it.

### 2.2 What it corrects in the usual approaches to AI adoption

| Usual approach | Shortcoming | SEVEN-G's response | Where it is |
|---|---|---|---|
| **Experiment first and look for value later.** Work starts from the available technology and looks for a problem to apply it to. | Pilots that work but solve nothing the business is willing to pay for. | No initiative goes beyond phase 2 without a falsifiable value hypothesis, with a baseline, an attribution method and stop criteria set in advance. | document 01, section 6; document 40 |
| **The prototype as the destination.** Success is measured by the demonstration, not by operation. | Many pilots and few cases in production; recurring cost with no return. | "Production is the only truth": value is validated only under real conditions, with go-live sign-off, a tested rollback plan and periodic continuity review. | document 01, sections 3 and 7; document 52 |
| **Nobody can stop.** There are no criteria to iterate, pivot or retire. | Portfolios that only grow and concentrate risk. | Decision gates with five possible outcomes, a limit on iterations, a main stop gate (G3) and a retirement procedure. Stopping in time is a good outcome. | document 21; document 14, section 10 |
| **Value is declared.** Released hours are added up as savings and nobody checks them. | Figures that do not withstand an audit and poorly founded investment decisions. | Ten measurement rules; every amount carries a formula and a status (validated, declared or estimated); released capacity does not count until it is materialised. | document 40; document 43 |
| **Whoever builds also approves.** Governance arrives at the end, as a formality. | Weak controls, regulatory and security risk addressed late. | Segregation of duties from phase 0, dual validation (result and documentation), regulatory classification and risks before design. | document 01, section 8; document 30; document 32; document 33 |
| **Everything is called transformation.** Efficiency and transformation are mixed in the same narrative and judged with the same criteria. | The company believes it is transforming when it is only becoming more efficient, or blocks its transformation bets with cost-cutting criteria. | Three ambition levels with different gate criteria and a company transformation index based on evidence. | document 10; document 12 |

### 2.3 How the framework has evolved

SEVEN-G did not appear all at once: it grew out of earlier research work and has kept expanding since. This timeline is for the **framework as a whole** (a product version, which grows with every new block) and is different from the **version of each document**, which is numbered separately (section 10 of each document) and moves forward when that specific document changes.

> **Why it matters.** A framework that states where it comes from and how it has grown is easier to trust than one that appears already finished. The timeline also explains why some pieces (value measurement, risk) are more mature than others (transformation index, course): they have simply been worked on for longer.

| When | What was added |
|---|---|
| February 2025 | Initial research: the state of AI governance in organisations and a comparison of existing market methodologies and frameworks (risk management frameworks, AI management standards, internal consultancy practices). No published version yet. |
| March 2025 | First drafts of the initiative lifecycle and the decision gates, drawing on the discipline of phased investment and on sales-funnel management (section 4). |
| April 2025 | **Version 0.1** (first internal version): phases 0–7, gates G0–G7 with their five possible outcomes, and a first draft of the impact sphere map. |
| May 2025 | First governance model (board, AI committee, three lines of defence) and first evidence templates. |
| June 2025 | Value measurement rules (validated, declared and estimated statuses) and a first draft of the transformation index. |
| July 2025 | AI risk methodology (probability-and-impact matrix) and a first regulatory mapping (EU AI Act, GDPR). |
| August 2025 | First trials of the framework with real, anonymised use cases; gates and measurement rules adjusted from that experience. |
| **September 2025** | **First public release** of the framework (overview document and initial library in Spanish). |
| October 2025 | English translation of the initial library; translation guide and shared glossary. |
| November 2025 | Tool catalogue (T01–T22) and first design of the initiative register (T01). |
| December 2025 | Maturity model (seven dimensions) and first diagnostic questionnaire. |
| January 2026 | Risk methodology extended to generative AI and agents; autonomy levels A0–A3. |
| February 2026 | First AI board dashboard (T17), connected to the initiative register. |
| March 2026 | Generative-AI-specific controls: usage drift, bias testing with counterfactual pairs, cost degradation cascade. |
| April 2026 | Implementation guide and first calibration of Lite and Enterprise scope per company. |
| May 2026 | AI audit framework and declaration-of-application template. |
| June 2026 | SPHERES as a supporting methodology (spheres and ambition levels) and SPAD as the AI-assisted software-building methodology, both referenced from SEVEN-G. |
| July 2026 | Company transformation index (eight signals) and its calculator (T14). |
| August 2026 | Library extended with templates P32–P71 and the value, maturity and risk tools (T06, T11, T14, T15). |
| September 2026 | **Version 0.80** (current): complete library (documents 00–94, ES/EN), the SEVEN-G course with layered reading, an issues-and-requests community, and continued adjustment of documents and tools ahead of version 1.0. |

As long as the framework's version number has not reached 1.0, the "version under review" notice in section 6.4 still applies: the content is operational (document 00, decision D40), but it is requested not to be shared widely because documents and tools are still being adapted to make them reusable.

---

## 3. Management disciplines that SEVEN-G brings together

The parts of the framework are familiar to any executive because they come from established management disciplines. What is specific to SEVEN-G is **bringing them together in a single system**, with a single register and a single language, and adapting them to what is different about AI: probabilistic results, degradation over time, dependence on data and suppliers, agent autonomy and specific regulation.

| Management discipline | What SEVEN-G takes | What it changes or adds |
|---|---|---|
| **Phased investment with decision gates** | Moving forward in stages and committing money in tranches, with a formal decision at the end of each stage. | Dual validation, different criteria depending on ambition, separation between whoever verifies and whoever decides, and an operation phase that does not end at delivery: continuity review and a scale-or-retire gate. |
| **Sales funnel management** | Stages, requirements to move forward, time in each stage, conversion, loss reasons and weighted forecast. | The aim is not to convert more, but to decide well (section 4). |
| **Risk management and internal control** | Inherent and residual risk, risk appetite approved by the board, three lines with separate functions. | AI-specific categories (generative AI and agents, security and offensive AI, third parties), autonomy levels and critical controls that admit no conditions. |
| **Management control and benefits realisation** | Baseline, benefit owner, tracking by period and reconciliation with the accounts. | Amount statuses, attribution methods, full cost per case and a portfolio net value that counts only what has been validated. |
| **Corporate governance** | The board sets the direction, approves the risk appetite and oversees with comparable information. | Board dashboard, register of decisions and recommendations, and a permanent question: whether the company is transforming or only becoming more efficient. |
| **Change management** | Value depends on people adopting the solution. | Adoption is gate evidence, and released capacity is explicitly measured, materialised or reassigned. |

None of these disciplines is replaced. A company that already has its risk management, its project office or its management control **keeps them** and connects SEVEN-G to them (document 01, sections 1.2 and 13).

---

## 4. The portfolio as a funnel: what is taken from sales management

### 4.1 The idea

A sales organisation does not manage its opportunities from memory: it records them, knows which stage each one is in, how long it has been there, what it needs to move forward, how much it is worth and why the lost ones were lost. SEVEN-G applies that same discipline to AI initiatives. **To reach production, a mandatory set of states has to be passed through**, and the portfolio is read as a funnel.

> **Why it matters.** Hardly any company knows how long it takes to bring an AI idea to production, in which phase its initiatives get stuck or why the stopped ones were stopped. A sales team without that data could not manage its sales; an AI portfolio without it does not learn.

### 4.2 What is taken

| In sales management | In SEVEN-G | Where it is |
|---|---|---|
| Recorded opportunity | Initiative registered in the register, with a unique code and owners. | document 03, section 3 |
| Funnel stages | Phases 0 to 7 and, in the board dashboard, grouped stages. | document 01, section 6 |
| Requirements to move to the next stage | Criteria of each gate, with status and evidence. | document 21 |
| Days in stage | Time in phase and decision time of each gate. | document 03, section 3.5 |
| Stalled opportunities | Initiatives that exceed the reference time limit of their phase. | document 03, section 3.6; document 14, section 8 |
| Conversion between stages | Proportion that proceeds, iterates, pivots or stops at each gate. | document 03, section 3.5 |
| Loss reason | Coded stop or retirement reason, with what was learnt. | document 03, section 3.3 |
| Weighted forecast | Weighted portfolio value using the company's own historical probability. | document 03, section 3.5 |
| Sales management dashboard | Initiative register T01 and board dashboard T17. | document 60 |

### 4.3 Time control

The register keeps the entry and exit date of each phase, the periods on hold with their reason, and the date of request, verification and decision of each gate. With that data, four measures are obtained that hardly any AI portfolio has:

- **Time in phase**: where the bottlenecks are.
- **Decision time**: how long governance itself takes to decide. It measures the bodies, not the teams.
- **Time to production**: the real speed of the portfolio, from idea to G3 and from G3 to production.
- **Time on hold**, separate from the above, to distinguish the company's own delays from external dependencies.

The company approves the **reference time limits per phase** in C2 and recalibrates them every year with its own data. An initiative that exceeds them is flagged as stalled and reviewed by the AI Committee. The time limit does not require earlier approval: it requires a decision —proceed, wait with a reason or stop— instead of letting the initiative consume budget without anyone deciding so.

### 4.4 Where SEVEN-G departs from a sales funnel

| In a sales funnel | In SEVEN-G |
|---|---|
| The aim is **maximum conversion**: every lost opportunity is lost revenue. | **The aim is not to convert more.** Stopping an unfeasible initiative at G3 is a good outcome, because it avoids the cost of building it. A conversion close to 100% points to soft gates, not to a good portfolio. |
| Whoever owns the opportunity pushes it and is usually the one who reports its progress. | Whoever builds **neither verifies nor decides** their own progress. The status of each criterion is set by an independent verifier. |
| The probability of closing is estimated by the salesperson. | The probability of reaching production is **historical and the company's own**, and the weighted value is shown only when there is sufficient history. |
| The sale closes the cycle. | Go-live **opens** another one: operation, continuity review and the decision to scale, iterate or retire. A case in use can be disengaged, and that is also learnt from. |
| The amount of the opportunity counts in the forecast from the start. | Expected value **is not value**: only what is validated in production reaches the portfolio net value. |

---

## 5. How SEVEN-G differs, in summary

1. **It starts from business value, not from technology.** It is sector-, supplier- and technique-agnostic.
2. **It joins in a single system what is usually separate**: lifecycle, governance, risk, compliance, measurement and board share a register, codes and language.
3. **It reaches the board.** It is not only a method for teams: it gives governance bodies decisions, a dashboard and a register of what was decided.
4. **It distinguishes efficiency from transformation** with verifiable criteria, in each initiative and in the company.
5. **It makes stopping a normal decision**, with criteria set before starting and reasons that are kept in order to learn.
6. **It measures the decision system itself**: times, conversion, iterations and expired conditions.
7. **It requires evidence, not declaration**, and separates whoever builds from whoever verifies and from whoever decides.
8. **It is proportionate**: Lite or Enterprise intensity per initiative and implementation scope per company (document 94).
9. **It is compatible and modular**: it coexists with the frameworks and bodies the company already has and can be adopted by components.
10. **It is open**: it can be used, adapted and redistributed without asking permission or paying (section 6).

---

## 6. Why it is free of charge and freely distributable

### 6.1 The reason

**Author's note.** I have seen at first hand the need many companies have to put things in order: they are unsure how to start, how to take an inventory of what they are already doing and how to bring order to a chaotic and very fast-moving world of innovations. That is why I have decided to share my knowledge and my way of working: my goal is to help the market move forward on governed use of artificial intelligence, not to make money directly from the methodology, its documents, its templates or its tools. **The whole site can be used, read and downloaded without even registering**, and it never sends an email or any other communication seeking to gain clients. Where there is a personal contribution with a cost is if someone wants to request my services —a custom course on the methodology, consulting, or board advisory for a company, for example— and that decision is entirely up to whoever reads this: **I am reachable, but it is you who decides whether to get in touch with me.**

— Fernando García Varela

### 6.2 What it means in practice

| Question | Answer |
|---|---|
| Does SEVEN-G have to be paid for? | No. Neither the documents, nor the templates, nor the tools. |
| Do you have to register or give an email to use the site? | No. Everything is read, used and downloaded without an account or registration. |
| Does the site send emails or try to capture contacts? | No. It never sends an email or any communication seeking engagement; contacting the author is always the visitor's own initiative (section 7). |
| Does permission have to be requested? | No, as long as the licence is complied with. |
| Can it be adapted to the company? | Yes: change thresholds, translate, integrate the templates into the company's own systems. |
| Can a consultancy or an auditor use it in paid services? | Yes. The licence allows commercial use (document 91). |
| Does it oblige anyone to hire the author? | No. The framework is designed so that a company, consultancy or professional can apply it by itself. |
| So how does the author make money from this? | Not directly from the methodology: the author's personal contribution has a cost only if someone hires his services (a custom course, consulting or board advisory for a company). |
| What if the company wants support? | It can ask the author or any other professional. Document 91 describes the support models and how to avoid dependence on the consultant. |

### 6.3 What control the author keeps

Openness is not an absence of rules. The author chose the minimum control needed for the framework to circulate without losing its authorship or its coherence:

| Element | What is controlled | Why |
|---|---|---|
| **Contents under CC BY 4.0** | A single requirement: credit the author (Fernando García Varela), link to the licence and indicate whether changes were made. | Prohibiting commercial use was ruled out because it would create doubts for user companies and for those who advise them. |
| **Code under MIT** | Keep the copyright notice and the licence. | The tools must be able to be integrated into each company's systems. |
| **The SEVEN-G name** | Using the name does not imply endorsement by the author. There is no official certification: the declaration of application is a self-declaration verifiable by audit. | To prevent the name from being used to promise what nobody has checked. |
| **Published versions** | The licence of a published version is not revoked. | Whoever adopts the framework needs to know that it will not be withdrawn from them. |
| **Disclaimer** | The framework is provided "as is"; each organisation is responsible for its own regulatory compliance, and derivative works must keep the notice. | The author cannot answer for uses he is not aware of. |

The detail is in document 93. This document does not constitute legal advice.

### 6.4 The version-under-review notice

While the framework is at version 0.x, its main pages ask readers **not to circulate it widely**. This is a request from the author, not a licence restriction: CC BY 4.0 already allows these versions to be shared. The request has a practical reason —documents and tools are being adapted to make them reusable— and it will disappear with version 1.x.

---

## 7. Contact

For queries about the framework, improvement proposals, error reports or requests for support: **Fernando García Varela**, on his professional LinkedIn profile: <https://www.linkedin.com/in/fernandogarciavarela/>. **SEVEN-G is a registered trademark of Fernando García Varela** (document 93, section 7).

There is no need to get in touch or ask permission for any use that complies with the licence; the site never asks for it and never reaches out on its own initiative to whoever visits it. Contacting the author does not turn a use into an endorsed one (document 93, section 7).

---

## 8. Associated tools and templates

| Code | Name | Relationship with this document |
|---|---|---|
| T01 | Initiative register | Applies funnel management: phases, times, criteria, stop reasons and value. |
| T17 | Board AI dashboard | Shows the funnel, the cases that left it and why. |
| P29 | *Gate* decision record | Keeps the outcome and the reason for each decision. |
| P30 | Scale or retire decision | Records the lessons learnt from each retirement. |

---

## 9. Related documents

| Document | Relationship |
|---|---|
| **00 · What SEVEN-G is and how it helps companies** | The problem the framework solves and its principles. |
| **01 · Foundational methodology** | Compatibility and modular adoption (section 1.2), lifecycle traceability (section 6.11) and reference standards (section 13). |
| **03 · Tools and initiative register** | The CRM analogy, funnel metrics and reference time limits (section 3). |
| **14 · Portfolio management** | Stalled initiatives and retirement procedure. |
| **91 · Guide for consultants** | Support models and transfer to the company. |
| **93 · Licence, third-party use and citation** | Full text on licences, name, derivative works and disclaimer. |
| **94 · Obligation matrix and layered reading** | What is always mandatory and what depends on each company and initiative. |

---

## 10. Version control

| Version | Date | Changes |
|---|---|---|
| 0.1 | 19-09-2026 | First version. Practical origin of the framework, shortcomings of the usual approaches that it corrects, management disciplines it brings together, the portfolio as a sales funnel and its differences, reasons for the open licence, control kept by the author and contact. |
