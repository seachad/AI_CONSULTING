# -*- coding: utf-8 -*-
"""T17 · Conector del registro de iniciativas T01 de SEVEN-G al panel de IA del Consejo (T17) y al registro de recomendaciones (T18).

© 2026 Fernando García Varela · Metodología SEVEN-G. Código bajo licencia MIT; contenidos bajo CC BY 4.0.

Aviso legal: SEVEN-G y esta herramienta se ofrecen «tal cual» y con fines exclusivamente informativos. No constituyen
asesoramiento jurídico, regulatorio ni financiero ni garantizan el cumplimiento de ninguna norma. Las clasificaciones y
referencias a regulación pueden quedar desactualizadas: cada organización es la única responsable de verificar la normativa
que le aplica y certificar su propio cumplimiento. El autor no asume responsabilidad por su uso. Los datos de
demostración son ficticios.

Convierte el JSON completo que exporta el registro de iniciativas T01 (esquema_registro.schema.json, versiones 0.1 a 0.5) al JSON
del panel (motor/ESQUEMA.md) y genera con el motor el panel completo y el movil; si T01 trae recomendaciones, genera tambien el
registro de recomendaciones. Solo biblioteca estandar. La tabla de mapeo esta en README.md.

Patron: registro T01 (JSON) + config_panel.json -> este conector -> dashboard_data.json -> motor -> panel completo y movil.
El registro es la unica entrada de datos (cada iniciativa se da de alta como una oportunidad en un CRM); la configuracion general
del panel (umbrales de los indicadores y ciclo de vida: etapas del embudo, salidas y limites de dias) esta en config_panel.json
y se copia en meta. El ciclo de vida de cada caso (historial_estados) sale de los eventos de T01: nunca se estima.

El motor del panel vive en la subcarpeta motor/ de esta herramienta (copia mantenida en AI_CONSULTING desde el 17-09-2026;
origen: AI_en_el_consejo/motor, MIT, mismo autor) junto con demo_lib.py (plantilla de la pagina del registro). No hace falta
ningun otro repositorio. Opcionalmente, --panel <ruta> apunta a otro motor: un checkout del repositorio AI en el Consejo
(<ruta>/motor y <ruta>/demos/fuente).

Uso (desde esta carpeta):
  uv run python t01_a_panel.py [--t01 export_t01.json] [--salida carpeta] [--sigla CA] [--organizacion "..."] [--prefijo t01_] [--panel ruta]

Reglas:
  - null significa «sin dato» y nunca se convierte en cero. Lo que T01 no registra queda a null.
  - El conector no modifica el motor: usa sus claves heredadas (estimado_cati, acciones_estimadas_cati). Los cambios del motor
    se proponen en PROPUESTA_MOTOR.md.
  - Todo lo generado lleva el aviso legal (publicacion_panel.py).
"""
import argparse, datetime, json, os, sys

sys.dont_write_bytecode = True   # no dejar __pycache__

AQUI = os.path.dirname(os.path.abspath(__file__))
MOTOR_LOCAL = os.path.join(AQUI, "motor")
CONFIG_PANEL = os.path.join(AQUI, "config_panel.json")
T01_POR_DEFECTO = os.path.join(AQUI, "..", "T01_registro_iniciativas", "datos_demo.json")
SALIDA_POR_DEFECTO = os.path.join(AQUI, "ejemplo", "salida")
# indice de transformacion del ejemplo: lo exporta la calculadora T14 desde los mismos datos de T01
# (pwsh -File ../T14_indice_transformacion/build_indice.ps1 -DesdeT01 ../T01_registro_iniciativas/datos_demo.json -Exportar ejemplo/t14_indice.json)
INDICE_POR_DEFECTO = os.path.join(AQUI, "ejemplo", "t14_indice.json")
RUTA_CONECTOR = "SEVEN-G/herramientas/T17_panel_consejo/t01_a_panel.py"
# la misma correspondencia en JavaScript (D103): se incrusta en los paneles generados y en el registro T01; verificar_coherencia.ps1
# comprueba que produce el mismo JSON que este script con los datos de demostracion
CONECTOR_JS = os.path.join(AQUI, "t01_a_panel.js")

BD = ECO = PUB = None   # se cargan con cargar_motor()


def cargar_motor(panel=None):
    """Importa el motor. Por defecto, el de ./motor (motor y demo_lib en la misma carpeta). Con panel, un checkout del
    repositorio AI en el Consejo: <panel>/motor y <panel>/demos/fuente. La carpeta del conector queda la primera en sys.path,
    para que publicacion_panel.py se importe de aqui. Mensaje claro si falta algo."""
    global BD, ECO, PUB
    if BD is not None:
        return MOTOR_LOCAL if panel is None else os.path.abspath(panel)
    if panel:
        panel = os.path.abspath(panel)
        rutas = {"motor": os.path.join(panel, "motor"), "fuente": os.path.join(panel, "demos", "fuente")}
        que = "el repositorio AI en el Consejo (motor del panel) en\n  " + panel
    else:
        panel = MOTOR_LOCAL
        rutas = {"motor": MOTOR_LOCAL, "fuente": MOTOR_LOCAL}
        que = "el motor del panel en\n  " + MOTOR_LOCAL
    necesarios = [(rutas["motor"], f) for f in ("build_dashboard.py", "economia.py", "panel_core.py", "panel_movil.py", "glosario.py")] + [(rutas["fuente"], "demo_lib.py")]
    faltan = sorted({os.path.join(r, f) for r, f in necesarios if not os.path.isfile(os.path.join(r, f))})
    if faltan:
        sys.exit("error: no se encuentra " + que + "\n  faltan: " + ", ".join(faltan) + "\n"
                 "  El motor va en la subcarpeta motor/ de esta herramienta; para usar otro, --panel <ruta de un checkout de AI en el Consejo>.")
    for ruta in dict.fromkeys((rutas["fuente"], rutas["motor"], AQUI)):   # AQUI queda en primer lugar
        if ruta in sys.path:
            sys.path.remove(ruta)
        sys.path.insert(0, ruta)
    import build_dashboard, economia, publicacion_panel   # noqa: E402
    BD, ECO, PUB = build_dashboard, economia, publicacion_panel
    return panel


VERSION_CONECTOR = "2.1"
ESQUEMAS_T01 = ("0.1", "0.2", "0.3", "0.4", "0.5", "0.6")   # 0.6 (D100): lista opcional madurez[] escrita por T15 -> bloque «madurez» del panel
FUENTE_T01 = "Registro de iniciativas T01"

# ---------------------------------------------------------------- listas cerradas de T01 y su etiqueta en el panel
FASES = {0: "Contexto y restricciones", 1: "Descubrimiento", 2: "Hipótesis de valor", 3: "Viabilidad y riesgo", 4: "Diseño de la solución",
         5: "Entrega y validación", 6: "Operación y gobierno", 7: "Evolución o retirada"}
ESTADOS_T01 = {"registrada": "Registrada", "en_fase": "En fase", "pendiente_gate": "Pendiente de gate", "en_espera": "En espera",
               "en_produccion": "En producción", "pendiente_g7": "Pendiente de G7", "parada": "Parada", "retirada": "Retirada"}
ESFERAS = {"01": "01 Cliente", "02": "02 Producto y servicio", "03": "03 Personas", "04": "04 Operaciones", "05": "05 Datos", "06": "06 Conocimiento",
           "07": "07 Decisión", "08": "08 Regulación, ética y responsabilidad", "09": "09 Gobierno de la IA"}
AMBICION = {"optimizar": "Optimizar", "aumentar": "Aumentar", "transformar": "Transformar"}
INTENSIDAD = {"lite": "Lite", "enterprise": "Enterprise"}
# tecnologia: etiqueta del panel (el panel reconoce agentes e IA generativa por "Agéntico" y "GenAI") y naturaleza
TECNOLOGIA = {"ml_predictivo": "ML predictivo", "ia_generativa": "GenAI", "agente": "Agéntico", "lenguaje_documentos": "NLP / IDP", "vision": "Visión artificial",
              "optimizacion": "Optimización", "ia_terceros_embebida": "IA de tercero", "reglas": "Reglas (no es IA)"}
