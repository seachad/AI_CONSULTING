/* =========================================================
   T17 · Conector del registro de iniciativas T01 al panel de IA del Consejo, en JavaScript (D101).
   © 2026 Fernando García Varela · Metodología SEVEN-G · Código MIT · Contenidos CC BY 4.0

   Es la MISMA correspondencia T01 → JSON del panel (motor/ESQUEMA.md) que t01_a_panel.py, escrita para el navegador: el panel del
   consejo la lleva incrustada y con ella se regenera solo, sin Python ni uv, a partir del registro T01 guardado en el navegador
   (mismo origen), del fichero herramientas/datos/T01_registro.json de la copia de la compañía o de un JSON de T01 cargado a mano.
   También la incrusta el registro T01 para descargar dashboard_data.json. verificar_coherencia.ps1 comprueba que produce
   exactamente el mismo JSON que el conector en Python con los datos de demostración (única correspondencia, D43).

   Uso:  SevengT17.convertir(t01, {config, sigla, organizacion, prefijo, enlaces_pie, demo})  -> JSON del panel
         SevengT17.bloqueIndice(t14)                                                            -> bloque «indice» opcional
   config: contenido de config_panel.json (las claves que empiezan por «_» se ignoran). Sin config, ciclo de vida por defecto.
   Funciona en el navegador y en cualquier motor de JavaScript (no usa el DOM).
   ========================================================= */
