# T01 · Initiative register

## Legal notice and disclaimer

SEVEN-G and this tool are provided “as is” and for information purposes only. They do not constitute legal, regulatory, financial or professional advice, nor do they guarantee compliance with any regulation. The criteria, classifications and references to general regulation (EU AI Act, GDPR, DORA, NIS2…) or sector-specific regulation may be incomplete, may not apply to a specific case or may become outdated as a result of regulatory changes. Each organisation that uses the tool is solely responsible for identifying the regulation that applies to it, verifying that it is current and certifying its own regulatory compliance, with the appropriate qualified advice. The author and SEACHAD accept no liability whatsoever for the use of the tool or for decisions taken with it. The demo data is fictitious.

In the interface, this notice appears in the footer of every view, is shown prominently on first load (dismissing it is remembered in the browser) and is always available from the “Legal notice” link in the header and footer. Next to the regulatory classification (record, registration and edit, T02 inventory and T04 intensity determination) the interface states that it is indicative and must be carried out by the organisation with qualified legal judgement.

**SEVEN-G** reference tool (wave 1 · core) for managing the AI portfolio as a funnel: phases, statuses, dated events, decision gate criteria, conditions, value and metrics. It includes, as modules, **T02** (AI system inventory), **T03** (gate manager), **T04** (intensity determination) and **T05** (ambition classifier).

Specification: document 03 (§3 and §4), document 01 (§6–§9), document 00 (§5.2 and §6) and document 21 (gate criteria).

## Files

| File | Content |
|---|---|
| `registro.html` | Complete single-file application (HTML, CSS and JavaScript, no dependencies). It embeds the catalogue of 128 criteria from document 21 and the demo data. |
| `esquema_registro.schema.json` | JSON Schema 2020-12 of the common data model (03 §4), with closed lists and code patterns. |
| `datos_demo.json` | The same demo data embedded in the application, valid against the schema. |
| `README.md` · `README_en.md` | This document, in Spanish and English. |

## How to open it

1. Double-click `registro.html`. It works from disk (`file://`), without a server, installation or connection.
2. The first time, the demo data is loaded. From then on, every change is saved automatically in the browser’s local storage (`localStorage`), tied to that browser and that file path.
3. Language (ES/EN) and theme (auto, light or dark) are selected at the top right. The preference is remembered.
4. In **Data**, set the *reference date* (cut-off date for days and alerts). The demo data sets it to 16-09-2026; empty means “today”.

The application does not send data to third parties or load external resources (it uses system fonts; Google Fonts is not linked so that no browsing data is shared).

## Views (03 §3.7)

| View | What it does |
|---|---|
| **Funnel** | Portfolio indicators, funnel by phase broken down by status, stalled initiatives and expected value, and an initiative table with days in phase against the limit and alerts. Filters by sphere, ambition, intensity, regulatory classification, technology, exposure, value type, area, status, phase, supplier, free tag and text. |
| **Kanban board** | Cards by phase (0–7) and a closed column. Cards change column when the gate decision is recorded. |
| **Record** | Tabs: summary (identification, owners with incompatibilities, classification, lifecycle, value, risk and compliance), current gate (T03), conditions, value (validated, declared or estimated), event timeline and gate history with criteria. |
| **Pending gates** | Requests awaiting verification or decision, with working days against the limit, blocking criteria and unverified evidence; upcoming or overdue continuity reviews. |
| **Alerts** | Stalled, decision overdue, expired conditions, overdue continuity reviews, evidence pending verification, third iteration (escalation), resumption overdue, incompatible roles and overdue nonconformities. |
| **Analysis** | Metrics from 03 §3.5, segmentable with the filters (see below). |
| **Inventory (T02)** | In-house, third-party and corporate-use systems, with classification, intensity, autonomy, suppliers, owner and review; consistency warnings against the register. |
| **Data** | Import and export, preferences, reference time limits (C2/C5), people and suppliers. |

## Rules enforced by the tool

**Events.** Every change (registration, phase entry and exit, request, verification, decision, escalation, conditions, hold and resumption, classification changes, field edits, value, evidence, retirement) generates an event with the date of the fact, author, a mandatory reason and, where relevant, field, previous value and new value. Events cannot be edited or deleted from the interface.