TECNOLOGIA_TXT = {"ml_predictivo": "ML predictivo", "ia_generativa": "IA generativa", "agente": "Agente", "lenguaje_documentos": "Procesamiento de lenguaje y documentos",
                  "vision": "Visión", "optimizacion": "Optimización", "ia_terceros_embebida": "IA de terceros embebida", "reglas": "Reglas (no es IA)"}
NATURALEZA = {"ml_predictivo": "ML / NLP tradicional", "ia_generativa": "IA generativa / agéntica", "agente": "IA generativa / agéntica", "lenguaje_documentos": "ML / NLP tradicional",
              "vision": "ML / NLP tradicional", "optimizacion": "Analítica y optimización", "ia_terceros_embebida": "IA de tercero", "reglas": "Reglas de negocio (no es IA)"}
EXPOSICION = {"interna": "Interno", "empleados": "Empleado", "clientes_indirecta": "Cliente (indirecta)", "clientes_directa": "Cliente / persona externa (directa)"}
REGULATORIA_TAG = {"prohibido": "Prohibido", "alto_riesgo": "Alto riesgo", "transparencia": "Transparencia (art. 50)", "riesgo_minimo": "Riesgo mínimo",
                   "fuera_ambito": "Fuera de ámbito", "pendiente": "Por confirmar"}
REGULATORIA_RIA = {"prohibido": "prohibido", "alto_riesgo": "alto_riesgo", "transparencia": "transparencia", "riesgo_minimo": "minimo", "fuera_ambito": "no_es_ia", "pendiente": None}
TIPO_VALOR = {"eficiencia": "Eficiencia", "retorno": "Retorno", "riesgo_evitado": "Riesgo evitado", "cumplimiento": "Cumplimiento"}
MOTIVO = {"sin_valor_plausible": "Sin valor plausible", "hipotesis_refutada": "Hipótesis refutada", "datos_insuficientes": "Datos insuficientes",
          "inviable_tecnicamente": "Inviable técnicamente", "coste_superior_valor": "Coste superior al valor", "riesgo_inaceptable": "Riesgo inaceptable",
          "regulacion": "Regulación", "sin_adopcion": "Sin adopción", "sustituida": "Sustituida por otra solución", "cambio_prioridad": "Cambio de prioridad estratégica"}
RESULTADO = {"continuar": "Continuar", "continuar_condiciones": "Continuar con condiciones", "iterar": "Iterar", "pivotar": "Pivotar", "parar": "Parar",
             "escalar": "Escalar", "retirar": "Retirar", "continuar_operacion": "Continuar la operación", "adelantar_g7": "Adelantar G7"}
ORGANO = {"patrocinador": "Patrocinador", "patrocinador_conformidad_riesgos": "Patrocinador con conformidad de riesgos",
          "patrocinador_informando_comite": "Patrocinador informando al comité", "comite_ia": "Comité de IA", "comite_ia_firma_multinivel": "Comité de IA (firma multinivel)",
          "consejo": "Consejo", "organo_superior": "Órgano superior"}
EVALUACION = {"hecha": "hecho", "pendiente": "pendiente", "no_aplica": "no_aplica"}
RIESGO_TIER = {"bajo": "bajo", "medio": "medio", "alto": "alto", "critico": "alto"}
# bloque opcional «panel» de cada iniciativa (esquema 0.2) y concepto de cada importe
PRIORIDAD = {"alta": "Alta", "media": "Media", "baja": "Baja"}
COMPLEJIDAD = ("baja", "media", "alta")
CONTROL = ("hecho", "pendiente", "no_aplica")
CONCEPTOS = {"eficiencias": ("personas", "herramientas", "siniestros", "operativo", "penalizaciones"),
             "retorno": ("venta_nueva", "venta_cruzada", "retencion", "precio_margen", "cobros", "otros")}
CONCEPTO_POR_DEFECTO = {"eficiencias": "operativo", "retorno": "otros"}
# alcance de la iniciativa (esquema 0.3): etiqueta del filtro del panel; las iniciativas de una unidad no llevan etiqueta
ALCANCE = {"transversal": "Transversal", "plataforma": "Plataforma habilitadora"}
UNIDAD_TRANSVERSAL = "Varias unidades (transversal)"
# ciclo de vida por defecto (si falta config_panel.json): etapa del embudo de cada fase de SEVEN-G
# Las dos terminales del embudo son paralelas: En uso (en producción) y Desenganchado (retirada tras paso a producción).
CICLO_POR_DEFECTO = {
    "fases_seven_g": {"0": "Propuesto", "1": "Propuesto", "2": "Hipótesis de valor", "3": "POC", "4": "En desarrollo", "5": "En desarrollo", "6": "En uso", "7": "En uso"},
    "embudo": ["Propuesto", "Hipótesis de valor", "POC", "En desarrollo", "En uso"], "ganado": "En uso",
    "salidas": {"No aprobado": ["Propuesto"], "Descartado": ["Hipótesis de valor", "POC", "En desarrollo"], "Desenganchado": ["En uso"]},
}
CONTINUAN = ("continuar", "continuar_condiciones")
# recomendaciones: estado de T01 -> estado del registro (T18)
ESTADO_REC = {"abierta": "pendiente", "en_curso": "en_curso", "cerrada": "cumplida", "descartada": "descartada"}
ANCLAS = {"inventario": ["cards", "Inventario"], "movimientos": ["cart1", "Movimientos del periodo"], "valor": ["c1", "Eficiencias, retorno y coste"],
          "semaforo": ["rie1", "Semáforo regulatorio"], "incidentes": ["rie2", "Incidentes y brechas"]}
GLOSARIO_SEVEN_G = [
    ["SEVEN-G", "SEVEN-G", "Metodología de gobierno de la IA", "Marco con el que se registran las iniciativas: fases 0 a 7, puertas de decisión (gates), ambición e intensidad.", False],
    ["SEVEN-G", "T01", "Registro de iniciativas", "Herramienta de SEVEN-G de la que salen los datos de este panel: fases, estados, eventos, gates, valor e incidentes.", True],
    ["SEVEN-G", "G3", "Gate de viabilidad y riesgo", "Puerta de decisión que aprueba construir. En este panel, su fecha es la de aprobación.", True],
    ["SEVEN-G", "G5", "Gate de paso a producción", "Puerta de decisión que autoriza operar. En este panel, su fecha es la de puesta en producción.", True],
    ["SEVEN-G", "R6", "Revisión de continuidad", "Revisión periódica de una iniciativa en producción: continuar, continuar con condiciones o adelantar G7. Cuenta como reevaluación.", False],
    ["SEVEN-G", "Ambición", "Optimizar, Aumentar o Transformar", "Nivel de ambición de la iniciativa: se usa la real si existe; si no, la confirmada; si no, la propuesta.", False],
    ["SEVEN-G", "Embudo", "Etapas del panel y fases de SEVEN-G", "Propuesto = fases 0 y 1 · Hipótesis de valor = fase 2 · POC = fase 3 (viabilidad y riesgo) · En desarrollo = fases 4 y 5 · "
     "En uso = fases 6 y 7. Una parada en las fases 0-1 figura como No aprobado; en las fases 2-5, como Descartado; una retirada, como Desenganchado. "
     "Las fechas de cada cambio salen de los eventos de T01.", False],
    ["SEVEN-G", "Transversal", "Iniciativa transversal", "Herramienta que usan varias unidades de negocio (por ejemplo, un asistente generativo en la suite ofimática). "
     "Se mide por unidad con una escalera: coste, adopción, capacidad liberada declarada (no suma) y valor materializado (documento 40 §7.2).", True],
    ["SEVEN-G", "Plataforma", "Plataforma habilitadora", "Capacidad común (datos, conocimiento, decisión) cuyo valor se imputa a los casos que la usan; "
     "en la plataforma solo cuenta su coste (documento 10 §4.1, regla 3).", False],
]


# ---------------------------------------------------------------- utilidades
def _fecha_txt(f):
    return "-".join(reversed(f.split("-"))) if f else "sin fecha"


def _euros(x):
    return f"{x:,.0f} €".replace(",", ".") if x is not None else "sin dato"


