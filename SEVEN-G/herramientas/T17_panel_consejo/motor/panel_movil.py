# Copia mantenida en AI_CONSULTING (SEVEN-G, T17) desde 17-09-2026; origen: AI_en_el_consejo/motor (MIT, mismo autor).
# -*- coding: utf-8 -*-
"""Panel movil del Consejo: version resumida del panel completo, para consultar en el telefono.

Lo genera build_dashboard.py junto al panel completo, desde el mismo dashboard_data.json y con el mismo nucleo
de calculo (panel_core.py), con el mismo numero de version. Muestra solo lo esencial: neto y sus componentes,
calidad del dato, alertas, principales casos, donde rinde mas la inversion adicional, novedades frente a una foto
y tendencia. El detalle (fichas completas, riesgo, agentes, CdM de la compania) queda en el panel completo.

Regla: cualquier cambio en un panel se analiza por si debe reflejarse en el otro. Nada especifico de una organizacion
vive en el codigo: sale de meta en el JSON.
"""

TERMINOS_MOVIL = {"VNB", "Neto anual", "Eficiencias", "Retorno", "Capacidad liberada", "Potencial",
                  "Neto adicional por euro invertido", "Estado del dato", "Valor imputado", "Foto (histórico)", "Puesta en producción",
                  "Inversión", "Consejo asesor", "IA", "Brecha de datos personales", "AEPD"}

CSS = r"""
:root{color-scheme:light;--page:#f6f5f1;--surface:#ffffff;--ink:#101114;--ink2:#4b4f58;--muted:#80848c;--grid:#e4e2dc;--line:#e4e2dc;--card:#ffffff;
 --s1:#2a78d6;--s2:#eb6834;--s3:#1baf7a;--seq250:#86b6ef;--good:#0a7d33;--bad:#c62f2f;--warnbg:#fff4e0;--warnink:#6b4300;--badbg:#fdeaea;--badink:#8a1f1a}
@media (prefers-color-scheme: dark){:root:not([data-theme="light"]){color-scheme:dark;--page:#0e0f11;--surface:#1a1b1e;--card:#1a1b1e;--ink:#f2f2f3;--ink2:#c3c6cc;--muted:#8d9199;--grid:#2c2e33;--line:#2c2e33;
 --s1:#4d94ea;--s2:#e06a3a;--s3:#2bbd88;--seq250:#5a8fce;--good:#3ccf74;--bad:#ff6b6b;--warnbg:#3a2c12;--warnink:#f5d9a0;--badbg:#3d1a1a;--badink:#ffb4b0}}
:root[data-theme="dark"]{color-scheme:dark;--page:#0e0f11;--surface:#1a1b1e;--card:#1a1b1e;--ink:#f2f2f3;--ink2:#c3c6cc;--muted:#8d9199;--grid:#2c2e33;--line:#2c2e33;
 --s1:#4d94ea;--s2:#e06a3a;--s3:#2bbd88;--seq250:#5a8fce;--good:#3ccf74;--bad:#ff6b6b;--warnbg:#3a2c12;--warnink:#f5d9a0;--badbg:#3d1a1a;--badink:#ffb4b0}
*{box-sizing:border-box}
body{margin:0;background:var(--page);color:var(--ink);font:15px/1.45 system-ui,-apple-system,"Segoe UI",Roboto,sans-serif;-webkit-text-size-adjust:100%}
.wrap{max-width:520px;margin:0 auto;padding:0 16px 40px}
header{position:sticky;top:0;z-index:10;background:var(--page);padding:12px 16px 10px;border-bottom:1px solid var(--grid)}
header .in{max-width:520px;margin:0 auto}
h1{font-size:17px;margin:0;font-weight:700;line-height:1.2}
.sub{font-size:12px;color:var(--muted);margin-top:2px}
.ctrls{display:flex;gap:8px;margin-top:10px}
.seg{display:inline-flex;border:1px solid var(--grid);border-radius:10px;overflow:hidden;flex:0 0 auto}
.seg button{border:0;background:var(--surface);color:var(--ink2);padding:9px 12px;font-size:14px;min-height:40px}
.seg button.on{background:var(--s1);color:#fff;font-weight:600}
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
.list{background:var(--surface);border:1px solid var(--grid);border-radius:12px;overflow:hidden}
.row{display:flex;justify-content:space-between;align-items:center;gap:10px;padding:12px;border-top:1px solid var(--grid);min-height:52px;cursor:pointer}
.row:first-child{border-top:0}
.row .n{font-size:14px;font-weight:600;line-height:1.25}
.row .m{font-size:12px;color:var(--muted);margin-top:1px}
.row .r{text-align:right;font-variant-numeric:tabular-nums;white-space:nowrap}
.row .r b{font-size:15px}
.neg{color:var(--bad)}.pos{color:var(--good)}
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
/* valor imputado (multiplicador × coste, no es un dato): mismo aviso ⚠ que en el panel completo */
.wi{color:#c98500;font-weight:700;margin-left:2px}
.badge.imp,.impband{background:var(--warnbg);color:var(--warnink)}
.impband{display:block;border-radius:10px;padding:8px 10px;margin:8px 0 0;font-size:13px;line-height:1.35}
.row.imputado{box-shadow:inset 3px 0 0 #c98500}
details.gloss{margin-top:18px}
"""

