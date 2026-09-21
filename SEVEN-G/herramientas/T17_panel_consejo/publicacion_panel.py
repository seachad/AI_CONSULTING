# -*- coding: utf-8 -*-
"""Piezas comunes de lo que publica el conector T17: autoria y licencias, aviso legal, pagina del registro de
recomendaciones (T18) y aviso visible en el panel movil.

© 2026 Fernando García Varela · Metodología SEVEN-G. Código bajo licencia MIT; contenidos bajo CC BY 4.0.

Aviso legal: SEVEN-G y esta herramienta se ofrecen «tal cual» y con fines exclusivamente informativos. No constituyen
asesoramiento jurídico, regulatorio ni financiero ni garantizan el cumplimiento de ninguna norma. Cada organización es la
única responsable de verificar la normativa que le aplica. El autor no asume responsabilidad por su uso.

No toca el motor del panel (./motor): el aviso del panel completo va en meta.textos (aviso_previo y pie); el panel movil no
muestra esos textos, asi que el aviso se anade al HTML ya generado, justo antes de su pie. La plantilla del registro
(demo_lib.py) esta en ./motor; si t01_a_panel.py ha cargado otro motor con --panel, demo_lib se toma de ese sys.path.
"""
import html
import datetime, json, os, re, sys

try:
    import demo_lib as DL   # plantilla del registro de recomendaciones
except ImportError:
    _MOTOR = os.path.join(os.path.dirname(os.path.abspath(__file__)), "motor")
    if _MOTOR not in sys.path:
        sys.path.append(_MOTOR)
    try:
        import demo_lib as DL
    except ImportError as e:   # pragma: no cover
        raise ImportError(f"no se encuentra demo_lib.py (plantilla del registro) en {_MOTOR}") from e

# autoria y licencias (pie de cada panel y registro)
AUTOR = "Fernando García Varela"
METODOLOGIA = "SEVEN-G"
REPO_ORIGEN_MOTOR = "https://github.com/Seachad-TEAM/AI_en_el_consejo"   # origen del motor del panel (codigo MIT); desde el 17-09-2026 se mantiene en ./motor

AVISO_LEGAL = ("<b>Aviso legal.</b> Demostración con datos ficticios del registro de iniciativas T01 de SEVEN-G, ofrecida «tal cual» y con fines "
               "informativos. No constituye asesoramiento jurídico, regulatorio ni financiero ni garantiza el cumplimiento de ninguna norma. "
               "Las clasificaciones y referencias a regulación general o sectorial pueden quedar desactualizadas: cada organización es la única "
               "responsable de verificar la normativa que le aplica y certificar su propio cumplimiento regulatorio. El autor no asume "
               "responsabilidad por su uso.")
AVISO_LEGAL_CORTO = ("Aviso legal: datos ficticios, «tal cual» y con fines informativos; no es asesoramiento jurídico, regulatorio ni financiero ni "
                     "garantiza el cumplimiento de ninguna norma. Cada organización verifica la normativa que le aplica.")
# variante para paneles generados con datos propios (sin «datos ficticios»)
AVISO_LEGAL_DATOS_PROPIOS = ("<b>Aviso legal.</b> Panel generado desde el registro de iniciativas T01 de SEVEN-G con el motor de AI en el Consejo, "
                             "ofrecido «tal cual» y con fines informativos. No constituye asesoramiento jurídico, regulatorio ni financiero ni "
                             "garantiza el cumplimiento de ninguna norma. Las clasificaciones y referencias a regulación general o sectorial pueden "
                             "quedar desactualizadas: cada organización es la única responsable de verificar la normativa que le aplica y certificar "
                             "su propio cumplimiento regulatorio. El autor no asume responsabilidad por su uso.")


def pie_autoria():
    """Linea de autoria y licencias. La autoria de SEVEN-G, del conector y del motor incluido es de Fernando García Varela (AI_CONSULTING);
    el enlace al repositorio AI en el Consejo se limita al origen del codigo MIT del motor."""
    return (f"© 2026 {AUTOR} · metodología {METODOLOGIA} · contenidos "
            f"<a href=\"https://creativecommons.org/licenses/by/4.0/deed.es\">CC BY 4.0</a> · código MIT "
            f"(motor del panel derivado de <a href=\"{REPO_ORIGEN_MOTOR}\">AI en el Consejo</a>, <a href=\"{REPO_ORIGEN_MOTOR}/blob/main/LICENSE\">MIT</a>)")