def _sin_comentarios(x):
    """Quita las claves que empiezan por '_' (comentarios del JSON de configuración)."""
    if isinstance(x, dict):
        return {k: _sin_comentarios(v) for k, v in x.items() if not k.startswith("_")}
    return [_sin_comentarios(v) for v in x] if isinstance(x, list) else x


def cargar_config_panel(ruta=None):
    """Configuración general del panel (config_panel.json, junto a este script): umbrales_kpi y ciclo_vida. Se copia en meta.
    Si falta el fichero, el motor usa sus umbrales por defecto y el conector, el ciclo de vida de SEVEN-G por defecto."""
    ruta = ruta or CONFIG_PANEL
    cfg = _sin_comentarios(json.load(open(ruta, encoding="utf-8"))) if os.path.exists(ruta) else {}
    cfg["ciclo_vida"] = {**CICLO_POR_DEFECTO, **(cfg.get("ciclo_vida") or {})}
    ciclo = cfg["ciclo_vida"]
    etapas = set(ciclo["embudo"])
    assert set(ciclo["fases_seven_g"]) == {str(f) for f in range(8)} and set(ciclo["fases_seven_g"].values()) <= etapas, \
        "config_panel.json: ciclo_vida.fases_seven_g debe asignar a cada fase (0 a 7) una etapa de ciclo_vida.embudo"
    assert all(set(v) <= etapas for v in ciclo["salidas"].values()), "config_panel.json: ciclo_vida.salidas cita etapas que no están en el embudo"
    return cfg


def etapa_de_fase(ciclo_vida, fase):
    return ciclo_vida["fases_seven_g"][str(fase)]


def salida_de_etapa(ciclo_vida, etapa):
    """Estado de pérdida previsto para una iniciativa que se cierra estando en esa etapa (la primera salida que la admite)."""
    return next((s for s, origenes in ciclo_vida["salidas"].items() if etapa in origenes), None) or next(iter(ciclo_vida["salidas"]), etapa)


def estado_panel(ini, ciclo_vida):
    """Estado del panel a partir de la fase y el estado de T01 (tabla en README.md): la etapa del embudo de su fase o, si la
    iniciativa está cerrada (parada o retirada), la salida prevista para esa etapa."""
    etapa = etapa_de_fase(ciclo_vida, ini["ciclo"]["fase"])
    if ini["ciclo"]["estado"] in ("parada", "retirada") or ini.get("cierre"):
        return salida_de_etapa(ciclo_vida, etapa)
    return etapa


def historial_estados(ix, ini, ciclo_vida):
    """Ciclo de vida del caso, como en un CRM: un cambio de estado por cada vez que la iniciativa entra en una etapa del embudo
    (alta y eventos entrada_fase de T01, incluidas las vueltas atrás por pivotar o iterar) y, si está cerrada, su salida.
    Las fechas son las de los eventos del registro: nunca se estiman. Entradas consecutivas en la misma etapa se agrupan."""
    his = []
    evs = ix.eventos.get(ini["id"], [])

    def cifras(e):
        """Cifras guardadas en T01 con el cambio de estado (evento.cifras, esquema 0.2): previsto = esperado, actual = realizado."""
        c = (e or {}).get("cifras")
        if not c:
            return None
        lado = lambda m: {"inversion": (c.get(m) or {}).get("inversion"), "recurrente": (c.get(m) or {}).get("coste_recurrente"),
                          "eficiencias": (c.get(m) or {}).get("eficiencias"), "retorno": (c.get(m) or {}).get("retorno")}
        return {"previsto": lado("esperado"), "actual": lado("realizado")}

    def entra(estado, fecha, nota, evento=None):
        if fecha and (not his or his[-1]["estado"] != estado):
            his.append({"estado": estado, "fecha": fecha, "fuente": FUENTE_T01, "nota": nota, "cifras": cifras(evento)})

    entra(etapa_de_fase(ciclo_vida, 0), ini.get("fecha_registro"), "Alta en el registro", next((e for e in evs if e["tipo"] == "alta"), None))
    for e in evs:
        if e["tipo"] == "entrada_fase" and e.get("fase") is not None:
            entra(etapa_de_fase(ciclo_vida, e["fase"]), e["fecha"], f"Entrada en la fase {e['fase']} ({FASES.get(e['fase'])})", e)
    cierre = ini.get("cierre")
    if cierre or ini["ciclo"]["estado"] in ("parada", "retirada"):
        cierre = cierre or {}
        que = "Parada" if (cierre.get("tipo") or ini["ciclo"]["estado"]) == "parada" else "Retirada"
        entra(estado_panel(ini, ciclo_vida), cierre.get("fecha"), f"{que}{(' en ' + cierre['gate']) if cierre.get('gate') else ''}"
              + (f" · {MOTIVO.get(cierre.get('motivo'), cierre.get('motivo'))}" if cierre.get("motivo") else ""),
              next((e for e in reversed(evs) if e["tipo"] in ("parada", "retirada")), None))
    return his


def tecnologia_principal(tecs):
    """Una sola etiqueta para filtrar: agente, si lo hay; si no, IA generativa; si no, la primera de la lista."""
    tecs = tecs or []
    for t in ("agente", "ia_generativa"):
        if t in tecs:
            return t
    return tecs[0] if tecs else None


def ambicion(cl):
    return cl.get("ambicion_real") or cl.get("ambicion_confirmada") or cl.get("ambicion_propuesta")


class Indice:
    """Accesos rapidos a las entidades de T01."""
    def __init__(self, t01):
        self.t01 = t01
        self.personas = {p["id"]: p for p in t01.get("personas") or []}
        self.proveedores = {p["id"]: p for p in t01.get("proveedores") or []}
        self.ini = {i["id"]: i for i in t01.get("iniciativas") or []}
        self.eventos, self.decisiones, self.valores = {}, {}, {}
        for e in sorted(t01.get("eventos") or [], key=lambda e: (e["fecha"], e["id"])):
            self.eventos.setdefault(e.get("iniciativa"), []).append(e)
        for d in sorted(t01.get("decisiones_gate") or [], key=lambda d: (d.get("fecha_decision") or d["fecha_solicitud"], d["iteracion"], d["id"])):
            self.decisiones.setdefault(d["iniciativa"], []).append(d)
        for v in t01.get("valores") or []:
            self.valores.setdefault(v["iniciativa"], []).append(v)

    def nombre_persona(self, pid):
        p = self.personas.get(pid)
        return p["nombre"] if p else (pid or None)

    def caso(self, iid):
        i = self.ini.get(iid)
        return f"{iid} {i['nombre']}" if i else iid

    def decision(self, iid, gate, resultados=CONTINUAN):
        return next((d for d in self.decisiones.get(iid, []) if d["gate"] == gate and d.get("fecha_decision") and d.get("resultado") in resultados), None)

    def entrada_fase(self, iid, fase):
        return next((e["fecha"] for e in self.eventos.get(iid, []) if e["tipo"] == "entrada_fase" and e.get("fase") == fase), None)

    def valor(self, iid, momento, tipo, concepto=None):
        """El importe mas reciente de ese momento y tipo (por fecha y codigo); con concepto, solo los de ese concepto.
        Con importes por unidad (campo opcional «area», esquema 0.3), el mas reciente de cada unidad, sumados: una iniciativa
        transversal suma sus unidades y lo comun (sin unidad). Sin «area», un solo grupo: el comportamiento de siempre."""
        vs = [v for v in self.valores.get(iid, []) if v["momento"] == momento and v["tipo"] == tipo
              and (concepto is None or concepto_de(v) == concepto)]
        ultimos = {}
        for v in sorted(vs, key=lambda v: (v.get("fecha") or "", v["id"])):
            ultimos[v.get("area") or None] = v
        if len(ultimos) <= 1:
            return next(iter(ultimos.values()), None)
        return agregado(list(ultimos.values()))

    def por_area(self, iid, momento, tipos, area):
        """Importes mas recientes de esos tipos en una unidad (area None = lo comun, sin unidad), uno por tipo y concepto."""
        ult = {}
        for v in sorted(self.valores.get(iid, []), key=lambda v: (v.get("fecha") or "", v["id"])):
            if v["momento"] == momento and v["tipo"] in tipos and (v.get("area") or None) == area:
                ult[(v["tipo"], concepto_de(v))] = v
        return list(ult.values())

    def conceptos(self, iid, tipo):
        """Conceptos con algun importe de ese tipo, en el orden del motor."""
        usados = {concepto_de(v) for v in self.valores.get(iid, []) if v["tipo"] == tipo}
        return [c for c in CONCEPTOS[tipo] if c in usados]


