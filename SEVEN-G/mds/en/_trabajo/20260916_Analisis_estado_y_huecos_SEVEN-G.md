# SEVEN-G · Analysis of the current state, gaps and document plan

| | |
|---|---|
| Type | Internal working document |
| Date | 16-09-2026 |
| Version | 0.2 |
| Objective | Inventory what exists, identify inconsistencies and gaps, and propose the complete SEVEN-G document library for use by any company. |

> Internal document. It contains no client data. Real experiences are cited in anonymised form.

---

## 1. Inventory of what exists

### 1.1 SEVEN-G materials in this repository

Since 16-09-2026 all these materials are in `SEVEN-G/_legacy/`.

| Material | Language | Actual content | Reuse |
|---|---|---|---|
| `SEVEN-G_Document_1_Foundational_Methodology.pdf` | EN | Substantive summary (~600 words): 6 principles, Stage-Gate cycle, phases 0–7, 6 roles, segregation of duties, 7 risk categories, Lite/Enterprise versions, maturity 0–5. | **Canonical conceptual basis.** Develop. |
| `SEVEN-G_Document_9_Phase_Gate_and_Audit_Criteria` (standard and *Expanded*) | EN | Substantive: criteria per phase, 21 mandatory artefacts, dual validation, approval rules. | **Basis of the lifecycle.** Merge both versions. |
| Documents 2, 3, 4, 5, 6, 10, 11, 12 | EN | One-page skeletons (1.8–2.1 KB): scope and table of contents only. | Structure reusable; content still to be written. |
| Documents 7 and 8 | — | Do not exist in PDF. The Master Pack index names them (Charter and Engagement Guide). | `.md` versions exist with a different phase model. |
| `SEVEN-G_Master_Print_Pack.pdf` | EN | Cover and index of 12 documents. | Replace with the index of the new library. |
| `SEVEN-G_IA_for_Hypergrowth.pdf` | ES | 15 slides generated with NotebookLM summarising docs 1, 9, 11, 12. Contains visible defects (printed style instructions, typos). Does not deal with hypergrowth. | Not a deliverable. Redo as a framework presentation. |
| `Documents Framework/*.md` (8 files) | EN | Long templates with fictitious examples (US manufacturing company, churn prediction case). They use a different model: the Strategy-Exploration-Validation-Execution-Navigation-Governance acronym. Numerous numerical inconsistencies. | Reusable material **after rewriting**: Risk Matrix (the most robust), GO/NO-GO Decision Record, Charter, Maturity Report, Runbook. Value Hypothesis Canvas is a skeleton. |
| `SPHERES/_legacy/SEVENG - Marco_Esferas_IA_v2.pptx` | ES | 9 spheres × 3 levels, questions for the board, 60-minute script, 90-day plan. Does not mention SEVEN-G. | **Component A of the framework.** Integrate. |
| `SPAD/` | ES/EN | AI-assisted software engineering methodology, with AI roles, phases and a validation policy. Describes itself as a "foundational skill of SEVEN-G". | Complementary piece for phases 4–5 when the solution is built with AI. Broken internal links. |

### 1.2 Related external materials

| Material | Reuse |
|---|---|
| `AI_en_el_consejo` repository (dashboard engine, 11 sector demonstrations, recommendation register, JSON schema, MIT / CC BY 4.0 licences) | **Component D.** Provides the measurement rules, the ambition label, the separation of efficiencies / return, agility by risk and ambition, exposure to offensive AI and agent controls. |
| Practical application in a technology advisory board of an insurance group (2026) | Validated the use of spheres × levels as a lens for analysing real documents, and produced reusable artefacts: value hypothesis per case, 4 *gates* with decision-maker and evidence, multi-level go-live sign-off with veto, intent-based access control criteria for agents, requirements on third parties at 3 levels, residual risk P×I, maturity by dimension with evidence, programme traffic-light status. **Do not carry over client data, names, figures or recognisable features.** |
| Internal note on publication (15-09-2026) | Criteria for publishing each piece: it answers a specific board decision, it has a usable artefact, it can be tested with fictitious data in under 10 minutes and it does not require hiring the author. Risk of brand dispersion. |
| AECF (`C:\SEACHAD\AECF_MCP`) | Associated with agile AI governance and AIFlow. Relationship with SEVEN-G to be defined. |

