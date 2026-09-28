# T23 · Implementation journey

Applies **document 96** (Starting points and implementation journey): a **twelve-question questionnaire** (Q01 to Q12) assigns the company's **starting point** —main archetype PP-A to PP-F with the rule of 96 §2.2, **traits** and **modifiers** MP1 to MP5— and explains why; it then shows the **journey** of the **22 milestones** HI-01 to HI-22 across the five stages E1 to E5, ordered by their priority for that starting point, with who, evidence, the document 11 question that substantiates them and base month (Lite or Enterprise), the **status** of each milestone, the **view by role** of 96 §5 and a **printable plan** with CSV export.

**Why it matters.** Companies do not start from the same place: one with no AI that starts by setting up every body ends up in bureaucracy without cases, and one with agents in production that starts with the case sheet leaves what already acts uncontrolled. The tool always applies the same rule of document 96 to decide **what is done first**, without lowering what is required at the end (01 §14), and links each milestone to the document 11 question that substantiates it: progressing along the journey is raising maturity with evidence.

## How to use it

1. Open `recorrido.html` in the browser (no server or installation needed). It starts with the example of the fictitious company of the T01 register, which results in **PP-F · At scale** with traits PP-E, PP-D and PP-B and modifiers MP2, MP3 and MP4. In "Data" you can load the **PP-B example** (services company of 96 §6.3), go back to the PP-F example or start blank.
2. **Starting point**: answer the twelve questions. Q01 accepts several answers; if you tick generative AI, say whether there is one or more than one system in production (the PP-E condition of 96 §2.2 needs it). The "Why this result" table walks through the rule in its order (PP-F, PP-E, PP-D, PP-C, PP-B, PP-A) with the answers used; the modifiers table says which answer activates each one (Q07 → MP1, Q08 yes or not known → MP2, Q09 → MP3, Q05 partial or formal → MP4, Q10 no → MP5).
3. **Journey**: the milestones of each stage ordered by priority (1, 2, C, D, 3, ·). The priority of a milestone is the most urgent among the main archetype and its traits (96 §4.3, rule 5) and is adjusted with 96 §4.2: MP1 or MP2 move HI-05 and HI-10 to 1; MP2 moves HI-19 to 1; with MP4, milestones covered by existing governance (by default HI-08 and HI-20; any can be marked) move to C; Q04 "yes" or "not known" moves HI-02 and HI-03 to 1 (96 §2.4). With MP5 the journey is blocked until HI-01 is met (a precondition, not one more milestone). Each milestone explains where its priority comes from.
4. **Status of each milestone**: pending, in progress, met or mapped and validated (C). If there is a T15 assessment in this browser with a **verified** (or independent) assessment, a milestone whose document 11 questions are all "Yes" in the latest one appears **"met according to T15"** (96 §4.3, rule 4). A status set by hand is **never overwritten** (D100, D102): it is shown next to what T15 says and can be removed to go back to the automatic one. A self-assessment is shown but does not mark milestones.
5. **With the T01 register** (D100): served from the site, T23 finds the register that T01 has saved and offers **"Propose answers from the T01 register"** for Q01 to Q03: types of system of the initiatives in use (phase 6 or 7, not stopped or retired) from `clasificacion.tecnologia` and `clasificacion.autonomia`, and pilots under way (phases 1 to 5) and how many are generative AI. Proposed answers are marked "from T01" and can be edited; a manual answer is not replaced.
6. **By role** and **Plan**: the table of 96 §5 with the priority and status of each milestone; the plan for the AI Committee and management is printed or saved as PDF from the browser. "Export the journey (CSV)" (separator ";", UTF-8).
7. **Data**: export and import the T23 JSON (answers, statuses, notes and the calculated result).

Data is saved only in the browser used (local storage, key `seveng-t23-datos-v1`). Nothing is sent to third parties. The **"Data: …"** button in the bar says where it is (sample, this browser, a file on your computer or the company server) and opens the "Where my data is" dialog (document 03 §2.1): automatic saving to a **JSON file on your computer** (Edge or Chrome; the same one that "Export" downloads) or, in a copy of the site served over http in the company, the file `herramientas/datos/T23_recorrido.json`, which replaces the sample data.

## Help for each view

Each view has a **“?”** button next to its title that explains, in the active language (Spanish or English), what the view shows, how to read it, what each column or figure means, why it matters and where it is explained in SEVEN-G. Each table header and headline figure also carries its explanation as a tooltip. The texts are in `_fuentes/ayuda.json`, embedded by `build_recorrido.ps1` with the common module `_comun/ayuda.js` (D123): a new column needs its explanation there in both languages.

## Mapping from T01 to Q01

| `clasificacion.tecnologia` of an initiative in use | Q01 answer |
|---|---|
| `reglas` | rules or RPA |
| `ia_terceros_embebida` | third-party AI included in products or assistants |
| `ml_predictivo`, `vision`, `optimizacion`, `lenguaje_documentos` | predictive ML, vision or optimisation |
| `ia_generativa`, or `agente` with autonomy A0 or A1 | generative AI integrated into processes |
| `agente` with autonomy A2 or A3, or any initiative in use with autonomy A2 or A3 | agents that execute actions (A2/A3) |

## Files

| File | What it is |
|---|---|
| `recorrido.html` | The tool. **Generated**: never edited by hand. |
| `_fuentes/recorrido.plantilla.html` | Application (HTML, CSS and JavaScript) without data. The only file that is edited. |
| `recorrido.json` | Archetypes, assignment rule, modifiers, questionnaire, stages, milestones with their priority by archetype and roles (ES/EN) extracted from document 96. **Not edited by hand.** |
| `datos_demo.json` | PP-F example (fictitious company of the T01 register). |
| `ejemplo_pp_b.json` | Second example, PP-B (fictitious services company). |
| `build_recorrido.ps1` | Generates `recorrido.html`: `pwsh -File SEVEN-G/herramientas/T23_recorrido_implantacion/build_recorrido.ps1` (with `-Datos <file>` it starts with another T23 JSON; with `-Salida <file>` it writes to another path; with `-ActualizarRecorrido` it extracts `recorrido.json` again from document 96). |

On every build the script checks that `recorrido.json` matches document 96 in Spanish and English (if the document changes, the build fails until it is regenerated with `-ActualizarRecorrido`), that the structure is that of the document (6 archetypes, rule in the order PP-F…PP-A, 5 modifiers, 12 questions with the expected number of answers, 5 stages, 22 milestones with priorities 1, 2, 3, C, D or ·), that every document 11 question cited exists in the T15 questionnaire and that the example data uses valid questions, answers, milestones and statuses.

For the smoke test: `#arquetipo` carries `data-arquetipo` (in the example, `PP-F`), `data-rasgos`, `data-modificadores` and `data-bloqueo`; each questionnaire row is `tr[data-pregunta="Q01"]`…; each journey milestone, `tr[data-hito="HI-09"]` with `data-prioridad`, `data-estado` and `data-fuente`; and `window.T23.resultado()` returns the archetype, traits, modifiers, number of questions and milestones, the block and the priority and status of each milestone.

## Pending

- Validate with the author the assignment thresholds and the priorities by archetype (96 §4.2, "to be validated").
- The tool writes nothing to T01 or T15.

---

Code MIT · Content CC BY 4.0 · © 2026 Fernando García Varela · SEVEN-G methodology. The tool is provided "as is", is not advice and each organisation is responsible for its data and decisions (full legal notice in the tool itself).