RANGO_ESTADO = {"estimado": 0, "declarado": 1, "validado": 2}


def agregado(vs):
    """Suma de los importes de varias unidades en un solo importe: el estado es el mas prudente de los sumados (regla 2) y la
    formula enumera cada unidad. Un importe sin dato no suma como cero; si ninguno tiene dato, el total es sin dato."""
    con = [v for v in vs if v.get("importe") is not None]
    return {"id": vs[0]["id"], "iniciativa": vs[0]["iniciativa"], "momento": vs[0]["momento"], "tipo": vs[0]["tipo"], "concepto": vs[0].get("concepto"),
            "importe": sum(v["importe"] for v in con) if con else None,
            "estado": min((v["estado"] for v in vs), key=lambda e: RANGO_ESTADO.get(e, 0)),
            "formula": "Suma por unidades: " + " + ".join(f"{v.get('area') or 'común'} {_euros(v.get('importe'))}" + (f" ({v['formula']})" if v.get("formula") else "") for v in vs),
            "fuente": ", ".join(dict.fromkeys(v["fuente"] for v in vs if v.get("fuente"))) or None,
            "fecha": max((v["fecha"] for v in vs if v.get("fecha")), default=None)}


def concepto_de(v):
    """Concepto del panel de un importe de eficiencias o retorno (campo opcional «concepto», esquema 0.2); si falta o no es del
    vocabulario del motor, el concepto genérico (operativo u otros)."""
    tipo = v.get("tipo")
    if tipo not in CONCEPTOS:
        return None
    return v.get("concepto") if v.get("concepto") in CONCEPTOS[tipo] else CONCEPTO_POR_DEFECTO[tipo]


def item(v, hipotesis=None):
    """Importe de T01 -> item del panel. estimado -> estimado_cati (clave heredada del motor)."""
    if not v:
        return None
    return ECO.item(v.get("importe"), v.get("formula"), "estimado_cati" if v["estado"] == "estimado" else v["estado"], v.get("fuente"),
                    v.get("fecha"), None, hipotesis)


# ---------------------------------------------------------------- casos
def economia(ix, ini, cerrado, moneda):
    iid = ini["id"]
    V = lambda m, t: ix.valor(iid, m, t)
    inv_ficha = ini.get("inversion") or {}
    if V("realizado", "inversion"):
        construccion = item(V("realizado", "inversion"))
    elif inv_ficha.get("realizada") is not None:
        construccion = ECO.item(inv_ficha["realizada"], "Inversión realizada según la ficha de la iniciativa", "declarado", FUENTE_T01)
    else:
        construccion = item(V("esperado", "inversion"))
    notas = [f"SEVEN-G T01 · fase {ini['ciclo']['fase']} ({FASES.get(ini['ciclo']['fase'])}) · {ESTADOS_T01.get(ini['ciclo']['estado'])}"]
    extra = [(t, V(m, t)) for m in ("realizado", "esperado") for t in ("riesgo_evitado", "cumplimiento") if V(m, t)]
    for t, v in extra:
        notas.append(f"{TIPO_VALOR[t]} {v['momento']}: {_euros(v.get('importe'))} ({v['estado']}; no suma en el neto)")
    inv = {"construccion": construccion, "recurrente_anual": None, "desglose_recurrente": None, "adicional_potencial": None, "recurrente_potencial": None}
    ef, rt = [], []
    if cerrado:
        registrados = [f"{v['momento']} {v['tipo']} {_euros(v.get('importe'))}" for v in ix.valores.get(iid, []) if v["tipo"] in ("eficiencias", "retorno", "capacidad_liberada", "coste_recurrente")]
        if registrados:
            notas.append("Iniciativa cerrada: sus importes de T01 no suman en el panel (" + "; ".join(registrados) + ")")
    else:
        inv["recurrente_anual"] = item(V("realizado", "coste_recurrente"))
        inv["recurrente_potencial"] = item(V("esperado", "coste_recurrente"))
        if inv_ficha.get("pendiente") is not None:
            inv["adicional_potencial"] = ECO.item(inv_ficha["pendiente"], "Inversión pendiente según la ficha de la iniciativa", "declarado", FUENTE_T01)
        # una línea por concepto (campo opcional «concepto» de cada importe; sin él, operativo u otros)
        for tipo, destino in (("eficiencias", ef), ("retorno", rt)):
            for concepto in ix.conceptos(iid, tipo):
                a, p = ix.valor(iid, "realizado", tipo, concepto), ix.valor(iid, "esperado", tipo, concepto)
                destino.append({"concepto": concepto, "actual": item(a), "potencial": item(p)})
        a, p = V("realizado", "capacidad_liberada"), V("esperado", "capacidad_liberada")
        if a or p:
            ef.append({"concepto": "capacidad_liberada", "actual": item(a), "potencial": item(p)})
    hip = " · ".join(f"{v['tipo'].replace('_', ' ')}: {v['formula']}" for v in ix.valores.get(iid, []) if v["momento"] == "esperado" and v.get("formula"))
    return {"moneda": moneda, "nota_caso": " · ".join(notas), "inversion": inv, "eficiencias": ef, "retorno": rt,
            "plazo_potencial": ((ini.get("panel") or {}).get("plazo_potencial") or None) if not cerrado else None,
            "hipotesis_potencial": (hip or None) if not cerrado else None, "comparte_valor_con": [], "clave_reparto": None}


def alcance(ix, ini):
    """Bloque «alcance» del caso (opcional, esquema 0.3; documento 40 §7.2) o None si la iniciativa es de una unidad.
    Transversal: una fila por unidad con la escalera de medición —coste, adopción, capacidad liberada declarada y valor materializado—
    y una fila comun (unidad None) con lo que no se imputa a ninguna unidad. Plataforma: los casos a los que se imputa su valor."""
    a = ini.get("alcance") or {}
    if a.get("tipo") not in ALCANCE:
        return None
    iid = ini["id"]
    suma = lambda vs: sum(v["importe"] for v in vs if v.get("importe") is not None) if any(v.get("importe") is not None for v in vs) else None
    reparto = a.get("reparto") or []
    areas = list(dict.fromkeys([u["area"] for u in reparto] + [v["area"] for v in ix.valores.get(iid, []) if v.get("area")]))
    unidades = []
    for area in areas + [None]:
        u = next((x for x in reparto if x.get("area") == area), None) if area else None
        coste_r, coste_e = suma(ix.por_area(iid, "realizado", ("coste_recurrente",), area)), (suma(ix.por_area(iid, "esperado", ("coste_recurrente",), area)) if area else None)
        val = ix.por_area(iid, "realizado", ("eficiencias", "retorno"), area)
        fila = {"unidad": area, "estado": (u or {}).get("estado"), "desde": (u or {}).get("desde"),
                "licencias_asignadas": (u or {}).get("licencias_asignadas"), "licencias_activas": (u or {}).get("licencias_activas"),
                "usuarios_activos_semanales": (u or {}).get("usuarios_activos_semanales"), "horas_liberadas_mes": (u or {}).get("horas_liberadas_mes"),
                "coste_anual": coste_r if coste_r is not None else coste_e, "coste_previsto": coste_r is None and coste_e is not None,
                "valor_materializado": suma(val), "valor_validado": suma([v for v in val if v["estado"] == "validado"]) if val else None,
                "capacidad_liberada": suma(ix.por_area(iid, "realizado", ("capacidad_liberada",), area)),
                "fuente": (u or {}).get("fuente"), "fecha_dato": (u or {}).get("fecha_dato")}
        if area is None and fila["coste_anual"] is None and fila["valor_materializado"] is None and fila["capacidad_liberada"] is None:
            continue
        unidades.append(fila)
    return {"tipo": a["tipo"], "umbral_adopcion_pct": a.get("umbral_adopcion_pct"),
            "habilita": [{"id": h, "nombre": ix.ini[h]["nombre"] if h in ix.ini else None} for h in a.get("habilita") or []],
            "unidades": unidades if a["tipo"] == "transversal" else []}