---

## 2. Inconsistencies to be resolved

### 2.1 What SEVEN-G is (four definitions)

| Source | Definition |
|---|---|
| Doc 1 and Master Pack | *Seven-Phase Enterprise Value & Governance Framework for AI*, with 8 phases (0–7). |
| Engagement Guide and Charter | Acronym **S**trategy, **E**xploration, **V**alidation, **E**xecution, **N**avigation + **G**overnance (6 or 5 phases). |
| NotebookLM presentation | Enterprise Governance and Value Framework for AI. |
| SPAD (landing) | Engineering framework based on *skills*. |

**Proposal adopted in document 00 (pending confirmation):** SEVEN-G = *Seven-phase Enterprise Value & Governance*. Phase 0 is enabling (authorisation) and phases 1–7 are the seven value phases; the G expresses cross-cutting governance. The S-E-V-E-N-G acronym is abandoned, but its useful content (engagement models, prioritisation criteria, KPIs) is relocated.

### 2.2 Other inconsistencies

| Topic | Variants found | Proposal |
|---|---|---|
| Number and names of phases | 8 (0–7), 6, 5 with months; *Validation* = PoC or MVP depending on the document; *Navigation* = optimisation or deployment. | Phases 0–7 of Doc 1 in Spanish (table in document 00). |
| *Gate* outcomes | Validate/Iterate/Pivot/Stop; GO/ITERATE/STOP; GO/GO with conditions/DEFER/NO-GO; Pass/Conditional/Fail; APPROVED/…; GO/ITERATE/NO-GO. | Proceed / Proceed with conditions / Iterate / Pivot / Stop; in phase 7 Scale / Iterate / Retire. Audit: Conformant / Conformant with observations / Nonconformant. |
| Maturity | 0–5 with 4 or 5 metrics (Doc 1, Doc 5); 1–5 with 7 dimensions and CMMI names (Maturity Report); 1–5 per sphere (90-day plan). | 0–5 scale with rubric and evidence per dimension; overall level = weighted minimum, not a simple average. Final dimensions still to be decided. |
| Risk categories | 7, 6, 4 and 5 depending on the document. | The 7 of Doc 1 + a specific extension for generative AI, agents and security. |
| Roles | 6 normative roles; consultancy roles; in SPAD "AI Auditor" is a language model. | 6 normative roles + corporate bodies. In SPAD rename the AI role (e.g. "AI reviewer") to avoid a clash with the human AI Auditor. |
| ROI | Four thresholds and two different formulas. | Replace with the measurement rules (annual net value, additional net value per additional euro invested). If ROI is used, a single formula based on net profit. |
| Spheres 08 and 09 | Use other levels; they were mixed up in the practical application. | Explicit rule (document 00, §4.1). |
| Geographical scope | Templates with dollars, CCPA, HIPAA. | Euros, European and Spanish regulation as the reference; annexes for other jurisdictions. |
| Brand names | SEVEN-G, SevenG, SEVENG, SPHERES, Marco de Esferas. | Single umbrella **SEVEN-G**; "Sphere map" as a component. SPAD and AECF as related pieces, not parallel brands. |
| Language | Normative PDFs in English, board material in Spanish. | To be decided: Spanish as the master version with subsequent translation into English. |
| Unsupported figures | "50+ engagements", "benchmark of 200+ organisations", "↓70% rework", ROI percentages. | Remove all claims that cannot be demonstrated. |

---

## 3. Gaps identified

