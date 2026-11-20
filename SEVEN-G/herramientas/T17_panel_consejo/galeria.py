# -*- coding: utf-8 -*-
"""T17 · Galería de ejemplos por sector (D136).

1. Genera el panel del consejo (completo y móvil), su JSON y el registro de recomendaciones de cada registro T01 de ejemplo por sector
   (../T01_registro_iniciativas/ejemplos/<sector>/datos_demo.json) en galeria/<sector>/, con el mismo conector y el mismo motor que el
   ejemplo canónico. Los paneles de la galería muestran siempre sus datos incrustados (navegacion.solo_datos_incrustados): un visitante
   con su propio registro T01 en el navegador no ve su cartera en lugar del ejemplo. No se lee la copia de datos de la compañía.
2. Escribe galeria/index.html (ES/EN): una tarjeta por ejemplo y, para cada sector, hacia dónde se mueve el mercado (tendencias,
   cifras y casos de uso consolidados, en adopción y emergentes) con sus fuentes, que deben estar en el registro de referencias
   (SEVEN-G/build/referencias/*.json, D41/D114). Los textos de mercado viven en galeria/_fuentes/mercado/<sector>.json.

3. Si existe galeria/_fuentes/seguridad_ia.json, añade el bloque transversal «Seguridad de la IA: compañías y soluciones» (D159): por
   capacidad de seguridad de la IA del documento 35, compañías y soluciones con lo que dice su página oficial. Cada entrada cita una
   página oficial dada de alta y verificada en el registro de referencias (ids MER-SIA-NN). Es una lectura de mercado, no una
   recomendación; los documentos de la metodología no nombran compañías.

4. Si existe galeria/_fuentes/cliente_agentico.json, añade el bloque transversal «El cliente agéntico: compañías y soluciones» (D185), con
   la misma estructura y las mismas reglas (ids MER-CAG-NN y protocolos en borrador citados como tales). La función común es bloque_transversal.

5. Cada caso de uso es una tarjeta desplegable con su tecnología, su esfera de SPHERES, su nivel de ambición, las técnicas habituales y sus
   fuentes; «Hacia dónde se mueve» y «Cifras» son también tarjetas, antes de los casos; al abrir una se cierran las demás del sector (D201).

Nada se escribe a mano en los HTML: se regeneran con
  uv run python galeria.py
"""
import copy
import datetime
import glob
import html
import json
import os
import re
import sys
import tempfile

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
import t01_a_panel as T  # noqa: E402

EJEMPLOS = os.path.join(AQUI, "..", "T01_registro_iniciativas", "ejemplos")
GALERIA = os.path.join(AQUI, "galeria")
FUENTES = os.path.join(GALERIA, "_fuentes")
MERCADO = os.path.join(FUENTES, "mercado")
SEGURIDAD = os.path.join(FUENTES, "seguridad_ia.json")
CLIENTE_AGENTICO = os.path.join(FUENTES, "cliente_agentico.json")
REFERENCIAS = os.path.join(AQUI, "..", "..", "build", "referencias")

