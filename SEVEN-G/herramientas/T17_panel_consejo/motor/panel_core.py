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

const fmt = v => { if (v == null || isNaN(v)) return "—"; const a = Math.abs(v); if (a >= 1e6) return (v/1e6).toLocaleString("es-ES",{maximumFractionDigits:1}) + " M€"; if (a >= 1e3) return Math.round(v/1e3).toLocaleString("es-ES") + " k€"; return Math.round(v).toLocaleString("es-ES") + " €"; };
const pct = v => (v*100).toLocaleString("es-ES",{maximumFractionDigits:0}) + " %";
const sum = a => a.reduce((x,y)=>x+y,0);
const esc = s => String(s ?? "").replace(/&/g,"&amp;").replace(/</g,"&lt;");
const ND = '<span class="nd">sin dato</span>';
const nd = (v, f) => (v == null || v === "") ? ND : (f ? f(v) : esc(v));
const npct = v => v == null ? ND : v.toLocaleString("es-ES",{maximumFractionDigits:1}) + " %";
const nnum = v => v == null ? ND : Number(v).toLocaleString("es-ES");

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
const UMBRALES_DEF = {valor_validado_pct:{amarillo:50, rojo:20}, clasificados_compania_pct:{amarillo:80, rojo:50}, controles_completos_pct:{amarillo:80, rojo:50},
  planes_realizacion_pct:{amarillo:80, rojo:50}, realizacion_pct:{amarillo:90, rojo:70}};
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
// fecha en que un caso salió del embudo (parada o retirada): la del último tramo del historial o, si falta, la de retirada
function fechaSalida(c){ if (!esSalida(c.estado)) return null; const t = historial(c).tramos; const u = t.length ? t[t.length-1] : null; return (u && esSalida(u.estado) ? u.fecha : null) || fechaDe(c, "retirada"); }
// fase de SEVEN-G del caso (bloque opcional casos[].seveng que escribe el conector de T01); null si el panel no la recibe
const faseDe = c => (c.seveng && c.seveng.fase != null) ? Number(c.seveng.fase) : null;
// valor anual en juego de un caso: eficiencias + retorno potenciales (el máximo alcanzable con sus hipótesis) o, si no los hay, los actuales.
// Es declarado, no validado: sirve para ordenar los frenos, no para prometer. null = sin dato (nunca cero).
function valorEnJuego(c){ const r = R(c); const e = r.eficiencias_pot ?? r.eficiencias, t = r.retorno_pot ?? r.retorno; return (e == null && t == null) ? null : (e || 0) + (t || 0); }

// ---- lectura ejecutiva: qué frena el escalado y dónde actuar primero (SEVEN-G, documento 60 §10.4; D126). Reglas deterministas
// sobre lo que ya trae el panel: señales de caso (sobre los casos filtrados), patrones de las paradas y retiradas del último año y señales
// de la compañía (madurez D1–D7 e índice de transformación, que no dependen de los filtros). Nada se estima: lo que falta se dice.
// meta.frenos_escalado (JSON general de configuración) ajusta el umbral de madurez, los meses del patrón, qué motivo de parada
// corresponde a cada freno y los textos de cada freno; sin la clave se usan estos valores (D53).
const FRENOS_DEF = [
  {id:"FE-1", nombre:"El valor no está demostrado", resp:"Control de gestión y responsable de negocio del beneficio",
   accion:"Validar con Control de Gestión el valor de los casos en uso y cerrar su plan de realización (P62); llevar a G7 los que tienen neto negativo.",
   donde:"documento 40, documento 43 y documento 21 (G7.01)", dims:["D7"]},
  {id:"FE-2", nombre:"Los casos no avanzan", resp:"Comité de IA",
   accion:"Llevar a su puerta los casos que superan el límite de días de su etapa y decidir: continuar con fecha, pivotar o parar.",
   donde:"documento 14 §8 y documento 20 §11", dims:["D2"]},
  {id:"FE-3", nombre:"Riesgo y cumplimiento sin cerrar", resp:"Responsable de riesgos y cumplimiento",
   accion:"Completar la clasificación regulatoria y los controles pendientes antes de G5 y abrir no conformidad en los casos que ya están en uso sin ellos.",
   donde:"documentos 32, 33 y 35; documento 21 (G5); documento 37", dims:["D6"]},
  {id:"FE-4", nombre:"Las personas no lo adoptan", resp:"Responsable de negocio del beneficio y Personas",
   accion:"Plan de adopción en las unidades por debajo del umbral y retirada o reasignación de licencias sin uso.",
   donde:"documento 23 y documento 40 §7.2", dims:["D5"]},
  {id:"FE-5", nombre:"Datos y tecnología no están listos", resp:"Responsable de datos y responsable de tecnología",
   accion:"Asegurar calidad, acceso y propiedad de los datos antes de la fase 3 (P64) y la plataforma que necesitan los casos.",
   donde:"documento 51 y documento 52", dims:["D3","D4"]},
  {id:"FE-6", nombre:"Falta dirección y gobierno", resp:"Alta dirección y consejo",
   accion:"Aprobar en C2 la tesis y la ambición por esfera y dar a cada caso un responsable de negocio del beneficio y una descripción defendible.",
   donde:"documento 13 y documento 30", dims:["D1"]}];
// motivo codificado de una parada o retirada (T01) → freno del que es síntoma; «Sustituida por otra solución» no es un freno
const MOTIVO_FRENO_DEF = {"Sin valor plausible":"FE-1", "Hipótesis refutada":"FE-1", "Coste superior al valor":"FE-1", "Riesgo inaceptable":"FE-3", "Regulación":"FE-3",
  "Sin adopción":"FE-4", "Datos insuficientes":"FE-5", "Inviable técnicamente":"FE-5", "Cambio de prioridad estratégica":"FE-6"};
