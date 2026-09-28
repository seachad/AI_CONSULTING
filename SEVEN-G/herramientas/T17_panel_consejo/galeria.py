# -*- coding: utf-8 -*-
"""T17 · Galería de ejemplos por sector (D137).

1. Genera el panel del consejo (completo y móvil), su JSON y el registro de recomendaciones de cada registro T01 de ejemplo por sector
   (../T01_registro_iniciativas/ejemplos/<sector>/datos_demo.json) en galeria/<sector>/, con el mismo conector y el mismo motor que el
   ejemplo canónico. Los paneles de la galería muestran siempre sus datos incrustados (navegacion.solo_datos_incrustados): un visitante
   con su propio registro T01 en el navegador no ve su cartera en lugar del ejemplo. No se lee la copia de datos de la compañía.
2. Escribe galeria/index.html (ES/EN): una tarjeta por ejemplo y, para cada sector, hacia dónde se mueve el mercado (tendencias,
   cifras y casos de uso consolidados, en adopción y emergentes) con sus fuentes, que deben estar en el registro de referencias
   (SEVEN-G/build/referencias/*.json, D41/D114). Los textos de mercado viven en galeria/_fuentes/mercado/<sector>.json.

Nada se escribe a mano en los HTML: se regeneran con
  uv run python galeria.py
"""
import copy
import datetime
import glob
import html
import json
import os
import sys
import tempfile

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
import t01_a_panel as T  # noqa: E402

EJEMPLOS = os.path.join(AQUI, "..", "T01_registro_iniciativas", "ejemplos")
GALERIA = os.path.join(AQUI, "galeria")
FUENTES = os.path.join(GALERIA, "_fuentes")
MERCADO = os.path.join(FUENTES, "mercado")
REFERENCIAS = os.path.join(AQUI, "..", "..", "build", "referencias")

# orden y nombre de los sectores (los que no tienen registro de ejemplo muestran solo el mercado)
SECTORES = [
    ("banca", "Banca", "Banking"), ("seguros", "Seguros", "Insurance"), ("industria", "Industria", "Manufacturing"),
    ("sector_publico", "Sector público", "Public sector"), ("energia", "Energía", "Energy"), ("logistica", "Logística y transporte", "Logistics and transport"),
    ("retail", "Distribución y gran consumo", "Retail and consumer goods"), ("telecomunicaciones", "Telecomunicaciones", "Telecommunications"),
    ("sanidad", "Sanidad", "Healthcare"), ("farmaceutica", "Farmacéutica", "Pharmaceuticals"), ("turismo", "Turismo y hostelería", "Travel and hospitality"),
]
TEC = {"genai": ("IA generativa", "Generative AI"), "agentica": ("IA agéntica", "Agentic AI"), "ml": ("ML predictivo", "Predictive ML"),
       "rpa_idp": ("RPA e IDP", "RPA and IDP"), "vision": ("Visión artificial", "Computer vision"), "optimizacion": ("Optimización", "Optimisation"),
       "herramienta_sectorial": ("Herramienta del sector", "Sector tool"), "analitica": ("Analítica avanzada", "Advanced analytics")}
PALANCA = {"eficiencia": ("Eficiencia", "Efficiency"), "ingresos": ("Ingresos", "Revenue"), "riesgo": ("Riesgo y cumplimiento", "Risk and compliance"),
           "cliente": ("Cliente", "Customer"), "transformacion": ("Transformación", "Transformation"), "posicionamiento": ("Posicionamiento", "Positioning"),
           "sostenibilidad": ("Sostenibilidad", "Sustainability")}
