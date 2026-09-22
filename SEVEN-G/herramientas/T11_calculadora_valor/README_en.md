# T11 · Value hypothesis and cost-per-case calculator

Applies **document 40** (Value measurement rules) and **document 42** (AI costs) to a use case: the **value hypothesis calculator (T11)** and, as a module of the same application, the **cost-per-case calculator (T13)**. It calculates annual net value (F2), NPV (F7), ROI (F8), payback period (F9) and additional net value per euro (F3) with the horizon and rate approved in C2; and the full cost by the nine categories (build, initial adoption, recurring and retirement), the total cost of ownership, the incremental view, the allocation of shared costs, consumption control, cost per unit of output, the cost of stopping and the reconciliation with the accounts.

**Why it matters.** The committee and the board decide at G2 and G3 on the basis of a value hypothesis and a cost estimate. If each use case is calculated with its own spreadsheet, the same use case is approved or rejected depending on the formula chosen, shared or adoption costs are forgotten and released capacity is mistaken for savings. The calculator always applies the official formulas, shows the figures behind each result, leaves missing data as "no data" instead of setting it to zero and flags whatever breaches the measurement rules. **It informs; it does not decide**: the economic criterion is applied by the body that decides the *gate*.

## How to use it

1. Open `calculadora.html` in the browser (no server or installation needed). It starts with two fictitious example use cases, consistent with the T01 demonstration register: IA-2026-001 (Optimise, phase 3) and IA-2026-002 (Transform, phase 2).
2. **Value hypothesis (T11)**: falsifiable hypothesis, metric, baseline, attribution method (with its maximum status), value lines with a formula (incremental units × unit value, status and source), adoption ramp-up, stop criteria and, in Transform, stages with an investment cap and option value (template P08).
3. **Cost per use case (T13)**: cost lines by component and category (template P10 §6.1), shared costs with their allocation key, monthly consumption against budget, cost per unit of output, cost of stopping and planned/actual reconciliation.
4. **Decision sheet**: printable summary for the *gate* body, with the proposed answer in the board formats ("Yes", "Yes, with one condition: …", "Not yet, because … is missing", "No, because …").
5. **Data**: export or import the T11 JSON; create a use case from the full T01 JSON; export a use case result (JSON with the expected amounts in the format of T01 `valores[]`) or the use case as **CSV**, which is the T11 and T13 spreadsheet template.