JS = r"""
let DATA = __DATA__;
let CASES = DATA.casos; let YEAR = DATA.meta.ejercicio_valor;
__CORE__
const state = { lado: "actual", compara: "" };
const rc = c => c.reporte_compania || {};
const $ = id => document.getElementById(id);
const netoCls = v => v < 0 ? "neg" : "pos";
const rend = v => v == null ? "—" : v.toLocaleString("es-ES",{maximumFractionDigits:1}) + " €/€";

function spark(vals, labels){
  if (vals.length < 2) return `<div class="d">La tendencia aparece con la segunda foto guardada.</div>`;
  const W = 320, H = 56, mn = Math.min(...vals), mx = Math.max(...vals), rg = (mx - mn) || 1;
  const x = i => 6 + (W - 12) * i / (vals.length - 1), y = v => 8 + (H - 16) * (1 - (v - mn) / rg);
  const pts = vals.map((v,i)=>`${x(i)},${y(v)}`).join(" ");
  return `<svg viewBox="0 0 ${W} ${H}" width="100%" height="${H}" role="img" aria-label="Evolución del neto anual"><polyline points="${pts}" fill="none" stroke="var(--s1)" stroke-width="2.5" stroke-linejoin="round" stroke-linecap="round"/>${vals.map((v,i)=>`<circle cx="${x(i)}" cy="${y(v)}" r="3.5" fill="var(--s1)"/>`).join("")}</svg><div class="d">${labels[0]} → ${labels[labels.length-1]}</div>`;
}

function alertas(){
  const out = [], S = n => sum(CASES.map(c=>R(c)[n]||0));
  const pe = porEstado(CASES), tv = pe.validado + pe.declarado + pe.estimado_cati;
  if (tv && pe.validado / tv < 0.5) out.push(["bad", `Solo el <b>${Math.round(100*pe.validado/tv)} %</b> del valor actual (${fmt(tv)}) está validado por Control de Gestión.`]);
  // casos con coste y sin valor: llevan valor imputado (multiplicador × coste), que no es un dato; misma cifra que el KPI del panel completo
  const impN = CASES.filter(c=>R(c).imputado).length;
  if (impN) out.push(["", `<b>${impN}</b> ${impN===1?"caso lleva":"casos llevan"} valor imputado ${IMP_ICON()}: <b>${fmt(pe.imputado)}</b> (${IMP_MULT_TXT()} × su coste) que no es un dato de la compañía, el ${Math.round(100*pe.imputado/(tv+pe.imputado))} % del valor actual.`]);
  const topEf = [...CASES].sort((a,b)=>(R(b).eficiencias||0)-(R(a).eficiencias||0))[0], ef = S("eficiencias");
  if (topEf && ef && (R(topEf).eficiencias||0) / ef > 0.4) out.push(["", `«${esc(topEf.nombre)}» aporta el <b>${Math.round(100*(R(topEf).eficiencias||0)/ef)} %</b> de las eficiencias: el valor está concentrado en un solo caso${TX("nota_concentracion", "")}.`]);
  const negativos = CASES.filter(c=>c.estado==="En uso" && R(c).neto < 0).length;
  if (negativos) out.push(["", `<b>${negativos}</b> ${negativos===1?"caso en uso cuesta más de lo que aporta o no mide su valor":"casos en uso cuestan más de lo que aportan o no miden su valor"}.`]);
  const cap = S("capacidad"); if (cap) out.push(["", `<b>${fmt(cap)}</b> de capacidad liberada no se ha materializado en menor coste.`]);
  const inc = (DATA.seguimiento||{}).incidentes||[], br = inc.filter(x=>x.brecha_datos_personales===true), fuera = br.filter(x=>x.notificacion_aepd_horas==null||x.notificacion_aepd_horas>72).length;
  if (br.length) out.push([fuera?"bad":"", `<b>${br.length}</b> brecha${br.length===1?"":"s"} de datos personales en el periodo${fuera?`, <b>${fuera}</b> sin notificar a la AEPD en 72 h`:""}.`]);
  const clas = CASES.filter(c=>rc(c).clasificacion_ria).length; if (!clas) out.push(["", "Ningún caso clasificado por la compañía según el Reglamento de IA."]);
  const agentesSinFicha = CASES.filter(c=>esAgente(c) && c.estado!=="Desenganchado" && (rc(c).agente||{}).acciones==null).length;
  if (agentesSinFicha) out.push(["", `<b>${agentesSinFicha}</b> ${agentesSinFicha===1?"agente o asistente generativo":"agentes y asistentes generativos"} sin ficha de identidad, permisos y control de intención.`]);
  return out.slice(0, 6);
}

function fila(c, valor, meta){
  return `<div class="row${imputadoDe(c)?" imputado":""}" data-id="${c.id}"><div><div class="n">${esc(c.nombre)}</div><div class="m">${meta}</div></div><div class="r">${valor}</div></div>`;
}

function render(){
  const pot = P(), f = fotoComp(), k = n => pot ? n+"_pot" : n;
  const S = n => sum(CASES.map(c=>R(c)[n]||0));
  const SF = n => f ? sum(CASES.map(c=>((f.casos||{})[c.id]||{})[n]||0)) : null;
  const neto = S(k("neto"));
  const H = HIST(), serieV = H.map(h=>sum(Object.values(h.casos||{}).map(x=>x[k("neto")]||0))), serieL = H.map(h=>fES(h.fecha));
  if (!H.length || H[H.length-1].fecha !== DATA.meta.generado){ serieV.push(neto); serieL.push("hoy"); }
  const pe = porEstado(CASES), tv = pe.validado + pe.declarado + pe.estimado_cati;
  const impV = S(k("valor_imputado")), impN = CASES.filter(imputadoDe).length;
  const byE = ["En uso","En desarrollo","POC"].map(e=>`${e==="POC"?"POC":e.toLowerCase()} <b>${CASES.filter(c=>c.estado===e).length}</b>`).join(" · ");
  const nuevos = f ? CASES.filter(c=>esNuevo(c,f)) : [];
  $("resumen").innerHTML = `
   <div class="hero"><div class="k">Neto anual${pot?" potencial":""} de la IA</div><div class="v ${netoCls(neto)}">${fmt(neto)}</div>
     <div class="d">Eficiencias + retorno − coste recurrente${impV?` · incluye <b>${fmt(impV)}</b> de valor imputado ${IMP_ICON()} en ${impN} caso${impN===1?"":"s"}`:""} ${dl(neto, SF(k("neto")))}</div>
     <div class="spark">${spark(serieV, serieL)}</div></div>
   <div class="grid">
     <div class="tile"><div class="k">Eficiencias</div><div class="v">${fmt(S(k("eficiencias")))}</div><div class="d">${dl(S(k("eficiencias")), SF(k("eficiencias")))||"menor coste materializado"}</div></div>
     <div class="tile"><div class="k">Retorno</div><div class="v">${fmt(S(k("retorno")))}</div><div class="d">${dl(S(k("retorno")), SF(k("retorno")))||"venta, retención, cobros"}</div></div>
     <div class="tile"><div class="k">Coste anual</div><div class="v">${fmt(S(k("recurrente")))}</div><div class="d">${dl(S(k("recurrente")), SF(k("recurrente")), true)||"coste recurrente anual"}</div></div>
     ${pot ? `<div class="tile"><div class="k">Inversión adicional</div><div class="v">${fmt(S("adicional"))}</div><div class="d">para llegar al potencial</div></div>`
           : `<div class="tile"><div class="k">Valor validado</div><div class="v">${tv?Math.round(100*pe.validado/tv):0} %</div><div class="d">del valor actual</div></div>`}
   </div>
   <div class="estados">${CASES.length} casos: ${byE}${f?` · <b>${nuevos.length}</b> nuevos desde el ${fES(f.fecha)}`:""}</div>`;

  const al = alertas();
  $("alertas").innerHTML = al.length ? al.map(([cls,txt])=>`<div class="alert ${cls}">${txt}</div>`).join("") : `<div class="empty">Sin alertas.</div>`;

  const top = [...CASES].filter(c=>R(c)[k("neto")] > 0).sort((a,b)=>R(b)[k("neto")] - R(a)[k("neto")]).slice(0,5);
  $("top").innerHTML = top.length ? top.map(c=>{ const fc = fotoCaso(c); return fila(c, `<b class="${netoCls(R(c)[k("neto")])}">${fmt(R(c)[k("neto")])}</b>${imputadoDe(c)?IMP_ICON():""}<div>${fc?dl(R(c)[k("neto")], fc[k("neto")]):""}</div>`, `${esc(c.estado)} · ${imputadoDe(c)?`valor imputado ${IMP_ICON()}`:estadoTxt(c)}`); }).join("") : `<div class="empty">Ningún caso con neto positivo.</div>`;

  const cand = CASES.filter(c=>R(c).adicional && R(c).neto_adicional > 0).sort((a,b)=>R(b).rendimiento_adicional - R(a).rendimiento_adicional).slice(0,5);
  $("rinde").innerHTML = cand.length ? cand.map(c=>fila(c, `<b>${rend(R(c).rendimiento_adicional)}</b><div class="m">${fmt(R(c).adicional)} → +${fmt(R(c).neto_adicional)}/año</div>`, `plazo ${esc(eco(c).plazo_potencial||"sin fijar")}`)).join("") : `<div class="empty">Sin inversión adicional estimada.</div>`;

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

  $("pie").innerHTML = `Datos generados el ${fES(DATA.meta.generado)} · versión ${esc(String(DATA.meta.version_panel||""))} · ${H.length} foto${H.length===1?"":"s"} en el histórico. Valor actual declarado por la compañía para ${YEAR}; coste y potencial estimados por el ${CONSEJO()} salvo que se indique.${impN||CASES.some(c=>R(c).imputado_pot)?" "+IMP_LARGO():""} El detalle completo (fichas, riesgo y cumplimiento, agentes, cuadro de mando de la compañía) está en el panel del Consejo: <b>${esc(DATA.meta.panel_completo||"")}</b>.`;
  document.querySelectorAll(".row[data-id]").forEach(r=>r.onclick=()=>ficha(CASES.find(c=>c.id===r.dataset.id)));
}

function ficha(c){
  const r = R(c), e = eco(c), fp = fechaProd(c), fc = fotoCaso(c);
  const filaT = (lab, a, p, menos) => `<tr><td>${lab}</td><td>${fmt(a)}</td><td>${fmt(p)}</td></tr>`;
  $("sheetbox").innerHTML = `<button class="close" onclick="cerrar()">Cerrar</button><h3>${esc(c.nombre)}</h3>
   ${c.que_es?`<p style="font-size:14px;margin:6px 0 4px">${esc(c.que_es)}</p>`:""}
   <div class="sub">${c.id} · ${esc(c.estado)} · producción ${fp.f?(fp.est?fp.f+" (año estimado)":fES(fp.f)):"—"} · valor ${r.imputado?`imputado ${IMP_ICON()}`:estadoTxt(c)==='sin dato'?'sin medir':estadoTxt(c)}</div>
   ${(r.imputado||r.imputado_pot)?`<div class="impband"><b>${IMP_TXT()}.</b> ${IMP_LARGO()}</div>`:""}
   <table><thead><tr><th></th><th>Actual</th><th>Potencial</th></tr></thead><tbody>
    ${filaT("Coste anual", r.recurrente||0, r.recurrente_pot||0)}${filaT("Eficiencias", r.eficiencias||0, r.eficiencias_pot||0)}${filaT("Retorno", r.retorno||0, r.retorno_pot||0)}
    ${(r.imputado||r.imputado_pot)?`<tr><td>Valor imputado ${IMP_ICON()}</td><td>${r.imputado?fmt(r.valor_imputado):"—"}</td><td>${r.imputado_pot?fmt(r.valor_imputado_pot):"—"}</td></tr>`:""}
    <tr><td><b>Neto anual</b></td><td><b class="${netoCls(r.neto)}">${fmt(r.neto)}</b>${r.imputado?IMP_ICON():""}</td><td><b class="${netoCls(r.neto_pot)}">${fmt(r.neto_pot)}</b>${r.imputado_pot?IMP_ICON():""}</td></tr></tbody></table>
   <div class="sub" style="margin-top:10px">${r.capacidad?`Capacidad liberada no materializada: ${fmt(r.capacidad)}. `:""}Inversión adicional ${fmt(r.adicional)} · ${rend(r.rendimiento_adicional)} · plazo ${esc(e.plazo_potencial||"sin fijar")}${fc?` · neto frente a la foto ${dl(r.neto, fc.neto)}`:""}</div>
   ${e.hipotesis_potencial?`<p style="font-size:13.5px;color:var(--ink2);margin:10px 0 0">${esc(e.hipotesis_potencial)}</p>`:""}`;
  $("sheet").classList.add("open");
}
function cerrar(){ $("sheet").classList.remove("open"); }
$("sheet").onclick = e=>{ if (e.target === $("sheet")) cerrar(); };

function fillCompara(){ const s = $("compara"), H = HIST(); s.innerHTML = `<option value="">Sin comparar</option>` + [...H].reverse().map(h=>`<option value="${h.fecha}">Frente a ${fES(h.fecha)}</option>`).join(""); s.value = state.compara; s.disabled = !H.length; }
$("compara").onchange = e=>{ state.compara = e.target.value; render(); };
document.querySelectorAll("#lado button").forEach(b=>b.onclick=()=>{ state.lado = b.dataset.l; document.querySelectorAll("#lado button").forEach(x=>x.classList.toggle("on", x===b)); render(); });
if (location.protocol.startsWith("http") && META().leer_json_servidor !== false) { fetch("dashboard_data.json", {cache:"no-store"}).then(r=>r.ok?r.json():null).then(j=>{ if (j && j.casos){ DATA = normalize(j); DATA.meta.version_panel = DATA.meta.version_panel || __VERSION__; DATA.meta.panel_completo = DATA.meta.panel_completo || "__COMPLETO__"; CASES = DATA.casos; RES = new WeakMap(); fillCompara(); render(); } }).catch(()=>{}); }
fillCompara(); render();
"""