(function (raiz) {
'use strict';
const VERSION_CONECTOR = "2.1";
const ESQUEMAS_T01 = ["0.1", "0.2", "0.3", "0.4", "0.5", "0.6"];
const FUENTE_T01 = "Registro de iniciativas T01";
const RUTA_CONECTOR = "SEVEN-G/herramientas/T17_panel_consejo/t01_a_panel.js";

const FASES = {0: "Contexto y restricciones", 1: "Descubrimiento", 2: "Hipótesis de valor", 3: "Viabilidad y riesgo", 4: "Diseño de la solución",
  5: "Entrega y validación", 6: "Operación y gobierno", 7: "Evolución o retirada"};
const ESTADOS_T01 = {registrada: "Registrada", en_fase: "En fase", pendiente_gate: "Pendiente de gate", en_espera: "En espera",
  en_produccion: "En producción", pendiente_g7: "Pendiente de G7", parada: "Parada", retirada: "Retirada"};
const ESFERAS = {"01": "01 Cliente", "02": "02 Producto y servicio", "03": "03 Personas", "04": "04 Operaciones", "05": "05 Datos", "06": "06 Conocimiento",
  "07": "07 Decisión", "08": "08 Regulación, ética y responsabilidad", "09": "09 Gobierno de la IA"};
const AMBICION = {optimizar: "Optimizar", aumentar: "Aumentar", transformar: "Transformar"};
const TECNOLOGIA = {ml_predictivo: "ML predictivo", ia_generativa: "GenAI", agente: "Agéntico", lenguaje_documentos: "NLP / IDP", vision: "Visión artificial",
  optimizacion: "Optimización", ia_terceros_embebida: "IA de tercero", reglas: "Reglas (no es IA)"};
const TECNOLOGIA_TXT = {ml_predictivo: "ML predictivo", ia_generativa: "IA generativa", agente: "Agente", lenguaje_documentos: "Procesamiento de lenguaje y documentos",
  vision: "Visión", optimizacion: "Optimización", ia_terceros_embebida: "IA de terceros embebida", reglas: "Reglas (no es IA)"};
const NATURALEZA = {ml_predictivo: "ML / NLP tradicional", ia_generativa: "IA generativa / agéntica", agente: "IA generativa / agéntica", lenguaje_documentos: "ML / NLP tradicional",
  vision: "ML / NLP tradicional", optimizacion: "Analítica y optimización", ia_terceros_embebida: "IA de tercero", reglas: "Reglas de negocio (no es IA)"};
const EXPOSICION = {interna: "Interno", empleados: "Empleado", clientes_indirecta: "Cliente (indirecta)", clientes_directa: "Cliente / persona externa (directa)"};
const REGULATORIA_TAG = {prohibido: "Prohibido", alto_riesgo: "Alto riesgo", transparencia: "Transparencia (art. 50)", riesgo_minimo: "Riesgo mínimo",
  fuera_ambito: "Fuera de ámbito", pendiente: "Por confirmar"};
const REGULATORIA_RIA = {prohibido: "prohibido", alto_riesgo: "alto_riesgo", transparencia: "transparencia", riesgo_minimo: "minimo", fuera_ambito: "no_es_ia", pendiente: null};
const TIPO_VALOR = {eficiencia: "Eficiencia", retorno: "Retorno", riesgo_evitado: "Riesgo evitado", cumplimiento: "Cumplimiento"};
const MOTIVO = {sin_valor_plausible: "Sin valor plausible", hipotesis_refutada: "Hipótesis refutada", datos_insuficientes: "Datos insuficientes",
  inviable_tecnicamente: "Inviable técnicamente", coste_superior_valor: "Coste superior al valor", riesgo_inaceptable: "Riesgo inaceptable",
  regulacion: "Regulación", sin_adopcion: "Sin adopción", sustituida: "Sustituida por otra solución", cambio_prioridad: "Cambio de prioridad estratégica"};
const RESULTADO = {continuar: "Continuar", continuar_condiciones: "Continuar con condiciones", iterar: "Iterar", pivotar: "Pivotar", parar: "Parar",
  escalar: "Escalar", retirar: "Retirar", continuar_operacion: "Continuar la operación", adelantar_g7: "Adelantar G7"};
const ORGANO = {patrocinador: "Patrocinador", patrocinador_conformidad_riesgos: "Patrocinador con conformidad de riesgos",
  patrocinador_informando_comite: "Patrocinador informando al comité", comite_ia: "Comité de IA", comite_ia_firma_multinivel: "Comité de IA (firma multinivel)",
  consejo: "Consejo", organo_superior: "Órgano superior"};
const EVALUACION = {hecha: "hecho", pendiente: "pendiente", no_aplica: "no_aplica"};
const RIESGO_TIER = {bajo: "bajo", medio: "medio", alto: "alto", critico: "alto"};
const PRIORIDAD = {alta: "Alta", media: "Media", baja: "Baja"};
const COMPLEJIDAD = ["baja", "media", "alta"];
const CONTROL = ["hecho", "pendiente", "no_aplica"];
const CONCEPTOS = {eficiencias: ["personas", "herramientas", "siniestros", "operativo", "penalizaciones"],
  retorno: ["venta_nueva", "venta_cruzada", "retencion", "precio_margen", "cobros", "otros"]};
const CONCEPTO_POR_DEFECTO = {eficiencias: "operativo", retorno: "otros"};
const ALCANCE = {transversal: "Transversal", plataforma: "Plataforma habilitadora"};
const UNIDAD_TRANSVERSAL = "Varias unidades (transversal)";
const CICLO_POR_DEFECTO = {
  fases_seven_g: {"0": "Propuesto", "1": "Propuesto", "2": "Hipótesis de valor", "3": "POC", "4": "En desarrollo", "5": "En desarrollo", "6": "En uso", "7": "En uso"},
  embudo: ["Propuesto", "Hipótesis de valor", "POC", "En desarrollo", "En uso"], ganado: "En uso",
  salidas: {"No aprobado": ["Propuesto"], "Descartado": ["Hipótesis de valor", "POC", "En desarrollo"], "Desenganchado": ["En uso"]}
};
const CONTINUAN = ["continuar", "continuar_condiciones"];
const GLOSARIO_SEVEN_G = [
  ["SEVEN-G", "SEVEN-G", "Metodología de gobierno de la IA", "Marco con el que se registran las iniciativas: fases 0 a 7, puertas de decisión (gates), ambición e intensidad.", false],
  ["SEVEN-G", "T01", "Registro de iniciativas", "Herramienta de SEVEN-G de la que salen los datos de este panel: fases, estados, eventos, gates, valor e incidentes.", true],
  ["SEVEN-G", "G3", "Gate de viabilidad y riesgo", "Puerta de decisión que aprueba construir. En este panel, su fecha es la de aprobación.", true],
  ["SEVEN-G", "G5", "Gate de paso a producción", "Puerta de decisión que autoriza operar. En este panel, su fecha es la de puesta en producción.", true],
  ["SEVEN-G", "R6", "Revisión de continuidad", "Revisión periódica de una iniciativa en producción: continuar, continuar con condiciones o adelantar G7. Cuenta como reevaluación.", false],
  ["SEVEN-G", "Ambición", "Optimizar, Aumentar o Transformar", "Nivel de ambición de la iniciativa: se usa la real si existe; si no, la confirmada; si no, la propuesta.", false],
  ["SEVEN-G", "Embudo", "Etapas del panel y fases de SEVEN-G", "Propuesto = fases 0 y 1 · Hipótesis de valor = fase 2 · POC = fase 3 (viabilidad y riesgo) · En desarrollo = fases 4 y 5 · " +
    "En uso = fases 6 y 7. Una parada en las fases 0-1 figura como No aprobado; en las fases 2-5, como Descartado; una retirada, como Desenganchado. " +
    "Las fechas de cada cambio salen de los eventos de T01.", false],
  ["SEVEN-G", "Transversal", "Iniciativa transversal", "Herramienta que usan varias unidades de negocio (por ejemplo, un asistente generativo en la suite ofimática). " +
    "Se mide por unidad con una escalera: coste, adopción, capacidad liberada declarada (no suma) y valor materializado (documento 40 §7.2).", true],
  ["SEVEN-G", "Plataforma", "Plataforma habilitadora", "Capacidad común (datos, conocimiento, decisión) cuyo valor se imputa a los casos que la usan; " +
    "en la plataforma solo cuenta su coste (documento 10 §4.1, regla 3).", false]
];
// textos comunes de lo publicado (publicacion_panel.py)
const AUTOR = "Fernando García Varela", METODOLOGIA = "SEVEN-G", REPO_ORIGEN_MOTOR = "https://github.com/Seachad-TEAM/AI_en_el_consejo";
const AVISO_LEGAL = "<b>Aviso legal.</b> Demostración con datos ficticios del registro de iniciativas T01 de SEVEN-G, ofrecida «tal cual» y con fines " +
  "informativos. No constituye asesoramiento jurídico, regulatorio ni financiero ni garantiza el cumplimiento de ninguna norma. " +
  "Las clasificaciones y referencias a regulación general o sectorial pueden quedar desactualizadas: cada organización es la única " +
  "responsable de verificar la normativa que le aplica y certificar su propio cumplimiento regulatorio. El autor no asume " +
  "responsabilidad por su uso.";
const AVISO_LEGAL_CORTO = "Aviso legal: datos ficticios, «tal cual» y con fines informativos; no es asesoramiento jurídico, regulatorio ni financiero ni " +
  "garantiza el cumplimiento de ninguna norma. Cada organización verifica la normativa que le aplica.";
const AVISO_LEGAL_DATOS_PROPIOS = "<b>Aviso legal.</b> Panel generado desde el registro de iniciativas T01 de SEVEN-G con el motor de AI en el Consejo, " +
  "ofrecido «tal cual» y con fines informativos. No constituye asesoramiento jurídico, regulatorio ni financiero ni " +
  "garantiza el cumplimiento de ninguna norma. Las clasificaciones y referencias a regulación general o sectorial pueden " +
  "quedar desactualizadas: cada organización es la única responsable de verificar la normativa que le aplica y certificar " +
  "su propio cumplimiento regulatorio. El autor no asume responsabilidad por su uso.";
const AVISO_CORTO_PROPIOS = "Aviso legal: «tal cual» y con fines informativos; no es asesoramiento jurídico, regulatorio ni financiero ni garantiza el cumplimiento de ninguna norma.";
function pieAutoria() {
  return "© 2026 " + AUTOR + " · metodología " + METODOLOGIA + " · contenidos " +
    "<a href=\"https://creativecommons.org/licenses/by/4.0/deed.es\">CC BY 4.0</a> · código MIT " +
    "(motor del panel derivado de <a href=\"" + REPO_ORIGEN_MOTOR + "\">AI en el Consejo</a>, <a href=\"" + REPO_ORIGEN_MOTOR + "/blob/main/LICENSE\">MIT</a>)";
}

// ---------------------------------------------------------------- utilidades (mismo resultado que en Python)
const nulo = v => v === undefined ? null : v;
const get = (o, k) => (o && o[k] !== undefined) ? o[k] : null;         // dict.get(k)
const hay = v => v !== null && v !== undefined;                          // «is not None»
const truthy = v => !!v && !(Array.isArray(v) && !v.length) && !(typeof v === "object" && !Array.isArray(v) && !Object.keys(v).length);
function redondear0(x) { // Python format(x, ".0f"): redondeo a par en el .5 exacto
  const t = Math.trunc(x), d = x - t;
  if (Math.abs(d) === 0.5) return (t % 2 === 0) ? t : t + Math.sign(x);
  return Math.round(x);
}
function euros(x) { if (!hay(x)) return "sin dato"; const n = redondear0(x); const s = String(Math.abs(n)).replace(/\B(?=(\d{3})+(?!\d))/g, "."); return (n < 0 ? "-" : "") + s + " €"; }
function fechaTxt(f) { return f ? f.split("-").reverse().join("-") : "sin fecha"; }
function sinComentarios(x) {
  if (Array.isArray(x)) return x.map(sinComentarios);
  if (x && typeof x === "object") { const o = {}; for (const k of Object.keys(x)) if (!k.startsWith("_")) o[k] = sinComentarios(x[k]); return o; }
  return x;
}
function cmp(a, b) { return a < b ? -1 : a > b ? 1 : 0; }
function ordenar(arr, clave) { return arr.map((x, i) => [clave(x), i, x]).sort((p, q) => { for (let k = 0; k < p[0].length; k++) { const c = cmp(p[0][k], q[0][k]); if (c) return c; } return p[1] - q[1]; }).map(t => t[2]); }
function unicos(arr) { return [...new Set(arr)]; }
function item(importe, formula, estado, fuente, fecha, atribucion, hipotesis) {
  return {importe: nulo(importe), formula: nulo(formula), estado: nulo(estado), fuente: nulo(fuente), fecha: nulo(fecha), atribucion: nulo(atribucion), hipotesis: nulo(hipotesis)};
}

function configPanel(cfg) {
  const c = sinComentarios(cfg || {});
  c.ciclo_vida = Object.assign({}, CICLO_POR_DEFECTO, c.ciclo_vida || {});
  const ciclo = c.ciclo_vida, etapas = new Set(ciclo.embudo);
  const fases = Object.keys(ciclo.fases_seven_g);
  if (!(fases.length === 8 && [0, 1, 2, 3, 4, 5, 6, 7].every(f => fases.includes(String(f))) && Object.values(ciclo.fases_seven_g).every(e => etapas.has(e))))
    throw new Error("config_panel.json: ciclo_vida.fases_seven_g debe asignar a cada fase (0 a 7) una etapa de ciclo_vida.embudo");
  if (!Object.values(ciclo.salidas).every(v => v.every(e => etapas.has(e)))) throw new Error("config_panel.json: ciclo_vida.salidas cita etapas que no están en el embudo");
  return c;
}
const etapaDeFase = (ciclo, fase) => ciclo.fases_seven_g[String(fase)];
function salidaDeEtapa(ciclo, etapa) {
  for (const s of Object.keys(ciclo.salidas)) if (ciclo.salidas[s].includes(etapa)) return s;
  const primera = Object.keys(ciclo.salidas)[0]; return primera !== undefined ? primera : etapa;
}
function estadoPanel(ini, ciclo) {
  const etapa = etapaDeFase(ciclo, ini.ciclo.fase);
  if (["parada", "retirada"].includes(ini.ciclo.estado) || truthy(get(ini, "cierre"))) return salidaDeEtapa(ciclo, etapa);
  return etapa;
}
function tecnologiaPrincipal(tecs) { tecs = tecs || []; for (const t of ["agente", "ia_generativa"]) if (tecs.includes(t)) return t; return tecs.length ? tecs[0] : null; }
const ambicion = cl => get(cl, "ambicion_real") || get(cl, "ambicion_confirmada") || get(cl, "ambicion_propuesta") || null;

// ---------------------------------------------------------------- índice de T01
const RANGO_ESTADO = {estimado: 0, declarado: 1, validado: 2};
function conceptoDe(v) {
  const tipo = get(v, "tipo"); if (!(tipo in CONCEPTOS)) return null;
  return CONCEPTOS[tipo].includes(get(v, "concepto")) ? v.concepto : CONCEPTO_POR_DEFECTO[tipo];
}
function agregado(vs) {
  const con = vs.filter(v => hay(get(v, "importe")));
  let estado = vs[0].estado; for (const v of vs) if ((RANGO_ESTADO[v.estado] || 0) < (RANGO_ESTADO[estado] || 0)) estado = v.estado;
  const fechas = vs.map(v => get(v, "fecha")).filter(Boolean);
  return {id: vs[0].id, iniciativa: vs[0].iniciativa, momento: vs[0].momento, tipo: vs[0].tipo, concepto: get(vs[0], "concepto"),
    importe: con.length ? con.reduce((s, v) => s + v.importe, 0) : null, estado,
    formula: "Suma por unidades: " + vs.map(v => (get(v, "area") || "común") + " " + euros(get(v, "importe")) + (get(v, "formula") ? " (" + v.formula + ")" : "")).join(" + "),
    fuente: unicos(vs.map(v => get(v, "fuente")).filter(Boolean)).join(", ") || null,
    fecha: fechas.length ? fechas.reduce((a, b) => b > a ? b : a) : null};
}
class Indice {
  constructor(t01) {
    this.t01 = t01;
    this.personas = {}; for (const p of t01.personas || []) this.personas[p.id] = p;
    this.proveedores = {}; for (const p of t01.proveedores || []) this.proveedores[p.id] = p;
    this.ini = {}; for (const i of t01.iniciativas || []) this.ini[i.id] = i;
    this.eventos = {}; this.decisiones = {}; this.valores = {};
    for (const e of ordenar(t01.eventos || [], e => [e.fecha, e.id])) (this.eventos[get(e, "iniciativa")] = this.eventos[get(e, "iniciativa")] || []).push(e);
    for (const d of ordenar(t01.decisiones_gate || [], d => [get(d, "fecha_decision") || d.fecha_solicitud, d.iteracion, d.id])) (this.decisiones[d.iniciativa] = this.decisiones[d.iniciativa] || []).push(d);
    for (const v of t01.valores || []) (this.valores[v.iniciativa] = this.valores[v.iniciativa] || []).push(v);
  }
  nombrePersona(pid) { const p = this.personas[pid]; return p ? p.nombre : (pid || null); }
  caso(iid) { const i = this.ini[iid]; return i ? iid + " " + i.nombre : iid; }
  decision(iid, gate, resultados) { resultados = resultados || CONTINUAN; return (this.decisiones[iid] || []).find(d => d.gate === gate && get(d, "fecha_decision") && resultados.includes(get(d, "resultado"))) || null; }
  entradaFase(iid, fase) { const e = (this.eventos[iid] || []).find(e => e.tipo === "entrada_fase" && get(e, "fase") === fase); return e ? e.fecha : null; }
  valor(iid, momento, tipo, concepto) {
    const vs = (this.valores[iid] || []).filter(v => v.momento === momento && v.tipo === tipo && (concepto === undefined || concepto === null || conceptoDe(v) === concepto));
    const ultimos = new Map();
    for (const v of ordenar(vs, v => [get(v, "fecha") || "", v.id])) ultimos.set(get(v, "area") || null, v);
    if (ultimos.size <= 1) return ultimos.size ? ultimos.values().next().value : null;
    return agregado([...ultimos.values()]);
  }
  porArea(iid, momento, tipos, area) {
    const ult = new Map();
    for (const v of ordenar(this.valores[iid] || [], v => [get(v, "fecha") || "", v.id]))
      if (v.momento === momento && tipos.includes(v.tipo) && (get(v, "area") || null) === area) ult.set(v.tipo + " " + conceptoDe(v), v);
    return [...ult.values()];
  }
  conceptos(iid, tipo) { const usados = new Set((this.valores[iid] || []).filter(v => v.tipo === tipo).map(conceptoDe)); return CONCEPTOS[tipo].filter(c => usados.has(c)); }
}
function itemDe(v, hipotesis) { if (!v) return null; return item(get(v, "importe"), get(v, "formula"), v.estado === "estimado" ? "estimado_cati" : v.estado, get(v, "fuente"), get(v, "fecha"), null, hipotesis === undefined ? null : hipotesis); }

// ---------------------------------------------------------------- casos
function historialEstados(ix, ini, ciclo) {
  const his = [], evs = ix.eventos[ini.id] || [];
  const cifras = e => { const c = get(e || {}, "cifras"); if (!truthy(c)) return null;
    const lado = m => { const x = get(c, m) || {}; return {inversion: get(x, "inversion"), recurrente: get(x, "coste_recurrente"), eficiencias: get(x, "eficiencias"), retorno: get(x, "retorno")}; };
    return {previsto: lado("esperado"), actual: lado("realizado")}; };
  const entra = (estado, fecha, nota, evento) => { if (fecha && (!his.length || his[his.length - 1].estado !== estado)) his.push({estado, fecha, fuente: FUENTE_T01, nota, cifras: cifras(evento || null)}); };
  entra(etapaDeFase(ciclo, 0), get(ini, "fecha_registro"), "Alta en el registro", evs.find(e => e.tipo === "alta") || null);
  for (const e of evs) if (e.tipo === "entrada_fase" && hay(get(e, "fase"))) entra(etapaDeFase(ciclo, e.fase), e.fecha, "Entrada en la fase " + e.fase + " (" + FASES[e.fase] + ")", e);
  let cierre = get(ini, "cierre");
  if (truthy(cierre) || ["parada", "retirada"].includes(ini.ciclo.estado)) {
    cierre = cierre || {};
    const que = (get(cierre, "tipo") || ini.ciclo.estado) === "parada" ? "Parada" : "Retirada";
    const motivo = get(cierre, "motivo");
    entra(estadoPanel(ini, ciclo), get(cierre, "fecha"), que + (get(cierre, "gate") ? " en " + cierre.gate : "") + (motivo ? " · " + (MOTIVO[motivo] || motivo) : ""),
      [...evs].reverse().find(e => e.tipo === "parada" || e.tipo === "retirada") || null);
  }
  return his;
}
function economia(ix, ini, cerrado, moneda) {
  const iid = ini.id, V = (m, t) => ix.valor(iid, m, t);
  const invFicha = get(ini, "inversion") || {};
  let construccion;
  if (V("realizado", "inversion")) construccion = itemDe(V("realizado", "inversion"));
  else if (hay(get(invFicha, "realizada"))) construccion = item(invFicha.realizada, "Inversión realizada según la ficha de la iniciativa", "declarado", FUENTE_T01);
  else construccion = itemDe(V("esperado", "inversion"));
  const notas = ["SEVEN-G T01 · fase " + ini.ciclo.fase + " (" + FASES[ini.ciclo.fase] + ") · " + ESTADOS_T01[ini.ciclo.estado]];
  for (const m of ["realizado", "esperado"]) for (const t of ["riesgo_evitado", "cumplimiento"]) { const v = V(m, t); if (v) notas.push(TIPO_VALOR[t] + " " + v.momento + ": " + euros(get(v, "importe")) + " (" + v.estado + "; no suma en el neto)"); }
  const inv = {construccion, recurrente_anual: null, desglose_recurrente: null, adicional_potencial: null, recurrente_potencial: null};
  const ef = [], rt = [];
  if (cerrado) {
    const registrados = (ix.valores[iid] || []).filter(v => ["eficiencias", "retorno", "capacidad_liberada", "coste_recurrente"].includes(v.tipo)).map(v => v.momento + " " + v.tipo + " " + euros(get(v, "importe")));
    if (registrados.length) notas.push("Iniciativa cerrada: sus importes de T01 no suman en el panel (" + registrados.join("; ") + ")");
  } else {
    inv.recurrente_anual = itemDe(V("realizado", "coste_recurrente"));
    inv.recurrente_potencial = itemDe(V("esperado", "coste_recurrente"));
    if (hay(get(invFicha, "pendiente"))) inv.adicional_potencial = item(invFicha.pendiente, "Inversión pendiente según la ficha de la iniciativa", "declarado", FUENTE_T01);
    for (const [tipo, destino] of [["eficiencias", ef], ["retorno", rt]])
      for (const concepto of ix.conceptos(iid, tipo)) destino.push({concepto, actual: itemDe(ix.valor(iid, "realizado", tipo, concepto)), potencial: itemDe(ix.valor(iid, "esperado", tipo, concepto))});
    const a = V("realizado", "capacidad_liberada"), p = V("esperado", "capacidad_liberada");
    if (a || p) ef.push({concepto: "capacidad_liberada", actual: itemDe(a), potencial: itemDe(p)});
  }
  const hip = (ix.valores[iid] || []).filter(v => v.momento === "esperado" && get(v, "formula")).map(v => v.tipo.replace(/_/g, " ") + ": " + v.formula).join(" · ");
  return {moneda, nota_caso: notas.join(" · "), inversion: inv, eficiencias: ef, retorno: rt,
    plazo_potencial: !cerrado ? (get(get(ini, "panel") || {}, "plazo_potencial") || null) : null,
    hipotesis_potencial: !cerrado ? (hip || null) : null, comparte_valor_con: [], clave_reparto: null};
}
function alcance(ix, ini) {
  const a = get(ini, "alcance") || {};
  if (!(get(a, "tipo") in ALCANCE)) return null;
  const iid = ini.id;
  const suma = vs => vs.some(v => hay(get(v, "importe"))) ? vs.filter(v => hay(get(v, "importe"))).reduce((s, v) => s + v.importe, 0) : null;
  const reparto = get(a, "reparto") || [];
  const areas = unicos(reparto.map(u => u.area).concat((ix.valores[iid] || []).filter(v => get(v, "area")).map(v => v.area)));
  const unidades = [];
  for (const area of areas.concat([null])) {
    const u = area ? (reparto.find(x => get(x, "area") === area) || null) : null;
    const costeR = suma(ix.porArea(iid, "realizado", ["coste_recurrente"], area)), costeE = area ? suma(ix.porArea(iid, "esperado", ["coste_recurrente"], area)) : null;
    const val = ix.porArea(iid, "realizado", ["eficiencias", "retorno"], area);
    const g = k => get(u || {}, k);
    const fila = {unidad: area, estado: g("estado"), desde: g("desde"), licencias_asignadas: g("licencias_asignadas"), licencias_activas: g("licencias_activas"),
      usuarios_activos_semanales: g("usuarios_activos_semanales"), horas_liberadas_mes: g("horas_liberadas_mes"),
      coste_anual: hay(costeR) ? costeR : costeE, coste_previsto: !hay(costeR) && hay(costeE),
      valor_materializado: suma(val), valor_validado: val.length ? suma(val.filter(v => v.estado === "validado")) : null,
      capacidad_liberada: suma(ix.porArea(iid, "realizado", ["capacidad_liberada"], area)),
      fuente: g("fuente"), fecha_dato: g("fecha_dato")};
    if (area === null && !hay(fila.coste_anual) && !hay(fila.valor_materializado) && !hay(fila.capacidad_liberada)) continue;
    unidades.push(fila);
  }
  return {tipo: a.tipo, umbral_adopcion_pct: get(a, "umbral_adopcion_pct"),
    habilita: (get(a, "habilita") || []).map(h => ({id: h, nombre: h in ix.ini ? ix.ini[h].nombre : null})),
    unidades: a.tipo === "transversal" ? unidades : []};
}
function valorValidado(ix, ini) {
  const iid = ini.id, lineas = [];
  for (const t of ["eficiencias", "retorno"]) for (const c of ix.conceptos(iid, t)) lineas.push([t, c]);
  const real = lineas.map(([t, c]) => ix.valor(iid, "realizado", t, c));
  const val = real.filter(v => v && v.estado === "validado" && hay(get(v, "importe")));
  const esp = lineas.map(([t, c]) => ix.valor(iid, "esperado", t, c)).filter(v => v && hay(get(v, "importe"))).map(v => v.importe);
  const fechas = val.map(v => get(v, "fecha")).filter(Boolean);
  return {base: null, objetivo: esp.length ? esp.reduce((a, b) => a + b, 0) : null, actual: val.length ? val.reduce((s, v) => s + v.importe, 0) : null,
    metodo_atribucion: val.filter(v => get(v, "formula")).map(v => v.formula).join(" · ") || null,
    validado_por: unicos(val.map(v => get(v, "fuente")).filter(Boolean)).sort().join(", ") || null,
    fecha_validacion: fechas.length ? fechas.reduce((a, b) => b > a ? b : a) : null, recurrente: null};
}
function caso(ix, ini, org, moneda, ciclo) {
  const iid = ini.id, cl = ini.clasificacion, cic = ini.ciclo;
  const estado = estadoPanel(ini, ciclo);
  const cerrado = estado in ciclo.salidas, enUso = estado === ciclo.ganado;
  const pan = get(ini, "panel") || {}, ctrl = get(pan, "controles") || {};
  const control = k => CONTROL.includes(get(ctrl, k)) ? ctrl[k] : null;
  const tecs = get(cl, "tecnologia") || [], tp = tecnologiaPrincipal(tecs), amb = ambicion(cl);
  const evals = {}; for (const e of get(ini, "evaluaciones_impacto") || []) evals[e.tipo] = nulo(EVALUACION[e.estado]);
  const reg = get(cl, "regulatoria");
  const g3 = ix.decision(iid, "G3"), g5 = ix.decision(iid, "G5");
  const r6 = (ix.decisiones[iid] || []).filter(d => d.gate === "R6" && get(d, "fecha_decision"));
  const cierre = truthy(get(ini, "cierre")) ? ini.cierre : null;
  const responsables = get(ini, "responsables") || {};
  const proveedores = (get(cl, "proveedores") || []).map(p => p in ix.proveedores ? ix.proveedores[p].nombre : p).join(", ") || null;
  const pendiente = [...(ix.decisiones[iid] || [])].reverse().find(d => !get(d, "fecha_decision")) || null;
  const produccion = g5 ? g5.fecha_decision : ix.entradaFase(iid, 6);
  const inicioEstimado = (!hay(produccion) && (enUso || cerrado)) ? "" : null;
  const al = alcance(ix, ini);
  const eco = economia(ix, ini, cerrado, moneda);
  if (al && al.tipo === "transversal") eco.clave_reparto = "Coste imputado a cada unidad de negocio por sus licencias; el gobierno común (oficina de adopción, formación y revisión de permisos) " +
    "va sin unidad. El valor solo cuenta cuando la unidad lo materializa (documento 40 §7.2).";
  else if (al) { eco.clave_reparto = "El valor de la plataforma se imputa a los casos que la usan; aquí solo cuenta su coste (documento 10 §4.1, regla 3)."; eco.comparte_valor_con = al.habilita.map(h => h.id); }
  const tags = {tecnologia: nulo(TECNOLOGIA[tp]), naturaleza: nulo(NATURALEZA[tp]), exposicion: nulo(EXPOSICION[get(cl, "exposicion")]),
    riesgo: nulo(REGULATORIA_TAG[reg]), funcion: nulo(ESFERAS[get(cl, "esfera_principal")]), prioridad: nulo(PRIORIDAD[get(pan, "prioridad")]), ambicion: nulo(AMBICION[amb])};
  if (al) tags.alcance = ALCANCE[al.tipo];
  const out = {
    id: iid, nombre: ini.nombre, que_es: get(ini, "descripcion") || null, descripcion: get(pan, "observaciones_consejo") || null, area: get(ini, "area"),
    compania: org, unidad: (al && al.tipo === "transversal") ? UNIDAD_TRANSVERSAL : get(ini, "area"), estado, inicio_estimado: inicioEstimado, tags};
  if (al) out.alcance = al;
  out.detalle = {tipo: tecs.map(t => TECNOLOGIA_TXT[t] || t).join(", ") || null, decision: null, datos: null, aiact: nulo(REGULATORIA_TAG[reg]),
    proveedores, valor_tipo: (get(cl, "tipo_valor") || []).map(t => TIPO_VALOR[t] || t).join(", ") || null,
    es_ia: tp ? nulo(NATURALEZA[tp]) : null, acciones_estimadas_cati: null};
  out.valor = {magnitud: null, anio: null, acum: null, acum_dato: false, acum_extrapolado_cati: null,
    medido: (ix.valores[iid] || []).some(v => v.momento === "realizado" && hay(get(v, "importe"))), fuente: FUENTE_T01, nota_acum: null, pta: null, nombre_cdm: null};
  out.economia = eco;
  const motivoCierre = cierre ? (MOTIVO[cierre.motivo] || cierre.motivo) : null;
  out.reporte_compania = {
    propietario_negocio: get(responsables, "patrocinador") ? ix.nombrePersona(responsables.patrocinador) : null,
    responsable_tecnico: get(responsables, "tecnico") ? ix.nombrePersona(responsables.tecnico) : null,
    empresa_grupo: org,
    fechas: {idea: get(ini, "fecha_registro"), aprobacion: g3 ? g3.fecha_decision : null, inicio: ix.entradaFase(iid, 4), piloto: ix.entradaFase(iid, 5), produccion,
      ultima_revision: r6.length ? r6[r6.length - 1].fecha_decision : null, retirada: cierre ? nulo(cierre.fecha) : null},
    retirada: cierre ? {motivo: (cierre.tipo === "parada" ? "Parada" : "Retirada") + (get(cierre, "gate") ? " en " + cierre.gate : "") + " · " + motivoCierre + (get(cierre, "comentario") ? ": " + cierre.comentario : ""),
      decisor: get(cierre, "organo"), sustituto: get(cierre, "sustituto"), lecciones: get(cierre, "lecciones") || null} : {motivo: null, decisor: null, sustituto: null, lecciones: null},
    historial_estados: historialEstados(ix, ini, ciclo),
    complejidad: COMPLEJIDAD.includes(get(pan, "complejidad")) ? pan.complejidad : null,
    tier_riesgo: nulo(RIESGO_TIER[get(ini, "riesgo_residual_principal")]),
    clasificacion_ria: nulo(REGULATORIA_RIA[reg]),
    controles: {RIA: !hay(reg) ? null : (reg === "pendiente" ? "pendiente" : "hecho"), FRIA: nulo(evals.eidf), DPIA: nulo(evals.eipd),
      seguridad: control("seguridad"), MUC: control("muc"), IA_ofensiva: control("ia_ofensiva")},
    valor_validado: valorValidado(ix, ini),
    coste_real: {anio: null, acumulado: null, fuente: null},
    operacion: null, agente: null, proveedor_dora: null};
  out.seveng = {fase: cic.fase, fase_nombre: nulo(FASES[cic.fase]), estado: cic.estado, fecha_entrada_fase: get(cic, "fecha_entrada_fase"),
    iteracion: get(cic, "iteracion"), espera: get(cic, "espera"), proxima_revision: get(cic, "proxima_revision"),
    gate_pendiente: pendiente ? pendiente.gate : null, intensidad: get(cl, "intensidad"),
    esfera_principal: get(cl, "esfera_principal"), esfera_secundaria: get(cl, "esfera_secundaria"),
    ambicion: {propuesta: get(cl, "ambicion_propuesta"), confirmada: get(cl, "ambicion_confirmada"), real: get(cl, "ambicion_real")},
    autonomia: get(cl, "autonomia"), regulatoria: reg, etiquetas_libres: get(ini, "etiquetas_libres") || [], sistemas: get(ini, "sistemas") || []};
  return out;
}

// ---------------------------------------------------------------- seguimiento
function movimientos(ix) {
  const mov = [];
  for (const iid of Object.keys(ix.eventos)) {
    if (!iid || iid === "null" || iid === "undefined") continue;
    const ini = ix.ini[iid] || {}, cierre = get(ini, "cierre") || {};
    for (const e of ix.eventos[iid]) {
      const base = {fecha: e.fecha, caso: ix.caso(iid), decisor: ix.nombrePersona(get(e, "autor")), sustituto: null};
      if (e.tipo === "alta") mov.push(Object.assign({}, base, {tipo: "alta", motivo: get(e, "motivo")}));
      else if (e.tipo === "parada" || e.tipo === "retirada") {
        const que = e.tipo === "parada" ? "Parada" : "Retirada", motivo = get(cierre, "motivo") ? (MOTIVO[cierre.motivo] || cierre.motivo) : null;
        mov.push(Object.assign({}, base, {tipo: "retirada", motivo: que + (get(e, "gate") ? " en " + e.gate : "") + (motivo ? " · " + motivo : "") + ": " + get(e, "motivo"),
          decisor: get(cierre, "organo") || base.decisor, sustituto: get(cierre, "sustituto")}));
      } else if (e.tipo === "cambio_clasificacion")
        mov.push(Object.assign({}, base, {tipo: "reevaluacion", motivo: "Cambio de " + (get(e, "campo") || "clasificación") + ": " + (get(e, "antes") || "sin dato") + " → " + (get(e, "despues") || "sin dato") + ". " + get(e, "motivo")}));
    }
  }
  for (const iid of Object.keys(ix.decisiones)) for (const d of ix.decisiones[iid])
    if (d.gate === "R6" && get(d, "fecha_decision"))
      mov.push({fecha: d.fecha_decision, tipo: "reevaluacion", caso: ix.caso(iid),
        motivo: "R6 · " + (RESULTADO[get(d, "resultado")] || get(d, "resultado")) + (get(d, "motivo") ? ": " + d.motivo : ""),
        decisor: get(d, "decisor") ? ix.nombrePersona(d.decisor) : nulo(ORGANO[get(d, "organo")]), sustituto: null});
  return ordenar(mov, m => [m.fecha, m.caso]);
}
function incidentes(ix) {
  return ordenar(ix.t01.incidentes || [], x => [x.fecha]).map(x => ({fecha: x.fecha, caso: get(x, "iniciativa") ? ix.caso(x.iniciativa) : null, tipo: "Severidad " + x.severidad,
    descripcion: get(x, "descripcion"), resolucion_horas: null, rto_horas: null, origen: null, vector: null,
    horas_detectar: get(x, "horas_detectar"), horas_contener: get(x, "horas_contener"), brecha_datos_personales: null, afectados: null,
    notificacion_aepd_horas: null, notificacion_dora: null, notificaciones: get(x, "notificaciones"), estado: get(x, "estado"),
    id_t01: x.id, sistema: get(x, "sistema")}));
}

// ---------------------------------------------------------------- conversión completa
function convertir(t01, op) {
  op = op || {};
  if (!t01 || typeof t01 !== "object" || !("iniciativas" in t01) || !("meta" in t01)) throw new Error("el fichero no es un JSON completo exportado por T01");
  const avisos = [];
  if (!ESQUEMAS_T01.includes(get(t01, "version_esquema"))) avisos.push("versión de esquema de T01 " + t01.version_esquema + " no probada (se esperaba " + ESQUEMAS_T01.join(", ") + ")");
  const ix = new Indice(t01), m = t01.meta;
  const org = op.organizacion || get(m, "organizacion") || "la organización";
  const sigla = op.sigla || get(get(m, "panel") || {}, "consejo_sigla") || "consejo asesor";
  const prefijo = op.prefijo || "t01_", enlacesPie = op.enlaces_pie || "";
  const config = configPanel(op.config), ciclo = config.ciclo_vida;
  const corte = get(m, "fecha_referencia") || get(m, "generado") || new Date().toISOString().slice(0, 10);
  const anio = parseInt(corte.slice(0, 4), 10);
  const ficticio = (op.demo === undefined || op.demo === null) ? !!get(m, "datos_ilustrativos") : !!op.demo;
  const moneda = get(m, "moneda") || "EUR";
  const casos = (t01.iniciativas || []).map(i => caso(ix, i, org, moneda, ciclo));
  const aviso = ficticio ? AVISO_LEGAL : AVISO_LEGAL_DATOS_PROPIOS;
  const conector = op.conector_txt || "el conector T17 (t01_a_panel.js, en el navegador)";
  const textos = {
    aviso_previo: aviso + " " + (ficticio ? "<b>Datos ficticios</b> del registro de iniciativas T01 de SEVEN-G. " : "Datos del registro de iniciativas T01 de SEVEN-G. "),
    aviso_valor: "Los importes salen del registro T01 con su estado: validado, declarado o estimado (en el panel, «estimado» figura como estimación del " + sigla + ", " +
      "pero en T01 lo estima el equipo de la iniciativa). Actual = realizado; potencial = esperado. Lo que T01 no registra queda «sin dato», nunca a cero.",
    pie: "Panel generado desde el registro de iniciativas T01 de SEVEN-G (corte " + fechaTxt(corte) + ") con " + conector +
      (ficticio ? " · " + org + " y sus personas son ficticios" : "") + (enlacesPie ? " · " + enlacesPie : "") + "<br>" + pieAutoria() + "<br>" + (ficticio ? AVISO_LEGAL_CORTO : AVISO_CORTO_PROPIOS),
    movimientos_vacio: "El registro T01 no tiene altas, paradas, retiradas ni revisiones de continuidad.",
    agilidad_sin_fechas: "Faltan fechas de registro, G3 o G5 en el registro T01: no se puede medir la agilidad.",
    backlog_sin_dato: "T01 no registra el backlog pendiente de análisis.",
    adopcion_sin_telemetria: "T01 no registra licencias ni uso de las suites de productividad: sin dato.",
    sin_que_es: "Sin descripción en T01: completar qué es y para qué se usa",
    ef_operativo: "Otros costes operativos evitados (o eficiencias sin desglosar en T01)",
    ef_siniestros: "Fraude, recobros y sobrecostes evitados",
    ret_venta_nueva: "Venta nueva", ret_venta_cruzada: "Venta cruzada", ret_retencion: "Retención de clientes", ret_precio_margen: "Precio y margen",
    ret_cobros: "Cobros recuperados", ret_otros: "Otro retorno (o retorno sin desglosar en T01)"
  };
  const meta = {esquema: "ESQUEMA.md", version_datos: 6, generado: corte, ejercicio_valor: anio,
    periodo: {etiqueta: "Registro de iniciativas T01 · corte " + fechaTxt(corte), trimestre: (Math.floor((parseInt(corte.slice(5, 7), 10) - 1) / 3) + 1) + "T " + anio, anterior: null},
    fuentes: {t01: "Registro de iniciativas T01 de SEVEN-G (esquema " + get(t01, "version_esquema") + ")"},
    organizacion: org, consejo_sigla: sigla, compania_principal: org, prefijo_ficheros: prefijo,
    mostrar_refs: false, leer_json_servidor: false, textos, glosario_extra: GLOSARIO_SEVEN_G, demo: ficticio, industria: null};
  for (const k of Object.keys(config)) meta[k] = config[k];
  meta.origen = {herramienta: "SEVEN-G T01", version_esquema: get(t01, "version_esquema"), conector: RUTA_CONECTOR, version_conector: VERSION_CONECTOR, moneda};
  const out = {meta, seguimiento: {movimientos: movimientos(ix), incidentes: incidentes(ix), adopcion: null, agilidad: null, ia_ofensiva: null, cdm_compania: null}, casos, historico: []};
  if (avisos.length) out._avisos = avisos;
  return out;
}

// ---------------------------------------------------------------- índice de transformación (T14)
const PERFILES_T14 = ["curso", "escala", "tactica", "exploracion", "declarada"];
function bloqueIndice(t14) {
  if (!t14 || typeof t14 !== "object" || !Array.isArray(t14.calculos)) throw new Error("el fichero del índice no es un JSON exportado por T14");
  const calcs = ordenar(t14.calculos.filter(c => c.resultado && typeof c.resultado === "object"), c => [get(c, "fecha_corte") || "", get(c, "id") || ""]);
  if (!calcs.length) return null;
  const uno = c => { const r = c.resultado; if (!PERFILES_T14.includes(get(r, "perfil_asignado"))) throw new Error("T14: perfil desconocido " + r.perfil_asignado);
    return {id: get(c, "id"), fecha_corte: get(c, "fecha_corte"), tipo: get(c, "tipo"), version_umbrales: get(c, "version_umbrales"),
      perfil_asignado: r.perfil_asignado, perfil_evidenciado: get(r, "perfil_evidenciado"), perfil_subyacente: get(r, "perfil_subyacente"),
      provisional: !!get(r, "provisional"), cobertura: get(r, "cobertura"), suma: get(r, "suma"), condiciones_base: get(r, "condiciones_base"),
      declaracion: get(r, "declaracion"), senales: get(r, "senales") || [], alertas: get(r, "alertas") || [],
      perfil_objetivo: get(r, "perfil_objetivo"), mover: get(r, "mover") || []}; };
  const b = uno(calcs[calcs.length - 1]);
  b.anterior = calcs.length > 1 ? uno(calcs[calcs.length - 2]) : null;
  return b;
}
// ---------------------------------------------------------------- madurez de la compañía (T15, documento 11; esquema 0.6 de T01, D100)
function bloqueMadurez(t01) {
  const lista = get(t01, "madurez") || [];
  if (!Array.isArray(lista) || !lista.length) return null;
  const validos = ordenar(lista.filter(m => m && typeof m === "object" && get(m, "id") && get(m, "fecha_corte") && Array.isArray(get(m, "dimensiones"))), m => [get(m, "fecha_corte") || "", get(m, "id") || ""]);
  if (!validos.length) return null;
  const uno = m => ({id: get(m, "id"), fecha_corte: get(m, "fecha_corte"), ciclo: get(m, "ciclo"), modalidad: get(m, "modalidad"),
    version_cuestionario: get(m, "version_cuestionario"), verificador: get(m, "verificador"), organo_aprobacion: get(m, "organo_aprobacion"),
    nivel_global: get(m, "nivel_global"), nivel_minimo: get(m, "nivel_minimo"), media: get(m, "media"), tope: get(m, "tope"),
    tope_aplicado: !!get(m, "tope_aplicado"), limitante: get(m, "limitante") || [], validez: get(m, "validez"), declaracion_posible: get(m, "declaracion_posible"),
    dimensiones: (get(m, "dimensiones") || []).filter(d => d && typeof d === "object").map(d => ({dimension: get(d, "dimension"), nombre: get(d, "nombre"), nivel: get(d, "nivel"), avance: get(d, "avance"), bloqueantes: get(d, "bloqueantes") || []}))});
  const b = uno(validos[validos.length - 1]);
  if (validos.length > 1) { const a = uno(validos[validos.length - 2]); b.anterior = {id: a.id, fecha_corte: a.fecha_corte, modalidad: a.modalidad, nivel_global: a.nivel_global, dimensiones: a.dimensiones.map(d => ({dimension: d.dimension, nivel: d.nivel}))}; }
  else b.anterior = null;
  return b;
}
const esRegistroT01 = d => !!d && typeof d === "object" && Array.isArray(d.iniciativas) && !!d.meta && !Array.isArray(d.casos);
raiz.SevengT17 = {convertir, bloqueIndice, bloqueMadurez, esRegistroT01, VERSION_CONECTOR, AVISO_LEGAL, AVISO_LEGAL_DATOS_PROPIOS};
})(typeof window !== "undefined" ? window : globalThis);