# orden y nombre de los sectores (los que no tienen registro de ejemplo muestran solo el mercado)
SECTORES = [
    ("banca", "Banca", "Banking"), ("seguros", "Seguros", "Insurance"), ("industria", "Industria", "Manufacturing"),
    ("sector_publico", "Sector público", "Public sector"), ("energia", "Energía", "Energy"), ("logistica", "Logística y transporte", "Logistics and transport"),
    ("retail", "Distribución y gran consumo", "Retail and consumer goods"), ("telecomunicaciones", "Telecomunicaciones", "Telecommunications"),
    ("sanidad", "Sanidad", "Healthcare"), ("farmaceutica", "Farmacéutica", "Pharmaceuticals"), ("turismo", "Turismo y hostelería", "Travel and hospitality"),
    # Pymes y despachos profesionales (D161): se muestran aparte, bajo su propio rótulo; para añadir un sector, su ficha en _fuentes/mercado/ y una línea aquí (y en PYMES)
    # Bloque común (D198): casos que valen para casi cualquier negocio; va el primero del grupo de pymes y los sectores de proximidad no los repiten
    ("comun", "Casos que sirven a casi cualquier negocio", "Use cases that fit almost any business"),
    ("consultoria", "Consultoría de gestión y estrategia", "Management and strategy consulting"),
    ("integradores_ti", "Integradores y servicios de TI", "IT integrators and services"),
    ("proyectos_ingenieria", "Proyectos de ingeniería, instalaciones y obra", "Engineering, installation and construction projects"),
    ("gestorias", "Gestorías administrativas y laborales", "Administrative and labour gestorías"),
    ("abogados", "Despachos de abogados", "Law firms"),
    ("asesorias_fiscales", "Asesorías fiscales y contables", "Tax and accounting advisory firms"),
    # Negocios de proximidad y otros sectores de pymes (D198): solo los casos propios del sector; lo común está en «comun»
    ("gestoras_activos", "Gestoras de activos y asesores financieros", "Asset managers and financial advisers"),
    ("corredurias_seguros", "Corredurías de seguros", "Insurance brokers"),
    ("inmobiliaria", "Inmobiliarias y administración de fincas", "Estate agencies and property management"),
    ("hosteleria", "Restaurantes, bares y cafeterías", "Restaurants, bars and cafés"),
    ("comercio_proximidad", "Comercio de proximidad y tienda en línea", "Local shops and online stores"),
    ("clinicas", "Clínicas y salud de proximidad", "Local clinics and health services"),
    ("educacion", "Educación y formación", "Education and training"),
    ("marketing", "Marketing, publicidad y comunicación", "Marketing, advertising and communication"),
    ("oficios_reformas", "Oficios, reformas y servicios a domicilio", "Trades, renovations and home services"),
    ("talleres", "Talleres e industria pequeña", "Workshops and small manufacturers"),
    ("transporte_pequeno", "Transporte pequeño y autónomos del transporte", "Small haulage and self-employed carriers"),
    ("agroalimentario", "Agroalimentario", "Agri-food"),
    ("tercer_sector", "Asociaciones y tercer sector", "Associations and non-profits"),
]
# sectores que se agrupan bajo «Pymes y despachos profesionales» (opcional: un sector que no esté aquí sigue en el grupo general)
PYMES = {"comun", "consultoria", "integradores_ti", "proyectos_ingenieria", "gestorias", "abogados", "asesorias_fiscales",
         "gestoras_activos", "corredurias_seguros", "inmobiliaria", "hosteleria", "comercio_proximidad", "clinicas", "educacion", "marketing",
         "oficios_reformas", "talleres", "transporte_pequeno", "agroalimentario", "tercer_sector"}
TEC = {"genai": ("IA generativa", "Generative AI"), "agentica": ("IA agéntica", "Agentic AI"), "ml": ("ML predictivo", "Predictive ML"),
       "rpa_idp": ("RPA e IDP", "RPA and IDP"), "vision": ("Visión artificial", "Computer vision"), "optimizacion": ("Optimización", "Optimisation"),
       "herramienta_sectorial": ("Herramienta del sector", "Sector tool"), "analitica": ("Analítica avanzada", "Advanced analytics")}
PALANCA = {"eficiencia": ("Eficiencia", "Efficiency"), "ingresos": ("Ingresos", "Revenue"), "riesgo": ("Riesgo y cumplimiento", "Risk and compliance"),
           "cliente": ("Cliente", "Customer"), "transformacion": ("Transformación", "Transformation"), "posicionamiento": ("Posicionamiento", "Positioning"),
           "sostenibilidad": ("Sostenibilidad", "Sustainability")}
HORIZONTE = [("consolidado", "Consolidados", "Established"), ("en_adopcion", "En adopción", "Being adopted"),
             ("emergente_2027_2028", "Emergentes 2027-2028", "Emerging 2027-2028")]

# ---- Etiquetas de cada caso (D201): esfera de SPHERES, nivel de ambición y técnicas habituales de su tecnología.
# La esfera y el nivel son ORIENTATIVOS: se deducen de la función y de la palanca del caso. Una ficha puede fijarlos con los campos
# opcionales «esfera» ("01"…"09") y «ambicion» (optimizar · aumentar · transformar · habilitacion), y precisar las técnicas con
# «tecnicas_es» y «tecnicas_en». Sin esos campos, la ficha sigue valiendo tal como está (D53).
ESFERAS = {"01": ("Cliente", "Customer"), "02": ("Producto y servicio", "Product and service"), "03": ("Personas", "People"),
           "04": ("Operaciones", "Operations"), "05": ("Datos", "Data"), "06": ("Conocimiento", "Knowledge"), "07": ("Decisión", "Decision"),
           "08": ("Regulación, ética y responsabilidad", "Regulation, ethics and accountability"), "09": ("Gobierno de la IA", "AI governance")}
