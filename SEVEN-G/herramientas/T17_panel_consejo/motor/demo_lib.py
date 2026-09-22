# Copia mantenida en AI_CONSULTING (SEVEN-G, T17) desde 17-09-2026; origen: AI_en_el_consejo/motor (MIT, mismo autor).
# -*- coding: utf-8 -*-
"""Preparacion de los datos ficticios por industria y plantilla del registro de recomendaciones (DATOS FICTICIOS).

Los paneles (completo y movil) los genera el motor comun (../../motor); build_demos.py convierte cada industria al esquema del motor.
"""
import json, os, datetime, statistics, hashlib

# ---------------------------------------------------------------- paleta validada (pasos para superficie oscura), en orden adyacente
SLOTS = ["#3987e5", "#d95926", "#199e70", "#c98500", "#d55181", "#008300", "#9085e9", "#e66767"]

# como se calcula el valor, como se imputa el coste y que necesita el potencial, por tipo de tecnologia
ATRIB = {
    "ML predictivo": ("Grupo de control aleatorio: diferencia de resultado frente al grupo no tratado × volumen × valor unitario. Validado por Control de Gestión cada trimestre.", "Horas del equipo de ciencia de datos por hoja de tiempos + unidades de cómputo de la plataforma de datos etiquetadas por modelo + cuota de monitorización.", "Extensión a todo el perímetro, reentrenamiento programado y prueba de sesgo."),
    "Agéntico": ("Interacciones resueltas sin persona × coste de una gestión humana, descontando recontactos; medido sobre el registro de la plataforma y validado por Control de Gestión.", "Tokens y minutos por caso (etiqueta en el gateway) + cuota de la plataforma agéntica repartida por conversaciones + equipo de operación.", "Contención sostenida y ampliación de alcance tras el gate (validación determinista, métricas de guardarraíl, red teaming)."),
    "GenAI": ("Reducción del tiempo medio de la tarea medida en A/B frente a usuarios sin asistente × volumen × coste hora cargado.", "Tokens por caso (gateway) + licencias imputadas por usuario activo + equipo de operación.", "Adopción por la mayoría del colectivo y tasa de fundamentación superior al 95 %."),
    "Visión artificial": ("Defectos o eventos detectados que antes se escapaban × coste unitario evitado, con muestreo humano de verificación.", "Cámaras y cómputo en el borde por línea + equipo de mantenimiento del modelo.", "Cobertura de todas las líneas o activos y tasa de falsos positivos por debajo del umbral acordado."),
    "NLP / IDP": ("Horas liberadas medidas por tasa de tratamiento directo × volumen × coste hora cargado.", "Robots y horas de bot por proceso + servicio de extracción por página.", "Tasa de tratamiento directo superior al 75 % y extensión a todos los tipos documentales."),
    "Optimización": ("Diferencia de coste operativo frente al plan manual del mismo periodo (km, horas, energía o stock), validada por Control de Gestión.", "Licencia del motor de optimización + integración + equipo de planificación que lo opera.", "Cobertura de toda la red o planta y replanificación en tiempo real."),
    "IA de tercero": ("Retorno incremental frente a la línea base previa a la herramienta, neto de falsos positivos; el proveedor aporta el bruto y Control de Gestión lo ajusta.", "Licencia anual 100 % al caso + integración + equipo de negocio que explota los resultados.", "Extensión a todo el perímetro y contrato con cláusulas de auditoría y salida."),
    "Reglas (no es IA)": ("Sin valor propio: el valor se atribuye a los casos que consumen estas reglas, para evitar doble contabilidad.", "Mantenimiento del motor de reglas por hoja de tiempos.", "Sin potencial propio atribuible."),
}
EST = ["En uso", "En desarrollo", "POC", "Desenganchado"]

