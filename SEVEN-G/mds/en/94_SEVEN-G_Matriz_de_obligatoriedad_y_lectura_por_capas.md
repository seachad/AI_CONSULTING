# Obligation matrix and layered reading

**What is always mandatory, what depends on the company or the initiative, what can be grouped and what is never omitted**

| | |
|---|---|
| Document | Document 94 · Obligation matrix and layered reading |
| Version | 0.1 (working draft) |
| Date | 19-09-2026 |
| Author | Fernando García Varela |
| Status | Draft for review. Guidance document: it summarises rules from other documents, which prevail in the event of any discrepancy. The levels assigned to documents and templates will be validated through practical application. |

<!-- cifras: 3 | reading layers ; 5 | obligation levels ; 0 | gates that can be omitted ; 15 | triggers that activate modules -->

---

> **Legal notice and disclaimer.** SEVEN-G is a reference methodological framework provided "as is" and for information purposes only. It does not constitute legal, regulatory, financial or professional advice, nor does it guarantee compliance with any law or standard. References to general regulation (such as the EU AI Act, the GDPR, DORA or NIS2), to technical standards and to regulation specific to each sector or jurisdiction may be incomplete, may not apply to a particular case or may become out of date as a result of regulatory changes, interpretations or supervisory positions after their consultation date. **Each organisation that uses SEVEN-G is solely responsible for identifying the regulation that applies to it, verifying that it is current and certifying its own regulatory compliance**, with the appropriate qualified advice. This methodology is a generic, free aid shared with the community so that nobody has to start from scratch; each person or organisation can and should adapt it to its own use. It must not be inferred that its legally sensitive parts have been reviewed by legal counsel: those reviews, for each company or sector, are the ultimate responsibility of the company, consultant or organisation that uses it. Although every effort is made to keep it up to date, some regulation may have changed without being reflected here. To the fullest extent permitted by law, the author accepts no responsibility whatsoever for the effects of its application in any organisation or for its full applicability. The methodology does not grant certification of any kind. The author accepts no liability for any use made of this content or for any decisions taken on the basis of it. The data, figures, companies and cases in the examples are fictitious or illustrative.

<!-- esencial: recomendado | Guidance document so that the whole library does not have to be read. It says what is mandatory in every company, what is added only with Enterprise intensity or scope, which modules are activated by a trigger and what is guidance or reference. Underlying rule: no phase or gate is omitted; in Lite they are grouped and simplified. It creates no rules: if it differs from documents 01, 21 or 90, those prevail. -->

## 1. Purpose and scope

Not all companies have the same capacity for effort or the same risk exposure. SEVEN-G handles this with **a single library that is read in layers**, not with several versions of each document: that way there are no parallel texts that could contradict each other, and a company that grows does not have to change framework.

This document brings together in one place what other documents establish about proportionality:

- the **intensity** of each initiative, Lite or Enterprise (document 01, section 9);
- the company's **implementation scope**, Lite or Enterprise, and its minimum path (document 90, section 2);
- the **obligation of each gate criterion** and its application in Lite (document 21, section 2);
- the **scopes** that apply only to certain technologies: generative AI, agents and third parties (document 21, section 2.3).

It creates no new rules. If a row in this document differs from its source document, **the source document prevails**.

> **Why it matters.** A framework that seems to demand everything ends up being applied in full to what does not need it, or not being applied at all. Knowing what is non-negotiable and what is proportionate makes it possible to start small without lowering what protects the company.

---

## 2. How to read the matrix

### 2.1 Three reading layers

| Layer | What it contains | For whom |
|---|---|---|
| **1 · Essential** | What every company applies, whatever its size: the *Always* level items. Each document summarises it in its **"The essentials"** box, after the legal notice. | Every company, from day one. |
| **2 · Conditional** | Modules that are activated when a trigger occurs (section 4): *Enterprise* and *Conditional* levels. | The company or initiative that meets the trigger. |
| **3 · Complete** | Working guides, catalogues, examples and reference material: *Recommended* and *Reference* levels. | Whoever needs to go deeper into a topic. |

A medium-sized company with Lite initiatives works in layer 1 and enters layer 2 only where its initiatives take it. A regulated group with Enterprise scope applies layers 1 and 2 almost in full. Layer 3 is available to everyone.

