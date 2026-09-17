# T17 · Connector from the T01 register to the board dashboard

## Legal notice and disclaimer

SEVEN-G and this tool are provided “as is” and for information purposes only. They do not constitute legal, regulatory, financial or professional advice, nor do they guarantee compliance with any regulation. The criteria, classifications and references to general regulation (EU AI Act, GDPR, DORA, NIS2…) or sector-specific regulation may be incomplete, may not apply to a specific case or may become outdated as a result of regulatory changes. Each organisation that uses the tool is solely responsible for identifying the regulation that applies to it, verifying that it is current and certifying its own regulatory compliance, with the appropriate qualified advice. The author and SEACHAD accept no liability whatsoever for the use of the tool or for decisions taken with it. The demo data is fictitious.

Everything the connector generates (full dashboard, mobile dashboard and recommendations log) carries this notice: in the notice band and footer of the full dashboard, before the footer of the mobile dashboard and in the footer of the log.

---

Converts the **full JSON** exported by the SEVEN-G **T01** initiative register (schema `esquema_registro.schema.json`, version `0.1`) into the dashboard JSON (`motor/ESQUEMA.md`) and, using the dashboard engine included in `motor/`, generates:

- the **full dashboard** and the **mobile dashboard** (T17), in sync (same data fingerprint);
- the **dashboard JSON**, to inspect it or save it as a snapshot with `motor/snapshot.py`;
- the **recommendations log** (T18), if T01 contains recommendations.

Specification: document 03 (§5.4, T17 and T18; §2, principles) and document 60 (board package). Field names and on-screen texts are in Spanish, as in the engine.

[Versión en español](README.md) · [Connector page](index.html)

## Files

| File | Content |
|---|---|
| `t01_a_panel.py` | The connector: T01 → dashboard schema mapping and generation with the engine. Standard library only. |
| `motor/` | The dashboard engine: `build_dashboard.py` (full dashboard), `panel_movil.py`, `panel_core.py` (shared JavaScript core), `economia.py`, `glosario.py`, `snapshot.py`, `ESQUEMA.md` (JSON schema) and `demo_lib.py` (recommendations log template). Copy maintained in AI_CONSULTING since 17-09-2026; origin: `AI_en_el_consejo/motor` (MIT, same author). From now on the engine evolves here. |
| `publicacion_panel.py` | Legal notice, authorship footer, insertion of the notice into the mobile dashboard and the recommendations log page. Imported by the connector from this folder. |
| `index.html` | Connector page (ES/EN, no server, no external resources) with links to the demo and the legal notice. |
| `ejemplo/salida/` | Demo generated from the T01 fictitious data. Generated HTML files are never edited by hand: they are regenerated with the connector. |
| `PROPUESTA_MOTOR.md` | Working document (Spanish): proposed changes to the dashboard engine so that it reads SEVEN-G data. For the engine's source project; not applied to the public copy. |
| `README.md` · `README_en.md` | This document, in Spanish and English. |

## Requirements