# ambicion del caso: donde invierte la compania. Por defecto segun tecnologia; cada industria fija las excepciones en ind["ambicion"]
AMB_DEF = {"ML predictivo": "optimizacion", "Agéntico": "augmentation", "GenAI": "augmentation", "Visión artificial": "optimizacion",
           "NLP / IDP": "optimizacion", "Optimización": "optimizacion", "IA de tercero": "optimizacion", "Reglas (no es IA)": "optimizacion"}
AMB_TXT = {"optimizacion": ["Optimización", "Hace lo mismo con menos: el retorno se mide sobre todo en costes evitados."],
           "augmentation": ["Augmentation", "Potencia a las personas en su trabajo: el retorno combina coste y rendimiento (productividad, calidad, conversión)."],
           "transformacion": ["Transformación", "Cambia cómo se compite o se presta el servicio: el retorno se mide sobre todo en rendimiento (ingresos, crecimiento, nuevos servicios)."]}

def _h(s, mod):
    return int(hashlib.md5(s.encode()).hexdigest(), 16) % mod

def _fechas(cid, estado, tier, meses, hoy, banda, amb):
    """Fechas deterministas a partir del id: produccion = hoy - meses; tramos segun tier, banda de potencial y ambicion.
    Supuesto de la demo: los casos de mas potencial y los de transformacion tardan mas en aprobarse (mas areas implicadas y business case mas exigente)."""
    ttp_base = {"bajo": 60, "medio": 120, "alto": 170}[tier]; tia_base = {"bajo": 20, "medio": 50, "alto": 95}[tier]
    ttp = ttp_base + _h(cid + "p", 60) - 30 + {"alto": 20, "medio": 5, "bajo": -5, "sin": 0}[banda] + (15 if amb == "transformacion" else 0)
    tia = tia_base + _h(cid + "a", 40) - 20 + {"alto": 45, "medio": 12, "bajo": 0, "sin": -5}[banda] + (25 if amb == "transformacion" else 0)
    if estado in ("En uso", "Desenganchado"):
        prod = hoy - datetime.timedelta(days=int(meses * 30.44) + _h(cid + "d", 20))
        apr = prod - datetime.timedelta(days=ttp); idea = apr - datetime.timedelta(days=tia)
        return idea.isoformat(), apr.isoformat(), prod.isoformat()
    if estado == "En desarrollo":
        apr = hoy - datetime.timedelta(days=30 + _h(cid + "e", 150)); idea = apr - datetime.timedelta(days=tia)
        return idea.isoformat(), apr.isoformat(), None
    idea = hoy - datetime.timedelta(days=30 + _h(cid + "i", 120) + {"alto": 70, "medio": 20}.get(banda, 0))
    return idea.isoformat(), None, None