### 2.2 Five obligation levels

| Level | Meaning | Vocabulary of 01 |
|---|---|---|
| **Always** | Mandatory in every company and every initiative, Lite or Enterprise. In Lite it may be simplified; not omitted. | must |
| **Enterprise** | Mandatory in full when the initiative has Enterprise intensity or the company has Enterprise scope. In Lite there is a reduced version, which is indicated. | must, under that condition |
| **Conditional** | Mandatory only when its trigger occurs. Without a trigger, it does not apply and is recorded as such. | must, under that condition |
| **Recommended** | Working guide or good practice. It may be omitted with justification. The mandatory content it develops is already covered in another document or in a template. | should |
| **Reference** | Reference material: glossary, catalogues, examples, explanations. | may |

A document's level indicates **when what it regulates has to be applied**, not that it must be read in full: its "The essentials" box says which part is the minimum.

---

## 3. What is never omitted

These twelve rules hold for any company, with any scope and in any initiative. They are what distinguishes applying SEVEN-G from using some of its templates.

| # | Rule | Source |
|---|---|---|
| 1 | **Complete inventory** of AI systems —own, third-party, corporate use and unauthorised— with an owner. | document 32; document 90, section 2.4 |
| 2 | **Every initiative is registered** before consuming budget, with its dates per phase, decisions, criteria and closing reason. | document 01, section 6.11; document 03 |
| 3 | **Intensity is determined for each initiative** in phase 0 and reviewed at G3 and at each R6. One Enterprise criterion is enough. | document 01, section 9 |
| 4 | **No phase or gate is skipped.** In Lite they may be grouped into one session; each gate keeps its criteria and its record. | document 21, section 3.4 |
| 5 | **G3 is always decided separately**: it is the main stop gate. | document 01, section 6.1; document 90, section 2.4 |
| 6 | **Segregation of duties**: whoever builds neither verifies nor decides their own work, and risk clearance is independent of the team. | document 01, section 8; document 30 |
| 7 | **Dual validation and evidence prior to the decision**: without verified evidence there is no decision. | document 21, sections 3 and 4 |
| 8 | **The "Yes ◆" criteria** (security, legal compliance, human oversight) are never accepted as a condition. | document 21, section 2.2 |
| 9 | **Value hypothesis with baseline and stop criteria** before investing in feasibility, and measurement rules in all figures. | document 01, section 6; document 40 |
| 10 | **Regulatory classification and risk register** before design; a Critical residual risk without board approval blocks G3 and G5. | document 32; document 33 |
| 11 | **Tested rollback plan and current continuity review** for everything in production. | document 52 |
| 12 | **The board approves the direction and the risk appetite (C2)**, receives AI information at least quarterly and approves Transform bets. | document 01, section 5; document 13 |

---

## 4. Triggers

A trigger is a verifiable circumstance of the company or the initiative that activates a module. The first eight are the Enterprise criteria of 01 §9.2: any of them gives the initiative Enterprise intensity.

| # | Trigger | What it activates |
|---|---|---|
| 1 | **High-risk** system under the applicable regulation | Enterprise intensity · document 34 · impact assessments (P11, P47, P48) · data requirements of document 51 |
| 2 | **Decisions about people** | Enterprise intensity · document 50 · enhanced human oversight (P17) · P46 when the law requires information |
| 3 | **Direct exposure** to customers or external people | Enterprise intensity · transparency notices (P49) · adversarial testing (P53) |
| 4 | **Agents with autonomy A2 or A3** with an effect on third parties, money, personal data or production | Enterprise intensity · document 35 · LV-AG checklist · full P18 · P54 |
| 5 | **Specially protected data** | Enterprise intensity · P47 · document 51 |
| 6 | **Critical function** or one subject to operational resilience | Enterprise intensity · document 34 (DORA, NIS2) · enhanced continuity in document 52 |
| 7 | **Transform** ambition level | Enterprise intensity · board approval at G2 and, if scaled, at G7 |
| 8 | **Investment above the threshold** approved in C2 | Enterprise intensity |
| 9 | **Generative AI** (criteria tagged GEN) | GEN criteria of document 21 · document 35 · consumption budget (P63) |
| 10 | **Agents with autonomy A1** (criteria tagged AG) | AG criteria of document 21 · minimum controls per autonomy level of document 35 |
| 11 | An **AI supplier** is involved (criteria tagged TER), including AI embedded in contracted software | document 36 · P14 · P55, P56 and P57 depending on level N1 to N3 |
| 12 | **Personal data** is processed | document 34 (GDPR) · P47 when the processing requires it · document 51 |
| 13 | The initiative **changes people's work** or releases capacity | document 50 · full document 23 · P46 |
| 14 | The solution is built with **AI-generated code** | document 53 · P66 |
| 15 | The company meets an **Enterprise scope** criterion (90 §2.2) | AI Committee with its own session · auditor at every Enterprise gate · full document 38 · P42 · independent maturity assessment every two years |