- **Python 3.11 or later** with [`uv`](https://docs.astral.sh/uv/). Standard library only; no packages are installed.
- Nothing else: the **dashboard engine is included** in `motor/` and no other repository is needed. The connector adds this folder and `./motor` to `sys.path`.
- Optional: `--panel <path>` uses another engine, pointing to a checkout of the [AI en el Consejo](https://github.com/Seachad-TEAM/AI_en_el_consejo) repository (`<path>/motor` and `<path>/demos/fuente`). If anything is missing, the connector stops with a clear message.

## Usage

From this folder:

```bash
uv run python t01_a_panel.py --t01 export_t01.json --salida folder [--sigla CA] [--organizacion "Name"] [--prefijo t01_] [--panel path]
```

| Option | What it does |
|---|---|
| `--t01` | Full JSON exported from T01 (**Datos → Exportar JSON completo**). The CSV and the "for the dashboard" export are not valid inputs. Default: `../T01_registro_iniciativas/datos_demo.json` (fictitious data). |
| `--salida` | Output folder. Created if missing. Default: `./ejemplo/salida`. |
| `--sigla` | Advisory board acronym used in the texts. Default: "consejo asesor". |
| `--organizacion` | Organisation name. Default: T01 `meta.organizacion`. |
| `--prefijo` | File prefix. Default: `t01_`. |
| `--panel` | Optional: use another engine, pointing to a checkout of the *AI en el Consejo* repository. Default: `./motor`. |

Output files: `<prefix>Dashboard_Casos_Uso_IA_v7.html`, `<prefix>Dashboard_Movil_IA_v7.html`, `<prefix>dashboard_data.json` and, if there are recommendations, `<prefix>Registro_Recomendaciones.html`.

If T01 `meta.datos_ilustrativos` is `true`, the texts state that the data are fictitious; otherwise they carry a legal notice for own data.

The connector does not write `__pycache__` (`sys.dont_write_bytecode`).

## Demo

`uv run python t01_a_panel.py` with no arguments converts `../T01_registro_iniciativas/datos_demo.json` (fictitious company, people and suppliers) into `ejemplo/salida/` and links the footers to `index.html`. It is the demo opened from the connector page. Generated HTML files are never edited by hand.

## Mapping principles

1. **"No data" is not zero.** Anything T01 does not record is `null` (or an empty list) and the dashboard shows "sin dato" (document 03 §2, principle 7).
2. **The connector does not modify the engine.** Its legacy keys are used: `estimado_cati` for estimated amounts and `acciones_estimadas_cati` (set to `null`). Engine changes (renaming keys, reading `seveng`, native legal notice) are proposed in `PROPUESTA_MOTOR.md` and will be applied in `motor/`.
3. **Single source.** Everything comes from the T01 JSON; no estimates are added (document 03 §2, principle 1).

## Dashboard status

The dashboard accepts only four statuses. They are derived from T01 status and phase, in this order:

| T01 condition | Dashboard status | Why |
|---|---|---|
| Status `parada` or `retirada`, or initiative with `cierre` | `Desenganchado` | Closed: no longer consumes or delivers. |
| Status `en_produccion` or `pendiente_g7`, or phase 6–7 | `En uso` | G5 passed: in operation. |
| Phase 4–5 (any other status: in phase, gate pending, on hold) | `En desarrollo` | G3 passed: being designed, built and validated. |
| Phase 0–3 (registered, in phase, gate pending, on hold) | `POC` | Before G3: discovery, hypothesis and feasibility. |

Original phase and status are kept in `casos[].seveng`.

## Mapping table

### `meta`

| Dashboard | T01 source | Note |
|---|---|---|
| `organizacion`, `compania_principal` | `--organizacion` or `meta.organizacion` | |
| `consejo_sigla` | `--sigla` | Not in T01; default "consejo asesor". |
| `generado`, `ejercicio_valor`, `periodo` | `meta.fecha_referencia` (or `meta.generado`) | Label "Registro de iniciativas T01 · corte dd-mm-yyyy"; quarter derived from the date. `periodo.anterior`: no data. |
| `prefijo_ficheros` | `--prefijo` | |
| `demo` | `meta.datos_ilustrativos` | |
| `textos` | Generated by the connector | Legal notice, value notice, footer with authorship and "no data" texts. |
| `glosario_extra` | Generated by the connector | SEVEN-G, T01, G3, G5, R6 and ambition. |
| `origen` | `version_esquema` and connector version | Own block; not read by the dashboard. |

### `casos[]` (one per initiative)

| Dashboard | T01 source | Note |
|---|---|---|
| `id`, `nombre` | `id`, `nombre` | |
| `que_es` | `descripcion` | |
| `area`, `unidad` | `area` | |
| `compania` | organisation | T01 has no group of companies. |
| `estado` | `ciclo.fase` and `ciclo.estado` | Table above. |
| `descripcion` | — | No data: these are advisory board remarks. |
| `inicio_estimado` | — | No data. Technical exception: `""` for "En uso" or "Desenganchado" cases without a production date, so that the current engine does not print "null (año estimado)". |
| `tags.tecnologia` | `clasificacion.tecnologia` | One label for filtering: `agente` if present; otherwise `ia_generativa`; otherwise the first one. Dashboard vocabulary (`Agéntico`, `GenAI`, `ML predictivo`, `NLP / IDP`, `Visión artificial`, `Optimización`, `IA de tercero`, `Reglas (no es IA)`), which the engine uses to detect agents. |
| `tags.naturaleza` | Derived from the main technology | |
| `tags.exposicion` | `clasificacion.exposicion` | `interna` → Interno · `empleados` → Empleado · `clientes_indirecta` → Cliente (indirecta) · `clientes_directa` → Cliente / persona externa (directa). |
| `tags.riesgo`, `detalle.aiact` | `clasificacion.regulatoria` | Prohibido · Alto riesgo · Transparencia (art. 50) · Riesgo mínimo · Fuera de ámbito · Por confirmar (`pendiente`). **It is the register's classification**, not an independent advisory board estimate, although the dashboard labels it that way. |
| `tags.funcion` | `clasificacion.esfera_principal` | "04 Operaciones", etc. |
| `tags.ambicion` | `ambicion_real`, else `ambicion_confirmada`, else `ambicion_propuesta` | Optimizar · Aumentar · Transformar. |
| `tags.prioridad` | — | No data. |
| `detalle.tipo` | `clasificacion.tecnologia` (all) | |
| `detalle.proveedores` | `clasificacion.proveedores` → `proveedores[].nombre` | |
| `detalle.valor_tipo` | `clasificacion.tipo_valor` | |
| `detalle.es_ia` | Nature of the main technology | |
| `detalle.decision`, `datos`, `acciones_estimadas_cati` | — | No data. |
| `valor` (legacy block) | — | All no data except `medido` (some realised amount exists) and `fuente`. |
| `seveng` | `ciclo`, `clasificacion`, pending decisions | Own block (phase, status, iteration, hold, pending gate, intensity, spheres, ambitions, autonomy, tags, systems). Not read by the current dashboard. |

### `casos[].economia`

Each amount in `valores` becomes an *item* with `importe`, `formula`, `estado`, `fuente` and `fecha`; `atribucion` and `hipotesis` are left empty. If there are several amounts for the same moment and type, the most recent one is used. Status: `validado` and `declarado` unchanged; `estimado` → `estimado_cati` (engine legacy key; in T01 the initiative team estimates it, not the advisory board, and the dashboard notice says so).

| Dashboard | T01 source | Note |
|---|---|---|
| `inversion.construccion` | Realised `inversion` value; else sheet `inversion.realizada` (declared); else expected `inversion` value | |
| `inversion.recurrente_anual` | Realised `coste_recurrente` value | |
| `inversion.recurrente_potencial` | Expected `coste_recurrente` value | |
| `inversion.adicional_potencial` | Sheet `inversion.pendiente` (declared) | |
| `inversion.desglose_recurrente` | — | No data: T01 does not break down cost. |
| `eficiencias[]` concept `operativo` | `eficiencias` values (realised → `actual`, expected → `potencial`) | T01 does not split people, tools, claims, etc. |
| `eficiencias[]` concept `capacidad_liberada` | `capacidad_liberada` values | Not added to net value. |
| `retorno[]` concept `otros` | `retorno` values | T01 does not split new sales, retention, etc. |
| `hipotesis_potencial` | Formulas of expected values | |
| `nota_caso` | T01 phase and status; `riesgo_evitado` and `cumplimiento` amounts | Reported as text: not added to net value (T01 rule). |
| `moneda` | `meta.moneda` | |
| `plazo_potencial`, `clave_reparto` | — | No data. `comparte_valor_con` empty. |

For **closed** initiatives (stopped or retired) only construction is kept; their other amounts are quoted in `nota_caso` and not added in the dashboard.

### `casos[].reporte_compania`

| Dashboard | T01 source | Note |
|---|---|---|
| `propietario_negocio`, `responsable_tecnico` | `responsables.patrocinador`, `responsables.tecnico` → person name | |
| `empresa_grupo` | organisation | |
| `fechas.idea` | `fecha_registro` | |
| `fechas.aprobacion` | First **G3** decision with result Continue or Continue with conditions | |
| `fechas.inicio` | First entry into phase 4 | Solution design starts. |
| `fechas.piloto` | First entry into phase 5 | Delivery and validation. |
| `fechas.produccion` | First **G5** decision that continues; if none, first entry into phase 6 | |
| `fechas.ultima_revision` | Last R6 decision | |
| `fechas.retirada` | `cierre.fecha` | Stop or retirement date. |
| `retirada` | `cierre`: type, gate, coded reason and comment; `organo`; `sustituto` | |
| `tier_riesgo` | `riesgo_residual_principal` | `critico` → `alto`. |
| `clasificacion_ria` | `clasificacion.regulatoria` | `riesgo_minimo` → `minimo` · `fuera_ambito` → `no_es_ia` · `pendiente` → no data. |
| `controles.RIA` | `clasificacion.regulatoria` | `pendiente` → pending; anything else → done. |
| `controles.FRIA` | `evaluaciones_impacto` type `eidf` | done · pending · not applicable. |
| `controles.DPIA` | `evaluaciones_impacto` type `eipd` | Same. |
| `controles.seguridad`, `MUC`, `IA_ofensiva` | — | No data. |
| `valor_validado.actual`, `metodo_atribucion`, `validado_por`, `fecha_validacion` | Validated realised efficiency and return values | |
| `valor_validado.objetivo` | Sum of expected efficiencies and return | |
| `valor_validado.base`, `recurrente`; `coste_real` | — | No data. |
| `operacion`, `agente`, `proveedor_dora` | — | No data. |

### `seguimiento`

| Dashboard | T01 source | Note |
|---|---|---|
| `movimientos[]` type `alta` | `alta` events | Decision maker = event author. |
| `movimientos[]` type `retirada` | `parada` and `retirada` events | Reason starts with "Parada en G3" or "Retirada en G7": the dashboard only counts additions, retirements and re-assessments. Decision maker = closing body; substitute from the closure. |
| `movimientos[]` type `reevaluacion` | `cambio_clasificacion` events and **R6** decisions | |
| `incidentes[]` | `incidentes` | `tipo` = "Severidad S1–S4"; `horas_detectar`, `horas_contener`, description, notifications and status. `resolucion_horas`, `rto_horas`, `origen`, `vector`, breach, affected people and notification deadlines: no data. |
| `adopcion`, `agilidad`, `ia_ofensiva`, `cdm_compania` | — | No data. Idea → approval → production agility is computed by the dashboard from each case's dates. |

Movements include the **whole register history**, not only the last period.

### `historico[]`

Empty: T01 does not store dashboard snapshots. At the end of each session, from this folder: `uv run python motor/snapshot.py --datos <prefix>dashboard_data.json --etiqueta "Session N"`.

### Recommendations log (T18)

| Log | T01 source | Note |
|---|---|---|
| `id`, `texto`, `destinatario` | `recomendaciones[]` | Linked initiatives are appended to the text. |
| `estado` | `estado` | `abierta` → pending · `en_curso` → in progress · `cerrada` → fulfilled · `descartada` → discarded. |
| Session | `fecha` | One session per distinct date. |
| Scope | Main sphere of the linked initiatives | "General" if none. |
| Evidence | `evidencia` | |
| Link to the dashboard | Inventory, if there are linked initiatives | |
| Committed date, advisory board assessment | — | No data. |

## What in T01 does not reach the dashboard

Gate decisions and criteria, conditions, evidence, iterations, holds, deadlines and stalled initiatives, T04 and T05, funnel metrics (conversion, decision time, weighted value, cohorts), risks, non-conformities, suppliers (except their name), systems (except their code in `seveng`) and people (except the names of owners and decision makers). The current engine has nowhere to show them; phase, status, intensity, spheres and ambition travel in `casos[].seveng` for when the engine reads them (`PROPUESTA_MOTOR.md`).

## Known limitations

- **Inherited engine.** `motor/` is the copy of the engine published in *AI en el Consejo* as of 17-09-2026 (data version 6) and evolves here from then on, independently of that repository. It keeps keys and labels designed for the advisory board; `PROPUESTA_MOTOR.md` (Spanish) lists what is pending.
- **Legal notice on mobile.** The engine does not show `meta.textos` in the mobile dashboard. `publicacion_panel.py` adds the notice to the generated HTML, before the footer, without changing data or fingerprint. In the full dashboard the notice is in the header notice band (`aviso_previo`) and, in short form, in the footer.
- **`tags.riesgo`.** The dashboard labels it as the advisory board estimate; here it is the classification recorded in T01.
- **"Estimated" status.** The dashboard attributes it to the advisory board; in T01 the team estimates it. The value notice clarifies this.
- **One technology per case** in filters; the full list is in the case sheet (`detalle.tipo`).
- **Texts in Spanish**, as in the engine; the connector page and the READMEs are in Spanish and English.

## Licence

Code under the **MIT** licence, including the engine in `motor/` (derived from [AI en el Consejo](https://github.com/Seachad-TEAM/AI_en_el_consejo), MIT, same author). Contents (documentation, connector page and sample data) under **CC BY 4.0**.

© 2026 Fernando García · SEACHAD · SEVEN-G methodology
