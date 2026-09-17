# -*- coding: utf-8 -*-
"""Piezas comunes de lo que publica el conector T17: autoria y licencias, aviso legal, pagina del registro de
recomendaciones (T18) y aviso visible en el panel movil.

© 2026 Fernando García · SEACHAD · Metodología SEVEN-G. Código bajo licencia MIT; contenidos bajo CC BY 4.0.

Aviso legal: SEVEN-G y esta herramienta se ofrecen «tal cual» y con fines exclusivamente informativos. No constituyen
asesoramiento jurídico, regulatorio ni financiero ni garantizan el cumplimiento de ninguna norma. Cada organización es la
única responsable de verificar la normativa que le aplica. El autor y SEACHAD no asumen responsabilidad por su uso.

No toca el motor del panel (./motor): el aviso del panel completo va en meta.textos (aviso_previo y pie); el panel movil no
muestra esos textos, asi que el aviso se anade al HTML ya generado, justo antes de su pie. La plantilla del registro
(demo_lib.py) esta en ./motor; si t01_a_panel.py ha cargado otro motor con --panel, demo_lib se toma de ese sys.path.
"""
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
AUTOR = "Fernando García"
ENTIDAD = "SEACHAD"
METODOLOGIA = "SEVEN-G"
REPO_ORIGEN_MOTOR = "https://github.com/Seachad-TEAM/AI_en_el_consejo"   # origen del motor del panel (codigo MIT); desde el 17-09-2026 se mantiene en ./motor

AVISO_LEGAL = ("<b>Aviso legal.</b> Demostración con datos ficticios del registro de iniciativas T01 de SEVEN-G, ofrecida «tal cual» y con fines "
               "informativos. No constituye asesoramiento jurídico, regulatorio ni financiero ni garantiza el cumplimiento de ninguna norma. "
               "Las clasificaciones y referencias a regulación general o sectorial pueden quedar desactualizadas: cada organización es la única "
               "responsable de verificar la normativa que le aplica y certificar su propio cumplimiento regulatorio. El autor y SEACHAD no asumen "
               "responsabilidad por su uso.")
AVISO_LEGAL_CORTO = ("Aviso legal: datos ficticios, «tal cual» y con fines informativos; no es asesoramiento jurídico, regulatorio ni financiero ni "
                     "garantiza el cumplimiento de ninguna norma. Cada organización verifica la normativa que le aplica.")
# variante para paneles generados con datos propios (sin «datos ficticios»)
AVISO_LEGAL_DATOS_PROPIOS = ("<b>Aviso legal.</b> Panel generado desde el registro de iniciativas T01 de SEVEN-G con el motor de AI en el Consejo, "
                             "ofrecido «tal cual» y con fines informativos. No constituye asesoramiento jurídico, regulatorio ni financiero ni "
                             "garantiza el cumplimiento de ninguna norma. Las clasificaciones y referencias a regulación general o sectorial pueden "
                             "quedar desactualizadas: cada organización es la única responsable de verificar la normativa que le aplica y certificar "
                             "su propio cumplimiento regulatorio. El autor y SEACHAD no asumen responsabilidad por su uso.")


def pie_autoria():
    """Linea de autoria y licencias. La autoria de SEVEN-G, del conector y del motor incluido es de SEACHAD (AI_CONSULTING);
    el enlace al repositorio AI en el Consejo se limita al origen del codigo MIT del motor."""
    return (f"© 2026 {AUTOR} · {ENTIDAD} · metodología {METODOLOGIA} · contenidos "
            f"<a href=\"https://creativecommons.org/licenses/by/4.0/deed.es\">CC BY 4.0</a> · código MIT "
            f"(motor del panel derivado de <a href=\"{REPO_ORIGEN_MOTOR}\">AI en el Consejo</a>, <a href=\"{REPO_ORIGEN_MOTOR}/blob/main/LICENSE\">MIT</a>)")


def textos_con_aviso(textos, aviso=AVISO_LEGAL, aviso_corto=AVISO_LEGAL_CORTO):
    """Antepone el aviso legal a meta.textos.aviso_previo y, si hay pie, le anade la version corta. Devuelve un dict nuevo."""
    tx = dict(textos or {})
    tx["aviso_previo"] = aviso + " " + (tx.get("aviso_previo") or "")
    if tx.get("pie"):
        tx["pie"] = tx["pie"] + "<br>" + aviso_corto
    return tx


MARCA_MOVIL = '<div class="foot" id="aviso-legal">'


def aviso_en_movil(ruta, aviso=AVISO_LEGAL):
    """Hace visible el aviso legal en el panel movil ya generado (el motor no muestra meta.textos en el movil).
    Lo inserta antes del pie; si ya esta, no hace nada. No cambia los datos ni la huella."""
    page = open(ruta, encoding="utf-8").read()
    if MARCA_MOVIL in page:
        return False
    ancla = '<div class="foot" id="pie"></div>'
    assert ancla in page, f"no se encuentra el pie del panel movil en {ruta}"
    page = page.replace(ancla, MARCA_MOVIL + aviso + "</div>\n " + ancla, 1)
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