// condiciones de base y alertas del índice de transformación (documento 12) → freno
const INDICE_FRENO = {B1:["FE-6","el índice de transformación no cumple B1 (cartera gobernada)"], B2:["FE-1","el índice de transformación no cumple B2 (valor validado)"], B3:["FE-2","el índice de transformación no cumple B3 (escala en producción)"],
  a_nomat:["FE-1","alerta del índice: eficiencia no materializada"], a_fragil:["FE-1","alerta del índice: transformación frágil"], a_atasc:["FE-2","alerta del índice: apuestas atascadas"],
  a_sinsup:["FE-3","alerta del índice: cambio sin supervisión"], a_sincons:["FE-6","alerta del índice: transformación sin consejo"], a_sobre:["FE-6","alerta del índice: sobredeclaración de ambición"], a_sobre_tr:["FE-6","alerta del índice: sobredeclaración en Transformar"]};
const NIVEL_MAD = ["Inexistente", "Inicial", "En desarrollo", "Definido", "Gestionado", "Optimizado"];
function cfgFrenos(){ const c = META().frenos_escalado || {};
  return {umbral_madurez: c.umbral_madurez ?? 2, meses: c.meses_patron ?? 12, motivos: Object.assign({}, MOTIVO_FRENO_DEF, c.motivos || {}),
    frenos: FRENOS_DEF.map(f => Object.assign({}, f, (c.textos || {})[f.id] || {}))}; }