### 3.1 Structural gaps (phases and levels)

1. **The company level is missing.** All existing material governs *initiatives*. There is no cycle in which the board and management diagnose, set the ambition and risk appetite, manage the portfolio, oversee and review. **Proposed in document 00 as the corporate cycle C1–C5.**
2. **The distinction between efficiency and transformation is missing.** No normative document addresses it; the Charter even excludes transformation from its scope, and the ROI filters in phases 1 and 3 penalise transformational bets. Only the Sphere map and the board dashboard outline it. **Proposed in document 00: ambition classification with 5 questions, differentiated gate criteria and a transformation index with 8 signals and 5 profiles.** Thresholds and calibration are missing.
3. **Retirement has no procedure.** It exists as an outcome of phase 7, but there are no criteria, owners or a register of retirements (with replacement and lessons learned).
4. **There are no criteria for choosing Lite or Enterprise.** Proposed on a preliminary basis in document 00.
5. **There is no treatment of AI that is not a project**: AI embedded in third-party software, productivity suites with AI, individual use by employees and *shadow AI*. Today these fall outside the 0–7 cycle and are a growing share of risk and spending.
6. **An adoption and change phase or sub-process is missing.** Phase 5 validates value, but there is no explicit treatment of actual adoption, reallocation of released capacity and training, which are preconditions for the value to materialise.

### 3.2 Thematic gaps

| Topic | Current situation | Why it matters |
|---|---|---|
| **Generative AI and agents** | Existing material is designed for classical ML (accuracy, drift). | Evaluations, hallucinations, prompt injection, agent identity and permissions, intent-based access control, kill switch, human validation of actions. |
| **Security and offensive AI** | Only in the board dashboard. | Attacks that use AI, and in-house agents that have been manipulated, are already a real source of notified breaches. |
| **Inventory and regulatory classification** | Does not exist. | A de facto obligation for applying the EU AI Act. |
| **Regulatory mapping** | Doc 12 is a skeleton; only one mention of the EU AI Act in the whole framework. | Missing: articles of the EU AI Act (including AI literacy, art. 4; transparency, art. 50; serious incidents), ISO/IEC 42001, NIST AI RMF, GDPR, DORA, NIS2, sector-specific regulation. |
| **AI third parties and providers** | Isolated mentions. | Technology dependency, contracts, use of data by the provider, register of critical third parties. |
| **AI costs (FinOps)** | Does not exist. | Cost per case with analytical allocation of licences, model consumption and compute; necessary to calculate net value. |
| **Data and knowledge** | Spheres 05 and 06 without indicators. | Data readiness is the main cause of delay and failure. |
| **People** | Sphere 03 without indicators; displacement risk mentioned in passing. | Capacity reallocation, new roles, training, labour relations, communication. |
| **Indicators per sphere** | There are strong metrics for governance, regulation and decision; they are missing for customer, product, knowledge and data. | Without them the sphere map cannot be measured. |
| **Maturity** | No rubric, no questionnaire, no evidence per level. | It is the first deliverable of any implementation. |
| **Guide for conversations with the board** | Exists in candidacy material, not generalised. | Language, response format ("Yes, with one condition"; "Not yet, because X is missing"), number of cases to present. |
| **Application cases** | Only inconsistent fictitious examples. | Credibility of the framework. They must be anonymised, or fictitious and consistent with the demonstrations. |
| **Use of the framework by third parties** | Not defined. | Content licence, terms of use by consultancies, possible certification. |

---

## 4. Proposed document library

Status: **New** (does not exist), **Rewrite** (reusable material exists), **Integrate** (exists outside SEVEN-G), **Done v0.1**.

### A · Foundations