def textos_con_aviso(textos, aviso=AVISO_LEGAL, aviso_corto=AVISO_LEGAL_CORTO):
    """Antepone el aviso legal a meta.textos.aviso_previo y, si hay pie, le anade la version corta. Devuelve un dict nuevo."""
    tx = dict(textos or {})
    tx["aviso_previo"] = aviso + " " + (tx.get("aviso_previo") or "")
    if tx.get("pie"):
        tx["pie"] = tx["pie"] + "<br>" + aviso_corto
    return tx


# el aviso va plegado: se ve su título y se despliega al pulsar (D93)
MARCA_MOVIL = '<details class="foot" id="aviso-legal"><summary style="cursor:pointer;font-weight:700">Aviso legal (pulsa para verlo)</summary>'


def aviso_en_movil(ruta, aviso=AVISO_LEGAL):
    """Hace visible el aviso legal en el panel movil ya generado (el motor no muestra meta.textos en el movil).
    Lo inserta antes del pie; si ya esta, no hace nada. No cambia los datos ni la huella."""
    page = open(ruta, encoding="utf-8").read()
    if MARCA_MOVIL in page:
        return False
    ancla = '<div class="foot" id="pie"></div>'
    assert ancla in page, f"no se encuentra el pie del panel movil en {ruta}"
    page = page.replace(ancla, MARCA_MOVIL + aviso + "</details>\n " + ancla, 1)
    open(ruta, "w", encoding="utf-8").write(page)
    return True


# ---- Vista estatica para visores sin JavaScript (D96) ----
# Un panel enviado como fichero (WhatsApp, correo) suele abrirse en un visor que NO ejecuta JavaScript: como el panel se dibuja
# con JavaScript, solo se veian las lineas vacias de sus <details>. Esta vista se calcula aqui, con las mismas formulas que el
# panel (economia.py), y se incrusta dentro de <noscript>: solo aparece cuando no hay JavaScript, y entonces oculta el esqueleto.
MARCA_SIN_JS = "data-vista-estatica"
CSS_SIN_JS = ("<noscript><style>body>*:not(noscript){display:none!important}"
              ".sj{font:16px/1.5 system-ui,'Segoe UI',Arial,sans-serif;color:#2f2b28;background:#fbe2cd;margin:0;padding:16px;max-width:900px;margin:0 auto}"
              ".sj h1{font:700 22px/1.2 Georgia,serif;margin:0 0 4px}.sj h2{font:700 18px/1.25 Georgia,serif;margin:26px 0 8px;border-top:2px solid #1a1817;padding-top:10px}"
              ".sj .sub{font-size:13px;color:#564d47;margin:0 0 12px}.sj .nota{background:#f3cfb2;border-left:4px solid #990f3d;padding:10px 12px;font-size:14px;margin:12px 0}"
              ".sj .kpis{display:grid;grid-template-columns:repeat(auto-fit,minmax(140px,1fr));gap:8px}.sj .kpi{background:#fff1e5;border:1px solid #c9a78d;border-radius:6px;padding:10px 12px}"
              ".sj .kpi b{display:block;font:700 24px/1.1 Georgia,serif}.sj .kpi span{font-size:13px;color:#564d47}"
              ".sj table{border-collapse:collapse;width:100%;font-size:14px}.sj td,.sj th{text-align:left;padding:6px 8px 6px 0;border-bottom:1px solid #c9a78d;vertical-align:top}"
              ".sj td.n,.sj th.n{text-align:right;white-space:nowrap}"
              ".sj details{border:1px solid #c9a78d;border-radius:6px;background:#fff1e5;margin:0 0 8px;padding:8px 12px}.sj summary{cursor:pointer;font-weight:700}"
              ".sj summary small{display:block;font-weight:400;color:#564d47}.sj dl{display:grid;grid-template-columns:auto 1fr;gap:2px 12px;margin:8px 0 0;font-size:14px}"
              ".sj dt{color:#564d47}.sj dd{margin:0;text-align:right;white-space:nowrap}.sj .pie{font-size:12px;color:#564d47;margin-top:22px}"
              "</style></noscript>")