function frenosEscalado(rows){
  const cf = cfgFrenos(), cfg = CICLO(), emb = cfg.embudo, gi = emb.indexOf(cfg.ganado), hoy = FECHA_PANEL();
  const desde = new Date(new Date(hoy) - cf.meses * 30.44 * 86400000).toISOString().slice(0,10);
  const vivos = rows.filter(c => !esSalida(c.estado)), enUso = rows.filter(c => esGanado(c.estado)), enCurso = rows.filter(c => esEnCurso(c.estado));
  const previa = gi > 0 ? emb[gi-1] : null;   // última etapa antes de producción: sus casos pasan G5 para entrar en uso
  const pend = c => { const k = rc(c).controles || {}; return CTRL.filter(x => k[x] !== "hecho" && k[x] !== "no_aplica"); };
  const F = {}; cf.frenos.forEach(f => F[f.id] = Object.assign({}, f, {senales: []}));
  const add = (id, s) => { if (F[id] && (s.casos ? s.casos.length : true)) F[id].senales.push(Object.assign({casos: [], bloquea: null, empresa: false, patron: false}, s)); };
  const lista = cs => cs.map(c => esc(c.nombre)).join(", ");
  // FE-1 · valor
  const sinVal = enUso.filter(c => { const r = R(c), t = (r.eficiencias || 0) + (r.retorno || 0); return t > 0 && (r.valor_por_estado.validado || 0) < t; });
  add("FE-1", {txt: `${sinVal.length} en uso con valor sin validar (${fmt(sum(sinVal.map(c => (R(c).eficiencias || 0) + (R(c).retorno || 0) - (R(c).valor_por_estado.validado || 0))))} sin validar)`, casos: sinVal, bloquea: "G7 · Escalar (G7.01)"});
  const neg = enUso.filter(c => R(c).neto < 0);
  add("FE-1", {txt: `${neg.length} en uso con neto anual negativo: cuestan más de lo que aportan o no miden su valor`, casos: neg});
  const cap = rows.filter(c => (R(c).capacidad || 0) > 0);
  add("FE-1", {txt: `${cap.length} con capacidad liberada sin materializar (${fmt(sum(cap.map(c => R(c).capacidad)))}, no suma en el neto)`, casos: cap});
  // FE-2 · avance
  const pl = c => plazoDe(c).nivel, rojos = enCurso.filter(c => pl(c) === "rojo"), amar = enCurso.filter(c => pl(c) === "amarillo");
  add("FE-2", {txt: `${rojos.length} superan el límite de días de su etapa`, casos: rojos});
  add("FE-2", {txt: `${amar.length} están cerca del límite de días de su etapa`, casos: amar});
  // FE-3 · riesgo y cumplimiento
  if (previa){ const pd = enCurso.filter(c => c.estado === previa && pend(c).length);
    add("FE-3", {txt: `${pd.length} en «${esc(previa)}» con controles pendientes`, casos: pd, bloquea: "G5 · puesta en producción"}); }
  const pu = enUso.filter(c => pend(c).length);
  add("FE-3", {txt: `${pu.length} en uso con controles pendientes: no conformidad`, casos: pu});
  const sinCl = vivos.filter(c => !rc(c).clasificacion_ria);
  add("FE-3", {txt: `${sinCl.length} sin clasificación regulatoria de la compañía (solo hay estimación)`, casos: sinCl});
  // FE-4 · adopción
  const baja = rows.filter(c => adopcionBaja(c).length);
  add("FE-4", {txt: `${baja.length} con unidades por debajo del umbral de adopción: ${baja.flatMap(c => adopcionBaja(c).map(u => `${esc(u.unidad)} ${Math.round(adopcionPct(u))} %`)).join(", ")}`, casos: baja});
  // FE-6 · dirección
  const sinResp = vivos.filter(c => !rc(c).propietario_negocio);
  add("FE-6", {txt: `${sinResp.length} sin responsable de negocio del beneficio`, casos: sinResp});
  const sinDesc = vivos.filter(c => !c.que_es);
  add("FE-6", {txt: `${sinDesc.length} sin descripción de qué es y para qué se usa`, casos: sinDesc});
  // patrones: paradas y retiradas del último periodo por un motivo que es síntoma de un freno (no cuentan como casos afectados)
  const porMotivo = {};
  rows.filter(c => esSalida(c.estado) && (fechaSalida(c) || "") >= desde).forEach(c => { const m = (rc(c).retirada || {}).motivo || "";
    const lab = Object.keys(cf.motivos).find(l => m.includes(l)); if (lab && cf.motivos[lab]) (porMotivo[lab] = porMotivo[lab] || []).push(c); });
  Object.entries(porMotivo).forEach(([lab, cs]) => add(cf.motivos[lab], {txt: `${cs.length} ${cs.length === 1 ? "parada o retirada" : "paradas o retiradas"} en los últimos ${cf.meses} meses por «${esc(lab)}»: ${lista(cs)}`, casos: cs, patron: true}));
  // compañía: madurez (documento 11) e índice de transformación (documento 12); no dependen de los filtros
  const faltan = [], md = DATA.madurez, dims = md && Array.isArray(md.dimensiones) ? md.dimensiones : [];
  if (!dims.length) faltan.push("Sin diagnóstico de madurez (T15): no se puede leer la capacidad de la compañía en cada freno.");
  else cf.frenos.forEach(f => (f.dims || []).forEach(d => { const x = dims.find(y => y.dimension === d); if (!x) return;
    const limita = md.tope_aplicado && (md.limitante || []).includes(d);
    if (x.nivel == null) { faltan.push(`${d}: nivel de madurez sin dato.`); return; }
    if (x.nivel <= cf.umbral_madurez || limita) add(f.id, {txt: `${esc(d)} · ${esc(x.nombre || "")} en nivel ${x.nivel} (${NIVEL_MAD[x.nivel] || ""})${limita ? " y limita el nivel global de madurez" : ""}${(x.bloqueantes || []).length ? `; bloqueantes: ${x.bloqueantes.map(esc).join(", ")}` : ""}`,
      empresa: true, bloquea: limita ? "el nivel global de madurez (11 §5)" : null}); }));
  const ix = DATA.indice;
  if (!ix) faltan.push("Sin índice de transformación (T14): no se leen sus condiciones de base ni sus alertas.");
  else { Object.entries(ix.condiciones_base || {}).forEach(([b, v]) => { if (v === false && INDICE_FRENO[b]) add(INDICE_FRENO[b][0], {txt: INDICE_FRENO[b][1], empresa: true}); });
    (ix.alertas || []).forEach(a => { if (INDICE_FRENO[a]) add(INDICE_FRENO[a][0], {txt: INDICE_FRENO[a][1], empresa: true}); }); }
  if (!rows.some(c => historial(c).origen !== "sin_dato")) faltan.push("Ningún caso tiene fechas de cambio de estado: no se puede saber si los casos se atascan.");
  // cada freno: casos afectados (sin repetir, sin los patrones), valor anual en juego, qué bloquea y nivel
  const out = Object.values(F).map(f => {
    const cs = [...new Map(f.senales.filter(s => !s.patron).flatMap(s => s.casos).map(c => [c.id, c])).values()];
    const vs = cs.map(valorEnJuego).filter(v => v != null);
    const bloq = [...new Set(f.senales.filter(s => s.bloquea).map(s => s.bloquea))];
    return Object.assign(f, {casos: cs, valor: vs.length ? sum(vs) : null, sinValor: cs.length - vs.length, bloquea: bloq,
      nivel: bloq.length ? "bloquea" : f.senales.length ? "activo" : "sin"}); });
  const peso = f => f.nivel === "bloquea" ? 0 : f.nivel === "activo" ? 1 : 2;
  out.sort((a, b) => peso(a) - peso(b) || (b.valor || 0) - (a.valor || 0) || b.casos.length - a.casos.length || b.senales.length - a.senales.length);
  return {frenos: out, prioridad: out.filter(f => f.nivel !== "sin").slice(0, 3), faltan};
}

// ---- dónde está el impacto: mapa de calor esferas × niveles de ambición (T16; SEVEN-G, documento 10 §8; D127). Filas: esferas de valor
// (meta.mapa_impacto.filas; sin la clave, las que traigan los casos en tags.funcion) o unidades de negocio; aparte, la banda de
// habilitación (esferas 08 y 09). Perímetro: casos activos que han superado G0 (fase ≥ 1 si el panel recibe la fase) y, aparte, los
// parados o retirados en los últimos meses. Color: proporción de la inversión de construcción y el coste recurrente anual de la celda sobre
// el total de las filas (sin actividad · baja < 5 % · media 5–15 % · alta > 15 %; umbrales de meta.mapa_impacto.umbrales, a calibrar en C5).
const AMB_COLS = ["Optimizar", "Aumentar", "Transformar"];
function cfgImpacto(){ const c = META().mapa_impacto || {}, u = c.umbrales || {};
  return {filas: Array.isArray(c.filas) && c.filas.length ? c.filas : null, habilitacion: c.habilitacion || [], objetivo: c.objetivo_c2 || {}, fuente: c.objetivo_fuente || null,
    baja: u.baja ?? 5, alta: u.alta ?? 15, meses: c.meses_retiradas ?? 12}; }
