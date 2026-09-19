# T14 · Transformation index calculator

Applies **document 12** (Transformation index): it calculates baseline conditions B1 to B3, the eight signals with their score from 0 to 3, coverage, the evidenced and assigned profile (detecting **declared but unevidenced transformation**), the complementary alerts and **what would move the profile**. It saves each calculation with its cut-off date, its type (formal, tracking or extraordinary) and the **threshold version** it used, and shows the evolution.

**Why it matters.** The index answers the question the board asks about AI: is the company transforming or only becoming more efficient? Calculating it by hand is error-prone (two-step rules, bands, "no data"); the calculator always applies the same rules, makes visible which data is missing and keeps the threshold version, which is what makes it possible to compare years and calibrate in C5 without dressing up the profile.

## How to use it

1. Open `indice.html` in the browser (no server or installation needed). It starts with two fictitious example calculations; the June 2026 one reproduces the complete example in document 12, section 9.
2. **New from a T01 register**: export the full JSON in the initiative register (T01, "Data" → "Full JSON") and load it. T14 calculates what the register contains (marked in green) and leaves empty what has to be completed manually.
3. Complete the missing data. Whatever is left empty counts as **no data**: it scores 0, is never estimated and reduces coverage. With fewer than 6 out of 8 signals with data, the profile is **provisional**.
4. Under "Actions", record the owner and time limit of each condition in "What would move the profile" and the data plan (document 12, section 10). "Print report" produces the sheet for the board.
5. "Data" → "Export T14 JSON" saves thresholds and calculations, with their results, to keep or share them.

Data is stored only in the browser used (local storage). Nothing is sent to third parties.

## What is calculated from T01 and what is completed manually

| Data | From T01 | Notes |
|---|---|---|
| B1, B3, production with value | Yes | Active = not stopped or retired; governed = with a *gate* decision and confirmed or actual ambition. |
| B2, signal 2 | Yes | Latest realised amount of each type per initiative and area in the 12 months before the cut-off date. |
| Signal 1 | Yes (approximation) | Cumulative realised investment of each initiative + latest realised recurring cost. Level: actual if it exists; otherwise, confirmed; with neither, "unclassified". |
| Signal 7 | Yes | G2 passed in 24 months; outcome = G5, stopped or stalled for more than twice the reference times of phases 3 to 5 (T01 configuration). |
| Overstatement | Yes | Initiatives with an actual ambition lower than the confirmed one. |
| Signal 3 | Yes, with schema 0.5 | Sum of each initiative's capacity (`indice.capacidad`: released, materialised and reassigned hours; T20). |
| Signals 4 and 5 | Yes, with schema 0.5 | Verification of IT-P2 and IT-P3 at a *gate* (`indice.itp2`, `indice.itp3`), verified human oversight and entire unit redesigned. Unverified = yes answer without a completed verification (no answers are not verified). |
| Signal 6 | Yes, with schema 0.5 | Latest realised and validated return with `oferta_habilitada_ia` in the 12 months, over `meta.indice.ingresos_totales`. |
| Signal 8 and IT-D1 | Yes, with schema 0.5 | Board decisions (`decisiones_consejo`, T01 Board view): approved thesis and its spheres with Transform, Transform bets approved in 12 months with or without a cap per stage, reviews and stage decisions. |
| IT-D3 | Yes, with schema 0.5 | `meta.indice.it_d3` and its evidence. |

With a register prior to schema 0.5, signals 3 to 6 and 8 and conditions IT-D1 and IT-D3 are left as "no data" and completed manually. Only initiatives in spheres 01 to 07 count (document 12, section 4.2).

## Calculating from T01 without opening the browser

```bash
pwsh -File SEVEN-G/herramientas/T14_indice_transformacion/build_indice.ps1 -DesdeT01 registro_T01.json -Exportar t14.json
```

It opens the calculator in headless Edge, creates the calculation at the register's reference date with the current thresholds and writes the T14 JSON with its result (profile, signals, alerts and what would move the profile). That file is the optional input for the board dashboard: `uv run python t01_a_panel.py --t01 registro_T01.json --indice t14.json` adds the "Company transformation index" card. The dashboard example uses `T17_panel_consejo/ejemplo/t14_indice.json`, calculated in this way from the T01 demonstration data.

## Thresholds

Version **0.1** holds the initial thresholds of document 12 (section 4.5), **to be calibrated**. Under "Thresholds", a new version is created from another; a version already used by any calculation cannot be edited (thresholds do not change within the annual cycle). The company may adjust thresholds, not the structure of the signals or the profile assignment rules, and declares the adjustment as a deviation.

## Files

| File | What it is |
|---|---|
| `indice.html` | The calculator. **Generated**: never edited by hand. |
| `_fuentes/indice.plantilla.html` | Application (HTML, CSS and JavaScript) without data. It is the only file that is edited. |
| `datos_demo.json` | Thresholds v0.1 and example calculations (fictitious). |
| `build_indice.ps1` | Generates `indice.html`: `pwsh -File SEVEN-G/herramientas/T14_indice_transformacion/build_indice.ps1` (with `-Datos <file>` it starts with another T14 JSON). |

`verificar_coherencia.ps1` checks that `indice.html` matches its sources and that, opened in the browser, the document 12 example gives a sum of 12 and the profile "Declared but unevidenced transformation".

## Pending

- Calibrate the v0.1 thresholds with the company's data (document 12, section 8).
- Index card in the mobile board dashboard (the full dashboard already shows it).

---

MIT code · CC BY 4.0 content · © 2026 Fernando García · SEACHAD · SEVEN-G methodology. The tool is provided "as is", is not advice and each organisation is responsible for its data and decisions (full legal notice in the tool itself).
