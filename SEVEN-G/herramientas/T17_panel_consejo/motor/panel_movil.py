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

TERMINOS_MOVIL = {"VNB", "Neto anual", "Eficiencias", "Retorno", "Capacidad liberada", "Potencial",
                  "Neto adicional por euro invertido", "Estado del dato", "Foto (histórico)", "Puesta en producción",
                  "Inversión", "Consejo asesor", "IA", "Brecha de datos personales", "AEPD",
                  "Embudo", "Límite de días", "Mediana"}

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
.badge.rojo{background:var(--rojbg);color:var(--rojink)}.badge.amarillo{background:var(--ambbg);color:var(--ambink)}.badge.ok{background:var(--grid);color:var(--ink2)}
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
  return `<svg viewBox="0 0 ${W} ${H}" width="100%" height="${H}" role="img" aria-label="Evolución del neto anual"><polyline points="${pts}" fill="none" stroke="var(--neto)" stroke-width="2.5" stroke-linejoin="round" stroke-linecap="round"/>${vals.map((v,i)=>`<circle cx="${x(i)}" cy="${y(v)}" r="3.5" fill="var(--neto)"/>`).join("")}</svg><div class="d">${labels[0]} → ${labels[labels.length-1]}</div>`;
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
  // casos atascados: superan el límite de días de su estado (misma regla que el embudo del panel completo)
  const pl = CASES.map(plazoDe), atasR = pl.filter(p=>p.nivel==="rojo").length, atasA = pl.filter(p=>p.nivel==="amarillo").length;
  if (atasR || atasA) out.push([atasR?"rojo":"amarillo", `<b>${atasR}</b> ${atasR===1?"caso supera":"casos superan"} el límite de días de su estado${atasA?` y <b>${atasA}</b> ${atasA===1?"está cerca":"están cerca"}`:""}.`]);
  // primero lo más grave: rojo y brechas, después amarillo y el resto (orden estable dentro de cada grupo)
  const peso = cls => cls==="rojo" || cls==="bad" ? 0 : cls==="amarillo" ? 1 : 2;
  return out.map((a,i)=>[a,i]).sort((x,y)=>peso(x[0][0])-peso(y[0][0]) || x[1]-y[1]).map(x=>x[0]).slice(0, 6);
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

  const al = alertas();
  $("alertas").innerHTML = al.length ? al.map(([cls,txt])=>`<div class="alert ${cls}">${txt}</div>`).join("") : `<div class="empty">Sin alertas.</div>`;

  const top = [...CASES].filter(c=>R(c)[k("neto")] > 0).sort((a,b)=>R(b)[k("neto")] - R(a)[k("neto")]).slice(0,5);
  // embudo compacto: casos ahora en cada etapa, los que la alcanzaron, mediana de días y atascados; salidas debajo
  const cfgC = CICLO(), embE = cfgC.embudo, base = Math.max(1, CASES.filter(c=>etapaAlcanzada(c) >= 0).length);
  $("embudo").innerHTML = embE.map((e,i)=>{ const ahora = CASES.filter(c=>c.estado===e), alc = CASES.filter(c=>etapaAlcanzada(c) >= i).length, t = tiemposEstado(CASES, e).todas, pls = ahora.map(plazoDe), r = pls.filter(p=>p.nivel==="rojo").length, a = pls.filter(p=>p.nivel==="amarillo").length;
      return `<div class="row fun" data-etapa="${esc(e)}"><div style="flex:1;min-width:0"><div class="n">${esc(e)} <span class="m">· ${ahora.length} ahora</span></div><div class="funbar"><i style="width:${Math.round(100*alc/base)}%"></i></div><div class="m">alcanzaron ${alc} · ${t?`mediana ${t.mediana} d · media ${t.media} d`:"sin fechas"}</div></div><div class="r">${r?`<span class="badge rojo">${r} fuera</span>`:""}${a?`<span class="badge amarillo">${a} cerca</span>`:""}</div></div>`; }).join("")
    + `<div class="row"><div><div class="n">Perdidos</div><div class="m">${SALIDAS().map(s=>`${esc(s)} ${CASES.filter(c=>c.estado===s).length}`).join(" · ")}</div></div></div>`;
  document.querySelectorAll(".row.fun").forEach(r=>r.onclick=()=>etapa(r.dataset.etapa));
  $("top").innerHTML = top.length ? top.map(c=>{ const fc = fotoCaso(c); return fila(c, `<b class="${netoCls(R(c)[k("neto")])}">${fmt(R(c)[k("neto")])}</b><div>${fc?dl(R(c)[k("neto")], fc[k("neto")]):""}</div>`, `${esc(c.estado)} · ${estadoTxt(c)}`); }).join("") : `<div class="empty">Ningún caso con neto positivo.</div>`;

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

  $("pie").innerHTML = `Datos generados el ${fES(DATA.meta.generado)} · versión ${esc(String(DATA.meta.version_panel||""))} · ${H.length} foto${H.length===1?"":"s"} en el histórico. Valor actual declarado por la compañía para ${YEAR}; coste y potencial estimados por el ${CONSEJO()} salvo que se indique. El detalle completo (fichas, riesgo y cumplimiento, agentes, cuadro de mando de la compañía) está en el panel del Consejo: <b>${esc(DATA.meta.panel_completo||"")}</b>.`;
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
   ${(()=>{ const h = historial(c), p = plazoDe(c); if (!h.tramos.length) return `<div class="sub" style="margin-top:10px">Recorrido por estados: sin fechas reportadas.</div>`;
      return `<div class="sub" style="margin-top:10px">Recorrido: ${h.tramos.map(t=>`${esc(t.estado)} ${t.dias==null?"":t.dias+" d"}`).join(" → ")}${p.limite?` · <span class="badge ${p.nivel}">${p.dias} de ${p.limite} d</span>`:""}</div>`; })()}`;
  $("sheet").classList.add("open");
}
// casos de una etapa del embudo, ordenados por días en la etapa, con su desviación frente a la mediana
function etapa(e){
  const cs = CASES.filter(c=>c.estado===e).map(c=>({c, p: plazoDe(c)})).sort((a,b)=>(b.p.dias??-1)-(a.p.dias??-1)), t = tiemposEstado(CASES, e).todas;
  $("sheetbox").innerHTML = `<button class="close" onclick="cerrar()">Cerrar</button><h3>${esc(e)}: ${cs.length} casos</h3>
   <div class="sub">${t?`mediana ${t.mediana} d · media ${t.media} d (${t.n} estancias)`:"sin fechas de cambio de estado"}</div>
   <div class="list" style="margin-top:10px">${cs.map(({c,p})=>`<div class="row" data-id="${c.id}"><div><div class="n">${esc(c.nombre)}</div><div class="m">${p.desde?`desde ${fES(p.desde)}`:"sin fechas"}${p.limite?` · límite ${p.limite} d`:""}</div></div><div class="r"><b>${p.dias==null?"—":p.dias+" d"}</b>${p.dias!=null&&t?`<div class="m">${p.dias-t.mediana>0?"+":""}${p.dias-t.mediana} d vs mediana</div>`:""}${p.nivel==="rojo"||p.nivel==="amarillo"?`<div><span class="badge ${p.nivel}">${p.nivel==="rojo"?"fuera de plazo":"cerca del límite"}</span></div>`:""}</div></div>`).join("")||`<div class="empty">Ningún caso.</div>`}</div>`;
  $("sheet").classList.add("open");
  document.querySelectorAll("#sheetbox .row[data-id]").forEach(r=>r.onclick=()=>ficha(CASES.find(c=>c.id===r.dataset.id)));
}
function cerrar(){ $("sheet").classList.remove("open"); }
$("sheet").onclick = e=>{ if (e.target === $("sheet")) cerrar(); };

function fillCompara(){ const s = $("compara"), H = HIST(); s.innerHTML = `<option value="">Sin comparar</option>` + [...H].reverse().map(h=>`<option value="${h.fecha}">Frente a ${fES(h.fecha)}</option>`).join(""); s.value = state.compara; s.disabled = !H.length; }
$("compara").onchange = e=>{ state.compara = e.target.value; render(); };
document.querySelectorAll("#lado button").forEach(b=>b.onclick=()=>{ state.lado = b.dataset.l; document.querySelectorAll("#lado button").forEach(x=>x.classList.toggle("on", x===b)); render(); });
if (location.protocol.startsWith("http") && META().leer_json_servidor !== false) { fetch("dashboard_data.json", {cache:"no-store"}).then(r=>r.ok?r.json():null).then(j=>{ if (j && j.casos){ DATA = normalize(j); DATA.meta.version_panel = DATA.meta.version_panel || __VERSION__; DATA.meta.panel_completo = DATA.meta.panel_completo || "__COMPLETO__"; CASES = DATA.casos; RES = new WeakMap(); HIS = new WeakMap(); fillCompara(); render(); } }).catch(()=>{}); }
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
 <h2>Embudo de casos</h2><div class="list" id="embudo"></div>
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
