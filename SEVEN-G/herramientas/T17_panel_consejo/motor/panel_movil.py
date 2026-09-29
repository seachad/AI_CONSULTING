# Copia mantenida en AI_CONSULTING (SEVEN-G, T17); origen: AI_en_el_consejo/motor (MIT, mismo autor). Versión 8 del motor incorporada el 17-09-2026.
# -*- coding: utf-8 -*-
"""Panel movil del Consejo: version resumida del panel completo, para consultar en el telefono.

Lo genera build_dashboard.py junto al panel completo, desde el mismo dashboard_data.json y con el mismo nucleo
de calculo (panel_core.py), con el mismo numero de version. Muestra solo lo esencial: neto y sus componentes,
calidad del dato, alertas, principales casos, donde rinde mas la inversion adicional, novedades frente a una foto
y tendencia. El detalle (fichas completas, riesgo, agentes, CdM de la compania) queda en el panel completo.

Regla: cualquier cambio en un panel se analiza por si debe reflejarse en el otro. Nada especifico de una organizacion
vive en el codigo: sale de meta en el JSON.
"""

import ayuda_tarjetas

TERMINOS_MOVIL = {"VNB", "Neto anual", "Eficiencias", "Retorno", "Capacidad liberada", "Potencial",
                  "Neto adicional por euro invertido", "Estado del dato", "Foto (histórico)", "Puesta en producción",
                  "Inversión", "Consejo asesor", "IA", "Brecha de datos personales", "AEPD",
                  "Embudo", "Límite de días", "Mediana", "Plan de realización de beneficios", "Curva de realización",
                  "Tramo de financiación", "Condición de paso", "Caja por delante", "Realización (F10)", "Valor no cuantificado",
                  "Sostenido por valor no cuantificado"}

CSS = r"""
/* misma paleta que el panel completo (sin semáforo): retorno azul oxford, eficiencias verde azulado, coste ocre mostaza,
   neto en tinta y negativos en ciruela; en claro, el papel salmón de prensa económica del tema por defecto del completo */
:root{color-scheme:light;--page:#f3d6c1;--surface:#fbe9dc;--ink:#2a2421;--ink2:#54473f;--muted:#6f5d52;--grid:#e3c3ac;--line:#e3c3ac;--card:#fbe9dc;
 --s1:#0f5499;--s2:#9c7a17;--s3:#2b8581;--seq250:#98b3c9;--good:#0b6260;--bad:#7a2e5a;--neto:#2a2421;--accent:#2a2421;--accent-ink:#fbe9dc;--headfont:Georgia,"Times New Roman",serif;
 --warnbg:#f3dfbf;--warnink:#5f3d00;--badbg:#ead3d9;--badink:#5e2447;
 --amb:#d9a200;--ambbg:#f9e3a6;--ambink:#5c4300;--roj:#c0392b;--rojbg:#f4c7bf;--rojink:#7d1a10}
@media (prefers-color-scheme: dark){:root:not([data-theme="light"]){color-scheme:dark;--page:#0e0f11;--surface:#1a1b1e;--card:#1a1b1e;--ink:#f2f2f3;--ink2:#c3c6cc;--muted:#8d9199;--grid:#2c2e33;--line:#2c2e33;
 --s1:#5b9be0;--s2:#d4ad3f;--s3:#4fb3ac;--seq250:#3e5569;--good:#6cc5be;--bad:#d98db8;--neto:#f2f2f3;--accent:#5b9be0;--accent-ink:#0e0f11;--headfont:inherit;
 --warnbg:#3a2c12;--warnink:#f5d9a0;--badbg:#3a1c2e;--badink:#e6bfd5;
 --amb:#e0b040;--ambbg:#3a2e0e;--ambink:#f5d98a;--roj:#e25b4f;--rojbg:#3f1714;--rojink:#f5b0a7}}
:root[data-theme="dark"]{color-scheme:dark;--page:#0e0f11;--surface:#1a1b1e;--card:#1a1b1e;--ink:#f2f2f3;--ink2:#c3c6cc;--muted:#8d9199;--grid:#2c2e33;--line:#2c2e33;
 --s1:#5b9be0;--s2:#d4ad3f;--s3:#4fb3ac;--seq250:#3e5569;--good:#6cc5be;--bad:#d98db8;--neto:#f2f2f3;--accent:#5b9be0;--accent-ink:#0e0f11;--headfont:inherit;
 --warnbg:#3a2c12;--warnink:#f5d9a0;--badbg:#3a1c2e;--badink:#e6bfd5;
 --amb:#e0b040;--ambbg:#3a2e0e;--ambink:#f5d98a;--roj:#e25b4f;--rojbg:#3f1714;--rojink:#f5b0a7}
*{box-sizing:border-box}
body{margin:0;background:var(--page);color:var(--ink);font:15px/1.45 system-ui,-apple-system,"Segoe UI",Roboto,sans-serif;-webkit-text-size-adjust:100%}
.wrap{max-width:520px;margin:0 auto;padding:0 16px 40px}
header{position:sticky;top:0;z-index:10;background:var(--page);padding:12px 16px 10px;border-bottom:2px solid var(--accent)}
header .in{max-width:520px;margin:0 auto}
h1{font-size:18px;margin:0;font-weight:700;line-height:1.2;font-family:var(--headfont)}
.sub{font-size:12px;color:var(--muted);margin-top:2px}
.ctrls{display:flex;gap:8px;margin-top:10px}
/* control «Ir a código» y lista de citados (codigos.js, D99) con los colores del tema del panel */
.ir-codigo-panel{margin-top:8px}.ir-codigo-panel,.ir-codigo-lista{--papel:var(--surface);--papel-2:var(--grid);--tinta:var(--ink);--tinta-2:var(--ink2);--regla:var(--grid);--regla-2:var(--grid);--claret:var(--accent);--oxford:var(--accent);--negro:var(--ink);--sans:inherit}
/* enlaces de vuelta al sitio (meta.navegacion.sitio, D141), en una línea que se desliza si no cabe */
.sitio-m{display:flex;gap:6px 14px;overflow-x:auto;white-space:nowrap;margin-top:6px;font-size:12.5px;scrollbar-width:none}.sitio-m a{color:var(--ink2);text-decoration:none;border-bottom:1px solid var(--grid)}.sitio-m a:hover{color:var(--ink)}
/* botón de tema (D87, D141): alterna claro y oscuro; con meta.navegacion.tema_sitio sigue y actualiza el tema del sitio */
.tema-m{flex:0 0 auto;min-width:40px;min-height:40px;border:1px solid var(--grid);border-radius:10px;background:var(--surface);color:var(--ink);font-size:17px;line-height:1;cursor:pointer}
.seg{display:inline-flex;border:1px solid var(--grid);border-radius:10px;overflow:hidden;flex:0 0 auto}
.seg button{border:0;background:var(--surface);color:var(--ink2);padding:9px 12px;font-size:14px;min-height:40px}
.seg button.on{background:var(--accent);color:var(--accent-ink);font-weight:600}
select{flex:1 1 auto;min-width:0;min-height:40px;padding:8px;border:1px solid var(--grid);border-radius:10px;background:var(--surface);color:var(--ink);font-size:14px}
h2{font-size:13px;text-transform:uppercase;letter-spacing:.05em;color:var(--muted);margin:22px 0 8px;font-weight:600}
.hero{background:var(--surface);border:1px solid var(--grid);border-radius:14px;padding:16px;margin-top:14px}
.hero .k{font-size:13px;color:var(--ink2)}
.hero .v{font-size:36px;font-weight:750;line-height:1.1;margin-top:2px;font-variant-numeric:tabular-nums}
.hero .d{font-size:12.5px;color:var(--muted);margin-top:4px}
.spark{margin-top:10px}
.grid{display:grid;grid-template-columns:1fr 1fr;gap:10px;margin-top:10px}
.tile{background:var(--surface);border:1px solid var(--grid);border-radius:12px;padding:12px}
.tile .k{font-size:12px;color:var(--ink2)}
.tile .v{font-size:21px;font-weight:700;margin-top:2px;font-variant-numeric:tabular-nums}
.tile .d{font-size:11.5px;color:var(--muted);margin-top:2px}
.dlt{font-size:12px;white-space:nowrap;color:var(--muted)}.dlt.up{color:var(--good)}.dlt.down{color:var(--bad)}
.estados{font-size:13px;color:var(--ink2);margin-top:10px}
.alert{display:block;background:var(--warnbg);color:var(--warnink);border-radius:10px;padding:10px 12px;margin:6px 0;font-size:13.5px}
.alert.bad{background:var(--badbg);color:var(--badink)}
.alert b{font-weight:700}
/* indicadores con umbral (meta.umbrales_kpi, mismos que el panel completo): amarillo y rojo */
.alert.amarillo{background:var(--ambbg);color:var(--ambink);box-shadow:inset 4px 0 0 var(--amb)}
.alert.rojo{background:var(--rojbg);color:var(--rojink);box-shadow:inset 4px 0 0 var(--roj)}
.tile.amarillo{background:var(--ambbg);border-color:var(--amb);color:var(--ambink)}
.tile.rojo{background:var(--rojbg);border-color:var(--roj);color:var(--rojink)}
.tile.amarillo .k,.tile.amarillo .d,.tile.rojo .k,.tile.rojo .d{color:inherit}
.list{background:var(--surface);border:1px solid var(--grid);border-radius:12px;overflow:hidden}
.row{display:flex;justify-content:space-between;align-items:center;gap:10px;padding:12px;border-top:1px solid var(--grid);min-height:52px;cursor:pointer}
.row:first-child{border-top:0}
.row .n{font-size:14px;font-weight:600;line-height:1.25}
.row .m{font-size:12px;color:var(--muted);margin-top:1px}
.row .r{text-align:right;font-variant-numeric:tabular-nums;white-space:nowrap}
.row .r b{font-size:15px}
.neg{color:var(--bad)}.pos{color:var(--neto)}
.empty{font-size:13px;color:var(--muted);padding:12px}
.foot{font-size:12px;color:var(--muted);margin-top:22px;line-height:1.5}
.sheet{position:fixed;inset:0;background:rgba(0,0,0,.45);display:none;align-items:flex-end;z-index:30}
.sheet.open{display:flex}
.sheet .box{background:var(--surface);color:var(--ink);width:100%;max-width:520px;margin:0 auto;border-radius:16px 16px 0 0;max-height:85vh;overflow:auto;padding:16px 16px 28px}
.sheet h3{margin:0 0 2px;font-size:17px}
.sheet table{width:100%;border-collapse:collapse;font-size:14px;margin-top:10px}
.sheet th,.sheet td{padding:8px 4px;border-bottom:1px solid var(--grid);text-align:right;font-variant-numeric:tabular-nums}
.sheet th:first-child,.sheet td:first-child{text-align:left}
.sheet th{font-size:12px;color:var(--muted);font-weight:600}
.close{float:right;border:0;background:var(--grid);color:var(--ink);border-radius:8px;padding:8px 12px;font-size:14px}
.badge{display:inline-block;font-size:11.5px;padding:1px 8px;border-radius:10px;background:var(--grid);color:var(--ink2);margin-right:4px}
details.gloss{margin-top:18px}
/* embudo compacto */
.funbar{height:6px;background:var(--grid);border-radius:3px;margin:4px 0 2px;overflow:hidden}
.funbar i{display:block;height:100%;background:var(--s1);border-radius:3px}
.m.pq{margin-top:6px;color:var(--ink)}
.row.fun.gan{border-left:4px solid #2e7d32;background:color-mix(in srgb,#2e7d32 12%,transparent)}
.badge.rojo{background:var(--rojbg);color:var(--rojink)}.badge.amarillo{background:var(--ambbg);color:var(--ambink)}.badge.ok{background:var(--grid);color:var(--ink2)}
/* plan de realización de la cartera (D135): selector de periodo y gráfico compacto */
.h2row{display:flex;justify-content:space-between;align-items:center;gap:8px;margin:22px 0 8px}.h2row h2{margin:0}
.seg.mini button{padding:6px 9px;font-size:13px;min-height:34px}
.curva{background:var(--surface);border:1px solid var(--grid);border-radius:14px;padding:12px}
.curva .d{font-size:12px;color:var(--muted);margin-top:4px}
.sheet h4{margin:14px 0 4px;font-size:13px;color:var(--muted);text-transform:uppercase;letter-spacing:.04em}
"""