# reglas en orden: la primera expresión que aparece en la función (en español, en minúsculas) decide la esfera
REGLAS_ESFERA = [
    ("08", r"cumplim|regulat|normativ|legal|jur[ií]dic|farmacovigil|blanqueo|protecci[oó]n de datos|privacidad|auditor"),
    ("03", r"personas|recursos humanos|rr\.? ?hh|talento|formaci[oó]n interna|selecci[oó]n|plantilla|empleados|prevenci[oó]n de riesgos laborales"),
    ("01", r"comercial|venta|marketing|cliente|atenci[oó]n|posventa|reserva|sala|paciente|ciudadan|captaci[oó]n|tienda|comercio|canal|"
           r"experiencia|fideliz|hu[eé]sped|alumno|socios|donantes|usuarios|medios|publicidad|comunicaci[oó]n"),
    ("02", r"i\+d|producto|dise[ñn]o|oferta|descubrimiento|innovaci[oó]n|desarrollo|ensayos|investigaci[oó]n cl[ií]nica|contenido|creativ|"
           r"programas|docencia|proyecto"),
    ("05", r"\bdatos\b|\bdato\b|calidad del dato|anal[ií]tica de datos"),
    ("06", r"conocimiento|documento|investigaci[oó]n|redacci[oó]n|an[aá]lisis|asesoramiento|consultor[ií]a|estudio|informes|biblioteca|"
           r"t[eé]cnica|expedientes"),
    ("07", r"riesgo|planificaci[oó]n|finanzas|financier|suscripci[oó]n|precios|tarific|actuarial|direcci[oó]n|previsi[oó]n|tesorer[ií]a|"
           r"inversi[oó]n|cartera|presupuesto|control de gesti[oó]n|estrategia|cr[eé]dito|evaluaci[oó]n|diagn[oó]stico|triaje"),
]
ESFERA_POR_PALANCA = {"cliente": "01", "ingresos": "01", "posicionamiento": "01", "transformacion": "02", "riesgo": "07",
                      "eficiencia": "04", "sostenibilidad": "04"}
AMBICION = {
    "optimizar": ("Optimizar", "Optimise", "hace lo mismo con menos coste, tiempo o errores", "does the same with less cost, time or error"),
    "aumentar": ("Aumentar", "Augment", "las personas hacen más o mejor de lo que podían sin la IA", "people do more or better than they could without AI"),
    "transformar": ("Transformar", "Transform", "cambia el producto, el canal o el modelo operativo", "changes the product, the channel or the operating model"),
    "habilitacion": ("Habilitación", "Enablement", "no da valor directo: hace posible que los demás casos sean seguros y cumplan",
                     "it gives no direct value: it makes it possible for the other cases to be safe and compliant"),
}
AMBICION_POR_PALANCA = {"eficiencia": "optimizar", "riesgo": "optimizar", "sostenibilidad": "optimizar", "cliente": "aumentar",
                        "ingresos": "aumentar", "posicionamiento": "aumentar", "transformacion": "transformar"}
TECNICAS = {
    "ml": ("Modelos que aprenden de datos históricos con resultado conocido. Lo más usado con datos en tablas: árboles potenciados por gradiente (XGBoost, LightGBM), "
           "bosques aleatorios y regresión logística como línea base explicable. Para anomalías: bosques de aislamiento o autocodificadores. Para series en el tiempo: "
           "modelos estadísticos o redes recurrentes. Pida siempre la comparación con una línea base sencilla.",
           "Models that learn from historical data with a known outcome. Most used with tabular data: gradient-boosted trees (XGBoost, LightGBM), random forests and "
           "logistic regression as an explainable baseline. For anomalies: isolation forests or autoencoders. For time series: statistical models or recurrent networks. "
           "Always ask for the comparison with a simple baseline."),
    "genai": ("Modelos de lenguaje grandes. Patrones habituales: respuesta apoyada en documentos propios (RAG), resumen, extracción de datos a un formato fijo y "
              "clasificación con pocos ejemplos. Se evalúa con un conjunto de pruebas propio y con revisión humana de una muestra.",
              "Large language models. Usual patterns: answers grounded in the company's own documents (RAG), summarisation, data extraction to a fixed format and "
              "few-shot classification. It is evaluated with the company's own test set and human review of a sample."),
    "agentica": ("Un modelo de lenguaje que planifica pasos y llama a herramientas (API, bases de datos, robots de software) con permisos acotados. Puede haber varios agentes "
                 "coordinados y memoria entre pasos. Las acciones con efecto en dinero, clientes o sistemas piden aprobación humana o límites fijados antes.",
                 "A language model that plans steps and calls tools (APIs, databases, software robots) with bounded permissions. There may be several coordinated agents "
                 "and memory between steps. Actions that affect money, customers or systems need human approval or limits set beforehand."),
    "rpa_idp": ("Robots de software que siguen reglas, más lectura de documentos: reconocimiento óptico de caracteres y modelos que clasifican el documento y extraen sus campos. "
                "Se añade validación por reglas y una cola de excepciones para lo que el modelo no lee con seguridad.",
                "Rule-following software robots plus document reading: optical character recognition and models that classify the document and extract its fields. "
                "Rule-based validation and an exception queue are added for what the model does not read with confidence."),
    "vision": ("Redes convolucionales y transformadores de visión para clasificar imágenes, detectar objetos o segmentar zonas. Hoy se parte de un modelo ya entrenado y se adapta "
               "con pocas imágenes propias. La inferencia puede ir en el propio equipo de planta o de campo.",
               "Convolutional networks and vision transformers to classify images, detect objects or segment areas. Today the starting point is a pre-trained model adapted "
               "with a few of the company's own images. Inference can run on the plant or field device itself."),
    "optimizacion": ("Programación lineal y entera mixta, programación por restricciones y metaheurísticas (búsqueda local, algoritmos genéticos). En problemas que se deciden paso "
                     "a paso, aprendizaje por refuerzo. Suele combinarse con una previsión de ML y con simulación para probar el plan.",
                     "Linear and mixed-integer programming, constraint programming and metaheuristics (local search, genetic algorithms). For step-by-step decisions, "
                     "reinforcement learning. It is usually combined with an ML forecast and with simulation to test the plan."),
    "analitica": ("Estadística y series temporales (ARIMA, suavizado exponencial), segmentación (k-medias), análisis causal y pruebas con grupo de control. "
                  "Es la base que conviene tener antes de pasar a modelos más complejos.",
                  "Statistics and time series (ARIMA, exponential smoothing), segmentation (k-means), causal analysis and control-group tests. "
                  "It is the base worth having before moving on to more complex models."),
    "herramienta_sectorial": ("Producto del sector que ya trae la IA dentro. La compañía no elige el algoritmo: pregunte al proveedor qué modelo usa, con qué datos se entrenó, "
                              "qué registra y cómo se mide su acierto, y aplique la evaluación de proveedor (documento 36).",
                              "A sector product with AI already inside. The company does not choose the algorithm: ask the supplier which model it uses, what data it was trained on, "
                              "what it logs and how its accuracy is measured, and apply the supplier assessment (document 36)."),
}