An isolated Transform bet makes that initiative Enterprise, but **does not change the company's scope** (document 90, section 2.2).

---

## 5. Phases and gates: what can be grouped and what cannot

| Phase and gate | Can it be omitted? | In Lite intensity | In Enterprise intensity |
|---|---|---|---|
| **0 · Context and constraints → G0** | No | G0, G1 and G2 may be resolved in **a single session**; each gate keeps its list of criteria and its section in P29. Templates without the *(Enterprise)* fields. The AI Office verifies and the sponsor decides. | Each gate separately, full templates, AI Auditor at all of them, the AI Committee decides. In Transform, the board approves at G2. |
| **1 · Opportunity discovery → G1** | No | ↑ | ↑ |
| **2 · Value hypothesis → G2** | No | ↑ | ↑ |
| **3 · Feasibility and risk → G3** | No. **Always separately** | The sponsor decides with risk clearance. | The AI Committee decides with verification by the auditor. |
| **4 · Solution design → G4** | No | G4 and G5 may be resolved in **a single session**, with risk clearance at both. | Separately. |
| **5 · Delivery and validation → G5** | No | Go-live with risk clearance. | Multi-level sign-off with veto power. |
| **6 · Operation → R6** | No | **Six-monthly** continuity review. | **Quarterly** review. |
| **7 · Evolution or retirement → G7** | No. It is convened when scaling or retirement is proposed, or when R6 brings it forward | The sponsor decides. | The AI Committee decides; the board, if a Transform bet is scaled. |

**Three situations that look like skips and are not:**

- **Systems that were already in production** before the framework was implemented. They do not go back through the phases: they are placed in the phase supported by their real evidence and go through a review equivalent to G7, with documentation identified as regularisation (document 14, section 11; document 90, section 5).
- **Corporate use of general-purpose AI tools.** This is not an initiative with phases: it is governed through the acceptable use policy, the catalogue of authorised tools and the inventory (document 31, section 5).
- **An opportunity that arrives already well defined.** Phases 1 and 2 may be brief, but their evidence —alternatives without AI, falsifiable hypothesis, baseline, stop criteria— remains what makes it possible to stop later on.

---

## 6. Documents

Each document shows this same level in its "The essentials" box, with the minimum part that must be applied or the trigger that activates it.