const codEsfera = s => (String(s || "").match(/^\d{2}/) || [""])[0];
function mapaImpacto(rows, modo){
  const cf = cfgImpacto(), hoy = FECHA_PANEL(), desde = new Date(new Date(hoy) - cf.meses * 30.44 * 86400000).toISOString().slice(0,10);
  const esf = modo !== "unidad", clave = c => esf ? ((c.tags || {}).funcion || "sin dato") : (c.unidad || "sin dato");
  const activo = c => !esSalida(c.estado) && (faseDe(c) == null || faseDe(c) >= 1);
  const act = rows.filter(activo), ret = rows.filter(c => esSalida(c.estado) && (fechaSalida(c) || "") >= desde);
  const hab = new Set(esf ? cf.habilitacion : []);
  const cols = [...AMB_COLS, ...(act.some(c => !AMB_COLS.includes((c.tags || {}).ambicion)) ? ["sin dato"] : [])];
  const colDe = c => AMB_COLS.includes((c.tags || {}).ambicion) ? c.tags.ambicion : "sin dato";
  const gasto = c => { const r = R(c); return (r.construccion || 0) + (r.recurrente || 0); };
  // neto anual: solo de los casos con alguna cifra actual (sin ellas el neto no es cero, es «aún no produce»); potencial: valor anual en juego
  const conActual = c => { const r = R(c); return r.eficiencias != null || r.retorno != null || r.recurrente != null; };
  const celda = cs => { const ca = cs.filter(conActual), vp = cs.map(valorEnJuego).filter(v => v != null);
    return {casos: cs, enUso: cs.filter(c => esGanado(c.estado)).length, gasto: sum(cs.map(gasto)), neto: ca.length ? sum(ca.map(c => R(c).neto)) : null,
      potencial: vp.length ? sum(vp) : null, validado: sum(cs.map(c => R(c).valor_por_estado.validado || 0)),
      propuesta: cs.filter(c => c.seveng && c.seveng.ambicion && !c.seveng.ambicion.real && !c.seveng.ambicion.confirmada).length}; };
  let etiquetas = esf && cf.filas ? cf.filas.filter(l => !hab.has(l)) : [...new Set(act.map(clave))].filter(l => !hab.has(l)).sort((a, b) => a.localeCompare(b, "es"));
  [...new Set(act.map(clave))].forEach(l => { if (!hab.has(l) && !etiquetas.includes(l)) etiquetas.push(l); });
  const enFilas = act.filter(c => !hab.has(clave(c))), total = sum(enFilas.map(gasto));
  const nivel = g => !g ? "sin" : !total ? "baja" : 100 * g / total > cf.alta ? "alta" : 100 * g / total >= cf.baja ? "media" : "baja";
  const doceMeses = new Date(new Date(hoy) - 365 * 86400000).toISOString().slice(0,10);
  const superoG2 = c => faseDe(c) != null ? faseDe(c) >= 3 : etapaAlcanzada(c) >= 2;
  const filas = etiquetas.map(l => {
    const cs = act.filter(c => clave(c) === l), obj = esf ? (cf.objetivo[l] || cf.objetivo[codEsfera(l)] || null) : null;
    const celdas = {}; cols.forEach(a => { const x = celda(cs.filter(c => colDe(c) === a)); x.nivel = nivel(x.gasto); x.pct = total ? 100 * x.gasto / total : null; celdas[a] = x; });
    const tot = celda(cs); tot.nivel = nivel(tot.gasto); tot.pct = total ? 100 * tot.gasto / total : null;
    const brecha = obj && AMB_COLS.includes(obj) && !celdas[obj].casos.some(superoG2) ? obj : null;
    const fuera = obj === "no_prioritaria" && tot.pct != null && tot.pct > 5;
    const sinEv = cs.filter(c => { const p = fechaDe(c, "produccion"); return esGanado(c.estado) && p && p <= doceMeses && !(R(c).valor_por_estado.validado > 0); });
    const cod = codEsfera(l), secundaria = esf && cod ? rows.filter(c => c.seveng && c.seveng.esfera_secundaria === cod && !esSalida(c.estado)).length : 0;
    return {etiqueta: l, objetivo: obj, celdas, total: tot, brecha, fuera, sinEv, secundaria, retiradas: ret.filter(c => clave(c) === l)};
  });
  const banda = celda(act.filter(c => hab.has(clave(c))));
  const colTot = {}; cols.forEach(a => { const x = celda(enFilas.filter(c => colDe(c) === a)); x.pct = total ? 100 * x.gasto / total : null; colTot[a] = x; });
  return {modo: esf ? "esfera" : "unidad", cols, filas, banda, bandaFilas: [...hab], colTot, total, activos: act.length, retiradas: ret, excluidos: rows.filter(c => !esSalida(c.estado) && !activo(c))};
}

// ---- plan de realización: curva y tramos (D135; misma lógica que economia.curva). SEVEN-G: la curva sale solo del plan registrado en
// T01 (43 §4.1, tramos de 14 §6.2); con curva_valor.estimar_sin_curva = false un caso sin plan no tiene curva (curva(c) = null).
// VAN F7 con H y r de C2 (40 §8). La inversión se hace por tramos, cada uno con fecha, importe,
// alcance y condición de paso para liberar el siguiente, y el valor se captura poco a poco (% del valor en régimen en cada periodo).
// El cálculo es trimestral y se agrega por año, semestre o trimestre. Sin curva reportada (economia.curva), se estima con reglas
// fijas y se marca como estimada. Configuración en meta.curva_valor (config_panel.json).
const CURVA_DEF = {granularidad:"anual", horizonte:{desde:null, hasta:null}, rampa_sin_plazo_trimestres:6,
  produccion_sin_fecha_trimestres:{"Propuesto":6, "Aprobado":4, "POC":4, "En desarrollo":2}, tasa_descuento_anual_pct:null,
  horizonte_van_anios:null, estimar_sin_curva:true};