**Gate manager (T03).**
- Embedded catalogue of criteria G0.01–G7.12 and R6.01–R6.16 from document 21, in Spanish and English (criterion text and ambition note from the Spanish and English versions of the document, with the same codes), with obligation (Yes, Yes ◆, Conditionable; “Rec.” in the intensity column is treated as recommended), Lite/Enterprise applicability and ambition note.
- Automatic, justified *Not applicable* by intensity, [GEN], [AG] and [TER] tags, Transform-only criteria and outcome criteria (Scale, Iterate, Retire) according to the proposed outcome. A manual *Not applicable* without justification is treated as *Not met*.
- Degree of compliance (met ÷ applicable), blocking criteria, open conditionable criteria and omitted recommended criteria.
- Prevents **Proceed** (and Continue operation or Scale) with mandatory criteria *Not met* or *Pending*, or with open conditionable criteria; **Proceed with conditions** only on open conditionable criteria and without blocking criteria; no outcome without conformant verification; only **Stop** with a prohibited practice (G3.08); no proceeding with expired conditions; at G5 Enterprise, proceeding requires all four sign-offs conformant and no veto.
- Segregation of duties: the verifier cannot be the sponsor, a team member (product, technical, operations) or an evidence author; the decision-maker cannot be a team member, the verifier or an evidence author; at Lite G3–G5, risk clearance must come from someone outside the team.
- From the third decision at the same gate, escalation must be marked and the higher body or the board chosen; for Transform, G2 (proceed) and G7 (scale) require a board decision.
- Conditions with description, owner, deadline after the decision and verification method; alert on expiry; they can be marked met, cancelled or expired.
- Outcomes by gate (21 §5.3): G0 and G4–G5 without Pivot; G1–G3 with Pivot (return to phase 2); **R6**: Continue operation · Proceed with conditions · Bring G7 forward (deviation checkbox that forces bringing it forward); **G7**: Scale (returns to phase 6 and opens registration of the new extended-scope initiative) · Iterate (return phase, 6 by default) · Retire (coded reason, plan executed or pending recording).
- Who verifies and who decides according to 01 §7.5 (at Lite, G3–G5: sponsor with risk clearance).

**T04 · Intensity.** Eight criteria from 01 §9.2 with Yes/No/No data; one is enough for Enterprise. If there is no yes but some criteria have no data, the outcome is flagged as provisional Lite.

**T05 · Ambition.** Five questions from 00 §5.2: 1 or 4 → Transform; 2 or 3 → Augment; 1–4 negative → Optimise. Depending on the moment it updates proposed (phase 1), confirmed (phase 2) or actual (phase 7) ambition. Transform forces Enterprise intensity.

**Hold.** Requires a cause (budget, dependency, supplier, data or other) and a planned resumption date; time on hold does not count towards time in phase.

**“No data” is not zero.** Empty amounts are stored as `null`, shown as “No data”, never summed and counted separately. Annual net value is efficiencies + return − recurring cost and is only calculated when at least one benefit and the recurring cost have an amount; released capacity, avoided risk and compliance are not added.

## Analysis metrics (03 §3.5)

| Metric | Calculation |
|---|---|
| Time in phase | Intervals between `entrada_fase` and `salida_fase` events, minus days between `espera_inicio` and `espera_fin`. Median and 80th percentile (linear interpolation) of closed intervals; intervals in progress are reported. |
| Decision time | Working days (Monday to Friday, no holidays) between `fecha_solicitud` and `fecha_decision`, by gate. |
| Time to production | Calendar days registration → first G3 decision that proceeds → first entry into phase 6. |
| Conversion by gate | Distribution of outcomes; “proceed” = Proceed, Proceed with conditions, Continue operation and Scale. |
| Iterations by gate | Average and maximum prior iterations in final decisions (outcome other than Iterate). |
| Compliance | Average degree by gate of decisions taken and the criteria that block most often. |
| Stalled | Days in phase excluding hold above the reference limit for the phase and intensity (phase 6 has no limit). |
| Time on hold and stop/retirement reasons | Episodes and days by cause; distribution of coded reasons. |
| Ambition mix and value by phase | Active initiatives by phase according to confirmed (or proposed) ambition, and the sum of their expected value with a separate count of those without data. |
| Weighted value | For phases 0–5: expected value × historical probability of reaching production (register initiatives that went through the phase and reached production ÷ resolved ones, in production or closed). Only shown with at least `historial_minimo_ponderado` resolved initiatives (5 by default); value in phases without history is reported as excluded. |
| Cohorts | By registration quarter: registered, pass G3, reach production, closed without production and median time to production. |

## Import and export

