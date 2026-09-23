# Copia mantenida en AI_CONSULTING (SEVEN-G, T17); origen: AI_en_el_consejo/motor (MIT, mismo autor). Versión 8 del motor incorporada el 17-09-2026.
# -*- coding: utf-8 -*-
"""Nucleo JavaScript compartido por los dos paneles del Consejo (completo y movil).

Contiene el formato de importes, la compatibilidad con JSON antiguos, el modelo economico por caso
(inversion, eficiencias y retorno, actual y potencial: misma logica que economia.py) y las utilidades del
historico (fotos, comparacion, casos nuevos). Los dos paneles lo incrustan tal cual, de modo que cualquier
cifra que muestren sale del mismo codigo. Requiere que antes esten definidos DATA, CASES y YEAR, y que
despues cada panel defina `state` (con `lado` y `compara`) y `rc`.

Nada especifico de una organizacion vive en este codigo: la organizacion, las siglas del consejo asesor, los textos
de contexto (meta.textos), las etiquetas de retorno y si se muestran las referencias al registro (meta.mostrar_refs)
salen de los datos. Un cambio aqui afecta a los dos paneles; un cambio en un panel se analiza por si debe
reflejarse en el otro.
"""

CORE_JS = r"""// ---- identidad del panel (sale de los datos, no del código): organización, consejo asesor, textos y referencias
const META = () => (DATA.meta || {});
const ORG = () => META().organizacion || "la organización";
const CONSEJO = () => META().consejo_sigla || "consejo asesor";
const TX = (k, def) => { const v = (META().textos || {})[k]; return v == null ? def : v; };
const REF = s => META().mostrar_refs === false ? "" : s;
// si se ocultan las referencias al registro, limpia separadores y paréntesis que queden vacíos
function limpiaRefs(h){
  if (META().mostrar_refs !== false || !h) return h;
  return String(h).replace(/\(\s*(?:[,;·]\s*)*\)/g, "").replace(/\(\s*[,;·]\s*/g, "(").replace(/\s*[,;·]\s*\)/g, ")")
    .replace(/(?:\s*[,;·]\s*){2,}/g, " · ").replace(/\s*·\s*(?=<\/div>|<\/span>|<\/dd>|$)/g, "").replace(/\s+\)/g, ")");
}

const fmt = v => { if (v == null || isNaN(v)) return "—"; const a = Math.abs(v); if (a >= 1e6) return (v/1e6).toLocaleString("es-ES",{useGrouping:"always",maximumFractionDigits:1}) + " M€"; if (a >= 1e3) return Math.round(v/1e3).toLocaleString("es-ES",{useGrouping:"always"}) + " k€"; return Math.round(v).toLocaleString("es-ES",{useGrouping:"always"}) + " €"; };
const pct = v => (v*100).toLocaleString("es-ES",{useGrouping:"always",maximumFractionDigits:0}) + " %";
const sum = a => a.reduce((x,y)=>x+y,0);
const esc = s => String(s ?? "").replace(/&/g,"&amp;").replace(/</g,"&lt;");
const ND = '<span class="nd">sin dato</span>';
const nd = (v, f) => (v == null || v === "") ? ND : (f ? f(v) : esc(v));
const npct = v => v == null ? ND : v.toLocaleString("es-ES",{useGrouping:"always",maximumFractionDigits:1}) + " %";
const nnum = v => v == null ? ND : Number(v).toLocaleString("es-ES",{useGrouping:"always"});
// entero (o con d decimales) con separador de miles siempre, también en 4 cifras: «1.200», no «1200»
const nf = (v, d=0) => (v == null || v === "" || isNaN(v)) ? "—" : Number(v).toLocaleString("es-ES",{useGrouping:"always",maximumFractionDigits:d});

// ---- magnitudes de valor: se muestran por separado y no se suman entre sí
const MAGS = [["vnb","VNB","Valor de Nuevo Negocio (VNB)"],["fraude","Fraude evitado","Fraude y sobrecoste evitados"],["eficiencia","Eficiencias","Eficiencias (horas valoradas en euros)"]];
const MAGLAB = {vnb:"VNB", fraude:"Fraude evitado", eficiencia:"Eficiencias"};
const MAGCOL = {vnb:"var(--s1)", fraude:"var(--s3)", eficiencia:"var(--s4)"};
const MAGDET = {vnb:"beneficio futuro esperado de las ventas atribuidas: no es ingreso ni caja", fraude:"importe bruto; en herramientas de terceros suele ser recuperado y no incremental", eficiencia:"horas liberadas valoradas en euros; potencial liberable"};
// compatibilidad con JSON del esquema v3 (valor en ingresos/ahorro, potencial en ingresos/ahorro)
function normalize(d){
  (d.casos||[]).forEach(c=>{
    const v = c.valor||{};
    ["anio","acum"].forEach(p=>{ const x = v[p]; if (x && "ingresos" in x){ const ah = x.ahorro||0; v[p] = {vnb:x.ingresos||0, fraude:0, eficiencia:ah}; } });
    if (!v.magnitud && v.anio){ v.magnitud = v.anio.vnb ? "vnb" : v.anio.fraude ? "fraude" : v.anio.eficiencia ? "eficiencia" : null; }
    if (v.acum_dato == null) v.acum_dato = false;
    const p = c.potencial||{}; if ("ingresos" in p){ p.negocio = p.ingresos; delete p.ingresos; }
  });
  return d;
}
normalize(DATA);

// ---- modelo económico por caso: inversión, eficiencias y retorno en euros, actual y potencial (misma lógica que economia.py)
const EFIC = {personas:"Menor coste de personas o de externalización (materializado)", capacidad_liberada:"Capacidad liberada valorada (no materializada)", herramientas:"Herramientas o licencias retiradas", siniestros:"Menor coste de siniestros: fraude, recobros, sobrefacturación", operativo:"Otros costes operativos evitados", penalizaciones:"Errores y penalizaciones evitados"};
const RET = {venta_nueva:"Venta nueva", venta_cruzada:"Venta cruzada", retencion:"Retención (valor de la cartera retenida)", precio_margen:"Precio y margen técnico", cobros:"Recibos y cobros recuperados", otros:"Otro retorno"};
const INVC = {personas:"Personas internas (FTE × coste)", servicios:"Servicios externos", licencias:"Licencias y suscripciones", plataforma:"Plataforma compartida (tokens, DBU, minutos)", infraestructura:"Infraestructura", cumplimiento:"Cumplimiento y seguridad", mantenimiento:"Mantenimiento y evolución"};
const EST = {validado:"validado por Control de Gestión", declarado:"declarado por la compañía", estimado_cati:"estimación del " + CONSEJO() + ""};
const ESTL = e => (e === "estimado_cati" ? "estimación del " + CONSEJO() : EST[e]) || e || "";
const NO_NETO = new Set(["capacidad_liberada"]);
// agentes y asistentes generativos: la misma definición en el panel completo y en el móvil
const esAgente = c => /Agéntico|GenAI/.test((c.tags||{}).tecnologia || "");
// iniciativas transversales (varias unidades de negocio) y plataformas habilitadoras: bloque opcional casos[].alcance.
// Sin él, el caso es de una unidad y el panel no cambia. Adopción = licencias activas sobre asignadas en cada unidad.
const alcanceDe = c => (c.alcance && (c.alcance.tipo === "transversal" || c.alcance.tipo === "plataforma")) ? c.alcance : null;
const adopcionPct = u => (u && u.licencias_activas != null && u.licencias_asignadas) ? 100 * u.licencias_activas / u.licencias_asignadas : null;
function adopcionBaja(c){ const a = alcanceDe(c); if (!a || a.umbral_adopcion_pct == null) return [];
  return (a.unidades || []).filter(u => u.estado === "en_uso" && adopcionPct(u) != null && adopcionPct(u) < a.umbral_adopcion_pct); }
const TIPO_INC = {caida:"caída", deriva:"deriva", error:"error", seguridad:"seguridad"};
const RETL = () => Object.fromEntries(Object.entries(RET).map(([k,v])=>[k, TX("ret_"+k, v)]));
const EFICL = () => Object.fromEntries(Object.entries(EFIC).map(([k,v])=>[k, TX("ef_"+k, v)]));
const eco = c => c.economia || {};
const imp = it => (it && it.importe != null) ? it.importe : null;
function sumaL(ls, lado, filtro, resp){ let tot = 0, alguno = false; (ls||[]).forEach(l=>{ if (!filtro(l)) return; let v = imp(l[lado]); if (v == null && resp) v = imp(l.actual); if (v != null){ tot += v; alguno = true; } }); return alguno ? tot : null; }
let RES = new WeakMap();
function R(c){
  if (RES.has(c)) return RES.get(c);
  const e = eco(c), inv = e.inversion||{}, ef = e.eficiencias||[], rt = e.retorno||[];
  const cu = l=>!NO_NETO.has(l.concepto), ca = l=>NO_NETO.has(l.concepto), to = ()=>true;
  const r = {construccion:imp(inv.construccion), recurrente:imp(inv.recurrente_anual), eficiencias:sumaL(ef,"actual",cu), capacidad:sumaL(ef,"actual",ca), retorno:sumaL(rt,"actual",to),
    adicional:imp(inv.adicional_potencial), recurrente_pot:imp(inv.recurrente_potencial), eficiencias_pot:sumaL(ef,"potencial",cu,true), capacidad_pot:sumaL(ef,"potencial",ca,true), retorno_pot:sumaL(rt,"potencial",to,true)};
  if (r.recurrente_pot == null) r.recurrente_pot = r.recurrente;
  const z = k => r[k]||0;
  r.neto = z("eficiencias") + z("retorno") - z("recurrente");
  r.neto_pot = z("eficiencias_pot") + z("retorno_pot") - z("recurrente_pot");
  r.neto_adicional = r.neto_pot - r.neto;
  r.rendimiento_adicional = r.adicional ? r.neto_adicional / r.adicional : null;
  r.payback_anios = (r.construccion && r.neto > 0) ? r.construccion / r.neto : null;
  const pe = {validado:0, declarado:0, estimado_cati:0};
  [...ef.filter(cu), ...rt].forEach(l=>{ const v = imp(l.actual); if (v != null){ const k = l.actual.estado || "estimado_cati"; pe[k] = (pe[k]||0) + v; } });
  r.valor_por_estado = pe; RES.set(c, r); return r;
}
const P = () => state.lado === "potencial";
function valorDe(c){ const r = R(c); return P() ? (r.eficiencias_pot||0) + (r.retorno_pot||0) : (r.eficiencias||0) + (r.retorno||0); }
function costeDe(c){ const r = R(c); return (P() ? r.recurrente_pot : r.recurrente) || 0; }
function netoDe(c){ const r = R(c); return P() ? r.neto_pot : r.neto; }
function potDe(c){ return R(c).neto_pot; }
function costeEsEstimado(c){ const it = (eco(c).inversion||{}).recurrente_anual; return !it || it.estado === "estimado_cati"; }
function estadoTxt(c){ const pe = R(c).valor_por_estado; return pe.validado ? "validado" : pe.declarado ? "declarado" : pe.estimado_cati ? "estimado" : "sin dato"; }
// controles de un caso: completos si todos están hechos o no aplican (misma regla en los dos paneles)
const CTRL = ["RIA","FRIA","DPIA","seguridad","MUC","IA_ofensiva"];
const CTRLLAB = {RIA:"RIA",FRIA:"FRIA",DPIA:"DPIA",seguridad:"Seguridad",MUC:"MUC",IA_ofensiva:"Riesgo de IA ofensiva"};
function controlesCompletos(c){ const k = rc(c).controles || {}; return CTRL.every(x => k[x]==="hecho" || k[x]==="no_aplica"); }
// ---- indicadores con umbral (semáforo): meta.umbrales_kpi, que sale del JSON general de configuración de cada organización.
// Cada umbral es un porcentaje: por debajo de "amarillo" el indicador se marca en amarillo y por debajo de "rojo", en rojo.
// Si los datos no traen umbrales, se usan estos valores por defecto.
const UMBRALES_DEF = {valor_validado_pct:{amarillo:50, rojo:20}, clasificados_compania_pct:{amarillo:80, rojo:50}, controles_completos_pct:{amarillo:80, rojo:50}};
function umbral(clave){ return Object.assign({}, UMBRALES_DEF[clave] || {}, (META().umbrales_kpi || {})[clave] || {}); }
function nivelKPI(clave, valorPct){
  if (valorPct == null || isNaN(valorPct)) return "";
  const u = umbral(clave);
  if (u.rojo != null && valorPct < u.rojo) return "rojo";
  if (u.amarillo != null && valorPct < u.amarillo) return "amarillo";
  return "ok";
}
const NIVEL_TXT = {rojo:"En rojo", amarillo:"En amarillo", ok:"En objetivo"};
const umbralTxt = clave => { const u = umbral(clave); return `amarillo < ${u.amarillo} % · rojo < ${u.rojo} %`; };
// valor actual por estado del dato y porcentajes de los tres indicadores con umbral, para una lista de casos
function valorPorEstado(rows){ const pe = {validado:0, declarado:0, estimado_cati:0}; rows.forEach(c=>Object.entries(R(c).valor_por_estado).forEach(([a,b])=>pe[a]=(pe[a]||0)+b)); pe.total = pe.validado + pe.declarado + pe.estimado_cati; return pe; }
function indicadores(rows){
  const pe = valorPorEstado(rows), n = rows.length, clas = rows.filter(c=>rc(c).clasificacion_ria).length, ctrl = rows.filter(controlesCompletos).length;
  const pv = pe.total ? 100*pe.validado/pe.total : null, pc = n ? 100*clas/n : null, pk = n ? 100*ctrl/n : null;
  return {pe, n, clas, ctrl,
    validado:{pct:pv, nivel:nivelKPI("valor_validado_pct", pv)},
    clasificados:{pct:pc, nivel:nivelKPI("clasificados_compania_pct", pc)},
    controles:{pct:pk, nivel:nivelKPI("controles_completos_pct", pk)}};
}
// valor declarado en el cuadro de mando de la compañía (bloque de contraste con el CdM)
function magVal(c, m, per){ return ((c.valor[per||"anio"])||{})[m]||0; }
function valorAnio(c){ return sum(MAGS.map(([m])=>magVal(c,m,"anio"))); }
const CDM = () => (DATA.seguimiento||{}).cdm_compania || null;
// ---- histórico: fotos guardadas con snapshot.py
const HIST = () => (DATA.historico||[]);
function fotoComp(){ return state.compara ? HIST().find(h=>h.fecha===state.compara) || null : null; }
function fotoCaso(c){ const f = fotoComp(); return f ? (f.casos||{})[c.id] || null : null; }
const fES = s => s ? String(s).split("-").reverse().join("-") : "—";
function dl(actual, previo, menosEsMejor){
  if (previo == null || actual == null) return "";
  const d = actual - previo; if (Math.abs(d) < 0.5) return `<span class="dlt">= sin cambio</span>`;
  const bueno = menosEsMejor ? d < 0 : d > 0;
  return `<span class="dlt ${bueno?"up":"down"}">${d>0?"▲ +":"▼ "}${fmt(d)}</span>`;
}
// ---- ciclo de vida del caso, como en un CRM: entradas (propuestos), embudo, ganados (en uso) y perdidos (no aprobados, descartados,
// desenganchados). Reglas deterministas en meta.ciclo_vida (JSON general de configuración); si falta, se usan estas por defecto.
// Fuente de los tiempos: reporte_compania.historial_estados [{estado, fecha, fuente, nota}] que aporta la compañía; si no lo hay,
// se reconstruye con las fechas de reporte_compania.fechas (idea, aprobación, piloto, inicio, producción, retirada). Sin fechas no hay
// tiempos: nunca se estiman.
const CICLO_DEF = {
  embudo: ["Propuesto","Aprobado","POC","En desarrollo","En uso"], ganado: "En uso",
  salidas: {"No aprobado":["Propuesto"], "Descartado":["Aprobado","POC","En desarrollo"], "Desenganchado":["En uso"]},
  fecha_de_estado: {"Propuesto":"idea", "Aprobado":"aprobacion", "POC":"piloto", "En desarrollo":"inicio", "En uso":"produccion", "Desenganchado":"retirada"},
  dias_limite: {"Propuesto":60, "Aprobado":30, "POC":120, "En desarrollo":{"baja":120, "media":240, "alta":365, "sin_dato":240}},
  aviso_pct_limite: 80};
const CICLO = () => Object.assign({}, CICLO_DEF, META().ciclo_vida || {});
const SALIDAS = () => Object.keys(CICLO().salidas || {});
const ESTADOS_CICLO = () => [...CICLO().embudo, ...SALIDAS()];
const esSalida = e => SALIDAS().includes(e);
const esGanado = e => e === CICLO().ganado;
const esEnCurso = e => CICLO().embudo.includes(e) && !esGanado(e);
const situacion = e => esGanado(e) ? "ganado" : esSalida(e) ? "perdido" : esEnCurso(e) ? "en curso" : "estado no previsto";
const FECHA_PANEL = () => String(META().generado || new Date().toISOString()).slice(0,10);
const dias = (a, b) => { if (!a || !b) return null; const d = (new Date(b) - new Date(a)) / 86400000; return isNaN(d) ? null : Math.round(d); };
const complejidadDe = c => rc(c).complejidad || null;
// límite de días del estado (null = sin límite: ganado y salidas); en desarrollo depende de la complejidad del caso
function limiteDe(c, e){
  const l = (CICLO().dias_limite || {})[e];
  if (l == null) return null;
  if (typeof l === "number") return l;
  return l[complejidadDe(c) || "sin_dato"] ?? l.sin_dato ?? null;
}
// fecha de un hito: la de reporte_compania.fechas o, si falta, la primera entrada del historial en el estado equivalente
function fechaDe(c, clave){
  const f = (rc(c).fechas || {})[clave]; if (f) return f;
  const e = Object.entries(CICLO().fecha_de_estado || {}).find(([, k]) => k === clave); if (!e) return null;
  return (rc(c).historial_estados || []).filter(x => x && x.estado === e[0] && x.fecha).map(x => String(x.fecha).slice(0,10)).sort()[0] || null;
}
let HIS = new WeakMap();
function historial(c){
  if (HIS.has(c)) return HIS.get(c);
  const cfg = CICLO(), rep = rc(c), hoy = FECHA_PANEL(), orden = e => { const i = ESTADOS_CICLO().indexOf(e); return i < 0 ? 99 : i; };
  let ev = (rep.historial_estados || []).filter(x => x && x.estado && x.fecha).map(x => ({estado:x.estado, fecha:String(x.fecha).slice(0,10), fuente:x.fuente || "historial de la compañía", nota:x.nota || null, cifras:x.cifras || null}));
  let origen = ev.length ? "historial" : "sin_dato";
  if (!ev.length){
    const f = rep.fechas || {};
    ev = Object.entries(cfg.fecha_de_estado || {}).filter(([, k]) => f[k]).map(([e, k]) => ({estado:e, fecha:String(f[k]).slice(0,10), fuente:"fecha de " + k + " reportada por la compañía", nota:null}));
    if (ev.length) origen = "fechas";
  }
  ev.sort((a, b) => a.fecha < b.fecha ? -1 : a.fecha > b.fecha ? 1 : orden(a.estado) - orden(b.estado));
  const ultimo = ev.length ? ev[ev.length-1].estado : null, coherente = !ultimo || ultimo === c.estado;
  const tramos = ev.map((x, i) => {
    const sig = ev[i+1], final = esSalida(x.estado);
    // el último tramo solo sigue abierto hasta la fecha del panel si coincide con el estado del inventario
    const hasta = sig ? sig.fecha : (!final && coherente ? hoy : null);
    return {...x, hasta, abierto: !sig && !final && coherente, dias: hasta ? dias(x.fecha, hasta) : null};
  });
  // controles de calidad del historial (deterministas)
  const avisos = [], aviso = (tipo, txt) => avisos.push({tipo, txt});
  if (origen === "sin_dato") aviso("sin_dato", "sin historial ni fechas");
  if (!coherente) aviso("incoherente", `el último estado del historial (${ultimo}) no coincide con el del inventario (${c.estado})`);
  if (!ESTADOS_CICLO().includes(c.estado)) aviso("no_previsto", `estado del inventario no previsto en el ciclo (${c.estado})`);
  const emb = cfg.embudo, pasos = ev.filter(x => emb.includes(x.estado)).map(x => emb.indexOf(x.estado));
  for (let i = 1; i < pasos.length; i++){
    if (pasos[i] < pasos[i-1]) aviso("vuelve", `vuelve de ${emb[pasos[i-1]]} a ${emb[pasos[i]]}`);
    else if (origen === "historial" && pasos[i] > pasos[i-1] + 1) aviso("salta", `salta de ${emb[pasos[i-1]]} a ${emb[pasos[i]]}`);
  }
  const actual = tramos.length && coherente ? tramos[tramos.length-1] : null;
  const h = {origen, tramos, coherente, avisos, actual};
  HIS.set(c, h); return h;
}
// tiempo en el estado actual frente a su límite: nivel "rojo" (supera el límite), "amarillo" (desde aviso_pct_limite % del límite),
// "ok" (en plazo), "sin_limite" (ganado o salida) o "sin_fechas"
function plazoDe(c){
  const a = historial(c).actual, lim = limiteDe(c, c.estado);
  if (!a || a.dias == null) return {dias:null, limite:lim, pct:null, nivel:"sin_fechas", desde:null};
  if (lim == null) return {dias:a.dias, limite:null, pct:null, nivel:"sin_limite", desde:a.fecha};
  const pct = 100 * a.dias / lim, aviso = CICLO().aviso_pct_limite ?? 80;
  return {dias:a.dias, limite:lim, pct, nivel: a.dias > lim ? "rojo" : pct >= aviso ? "amarillo" : "ok", desde:a.fecha};
}
const AVISO_TXT = {sin_dato:"Sin historial ni fechas", incoherente:"El último estado del historial no coincide con el del inventario", no_previsto:"Estado del inventario no previsto en el ciclo de vida", vuelve:"Vuelve a un estado anterior del embudo", salta:"Salta etapas del embudo"};
const PLAZO_TXT = {rojo:"supera el límite", amarillo:"cerca del límite", ok:"en plazo", sin_limite:"sin límite", sin_fechas:"sin fechas"};
// estadísticos de una lista de días (media y mediana redondeadas a días)
function estad(vals){
  const v = vals.filter(x => x != null && !isNaN(x)).sort((a, b) => a - b); if (!v.length) return null;
  const q = p => { const i = (v.length-1)*p, lo = Math.floor(i), hi = Math.ceil(i); return Math.round(v[lo] + (v[hi]-v[lo])*(i-lo)); };
  return {n:v.length, min:v[0], p25:q(.25), mediana:q(.5), p75:q(.75), max:v[v.length-1], media:Math.round(sum(v)/v.length)};
}
// tiempos de un estado en una lista de casos: estancias ya cerradas y estancias en curso (días hasta la fecha del panel)
function tiemposEstado(rows, e){
  const cerr = [], curso = [];
  rows.forEach(c => historial(c).tramos.forEach(t => { if (t.estado === e && t.dias != null) (t.abierto ? curso : cerr).push(t.dias); }));
  return {cerradas: estad(cerr), en_curso: estad(curso), todas: estad([...cerr, ...curso])};
}
// días desde la primera entrada en el estado A hasta la primera entrada posterior en B
function diasDeA(c, a, b){ const t = historial(c).tramos, ia = t.findIndex(x => x.estado === a); if (ia < 0) return null; const jb = t.findIndex((x, j) => j > ia && x.estado === b); return jb < 0 ? null : dias(t[ia].fecha, t[jb].fecha); }
// índice de la etapa del embudo más avanzada que alcanzó el caso (con historial si lo hay; si no, por su estado actual)
function etapaAlcanzada(c){
  const cfg = CICLO(), emb = cfg.embudo, h = historial(c);
  const vistos = h.tramos.map(t => emb.indexOf(t.estado)).filter(i => i >= 0);
  let i = emb.indexOf(c.estado);
  if (i < 0 && esSalida(c.estado)) {
    const orig = (cfg.salidas[c.estado] || []).map(e => emb.indexOf(e)).filter(x => x >= 0);
    i = vistos.length ? Math.max(...vistos) : (orig.length ? Math.min(...orig) : 0);
  }
  return Math.max(i, ...vistos, -1);
}
// etapa desde la que salió un caso perdido: última etapa del embudo en su historial o, sin historial, la primera de las previstas
function etapaDeSalida(c){
  const cfg = CICLO(), emb = cfg.embudo, t = historial(c).tramos.filter(x => emb.includes(x.estado));
  if (t.length) return t[t.length-1].estado;
  return (cfg.salidas[c.estado] || [])[0] || null;
}
function fechaProd(c){ const p = fechaDe(c, "produccion"); if (p) return {f:p, est:false}; return (c.estado==="En uso"||c.estado==="Desenganchado") ? {f:String(c.inicio_estimado), est:true} : {f:null, est:true}; }
function esNuevo(c, f){ if (!f) return false; const x = (f.casos||{})[c.id]; const p = (rc(c).fechas||{}).produccion; return !x || (p && p > f.fecha && x.estado !== "En uso"); }
"""