HTML = """<!DOCTYPE html>
<html lang="es"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<meta name="panel-datos" content="__HASH__">
<title>IA · Panel móvil del Consejo · __ORG__</title>
<style>__CSS__</style></head>
<body>
<header><div class="in"><h1>IA · Panel móvil del Consejo</h1><div class="sub">__ORG__ · __CONSEJO__ · versión __VERSION__ · datos del __FECHA__</div>
 <div class="ctrls"><div class="seg" id="lado"><button class="on" data-l="actual">Actual</button><button data-l="potencial">Potencial</button></div><select id="compara" aria-label="Comparar con una foto guardada"></select></div></div></header>
<div class="wrap">
 <div id="resumen"></div>
 <h2>Alertas</h2><div id="alertas"></div>
 <h2>Casos que más aportan</h2><div class="list" id="top"></div>
 <h2>Dónde rinde más el siguiente euro</h2><div class="list" id="rinde"></div>
 <section id="novedades-sec" hidden><h2 id="novedades-t">Novedades</h2><div class="list" id="novedades"></div></section>
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
    return (HTML.replace("__CSS__", CSS + glosario_css).replace("__GLOSARIO__", glosario_html(terminos, extra=glosario_extra))
                .replace("__ORG__", org).replace("__CONSEJO__", consejo)
                .replace("__VERSION__", str(version)).replace("__FECHA__", fecha).replace("__HASH__", hash_datos)
                .replace("__JS__", js))