| No. | Document | Source | Status |
|---|---|---|---|
| 00 | What SEVEN-G is and what it is for | All material | Done v0.1 (ES/EN) |
| 01 | Foundational methodology (complete model, principles, levels, components) | Doc 1, Doc 9 | Done v0.1 (ES/EN) |
| 02 | Glossary and conventions (terms, scales, *gate* outcomes, nomenclature) | All | Done v0.1 (ES/EN) |
| 03 | Tools and initiative register (catalogue, data model, funnel) | Board dashboard, practical experience | Done v0.1 (ES/EN) |

### B · Strategy and portfolio (company level)

| No. | Document | Source | Status |
|---|---|---|---|
| 10 | Sphere map and ambition levels (with indicators per sphere) | Marco de Esferas v2 | Done v0.1 (ES/EN) |
| 11 | Maturity model: dimensions, 0–5 rubric, questionnaire, evidence | Doc 5, Maturity Report | Done v0.1 (ES/EN) |
| 12 | Transformation index: ambition criteria, signals, profiles, thresholds | Document 00, board dashboard | Done v0.1 (ES/EN) |
| 13 | AI thesis, ambition and risk appetite (template for the board) | — | Done v0.1 (ES/EN) |
| 14 | Portfolio management: prioritisation, ambition balance, review and retirement | Engagement Guide (prioritisation), dashboard | Done v0.1 (ES/EN) |

### C · Initiative lifecycle

| No. | Document | Source | Status |
|---|---|---|---|
| 20 | Phase manuals 0–7 (objective, inputs, activities, roles, evidence, common mistakes) | Doc 3, Doc 9, Engagement Guide | Done v0.1 (ES/EN) |
| 21 | *Gate* and audit criteria, with Lite/Enterprise variants and by ambition level | Doc 9 (both versions), GO/NO-GO Record | Done v0.1 (ES/EN) |
| 22 | Checklists per *gate* | Doc 10 | Done v0.1 (ES/EN) |
| 23 | Adoption and change in the initiative (released capacity, training, communication) | Engagement Guide (ADKAR) | Done v0.1 (ES/EN) |

### D · Governance, risk and compliance

| No. | Document | Source | Status |
|---|---|---|---|
| 30 | Governance model: bodies, roles, segregation of duties, RACI per phase, escalation | Doc 1, Doc 4, Charter | Done v0.1 (ES/EN) |
| 31 | Corporate AI policy and acceptable use policy (includes *shadow AI* and AI literacy) | — | Done v0.1 (ES/EN) |
| 32 | AI system inventory and regulatory classification | Dashboard (schema) | Done v0.1 (ES/EN) |
| 33 | AI risk methodology: matrix, register, typical risks (includes generative AI and agents) | Risk Matrix, Risk Register | Done v0.1 (ES/EN) |
| 34 | Regulatory mapping: EU AI Act, ISO/IEC 42001, NIST AI RMF, GDPR, DORA, NIS2 | Doc 12 | Done v0.1 (ES/EN) |
| 35 | AI and agent security: offensive AI, identity, permissions, intent-based access control, kill switch | Dashboard, practical experience | Done v0.1 (ES/EN) |
| 36 | AI third parties and providers: selection, contracts, requirements at 3 levels, dependency | Practical experience | Done v0.1 (ES/EN) |
| 37 | Nonconformities, AI incidents and remediation | Doc 11, Runbook (incidents) | Done v0.1 (ES/EN) |
| 38 | AI audit framework | Doc 2 | Done v0.1 (ES/EN) |

### E · Measurement and value

| No. | Document | Source | Status |
|---|---|---|---|
| 40 | Value measurement rules | Board dashboard | Done v0.1 (ES/EN) |
| 41 | Catalogue of indicators with formulas (by sphere, phase, ambition level and company) | Charter, Maturity Report, dashboard | Done v0.1 (ES/EN) |
| 42 | AI costs and allocation per case | Practical experience | Done v0.1 (ES/EN) |
| 43 | Benefits realisation: tracking, attribution, post-implementation review | Charter, Doc 9 (Value Realization Tracker) | Done v0.1 (ES/EN) |