- **Export full JSON**: the whole register in the `esquema_registro.schema.json` format. It is the backup and the way to share data. It includes the root field `aviso_legal` with the legal notice in the interface language.
- **Export initiatives CSV**: one row per initiative with classification, lifecycle, owners, value, conditions, closure and alerts. Semicolon separator, UTF-8 with BOM; lists separated by `|`; empty cell = no data; closed-list codes are exported untranslated. **It does not include the legal notice**: CSV has no comment lines, and an extra first line would break the header when the file is opened in a spreadsheet or imported; whoever distributes the CSV must accompany it with the notice.
- **Export JSON for the board dashboard**: structure of `AI_en_el_consejo/motor/ESQUEMA.md` (see mapping). As the dashboard schema has no root field for the notice, it goes in `meta.textos.aviso_previo` (shown by the dashboard in its opening notice) and also in `seveng_t01.aviso_legal`; always in Spanish, like the rest of the dashboard.
- **Import JSON**: file picker; the file is validated (structure, code patterns, closed lists, dates, references and outcomes allowed by gate) and, if there are no errors, confirmation is requested and the current data is replaced. Records are not merged.
- **Restore demo** and **delete local data** ask for confirmation.

## Data model

A single JSON object with `version_esquema` (`0.1`), `aviso_legal` (text, optional on import), `meta` (organisation, reference date, currency, time-limit configuration) and one list per entity from 03 §4. `null` means “no data”. Dates `YYYY-MM-DD`. Field names and closed-list codes are in Spanish, as in the rest of the SEVEN-G library.

| List | Entity | Code |
|---|---|---|
| `iniciativas` | Initiative: identification, owners, classification (controlled taxonomy), T04, T05, lifecycle (phase, status, entry, iteration, hold, next review), closure, residual risk, impact assessments, investment, free tags, systems | `IA-AAAA-NNN` |
| `sistemas` | AI system (T02) | `SIA-AAAA-NNN` |
| `eventos` | Event with date, author, reason and change | `EVT-NNNNNN` |
| `decisiones_gate` | Request, verification, decision, body, escalation, proposed outcome and outcome, G5 sign-offs, evaluated criteria (`codigo`, `estado`, `justificacion`, `evidencias`) | `DG-AAAA-NNN` |
| `condiciones` | Condition with decision, criterion, owner, deadline, verification and status | `CND-AAAA-NNN` |
| `evidencias` | Link, template, version, author, date and verification (linked, not copied) | `EVI-AAAA-NNNN` |
| `valores` | Expected or realised amount by type, formula, status (validated, declared, estimated), period and source | `VAL-NNNN` |
| `riesgos` · `no_conformidades` · `incidentes` · `proveedores` · `recomendaciones` | Related entities (in this version they are displayed and exported; full management belongs to T06, T08, T09 and T18) | `IA-AAAA-NNN · Rnn` · `NC-AAAA-NNN` · `INC-AAAA-NNN` · `PRV-NNN` · `REC-AAAA-NNN` |
| `personas` | People assignable to roles, verification, decision and conditions | `PER-NN` |

Closed lists (values in the schema): sphere `01`–`09`; ambition `optimizar · aumentar · transformar`; intensity `lite · enterprise`; regulatory classification `prohibido · alto_riesgo · transparencia · riesgo_minimo · fuera_ambito · pendiente`; technology `ml_predictivo · ia_generativa · agente · lenguaje_documentos · vision · optimizacion · ia_terceros_embebida · reglas`; exposure `interna · empleados · clientes_indirecta · clientes_directa`; value type `eficiencia · retorno · riesgo_evitado · cumplimiento`; stop or retirement reason (10 codes); statuses (8); outcomes (9); criterion statuses (4); event types (18); autonomy `A0`–`A3`.

## Mapping to the board dashboard (T17)