const SIT_TRAMO = {ejecutado:"Ejecutado", comprometido:"Comprometido", previsto:"Previsto (pendiente de decidir)", opcional:"Opción (fuera del plan)"};
const EN_PLAN = new Set(["ejecutado","comprometido","previsto"]);
const OPERANDO = new Set(["En uso","Desenganchado"]);
const GRAN = {anual:"Año", semestral:"Semestre", trimestral:"Trimestre"};
const cfgCurva = () => Object.assign({}, CURVA_DEF, META().curva_valor || {});
function trimestre(s){
  if (s == null || s === "") return null;
  const m = String(s).trim().match(/^(\d{4})(?:-(?:[TQ]([1-4])|S([12])|(\d{1,2})(?:-\d{1,2})?))?$/);
  if (!m) return null;
  const y = +m[1];
  if (m[2]) return y*4 + (+m[2]) - 1;
  if (m[3]) return y*4 + ((+m[3]) - 1)*2;
  if (m[4]) return y*4 + Math.floor((Math.min(12, Math.max(1, +m[4])) - 1)/3);
  return y*4;
}
const nTrim = s => /^\d{4}$/.test(String(s)) ? 4 : /^\d{4}-S[12]$/.test(String(s)) ? 2 : 1;
function etiquetaQ(q, gran){ const y = Math.floor(q/4), t = q - y*4; return gran==="anual" ? String(y) : gran==="semestral" ? `${y}-S${Math.floor(t/2)+1}` : `${y}-T${t+1}`; }
// {periodo: valor} → {trimestre: valor}; lo más específico gana. Con repartir, el importe se divide entre los trimestres del periodo
function mapaQ(mapa, repartir){
  const out = {};
  Object.entries(mapa || {}).filter(([k,v]) => v != null && !String(k).startsWith("_") && trimestre(k) != null)
    .sort((a,b) => nTrim(b[0]) - nTrim(a[0])).forEach(([k,v]) => { const q = trimestre(k), n = nTrim(k); for (let i = 0; i < n; i++) out[q+i] = repartir ? v/n : v; });
  return out;
}
// captura en q: el punto si existe; entre dos puntos, lineal; antes del primero, 0; después del último, el último
function interpola(p, q){
  if (q in p) return p[q];
  const ks = Object.keys(p).map(Number), antes = ks.filter(k => k < q), despues = ks.filter(k => k > q);
  if (!antes.length) return 0;
  const a = Math.max(...antes); if (!despues.length) return p[a];
  const b = Math.min(...despues); return p[a] + (p[b] - p[a]) * (q - a) / (b - a);
}
function costeAnualCap(cap, cref, rec, recp){ if (cref >= 100) return recp; const av = Math.min(1, Math.max(0, (cap - cref)/(100 - cref))); return rec + (recp - rec)*av; }
const numIt = v => (v && typeof v === "object") ? v.importe : v;
const fmtN = v => Number(v).toLocaleString("es-ES");
let CUR = new WeakMap();
function curva(c){
  if (CUR.has(c)) return CUR.get(c);
  const cfg = cfgCurva(), r = R(c), e = eco(c), cv = e.curva || null, fechas = rc(c).fechas || {}, estado = c.estado;
  if (!cv && cfg.estimar_sin_curva === false){ CUR.set(c, null); return null; }
  const hoy = trimestre(String(META().generado || "").slice(0,10)) || 0, hz = cfg.horizonte || {};
  const q0 = (hz.desde || Math.floor(hoy/4) - 2) * 4, q1 = (hz.hasta || Math.floor(hoy/4) + 4) * 4 + 3;
  const vact = (r.eficiencias||0) + (r.retorno||0), rec = r.recurrente||0, recp = r.recurrente_pot||0, hip = [];
  const act = (cv||{}).actividad || {};
  let vreg;
  if (cv && numIt(cv.valor_regimen) != null) vreg = numIt(cv.valor_regimen);
  else if (cv && act.volumen_anual != null && act.valor_unitario != null){ vreg = act.volumen_anual * act.valor_unitario; hip.push(`Valor en régimen = ${fmtN(act.volumen_anual)} ${act.unidad || "unidades"} al año × ${fmtN(act.valor_unitario)} € por unidad`); }
  else vreg = (r.eficiencias_pot||0) + (r.retorno_pot||0);
  const cact = vreg > 0 ? Math.min(100, 100*vact/vreg) : 0;
  let prod, prodEst = false;
  if (trimestre(fechas.produccion) != null) prod = trimestre(fechas.produccion);
  else if (OPERANDO.has(estado) && trimestre(c.inicio_estimado) != null){ prod = trimestre(c.inicio_estimado); prodEst = true; hip.push(`Puesta en producción en ${etiquetaQ(prod)}: año de inicio estimado, sin fecha reportada`); }
  else { prod = hoy + Math.trunc((cfg.produccion_sin_fecha_trimestres || {})[estado] ?? 4); prodEst = true; hip.push(`Puesta en producción estimada en ${etiquetaQ(prod)}, sin fecha reportada`); }
  let fin = trimestre(fechas.retirada); if (fin == null && estado === "Desenganchado") fin = hoy;
  const plazo = trimestre(e.plazo_potencial), rampa = Math.trunc(cfg.rampa_sin_plazo_trimestres || 6);
  const inv = e.inversion || {};
  let tramos = [], puntos = {}, cref, origen;
  if (cv){
    origen = "reportada";
    (cv.tramos || []).forEach((t, i) => { const q = trimestre(t.fecha); if (q == null) return;
      tramos.push({id: t.id || `T${i+1}`, q, importe: numIt(t.importe) || numIt(t.inversion) || 0, estado: t.estado || cv.estado || "declarado", alcance: t.alcance || null,
        gate: t.gate || null, condicion_paso: t.condicion_paso || null, situacion: t.situacion || "previsto", captura_objetivo_pct: t.captura_objetivo_pct ?? null}); });
    puntos = mapaQ(cv.captura);
    cref = Object.keys(puntos).length ? interpola(puntos, hoy) : 0;
  } else {
    origen = "estimada";
    cref = OPERANDO.has(estado) ? cact : 0;
    if (r.construccion){
      let qi = trimestre(fechas.inicio); if (qi == null) qi = OPERANDO.has(estado) ? prod - 1 : Math.min(hoy, prod - 1);
      const sit = (OPERANDO.has(estado) && qi <= hoy) ? "ejecutado" : estado === "En desarrollo" ? "comprometido" : "previsto";
      tramos.push({id:"T1", q:qi, importe:r.construccion, estado:(inv.construccion||{}).estado || "estimado_cati", alcance:"Construcción", condicion_paso:null, situacion:sit,
        captura_objetivo_pct: OPERANDO.has(estado) ? cact : (r.adicional ? null : 100)});
    }
    if (r.adicional){
      const qa = !OPERANDO.has(estado) ? Math.max(hoy + 1, prod) : hoy + 1;
      tramos.push({id:"T2", q:qa, importe:r.adicional, estado:(inv.adicional_potencial||{}).estado || "estimado_cati", alcance:(inv.adicional_potencial||{}).hipotesis || "Ampliación hasta el potencial",
        condicion_paso:null, situacion:"previsto", captura_objetivo_pct:100});
    }
    if (OPERANDO.has(estado)){
      puntos[prod] = cact; if (hoy > prod) puntos[hoy] = cact;
      if (vreg > vact && (fin == null || fin > hoy)){
        const ini = Math.max(prod, hoy + (r.adicional ? 1 : 0)); puntos[ini] = cact;
        const fq = (plazo != null && plazo > ini) ? plazo : ini + rampa; puntos[fq] = 100;
        hip.push(`Captura constante al nivel actual (${Math.round(cact)} %) desde la producción; rampa lineal hasta el 100 % en ${etiquetaQ(fq)}` + (fq === plazo ? " (plazo del potencial)" : ` (${rampa} trimestres: sin plazo del potencial)`));
      } else hip.push(`Captura constante al nivel actual (${Math.round(cact)} %) desde la producción`);
    } else if (vreg > 0){
      puntos[prod] = 0; const fq = (plazo != null && plazo > prod) ? plazo : prod + rampa; puntos[fq] = 100;
      hip.push(`Rampa lineal desde la producción hasta el 100 % en ${etiquetaQ(fq)}` + (fq === plazo ? " (plazo del potencial)" : ` (${rampa} trimestres: sin plazo del potencial)`));
    }
    if (tramos.length) hip.push("Tramos: construcción y, si la hay, inversión adicional en el trimestre siguiente al de los datos, sin condición de paso fijada");
  }
  tramos.sort((a,b) => a.q - b.q);
  const decl = (cv||{}).declive || {}, qd = trimestre(decl.desde), pd = decl.pct_anual;
  const costes = mapaQ((cv||{}).coste_recurrente), ref = (cv||{}).referencia || {}, refP = mapaQ(ref.captura), hayRef = Object.keys(refP).length > 0;
  const refV = numIt(ref.valor_regimen) == null ? vreg : numIt(ref.valor_regimen), realRaw = (cv||{}).real || {}, reales = mapaQ(Object.fromEntries(Object.entries(realRaw).map(([k,v]) => [k, (v && typeof v === "object") ? v.importe : v])), true),
    realesVal = mapaQ(Object.fromEntries(Object.entries(realRaw).filter(([,v]) => v && typeof v === "object" && v.estado === "validado").map(([k,v]) => [k, v.importe])), true), hayP = Object.keys(puntos).length > 0;
  const qa = Math.min(q0, prod, ...tramos.map(t => t.q)), serie = [];
  let acum = 0;
  for (let q = qa; q <= q1; q++){
    const invq = sum(tramos.filter(t => t.q === q && EN_PLAN.has(t.situacion)).map(t => t.importe));
    let cap = hayP ? interpola(puntos, q) : 0; if (fin != null && q >= fin) cap = 0;
    const operando = (q >= prod || (origen === "reportada" && cap > 0)) && (fin == null || q < fin);
    const factor = (qd != null && pd && q >= qd) ? Math.pow(1 - pd/100, (q - qd)/4) : 1;
    const valor = operando ? cap/100 * vreg/4 * factor : 0;
    const coste = operando ? ((q in costes) ? costes[q] : costeAnualCap(cap, cref, rec, recp)) / 4 : 0;
    const neto = valor - coste - invq; acum += neto;
    serie.push({q, inv:invq, valor, coste, neto, acum, cap: operando ? cap : 0, ref: (hayRef && operando) ? interpola(refP, q)/100 * refV/4 : null, real: (q in reales) ? reales[q] : null, real_val: (q in realesVal) ? realesVal[q] : null});
  }
  // rendimiento de cada tramo: neto anual que desbloquea frente al nivel del tramo anterior
  let pc = 0, pco = 0;
  tramos.forEach(t => {
    const obj = t.captura_objetivo_pct;
    if (obj == null){ Object.assign(t, {valor_anual_inc:null, neto_anual_inc:null, rendimiento:null, payback_anios:null}); return; }
    const co = costeAnualCap(obj, cref, rec, recp), vi = (obj - pc)/100 * vreg, ni = vi - (co - pco);
    Object.assign(t, {valor_anual_inc:vi, neto_anual_inc:ni, rendimiento: t.importe ? ni/t.importe : null, payback_anios: (t.importe && ni > 0) ? t.importe/ni : null});
    pc = obj; pco = co;
  });
  tramos.forEach(t => t.periodo = etiquetaQ(t.q));
  const out = {id:c.id, origen, estado:(cv||{}).estado || "estimado_cati", fuente:(cv||{}).fuente || null, valor_regimen:vreg, captura_actual_pct:cact,
    produccion:etiquetaQ(prod), produccion_estimada:prodEst, hoy, q0, q1, serie, tramos, hipotesis:hip,
    ...metricasCurva(serie, hoy, q0, q1, cfg.tasa_descuento_anual_pct)};
  out.van_f7 = vanF7(serie, tramos, cfg);
  const rq = serie.filter(x => x.real != null && x.q <= hoy), planR = sum(rq.map(x => x.ref != null ? x.ref : x.valor)), realR = sum(rq.map(x => x.real)), realV = sum(rq.map(x => x.real_val || 0));
  out.desviacion = rq.length ? {real:realR, plan:planR, pct: planR ? 100*realR/planR : null, real_validado:realV, pct_validado: planR ? 100*realV/planR : null, periodos:rq.length, frente_a: hayRef ? "referencia" : "plan"} : null;
  CUR.set(c, out); return out;
}
// VAN F7 (40 §6 y §8): flujos anuales de la curva descontados con r desde el año del primer tramo (t = 0) hasta t = H; r = 0 si C2 no fija tasa
function vanF7(serie, tramos, cfg){
  const H = cfg.horizonte_van_anios; if (!H || !tramos.length) return null;
  const r = (cfg.tasa_descuento_anual_pct || 0)/100, y0 = Math.floor(Math.min(...tramos.map(t => t.q))/4), fl = {};
  serie.forEach(x => { const y = Math.floor(x.q/4); if (y >= y0 && y <= y0 + Math.trunc(H)) fl[y] = (fl[y] || 0) + x.neto; });
  return sum(Object.entries(fl).map(([y, v]) => v / Math.pow(1 + r, (+y) - y0)));
}
function metricasCurva(serie, hoy, q0, q1, tasa){
  let minimo = 0, qmin = null;
  serie.forEach(x => { if (x.acum < minimo - 1e-9){ minimo = x.acum; qmin = x.q; } });
  let payback = null, motivo = null;
  if (qmin == null) motivo = "sin_inversion_neta";
  else { const x = serie.find(x => x.q > qmin && x.acum >= 0); if (x) payback = x.q; else motivo = "fuera_horizonte"; }
  const hz = serie.filter(x => x.q >= q0 && x.q <= q1), fut = serie.filter(x => x.q > hoy && x.q <= q1);
  // caja que aún hace falta por delante: cuánto baja el acumulado desde hoy hasta su mínimo futuro (lo ya gastado no cuenta)
  const pasado = serie.filter(x => x.q <= hoy), acumHoy = pasado.length ? pasado[pasado.length-1].acum : 0;
  const cajaFutura = Math.max(0, acumHoy - Math.min(acumHoy, ...fut.map(x => x.acum)));
  return {payback_q:payback, payback: payback != null ? etiquetaQ(payback) : null, payback_motivo:motivo, caja_max:-minimo, caja_max_q:qmin, caja_futura:cajaFutura,
    inv_12m: sum(serie.filter(x => x.q > hoy && x.q <= hoy + 4).map(x => x.inv)), inv_futura: sum(fut.map(x => x.inv)), valor_futuro: sum(fut.map(x => x.valor)),
    neto_futuro: sum(fut.map(x => x.neto)), van_futuro: tasa ? sum(fut.map(x => x.neto / Math.pow(1 + tasa/100, (x.q - hoy)/4))) : null,
    neto_horizonte: sum(hz.map(x => x.neto)), inv_horizonte: sum(hz.map(x => x.inv)), valor_horizonte: sum(hz.map(x => x.valor))};
}
// curva en J de una lista de casos: suma trimestral de sus curvas y métricas del conjunto
function curvaCartera(rows){
  const cs = rows.map(curva).filter(Boolean); if (!cs.length) return null;
  const {hoy, q0, q1} = cs[0], qa = Math.min(...cs.map(c => c.serie[0].q)), pq = {};
  for (let q = qa; q <= q1; q++) pq[q] = {q, inv:0, valor:0, coste:0, neto:0, real:null, real_val:null, ref:null};
  cs.forEach(c => c.serie.forEach(x => { const d = pq[x.q]; ["inv","valor","coste","neto"].forEach(k => d[k] += x[k]); if (x.real != null) d.real = (d.real||0) + x.real; if (x.real_val != null) d.real_val = (d.real_val||0) + x.real_val; if (x.ref != null) d.ref = (d.ref||0) + x.ref; }));
  let acum = 0; const serie = [];
  for (let q = qa; q <= q1; q++){ acum += pq[q].neto; serie.push({...pq[q], acum}); }
  return {hoy, q0, q1, serie, casos:cs.length, reportadas:cs.filter(c => c.origen === "reportada").length, ...metricasCurva(serie, hoy, q0, q1, cfgCurva().tasa_descuento_anual_pct)};
}
// agrega una serie trimestral por año, semestre o trimestre dentro del horizonte; el acumulado es el del último trimestre del grupo
function agruparCurva(serie, gran, q0, q1){
  const g = [];
  serie.filter(x => x.q >= q0 && x.q <= q1).forEach(x => {
    const et = etiquetaQ(x.q, gran);
    if (!g.length || g[g.length-1].periodo !== et) g.push({periodo:et, q_ini:x.q, inv:0, valor:0, coste:0, neto:0, real:null, real_val:null, ref:null});
    const u = g[g.length-1]; ["inv","valor","coste","neto"].forEach(k => u[k] += x[k]);
    ["real","real_val","ref"].forEach(k => { if (x[k] != null) u[k] = (u[k]||0) + x[k]; });
    u.acum = x.acum; u.q_fin = x.q;
  });
  return g;
}
const pbTxt = cu => !cu ? "sin plan de realización" : cu.payback ? cu.payback : cu.payback_motivo === "sin_inversion_neta" ? "sin inversión que recuperar" : "no se recupera en el horizonte";
// captura frente al plan (o a la referencia aprobada) en los periodos con valor real: semáforo con umbrales_kpi.captura_frente_plan_pct
// realización F10 acumulada (43 §9.1, IND-VAL-14): semáforo con umbrales_kpi.realizacion_pct
const nivelDesv = cu => cu && cu.desviacion && cu.desviacion.pct != null ? nivelKPI("realizacion_pct", cu.desviacion.pct) : "";
// ---- tres perspectivas del caso (40 §11.1, regla 11; D150): resultado operativo y exposición al riesgo que el conector de T01 pasa en
// casos[].seveng.perspectivas; el valor económico ya es R(c). Se presentan en paralelo y nunca se fusionan. null si el caso no las trae.
function enObjetivo(x){ if (!x || typeof x.actual!=="number" || typeof x.objetivo!=="number") return null; const baja = x.sentido ? x.sentido==="bajar" : (typeof x.base==="number" ? x.objetivo<x.base : false); return baja ? x.actual<=x.objetivo : x.actual>=x.objetivo; }
function perspectivasDe(c){
  const p = (c.seveng||{}).perspectivas; if (!p) return null;
  const ro = p.resultado_operativo || [], est = ro.map(enObjetivo);
  return {ro, en_objetivo: est.filter(x=>x===true).length, por_debajo: est.filter(x=>x===false).length, sin_medir: est.filter(x=>x==null).length,
    riesgos_altos: p.riesgos_altos_abiertos || 0, incidentes: p.incidentes_abiertos || 0, no_conformidades: p.no_conformidades_abiertas || 0};
}
const operTxt = pp => !pp ? "" : !pp.ro.length ? "sin indicador" : `${pp.en_objetivo} de ${pp.ro.length} en objetivo` + (pp.por_debajo ? ` · ${pp.por_debajo} por debajo` : "") + (pp.sin_medir ? ` · ${pp.sin_medir} sin medir` : "");
const expoTxt = pp => !pp ? "" : `${pp.riesgos_altos} riesgo${pp.riesgos_altos===1?"":"s"} alto${pp.riesgos_altos===1?"":"s"} o crítico${pp.riesgos_altos===1?"":"s"} · ${pp.incidentes} incidente${pp.incidentes===1?"":"s"} · ${pp.no_conformidades} no conformidad${pp.no_conformidades===1?"":"es"}`;
// ---- valor no cuantificado (40 regla 7 y §5.3; misma lógica que economia.no_monetario): dimensión y nivel de 0 a 3 con métrica física
// obligatoria y motivo; nunca en euros. «opcion» es el valor de opción de Transformar.
const DIM_NM = {imagen:"Imagen y reputación", posicionamiento:"Posicionamiento competitivo", cliente:"Experiencia de cliente", distribucion:"Red comercial y de distribución", talento:"Talento y capacidades", opcion:"Opción estratégica (valor de opción)"};
const NIVEL_NM = ["sin efecto","bajo","medio","alto"];
const dimNM = k => TX("nm_" + k, DIM_NM[k] || k);
let NMC = new WeakMap();
function noMonetario(c){
  if (NMC.has(c)) return NMC.get(c);
  const rep = rc(c), dims = (rep.valor_no_monetario || []).map(d => { let n = parseInt(d.nivel, 10); n = isNaN(n) ? 0 : Math.max(0, Math.min(3, n)); return {...d, nivel:n, con_indicador: !!d.indicador, cuenta: n >= 1 && !!d.indicador}; });
  const max = Math.max(0, ...dims.filter(d => d.cuenta).map(d => d.nivel)), sinInd = dims.filter(d => d.nivel >= 1 && !d.con_indicador).length;
  // sostenido por valor no cuantificado: nivel medio o alto con métrica y VAN F7 negativo o sin plan que lo demuestre (sin H, sin recuperar en el horizonte)
  const cu = curva(c), sinDemostrar = !cu ? true : cu.van_f7 != null ? cu.van_f7 < 0 : cu.payback_motivo === "fuera_horizonte";
  // solo en producción (fases 6 y 7, donde hay R6); antes, el valor de opción de Transformar se gobierna por etapas y gates (40 §8.3)
  const fase = (c.seveng || {}).fase, enProd = fase == null || fase >= 6;
  const rev = rep.revision_estrategica || null, estrategico = max >= 2 && sinDemostrar && enProd, hoy = String(META().generado || "").slice(0,10);
  const out = {dimensiones:dims, max_nivel:max, sin_indicador:sinInd, estrategico, revision:rev, aviso: estrategico && !rev ? "sin_revision" : (estrategico && rev && String(rev) < hoy ? "revision_vencida" : null)};
  NMC.set(c, out); return out;
}
"""