Data is stored only in the browser used (local storage). Nothing is sent to third parties. The **"Data: …"** button in the bar says where it is (sample, this browser, a file on the computer or the company's server) and opens the "Where my data is" dialog (document 03 §2.1): automatic saving to a **JSON file on the computer** (Edge or Chrome; the same one "Export" downloads) or, in a copy of the site served over http within the company, the file `herramientas/datos/T11_calculadora.json`, which replaces the sample data.

## Formulas applied

| Code | Formula | Document |
|---|---|---|
| F1 | Amount of a line = incremental units × unit value | 40 §6 |
| F2 | Annual net value = efficiencies + return − recurring cost | 40 §6 |
| I | Initial investment = build + initial adoption | 40 §8.2 and 42 §3 |
| Year t | Annual net value in year t = (efficiencies + return) × ramp-up of year t − full recurring cost − retirement (only if planned within the horizon, in the last year) | 40 §8.2 and 43 §4.1 |
| F7 | NPV = −I + Σ annual net value in year t ÷ (1 + r)^t, t = 1…H | 40 §6 and §8 |
| F8 | ROI(H) = (Σ annual net value − I) ÷ I (for information) | 40 §6 and §8.3 |
| F9 | First year with cumulative net value ≥ I, linearly interpolated (for information) | 40 §6 |
| F3 | Additional net value per euro = (potential annual net value − current annual net value) ÷ additional investment; also with incremental cost | 40 §6 and 42 §2 |
| F4 | Released capacity: reported separately; it does not add | 40 §3.3 |
| TCO | Total cost of ownership (H) = build + initial adoption + H × recurring cost + retirement | 42 §5.1 |
| Allocation | Measured consumption: cost × use case key ÷ (100 − % untagged), only within the tolerance; driver or weighted: cost × (1 − % overhead) × use case key ÷ total key | 42 §6 |
| Consumption | Month-end forecast = cumulative ÷ days elapsed × days in the month; 50, 80 and 100% alerts and anomalous consumption | 42 §8 |
| Unit | Cost per unit = recurring cost ÷ useful units; process cost per unit = (recurring cost + residual human cost) ÷ volume | 42 §9 |
| Stopping | Cost of stopping = penalties + closure; avoided investment = approved − spent − commitments | 42 §10 |

Rules the calculator enforces or flags: "no data" is not zero (an empty amount leaves the total and the net value with no data; nothing is estimated); expected value is never marked as validated; return does not mix margin and revenue; recurring cost is charged in full from the first year and the ramp-up only affects value; the horizon does not exceed the useful life; in Augment and Transform the adoption cost is mandatory; each cost has a category and a component, and each allocation key, an approval. In Optimise and Augment it shows whether the NPV meets the single C2 criterion (NPV ≥ 0); in Transform the NPV is for information and the stage investment cap is checked. The prudent, central and favourable **scenarios** (P10 §6.2) use multipliers declared in the parameters, which are assumptions, not data.

## What is taken from T01 and what is completed manually

| T01 data | Use in T11 | Notes |
|---|---|---|
| Name, description, ambition (confirmed or proposed), intensity and phase | Use case identification | |
| Expected `valores[]` for efficiencies, return, released capacity, avoided risk and compliance | Value lines | T01 stores the amount and the text of the formula: the line arrives without being broken down and is flagged. |
| Expected `valores[]` for recurring cost and investment | Cost lines | They arrive without a category: they are classified manually (document 42 §4). |
| `inversion.realizada` and `inversion.pendiente` | Build line if there is no expected investment; "spent" in the cost of stopping | |
| Hypothesis, attribution method, ramp-up, stop criteria, stages, shared costs, consumption and reconciliation | No | Completed manually. |

The use case result export includes `valores_t01`: the expected amounts in the format of T01 `valores[]` (without the `VAL-` code, which T01 assigns), so that they can be recorded in the initiative register. T11 does not modify T01.

## Parameters

Version **2026** holds the example values: a 3-year horizon and an 8% rate (the same as in the example in document 40 §8.4), a 5% tolerance for untagged consumption, consumption alert thresholds of 50, 80 and 100% (indicative values of document 42 §8.2), scenario multipliers and fully loaded hourly cost by profile. The company sets its own in C2. A version already used by any use case is not edited: a new one is created from it.

## Files

| File | What it is |
|---|---|
| `calculadora.html` | The calculator. **Generated**: never edited by hand. |
| `_fuentes/calculadora.plantilla.html` | Application (HTML, CSS and JavaScript) without data. It is the only file that is edited. |
| `datos_demo.json` | Example parameters and two fictitious use cases. |
| `build_calculadora.ps1` | Generates `calculadora.html`: `pwsh -File SEVEN-G/herramientas/T11_calculadora_valor/build_calculadora.ps1` (with `-Datos <file>` it starts with another T11 JSON and with `-Salida <file>` it writes to another path). It checks complete parameters, existing versions, cost components and categories and that no expected value is marked as validated. |

Demonstration values for the smoke test (use case IA-2026-001, opened by default): `#resultado[data-van="1826542"][data-roi="217.7"][data-payback="1.44"]` (annual net value €1,640,000, initial investment €1,100,000) and `#nav a[href="#/costes"]`; in the cost view, `#costes-resumen[data-tco="1940000"]`.

## Pending

- Tracking of value realisation by period, statuses and expiry (T12, formulas F5, F6 and F10).
- Consolidation table of the allocation of shared costs across all portfolio use cases (document 42 §6.7): here T13 calculates one use case's share.
- Storing the hypothesis and the cost breakdown in T01 (future schema), so that they do not have to be completed manually on import.

---

MIT code · CC BY 4.0 content · © 2026 Fernando García Varela · SEVEN-G methodology. The tool is provided "as is", is not advice and each organisation is responsible for its data and decisions (full legal notice in the tool itself).