### F · People, data and operations

| No. | Document | Source | Status |
|---|---|---|---|
| 50 | People and organisation: roles, capabilities, reallocation, labour relations | Sphere 03 | Done v0.1 (ES/EN) |
| 51 | Data and knowledge for AI: data governance, preparation, lineage | Spheres 05 and 06 | Done v0.1 (ES/EN) |
| 52 | AI operations manual (classical ML, generative AI, agents) | AI Ops Runbook | Done v0.1 (ES/EN) |
| 53 | Building solutions with AI (relationship with SPAD) | SPAD | Done v0.1 (ES/EN) |

### G · Board

| No. | Document | Source | Status |
|---|---|---|---|
| 60 | Board pack: content, frequency, decision format | Doc 6 | Done v0.1 (ES/EN) |
| 61 | Guide for conversations with the board: questions per sphere, language, 60-minute script | Marco de Esferas, practical experience | Done v0.1 (ES/EN) |
| 62 | Register of recommendations and decisions | Board dashboard | Done v0.1 (ES/EN) |

### H · Templates (per initiative)

Initiative charter · Context and constraints statement · Role assignment record · Opportunity portfolio and screening notes · Ambition classification · Value hypothesis canvas · Baseline · Feasibility assessment · Regulatory classification and impact assessments · Risk matrix and register · Mitigation and contingency plan · Architecture record · Data and model lineage · Governance and human oversight design · Rollback plan · Delivery report · Validation results · *Gate* decision record · Go-live sign-off · Operations manual · Monitoring configuration · Incident response plan · Value realisation tracking · Scale or retirement decision record · Use case sheet.

Format: Markdown as the source, published in PDF and HTML. Templates that require it (for example, registers or calculators) will also be generated in Excel or PowerPoint when expressly requested.

### I · Tools

The complete catalogue of tools (22), the design of the initiative register as a managed funnel and the build order are in **document 03 · Tools and initiative register**. The AI board dashboard (T17) and the recommendation register (T18) from the `AI_en_el_consejo` repository already exist, and must be adapted to draw on the register.

### J · Framework adoption

| No. | Document | Source | Status |
|---|---|---|---|
| 90 | SEVEN-G implementation guide: Lite and Enterprise, first 90 days | Doc 1, Marco de Esferas | Done v0.1 (ES/EN) |
| 91 | Guide for consultants and support models | Engagement Guide | Done v0.1 (ES/EN) |
| 92 | Application cases (fictitious and consistent, or anonymised) | Demonstrations | Done v0.1 (ES/EN) |
| 93 | Licence, use by third parties and citation | `AI_en_el_consejo` licences | Done v0.1 (ES/EN) |

---

## 5. Decisions adopted (16-09-2026)