def _eur(v):
    """Importe en formato del panel; None = sin dato (nunca cero)."""
    if v is None:
        return "sin dato"
    a = abs(v)
    if a >= 1e6:
        t = f"{v / 1e6:.1f}".replace(".", ",") + " M€"
    elif a >= 1e3:
        t = f"{v / 1e3:.0f} k€"
    else:
        t = f"{v:.0f} €"
    return t.replace("-", "−")


def _esc(s):
    return html.escape(str(s if s is not None else ""), quote=True)


def html_sin_javascript(data, aviso, titulo):
    """HTML de la vista estatica de un panel, a partir del JSON del panel (mismo calculo que economia.resumen/totales)."""
    import economia as ECO
    meta, casos = data.get("meta") or {}, data.get("casos") or []
    res = [(c, ECO.resumen(c)) for c in casos]
    tot = ECO.totales([r for _c, r in res])
    retorno_total = tot["eficiencias"] + tot["retorno"]
    validado = (tot.get("valor_por_estado") or {}).get("validado", 0)
    pct_val = f"{round(100 * validado / retorno_total)} %" if retorno_total else "sin dato"
    ciclo = meta.get("ciclo_vida") or {}
    orden = list(ciclo.get("embudo") or []) + [x for x in [ciclo.get("ganado")] if x] + list(ciclo.get("salidas") or [])
    orden = [o if isinstance(o, str) else (o.get("estado") or o.get("nombre") or "") for o in orden]
    estados = {}
    for c, _r in res:
        estados[c.get("estado") or "sin dato"] = estados.get(c.get("estado") or "sin dato", 0) + 1
    orden = list(dict.fromkeys(e for e in orden if e in estados)) + sorted(e for e in estados if e not in orden)
    periodo = meta.get("periodo") or ""
    periodo = (periodo.get("etiqueta") or "") if isinstance(periodo, dict) else periodo
    # sin dato nunca es cero: el neto de un caso sin eficiencias, retorno ni coste recurrente no se muestra como 0
    neto = lambda r, k="neto": r[k] if any(r[x] is not None for x in ("eficiencias", "retorno", "recurrente", "eficiencias_pot", "retorno_pot")) else None
    kpis = [(len(casos), "casos de uso"), (_eur(tot["recurrente"]), "coste anual"), (_eur(retorno_total), "retorno total: eficiencias + retorno"),
            (_eur(tot["neto"]), "neto anual"), (pct_val, "del valor actual, validado"), (_eur(tot["neto_pot"]), "neto anual potencial")]
    filas_estado = "".join(f"<tr><td>{_esc(e)}</td><td class=n>{estados[e]}</td></tr>" for e in orden)
    fichas = []
    for c, r in sorted(res, key=lambda x: -(x[1]["neto"] or 0)):
        fichas.append(
            f"<details><summary>{_esc(c.get('nombre'))}<small>{_esc(c.get('estado'))} · {_esc(c.get('unidad') or c.get('area') or '')} · neto anual {_eur(neto(r))}</small></summary>"
            f"<p>{_esc(c.get('que_es') or c.get('descripcion') or '')}</p><dl>"
            f"<dt>Inversión de construcción</dt><dd>{_eur(r['construccion'])}</dd><dt>Coste recurrente anual</dt><dd>{_eur(r['recurrente'])}</dd>"
            f"<dt>Eficiencias</dt><dd>{_eur(r['eficiencias'])}</dd><dt>Retorno</dt><dd>{_eur(r['retorno'])}</dd>"
            f"<dt>Capacidad liberada no materializada (no suma)</dt><dd>{_eur(r['capacidad'])}</dd>"
            f"<dt>Neto anual</dt><dd>{_eur(neto(r))}</dd><dt>Neto anual potencial</dt><dd>{_eur(neto(r, "neto_pot"))}</dd></dl></details>")
    return (f'<noscript {MARCA_SIN_JS}><div class="sj"><h1>{_esc(titulo)}</h1>'
            f'<p class="sub">{_esc(meta.get("organizacion"))} · {_esc(periodo)}</p>'
            '<p class="nota"><b>Vista estática.</b> Este visor no ejecuta JavaScript, así que se muestra un resumen con las mismas cifras. '
            'Para el panel interactivo (filtros, embudo, gráficos, fichas completas), abra este fichero con el navegador del teléfono o del ordenador '
            '(Chrome, Safari, Edge o Firefox): «Abrir con…» o «Abrir en el navegador».</p>'
            '<h2>Cartera y valor</h2><div class="kpis">' + "".join(f'<div class="kpi"><b>{_esc(v)}</b><span>{_esc(t)}</span></div>' for v, t in kpis) + "</div>"
            f'<h2>Embudo: casos por estado</h2><table><tr><th>Estado</th><th class=n>Casos</th></tr>{filas_estado}</table>'
            '<h2>Casos de uso, por neto anual</h2>' + "".join(fichas) +
            f'<details><summary>Aviso legal</summary><p>{aviso}</p></details>'
            f'<p class="pie">{pie_autoria()}</p></div></noscript>')