def prepare(ind):
    """Normaliza los datos de una industria y calcula las cifras de coherencia."""
    hoy = datetime.date.fromisoformat(ind["hoy"])
    over = {}
    for amb, ids in ind.get("ambicion", {}).items():
        for i in ids:
            over[i] = amb
    pots = sorted(t[10] for t in ind["casos"] if t[10])
    q33, q66 = pots[len(pots) // 3], pots[2 * len(pots) // 3]
    casos = []
    for t in ind["casos"]:
        cid, nombre, comp, unidad, estado, tec, tier, clasif, valor, coste, pot, fechas, ctrl, op, obs = t
        amb = over.get(cid, AMB_DEF[tec])
        banda = "sin" if not pot else "alto" if pot >= q66 else "medio" if pot >= q33 else "bajo"
        if isinstance(fechas, tuple):
            idea, apr, prod = fechas
        else:
            idea, apr, prod = _fechas(cid, estado, tier, fechas or 0, hoy, banda, amb)
        a, k, hp = ATRIB[tec]
        casos.append({"id": cid, "nombre": nombre, "compania": comp, "unidad": unidad, "estado": estado, "tecnologia": tec, "tier": tier,
                      "clasificacion": clasif, "valor": valor, "coste": coste, "potencial": pot, "fechas": {"idea": idea, "aprobacion": apr, "produccion": prod},
                      "controles_completos": ctrl, "operacion": op or {}, "obs": obs, "atribucion": a, "clave_coste": k, "hipotesis": hp,
                      "validado_por": "Control de Gestión" if valor else None, "ambicion": amb, "banda": banda})
    activos = [c for c in casos if c["estado"] != "Desenganchado"]
    def dias(a, b):
        return None if not a or not b else (datetime.date.fromisoformat(b) - datetime.date.fromisoformat(a)).days
    def med(v):
        v = [x for x in v if x is not None]; return round(statistics.median(v)) if v else None
    tramos = {}
    for t in ("bajo", "medio", "alto"):
        cs = [c for c in casos if c["tier"] == t]
        tramos[t] = {"tia": med([dias(c["fechas"]["idea"], c["fechas"]["aprobacion"]) for c in cs]), "ttp": med([dias(c["fechas"]["aprobacion"], c["fechas"]["produccion"]) for c in cs]), "n": len(cs)}
    agentes = [c for c in casos if c["tecnologia"] in ("Agéntico", "GenAI") and c["estado"] == "En uso"]
    k = {"n": len(casos), "estados": {e: sum(1 for c in casos if c["estado"] == e) for e in EST}, "activos": len(activos),
         "valor": sum(c["valor"] for c in casos), "coste": sum(c["coste"] for c in casos), "pot": sum(c["potencial"] for c in activos),
         "clasif": sum(1 for c in activos if c["clasificacion"]), "alto": sum(1 for c in activos if c["clasificacion"] == "alto_riesgo"),
         "ctrl_ok": sum(1 for c in activos if c["controles_completos"]), "con_valor": sum(1 for c in casos if c["valor"]),
         "con_fechas": sum(1 for c in casos if all(c["fechas"].values())), "agentes": len(agentes),
         "con_rt": sum(1 for c in agentes if c["operacion"].get("red_teaming_fecha")),
         "retiradas": sum(1 for m in ind["movimientos"] if m["tipo"] == "retirada"), "incidentes": len(ind["incidentes"])}
    ad = ind["adopcion"]
    fmt_vars = dict(k, amb_n=len(casos), ctrl_sh={1: "Uno", 2: "Dos", 3: "Tres"}.get(ind["adopcion"]["controles_activos"], "Ninguno"), valor_m=f"{k['valor']/1e6:.1f} M€".replace(".", ","), lic_act=f"{ad['copilot']['activas']:,}".replace(",", "."), lic_asig=f"{ad['copilot']['asignadas']:,}".replace(",", "."), semanales=ad["copilot"]["semanales"])
    recs = []
    for r in ind["recs"]:
        d = dict(zip(["id", "sesion", "ambito", "texto", "destinatario", "estado", "fecha", "evidencia", "valoracion", "panel"], r))
        d["evidencia"] = d["evidencia"].format(**fmt_vars); recs.append(d)
    k["recs"] = {e: sum(1 for r in recs if r["estado"] == e) for e in ["cumplida", "en_curso", "pendiente", "descartada"]}
    # tendencia: los periodos anteriores se expresan como fraccion del valor y coste actuales (periodo, fraccion_valor, fraccion_coste, casos en uso)
    tend = [{"periodo": p, "valor": round(k["valor"] * fv, -3), "coste": round(k["coste"] * fc, -3), "prod": n} for p, fv, fc, n in ind["tendencia_frac"]]
    tend.append({"periodo": ind["periodo_actual"], "valor": k["valor"], "coste": k["coste"], "prod": k["estados"]["En uso"]})
    off = ind.get("paleta", 0)
    pal = {"states": SLOTS[off:off + 4], "s1": SLOTS[off + 2], "s2": SLOTS[off], "s3": SLOTS[off + 1], "s4": SLOTS[off + 3]}
    return {"slug": ind["slug"], "industria": ind["industria"], "grupo": ind["grupo"], "consejo": ind["consejo"], "hoy": ind["hoy"], "hoy_txt": ind["hoy_txt"],
            "intro": ind["intro"], "companias": ind["companias"], "casos": casos, "movimientos": ind["movimientos"], "incidentes": ind["incidentes"],
            "adopcion": ad, "agilidad": ind["agilidad"], "tendencia": tend, "tramos": tramos, "sesiones": ind["sesiones"], "recs": recs, "kpi": k, "pal": pal,
            "bandas": {"q33": q33, "q66": q66}, "amb_txt": AMB_TXT}

# ---------------------------------------------------------------- estilo comun (tema oscuro editorial)
CSS_BASE = r"""
:root{color-scheme:dark;--bg:#12161b;--panel:#1a2027;--panel2:#202730;--ink:#f3f1ea;--ink2:#b9b6ac;--mute:#7f8b96;--line:#2b333d;--ring:rgba(255,255,255,.12);
 --s1:__S1__;--s2:__S2__;--s3:__S3__;--s4:__S4__;--good:#0ca30c;--warn:#fab219;--critical:#d03b3b;--accent:__S1__;--link:#8fd3f4}
*{box-sizing:border-box}
body{margin:0;background:var(--bg);color:var(--ink);font:14px/1.5 system-ui,-apple-system,"Segoe UI",sans-serif}
h1,h2{font-family:Georgia,"Times New Roman",serif;font-weight:400;letter-spacing:.2px}
a{color:var(--link)}
.demo{position:fixed;right:14px;bottom:14px;z-index:9;background:#c98500;color:#1a1200;font-weight:700;font-size:11.5px;padding:5px 10px;border-radius:999px;letter-spacing:.06em;text-transform:uppercase}
.wrap{display:grid;grid-template-columns:250px minmax(0,1fr);min-height:100vh}
aside{background:var(--panel);border-right:1px solid var(--line);padding:22px 18px;position:sticky;top:0;height:100vh;overflow:auto}
aside .brand{font-family:Georgia,serif;font-size:22px;line-height:1.1}
aside .brand small{display:block;font:11px/1.4 system-ui,sans-serif;color:var(--mute);letter-spacing:.08em;text-transform:uppercase;margin-top:6px}
.sector{display:inline-block;margin-top:10px;padding:3px 10px;border-radius:999px;background:var(--accent);color:#0b0f12;font-size:11.5px;font-weight:700;letter-spacing:.04em}
aside nav{margin-top:20px;display:flex;flex-direction:column;gap:2px}
aside nav a{color:var(--ink2);text-decoration:none;padding:7px 10px;border-radius:8px;font-size:13px}
aside nav a:hover{background:var(--panel2);color:var(--ink)}
aside .foot{margin-top:26px;font-size:11.5px;color:var(--mute);line-height:1.5}
main{padding:28px 34px 80px;max-width:1500px}
.hero{display:grid;grid-template-columns:minmax(260px,1.2fr) repeat(auto-fit,minmax(150px,1fr));gap:14px;align-items:stretch;margin-bottom:26px}
.hero .big{background:linear-gradient(135deg,color-mix(in srgb,var(--accent) 22%,#1a2027),#1a2027 70%);border:1px solid var(--line);border-radius:16px;padding:20px 22px}
.hero .big .n{font-size:52px;font-weight:600;line-height:1;margin:6px 0 4px}
.hero .big .l{color:var(--ink2);font-size:13px}
.tile{background:var(--panel);border:1px solid var(--line);border-radius:14px;padding:14px 16px}
.tile .n{font-size:26px;font-weight:600;line-height:1.1}
.tile .l{color:var(--ink2);font-size:12px;margin-top:4px}
.tile .d{color:var(--mute);font-size:11.5px;margin-top:3px}
section{margin-top:30px}
section>h2{font-size:22px;margin:0 0 4px}
section>.lead{color:var(--ink2);font-size:13px;margin:0 0 14px;max-width:110ch}
.row{display:grid;grid-template-columns:repeat(auto-fit,minmax(340px,1fr));gap:14px}
.card{background:var(--panel);border:1px solid var(--line);border-radius:14px;padding:16px 18px;min-width:0}
.card h3{margin:0 0 3px;font-size:14.5px;font-weight:600}
.card .note{color:var(--mute);font-size:11.5px;margin-bottom:10px}
.card .ins{font-size:13px;color:var(--ink);margin-bottom:10px;padding-left:10px;border-left:3px solid var(--accent)}
.legend{display:flex;gap:14px;flex-wrap:wrap;font-size:12px;color:var(--ink2);margin-bottom:8px}
.legend i{display:inline-block;width:10px;height:10px;border-radius:50%;margin-right:5px;vertical-align:-1px}
svg{display:block;max-width:100%;height:auto}
svg text{font-family:inherit;fill:var(--ink2);font-size:11px}
table{border-collapse:collapse;width:100%;font-size:12.5px}
th,td{padding:6px 8px;border-bottom:1px solid var(--line);text-align:left;vertical-align:top}
th{color:var(--mute);font-size:10.5px;text-transform:uppercase;letter-spacing:.05em;font-weight:600}
td.n,th.n{text-align:right;font-variant-numeric:tabular-nums;white-space:nowrap}
.tw{overflow:auto}
.pill{display:inline-block;font-size:10.5px;padding:2px 8px;border-radius:999px;border:1px solid var(--ring);color:var(--ink2);white-space:nowrap}
.pill.uso{background:#17352a;color:#8fe0bd;border-color:#245d47}.pill.dev{background:#1c2f4a;color:#9cc3f2;border-color:#2c4f7c}.pill.poc{background:#3b2a12;color:#f0c98a;border-color:#6a4a1a}.pill.off{background:#2a2e33;color:#a7adb5}
.pill.ok{background:#17352a;color:#8fe0bd;border-color:#245d47}.pill.ko{background:#44201c;color:#f3a79c;border-color:#7a3a33}.pill.mid{background:#3b2a12;color:#f0c98a;border-color:#6a4a1a}.pill.na{background:#2a2e33;color:#a7adb5}
.bar100{display:flex;height:14px;border-radius:7px;overflow:hidden;gap:2px;background:var(--line)}
.bar100 i{display:block;height:100%}
.meter{height:8px;border-radius:4px;background:var(--line);overflow:hidden;margin-top:6px}.meter i{display:block;height:100%;background:var(--s1)}
.seg{display:inline-flex;border:1px solid var(--line);border-radius:8px;overflow:hidden;margin-bottom:12px}
.seg button{border:0;background:var(--panel);color:var(--ink2);padding:7px 14px;cursor:pointer;font-size:13px}
.seg button.on{background:var(--accent);color:#0b0f12;font-weight:600}
details.comp{margin-top:12px}
details.comp>summary,details.unit>summary{cursor:pointer;list-style:none;display:flex;flex-wrap:wrap;align-items:center;gap:8px 18px;padding:10px 14px;background:var(--panel);border:1px solid var(--line);border-radius:12px;user-select:none}
details.comp>summary::-webkit-details-marker,details.unit>summary::-webkit-details-marker{display:none}
details.comp>summary:before,details.unit>summary:before{content:"▸";color:var(--mute);width:12px}
details.comp[open]>summary:before,details.unit[open]>summary:before{content:"▾"}
details.comp>summary .nm{font-family:Georgia,serif;font-size:17px;min-width:170px}
details.unit{margin:8px 0 0 22px}
details.unit>summary{padding:8px 12px;border-left:3px solid var(--accent);border-radius:0 12px 12px 0}
details.unit>summary .nm{font-size:13.5px;font-weight:600;min-width:170px}
.strip{display:flex;flex-wrap:wrap;gap:6px 22px;margin-left:auto}
.st{min-width:96px}.st .k{font-size:10.5px;color:var(--mute);text-transform:uppercase;letter-spacing:.03em}.st .v{font-size:16px;font-weight:600}.st .d{font-size:11px;color:var(--ink2)}
.cgrid{display:grid;grid-template-columns:repeat(auto-fill,minmax(320px,1fr));gap:10px;margin:8px 0 4px 14px}
.case{border:1px solid var(--line);border-radius:12px;padding:12px 14px;background:var(--bg)}
.case .t{font-weight:600;font-size:13.5px;cursor:pointer}.case .t:hover{color:var(--link);text-decoration:underline}
.case .id{color:var(--mute);font-size:11px;margin-right:4px}
.case .badges{margin:4px 0 6px}
.case .uso{font-size:11.5px;color:var(--ink2);margin-bottom:6px}
.case .nums{display:grid;grid-template-columns:1fr 1fr 1fr;gap:6px}
.case .num{border-top:1px solid var(--line);padding-top:5px;cursor:pointer}.case .num .k{font-size:10.5px;color:var(--mute);text-transform:uppercase}.case .num .v{font-size:14px;font-weight:600;color:var(--link);text-decoration:underline dotted}
i.dot{display:inline-block;width:9px;height:9px;border-radius:50%;margin-right:6px;vertical-align:0}
.pill.amb{color:var(--ink)}
.ambrow{display:grid;grid-template-columns:190px minmax(0,1fr) 190px;gap:12px;align-items:center;margin:10px 0}
.ambrow .k{font-size:12.5px;color:var(--ink2)}.ambrow .k span{display:block;color:var(--ink);font-weight:600;font-size:14px}
.bar100.big{height:22px;border-radius:6px}
.ambrow .pcts{display:flex;gap:12px;font-size:12px;color:var(--ink2)}.ambrow .pcts i{display:inline-block;width:9px;height:9px;border-radius:50%;margin-right:4px}
@media (max-width:700px){.ambrow{grid-template-columns:1fr}}
.case .why{margin:8px 0 0;font-size:12px;color:var(--ink2);line-height:1.45}
.case .why b{color:var(--ink)}
footer{padding:22px 34px;color:var(--mute);font-size:11.5px;border-top:1px solid var(--line)}
.modal{position:fixed;inset:0;background:rgba(0,0,0,.55);display:none;align-items:center;justify-content:center;z-index:40;padding:20px}
.modal.open{display:flex}
.box{background:var(--panel);border:1px solid var(--line);border-radius:16px;max-width:820px;width:100%;max-height:90vh;overflow:auto;padding:22px 26px}
.box .close{float:right;border:0;background:var(--panel2);border-radius:8px;padding:5px 10px;cursor:pointer;color:var(--ink)}
.box h3{margin:16px 0 4px;font-size:14px}.box p{margin:0;color:var(--ink2);font-size:13px;line-height:1.5}
.kv{display:grid;grid-template-columns:170px 1fr;gap:4px 12px;margin:10px 0;font-size:13px}.kv dt{color:var(--mute)}.kv dd{margin:0}
@media (max-width:900px){.wrap{grid-template-columns:1fr}aside{position:static;height:auto}main{padding:18px}}
"""

JS_REG = r"""
const D = __DATA__; const esc = s => String(s??"").replace(/&/g,"&amp;").replace(/</g,"&lt;");
const RE = {cumplida:["ok","Cumplida","✓"],en_curso:["mid","En curso","◑"],pendiente:["ko","Pendiente","○"],descartada:["na","Descartada","✕"]};
const AMB = [...new Set(D.recs.map(r=>r.ambito))]; const state = {estado:"", ambito:""};
const PAN = {agilidad:["agilidad","Agilidad por riesgo, potencial y ambición"],ambicion:["ambicion","Dónde invierte la compañía"],valor:["valor","Valor frente a potencial"],movimientos:["movimientos","Movimientos e incidentes"],guardarrailes:["operacion","Asistentes en producción"],semaforo:["riesgo","Riesgo y cumplimiento"],adopcion:["tendencia","Tendencia y adopción"],incidentes:["movimientos","Movimientos e incidentes"],inventario:["inventario","Inventario"]};
function summary(){ const k=D.kpi.recs, n=D.recs.length; document.getElementById("sum").innerHTML = Object.keys(RE).map(e=>`<div class="tile"><div class="n">${k[e]}</div><div class="l">${RE[e][1]}${e==="descartada"||e==="en_curso"?"":"s"}</div><div class="meter"><i style="width:${100*k[e]/n}%;background:${e==="cumplida"?"var(--good)":e==="en_curso"?"var(--warn)":e==="pendiente"?"var(--critical)":"var(--mute)"}"></i></div></div>`).join(""); }
function chips(){ document.getElementById("chips").innerHTML = `<span class="lbl">Estado</span>`+Object.keys(RE).map(e=>`<button class="chip${state.estado===e?" on":""}" data-k="estado" data-v="${e}">${RE[e][1]}</button>`).join("")+`<span class="lbl">Ámbito</span>`+AMB.map(a=>`<button class="chip${state.ambito===a?" on":""}" data-k="ambito" data-v="${a}">${a}</button>`).join("");
  document.querySelectorAll("#chips .chip").forEach(b=>b.onclick=()=>{ const k=b.dataset.k, v=b.dataset.v; state[k]=state[k]===v?"":v; chips(); render(); }); }
function render(){ document.getElementById("tl").innerHTML = D.sesiones.map(s=>{ const rs=D.recs.filter(r=>r.sesion===s.id&&(!state.estado||r.estado===state.estado)&&(!state.ambito||r.ambito===state.ambito)); if(!rs.length) return "";
  return `<div class="ses"><div class="dot"></div><div class="shead"><h2>${s.id} · ${esc(s.nombre)}</h2><div class="sub">${s.fecha} · ${esc(s.tema)} · ${rs.length} recomendaciones</div></div>
   <div class="cards">${rs.map(r=>{const st=RE[r.estado]; const p=r.panel?PAN[r.panel]:null; return `<article class="rec"><header><span class="id">${r.id}</span><span class="pill na">${r.ambito}</span><span class="pill ${st[0]}" title="Estado declarado por la compañía">${st[2]} ${st[1]}</span></header>
     <p class="txt">${esc(r.texto)}</p>
     <dl><dt>Destinatario</dt><dd>${esc(r.destinatario)}</dd><dt>Fecha comprometida</dt><dd>${r.fecha}</dd><dt>Evidencia presentada</dt><dd>${esc(r.evidencia)}</dd><dt>Valoración del consejo asesor</dt><dd>${esc(r.valoracion)}</dd></dl>
     ${p?`<a class="go" href="__SLUG___Panel_IA_demo.html#${p[0]}">↗ Ver en el panel: ${p[1]}</a>`:""}</article>`;}).join("")}</div></div>`; }).join(""); }
summary(); chips(); render();
// códigos citados (D99): con D.codigos (ruta al índice de códigos del sitio, codigos.js), los códigos escritos en el registro pasan a ser
// enlaces a donde se explican y la cabecera ofrece «Ir a código» y «Citados aquí». Se carga sin medición de visitas. Sin la clave, nada cambia.
if (D.codigos){ document.body.setAttribute("data-enlazar-codigos", "");
  const t = document.querySelector(".top"); if (t){ const h = document.createElement("div"); h.setAttribute("data-ir-codigo", ""); h.className = "ir-codigo-panel"; t.appendChild(h); }
  const s = document.createElement("script"); s.src = D.codigos; s.defer = true; s.setAttribute("data-sin-medicion", ""); document.head.appendChild(s); }
"""
CSS_REG_EXTRA = r"""
.top{padding:26px 34px 10px;border-bottom:1px solid var(--line);background:var(--panel)}
.top h1{font-size:30px;margin:0 0 4px}
.top .lead{color:var(--ink2);max-width:110ch;margin:0 0 16px}
/* control «Ir a código» y lista de citados (codigos.js, D99) con los colores del tema del registro */
.ir-codigo-panel{margin-top:14px}.ir-codigo-panel,.ir-codigo-lista{--papel:var(--panel);--papel-2:var(--panel2);--tinta:var(--ink);--tinta-2:var(--ink2);--regla:var(--line);--regla-2:var(--line);--claret:var(--link);--oxford:var(--link);--negro:var(--ink);--sans:inherit}
.sum{display:grid;grid-template-columns:repeat(auto-fit,minmax(160px,1fr));gap:12px;max-width:900px}
.filters{display:flex;flex-wrap:wrap;gap:6px;align-items:center;padding:12px 34px;border-bottom:1px solid var(--line)}
.filters .lbl{color:var(--mute);font-size:10.5px;text-transform:uppercase;letter-spacing:.06em;margin:0 4px 0 10px}
.chip{background:var(--panel2);border:1px solid transparent;color:var(--ink2);border-radius:999px;padding:4px 11px;cursor:pointer;font-size:12.5px}
.chip.on{border-color:var(--accent);color:var(--ink)}
.tl{padding:24px 34px 60px;max-width:1300px;position:relative}
.tl:before{content:"";position:absolute;left:44px;top:30px;bottom:60px;width:2px;background:var(--line)}
.ses{position:relative;padding-left:44px;margin-bottom:30px}
.ses .dot{position:absolute;left:4px;top:8px;width:14px;height:14px;border-radius:50%;background:var(--accent);border:3px solid var(--bg)}
.shead h2{font-size:21px;margin:0}
.shead .sub{color:var(--mute);font-size:12.5px;margin:2px 0 12px}
.cards{display:grid;grid-template-columns:repeat(auto-fill,minmax(min(360px,100%),1fr));gap:12px}
@media (max-width:700px){.tl{padding:16px 12px 40px}.tl:before{left:22px}.ses{padding-left:32px}.rec dl{grid-template-columns:100px 1fr}}
.rec{background:var(--panel);border:1px solid var(--line);border-radius:14px;padding:14px 16px;display:flex;flex-direction:column;gap:8px}
.rec header{display:flex;gap:6px;align-items:center;flex-wrap:wrap}
.rec .id{font-family:Georgia,serif;font-size:18px;margin-right:4px}
.rec .txt{margin:0;font-size:14px;line-height:1.45}
.rec dl{display:grid;grid-template-columns:130px 1fr;gap:3px 10px;margin:0;font-size:12.5px}
.rec dt{color:var(--mute)}.rec dd{margin:0}
.rec .go{font-size:12px;text-decoration:none;margin-top:auto}
"""
HTML_REG = """<!DOCTYPE html><html lang="es"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<title>__GRUPO__ · Registro de recomendaciones · __INDUSTRIA__ (demo)</title><style>__CSS__</style></head><body>
<div class="demo">Demo · datos ficticios</div>
<div class="top"><span class="sector">__INDUSTRIA__</span><h1 style="margin-top:8px">Registro de recomendaciones del consejo asesor</h1><p class="lead">__GRUPO__ · __CONSEJO__ · una fila por recomendación con un identificador que nunca se reinicia, el estado que declara la compañía, la evidencia presentada y la valoración del consejo asesor. Cada recomendación enlaza con el bloque del panel donde se mide. Estado a __HOY__.</p><div class="sum" id="sum"></div></div>
<div class="filters" id="chips"></div>
<div class="tl" id="tl"></div>
<footer>Demostración con datos ficticios · __GRUPO__, su consejo asesor, sus compañías y personas son inventados · sector: __INDUSTRIA__ · <a href="__SLUG___Panel_IA_demo.html">Ver el panel de IA del Consejo</a> · Generado el __GEN__</footer>
<script>__JS__</script></body></html>"""

