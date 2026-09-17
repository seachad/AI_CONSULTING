# Copia mantenida en AI_CONSULTING (SEVEN-G, T17) desde 17-09-2026; origen: AI_en_el_consejo/motor (MIT, mismo autor).
# -*- coding: utf-8 -*-
"""Guarda una foto del estado actual de dashboard_data.json en su historico, para comparar sesiones y ver tendencias.

Cada foto guarda, por caso, el estado, la fecha de puesta en produccion y las cifras economicas derivadas
(economia.resumen), mas los totales. Ademas se archiva una copia completa del JSON en historico/.
Si ya existe una foto con la misma fecha, se sustituye.
Desde el 17-09-2026 las fotos incluyen el valor imputado (valor_imputado, valor_imputado_pot, valor_por_estado.imputado y
totales.casos_imputados) con el multiplicador de meta.valor_imputado_multiplicador; las fotos anteriores no lo llevan y no se
regeneran: su neto no es comparable en los casos sin valor reportado (el panel lo avisa).

Uso (desde la carpeta "Dashboard propuesto"):
  uv run python snapshot.py --etiqueta "Sesión S03"                 # foto con fecha de hoy
  uv run python snapshot.py --fecha 2026-09-15 --etiqueta "Sesión S03"
Despues: uv run python build_dashboard.py
"""
import argparse, datetime, json, os, sys
BASE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, BASE)
import economia as ECO


def foto(data, fecha, etiqueta):
    casos, mult = {}, ECO.multiplicador(data)
    for c in data["casos"]:
        f = ((c.get("reporte_compania") or {}).get("fechas") or {})
        r = ECO.resumen(c, mult)
        casos[c["id"]] = {"nombre": c["nombre"], "estado": c["estado"], "compania": c.get("compania"), "unidad": c.get("unidad"),
                          "fecha_produccion": f.get("produccion"), "inicio_estimado": c.get("inicio_estimado"),
                          **{k: r[k] for k in ECO.CAMPOS_TOTALES}, "imputado": r["imputado"], "imputado_pot": r["imputado_pot"],
                          "valor_por_estado": r["valor_por_estado"]}
    resumenes = list(casos.values())
    por_estado = {}
    for x in resumenes:
        por_estado[x["estado"]] = por_estado.get(x["estado"], 0) + 1
    return {"fecha": fecha, "etiqueta": etiqueta, "generado": datetime.datetime.now().isoformat(timespec="seconds"),
            "version_datos": data.get("meta", {}).get("version_datos"), "casos_por_estado": por_estado,
            "totales": ECO.totales(resumenes), "casos": casos}


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--fecha", default=datetime.date.today().isoformat())
    ap.add_argument("--etiqueta", default="")
    ap.add_argument("--datos", default=os.path.join(BASE, "dashboard_data.json"))
    a = ap.parse_args()
    data = json.load(open(a.datos, encoding="utf-8"))
    nueva = foto(data, a.fecha, a.etiqueta)
    hist = [h for h in data.get("historico", []) if h.get("fecha") != a.fecha] + [nueva]
    data["historico"] = sorted(hist, key=lambda h: h["fecha"])
    json.dump(data, open(a.datos, "w", encoding="utf-8"), ensure_ascii=False, indent=1)
    os.makedirs(os.path.join(BASE, "historico"), exist_ok=True)
    copia = os.path.join(BASE, "historico", f"dashboard_data_{a.fecha}.json")
    # copia escrita byte a byte: en volumenes cifrados shutil.copyfile puede confundir origen y destino
    with open(a.datos, "rb") as src, open(copia, "wb") as dst:
        dst.write(src.read())
    t = nueva["totales"]
    print(f"foto {a.fecha} ({a.etiqueta or 'sin etiqueta'}): {len(nueva['casos'])} casos; neto actual {t['neto']:,.0f} €; "
          f"neto potencial {t['neto_pot']:,.0f} €; {t['casos_imputados']} casos con valor imputado ({t['valor_imputado']:,.0f} €); "
          f"{len(data['historico'])} fotos en el histórico; copia en {copia}")


if __name__ == "__main__":
    main()