def esfera_de(c):
    """Esfera de SPHERES del caso: la que fije la ficha o, si no, la que se deduce de su función y, en último término, de su palanca."""
    if c.get("esfera") in ESFERAS:
        return c["esfera"]
    f = (c.get("funcion_es") or c.get("funcion") or "").lower()
    for cod, patron in REGLAS_ESFERA:
        if re.search(patron, f):
            return cod
    return ESFERA_POR_PALANCA.get(c.get("palanca"), "04")


def ambicion_de(c, esfera):
    if c.get("ambicion") in AMBICION:
        return c["ambicion"]
    if esfera in ("08", "09"):
        return "habilitacion"
    return AMBICION_POR_PALANCA.get(c.get("palanca"), "optimizar")


def e(x):
    return html.escape(str(x if x is not None else ""), quote=True)


def euros(v):
    return f"{v / 1e6:,.1f} M€".replace(",", "X").replace(".", ",").replace("X", ".")


def euros_en(v):
    return f"€{v / 1e6:,.1f}M"


def referencias():
    refs = {}
    for f in sorted(glob.glob(os.path.join(REFERENCIAS, "*.json"))):
        for r in json.load(open(f, encoding="utf-8")):
            refs[r["id"]] = r
    return refs


def config_galeria(sector):
    """Configuración del panel del ejemplo canónico, más la del sector si existe, sin la ruta de la copia de la compañía y con los
    datos incrustados fijos."""
    cfg = T.cargar_config_panel()
    propia = os.path.join(EJEMPLOS, sector, "config_panel.json")
    if os.path.exists(propia):
        extra = T._sin_comentarios(json.load(open(propia, encoding="utf-8")))
        for k, v in extra.items():
            cfg[k] = {**cfg[k], **v} if isinstance(v, dict) and isinstance(cfg.get(k), dict) else v
    nav = dict(cfg.get("navegacion") or {})
    nav.pop("datos_t01", None)
    nav["solo_datos_incrustados"] = True
    cfg["navegacion"] = nav
    return cfg


def generar_panel(sector, base=GALERIA):
    t01 = json.load(open(os.path.join(EJEMPLOS, sector, "datos_demo.json"), encoding="utf-8"))
    salida = os.path.join(base, sector)
    cfg = config_galeria(sector)
    ruta_ix = os.path.join(GALERIA, sector, "t14_indice.json")
    t14 = json.load(open(ruta_ix, encoding="utf-8")) if os.path.exists(ruta_ix) else None
    original = T.CONFIG_PANEL
    with tempfile.TemporaryDirectory() as tmp:
        ruta_cfg = os.path.join(tmp, "config_panel.json")
        json.dump(cfg, open(ruta_cfg, "w", encoding="utf-8"), ensure_ascii=False)
        T.CONFIG_PANEL = ruta_cfg   # el conector lee su configuración de aquí (sin cambiar su interfaz)
        try:
            r = T.generar_desde_t01(t01, salida, prefijo=f"{sector}_", enlace_portada="../../index.html", t14=t14)
        finally:
            T.CONFIG_PANEL = original
    # los paneles de la galería no deben tomar el registro del visitante: se comprueba que el arranque lleva la opción
    for ruta in (r["completo"], r["movil"]):
        assert '"solo_datos_incrustados": true' in open(ruta, encoding="utf-8").read(), f"{ruta}: falta navegacion.solo_datos_incrustados"
    r["t01"] = t01
    return r