def valor_validado(ix, ini):
    """Suma de lo realizado y validado (eficiencias y retorno) y objetivo = valor esperado; lo demas, sin dato."""
    iid = ini["id"]
    lineas = [(t, c) for t in ("eficiencias", "retorno") for c in ix.conceptos(iid, t)]
    real = [ix.valor(iid, "realizado", t, c) for t, c in lineas]
    val = [v for v in real if v and v["estado"] == "validado" and v.get("importe") is not None]
    esp = [ix.valor(iid, "esperado", t, c) for t, c in lineas]
    esp = [v["importe"] for v in esp if v and v.get("importe") is not None]
    return {"base": None, "objetivo": sum(esp) if esp else None, "actual": sum(v["importe"] for v in val) if val else None,
            "metodo_atribucion": " · ".join(v["formula"] for v in val if v.get("formula")) or None,
            "validado_por": ", ".join(sorted({v["fuente"] for v in val if v.get("fuente")})) or None,
            "fecha_validacion": max((v["fecha"] for v in val if v.get("fecha")), default=None), "recurrente": None}


def caso(ix, ini, org, moneda, ciclo_vida):
    iid, cl, ciclo = ini["id"], ini["clasificacion"], ini["ciclo"]
    estado = estado_panel(ini, ciclo_vida)
    cerrado = estado in ciclo_vida["salidas"]
    en_uso = estado == ciclo_vida["ganado"]
    pan = ini.get("panel") or {}                       # bloque opcional del esquema 0.2: lo que el panel necesita y T01 no tenía
    ctrl = pan.get("controles") or {}
    control = lambda k: ctrl.get(k) if ctrl.get(k) in CONTROL else None
    tecs = cl.get("tecnologia") or []
    tp = tecnologia_principal(tecs)
    amb = ambicion(cl)
    evals = {e["tipo"]: EVALUACION.get(e["estado"]) for e in ini.get("evaluaciones_impacto") or []}
    reg = cl.get("regulatoria")
    g3, g5 = ix.decision(iid, "G3"), ix.decision(iid, "G5")
    r6 = [d for d in ix.decisiones.get(iid, []) if d["gate"] == "R6" and d.get("fecha_decision")]
    cierre = ini.get("cierre")
    responsables = ini.get("responsables") or {}
    proveedores = ", ".join(ix.proveedores[p]["nombre"] if p in ix.proveedores else p for p in cl.get("proveedores") or []) or None
    pendiente = next((d for d in reversed(ix.decisiones.get(iid, [])) if not d.get("fecha_decision")), None)
    produccion = g5["fecha_decision"] if g5 else ix.entrada_fase(iid, 6)
    # T01 no estima años de producción: inicio_estimado es null. Excepción por el motor actual: en un caso «En uso» o «Desenganchado» sin
    # fecha de producción (p. ej., parada en G3) el panel escribiría «null (año estimado)»; con "" muestra «—» y no lo cuenta por año.
    inicio_estimado = "" if (produccion is None and (en_uso or cerrado)) else None
    al = alcance(ix, ini)   # solo iniciativas transversales y plataformas: las demás no cambian (D53)
    eco = economia(ix, ini, cerrado, moneda)
    if al and al["tipo"] == "transversal":
        eco["clave_reparto"] = ("Coste imputado a cada unidad de negocio por sus licencias; el gobierno común (oficina de adopción, formación y revisión de permisos) "
                                "va sin unidad. El valor solo cuenta cuando la unidad lo materializa (documento 40 §7.2).")
    elif al:
        eco["clave_reparto"] = "El valor de la plataforma se imputa a los casos que la usan; aquí solo cuenta su coste (documento 10 §4.1, regla 3)."
        eco["comparte_valor_con"] = [h["id"] for h in al["habilita"]]
    tags = {"tecnologia": TECNOLOGIA.get(tp), "naturaleza": NATURALEZA.get(tp), "exposicion": EXPOSICION.get(cl.get("exposicion")),
            "riesgo": REGULATORIA_TAG.get(reg), "funcion": ESFERAS.get(cl.get("esfera_principal")), "prioridad": PRIORIDAD.get(pan.get("prioridad")), "ambicion": AMBICION.get(amb)}
    if al:
        tags["alcance"] = ALCANCE[al["tipo"]]
    extra = {"alcance": al} if al else {}
    return {
        "id": iid, "nombre": ini["nombre"], "que_es": ini.get("descripcion") or None, "descripcion": pan.get("observaciones_consejo") or None, "area": ini.get("area"),
        "compania": org, "unidad": UNIDAD_TRANSVERSAL if al and al["tipo"] == "transversal" else ini.get("area"), "estado": estado, "inicio_estimado": inicio_estimado,
        "tags": tags, **extra,
        "detalle": {"tipo": ", ".join(TECNOLOGIA_TXT.get(t, t) for t in tecs) or None, "decision": None, "datos": None, "aiact": REGULATORIA_TAG.get(reg),
                    "proveedores": proveedores, "valor_tipo": ", ".join(TIPO_VALOR.get(t, t) for t in cl.get("tipo_valor") or []) or None,
                    "es_ia": NATURALEZA.get(tp) if tp else None, "acciones_estimadas_cati": None},
        "valor": {"magnitud": None, "anio": None, "acum": None, "acum_dato": False, "acum_extrapolado_cati": None,
                  "medido": any(v["momento"] == "realizado" and v.get("importe") is not None for v in ix.valores.get(iid, [])),
                  "fuente": FUENTE_T01, "nota_acum": None, "pta": None, "nombre_cdm": None},
        "economia": eco,
        "reporte_compania": {
            "propietario_negocio": ix.nombre_persona(responsables.get("patrocinador")) if responsables.get("patrocinador") else None,
            "responsable_tecnico": ix.nombre_persona(responsables.get("tecnico")) if responsables.get("tecnico") else None,
            "empresa_grupo": org,
            "fechas": {"idea": ini.get("fecha_registro"), "aprobacion": g3["fecha_decision"] if g3 else None, "inicio": ix.entrada_fase(iid, 4),
                       "piloto": ix.entrada_fase(iid, 5), "produccion": produccion,
                       "ultima_revision": r6[-1]["fecha_decision"] if r6 else None, "retirada": cierre["fecha"] if cierre else None},
            "retirada": ({"motivo": f"{'Parada' if cierre['tipo'] == 'parada' else 'Retirada'}{(' en ' + cierre['gate']) if cierre.get('gate') else ''} · "
                                    f"{MOTIVO.get(cierre['motivo'], cierre['motivo'])}" + (f": {cierre['comentario']}" if cierre.get("comentario") else ""),
                          "decisor": cierre.get("organo"), "sustituto": cierre.get("sustituto"),
                          # por qué se cerró y qué se aprendió: el panel lo muestra en las tarjetas de los casos perdidos y desenganchados
                          "lecciones": cierre.get("lecciones") or None} if cierre else {"motivo": None, "decisor": None, "sustituto": None, "lecciones": None}),
            # ciclo de vida como en un CRM: sale de los eventos de T01 (alta, entradas de fase y cierre); nunca se estima
            "historial_estados": historial_estados(ix, ini, ciclo_vida),
            "complejidad": pan.get("complejidad") if pan.get("complejidad") in COMPLEJIDAD else None,
            "tier_riesgo": RIESGO_TIER.get(ini.get("riesgo_residual_principal")),
            "clasificacion_ria": REGULATORIA_RIA.get(reg),
            "controles": {"RIA": None if reg is None else ("pendiente" if reg == "pendiente" else "hecho"), "FRIA": evals.get("eidf"), "DPIA": evals.get("eipd"),
                          "seguridad": control("seguridad"), "MUC": control("muc"), "IA_ofensiva": control("ia_ofensiva")},
            "valor_validado": valor_validado(ix, ini),
            "coste_real": {"anio": None, "acumulado": None, "fuente": None},
            "operacion": None, "agente": None, "proveedor_dora": None},
        # bloque propio de SEVEN-G: el panel actual no lo lee; se conserva para la adaptacion del motor (PROPUESTA_MOTOR.md)
        "seveng": {"fase": ciclo["fase"], "fase_nombre": FASES.get(ciclo["fase"]), "estado": ciclo["estado"], "fecha_entrada_fase": ciclo.get("fecha_entrada_fase"),
                   "iteracion": ciclo.get("iteracion"), "espera": ciclo.get("espera"), "proxima_revision": ciclo.get("proxima_revision"),
                   "gate_pendiente": pendiente["gate"] if pendiente else None, "intensidad": cl.get("intensidad"),
                   "esfera_principal": cl.get("esfera_principal"), "esfera_secundaria": cl.get("esfera_secundaria"),
                   "ambicion": {"propuesta": cl.get("ambicion_propuesta"), "confirmada": cl.get("ambicion_confirmada"), "real": cl.get("ambicion_real")},
                   "autonomia": cl.get("autonomia"), "regulatoria": reg, "etiquetas_libres": ini.get("etiquetas_libres") or [], "sistemas": ini.get("sistemas") or []},
    }