| No. | Document | Level | For whom |
|---|---|---|---|
| 00 | [What SEVEN-G is and how it helps companies](00_SEVEN-G_Que_es_y_para_que_sirve.html) | **Always** | Everyone |
| 01 | [SEVEN-G foundational methodology](01_SEVEN-G_Metodologia_fundacional.html) | **Always** | Management, AI Office, risk, audit |
| 02 | [SEVEN-G glossary and conventions](02_SEVEN-G_Glosario_y_convenciones.html) | **Reference** | Everyone |
| 03 | [SEVEN-G tools and initiative register](03_SEVEN-G_Herramientas_y_registro_de_iniciativas.html) | **Always** | AI Office |
| 04 | [Where SEVEN-G comes from, how it differs and why it is open](04_SEVEN-G_Origenes_diferencias_y_por_que_es_abierto.html) | **Reference** | Everyone |
| 10 | [Sphere map and ambition levels](10_SEVEN-G_Mapa_de_esferas_y_niveles_de_ambicion.html) | **Always** | Management, AI Office, business |
| 11 | [Maturity model](11_SEVEN-G_Modelo_de_madurez.html) | **Always** | AI Office, audit |
| 12 | [Transformation index](12_SEVEN-G_Indice_de_transformacion.html) | **Always** | Board, management, AI Office |
| 13 | [AI thesis, ambition and risk appetite](13_SEVEN-G_Tesis_de_IA_ambicion_y_apetito_de_riesgo.html) | **Always** | Board, senior management |
| 14 | [Portfolio management](14_SEVEN-G_Gestion_de_cartera.html) | **Always** | AI Committee, AI Office |
| 20 | [Phase manuals](20_SEVEN-G_Manuales_de_fase.html) | **Recommended** | Initiative teams |
| 21 | [Gate and audit criteria](21_SEVEN-G_Criterios_de_gate_y_auditoria.html) | **Always** | AI Office, verifiers, decision-makers |
| 22 | [Checklists by gate](22_SEVEN-G_Listas_de_verificacion_por_gate.html) | **Recommended** | Verifiers, initiative teams |
| 23 | [Adoption and change in the initiative](23_SEVEN-G_Adopcion_y_cambio.html) | **Recommended** | Product owners, people function |
| 30 | [Governance model](30_SEVEN-G_Modelo_de_gobierno.html) | **Always** | Management, board secretariat, AI Office |
| 31 | [Corporate AI policy and acceptable use policy](31_SEVEN-G_Politica_corporativa_y_uso_aceptable.html) | **Always** | Management, compliance, people function |
| 32 | [AI system inventory and regulatory classification](32_SEVEN-G_Inventario_y_clasificacion_regulatoria.html) | **Always** | AI Office, risk, compliance |
| 33 | [AI risk methodology](33_SEVEN-G_Metodologia_de_riesgos_de_IA.html) | **Always** | Risk owners |
| 34 | [Regulatory mapping](34_SEVEN-G_Mapeo_regulatorio.html) | **Conditional** | Compliance, legal counsel |
| 35 | [AI and agent security](35_SEVEN-G_Seguridad_de_IA_y_agentes.html) | **Conditional** | Security, technical owners |
| 36 | [AI third parties and suppliers](36_SEVEN-G_Terceros_y_proveedores_de_IA.html) | **Conditional** | Procurement, risk, legal counsel |
| 37 | [Nonconformities, AI incidents and remediation](37_SEVEN-G_No_conformidades_e_incidentes.html) | **Always** | Risk, compliance, operations |
| 38 | [AI audit framework](38_SEVEN-G_Marco_de_auditoria_de_IA.html) | **Enterprise** | Internal audit, AI auditors |
| 40 | [Value measurement rules](40_SEVEN-G_Reglas_de_medicion_del_valor.html) | **Always** | Management control, AI Office, business |
| 41 | [Indicator catalogue](41_SEVEN-G_Catalogo_de_indicadores.html) | **Reference** | AI Office, management control |
| 42 | [AI costs and allocation per use case](42_SEVEN-G_Costes_de_IA.html) | **Recommended** | Management control, technology |
| 43 | [Benefits realisation](43_SEVEN-G_Realizacion_de_beneficios.html) | **Recommended** | Benefit owners, management control |
| 50 | [People and organisation](50_SEVEN-G_Personas_y_organizacion.html) | **Conditional** | People function, labour relations |
| 51 | [Data and knowledge for AI](51_SEVEN-G_Datos_y_conocimiento.html) | **Conditional** | Data, data protection |
| 52 | [AI operations manual](52_SEVEN-G_Manual_de_operacion_de_IA.html) | **Always** | Operations owners |
| 53 | [Building solutions with AI](53_SEVEN-G_Construccion_de_soluciones_con_IA.html) | **Conditional** | Technical owners |
| 54 | [How a company organises itself for AI](54_SEVEN-G_Organizacion_de_la_compania_para_la_IA.html) | **Reference** | Board, senior management, AI Office |
| 60 | [Board pack](60_SEVEN-G_Paquete_para_el_consejo.html) | **Always** | Board secretariat, AI Office |
| 61 | [Board conversation guide](61_SEVEN-G_Guia_de_conversacion_con_el_consejo.html) | **Recommended** | Directors, management |
| 62 | [Recommendations and decisions register](62_SEVEN-G_Registro_de_recomendaciones_y_decisiones.html) | **Always** | Board secretariat, AI Office |
| 90 | [SEVEN-G implementation guide](90_SEVEN-G_Guia_de_implantacion.html) | **Always** | Sponsor, implementation lead |
| 91 | [Guide for consultants and support models](91_SEVEN-G_Guia_para_consultores.html) | **Conditional** | Consultants, procurement |
| 92 | [Application cases](92_SEVEN-G_Casos_de_aplicacion.html) | **Reference** | Everyone |
| 93 | [Licence, use by third parties and citation](93_SEVEN-G_Licencia_uso_y_citacion.html) | **Conditional** | Legal counsel, consultants |
| 94 | [Obligation matrix and layered reading](94_SEVEN-G_Matriz_de_obligatoriedad_y_lectura_por_capas.html) | **Recommended** | Everyone |
| 95 | [Where your data is and how to install SEVEN-G on your own server](95_SEVEN-G_Datos_en_local_e_instalacion_propia.html) | **Conditional** | AI Office, IT and security, consultants and partners |