# ---------------------------------------------------------------- página
def tarjeta(sector, r, lang):
    es = lang == "es"
    b = f"{sector}/"
    t01 = r["t01"]
    ruta_m = os.path.join(MERCADO, f"{sector}.json")
    perfil = (json.load(open(ruta_m, encoding="utf-8")).get("perfil_ejemplo") or {}).get(lang, "") if os.path.exists(ruta_m) else ""
    n_prod = sum(1 for i in t01["iniciativas"] if i["ciclo"]["estado"] == "en_produccion")
    cifra = (f"{r['n']} casos de uso · {n_prod} en producción · neto anual {euros(r['neto'])} · potencial {euros(r['neto_pot'])}" if es else
             f"{r['n']} use cases · {n_prod} in production · annual net {euros_en(r['neto'])} · potential {euros_en(r['neto_pot'])}")
    reg = f' · <a href="{b}{os.path.basename(r["registro"])}">{"recomendaciones" if es else "recommendations"}</a>' if r.get("registro") else ""
    return (f'<li><strong>{e(r["organizacion"])}</strong><span class="perfil">{e(perfil)}</span><span class="cifra">{cifra}</span>'
            f'<span class="acc"><a href="{b}{os.path.basename(r["completo"])}">{"panel completo" if es else "full dashboard"}</a> · '
            f'<a href="{b}{os.path.basename(r["movil"])}">{"móvil" if es else "mobile"}</a>{reg} · '
            f'<a href="../../T01_registro_iniciativas/ejemplos/{sector}/datos_demo.json" download>{"JSON de T01" if es else "T01 JSON"}</a></span></li>')


def enlace_fuente(fid, refs, lang):
    r = refs[fid]
    titulo = r["titulo_" + lang] or r["titulo_es"]
    return f'<a href="{e(r["url_" + lang] or r["url_es"])}" title="{e(r["emisor"])} · {e(r["fecha"])}">{e(titulo)}</a>'


def citas(ids, refs, numero):
    return "".join(f'<sup><a href="#{numero[i]}" class="cita">{numero[i].split("-")[-1]}</a></sup>' for i in ids)