# ---------------------------------------------------------------- seguimiento
def movimientos(ix):
    """Altas, paradas y retiradas, cambios de clasificacion y revisiones de continuidad (R6)."""
    mov = []
    for iid, evs in ix.eventos.items():
        if not iid:
            continue
        ini = ix.ini.get(iid) or {}
        cierre = ini.get("cierre") or {}
        for e in evs:
            base = {"fecha": e["fecha"], "caso": ix.caso(iid), "decisor": ix.nombre_persona(e.get("autor")), "sustituto": None}
            if e["tipo"] == "alta":
                mov.append({**base, "tipo": "alta", "motivo": e.get("motivo")})
            elif e["tipo"] in ("parada", "retirada"):
                que = "Parada" if e["tipo"] == "parada" else "Retirada"
                motivo = MOTIVO.get(cierre.get("motivo"), cierre.get("motivo"))
                mov.append({**base, "tipo": "retirada", "motivo": f"{que}{(' en ' + e['gate']) if e.get('gate') else ''}{(' · ' + motivo) if motivo else ''}: {e.get('motivo')}",
                            "decisor": cierre.get("organo") or base["decisor"], "sustituto": cierre.get("sustituto")})
            elif e["tipo"] == "cambio_clasificacion":
                mov.append({**base, "tipo": "reevaluacion", "motivo": f"Cambio de {e.get('campo', 'clasificación')}: {e.get('antes') or 'sin dato'} → {e.get('despues') or 'sin dato'}. {e.get('motivo')}"})
    for iid, ds in ix.decisiones.items():
        for d in ds:
            if d["gate"] == "R6" and d.get("fecha_decision"):
                mov.append({"fecha": d["fecha_decision"], "tipo": "reevaluacion", "caso": ix.caso(iid),
                            "motivo": f"R6 · {RESULTADO.get(d.get('resultado'), d.get('resultado'))}" + (f": {d['motivo']}" if d.get("motivo") else ""),
                            "decisor": ix.nombre_persona(d["decisor"]) if d.get("decisor") else ORGANO.get(d.get("organo")), "sustituto": None})
    return sorted(mov, key=lambda m: (m["fecha"], m["caso"]))


def incidentes(ix):
    out = []
    for x in sorted(ix.t01.get("incidentes") or [], key=lambda x: x["fecha"]):
        out.append({"fecha": x["fecha"], "caso": ix.caso(x["iniciativa"]) if x.get("iniciativa") else None, "tipo": f"Severidad {x['severidad']}",
                    "descripcion": x.get("descripcion"), "resolucion_horas": None, "rto_horas": None, "origen": None, "vector": None,
                    "horas_detectar": x.get("horas_detectar"), "horas_contener": x.get("horas_contener"), "brecha_datos_personales": None, "afectados": None,
                    "notificacion_aepd_horas": None, "notificacion_dora": None, "notificaciones": x.get("notificaciones"), "estado": x.get("estado"),
                    "id_t01": x["id"], "sistema": x.get("sistema")})
    return out


# ---------------------------------------------------------------- conversion completa
def convertir(t01, sigla=None, organizacion=None, prefijo="t01_", enlaces_pie="", demo=None):
    """JSON completo de T01 -> JSON del panel (motor/ESQUEMA.md). Requiere cargar_motor()."""
    assert isinstance(t01, dict) and "iniciativas" in t01 and "meta" in t01, "el fichero no es un JSON completo exportado por T01"
    if t01.get("version_esquema") not in ESQUEMAS_T01:
        print(f"aviso: versión de esquema de T01 {t01.get('version_esquema')!r} no probada (se esperaba {', '.join(ESQUEMAS_T01)})", file=sys.stderr)
    ix = Indice(t01)
    m = t01["meta"]
    org = organizacion or m.get("organizacion") or "la organización"
    sigla = sigla or (m.get("panel") or {}).get("consejo_sigla") or "consejo asesor"
    config = cargar_config_panel()
    ciclo_vida = config["ciclo_vida"]
    corte = m.get("fecha_referencia") or m.get("generado") or datetime.date.today().isoformat()
    anio = int(corte[:4])
    ficticio = bool(m.get("datos_ilustrativos")) if demo is None else demo
    moneda = m.get("moneda") or "EUR"
    casos = [caso(ix, i, org, moneda, ciclo_vida) for i in t01["iniciativas"]]
    aviso = PUB.AVISO_LEGAL if ficticio else PUB.AVISO_LEGAL_DATOS_PROPIOS
    textos = {
        "aviso_previo": ("<b>Datos ficticios</b> del registro de iniciativas T01 de SEVEN-G. " if ficticio else "Datos del registro de iniciativas T01 de SEVEN-G. "),
        "aviso_valor": (f"Los importes salen del registro T01 con su estado: validado, declarado o estimado (en el panel, «estimado» figura como estimación del {sigla}, "
                        f"pero en T01 lo estima el equipo de la iniciativa). Actual = realizado; potencial = esperado. Lo que T01 no registra queda «sin dato», nunca a cero."),
        "pie": (f"Panel generado desde el registro de iniciativas T01 de SEVEN-G (corte {_fecha_txt(corte)}) con el conector T17 (t01_a_panel.py)"
                + (f" · {org} y sus personas son ficticios" if ficticio else "") + (f" · {enlaces_pie}" if enlaces_pie else "") + "<br>" + PUB.pie_autoria()),
        "movimientos_vacio": "El registro T01 no tiene altas, paradas, retiradas ni revisiones de continuidad.",
        "agilidad_sin_fechas": "Faltan fechas de registro, G3 o G5 en el registro T01: no se puede medir la agilidad.",
        "backlog_sin_dato": "T01 no registra el backlog pendiente de análisis.",
        "adopcion_sin_telemetria": "T01 no registra licencias ni uso de las suites de productividad: sin dato.",
        "sin_que_es": "Sin descripción en T01: completar qué es y para qué se usa",
        # rótulos de los conceptos, neutros respecto al sector (el motor trae por defecto los de su origen)
        "ef_operativo": "Otros costes operativos evitados (o eficiencias sin desglosar en T01)",
        "ef_siniestros": "Fraude, recobros y sobrecostes evitados",
        "ret_venta_nueva": "Venta nueva",
        "ret_venta_cruzada": "Venta cruzada",
        "ret_retencion": "Retención de clientes",
        "ret_precio_margen": "Precio y margen",
        "ret_cobros": "Cobros recuperados",
        "ret_otros": "Otro retorno (o retorno sin desglosar en T01)",
    }
    textos = PUB.textos_con_aviso(textos, aviso=aviso, aviso_corto=PUB.AVISO_LEGAL_CORTO if ficticio else
                                  "Aviso legal: «tal cual» y con fines informativos; no es asesoramiento jurídico, regulatorio ni financiero ni garantiza el cumplimiento de ninguna norma.")
    return {
        "meta": {"esquema": "ESQUEMA.md", "version_datos": 6, "generado": corte, "ejercicio_valor": anio,
                 "periodo": {"etiqueta": f"Registro de iniciativas T01 · corte {_fecha_txt(corte)}", "trimestre": f"{(int(corte[5:7]) - 1) // 3 + 1}T {anio}", "anterior": None},
                 "fuentes": {"t01": f"Registro de iniciativas T01 de SEVEN-G (esquema {t01.get('version_esquema')})"},
                 "organizacion": org, "consejo_sigla": sigla, "compania_principal": org, "prefijo_ficheros": prefijo,
                 "mostrar_refs": False, "leer_json_servidor": False, "textos": textos, "glosario_extra": GLOSARIO_SEVEN_G, "demo": ficticio, "industria": None,
                 **config,   # umbrales_kpi y ciclo_vida (config_panel.json), como en el patrón del panel: la configuración general viaja en meta
                 "origen": {"herramienta": "SEVEN-G T01", "version_esquema": t01.get("version_esquema"), "conector": RUTA_CONECTOR,
                            "version_conector": VERSION_CONECTOR, "moneda": moneda}},
        "seguimiento": {"movimientos": movimientos(ix), "incidentes": incidentes(ix), "adopcion": None, "agilidad": None, "ia_ofensiva": None, "cdm_compania": None},
        "casos": casos,
        "historico": [],
    }