The fact that a document is *Always* does not mean it must be read in full: nineteen documents have that level, but the initial reading for a company with Lite scope comes down to documents 00 and 01, the implementation guide, the adaptation of the governance model to small organisations and the Lite column of the gate criteria (document 90, section 2.4). The rest is opened when its moment in the cycle arrives.

---

## 7. Templates

### 7.1 Lifecycle evidence (P01–P31)

**No mandatory evidence is omitted in Lite: it is simplified.** Each template marks with *(Enterprise)* the fields that a Lite initiative may leave blank.

| Templates | Level | Note |
|---|---|---|
| P01, P02, P03, P04, P05 (phase 0) | **Always** | P04 is reviewed at G3 and at each R6. |
| P06, P07 (phase 1) · P08, P09 (phase 2) | **Always** | — |
| P10, P11, P12, P13 (phase 3) | **Always** | In P11 the classification is always mandatory; impact assessments, only when the classification requires them. |
| P14 (phase 3) | **Conditional** | Trigger 11: an AI supplier is involved. |
| P15, P16, P17, P18, P19, P20 (phase 4) | **Always** | In P18, the agents block applies only with triggers 4 or 10. |
| P21, P22, P23 (phase 5) | **Always** | In P23, multi-level sign-off with veto is Enterprise; in Lite, risk clearance. |
| P24, P25, P26, P27, P28 (phase 6) | **Always** | From entry into production. |
| P29 (all gates) · P31 (use case sheet) | **Always** | — |
| P30 (phase 7) | **Always** | When G7 is convened. |

### 7.2 Company, board, compliance, third parties, audit and implementation (P32–P74)

| Templates | Level | Trigger or note |
|---|---|---|
| P32, P33, P34, P35, P36, P37 (implementation and corporate cycle) | **Always** | P37 at each annual review. |
| P38 (rules of procedure or mandate of the bodies) | **Always** | In Lite scope, extended mandate of the existing bodies. |
| P39 (agenda and minutes) · P44 (usage survey) · P68 (board session notes) | **Recommended** | The company may use its own formats. |
| P40 (exceptions) | **Conditional** | When an exception is requested. |
| P41 (independence and conflicts of interest) | **Conditional** | Verifiers and auditors of Enterprise initiatives, and external support. |
| P42 (quarterly second-line report) | **Enterprise** | Trigger 15. In Lite scope, its content goes into the AI item of the management committee. |
| P43 (authorised tools) · P45 (literacy and training) | **Always** | — |
| P46 (information to workers) | **Conditional** | Triggers 2 or 13, when the law requires information or consultation. |
| P47 (DPIA) · P48 (fundamental rights) · P49 (transparency) | **Conditional** | Triggers 1, 3, 5 or 12, as required by the regulation. |
| P50 (nonconformity register) | **Always** | — |
| P51 (notifications) · P52 (root cause) | **Conditional** | Notifiable incident; major or critical nonconformity, or S1 or S2 incident. |
| P53 (adversarial testing) · P54 (non-human identities) | **Conditional** | Triggers 3, 4, 9 or 10. |
| P55, P56, P57 (suppliers) | **Conditional** | Trigger 11, with the detail required by level N1 to N3. |
| P58, P59 (audit plan and working papers) | **Enterprise** | Trigger 15. |
| P60 (audit report) | **Always** | In Lite scope, report of the six-monthly sample review. |
| P61 (declaration of application) | **Conditional** | When the company declares that it applies SEVEN-G. |
| P62 (benefits realisation plan) · P65 (R6 pack) | **Always** | P62 from G3; P65 from entry into production. |
| P63 (consumption budget) · P64 (datasets and sources) · P66 (SPAD annexes) | **Conditional** | Trigger 9 · own data or knowledge · trigger 14. |
| P67 (quarterly board pack) · P69 (register of board decisions) | **Always** | Aggregated in Lite scope. |
| P70, P71 (consultancy) | **Conditional** | External support. |
| P72 (AI security profile) · P73 (AI governance profile) · P74 (ISO/IEC 42001 statement of applicability) | **Conditional** | Only if the company uses the NIST CSF or the NIST AI RMF, or aims for ISO/IEC 42001 (34 §4–§5). |