JS = r"""
let DATA = __DATA__;
let CASES = DATA.casos; let YEAR = DATA.meta.ejercicio_valor;
__CORE__
const state = { lado: "actual", compara: "", gran: GRAN[cfgCurva().granularidad] ? cfgCurva().granularidad : "anual" };
const rc = c => c.reporte_compania || {};
const $ = id => document.getElementById(id);
const netoCls = v => v < 0 ? "neg" : "pos";
const rend = v => v == null ? "—" : v.toLocaleString("es-ES",{maximumFractionDigits:1}) + " €/€";

function spark(vals, labels){
  if (vals.length < 2) return `<div class="d">La tendencia aparece con la segunda foto guardada.</div>`;
  const W = 320, H = 56, mn = Math.min(...vals), mx = Math.max(...vals), rg = (mx - mn) || 1;
  const x = i => 6 + (W - 12) * i / (vals.length - 1), y = v => 8 + (H - 16) * (1 - (v - mn) / rg);
  const pts = vals.map((v,i)=>`${x(i)},${y(v)}`).join(" ");
  return `<svg viewBox="0 0 ${W} ${H}" width="100%" height="${H}" role="img" aria-label="Evolución del neto anual"><polyline points="${pts}" fill="none" stroke="var(--neto)" stroke-width="2.5" stroke-linejoin="round" stroke-linecap="round"/>${vals.map((v,i)=>`<circle cx="${x(i)}" cy="${y(v)}" r="3.5" fill="var(--neto)"/>`).join("")}</svg><div class="d">${labels[0]} → ${labels[labels.length-1]}</div>`;
}

// plan de realización de la cartera (D135): barras de inversión por tramos y línea del neto acumulado; banda gris en el periodo de hoy
function curvaMini(G, hoyEt){
  if (!G.length) return "";
  const W = 340, H = 120, l = 4, r = 4, t = 8, b = 18, n = G.length, bw = (W - l - r) / n;
  const vals = G.flatMap(g => [g.acum, -g.inv, 0]), mx = Math.max(...vals), mn = Math.min(...vals), rg = (mx - mn) || 1;
  const y = v => t + (H - t - b) * (mx - v) / rg, cx = i => l + bw * (i + .5), paso = Math.ceil(n / 6);
  let s = `<svg viewBox="0 0 ${W} ${H}" width="100%" role="img" aria-label="Neto acumulado de las iniciativas con plan de realización">`;
  G.forEach((g, i) => { if (g.periodo === hoyEt) s += `<rect x="${l + bw*i}" y="${t}" width="${bw}" height="${H-t-b}" fill="var(--grid)" opacity=".6"/>`;
    if (g.inv) s += `<rect x="${cx(i) - Math.min(8, bw*.3)}" y="${y(0)}" width="${Math.min(16, bw*.6)}" height="${Math.max(1, y(-g.inv) - y(0))}" fill="var(--s2)"/>`;
    if (i % paso === 0) s += `<text x="${cx(i)}" y="${H-4}" text-anchor="middle" style="font-size:10px;fill:var(--muted)">${esc(g.periodo)}</text>`; });
  s += `<line x1="${l}" y1="${y(0)}" x2="${W-r}" y2="${y(0)}" stroke="var(--muted)" stroke-width=".6"/>`;
  s += `<polyline points="${G.map((g,i)=>`${cx(i)},${y(g.acum)}`).join(" ")}" fill="none" stroke="var(--neto)" stroke-width="2.4" stroke-linejoin="round"/>`;
  return s + `</svg>`;
}
const debePlan = c => !esSalida(c.estado) && (c.seveng ? c.seveng.fase >= 3 : c.estado !== "Propuesto");
function renderCurva(){
  document.querySelectorAll("#gran button").forEach(b => b.classList.toggle("on", b.dataset.g === state.gran));
  const cfg = cfgCurva(), deben = CASES.filter(debePlan), con = deben.filter(c => curva(c)), cc = curvaCartera(CASES);
  const nivPlan = nivelKPI("planes_realizacion_pct", deben.length ? 100 * con.length / deben.length : null);
  const planes = `<div class="tile ${nivPlan}"><div class="k">Planes de realización</div><div class="v">${con.length} <span style="font-size:13px;font-weight:500">de ${deben.length}</span></div><div class="d">iniciativas en fases 3 a 7 · ${umbralTxt("planes_realizacion_pct")}</div></div>`;
  if (!cc){ $("curva").innerHTML = `<div class="empty">Ninguna iniciativa tiene plan de realización en T01: no se estima nada.</div><div class="grid">${planes}</div>`; return; }
  const G = agruparCurva(cc.serie, state.gran, cc.q0, cc.q1), hoyEt = etiquetaQ(cc.hoy, state.gran), cs = con.map(curva), vans = cs.filter(c => c.van_f7 != null);
  const dv = cs.filter(c => c.desviacion && c.desviacion.plan), dR = sum(dv.map(c => c.desviacion.real)), dP = sum(dv.map(c => c.desviacion.plan)), dPct = dP ? 100 * dR / dP : null;
  $("curva").innerHTML = `<div class="curva">${curvaMini(G, hoyEt)}<div class="d">Neto acumulado (línea) e inversión por tramos (barras) de las iniciativas con plan, por ${GRAN[state.gran].toLowerCase()}; sin plan no se estima.</div></div>
   <div class="grid">
    <div class="tile"><div class="k">Inversión próximos 12 meses</div><div class="v">${fmt(cc.inv_12m)}</div><div class="d">tramos comprometidos o previstos</div></div>
    <div class="tile"><div class="k">Caja que falta por delante</div><div class="v">${fmt(cc.caja_futura)}</div><div class="d">antes de que el acumulado suba</div></div>
    <div class="tile"><div class="k">VAN (F7) ≥ 0</div><div class="v">${vans.length ? `${vans.filter(c => c.van_f7 >= 0).length} <span style="font-size:13px;font-weight:500">de ${vans.length}</span>` : "—"}</div><div class="d">H = ${cfg.horizonte_van_anios ?? "—"} años, r = ${cfg.tasa_descuento_anual_pct || 0} % (C2)</div></div>
    <div class="tile ${dPct == null ? "" : nivelKPI("realizacion_pct", dPct)}"><div class="k">Realización acumulada (F10)</div><div class="v">${dPct == null ? "—" : Math.round(dPct) + " %"}</div><div class="d">${umbralTxt("realizacion_pct")}</div></div>
    ${planes}
   </div>`;
}
function alertas(){
  const out = [], S = n => sum(CASES.map(c=>R(c)[n]||0));
  // indicadores con umbral (meta.umbrales_kpi): mismos cálculos y niveles que las cajas del panel completo
  const ind = indicadores(CASES), pe = ind.pe, tv = pe.total, alto = x => x.nivel==="rojo" || x.nivel==="amarillo";
  if (alto(ind.validado)) out.push([ind.validado.nivel, `Solo el <b>${Math.round(ind.validado.pct)} %</b> del valor actual (${fmt(tv)}) está validado por Control de Gestión (${umbralTxt("valor_validado_pct")}).`]);
  if (alto(ind.clasificados)) out.push([ind.clasificados.nivel, `<b>${ind.clas} de ${ind.n}</b> casos clasificados por la compañía según el Reglamento de IA (${umbralTxt("clasificados_compania_pct")}).`]);
  if (alto(ind.controles)) out.push([ind.controles.nivel, `<b>${ind.ctrl} de ${ind.n}</b> casos con controles completos (${umbralTxt("controles_completos_pct")}).`]);
  const topEf = [...CASES].sort((a,b)=>(R(b).eficiencias||0)-(R(a).eficiencias||0))[0], ef = S("eficiencias");
  if (topEf && ef && (R(topEf).eficiencias||0) / ef > 0.4) out.push(["", `«${esc(topEf.nombre)}» aporta el <b>${Math.round(100*(R(topEf).eficiencias||0)/ef)} %</b> de las eficiencias: el valor está concentrado en un solo caso${TX("nota_concentracion", "")}.`]);
  const negativos = CASES.filter(c=>c.estado==="En uso" && R(c).neto < 0).length;
  if (negativos) out.push(["", `<b>${negativos}</b> ${negativos===1?"caso en uso cuesta más de lo que aporta o no mide su valor":"casos en uso cuestan más de lo que aportan o no miden su valor"}.`]);
  const cap = S("capacidad"); if (cap) out.push(["", `<b>${fmt(cap)}</b> de capacidad liberada no se ha materializado en menor coste.`]);
  const inc = (DATA.seguimiento||{}).incidentes||[], br = inc.filter(x=>x.brecha_datos_personales===true), fuera = br.filter(x=>x.notificacion_aepd_horas==null||x.notificacion_aepd_horas>72).length;
  if (br.length) out.push([fuera?"bad":"", `<b>${br.length}</b> brecha${br.length===1?"":"s"} de datos personales en el periodo${fuera?`, <b>${fuera}</b> sin notificar a la AEPD en 72 h`:""}.`]);
  const agentesSinFicha = CASES.filter(c=>esAgente(c) && c.estado!=="Desenganchado" && (rc(c).agente||{}).acciones==null).length;
  if (agentesSinFicha) out.push(["", `<b>${agentesSinFicha}</b> ${agentesSinFicha===1?"agente o asistente generativo":"agentes y asistentes generativos"} sin ficha de identidad, permisos y control de intención.`]);
  // iniciativas transversales: unidades en uso por debajo del umbral de adopción (licencias activas sobre asignadas)
  const bajas = CASES.flatMap(c=>adopcionBaja(c).map(u=>`${esc(u.unidad)} (${Math.round(adopcionPct(u))} %)`));
  if (bajas.length) out.push(["amarillo", `Adopción por debajo del umbral en ${bajas.join(", ")}: revisar el despliegue o reasignar licencias sin uso.`]);
  // casos atascados: superan el límite de días de su estado (misma regla que el embudo del panel completo)
  const pl = CASES.map(plazoDe), atasR = pl.filter(p=>p.nivel==="rojo").length, atasA = pl.filter(p=>p.nivel==="amarillo").length;
  if (atasR || atasA) out.push([atasR?"rojo":"amarillo", `<b>${atasR}</b> ${atasR===1?"caso supera":"casos superan"} el límite de días de su estado${atasA?` y <b>${atasA}</b> ${atasA===1?"está cerca":"están cerca"}`:""}.`]);
  // plan de realización (D135; mismos cálculos que el panel completo): planes que faltan, tramos sin condición de paso, realización F10
  // por debajo de la tolerancia e iniciativas en producción sostenidas por valor no cuantificado sin la próxima R6 al día
  const deben = CASES.filter(debePlan), conPlan = deben.filter(c => curva(c)), nP = nivelKPI("planes_realizacion_pct", deben.length ? 100 * conPlan.length / deben.length : null);
  if (nP === "rojo" || nP === "amarillo") out.push([nP, `Solo <b>${conPlan.length} de ${deben.length}</b> iniciativas en fases 3 a 7 tienen plan de realización en T01 (${umbralTxt("planes_realizacion_pct")}); sin plan no se estima su curva.`]);
  const hoyQ = trimestre(String(META().generado || "").slice(0,10)) || 0;
  const t12 = conPlan.flatMap(c => curva(c).tramos).filter(x => ["comprometido","previsto"].includes(x.situacion) && x.q > hoyQ && x.q <= hoyQ + 4), sinCond = t12.filter(x => !x.condicion_paso);
  if (sinCond.length) out.push(["amarillo", `<b>${sinCond.length}</b> ${sinCond.length===1?"tramo de financiación":"tramos de financiación"} en los próximos 12 meses (${fmt(sum(sinCond.map(x=>x.importe)))}) sin condición de paso.`]);
  const dvs = conPlan.map(curva).filter(c => c.desviacion && c.desviacion.plan), dvR = sum(dvs.map(c=>c.desviacion.real)), dvP = sum(dvs.map(c=>c.desviacion.plan)), nDv = dvP ? nivelKPI("realizacion_pct", 100*dvR/dvP) : "";
  if (nDv === "rojo" || nDv === "amarillo") out.push([nDv, `Realización acumulada (F10) del <b>${Math.round(100*dvR/dvP)} %</b> frente a la curva de referencia (${umbralTxt("realizacion_pct")}).`]);
  const sost = CASES.filter(c => noMonetario(c).aviso);
  if (sost.length) out.push(["amarillo", `<b>${sost.length}</b> ${sost.length===1?"iniciativa en producción sostenida":"iniciativas en producción sostenidas"} por valor no cuantificado sin la próxima R6 fechada o con la fecha vencida.`]);
  // primero lo más grave: rojo y brechas, después amarillo y el resto (orden estable dentro de cada grupo)
  const peso = cls => cls==="rojo" || cls==="bad" ? 0 : cls==="amarillo" ? 1 : 2;
  return out.map((a,i)=>[a,i]).sort((x,y)=>peso(x[0][0])-peso(y[0][0]) || x[1]-y[1]).map(x=>x[0]).slice(0, 8);
}

function fila(c, valor, meta){
  return `<div class="row" data-id="${c.id}"><div><div class="n">${esc(c.nombre)}</div><div class="m">${meta}</div></div><div class="r">${valor}</div></div>`;
}

function render(){
  const pot = P(), f = fotoComp(), k = n => pot ? n+"_pot" : n;
  const S = n => sum(CASES.map(c=>R(c)[n]||0));
  const SF = n => f ? sum(CASES.map(c=>((f.casos||{})[c.id]||{})[n]||0)) : null;
  const neto = S(k("neto"));
  const H = HIST(), serieV = H.map(h=>sum(Object.values(h.casos||{}).map(x=>x[k("neto")]||0))), serieL = H.map(h=>fES(h.fecha));
  if (!H.length || H[H.length-1].fecha !== DATA.meta.generado){ serieV.push(neto); serieL.push("hoy"); }
  const ind = indicadores(CASES), total = S(k("eficiencias")) + S(k("retorno")), coste = S(k("recurrente"));
  const byE = ["En uso","En desarrollo","POC"].map(e=>`${e==="POC"?"POC":e.toLowerCase()} <b>${CASES.filter(c=>c.estado===e).length}</b>`).join(" · ");
  const nuevos = f ? CASES.filter(c=>esNuevo(c,f)) : [];
  $("resumen").innerHTML = `
   <div class="hero"><div class="k">Neto anual${pot?" potencial":""} de la IA</div><div class="v ${netoCls(neto)}">${fmt(neto)}</div>
     <div class="d">Retorno total ${fmt(total)} − costes ${fmt(coste)} ${dl(neto, SF(k("neto")))}</div>
     <div class="spark">${spark(serieV, serieL)}</div></div>
   <div class="grid">
     <div class="tile"><div class="k">Retorno total</div><div class="v">${fmt(total)}</div><div class="d">eficiencias ${fmt(S(k("eficiencias")))} · retorno ${fmt(S(k("retorno")))} ${f?dl(total, SF(k("eficiencias"))+SF(k("retorno"))):""}</div></div>
     <div class="tile"><div class="k">Costes</div><div class="v">${fmt(coste)}</div><div class="d">coste anual · construcción ${fmt(S("construccion"))} ${dl(coste, SF(k("recurrente")), true)}</div></div>
     ${pot ? `<div class="tile"><div class="k">Inversión adicional</div><div class="v">${fmt(S("adicional"))}</div><div class="d">para llegar al potencial</div></div>`
           : `<div class="tile ${ind.validado.nivel}"><div class="k">Valor validado</div><div class="v">${ind.validado.pct==null?"—":Math.round(ind.validado.pct)+" %"}</div><div class="d">del valor actual · ${umbralTxt("valor_validado_pct")}</div></div>`}
     <div class="tile ${ind.controles.nivel}"><div class="k">Controles completos</div><div class="v">${ind.ctrl} <span style="font-size:13px;font-weight:500">de ${ind.n}</span></div><div class="d">${umbralTxt("controles_completos_pct")}</div></div>
   </div>
   <div class="estados">${CASES.length} casos: ${byE}${f?` · <b>${nuevos.length}</b> nuevos desde el ${fES(f.fecha)}`:""}</div>`;

  // qué frena el escalado (D126; mismas reglas que el panel completo, documento 60 §10.4): los tres frenos por los que empezar
  const FR = FR_M = frenosEscalado(CASES);
  $("frenos").innerHTML = (FR.prioridad.length ? FR.prioridad.map((f,i)=>`<div class="row fr" data-fr="${f.id}"><div style="flex:1;min-width:0"><div class="n">${i+1}. ${f.id} · ${esc(f.nombre)}</div><div class="m">${esc(f.accion)}</div><div class="m"><b>Quién:</b> ${esc(f.resp)}${f.casos.length?` · ${f.casos.length} ${f.casos.length===1?"caso":"casos"}`:""}${f.valor!=null?` · ${fmt(f.valor)} en juego`:""}</div></div><div class="r">${f.nivel==="bloquea"?`<span class="badge rojo">bloquea</span>`:`<span class="badge amarillo">señales</span>`}</div></div>`).join("")
    : `<div class="empty">Ningún freno con señales.</div>`) + (FR.faltan.length ? `<div class="empty">${FR.faltan.map(esc).join(" ")}</div>` : "");
  document.querySelectorAll(".row.fr").forEach(r=>r.onclick=()=>freno(r.dataset.fr));
  // dónde está el impacto (T16; D127; mismas reglas que el mapa del panel completo, documento 10 §8): una fila por esfera
  const MI = mapaImpacto(CASES, "esfera"), misec = $("impacto-sec");
  misec.hidden = !CASES.some(c=>(c.tags||{}).funcion);
  if (!misec.hidden) $("impacto").innerHTML = MI.filas.map(f=>`<div class="row" style="cursor:default"><div style="flex:1;min-width:0"><div class="n">${esc(f.etiqueta)}</div><div class="m">${f.total.casos.length ? `${f.total.casos.length} ${f.total.casos.length===1?"caso":"casos"}: ${MI.cols.filter(a=>f.celdas[a].casos.length).map(a=>`${esc(a)} ${f.celdas[a].casos.length}`).join(" · ")}` : "sin actividad"}${f.objetivo?` · objetivo C2: ${esc(f.objetivo==="no_prioritaria"?"no prioritaria":f.objetivo)}`:""}${f.brecha?` <span class="badge rojo">brecha</span>`:""}</div></div><div class="r">${f.total.casos.length?`<b>${f.total.pct==null?"—":Math.round(f.total.pct)+" %"}</b><div class="m">${f.total.neto != null ? `neto ${fmt(f.total.neto)}` : "aún no produce"}</div>`:""}</div></div>`).join("")
    + (MI.banda.casos.length ? `<div class="empty">Banda de habilitación (${MI.bandaFilas.map(esc).join(" y ")}): ${MI.banda.casos.length} ${MI.banda.casos.length===1?"caso":"casos"}, fuera del total.</div>` : "");

  renderCurva();
  const al = alertas();
  $("alertas").innerHTML = al.length ? al.map(([cls,txt])=>`<div class="alert ${cls}">${txt}</div>`).join("") : `<div class="empty">Sin alertas.</div>`;

  const top = [...CASES].filter(c=>R(c)[k("neto")] > 0).sort((a,b)=>R(b)[k("neto")] - R(a)[k("neto")]).slice(0,5);
  // embudo compacto: casos ahora en cada etapa, los que la alcanzaron, mediana de días y atascados; salidas debajo
  const cfgC = CICLO(), embE = cfgC.embudo, base = Math.max(1, CASES.filter(c=>etapaAlcanzada(c) >= 0).length);
  // el embudo solo contiene los casos al vuelo; la etapa ganada (en uso) y las salidas van debajo: son los que ya lo atravesaron o no pasaron
  const ganE = cfgC.ganado, nGan = CASES.filter(c=>c.estado===ganE).length, llegaronE = CASES.filter(c=>etapaAlcanzada(c) >= embE.indexOf(ganE)).length;
  // cifras mínimas de los casos de una etapa: lo actual y, si aún no lo hay, lo previsto (misma regla que el panel completo)
  const cifM = cs => { const s = (a,p)=>{ const xs = cs.map(c=>R(c)[a] ?? R(c)[p]).filter(v=>v != null); return xs.length ? sum(xs) : null; };
    const ef = s("eficiencias","eficiencias_pot"), rt = s("retorno","retorno_pot"), co = s("recurrente","recurrente_pot"), pv = cs.some(c=>R(c).eficiencias == null && R(c).retorno == null);
    const p = [ef!=null?`efic. ${fmt(ef)}`:"", rt!=null?`ret. ${fmt(rt)}`:"", co!=null?`coste ${fmt(co)}/año`:""].filter(Boolean); return p.length ? p.join(" · ") + (pv?" (previsto)":"") : ""; };
  $("embudo").innerHTML = embE.map((e,i)=>{ if (esGanado(e)) return ""; const ahora = CASES.filter(c=>c.estado===e), alc = CASES.filter(c=>etapaAlcanzada(c) >= i).length, t = tiemposEstado(CASES, e).todas, pls = ahora.map(plazoDe), r = pls.filter(p=>p.nivel==="rojo").length, a = pls.filter(p=>p.nivel==="amarillo").length;
      return `<div class="row fun" data-etapa="${esc(e)}"><div style="flex:1;min-width:0"><div class="n">${esc(e)} <span class="m">· ${ahora.length} ahora</span></div><div class="funbar"><i style="width:${Math.round(100*alc/base)}%"></i></div><div class="m">alcanzaron ${alc} · ${t?`mediana ${t.mediana} d · media ${t.media} d`:"sin fechas"}</div>${cifM(ahora)?`<div class="m">${cifM(ahora)}</div>`:""}</div><div class="r">${r?`<span class="badge rojo">${r} fuera</span>`:""}${a?`<span class="badge amarillo">${a} cerca</span>`:""}</div></div>`; }).join("")
    + `<div class="row fun gan" data-etapa="${esc(ganE)}"><div><div class="n">${esc(ganE)} <span class="m">· ${nGan} ahora</span></div><div class="m">ya atravesaron el embudo · llegaron a producción ${llegaronE}</div><div class="m">${cifM(CASES.filter(c=>c.estado===ganE))}</div></div></div>`
    + `<div class="row"><div><div class="n">No pasaron o se desengancharon</div><div class="m">${SALIDAS().map(s=>`${esc(s)} ${CASES.filter(c=>c.estado===s).length}`).join(" · ")}</div>`
      // de cada caso perdido o desenganchado, lo esencial: por qué salió (si no consta, se dice)
      + CASES.filter(c=>esSalida(c.estado)).map(c=>{ const r = rc(c).retirada || {}; return `<div class="m pq"><b>${esc(c.nombre)}</b> · ${esc(c.estado)}<br><b>Por qué:</b> ${r.motivo?esc(r.motivo):"sin motivo registrado"}${r.lecciones?`<br><b>Qué se aprendió:</b> ${esc(r.lecciones)}`:""}</div>`; }).join("")
      + `</div></div>`;
  document.querySelectorAll(".row.fun").forEach(r=>r.onclick=()=>etapa(r.dataset.etapa));
  $("top").innerHTML = top.length ? top.map(c=>{ const fc = fotoCaso(c); return fila(c, `<b class="${netoCls(R(c)[k("neto")])}">${fmt(R(c)[k("neto")])}</b><div>${fc?dl(R(c)[k("neto")], fc[k("neto")]):""}</div>`, `${esc(c.estado)} · ${estadoTxt(c)}`); }).join("") : `<div class="empty">Ningún caso con neto positivo.</div>`;

  const cand = CASES.filter(c=>R(c).adicional && R(c).neto_adicional > 0).sort((a,b)=>R(b).rendimiento_adicional - R(a).rendimiento_adicional).slice(0,5);
  $("rinde").innerHTML = cand.length ? cand.map(c=>fila(c, `<b>${rend(R(c).rendimiento_adicional)}</b><div class="m">${fmt(R(c).adicional)} → +${fmt(R(c).neto_adicional)}/año</div>`, `plazo ${esc(eco(c).plazo_potencial||"sin fijar")}`)).join("") : `<div class="empty">Sin inversión adicional estimada.</div>`;

  // iniciativas transversales y plataformas (casos[].alcance, opcional): por unidad, adopción, coste y valor materializado
  const ts = CASES.filter(alcanceDe), tsec = $("transv-sec");
  tsec.hidden = !ts.length;
  if (ts.length){
    const DSP = {previsto:"prevista", piloto:"piloto", en_uso:"en uso", retirado:"retirada"};
    const netoSin = sum(CASES.filter(c=>!alcanceDe(c)).map(c=>R(c)[k("neto")]||0));
    $("transv").innerHTML = `<div class="m" style="padding:0 2px 6px">Neto anual${pot?" potencial":""} de la cartera sin ${ts.length === 1 ? "ella" : "ellas"}: <b>${fmt(netoSin)}</b></div>` + ts.map(c=>{ const a = c.alcance;
      const us = a.tipo === "plataforma" ? `<div class="m">la usan: ${(a.habilita||[]).map(h=>esc(h.id)).join(", ") || "ningún caso"}</div>`
        : (a.unidades||[]).filter(u=>u.unidad != null).map(u=>{ const p = adopcionPct(u), bajo = a.umbral_adopcion_pct != null && u.estado === "en_uso" && p != null && p < a.umbral_adopcion_pct;
            return `<div class="m">${esc(u.unidad)} · ${DSP[u.estado]||esc(u.estado||"")}${p!=null?` · <span class="${bajo?"badge rojo":""}">${Math.round(p)} % licencias</span>`:""}${u.coste_anual!=null?` · coste ${fmt(u.coste_anual)}`:""}${u.valor_materializado!=null?` · materializado ${fmt(u.valor_materializado)}`:""}</div>`; }).join("");
      return `<div class="row" data-id="${c.id}"><div style="flex:1;min-width:0"><div class="n">${esc(c.nombre)}</div><div class="m">${esc(c.tags.alcance||"")} · neto ${fmt(R(c)[k("neto")])}</div>${us}</div></div>`; }).join("");
  }

  // madurez de la compañía (bloque «madurez», opcional; documento 11 de SEVEN-G, diagnóstico T15): nivel global, fecha,
  // modalidad y las siete dimensiones; el motor solo lee el bloque, no recalcula nada. Sin bloque, la sección no se muestra.
  const md = DATA.madurez, msec = $("madurez-sec"), mdims = md && Array.isArray(md.dimensiones) ? md.dimensiones : [];
  msec.hidden = !mdims.length;
  if (mdims.length){
    const NIV = ["Inexistente", "Inicial", "En desarrollo", "Definido", "Gestionado", "Optimizado"], MOD = {autodiagnostico:"autodiagnóstico", verificada:"verificada", independiente:"valoración independiente"};
    const ng = md.nivel_global, ant = md.anterior || null;
    const cab = [`datos a ${fES(md.fecha_corte)}`, MOD[md.modalidad] || esc(md.modalidad || ""), md.tope_aplicado ? `limitado por ${(md.limitante||[]).map(esc).join(", ")}` : "", ant && ant.nivel_global != null ? `anterior (${fES(ant.fecha_corte)}): nivel ${ant.nivel_global}` : ""].filter(Boolean).join(" · ");
    const aviso = md.modalidad === "autodiagnostico" ? `<div class="alert bad" style="margin-top:8px">Autoevaluación no verificada: no vale para el consejo (11 §4.1).</div>` : md.validez === "pend" ? `<div class="alert" style="margin-top:8px">Verificación incompleta.</div>` : "";
    const fil = d => `<div class="row" style="cursor:default"><div style="flex:1;min-width:0"><div class="n">${esc(d.dimension||"")} · ${esc(d.nombre||"")}</div>${(d.bloqueantes||[]).length ? `<div class="m">bloqueantes: ${d.bloqueantes.map(esc).join(", ")}</div>` : ""}</div><div class="r"><b>${d.nivel == null ? "—" : d.nivel}</b><div class="m">${d.nivel == null ? "sin dato" : NIV[d.nivel] || ""}</div></div></div>`;
    $("madurez").innerHTML = `<div class="hero" style="margin-top:0"><div class="k">Nivel global de madurez (0–5)</div><div class="v">${ng == null ? "—" : ng} <span style="font-size:16px;font-weight:600">${ng == null ? `sin dato${md.nivel_minimo != null ? ` · mínimo ${md.nivel_minimo}` : ""}` : NIV[ng] || ""}</span></div><div class="d">${cab}</div>${aviso}</div>
     <div class="list" style="margin-top:10px">${mdims.map(fil).join("")}</div>
     <div class="d" style="font-size:12px;color:var(--muted);margin-top:6px">Declaración de aplicación de SEVEN-G: ${md.declaracion_posible ? "posible" : "no procede todavía"} (11 §7.3). El nivel global se limita a min(D1, D6) + 1.</div>`;
    // perfiles NIST (opcional, esquema 0.7 de T01, D115)
    const PMD = {ai_rmf:"NIST AI RMF", csf:"NIST CSF 2.0 (perfil en borrador)"};
    const pfs = md.perfiles ? Object.keys(PMD).filter(k=>md.perfiles[k] && md.perfiles[k].total) : [];
    // tres lentes (opcional, esquema 0.8 de T01, D120): una línea por lente
    const le = md.lentes && typeof md.lentes === "object" ? md.lentes : null;
    if (le){ const HTM = {HT0:"Sin IA en uso", HT1:"Automatización sin aprendizaje", HT2:"IA de terceros incluida", HT3:"Modelos predictivos propios", HT4:"IA generativa en procesos", HT5:"Agentes que actúan"}, ALM = {adopcion_por_delante:"Adopción por delante del gobierno", gobierno_sin_uso:"Gobierno sin uso", transformacion_sin_personas:"Transformación sin personas"}, hu = le.huella, al = le.alcance;
      const lin = (n, v, m) => `<div class="row" style="cursor:default"><div style="flex:1;min-width:0"><div class="n">${n}</div><div class="m">${m}</div></div><div class="r"><b>${v}</b></div></div>`;
      $("madurez").innerHTML += `<div class="list" id="madurez-lentes" style="margin-top:10px">` +
        lin("Lente 1 · Capacidad de gobierno", ng == null ? "—" : ng, "nivel global de madurez (0–5)") +
        lin("Lente 2 · Huella tecnológica", hu && hu.nivel ? esc(hu.nivel) : "—", hu && hu.nivel ? `${HTM[hu.nivel] || ""}${hu.pilotos != null ? ` · ${hu.pilotos} en exploración` : ""}${le.exigible && Object.keys(le.exigible).length ? ` · exige ${Object.keys(le.exigible).map(d=>`${esc(d)} ≥ ${le.exigible[d]}`).join(", ")}` : ""}` : "sin dato") +
        lin("Lente 3 · Alcance del impacto", al ? Object.keys(al).reduce((s,k)=>s+(Number(al[k])||0), 0) : "—", al ? `iniciativas en uso: ${Object.keys(al).map(k=>`${esc(k)} ${al[k]}`).join(" · ")} (IM1 tarea · IM2 proceso · IM3 personas · IM4 negocio)` : "sin dato") +
        `</div>` + ((le.alertas||[]).length ? le.alertas.map(a=>`<div class="alert ${a.gravedad === "alta" ? "bad" : ""}" style="margin-top:8px" data-alerta="${esc(a.codigo||"")}">${ALM[a.codigo] || esc(a.codigo||"")} (gravedad ${a.gravedad === "alta" ? "alta" : "media"})${a.dimension ? `: ${esc(a.dimension)} en ${a.nivel}${a.minimo != null ? `, la huella exige ${a.minimo}` : ""}` : ""}.</div>`).join("") : ""); }
    if (pfs.length) $("madurez").innerHTML += `<div class="list" id="madurez-perfiles" style="margin-top:10px">${pfs.map(k=>{ const g = md.perfiles[k].total; return `<div class="row" style="cursor:default"><div style="flex:1;min-width:0"><div class="n">${PMD[k]}</div><div class="m">${g.con_nivel} de ${g.subcategorias} subcategorías con nivel · ${g.con_brecha} con brecha</div></div><div class="r"><b>${g.minimo == null ? "—" : g.minimo}</b><div class="m">nivel mínimo</div></div></div>`; }).join("")}</div>`;
  }

  const sec = $("novedades-sec");
  if (f){
    const fx = f.casos||{}, ids = new Set(nuevos.map(c=>c.id));
    const cambios = CASES.filter(c=>fx[c.id] && fx[c.id].estado !== c.estado && !ids.has(c.id));
    const bajas = Object.entries(fx).filter(([id,x])=>!CASES.some(c=>c.id===id));
    const items = [...nuevos.map(c=>fila(c, `<span class="badge">${fx[c.id]?"a producción":"nuevo"}</span>`, `${esc(c.estado)}`)), ...cambios.map(c=>fila(c, `<span class="badge">${esc(fx[c.id].estado)} → ${esc(c.estado)}</span>`, "cambio de estado")),
                   ...bajas.map(([id,x])=>`<div class="row"><div><div class="n">${esc(x.nombre||id)}</div><div class="m">retirado</div></div><div class="r"><span class="badge">baja</span></div></div>`)];
    $("novedades-t").textContent = `Novedades desde la foto del ${fES(f.fecha)}`;
    $("novedades").innerHTML = items.length ? items.slice(0,8).join("") : `<div class="empty">Sin altas, bajas ni cambios de estado.</div>`;
    sec.hidden = false;
  } else sec.hidden = true;

  $("pie").innerHTML = `Datos generados el ${fES(DATA.meta.generado)} · versión ${esc(String(DATA.meta.version_panel||""))} · ${H.length} foto${H.length===1?"":"s"} en el histórico. Valor actual declarado por la compañía para ${YEAR}; coste y potencial estimados por el ${CONSEJO()} salvo que se indique. El detalle completo (fichas, riesgo y cumplimiento, agentes, cuadro de mando de la compañía) está en el panel del Consejo: <a href="${esc(DATA.meta.panel_completo||"")}?completo=1"><b>${esc(DATA.meta.panel_completo||"")}</b></a> (pensado para pantalla grande).`;
  document.querySelectorAll(".row[data-id]").forEach(r=>r.onclick=()=>ficha(CASES.find(c=>c.id===r.dataset.id)));
}

function ficha(c){
  const r = R(c), e = eco(c), fp = fechaProd(c), fc = fotoCaso(c);
  const filaT = (lab, a, p, menos) => `<tr><td>${lab}</td><td>${fmt(a)}</td><td>${fmt(p)}</td></tr>`;
  $("sheetbox").innerHTML = `<button class="close" onclick="cerrar()">Cerrar</button><h3>${esc(c.nombre)}</h3>
   ${c.que_es?`<p style="font-size:14px;margin:6px 0 4px">${esc(c.que_es)}</p>`:""}
   <div class="sub">${c.id} · ${esc(c.estado)} · producción ${fp.f?(fp.est?fp.f+" (año estimado)":fES(fp.f)):"—"} · valor ${estadoTxt(c)==='sin dato'?'sin medir':estadoTxt(c)}</div>
   <table><thead><tr><th></th><th>Actual</th><th>Potencial</th></tr></thead><tbody>
    ${filaT("Coste anual", r.recurrente||0, r.recurrente_pot||0)}${filaT("Eficiencias", r.eficiencias||0, r.eficiencias_pot||0)}${filaT("Retorno", r.retorno||0, r.retorno_pot||0)}
    <tr><td><b>Neto anual</b></td><td><b class="${netoCls(r.neto)}">${fmt(r.neto)}</b></td><td><b class="${netoCls(r.neto_pot)}">${fmt(r.neto_pot)}</b></td></tr></tbody></table>
   <div class="sub" style="margin-top:10px">${r.capacidad?`Capacidad liberada no materializada: ${fmt(r.capacidad)}. `:""}Inversión adicional ${fmt(r.adicional)} · ${rend(r.rendimiento_adicional)} · plazo ${esc(e.plazo_potencial||"sin fijar")}${fc?` · neto frente a la foto ${dl(r.neto, fc.neto)}`:""}</div>
   ${e.hipotesis_potencial?`<p style="font-size:13.5px;color:var(--ink2);margin:10px 0 0">${esc(e.hipotesis_potencial)}</p>`:""}
   ${(()=>{ const cu = curva(c), nm = noMonetario(c), cfg = cfgCurva();
      const plan = !cu ? (debePlan(c) ? `<h4>Plan de realización</h4><div class="sub">Sin plan de realización en T01: no se estima.</div>` : "")
        : `<h4>Plan de realización</h4><div class="sub">VAN (F7) <b>${cu.van_f7 == null ? "sin H de C2" : fmt(cu.van_f7)}</b> (H = ${cfg.horizonte_van_anios ?? "—"}, r = ${cfg.tasa_descuento_anual_pct || 0} %) · recupera: ${esc(pbTxt(cu))} · caja máxima ${fmt(cu.caja_max)}${cu.desviacion&&cu.desviacion.pct!=null?` · realización <span class="badge ${nivelDesv(cu)}">${Math.round(cu.desviacion.pct)} %</span>`:""}</div>`
          + (cu.tramos.filter(x => x.situacion !== "ejecutado").length ? `<table><thead><tr><th>Tramo pendiente</th><th>Importe</th><th>€/€</th></tr></thead><tbody>${cu.tramos.filter(x => x.situacion !== "ejecutado").map(x=>`<tr><td>${esc(x.periodo)}${x.gate?" · "+esc(x.gate):""} · ${esc(SIT_TRAMO[x.situacion]||x.situacion)}<div style="font-size:12px;color:var(--muted)">${x.condicion_paso?"condición: "+esc(x.condicion_paso):"sin condición de paso"}</div></td><td>${fmt(x.importe)}</td><td>${x.rendimiento==null?"—":rend(x.rendimiento)}</td></tr>`).join("")}</tbody></table>` : "");
      const nc = nm.dimensiones.length ? `<h4>Valor no cuantificado</h4><div class="sub">${nm.dimensiones.map(d=>`${esc(dimNM(d.dimension))}: <b>${esc(NIVEL_NM[d.nivel])}</b>${d.indicador?` (${esc(d.indicador)}${d.actual!=null?`: ${esc(d.actual)}`:""})`:" · sin métrica, no cuenta"}`).join("<br>")}${nm.estrategico?`<br><span class="badge ${nm.aviso?"amarillo":"ok"}">sostenido por valor no cuantificado · ${nm.revision?"R6 "+fES(nm.revision):"sin R6 fechada"}</span>`:""}</div>` : "";
      return plan + nc; })()}
   ${(()=>{ const h = historial(c), p = plazoDe(c); if (!h.tramos.length) return `<div class="sub" style="margin-top:10px">Recorrido por estados: sin fechas reportadas.</div>`;
      return `<div class="sub" style="margin-top:10px">Recorrido: ${h.tramos.map(t=>`${esc(t.estado)} ${t.dias==null?"":t.dias+" d"}`).join(" → ")}${p.limite?` · <span class="badge ${p.nivel}">${p.dias} de ${p.limite} d</span>`:""}</div>`; })()}`;
  $("sheet").classList.add("open");
}
// códigos citados (D99): con meta.navegacion.codigos (ruta al índice de códigos del sitio, codigos.js), los códigos escritos en el panel pasan
// a ser enlaces a donde se explican y la cabecera ofrece «Ir a código» y «Citados aquí». Se carga sin medición de visitas. Sin la clave, nada cambia.
(()=>{ const nv = (DATA.meta||{}).navegacion || {}; if (!nv.codigos) return;
  document.body.setAttribute("data-enlazar-codigos", "");
  const c = document.querySelector("header .ctrls"); if (c){ const h = document.createElement("div"); h.setAttribute("data-ir-codigo", ""); h.className = "ir-codigo-panel"; c.after(h); }
  let en = new URLSearchParams(location.search).get("lang"); if (en !== "es" && en !== "en") { try { en = localStorage.getItem("seveng-idioma"); } catch (e) { en = null; } }
  const s = document.createElement("script"); s.src = en === "en" ? String(nv.codigos).replace("/html/es/", "/html/en/") : nv.codigos; s.defer = true; s.setAttribute("data-sin-medicion", ""); document.head.appendChild(s); })();
// casos de una etapa del embudo, ordenados por días en la etapa, con su desviación frente a la mediana
function etapa(e){
  const cs = CASES.filter(c=>c.estado===e).map(c=>({c, p: plazoDe(c)})).sort((a,b)=>(b.p.dias??-1)-(a.p.dias??-1)), t = tiemposEstado(CASES, e).todas;
  $("sheetbox").innerHTML = `<button class="close" onclick="cerrar()">Cerrar</button><h3>${esc(e)}: ${cs.length} casos</h3>
   <div class="sub">${t?`mediana ${t.mediana} d · media ${t.media} d (${t.n} estancias)`:"sin fechas de cambio de estado"}</div>
   <div class="list" style="margin-top:10px">${cs.map(({c,p})=>`<div class="row" data-id="${c.id}"><div><div class="n">${esc(c.nombre)}</div><div class="m">${p.desde?`desde ${fES(p.desde)}`:"sin fechas"}${p.limite?` · límite ${p.limite} d`:""}</div></div><div class="r"><b>${p.dias==null?"—":p.dias+" d"}</b>${p.dias!=null&&t?`<div class="m">${p.dias-t.mediana>0?"+":""}${p.dias-t.mediana} d vs mediana</div>`:""}${p.nivel==="rojo"||p.nivel==="amarillo"?`<div><span class="badge ${p.nivel}">${p.nivel==="rojo"?"fuera de plazo":"cerca del límite"}</span></div>`:""}</div></div>`).join("")||`<div class="empty">Ningún caso.</div>`}</div>`;
  $("sheet").classList.add("open");
  document.querySelectorAll("#sheetbox .row[data-id]").forEach(r=>r.onclick=()=>ficha(CASES.find(c=>c.id===r.dataset.id)));
}
// un freno de escalado: qué hacer, quién y sus señales, con los casos (que abren su ficha)
let FR_M = null;
function freno(id){
  const f = (FR_M || {frenos:[]}).frenos.find(x=>x.id===id); if (!f) return;
  const sen = f.senales.map(s=>`<div class="row" style="cursor:default;display:block"><div class="m">${s.empresa?"compañía · ":s.patron?"patrón · ":""}${s.txt}${s.bloquea?` · <b>bloquea ${esc(s.bloquea)}</b>`:""}</div>${s.patron?"":s.casos.map(c=>`<div class="row" data-id="${c.id}" style="padding:6px 0;min-height:0"><div class="n" style="font-size:13px">${esc(c.nombre)}</div><div class="r m">${esc(c.estado)}</div></div>`).join("")}</div>`).join("");
  $("sheetbox").innerHTML = `<button class="close" onclick="cerrar()">Cerrar</button><h3>${f.id} · ${esc(f.nombre)}</h3>
   <div class="sub">${f.casos.length} ${f.casos.length===1?"caso afectado":"casos afectados"}${f.valor!=null?` · ${fmt(f.valor)} de valor anual en juego (declarado)`:""}</div>
   <p style="font-size:14px;margin:10px 0 4px"><b>Qué hacer:</b> ${esc(f.accion)}</p><p style="font-size:13.5px;margin:0 0 8px;color:var(--ink2)"><b>Quién:</b> ${esc(f.resp)} · dónde se explica: ${esc(f.donde)}</p>
   <div class="list">${sen || `<div class="empty">Sin señales.</div>`}</div>`;
  $("sheet").classList.add("open");
  document.querySelectorAll("#sheetbox .row[data-id]").forEach(r=>r.onclick=()=>ficha(CASES.find(c=>c.id===r.dataset.id)));
}
function cerrar(){ $("sheet").classList.remove("open"); }
// enlaces de vuelta al sitio (D141): con meta.navegacion.sitio, la cabecera lleva los mismos enlaces que el menú del panel completo (portada,
// cabecera de SEVEN-G, biblioteca…), en el idioma del sitio (texto_en y href_en con «?lang=en» o «seveng-idioma», D137). Sin la clave, nada cambia.
(()=>{ const nv = (DATA.meta||{}).navegacion || {}; if (!Array.isArray(nv.sitio) || !nv.sitio.length) return;
  let l = new URLSearchParams(location.search).get("lang"); if (l !== "es" && l !== "en") { try { l = localStorage.getItem("seveng-idioma"); } catch (e) { l = null; } }
  const en = l === "en", n = document.createElement("nav"); n.className = "sitio-m"; n.setAttribute("aria-label", en ? "Site" : "Sitio");
  nv.sitio.forEach(x=>{ if (!x || !x.href) return; const a = document.createElement("a"), tx = (en && x.texto_en) || x.texto || x.href;
    a.href = (en && x.href_en) || x.href; a.textContent = tx; a.title = tx; n.appendChild(a); });
  const sub = document.querySelector("header .sub"); if (sub) sub.after(n); })();
// tema (D87, D141): el botón de la cabecera alterna claro (papel salmón) y oscuro, y se recuerda en «dashboard-theme», la misma clave del panel
// completo. Con meta.navegacion.tema_sitio (clave del tema general del sitio: salmon, claro o noche) sigue y actualiza ese tema. Sin elección, sigue al sistema.
(()=>{ const clave = ((DATA.meta||{}).navegacion||{}).tema_sitio || null, r = document.documentElement, b = $("tema-m");
  const leer = k=>{ try { return localStorage.getItem(k); } catch (e) { return null; } };
  const de = v=> v === "dark" || v === "noche" ? "dark" : v ? "light" : null;
  const ini = (clave && de(leer(clave))) || de(leer("dashboard-theme")); if (ini) r.setAttribute("data-theme", ini);
  const oscuro = ()=> r.getAttribute("data-theme") ? r.getAttribute("data-theme") === "dark" : matchMedia("(prefers-color-scheme: dark)").matches;
  const rot = ()=>{ if (!b) return; const o = oscuro(); b.textContent = o ? "☀" : "☾"; b.title = o ? "Cambiar a tema claro" : "Cambiar a tema oscuro"; b.setAttribute("aria-label", b.title); };
  if (b) b.onclick = ()=>{ const t = oscuro() ? "light" : "dark"; r.setAttribute("data-theme", t);
    try { const prev = leer("dashboard-theme"); localStorage.setItem("dashboard-theme", t === "dark" ? "dark" : (prev === "light" ? "light" : "salmon"));
      if (clave){ const v = leer(clave); localStorage.setItem(clave, t === "dark" ? "noche" : (v === "claro" ? "claro" : "salmon")); } } catch (e) {}
    rot(); };
  rot(); })();
// «?» de cada sección: qué muestra y por qué importa (meta.navegacion.ayuda_tarjetas, D122); se abre en la misma hoja inferior que las fichas
if (((DATA.meta||{}).navegacion||{}).ayuda_tarjetas) vigilarAyudas(document.querySelector(".wrap"), html=>{ $("sheetbox").innerHTML = `<button class="close" onclick="cerrar()">Cerrar</button>` + html; $("sheet").classList.add("open"); });
$("sheet").onclick = e=>{ if (e.target === $("sheet")) cerrar(); };

function fillCompara(){ const s = $("compara"), H = HIST(); s.innerHTML = `<option value="">Sin comparar</option>` + [...H].reverse().map(h=>`<option value="${h.fecha}">Frente a ${fES(h.fecha)}</option>`).join(""); s.value = state.compara; s.disabled = !H.length; }
$("compara").onchange = e=>{ state.compara = e.target.value; render(); };
document.querySelectorAll("#gran button").forEach(b=>b.onclick=()=>{ state.gran = b.dataset.g; renderCurva(); });
document.querySelectorAll("#lado button").forEach(b=>b.onclick=()=>{ state.lado = b.dataset.l; document.querySelectorAll("#lado button").forEach(x=>x.classList.toggle("on", x===b)); render(); });
if (location.protocol.startsWith("http") && META().leer_json_servidor !== false) { fetch("dashboard_data.json", {cache:"no-store"}).then(r=>r.ok?r.json():null).then(j=>{ if (j && j.casos){ DATA = normalize(j); DATA.meta.version_panel = DATA.meta.version_panel || __VERSION__; DATA.meta.panel_completo = DATA.meta.panel_completo || "__COMPLETO__"; CASES = DATA.casos; RES = new WeakMap(); HIS = new WeakMap(); CUR = new WeakMap(); NMC = new WeakMap(); fillCompara(); render(); } }).catch(()=>{}); }
fillCompara(); render();
"""