# ---------------------------------------------------------------- indice de transformacion (T14, documento 12)
PERFILES_T14 = ("curso", "escala", "tactica", "exploracion", "declarada")


def bloque_indice(t14):
    """JSON exportado por la calculadora T14 -> bloque opcional «indice» del panel (motor/ESQUEMA.md). Toma el calculo mas
    reciente con resultado y, si lo hay, el anterior para la tendencia. El conector no recalcula el indice: lo lee de T14."""
    assert isinstance(t14, dict) and isinstance(t14.get("calculos"), list), "el fichero del índice no es un JSON exportado por T14"
    calcs = sorted((c for c in t14["calculos"] if isinstance(c.get("resultado"), dict)), key=lambda c: (c.get("fecha_corte") or "", c.get("id") or ""))
    if not calcs:
        print("aviso: el JSON de T14 no trae cálculos con resultado (expórtelo desde la calculadora o con build_indice.ps1 -Exportar)", file=sys.stderr)
        return None
    def uno(c):
        r = c["resultado"]
        assert r.get("perfil_asignado") in PERFILES_T14, f"T14: perfil desconocido {r.get('perfil_asignado')!r}"
        return {"id": c.get("id"), "fecha_corte": c.get("fecha_corte"), "tipo": c.get("tipo"), "version_umbrales": c.get("version_umbrales"),
                "perfil_asignado": r["perfil_asignado"], "perfil_evidenciado": r.get("perfil_evidenciado"), "perfil_subyacente": r.get("perfil_subyacente"),
                "provisional": bool(r.get("provisional")), "cobertura": r.get("cobertura"), "suma": r.get("suma"), "condiciones_base": r.get("condiciones_base"),
                "declaracion": r.get("declaracion"), "senales": r.get("senales") or [], "alertas": r.get("alertas") or [],
                "perfil_objetivo": r.get("perfil_objetivo"), "mover": r.get("mover") or []}
    b = uno(calcs[-1])
    b["anterior"] = uno(calcs[-2]) if len(calcs) > 1 else None
    if b["anterior"]:
        b["anterior"].pop("anterior", None)
    return b


# ---------------------------------------------------------------- madurez de la compania (T15, documento 11; esquema 0.6 de T01, D100)
def bloque_madurez(t01):
    """t01.madurez[] (resumen de cada diagnostico, escrito por T15) -> bloque opcional «madurez» del panel (motor/ESQUEMA.md). Toma el
    diagnostico mas reciente y, si lo hay, el anterior para la tendencia. El conector no recalcula nada: lo lee tal cual de T01."""
    lista = t01.get("madurez") or []
    if not isinstance(lista, list) or not lista:
        return None
    validos = sorted((m for m in lista if isinstance(m, dict) and m.get("id") and m.get("fecha_corte") and isinstance(m.get("dimensiones"), list)),
                     key=lambda m: (m.get("fecha_corte") or "", m.get("id") or ""))
    if not validos:
        print("aviso: madurez[] de T01 no trae ningún diagnóstico con identificador, fecha de corte y dimensiones", file=sys.stderr)
        return None
    def uno(m):
        return {"id": m.get("id"), "fecha_corte": m.get("fecha_corte"), "ciclo": m.get("ciclo"), "modalidad": m.get("modalidad"),
                "version_cuestionario": m.get("version_cuestionario"), "verificador": m.get("verificador"), "organo_aprobacion": m.get("organo_aprobacion"),
                "nivel_global": m.get("nivel_global"), "nivel_minimo": m.get("nivel_minimo"), "media": m.get("media"), "tope": m.get("tope"),
                "tope_aplicado": bool(m.get("tope_aplicado")), "limitante": m.get("limitante") or [], "validez": m.get("validez"),
                "declaracion_posible": m.get("declaracion_posible"),
                "dimensiones": [{"dimension": d.get("dimension"), "nombre": d.get("nombre"), "nivel": d.get("nivel"), "avance": d.get("avance"),
                                 "bloqueantes": d.get("bloqueantes") or []} for d in m.get("dimensiones") or [] if isinstance(d, dict)]}
    b = uno(validos[-1])
    if len(validos) > 1:
        a = uno(validos[-2])
        b["anterior"] = {"id": a["id"], "fecha_corte": a["fecha_corte"], "modalidad": a["modalidad"], "nivel_global": a["nivel_global"],
                         "dimensiones": [{"dimension": d["dimension"], "nivel": d["nivel"]} for d in a["dimensiones"]]}
    else:
        b["anterior"] = None
    return b


# ---------------------------------------------------------------- registro de recomendaciones (T18)
def datos_registro(t01, panel_data, slug):
    """Recomendaciones de T01 -> datos de la plantilla del registro. Sin recomendaciones devuelve None."""
    recs_t01 = t01.get("recomendaciones") or []
    if not recs_t01:
        return None
    ix = Indice(t01)
    meta = panel_data["meta"]
    fechas = sorted({r.get("fecha") or "" for r in recs_t01})
    sesiones = [{"id": f"S{k + 1:02d}", "nombre": f"Recomendaciones del {_fecha_txt(f)}" if f else "Recomendaciones sin fecha", "fecha": _fecha_txt(f) if f else "sin fecha",
                 "tema": "registradas en T01"} for k, f in enumerate(fechas)]
    ses_de = {f: s["id"] for f, s in zip(fechas, sesiones)}
    recs = []
    for r in sorted(recs_t01, key=lambda r: r["id"]):
        inis = [ix.ini[i] for i in r.get("iniciativas") or [] if i in ix.ini]
        esferas = sorted({ESFERAS.get(i["clasificacion"].get("esfera_principal")) for i in inis} - {None})
        recs.append({"id": r["id"], "sesion": ses_de[r.get("fecha") or ""], "ambito": " · ".join(esferas) or "General",
                     "texto": r["texto"] + (f" (iniciativas: {', '.join(r['iniciativas'])})" if r.get("iniciativas") else ""),
                     "destinatario": r.get("destinatario") or "sin dato", "estado": ESTADO_REC.get(r["estado"], "pendiente"),
                     "fecha": "sin dato (T01 no registra fecha comprometida)", "evidencia": r.get("evidencia") or "sin dato",
                     "valoracion": "sin dato (T01 no registra la valoración del consejo asesor)", "panel": "inventario" if inis else None})
    n = {e: sum(1 for r in recs if r["estado"] == e) for e in ("cumplida", "en_curso", "pendiente", "descartada")}
    slots = PUB.DL.SLOTS
    return {"slug": slug, "industria": "Registro de iniciativas T01 de SEVEN-G", "grupo": meta["organizacion"], "consejo": meta["consejo_sigla"],
            "hoy": meta["generado"], "hoy_txt": _fecha_txt(meta["generado"]), "sesiones": sesiones, "recs": recs, "kpi": {"recs": n},
            "pal": {"states": slots[:4], "s1": slots[2], "s2": slots[0], "s3": slots[1], "s4": slots[3]}}