def vista_sin_javascript(ruta, data, aviso, titulo):
    """Incrusta (o sustituye) la vista estatica en un panel ya generado. No cambia los datos ni la huella."""
    page = open(ruta, encoding="utf-8").read()
    page = re.sub(r"<noscript " + MARCA_SIN_JS + r">.*?</noscript>\s*", "", page, flags=re.S).replace(CSS_SIN_JS, "")
    m = re.search(r"<body[^>]*>", page)
    assert m and "</head>" in page, f"no se encuentra <head> o <body> en {ruta}"
    page = page[:m.end()] + "\n" + html_sin_javascript(data, aviso, titulo) + "\n" + page[m.end():]
    page = page.replace("</head>", CSS_SIN_JS + "\n</head>", 1)
    open(ruta, "w", encoding="utf-8").write(page)
    return True

def pagina_registro(p, panel, anclas, footer_prefijo="", footer_sufijo="", footer=None):
    """HTML del registro de recomendaciones con la plantilla de demo_lib.
    p: dict con slug, industria, grupo, consejo, hoy_txt, sesiones[], recs[] (id, sesion, ambito, texto, destinatario, estado, fecha,
    evidencia, valoracion, panel), kpi.recs y pal (s1..s4). panel: nombre del HTML del panel completo. anclas: bloque del panel -> [ancla, titulo].
    footer_prefijo/footer_sufijo: HTML antes y despues del pie de la plantilla; footer: sustituye el texto del pie de la plantilla."""
    dj = json.dumps(p, ensure_ascii=False)
    css = DL.CSS_BASE.replace("__S1__", p["pal"]["s1"]).replace("__S2__", p["pal"]["s2"]).replace("__S3__", p["pal"]["s3"]).replace("__S4__", p["pal"]["s4"])
    js = DL.JS_REG
    js = re.sub(r"const PAN = \{.*?\};", "const PAN = " + json.dumps(anclas, ensure_ascii=False) + ";", js, count=1, flags=re.S)
    js = js.replace("__SLUG___Panel_IA_demo.html", panel).replace("__DATA__", dj)
    plantilla = DL.HTML_REG
    if footer is not None:
        plantilla = re.sub(r"<footer>.*?</footer>", lambda _m: "<footer>" + footer + "</footer>", plantilla, count=1, flags=re.S)
    page = (plantilla.replace("__CSS__", css + DL.CSS_REG_EXTRA).replace("__JS__", js).replace("__SLUG___Panel_IA_demo.html", panel)
            .replace("__GRUPO__", p["grupo"]).replace("__INDUSTRIA__", p["industria"]).replace("__CONSEJO__", p["consejo"]).replace("__HOY__", p["hoy_txt"])
            .replace("__GEN__", datetime.date.today().strftime("%d-%m-%Y")).replace("__SLUG__", p["slug"]))
    return page.replace("<footer>", "<footer>" + footer_prefijo, 1).replace("</footer>", footer_sufijo + "</footer>", 1)