| Dashboard (`ESQUEMA.md`) | Source in T01 |
|---|---|
| `casos[].id`, `nombre`, `que_es`, `unidad` | `id`, `nombre`, `descripcion`, `area` |
| `casos[].estado` | Approximation: phase 6–7 → `En uso`; phase 5 → `POC`; phases 0–4 → `En desarrollo`; stopped or retired → `Desenganchado` |
| `tags.tecnologia`, `exposicion`, `riesgo`, `funcion`, `ambicion` | Technology, exposure, regulatory classification, main sphere and ambition (confirmed or proposed) labels, in Spanish |
| `detalle.aiact`, `proveedores`, `valor_tipo`, `es_ia` | Regulatory classification, supplier names, value types, technology other than “Rules” |
| `economia.inversion.construccion` / `recurrente_anual` / `recurrente_potencial` / `adicional_potencial` | `inversion` value (realised or expected) / realised `coste_recurrente` / expected `coste_recurrente` / `inversion.pendiente` |
| `economia.eficiencias[]`, `retorno[]` | `eficiencias` → concept `operativo`; `capacidad_liberada` → `capacidad_liberada`; `retorno` → `otros` (realised = `actual`, expected = `potencial`) |
| Status of each amount | `validado` and `declarado` unchanged; `estimado` → `estimado_cati` |
| `reporte_compania.propietario_negocio`, `responsable_tecnico` | Sponsor and technical owner |
| `fechas.idea`, `inicio`, `aprobacion`, `piloto`, `produccion`, `ultima_revision`, `retirada` | Registration, G0 approved, G3 approved, entry into phase 5, entry into phase 6, last R6, retirement date |
| `retirada`, `tier_riesgo`, `clasificacion_ria`, `controles.DPIA`/`FRIA` | Closure (reason, body, replacement), main residual risk, classification (`fuera_ambito` → `no_es_ia`; `pendiente` → `null`), DPIA and fundamental rights impact assessments |
| `seguimiento.movimientos[]` | `alta`, `parada`, `retirada` and `cambio_clasificacion` events |
| `seguimiento.incidentes[]` | `incidentes` (type = severity S1–S4) |

**What does not map.**
- From the dashboard, with no source in T01 (exported as `null` or empty): `descripcion` (board observations), `inicio_estimado`, `tags.naturaleza` and `prioridad`, `detalle.tipo`, `decision`, `datos` and `acciones_estimadas_cati`, `desglose_recurrente`, `plazo_potencial`, `comparte_valor_con`, `clave_reparto`, `valor_validado` (baseline, target, actual), `operacion`, `agente`, `proveedor_dora`, `controles.RIA`, `seguridad`, `MUC` and `IA_ofensiva`, `seguimiento.adopcion`, `agilidad`, `ia_ofensiva`, `cdm_compania` and `historico`.
- From T01, with no field in the dashboard: SEVEN-G phase and status, iterations, gate decisions and criteria, conditions, evidence, events other than movements, T04 and T05, time limits, stalled initiatives, alerts, historical probability and weighted value, and `riesgo_evitado` and `cumplimiento` amounts. A funnel summary is added in the `seveng_t01` block, which the current dashboard does not read.
- The dashboard’s efficiency and return concepts are finer than T01 types; the export does not break them down.

## Demo data

Fictitious company (*Compañía Ejemplo Industrial, S.A.*), 21 fictitious people and 4 fictitious suppliers, 14 initiatives registered in 2025 and 2026 across all phases (0–7) and all eight statuses: one registered, in phase, awaiting gate (one at its third iteration, escalated to the higher body), one on hold with resumption overdue, in production (one with an overdue continuity review), one awaiting G7 brought forward by R6, one **stopped** at G3 for unacceptable risk and one **retired** after G7 because it was replaced. There are stalled initiatives, two **expired conditions**, a pivot, decisions with conditions, a G5 Enterprise multi-level sign-off, validated, declared, estimated and no-data amounts, 9 systems (including one for corporate use), incidents and nonconformities. The data is illustrative: any resemblance to a real company or person is coincidental.

## Limitations

- Working days are Monday to Friday, with no holiday calendar. R6 frequency is approximated in days (182 Lite and 91 Enterprise, configurable).
- Single-user, local tool: no authentication, access control, electronic signature or time-stamping; the author of each event is declarative. `localStorage` data is not shared across browsers or devices; export the JSON.
- Import replaces the whole register (no merge) and validates the main structure, not the full JSON Schema.
- Risks (T06), nonconformities and incidents (T08), suppliers (T09), value realisation by period (T12), retirements (T22) and recommendations (T18) are displayed, raise alerts and are exported, but their full management belongs to those tools (waves 2 and 3).
- Gates grouped in Lite (G0–G2, G4–G5) are recorded as separate decisions on the same day; there is no joint session.
- Scale opens registration of the new initiative with the tag “Escalado de IA-…”, without a formal link between the two.
- Historical probability is not segmented by intensity, ambition or cohort.
- Tested in Microsoft Edge (Chromium). It should work in other current browsers supporting `<dialog>`, but has not been tested.

## Licence

Code under the **MIT** licence. Content (texts, criteria catalogue, model and demo data) under **CC BY 4.0**.

© 2026 Fernando García · SEACHAD · Metodología SEVEN-G