# ---------------------------------------------------------------- generacion
def generar_desde_t01(t01, salida, sigla=None, organizacion=None, prefijo="t01_", demo=None, enlace_portada=None, panel=None, enlace_registro=None, t14=None):
    """Convierte, genera panel completo y movil, JSON y, si hay recomendaciones, el registro. Devuelve un resumen.
    enlace_portada y enlace_registro: URL relativas (desde la carpeta de salida) de la pagina del conector y del registro de
    iniciativas T01, para enlazarlas desde los pies. t14: JSON exportado por la calculadora del indice (opcional); anade el
    bloque «indice» al panel (tarjeta «Índice de transformación» en «Cartera y valor")."""
    cargar_motor(panel)
    reg_nombre = f"{prefijo}Registro_Recomendaciones.html" if t01.get("recomendaciones") else None
    enlaces = " · ".join(x for x in ((f'<a href="{enlace_registro}">registro de iniciativas T01</a>' if enlace_registro else ""),
                                     (f'<a href="{reg_nombre}">registro de recomendaciones</a>' if reg_nombre else ""),
                                     (f'<a href="{enlace_portada}">página del conector T17</a>' if enlace_portada else "")) if x)
    data = convertir(t01, sigla, organizacion, prefijo, enlaces, demo)
    indice = bloque_indice(t14) if t14 else None
    if indice:
        data["indice"] = indice   # clave opcional (D53): sin ella el motor no muestra la tarjeta del índice
    madurez = bloque_madurez(t01)
    if madurez:
        data["madurez"] = madurez   # clave opcional (D53, D100): la escribe T15 en el registro (esquema 0.6); sin ella no hay tarjeta de madurez
    os.makedirs(salida, exist_ok=True)
    completo, movil, huella = BD.generar(data, salida, verbose=False)
    ficticio = data["meta"]["demo"]
    PUB.aviso_en_movil(movil, PUB.AVISO_LEGAL if ficticio else PUB.AVISO_LEGAL_DATOS_PROPIOS)
    # vista estática para visores sin JavaScript (un panel enviado por WhatsApp o correo suele abrirse en uno): D96
    for ruta_panel, titulo_panel in ((completo, "Casos de uso de IA · Panel del Consejo"), (movil, "IA · Panel móvil del Consejo")):
        PUB.vista_sin_javascript(ruta_panel, data, PUB.AVISO_LEGAL if ficticio else PUB.AVISO_LEGAL_DATOS_PROPIOS, titulo_panel)
    # conector en el navegador (D103): el panel se regenera solo desde el registro T01 del navegador o de la copia de la compañia, sin Python
    js_conector = open(CONECTOR_JS, encoding="utf-8").read()
    for ruta_panel, es_movil in ((completo, False), (movil, True)):
        PUB.conector_en_navegador(ruta_panel, js_conector, cargar_config_panel(), es_movil)
    ruta_json = os.path.join(salida, f"{prefijo}dashboard_data.json")
    json.dump(data, open(ruta_json, "w", encoding="utf-8"), ensure_ascii=False, indent=1)
    ruta_reg, nrecs = None, 0
    p = datos_registro(t01, data, prefijo.rstrip("_") or "t01")
    if p:
        # códigos citados (D99): la misma ruta al índice del sitio que el panel (navegacion.codigos); sin ella, el registro no cambia
        p["codigos"] = (data["meta"].get("navegacion") or {}).get("codigos") or None
        aviso = PUB.AVISO_LEGAL if ficticio else PUB.AVISO_LEGAL_DATOS_PROPIOS
        pie = (f"Registro de recomendaciones generado desde el registro de iniciativas T01 de SEVEN-G · {p['grupo']}"
               + (" y sus personas son ficticios" if ficticio else "") + f' · <a href="{os.path.basename(completo)}">ver el panel de IA del Consejo</a>'
               + (f' · <a href="{enlace_portada}">página del conector T17</a>' if enlace_portada else "") + f" · generado el {datetime.date.today().strftime('%d-%m-%Y')}")
        page = PUB.pagina_registro(p, os.path.basename(completo), ANCLAS, footer=pie, footer_sufijo="<br>" + PUB.pie_autoria() + "<br>" + aviso)
        if not ficticio:
            page = page.replace('<div class="demo">Demo · datos ficticios</div>', "", 1).replace(" (demo)</title>", "</title>", 1)
        ruta_reg = os.path.join(salida, reg_nombre)
        open(ruta_reg, "w", encoding="utf-8").write(page)
        nrecs = len(p["recs"])
    t = ECO.totales([ECO.resumen(c) for c in data["casos"]])
    return {"completo": completo, "movil": movil, "huella": huella, "json": ruta_json, "registro": ruta_reg, "nrecs": nrecs, "n": len(data["casos"]),
            "neto": t["neto"], "neto_pot": t["neto_pot"], "organizacion": data["meta"]["organizacion"]}


def main(argv=None):
    ap = argparse.ArgumentParser(description="T17 · Convierte el JSON completo exportado por T01 (SEVEN-G) en el panel de IA del Consejo y el registro de recomendaciones.")
    ap.add_argument("--t01", default=T01_POR_DEFECTO, help="JSON completo exportado por el registro T01 (por defecto, los datos ficticios de ../T01_registro_iniciativas/datos_demo.json)")
    ap.add_argument("--salida", default=SALIDA_POR_DEFECTO, help="carpeta donde se escriben los paneles, el JSON y el registro (por defecto ./ejemplo/salida)")
    ap.add_argument("--panel", default=None, help="opcional: usar otro motor, indicando un checkout del repositorio AI en el Consejo (por defecto, ./motor)")
    ap.add_argument("--sigla", default=None, help="siglas del consejo asesor (por defecto, «consejo asesor»)")
    ap.add_argument("--organizacion", default=None, help="nombre de la organización (por defecto, meta.organizacion de T01)")
    ap.add_argument("--prefijo", default="t01_", help="prefijo de los ficheros generados (por defecto t01_)")
    ap.add_argument("--indice", default=None, help="opcional: JSON exportado por la calculadora del índice de transformación (T14) para añadir su tarjeta al panel "
                    "(por defecto, en el ejemplo, ./ejemplo/t14_indice.json si existe)")
    ap.add_argument("--solo-json", default=None, help="opcional: escribe solo el JSON del panel (dashboard_data.json) en ese fichero, sin generar los HTML")
    a = ap.parse_args(argv)
    if a.solo_json:
        cargar_motor(a.panel)
        t01 = json.load(open(a.t01, encoding="utf-8"))
        json.dump(convertir(t01, a.sigla, a.organizacion, a.prefijo, "", None), open(a.solo_json, "w", encoding="utf-8"), ensure_ascii=False, indent=1)
        print(f"datos: {a.solo_json}")
        return
    panel = cargar_motor(a.panel)
    if not os.path.exists(a.t01):
        sys.exit(f"error: no se encuentra el JSON de T01: {os.path.abspath(a.t01)}")
    t01 = json.load(open(a.t01, encoding="utf-8"))
    # la demo de ejemplo enlaza a la pagina del conector (index.html, dos niveles por encima de ejemplo/salida)
    es_demo = os.path.abspath(a.salida) == os.path.abspath(SALIDA_POR_DEFECTO)
    ruta_indice = a.indice or (INDICE_POR_DEFECTO if es_demo and os.path.exists(INDICE_POR_DEFECTO) else None)
    if ruta_indice and not os.path.exists(ruta_indice):
        sys.exit(f"error: no se encuentra el JSON del índice (T14): {os.path.abspath(ruta_indice)}")
    t14 = json.load(open(ruta_indice, encoding="utf-8")) if ruta_indice else None
    r = generar_desde_t01(t01, a.salida, a.sigla, a.organizacion, a.prefijo, enlace_portada="../../index.html" if es_demo else None, panel=a.panel,
                          enlace_registro="../../../T01_registro_iniciativas/registro.html" if es_demo else None, t14=t14)
    print(f"motor del panel: {panel}\npanel completo:  {r['completo']}\npanel móvil:     {r['movil']}\ndatos:           {r['json']}\n"
          f"registro:        {r['registro'] or 'no se genera (T01 no trae recomendaciones)'}\n"
          f"{r['n']} casos · neto anual {_euros(r['neto'])} · neto potencial {_euros(r['neto_pot'])} · {r['nrecs']} recomendaciones · huella {r['huella']}")


if __name__ == "__main__":
    main()