HORIZONTE = [("consolidado", "Consolidados", "Established"), ("en_adopcion", "En adopción", "Being adopted"),
             ("emergente_2027_2028", "Emergentes 2027-2028", "Emerging 2027-2028")]


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
    cifra = (f"{r['n']} iniciativas · {n_prod} en producción · neto anual {euros(r['neto'])} · potencial {euros(r['neto_pot'])}" if es else
             f"{r['n']} initiatives · {n_prod} in production · annual net {euros_en(r['neto'])} · potential {euros_en(r['neto_pot'])}")
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
    filas = []
    for clave, h_es, h_en in HORIZONTE:
        casos = [c for c in m["casos"] if c["horizonte"] == clave]
        if not casos:
            continue
        filas.append(f'<tr class="grupo"><th colspan="4">{h_es if es else h_en} · {len(casos)}</th></tr>')
        for c in casos:
            filas.append(f'<tr><td><strong>{e(c["nombre_" + lang])}</strong><br><span class="desc">{e(c["descripcion_" + lang])}</span>'
                         f'{citas(c["fuentes"], refs, numero)}</td><td>{e(TEC[c["tecnologia"]][0 if es else 1])}</td>'
                         f'<td>{e(PALANCA[c["palanca"]][0 if es else 1])}</td><td>{e(c["funcion_" + lang] if c.get("funcion_" + lang) else c.get("funcion", ""))}</td></tr>')
    lista_f = "".join(f'<li id="{numero[f]}">{enlace_fuente(f, refs, lang)} · {e(refs[f]["emisor"])} ({e(refs[f]["fecha"])})</li>' for f in fuentes)
    ej = (f'<p class="nota">{"Ejemplo de registro y panel de este sector: en la galería, arriba." if es else "Register and dashboard example for this sector: in the gallery above."}</p>'
          if con_ejemplo else "")
    th = ((("Caso de uso", "Qué hace y cuál es el valor típico según las fuentes"), ("Tecnología", "IA generativa, agéntica, ML predictivo, RPA e IDP, visión, optimización, analítica o herramienta propia del sector"),
           ("Palanca", "Dónde se nota el valor: eficiencia, ingresos, riesgo, cliente, transformación del modelo operativo, posicionamiento o sostenibilidad"),
           ("Función", "Área de la organización donde se aplica")) if es else
          (("Use case", "What it does and its typical value according to the sources"), ("Technology", "Generative or agentic AI, predictive ML, RPA and IDP, vision, optimisation, analytics or a sector-specific tool"),
           ("Lever", "Where the value shows: efficiency, revenue, risk, customer, operating model transformation, positioning or sustainability"),
           ("Function", "Area of the organisation where it applies")))
    cab = "".join(f'<th title="{e(t)}">{e(n)} <span class="qa" aria-hidden="true">?</span></th>' for n, t in th)
    return (f'<details class="sector" id="{lang}-{sector}"><summary>{e(nombre)} <span>{len(m["casos"])} {"casos de uso" if es else "use cases"} · {len(fuentes)} {"fuentes" if es else "sources"}</span></summary>'
            f'{ej}<h3>{"Hacia dónde se mueve" if es else "Where it is heading"}</h3><ul>{tend}</ul>'
            + (f'<h3>{"Cifras" if es else "Figures"}</h3><ul>{cif}</ul>' if cif else "")
            + f'<h3>{"Casos de uso: consolidados, en adopción y emergentes" if es else "Use cases: established, being adopted and emerging"}</h3>'
            f'<div class="tabla"><table><thead><tr>{cab}</tr></thead><tbody>{"".join(filas)}</tbody></table></div>'
            f'<h3>{"Fuentes" if es else "Sources"}</h3><ol class="fuentes">{lista_f}</ol></details>')


def pagina(resultados, refs):
    plantilla = open(os.path.join(FUENTES, "plantilla.html"), encoding="utf-8").read()
    fecha = datetime.date.today().isoformat()
    for lang in ("es", "en"):
        idx = 1 if lang == "es" else 2
        tarjetas = "".join(tarjeta(s, resultados[s], lang) for s, *_ in SECTORES if s in resultados)
        bloques = "".join(mercado(s, n[idx - 1], refs, lang, s in resultados) for s, *n in SECTORES)
        plantilla = plantilla.replace(f"__TARJETAS_{lang.upper()}__", tarjetas).replace(f"__MERCADO_{lang.upper()}__", bloques)
    n_casos = sum(len(json.load(open(f, encoding="utf-8"))["casos"]) for f in glob.glob(os.path.join(MERCADO, "*.json")))
    n_fuentes = len({f for p in glob.glob(os.path.join(MERCADO, "*.json")) for f in json.load(open(p, encoding="utf-8"))["fuentes"]})
    n_sect = len(glob.glob(os.path.join(MERCADO, "*.json")))
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