HTML = """<!DOCTYPE html>
<html lang="es"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<meta name="panel-datos" content="__HASH__">
<title>IA · Panel móvil del Consejo · __ORG__</title>
<style>__CSS__</style></head>
<body>
<header><div class="in"><h1>IA · Panel móvil del Consejo</h1><div class="sub">__ORG__ · __CONSEJO__ · versión __VERSION__ · datos del __FECHA__</div>
 <div class="ctrls"><div class="seg" id="lado"><button class="on" data-l="actual">Actual</button><button data-l="potencial">Potencial</button></div><select id="compara" aria-label="Comparar con una foto guardada"></select><button type="button" class="tema-m" id="tema-m" aria-label="Cambiar el tema">☾</button></div></div></header>
<div class="wrap">
 <div id="resumen" data-ayuda="m-resumen"></div>
 <h2 data-ayuda="m-frenos">Qué frena el escalado</h2><div class="list" id="frenos"></div>
 <h2 data-ayuda="m-alertas">Alertas</h2><div id="alertas"></div>
 <div class="h2row"><h2 data-ayuda="m-curva">Plan de realización de la cartera</h2><div class="seg mini" id="gran" aria-label="Periodo de la curva"><button data-g="anual">Año</button><button data-g="semestral">Sem.</button><button data-g="trimestral">Trim.</button></div></div><div id="curva"></div>
 <h2 data-ayuda="m-embudo">Embudo de casos</h2><div class="list" id="embudo"></div>
 <section id="impacto-sec" hidden><h2 data-ayuda="m-impacto">Dónde está el impacto</h2><div class="list" id="impacto"></div></section>
 <h2 data-ayuda="m-top">Casos que más aportan</h2><div class="list" id="top"></div>
 <h2 data-ayuda="m-rinde">Dónde rinde más el siguiente euro</h2><div class="list" id="rinde"></div>
 <section id="transv-sec" hidden><h2 data-ayuda="transv">Transversales y plataformas, por unidad</h2><div class="list" id="transv"></div></section>
 <section id="madurez-sec" hidden><h2 data-ayuda="madurez">Madurez de la compañía (D1–D7)</h2><div id="madurez"></div></section>
 <section id="novedades-sec" hidden><h2 id="novedades-t" data-ayuda="m-novedades">Novedades</h2><div class="list" id="novedades"></div></section>
 __GLOSARIO__
 <div class="foot" id="pie"></div>
</div>
<div class="sheet" id="sheet"><div class="box" id="sheetbox"></div></div>
<script>__JS__</script>
</body></html>"""


def build(data_json, core_js, version, fecha, completo, glosario_html, glosario_css, hash_datos, org="la organización", consejo="consejo asesor", glosario_extra=None):
    js = (JS.replace("__CORE__", core_js).replace("__VERSION__", str(version)).replace("__COMPLETO__", completo)
            .replace("__DATA__", data_json))
    terminos = set(TERMINOS_MOVIL) | {x[1] for x in (glosario_extra or []) if len(x) > 4 and x[4]}
    return (HTML.replace("__CSS__", CSS + glosario_css + ayuda_tarjetas.CSS).replace("__GLOSARIO__", glosario_html(terminos, extra=glosario_extra))
                .replace("__ORG__", org).replace("__CONSEJO__", consejo)
                .replace("__VERSION__", str(version)).replace("__FECHA__", fecha).replace("__HASH__", hash_datos)
                .replace("__JS__", js))
