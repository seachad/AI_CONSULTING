# T15 · Maturity diagnosis

Applies **document 11** (Maturity model): questionnaire of the **84 questions** of the seven dimensions D1 to D7, with an answer (Yes, Partial, No with its type, Not applicable), evidence and verification status; level by dimension with **progress**, **blocking criteria** and **criteria met in advance**; **overall level** as the weighted average rounded down and **capped at the level of D1 or D6 plus one**; checks on independent verification, on the declaration of application (§14 questions) and on the cross-reading with the transformation index; comparison between assessments and a **printable report** with the seven sections in 11 §6. Template P34 is its paper or spreadsheet equivalent.

**Why it matters.** The maturity assessment is a mandatory output of C1 and is repeated in C5. Calculating it by hand is error-prone (cumulative levels, "Partial" that does not count, D1 and D6 cap, "Not applicable" only where allowed); the tool always applies the same rule, never treats an unanswered question as met and keeps the questionnaire version, which is what makes it possible to compare C1 with C5 without dressing up the result.

## How to use it

1. Open `madurez.html` in the browser (no server or installation needed). It starts with two example verified assessments of a fictitious company: the C1 one (September 2025) and the C5 one (June 2026).
2. **Assessment**: create a new (empty) assessment or a new one based on another (it copies the answers and resets verification). Record the assessment type, point in the cycle (C1, C5 or update between cycles), cut-off date, scope, team, verifier, weights, interviews, samples, cross-reading, targets and improvement actions.
3. **Questionnaire**: answer the twelve questions of each dimension with the evidence (text or link) and the verification status. An unanswered question is **no data**: it never counts as met and is never estimated; if the only thing preventing a higher level is unanswered questions, the level of the dimension is "no data" and the minimum is shown.
4. **Report**: seven sections in 11 §6. The three messages for the board are proposed automatically if they are not written. "Print report" produces the sheet for the AI Committee and the board.
5. **Evolution** compares all assessments; the report comparison is only made with the previous verified assessment with the same questionnaire version and warns if the weights do not match.
6. **Interview guide**: reference view of 11 §4.4 to §4.6 (interviews, valid evidence, answers, sampling with a minimum sample size calculator) and of what is asked in each dimension.
7. **Data**: export and import the T15 JSON (with the calculated results) and export the answers of the selected assessment as CSV (";" separator, UTF-8).
8. **With the T01 register** (D100): the initiative register is the source of truth. Served from the site, the tools share the browser's local storage: T15 finds the register T01 has saved (it says so in the header), a freshly opened T15 with a real register takes its company, and from the assessment you can **propose a stratified sample** of initiatives from the register (Enterprise, in production, Augment or Transform, third party, generative AI or agents; 11 §4.6) and **take the profile of the latest T14 calculation** for the cross-reading. The **summary of each assessment** (overall level, average, cap by D1 or D6 and level by dimension; never the answers) is saved into the register with "Save the maturity summary into the T01 register" (list `madurez[]` of schema 0.7) or exported as a file to import in T01; the board dashboard (T17) shows it in the "Company maturity" card. `build_madurez.ps1 -Resumen <file.json>` writes that summary without opening the browser (it is what the demonstration register carries).
9. **NIST profiles** (D115): the "AI RMF profile" and "CSF profile" views read the 72 NIST AI RMF subcategories and the 48 NIST CSF 2.0 subcategories with high priority in the Cyber AI Profile (in draft) from `perfiles_nist.json`, which `build_madurez.ps1 -ActualizarPerfiles` extracts from document 34 §5.4 and §5.5 (the build fails if they do not match). The current level of each subcategory is **derived from the questionnaire** with the rule in 11 §7.5 (one assessment, two readings); "Own" subcategories accept an own level with evidence, which never exceeds its dimension; the target level is set in C2; the gap and the equivalent *tier* (a view, not a scale) are calculated; summary by function, by Secure, Defend and Thwart area and in total; CSV export. The summary goes to the T01 register in `madurez[].perfiles` (schema 0.7) and the T17 dashboard shows it in the maturity card. Paper templates: P72 and P73.

Data is stored only in the browser used (local storage). Nothing is sent to third parties. The **"Data: …"** button in the bar says where it is (sample, this browser, a file on the computer or the company's server) and opens the "Where my data is" dialog (document 03 §2.1): automatic saving to a **JSON file on the computer** (Edge or Chrome; the same one "Export" downloads) or, in a copy of the site served over http within the company, the file `herramientas/datos/T15_madurez.json`, which replaces the sample data.

## Calculation (document 11 §5)

| Step | Rule |
|---|---|
| Dimension level | The highest level N for which all questions at levels 1 to N are "Yes" or "Not applicable". "Partial" counts as not met. |
| Progress | (Yes + 0.5 × Partial) ÷ applicable questions at level N + 1, as a percentage. |
| Overall level | Weighted average to two decimal places, rounded down and capped at min (D1, D6) + 1. The result states whether the cap has been applied and because of which dimension. |
| Validity | Self-assessment: indicative. Verified or independent: valid only if the verifier has reviewed all "Yes" answers in D1 and D6, all §14 questions and at least 25% of the other "Yes" answers (11 §4.6). |
| Declaration of application | Possible only if the ten §14 questions are "Yes" in a verified assessment with complete verification (11 §7.3). |

Result of the C5 example (EM-2026-06, equal weights): D1 = 3, D2 = 4, D3 = 2, D4 = 4, D5 = 3, D6 = 1, D7 = 4; average 3.00 → 3; cap min (3, 1) + 1 = 2; **overall level 2 with the cap applied because of D6**. The C1 assessment (EM-2025-09) gives an overall level of 1.

## Files

| File | What it is |
|---|---|
| `madurez.html` | The tool. **Generated**: never edited by hand. |
| `_fuentes/madurez.plantilla.html` | Application (HTML, CSS and JavaScript) without data. It is the only file that is edited. |
| `cuestionario.json` | Dimensions, levels, rubrics and the 84 questions (ES/EN) extracted from document 11. **Never edited by hand.** |
| `datos_demo.json` | Example assessments (fictitious). |
| `build_madurez.ps1` | Generates `madurez.html`: `pwsh -File SEVEN-G/herramientas/T15_diagnostico_madurez/build_madurez.ps1` (with `-Datos <file>` it starts with another T15 JSON; with `-Salida <file>` it writes to another path; with `-ActualizarCuestionario` it extracts `cuestionario.json` again from document 11). |

At each build, the script checks that `cuestionario.json` matches document 11 in Spanish and English (if the document changes, the build fails until the questionnaire is updated and, if questions or levels change, its version), that the structure is that of the model (7 × 12 questions, 2-2-4-2-2 distribution, ten §14 questions at level 3) and that the assessments are consistent (assessment type, questionnaire version, weights, question codes and "Not applicable" only where allowed).

For the smoke test: `#nivel-global` carries `data-nivel` (in the example, `2`), `data-media`, `data-tope` and `data-tope-aplicado`, and each row `tr[data-dim="D1"]`… of the dimensions table carries `data-nivel`.

## Pending

- *Answer* entity in the data model in 03 §4 (proposal in 11 §10): the assessment summary is already there (schemas 0.6 and 0.7, D100 and D115); the answers stay in T15 only.
- Transfer of the actions requested by the board to the register of recommendations (T18).

---

MIT code · CC BY 4.0 content · © 2026 Fernando García Varela · SEVEN-G methodology. The tool is provided "as is", is not advice and each organisation is responsible for its data and decisions (full legal notice in the tool itself).