def mercado(sector, nombre, refs, lang, con_ejemplo):
    ruta = os.path.join(MERCADO, f"{sector}.json")
    if not os.path.exists(ruta):
        return ""
    m = json.load(open(ruta, encoding="utf-8"))
    es = lang == "es"
    fuentes = [f for f in m["fuentes"]]
    for f in fuentes:
        assert f in refs, f"{sector}: la fuente {f} no está en el registro de referencias (SEVEN-G/build/referencias)"
        assert refs[f]["estado"] == "verificado", f"{sector}: la fuente {f} no está verificada"
    numero = {f: f"{lang}-{sector}-f{k}" for k, f in enumerate(fuentes, 1)}
    tend = "".join(f'<li>{e(t[lang])}{citas(t["fuentes"], refs, numero)}</li>' for t in m["tendencias"])
    cif = "".join(f'<li><strong>{e(c["valor"])}</strong> · {e(c[lang])}{citas([c["fuente"]], refs, numero)}</li>' for c in m.get("cifras", []))
    # D201: cada caso es una tarjeta desplegable; al abrir una se cierran las demás del sector (mismo «name»), y lo mismo «Hacia dónde
    # se mueve» y «Cifras», que van antes de los casos
    k = 0 if es else 1
    grupo = f"{lang}-{sector}-tarjetas"
    sph = f"../../../../SPHERES/html/{lang}/"
    rot = (("Función", "Palanca de valor", "Tecnología y técnicas habituales", "Esfera de SPHERES", "Nivel de ambición", "Dato de las fuentes", "Fuentes de este caso", "orientativa", "orientativo")
           if es else
           ("Function", "Value lever", "Technology and usual techniques", "SPHERES sphere", "Ambition level", "Figure from the sources", "Sources for this case", "indicative", "indicative"))
    bloques = []
    for clave, h_es, h_en in HORIZONTE:
        casos = [c for c in m["casos"] if c["horizonte"] == clave]
        if not casos:
            continue
        tarjetas = []
        for c in casos:
            esf = esfera_de(c)
            amb = ambicion_de(c, esf)
            tec = c["tecnologia"]
            tecnicas = c.get("tecnicas_" + lang) or TECNICAS[tec][k]
            doc_esf = "03_SPHERES_Esferas_habilitadoras.html" if esf in ("08", "09") else "02_SPHERES_Esferas_donde_se_genera_valor.html"
            funcion = c["funcion_" + lang] if c.get("funcion_" + lang) else c.get("funcion", "")
            valor = c.get("valor_indicativo") if es else (c.get("valor_indicativo_en") or "")
            fu = "".join(f'<li>{enlace_fuente(f, refs, lang)} · {e(refs[f]["emisor"])} ({e(refs[f]["fecha"])})</li>' for f in c["fuentes"])
            tarjetas.append(
                f'<details class="caso" name="{grupo}" id="{lang}-{e(c["id"])}"><summary><strong>{e(c["nombre_" + lang])}</strong>'
                f'<span class="chips"><span class="chip">{e(TEC[tec][k])}</span><span class="chip esf">{esf} · {e(ESFERAS[esf][k])}</span>'
                f'<span class="chip amb {amb}">{e(AMBICION[amb][k])}</span></span></summary>'
                f'<div class="cuerpo"><p>{e(c["descripcion_" + lang])}{citas(c["fuentes"], refs, numero)}</p><dl>'
                f'<dt>{rot[0]}</dt><dd>{e(funcion)}</dd>'
                f'<dt>{rot[1]}</dt><dd>{e(PALANCA[c["palanca"]][k])}</dd>'
                f'<dt>{rot[2]}</dt><dd><strong>{e(TEC[tec][k])}.</strong> {e(tecnicas)}</dd>'
                f'<dt>{rot[3]}</dt><dd><a href="{sph}{doc_esf}">{esf} · {e(ESFERAS[esf][k])}</a> ({rot[7]})</dd>'
                f'<dt>{rot[4]}</dt><dd><a href="{sph}01_SPHERES_Niveles_de_ambicion.html">{e(AMBICION[amb][k])}</a>: {e(AMBICION[amb][2 + k])} ({rot[8]})</dd>'
                + (f'<dt>{rot[5]}</dt><dd>{e(valor)}</dd>' if valor else "")
                + (f'<dt>{rot[6]}</dt><dd><ul>{fu}</ul></dd>' if fu else "")
                + '</dl></div></details>')
        bloques.append(f'<h4 class="horizonte">{h_es if es else h_en} · {len(casos)}</h4><div class="casos">{"".join(tarjetas)}</div>')
    lista_f = "".join(f'<li id="{numero[f]}">{enlace_fuente(f, refs, lang)} · {e(refs[f]["emisor"])} ({e(refs[f]["fecha"])})</li>' for f in fuentes)
    ej = (f'<p class="nota">{"Ejemplo de registro y panel de este sector: en la galería, arriba." if es else "Register and dashboard example for this sector: in the gallery above."}</p>'
          if con_ejemplo else "")
    n_t, n_c = len(m["tendencias"]), len(m.get("cifras", []))
    previos = (f'<details class="bloque" name="{grupo}"><summary><strong>{"Hacia dónde se mueve" if es else "Where it is heading"}</strong>'
               f'<span class="chips"><span class="chip">{n_t} {"tendencias" if es else "trends"}</span></span></summary><div class="cuerpo"><ul>{tend}</ul></div></details>')
    if cif:
        previos += (f'<details class="bloque" name="{grupo}"><summary><strong>{"Cifras" if es else "Figures"}</strong>'
                    f'<span class="chips"><span class="chip">{n_c} {"cifras con fuente" if es else "sourced figures"}</span></span></summary><div class="cuerpo"><ul>{cif}</ul></div></details>')
    return (f'<details class="sector" id="{lang}-{sector}"><summary>{e(nombre)} <span>{len(m["casos"])} {"casos de uso" if es else "use cases"} · {len(fuentes)} {"fuentes" if es else "sources"}</span></summary>'
            f'{ej}<div class="casos previos">{previos}</div>'
            f'<h3>{"Casos de uso: consolidados, en adopción y emergentes" if es else "Use cases: established, being adopted and emerging"}</h3>'
            f'{"".join(bloques)}'
            f'<h3>{"Fuentes" if es else "Sources"}</h3><ol class="fuentes">{lista_f}</ol></details>')