| # | Topic | Decision | Rationale |
|---|---|---|---|
| 1 | **Meaning of the name** | SEVEN-G = *Seven-phase Enterprise Value & Governance*: enabling phase 0, seven value phases and cross-cutting governance. The Strategy-Exploration-Validation-Execution-Navigation-Governance acronym is abandoned. | It is the definition in the foundational document and the only one compatible with the 0–7 phase cycle and its *gates*. |
| 2 | **Languages** | **All documents are always generated in Spanish and English.** Spanish is the drafting version; the English version is updated in the same delivery. | Author's decision (16-09-2026) to offer the framework to international companies and boards from the outset. |
| 3 | **Format and style** | Markdown sources in `SEVEN-G/mds/es` and `SEVEN-G/mds/en`; output in HTML (`SEVEN-G/html/<idioma>`) and PDF (`SEVEN-G/pdf/<idioma>`) with `SEVEN-G/build/build.ps1`, in a financial-newspaper style with salmon tones. The HTML files include a theme selector, term search, section navigator and language selector. SEVEN-G's own diagrams as reusable components in `build/componentes/`; one-off diagrams in Mermaid. PowerPoint or Excel only when expressly requested. | A single source, two consistent outputs and consistent diagrams across documents. |
| 4 | **Legacy materials** | Moved to `SEVEN-G/_legacy/` (git history preserved). They are consulted as a source when rewriting each document, but are not part of the current framework. | Prevents two models of phases, scales and *gate* outcomes from coexisting. |
| 5 | **Licence** | Content (documents, templates, criteria, graphic components): **CC BY 4.0** (`LICENCIA_CONTENIDOS.md`). Code (generation scripts): **MIT** (`LICENSE`). Authorship: © 2026 Fernando García · SEACHAD, SEVEN-G methodology. | Consistent with `AI_en_el_consejo` and with the publication criterion "does not require hiring the author to use it". A non-commercial (NC) clause would create doubts precisely among user companies. The differentiating value lies in application and support, not in the text. |
| 6 | **Relationship with SPAD and AECF** | They remain independent methodologies and are referenced from SEVEN-G: SPAD in document 53 (building solutions with AI, phases 4–5); AECF as a reference for agile governance. They are not presented as parallel brands in SEVEN-G documents. | Reduces brand dispersion: one umbrella (SEVEN-G) and referenced specialised pieces. |
| 7 | **Dimensions of the maturity model** | Working proposal, to be validated in document 11: 1) Strategy and governance · 2) Value and portfolio · 3) Data and knowledge · 4) Technology and operations · 5) People and adoption · 6) Risk, security and compliance · 7) Measurement and evidence. 0–5 scale with rubric and evidence per level. | Covers the metrics of the foundational document, the seven dimensions of the old maturity report and the gaps identified (value, security, measurement). |

**Points to review if the context changes**

- If the `AI_CONSULTING` repository becomes public, exclude `mds/_trabajo/`, `html/_trabajo/` and `pdf/_trabajo/` in `.gitignore` before the first public *push*.
- If it is decided to restrict commercial reuse by third parties, the licence can only be tightened for future versions; versions already published under CC BY 4.0 retain that licence.

## 6. Recommended work order

1. **01 Foundational methodology** (done) and **02 Glossary**: they set the model and vocabulary for everything else.
   - After 02: **wave 1 of tools** (initiative register T01 with inventory, *gate* manager, intensity and ambition, and connection of the board dashboard). See document 03.
2. **10 Sphere map**, **12 Transformation index** and **40 Measurement rules**: they are the most differentiating elements and the ones that connect with the board dashboard.
3. **21 Gate criteria** and **20 Phase manuals**, with their block H templates.
4. **30 Governance model**, **32 Inventory**, **33 Risks**, **34 Regulatory mapping**, **35 Agent security**.
5. **11 Maturity** with questionnaire.
6. Remaining blocks G and E, F and J.
7. Update of the board dashboard to reflect spheres, maturity and the transformation index.

---

## 7. Resolution of the analysis (16-09-2026, version 0.2)

Everything set out in this analysis has been resolved with the recommendations detailed below. The new decisions are in `.claude/seveng_decisiones.md` (D19–D27); the common parameters, in `_trabajo/20260916_Especificacion_comun_biblioteca_SEVEN-G.md`; and the cross-document adjustments, in `_trabajo/20260916_Ajustes_de_coherencia_SEVEN-G.md`.

### 7.1 Inconsistencies

