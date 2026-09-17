# Copia mantenida en AI_CONSULTING (SEVEN-G, T17) desde 17-09-2026; origen: AI_en_el_consejo/motor (MIT, mismo autor).
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
// valor imputado (misma regla que economia.py): un caso con coste recurrente y sin valor recibe multiplicador × coste; se
// guarda aparte, suma en el neto y se marca ⚠ en todo lo que lo muestre porque NO es un dato de la organización
const IMP_MULT = () => { const m = META().valor_imputado_multiplicador; return (m == null || isNaN(m)) ? 0 : Number(m); };  // motor genérico: desactivado salvo que meta lo fije
const IMP_MULT_TXT = () => IMP_MULT().toLocaleString("es-ES", {maximumFractionDigits: 2});
const IMP_ICON = () => `<span class="wi" title="${esc(IMP_TXT())}">⚠</span>`;
const IMP_TXT = () => TX("aviso_imputado_corto", "⚠ valor imputado: {mult} × coste, no es un dato").replace("{mult}", IMP_MULT_TXT());
const IMP_LARGO = () => TX("aviso_imputado", "Los casos sin valor reportado llevan un valor imputado igual a {mult} veces su coste recurrente anual, marcado con ⚠: no es un dato de la compañía, solo evita que aparezcan a cero o deficitarios hasta que se mida su valor.").replace("{mult}", IMP_MULT_TXT());
// agentes y asistentes generativos: la misma definición en el panel completo y en el móvil
const esAgente = c => /Agéntico|GenAI/.test((c.tags||{}).tecnologia || "");
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
  const z = k => r[k]||0, mult = IMP_MULT();
  // valor imputado: sin valor (eficiencias que cuentan + retorno = 0 o sin dato) pero con coste recurrente > 0
  r.imputado = !!mult && z("eficiencias") + z("retorno") === 0 && z("recurrente") > 0;
  r.imputado_pot = !!mult && z("eficiencias_pot") + z("retorno_pot") === 0 && z("recurrente_pot") > 0;
  r.valor_imputado = r.imputado ? mult * z("recurrente") : 0;
  r.valor_imputado_pot = r.imputado_pot ? mult * z("recurrente_pot") : 0;
  r.neto = z("eficiencias") + z("retorno") + r.valor_imputado - z("recurrente");
  r.neto_pot = z("eficiencias_pot") + z("retorno_pot") + r.valor_imputado_pot - z("recurrente_pot");
  r.neto_adicional = r.neto_pot - r.neto;
  r.rendimiento_adicional = r.adicional ? r.neto_adicional / r.adicional : null;
  r.payback_anios = (r.construccion && r.neto > 0) ? r.construccion / r.neto : null;
  const pe = {validado:0, declarado:0, estimado_cati:0, imputado:0};
  [...ef.filter(cu), ...rt].forEach(l=>{ const v = imp(l.actual); if (v != null){ const k = l.actual.estado || "estimado_cati"; pe[k] = (pe[k]||0) + v; } });
  pe.imputado = r.valor_imputado;
  r.valor_por_estado = pe; RES.set(c, r); return r;
}
const P = () => state.lado === "potencial";
function valorDe(c){ const r = R(c); return P() ? (r.eficiencias_pot||0) + (r.retorno_pot||0) + r.valor_imputado_pot : (r.eficiencias||0) + (r.retorno||0) + r.valor_imputado; }
function imputadoDe(c){ const r = R(c); return P() ? r.imputado_pot : r.imputado; }
function costeDe(c){ const r = R(c); return (P() ? r.recurrente_pot : r.recurrente) || 0; }
function netoDe(c){ const r = R(c); return P() ? r.neto_pot : r.neto; }
function potDe(c){ return R(c).neto_pot; }
function costeEsEstimado(c){ const it = (eco(c).inversion||{}).recurrente_anual; return !it || it.estado === "estimado_cati"; }
function estadoTxt(c){ const pe = R(c).valor_por_estado; return pe.validado ? "validado" : pe.declarado ? "declarado" : pe.estimado_cati ? "estimado" : pe.imputado ? "imputado" : "sin dato"; }
// suma del valor por estado de una lista de casos (validado, declarado, estimado e imputado)
function porEstado(cs){ const pe = {validado:0, declarado:0, estimado_cati:0, imputado:0}; cs.forEach(c=>Object.entries(R(c).valor_por_estado).forEach(([a,b])=>pe[a]=(pe[a]||0)+b)); return pe; }
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
function fechaProd(c){ const p = (rc(c).fechas||{}).produccion; if (p) return {f:p, est:false}; return (c.estado==="En uso"||c.estado==="Desenganchado") ? {f:String(c.inicio_estimado), est:true} : {f:null, est:true}; }
function esNuevo(c, f){ if (!f) return false; const x = (f.casos||{})[c.id]; const p = (rc(c).fechas||{}).produccion; return !x || (p && p > f.fecha && x.estado !== "En uso"); }
"""