def bloque_transversal(ruta, nombre, pref, ancla, titulo, intro, etiqueta_controles, refs, lang):
    """Bloque transversal de compañías y soluciones (D159, D185): «Seguridad de la IA» y «El cliente agéntico». Sin el JSON, la página queda como estaba."""
    if not os.path.exists(ruta):
        return ""
    d = json.load(open(ruta, encoding="utf-8"))
    es = lang == "es"
    total = sum(len(c["entradas"]) for c in d["categorias"])
    titulo = titulo[lang].format(total=total)
    intro = intro[lang]
    th = ((("Compañía", "Empresa que ofrece la solución"), ("Solución", "Nombre del producto o servicio"),
           ("Qué hace (según su página oficial)", "Resumen propio de lo que dice su página oficial, comprobada en la fecha indicada")) if es else
          (("Company", "Company offering the solution"), ("Solution", "Name of the product or service"),
           ("What it does (according to its official page)", "Own summary of what its official page says, checked on the date given")))
    cab = "".join(f'<th title="{e(t)}">{e(n)}</th>' for n, t in th)
    bloques = []
    for c in d["categorias"]:
        numero = {}
        filas = []
        for x in c["entradas"]:
            assert x["fuente"] in refs and refs[x["fuente"]]["estado"] == "verificado", f"{nombre}: {x['fuente']} no está verificada en el registro"
            ids = [x["fuente"]]
            adq = x.get("adquisicion_" + lang) or ""
            if adq:
                fa = x["fuente_adquisicion"]
                assert fa in refs and refs[fa]["estado"] == "verificado", f"{nombre}: {fa} no está verificada en el registro"
                ids.append(fa)
            for i in ids:
                numero.setdefault(i, f"{lang}-{pref}-{c['id']}-f{len(numero) + 1}")
            c1 = f'<sup><a href="#{numero[ids[0]]}" class="cita">{numero[ids[0]].split("-f")[-1]}</a></sup>'
            extra = f' {e(adq)}<sup><a href="#{numero[ids[1]]}" class="cita">{numero[ids[1]].split("-f")[-1]}</a></sup>' if adq else ""
            filas.append(f'<tr><td>{e(x["compania"])}</td><td><strong>{e(x["solucion"])}</strong>{c1}</td><td>{e(x["que_hace_" + lang])}{extra}</td></tr>')
        lista_f = "".join(f'<li id="{n}">{enlace_fuente(i, refs, lang)} · {e(refs[i]["emisor"])} ({e(refs[i]["fecha"])})</li>' for i, n in numero.items())
        nom = c["nombre_" + lang]
        bloques.append(
            f'<details class="sector" id="{lang}-{pref}-{c["id"]}"><summary>{e(nom)} <span>{len(c["entradas"])} {"soluciones" if es else "solutions"}</span></summary>'
            f'<p>{e(c["que_es_" + lang])}</p><p class="nota">{etiqueta_controles[0] if es else etiqueta_controles[1]}: {e(c["controles"])}</p>'
            f'<div class="tabla"><table><thead><tr>{cab}</tr></thead><tbody>{"".join(filas)}</tbody></table></div>'
            f'<h3>{"Fuentes" if es else "Sources"}</h3><ol class="fuentes">{lista_f}</ol></details>')
    return f'<h2 id="{lang}-{ancla}">{e(titulo)}</h2><p>{e(intro)}</p>' + "".join(bloques)

def seguridad_ia(refs, lang):
    """Bloque transversal «Seguridad de la IA» (D159). Sin el JSON, la página queda como estaba."""
    titulo = {"es": "Seguridad de la IA: compañías y soluciones ({total} soluciones)", "en": "AI security: companies and solutions ({total} solutions)"}
    intro = {"es": ("Lectura de mercado, no recomendación: compañías y soluciones que se presentan como respuesta a cada capacidad de seguridad de la IA del documento 35, "
                    "con lo que dice de sí misma su página oficial, comprobada el 19-10-2026. SEVEN-G no evalúa, avala ni compara productos; la lista no es exhaustiva y se ordena "
                    "alfabéticamente. Antes de usar cualquiera con datos de la compañía —también para probarla— se aplica la evaluación de proveedor (documento 36 y P55)."),
             "en": ("A market reading, not a recommendation: companies and solutions that present themselves as an answer to each AI security capability in document 35, "
                    "with what their own official page says about them, checked on 19-10-2026. SEVEN-G does not assess, endorse or compare products; the list is not exhaustive and is "
                    "sorted alphabetically. Before using any of them with company data —even to test it— the supplier assessment applies (document 36 and P55).")}
    return bloque_transversal(SEGURIDAD, "seguridad_ia", "sia", "seguridad-ia", titulo, intro, ("Controles de SEVEN-G", "SEVEN-G security controls"), refs, lang)


def cliente_agentico(refs, lang):
    """Bloque transversal «El cliente agéntico: compañías y soluciones» (D185). Sin el JSON, la página queda como estaba."""
    titulo = {"es": "El cliente agéntico: compañías y soluciones ({total} soluciones)", "en": "The agentic customer: companies and solutions ({total} solutions)"}
    intro = {"es": ("Lectura de mercado, no recomendación: compañías, protocolos y soluciones que se presentan como respuesta a alguna de las cuatro caras del cliente agéntico "
                    "(documento 35, sección 9.4), con lo que dice de sí misma su página oficial, comprobada el 15-11-2026. Los protocolos en borrador se citan como orientación y no fundamentan "
                    "ningún control. SEVEN-G no evalúa, avala ni compara productos; la lista no es exhaustiva y se ordena alfabéticamente. Antes de usar cualquiera con datos de la compañía "
                    "—también para probarla— se aplica la evaluación de proveedor (documento 36 y P55)."),
             "en": ("A market reading, not a recommendation: companies, protocols and solutions that present themselves as an answer to one of the four faces of the agentic customer "
                    "(document 35, section 9.4), with what their own official page says about them, checked on 15-11-2026. Draft protocols are cited as guidance and do not underpin "
                    "any control. SEVEN-G does not assess, endorse or compare products; the list is not exhaustive and is sorted alphabetically. Before using any of them with company data "
                    "—even to test it— the supplier assessment applies (document 36 and P55).")}
    return bloque_transversal(CLIENTE_AGENTICO, "cliente_agentico", "cag", "cliente-agentico", titulo, intro, ("Controles y secciones de SEVEN-G", "SEVEN-G controls and sections"), refs, lang)