| Topic (§2) | Resolution | Where |
|---|---|---|
| What SEVEN-G is | *Seven-phase Enterprise Value & Governance* (D02). | 00, 01, 02 |
| Number and names of phases | Phases 0–7 with *gates* G0–G5, R6 and G7. | 01, 20, 21 |
| *Gate* outcomes | Proceed / Proceed with conditions / Iterate / Pivot / Stop; G7: Scale / Iterate / Retire; **R6: Proceed with operation / Proceed with conditions / Bring G7 forward** (added to 01 §7.3). Audit: Conformant / Conformant with observations / Nonconformant. | 01, 21, 22, 38, P29 |
| Maturity | 7 dimensions D1–D7, levels 0–5 with rubric, an 84-question questionnaire and an overall level capped by D1 and D6 (D20). | 11 |
| Risk categories | 7 categories plus the GEN, SEG and TER domains (third parties added to 01 §10); 5×5 scale; 70 typical risks. | 01, 33 |
| Roles | 6 roles and bodies; in SPAD the AI role becomes "AI reviewer" (D23). Segregation of duties reinforced in Lite: the AI Office verifies G3–G5 and the AI Sponsor decides with risk clearance. | 01, 30, 53, SPAD |
| ROI | Sole economic feasibility criterion: NPV ≥ 0 on net profit, with the horizon and rate set in C2; ROI and payback period for information only; formulas F1–F10. | 40, 01 §7.6 |
| Spheres 08 and 09 | Their own grades (Absent, Basic, Systematic, Advanced); secondary sphere only if the purpose is compliance or governance; separate investment band. | 10 |
| Geographical scope | Euros and European and Spanish regulation; other jurisdictions in an indicative annex. | 34 |
| Brand names | Single umbrella SEVEN-G; SPAD and AECF as related methodologies; SPAD corrected. | 53, SPAD |
| Language | Always Spanish and English (D12). | Entire library |
| Unsupported figures | Removed; fictitious examples labelled. SPAD retains its own figures, which the author must review. | Entire library |

### 7.2 Structural gaps

| Gap (§3.1) | Resolution | Where |
|---|---|---|
| 1. Company level | C1–C5 cycle developed: thesis, ambition and appetite, portfolio, maturity, index, board and implementation. | 01, 11–14, 60–62, 90 |
| 2. Efficiency versus transformation | Ten classification rules, base conditions B1–B3, initial thresholds for the 8 signals (to be calibrated) and detection of "declared but unevidenced transformation"; prioritisation in three groups by ambition, each with its own budget. | 12, 14 |
| 3. Retirement | 10-step procedure, retirement register and template P30; tool T22. | 14, P30 |
| 4. Lite or Enterprise | Criteria in 01 §9, with the agent criterion clarified (A2/A3 with external effect, D22); template P04; company implementation scope distinct from intensity. | 01, P04, 90 |
| 5. AI that is not a project | Corporate and acceptable use policy; embedded AI, productivity suites, individual use and *shadow AI*; inventory of the four types of use. | 31, 32, 36 |
| 6. Adoption and change | Adoption plan, released capacity with five destinations, training and AI literacy, indicators and G5 and G7 criteria. | 23, 50, P20 |

### 7.3 Thematic gaps

| Gap (§3.2) | Resolution |
|---|---|
| Generative AI and agents | Autonomy A0–A3, controls SEG-01–20 and AG-01–20, checklist LV-AG and [GEN] and [AG] criteria in the *gates* (35, 21, 22, 52). |
| Security and offensive AI | Document 35, with exposure to attacks that use AI and indicators for the board. |
| Inventory and regulatory classification | Document 32; templates P05 and P11. |
| Regulatory mapping | Document 34 verified as at 16-09-2026, including Regulation (EU) 2026/1744 (Annex III postponed to 2-12-2027 and Annex I to 2-08-2028). **Pending cross-check against the Official Journal of the EU and legal review.** |
| Third parties and providers | Document 36 with levels N1–N3 and 16 key clauses; template P14. |
| AI costs | Document 42 with nine categories and analytical allocation. |
| Data and knowledge | Document 51 with DAT and CNC indicators. |
| People | Document 50 with PER indicators and maximum autonomy in decisions about people. |
| Indicators per sphere | 60 IE indicators in 10 and a catalogue of 156 indicators in 13 families with a correspondence table in 41. |
| Maturity | Rubric, questionnaire and verified assessment method (11). |
| Guide for conversations with the board | Document 61 with a 60-minute script and response format. |
| Application cases | Five fictitious cases consistent with the demonstrations (92). |
| Use of the framework by third parties | Documents 91 and 93; no official certification in version 0.x (D25). |