---

## 8. Tools

No tool is mandatory as an application: what is mandatory is the register or the calculation it contains. A company may keep it in a spreadsheet with the data model of document 03.

| Tool | Level of what it contains | Note |
|---|---|---|
| T01 · Initiative register (with T02 inventory, T03 gates, T04 intensity, T05 ambition, T06 risks and T18 board) | **Always** | It is the central piece: the other tools read its data. |
| T14 · Transformation index · T15 · Maturity diagnosis | **Always** | At C1 and at each C5. |
| T17 · Board dashboard | **Always** | Aggregated in Lite scope; per initiative for Enterprise ones. |
| T11 · Value calculator (with T13 costs) | **Recommended** | The formulas of document 40 are mandatory; the calculator is an aid. |
| Rest of the catalogue | According to its procedure | They are applied with the template or document indicated in the catalogue of document 03. |

---

## 9. Where to start, by profile

| Profile | Minimum reading | Afterwards |
|---|---|---|
| **Board director** | document 00 (sections 1 to 6) · document 61 | document 12 · document 60 · example board dashboard (T17) |
| **Senior management and AI Committee** | document 00 · document 01 · document 90 (section 2) · this document | document 13 · document 14 · document 40 |
| **AI lead or AI Office** | All of the above · document 03 · document 21 · document 30 (section 11 in Lite) | The *Always* level documents as the 90-day plan progresses |
| **Risk, compliance and audit** | document 01 (sections 7 to 12) · document 21 · document 32 · document 33 · document 37 | document 34 · document 35 · document 36 · document 38, depending on the triggers |
| **Initiative team** | document 01 (section 6) · the relevant phase of document 20 · the templates of that phase | document 22 · document 40 |
| **Consultant** | document 00 · document 01 · document 04 · document 91 · document 93 | document 90 · document 92 |

The [SEVEN-G course](curso/M00_SEVEN-G_Curso_Guia_del_curso.html) follows these same paths with short modules, exercises on the example data and self-check questions.

---

## 10. Associated tools and templates

| Code | Name | Relationship |
|---|---|---|
| P04 | Intensity determination | Records which Enterprise criteria each initiative meets. |
| T04 | Intensity determination (T01 module) | Applies the criteria of 01 §9.2 when the initiative is registered. |
| T03 | *Gate* manager (T01 module) | Shows, for each gate, the criteria that apply according to the initiative's intensity and tags. |
| P32 | Implementation mandate | Sets the company's implementation scope. |

---

## 11. Related documents

| Document | Relationship |
|---|---|
| **01 · Foundational methodology** | Normative vocabulary (section 1.4), gates (section 7) and Lite and Enterprise intensity (section 9). |
| **21 · Gate and audit criteria** | Obligation of each criterion, Lite and Enterprise column, scope tags and grouped gates. |
| **30 · Governance model** | Adaptation to small organisations (section 11). |
| **41 · Indicator catalogue** | Minimum set of indicators for Lite (section 19). |
| **52 · AI operations manual** | Lite and Enterprise operation (section 14). |
| **90 · Implementation guide** | Implementation scope, selection criteria and minimum path in Lite scope (section 2). |
| **[SEVEN-G course](curso/M00_SEVEN-G_Curso_Guia_del_curso.html)** | Learning paths by profile. |

---

## 12. Version control

| Version | Date | Changes |
|---|---|---|
| 0.1 | 19-09-2026 | First version. Three reading layers, five obligation levels, twelve rules that are never omitted, fifteen triggers, what can be grouped in phases and gates, level of each document, template and tool, and minimum reading by profile. |