def pagina(resultados, refs):
    plantilla = open(os.path.join(FUENTES, "plantilla.html"), encoding="utf-8").read()
    fecha = datetime.date.today().isoformat()
    for lang in ("es", "en"):
        idx = 1 if lang == "es" else 2
        tarjetas = "".join(tarjeta(s, resultados[s], lang) for s, *_ in SECTORES if s in resultados)
        general = "".join(mercado(s, n[idx - 1], refs, lang, s in resultados) for s, *n in SECTORES if s not in PYMES)
        pymes = "".join(mercado(s, n[idx - 1], refs, lang, s in resultados) for s, *n in SECTORES if s in PYMES)
        if pymes:
            intro = ("Casos pensados para empresas sin equipo de sistemas: herramientas baratas o ya incluidas en lo que se usa, con el riesgo profesional (secreto profesional, protección de datos, supervisión humana y Reglamento europeo de IA) a la vista."
                     if lang == "es" else
                     "Cases designed for companies without an IT team: inexpensive tools or ones already included in what is used, with professional risk (professional secrecy, data protection, human oversight and the EU AI Act) in view.")
            if os.path.exists(os.path.join(MERCADO, "comun.json")):   # D198: con el bloque común, el grupo se explica en dos pasos
                intro += (" Empiece por «Casos que sirven a casi cualquier negocio»; después abra su sector, que solo añade lo propio."
                          if lang == "es" else
                          " Start with “Use cases that fit almost any business”; then open your sector, which only adds what is specific to it.")
            titulo = "Pymes, despachos y negocios de proximidad" if lang == "es" else "SMEs, professional firms and local businesses"
            pymes = f'<h3 id="{lang}-pymes">{titulo}</h3><p>{e(intro)}</p>' + pymes
        bloques = general + pymes
        plantilla = plantilla.replace(f"__TARJETAS_{lang.upper()}__", tarjetas).replace(f"__MERCADO_{lang.upper()}__", bloques)
        plantilla = plantilla.replace(f"__SEGURIDAD_IA_{lang.upper()}__", seguridad_ia(refs, lang))
        plantilla = plantilla.replace(f"__CLIENTE_AGENTICO_{lang.upper()}__", cliente_agentico(refs, lang))
    n_casos = sum(len(json.load(open(f, encoding="utf-8"))["casos"]) for f in glob.glob(os.path.join(MERCADO, "*.json")))
    n_fuentes = len({f for p in glob.glob(os.path.join(MERCADO, "*.json")) for f in json.load(open(p, encoding="utf-8"))["fuentes"]})
    n_sect = len([f for f in glob.glob(os.path.join(MERCADO, "*.json")) if os.path.basename(f) != "comun.json"])   # el bloque común no es un sector (D198)
    plantilla = (plantilla.replace("__N_EJEMPLOS__", str(len(resultados))).replace("__N_SECTORES__", str(n_sect)).replace("__N_CASOS__", str(n_casos))
                 .replace("__N_FUENTES__", str(n_fuentes)).replace("__FECHA__", fecha))
    assert "__" not in plantilla.replace("__proto__", ""), "quedan marcas sin sustituir en la plantilla de la galería"
    open(os.path.join(GALERIA, "index.html"), "w", encoding="utf-8", newline="\n").write(plantilla)


def main(argv=None):
    # --salida DIR: genera solo los paneles en otra carpeta, sin la página (lo usa verificar_coherencia.ps1, sección 34, para comparar)
    argv = sys.argv[1:] if argv is None else argv
    base = argv[argv.index("--salida") + 1] if "--salida" in argv else None
    refs = referencias()
    sectores = [s for s, *_ in SECTORES if os.path.exists(os.path.join(EJEMPLOS, s, "datos_demo.json"))]
    resultados = {}
    if base:
        for s in sectores:
            generar_panel(s, base)
        print(f"paneles de la galería en {base}")
        return
    for s in sectores:
        r = generar_panel(s)
        resultados[s] = r
        print(f"{s:<16} {r['n']:>2} casos · neto {T._euros(r['neto'])} · potencial {T._euros(r['neto_pot'])} · {os.path.relpath(r['completo'], AQUI)}")
    pagina(resultados, refs)
    print(f"galería: {os.path.relpath(os.path.join(GALERIA, 'index.html'), AQUI)} ({len(resultados)} ejemplos)")


if __name__ == "__main__":
    main()