### 7.4 Blocks H, I and J

- **H · Templates:** 31 templates P01–P31 aligned with 01 §6.10 (D21), in Spanish and English.
- **I · Tools:** T01 (initiative register with T02–T05 integrated) in `SEVEN-G/herramientas/T01_registro_iniciativas/`. T17 and T18 are adapted in the private project where the engine originates (D26).
- **J · Framework adoption:** documents 90–93 done. `SEVEN-G_IA_for_Hypergrowth.pdf` is not redone (D24).

### 7.5 Outstanding items for the author

1. Validate the decisions marked "to be validated" (D19, D20, D22, D25) and the initial thresholds marked "to be calibrated" (transformation index, appetite and materiality, prioritisation, traffic-light status, status expiry, consumption alerts, audit sample sizes).
2. Legal review of document 34 and of the regulatory citations in 31, 32, 37 and 50–52, in particular the text of Regulation (EU) 2026/1744 in the Official Journal of the EU, the Spanish transposition of NIS2 and the draft Organic Law on AI.
3. ~~Incorporate into 33 the three typical risks proposed in 50 (information and consultation, labour conflict, wellbeing); assign IND- codes to around 60 provisional indicators in 41; resolve the clash between the CON- (knowledge, 51) and IND-CON (board, 41) prefixes.~~ **Resolved (16-09-2026):** risks RT-ORG-07 (failure to inform and consult), RT-ORG-08 (labour dispute) and RT-ORG-09 (deterioration of wellbeing) added to the catalogue in 33 (70 typical risks) and linked from 50 §12; the 50 provisional codes without an equivalent have an IND- code in 41 §21 (47 new indicators, because IE03.06 and PER-14, IE05.05 and DAT-10, and IE06.02 and CNC-06 share a code), in the EMB, RIE, OPE, ADO, DAT and CLI families and in the new PRO · Processes and decision-making family (catalogue of 156 indicators in 13 families; Lite set unchanged, 26); the knowledge indicators in 51 change from CON- to CNC- in 41, 50, 51, 52, 02 and the common specification (§5.9).
4. ~~SPAD: review the claims involving return and certification figures.~~ **Resolved (16-09-2026):** unsupported figures replaced by objectives to be measured, "certification" by conformity self-assessment, and a legal notice in every file. The PDF `05_SPAD_Skill_Methodology_Seachad.pdf` still needs correcting at source.
5. ~~Adapt T17 and T18.~~ **Resolved without touching the engine (16-09-2026):** connector `SEVEN-G/herramientas/T17_panel_consejo/` with a demo in `ejemplo/salida/`. Pending in the engine's private source project: rename legacy keys (`estimado_cati`, `aap`) and add sphere, maturity, index and funnel blocks (proposal in `PROPUESTA_MOTOR.md` in that folder). **Updated (17-09-2026, D43–D45):** T01 is generated from JSON (`build_registro.ps1`) and is the single data entry point of the dashboard; the engine moves to version 8 and the funnel now reaches the dashboard (stages per phase in `config_panel.json` and status history from the T01 events); schema 0.2 with the optional fields the dashboard needs. Legacy keys and the sphere, maturity and index blocks remain pending.
7. **Legal notice (D33):** included in every document, template, tool, dashboard, demo and SPAD. Publication prepared with `SEVEN-G/build/publicar.ps1` from the `AI_CONSULTING` repository itself with `.github/workflows/pages.yml`, with a home page at the root (D37); before publishing, create the private list of prohibited terms and run the engine source project's verification.
6. Build tool waves 2 and 3 (document 03 §6).
