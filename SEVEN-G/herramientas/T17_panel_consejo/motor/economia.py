# Copia mantenida en AI_CONSULTING (SEVEN-G, T17); origen: AI_en_el_consejo/motor (MIT, mismo autor). Versión 8 del motor incorporada el 17-09-2026.
# -*- coding: utf-8 -*-
"""Modelo economico de cada caso de uso: inversion, eficiencias y retorno, todo en euros, con valor actual y potencial.

Reglas (acordadas en la sesion de trabajo del 15-09-2026):
  1. Todo en euros. Lo que no es dinero se explica en la formula (unidad fisica x valor unitario).
  2. Siempre incremental frente a grupo de control o linea base; si no, se marca como estimacion.
  3. Cada importe tiene estado: declarado (compania), validado (Control de Gestion) o estimado_cati.
  4. Base anual para eficiencias, retorno y coste recurrente; la construccion (una vez) aparte.
  5. Cada euro se atribuye a un solo caso ("comparte_valor_con" avisa de solapes).
  6. El potencial lleva sus hipotesis, la inversion adicional para alcanzarlo y un plazo.
Decisiones:
  - Retorno comercial en VNB (venta nueva y cruzada) y valor de la cartera retenida (retencion).
  - Las horas liberadas solo cuentan en el neto si se materializan: "capacidad_liberada" no suma en el neto.
  - El fraude evitado y los recobros son eficiencias (menor coste de siniestros); los recibos recuperados, retorno.
  - Las plataformas compartidas (plataforma agéntica, plataforma de datos, suites de productividad) se imputan con una clave de reparto explicita.

Este modulo lo usan build_data.py (para construir el bloque), snapshot.py (para las fotos historicas) y make_example.py.
La misma logica esta replicada en el JavaScript del panel (panel_core.py): si se cambia aqui, cambiarla alli.

Plan de realizacion (D135): curva y tramos por caso desde T01 (economia.curva), con VAN F7, realizacion F10 y valor no cuantificado
con nivel (reporte_compania.valor_no_monetario). Ver el bloque del final.
"""
import re

EFICIENCIAS = {
    "personas": "Menor coste de personas o de externalización (materializado)",
    "capacidad_liberada": "Capacidad liberada valorada (no materializada: no suma en el neto)",
    "herramientas": "Herramientas o licencias retiradas",
    "siniestros": "Menor coste de siniestros: fraude, recobros, sobrefacturación",
    "operativo": "Otros costes operativos evitados",
    "penalizaciones": "Errores y penalizaciones evitados",
}
RETORNO = {
    "venta_nueva": "Venta nueva (VNB)",
    "venta_cruzada": "Venta cruzada (VNB)",
    "retencion": "Retención (valor de la cartera retenida)",
    "precio_margen": "Precio y margen técnico",
    "cobros": "Recibos y cobros recuperados",
    "otros": "Otro retorno",
}
INVERSION_CONCEPTOS = {
    "personas": "Personas internas (FTE × coste)",
    "servicios": "Servicios externos",
    "licencias": "Licencias y suscripciones",
    "plataforma": "Consumo de plataforma compartida (tokens, DBU, minutos)",
    "infraestructura": "Infraestructura",
    "cumplimiento": "Cumplimiento y seguridad",
    "mantenimiento": "Mantenimiento y evolución",
}
ESTADOS_DATO = ("validado", "declarado", "estimado_cati")
NO_NETO = {"capacidad_liberada"}


def item(importe, formula, estado, fuente, fecha=None, atribucion=None, hipotesis=None):
    return {"importe": importe, "formula": formula, "estado": estado, "fuente": fuente,
            "fecha": fecha, "atribucion": atribucion, "hipotesis": hipotesis}


def _imp(it):
    return it.get("importe") if isinstance(it, dict) else None


def _suma(lineas, lado, filtro, respaldo_actual=False):
    """Suma los importes de un lado; con respaldo_actual, si el potencial no existe se usa el actual."""
    total, alguno = 0, False
    for l in lineas or []:
        if not filtro(l):
            continue
        v = _imp(l.get(lado))
        if v is None and respaldo_actual:
            v = _imp(l.get("actual"))
        if v is not None:
            total += v
            alguno = True
    return total if alguno else None


def resumen(caso):
    """Cifras derivadas de un caso (identicas a las que calcula el panel). None = sin dato."""
    e = caso.get("economia") or {}
    inv = e.get("inversion") or {}
    ef, rt = e.get("eficiencias") or [], e.get("retorno") or []
    cuenta = lambda l: l.get("concepto") not in NO_NETO
    capac = lambda l: l.get("concepto") in NO_NETO
    todo = lambda l: True
    r = {
        "construccion": _imp(inv.get("construccion")),
        "recurrente": _imp(inv.get("recurrente_anual")),
        "eficiencias": _suma(ef, "actual", cuenta),
        "capacidad": _suma(ef, "actual", capac),
        "retorno": _suma(rt, "actual", todo),
        "adicional": _imp(inv.get("adicional_potencial")),
        "recurrente_pot": _imp(inv.get("recurrente_potencial")),
        "eficiencias_pot": _suma(ef, "potencial", cuenta, True),
        "capacidad_pot": _suma(ef, "potencial", capac, True),
        "retorno_pot": _suma(rt, "potencial", todo, True),
    }
    if r["recurrente_pot"] is None:
        r["recurrente_pot"] = r["recurrente"]
    z = lambda k: r[k] or 0
    r["neto"] = z("eficiencias") + z("retorno") - z("recurrente")
    r["neto_pot"] = z("eficiencias_pot") + z("retorno_pot") - z("recurrente_pot")
    r["neto_adicional"] = r["neto_pot"] - r["neto"]
    r["rendimiento_adicional"] = (r["neto_adicional"] / r["adicional"]) if r["adicional"] else None
    r["payback_anios"] = (r["construccion"] / r["neto"]) if (r["construccion"] and r["neto"] > 0) else None
    # euros del valor actual (eficiencias que cuentan + retorno) por estado del dato
    por_estado = {k: 0 for k in ESTADOS_DATO}
    for l in list(ef) + list(rt):
        if not cuenta(l) and l in ef:
            continue
        it = l.get("actual") or {}
        if _imp(it) is not None:
            por_estado[it.get("estado") or "estimado_cati"] = por_estado.get(it.get("estado") or "estimado_cati", 0) + _imp(it)
    r["valor_por_estado"] = por_estado
    return r


CAMPOS_TOTALES = ("construccion", "recurrente", "eficiencias", "capacidad", "retorno", "neto",
                  "adicional", "recurrente_pot", "eficiencias_pot", "capacidad_pot", "retorno_pot", "neto_pot")


def totales(resumenes):
    t = {k: sum((r.get(k) or 0) for r in resumenes) for k in CAMPOS_TOTALES}
    t["valor_por_estado"] = {k: sum(r["valor_por_estado"].get(k, 0) for r in resumenes) for k in ESTADOS_DATO}
    return t


# ---------------------------------------------------------------- plan de realizacion: curva y tramos (D135)
# SEVEN-G: la curva sale solo del plan de realizacion registrado en T01 (43 §4.1; tramos de 14 §6.2). Con
# curva_valor.estimar_sin_curva = false (lo que usa SEVEN-G) un caso sin plan no tiene curva: se cuenta como «sin plan».
# El VAN F7 (40 §8) se calcula con H y r de C2 (horizonte_van_anios y tasa_descuento_anual_pct; r = 0 si no se fija).
# Configuracion (meta.curva_valor, desde config_panel.json); estos son los valores por defecto.
CURVA_DEF = {
    "granularidad": "anual",                 # vista por defecto: anual | semestral | trimestral (el panel permite cambiarla)
    "horizonte": {"desde": None, "hasta": None},   # anios; sin dato, dos anios antes y cuatro despues del de los datos
    "rampa_sin_plazo_trimestres": 6,         # curva estimada: trimestres hasta el potencial si el caso no fija plazo
    "produccion_sin_fecha_trimestres": {"Propuesto": 6, "Aprobado": 4, "POC": 4, "En desarrollo": 2},
    "tasa_descuento_anual_pct": None,        # r de C2 (40 §8.2); sin tasa, r = 0 para el VAN F7
    "horizonte_van_anios": None,             # H de C2 (40 §8.2); sin dato, el VAN F7 no se calcula
    "estimar_sin_curva": True,               # SEVEN-G lo pone a false en config_panel.json: sin plan registrado no hay curva
}
SITUACIONES_TRAMO = {"ejecutado": "Ejecutado", "comprometido": "Comprometido", "previsto": "Previsto (pendiente de decidir)",
                     "opcional": "Opción (fuera del plan)"}
EN_PLAN = ("ejecutado", "comprometido", "previsto")   # los tramos opcionales no suman en la curva
OPERANDO = ("En uso", "Desenganchado")
GRANULARIDADES = ("anual", "semestral", "trimestral")


def trimestre(s):
    """Indice de trimestre (anio*4 + t-1) del primer trimestre de 'AAAA', 'AAAA-MM', 'AAAA-MM-DD', 'AAAA-Tn', 'AAAA-Qn' o 'AAAA-Sn'."""
    if s is None or s == "":
        return None
    m = re.match(r"^(\d{4})(?:-(?:[TQ]([1-4])|S([12])|(\d{1,2})(?:-\d{1,2})?))?$", str(s).strip())
    if not m:
        return None
    y = int(m.group(1))
    if m.group(2):
        return y * 4 + int(m.group(2)) - 1
    if m.group(3):
        return y * 4 + (int(m.group(3)) - 1) * 2
    if m.group(4):
        return y * 4 + (min(12, max(1, int(m.group(4)))) - 1) // 3
    return y * 4


def _n_trim(s):
    """Numero de trimestres que abarca una clave de periodo: anio 4, semestre 2, trimestre o mes 1."""
    s = str(s)
    return 4 if re.match(r"^\d{4}$", s) else 2 if re.match(r"^\d{4}-S[12]$", s) else 1


def etiqueta(q, gran="trimestral"):
    y, t = divmod(q, 4)
    if gran == "anual":
        return str(y)
    if gran == "semestral":
        return f"{y}-S{t // 2 + 1}"
    return f"{y}-T{t + 1}"


def config_curva(meta):
    cfg = dict(CURVA_DEF)
    cfg.update((meta or {}).get("curva_valor") or {})
    return cfg


def _mapa(mapa, repartir=False):
    """{periodo: valor} -> {trimestre: valor}. Lo mas especifico gana (trimestre sobre semestre, semestre sobre anio).
    Con repartir, el valor del periodo se divide a partes iguales entre sus trimestres (importes); si no, se repite (porcentajes)."""
    out = {}
    items = [(k, v) for k, v in (mapa or {}).items() if v is not None and not str(k).startswith("_") and trimestre(k) is not None]
    for k, v in sorted(items, key=lambda kv: -_n_trim(kv[0])):
        q, n = trimestre(k), _n_trim(k)
        for i in range(n):
            out[q + i] = v / n if repartir else v
    return out


def _interpola(puntos, q):
    """Captura en el trimestre q: el punto si existe; entre dos puntos, lineal; antes del primero, 0; despues del ultimo, el ultimo."""
    if q in puntos:
        return puntos[q]
    antes = [k for k in puntos if k < q]
    despues = [k for k in puntos if k > q]
    if not antes:
        return 0
    a = max(antes)
    if not despues:
        return puntos[a]
    b = min(despues)
    return puntos[a] + (puntos[b] - puntos[a]) * (q - a) / (b - a)


def _coste_anual(cap, c_ref, rec, recp):
    """Coste recurrente anual segun la captura: el actual hasta el nivel de hoy y, por encima, sube en proporcion hasta el de regimen."""
    if c_ref >= 100:
        return recp
    av = min(1, max(0, (cap - c_ref) / (100 - c_ref)))
    return rec + (recp - rec) * av


def _num(v):
    return v.get("importe") if isinstance(v, dict) else v


def curva(caso, meta):
    """Serie trimestral de inversion, valor, coste, neto y acumulado de un caso, con sus tramos y metricas. Misma logica en panel_core.py.
    None si el caso no tiene curva y la configuracion no permite estimarla (SEVEN-G: regla 8 del 40, sin dato no se estima)."""
    cfg = config_curva(meta)
    r = resumen(caso)
    e = caso.get("economia") or {}
    cv = e.get("curva") or None
    if not cv and cfg.get("estimar_sin_curva") is False:
        return None
    rep = caso.get("reporte_compania") or {}
    fechas = rep.get("fechas") or {}
    estado = caso.get("estado")
    hoy = trimestre(str((meta or {}).get("generado") or "")[:10]) or 0
    hz = cfg.get("horizonte") or {}
    q0 = int(hz.get("desde") or hoy // 4 - 2) * 4
    q1 = int(hz.get("hasta") or hoy // 4 + 4) * 4 + 3
    vact = (r["eficiencias"] or 0) + (r["retorno"] or 0)
    rec, recp = r["recurrente"] or 0, r["recurrente_pot"] or 0
    hipotesis = []
    # valor anual en regimen (100 % de captura)
    act = (cv or {}).get("actividad") or {}
    if cv and _num(cv.get("valor_regimen")) is not None:
        vreg = _num(cv.get("valor_regimen"))
    elif cv and act.get("volumen_anual") is not None and act.get("valor_unitario") is not None:
        vreg = act["volumen_anual"] * act["valor_unitario"]
        es = lambda v: f"{v:,}".replace(",", "X").replace(".", ",").replace("X", ".")   # formato es-ES, como el panel
        hipotesis.append(f"Valor en régimen = {es(act['volumen_anual'])} {act.get('unidad') or 'unidades'} al año × {es(act['valor_unitario'])} € por unidad")
    else:
        vreg = (r["eficiencias_pot"] or 0) + (r["retorno_pot"] or 0)
    c_act = min(100, 100 * vact / vreg) if vreg > 0 else 0
    # puesta en produccion y retirada
    prod_est = False
    if trimestre(fechas.get("produccion")) is not None:
        prod = trimestre(fechas.get("produccion"))
    elif estado in OPERANDO and trimestre(caso.get("inicio_estimado")) is not None:
        prod, prod_est = trimestre(caso.get("inicio_estimado")), True
        hipotesis.append(f"Puesta en producción en {etiqueta(prod)}: año de inicio estimado, sin fecha reportada")
    else:
        prod, prod_est = hoy + int((cfg.get("produccion_sin_fecha_trimestres") or {}).get(estado, 4)), True
        hipotesis.append(f"Puesta en producción estimada en {etiqueta(prod)}, sin fecha reportada")
    fin = trimestre(fechas.get("retirada"))
    if fin is None and estado == "Desenganchado":
        fin = hoy
    plazo = trimestre(e.get("plazo_potencial"))
    rampa = int(cfg.get("rampa_sin_plazo_trimestres") or 6)
    # tramos de inversion y puntos de captura
    tramos = []
    if cv:
        origen = "reportada"
        for i, t in enumerate(cv.get("tramos") or []):
            q = trimestre(t.get("fecha"))
            if q is None:
                continue
            tramos.append({"id": t.get("id") or f"T{i + 1}", "q": q, "importe": _num(t.get("importe")) or _num(t.get("inversion")) or 0,
                           "estado": t.get("estado") or cv.get("estado") or "declarado", "alcance": t.get("alcance"),
                           "gate": t.get("gate"), "condicion_paso": t.get("condicion_paso"), "situacion": t.get("situacion") or "previsto",
                           "captura_objetivo_pct": t.get("captura_objetivo_pct")})
        puntos = _mapa(cv.get("captura"))
        c_ref = _interpola(puntos, hoy) if puntos else 0
    else:
        origen = "estimada"
        c_ref = c_act if estado in OPERANDO else 0
        if r["construccion"]:
            qi = trimestre(fechas.get("inicio"))
            if qi is None:
                qi = prod - 1 if estado in OPERANDO else min(hoy, prod - 1)
            sit = "ejecutado" if (estado in OPERANDO and qi <= hoy) else "comprometido" if estado == "En desarrollo" else "previsto"
            tramos.append({"id": "T1", "q": qi, "importe": r["construccion"], "estado": ((e.get("inversion") or {}).get("construccion") or {}).get("estado") or "estimado_cati",
                           "alcance": "Construcción", "condicion_paso": None, "situacion": sit,
                           "captura_objetivo_pct": c_act if estado in OPERANDO else (None if r["adicional"] else 100)})
        if r["adicional"]:
            qa_ = max(hoy + 1, prod) if estado not in OPERANDO else hoy + 1
            tramos.append({"id": "T2", "q": qa_, "importe": r["adicional"], "estado": ((e.get("inversion") or {}).get("adicional_potencial") or {}).get("estado") or "estimado_cati",
                           "alcance": ((e.get("inversion") or {}).get("adicional_potencial") or {}).get("hipotesis") or "Ampliación hasta el potencial",
                           "condicion_paso": None, "situacion": "previsto", "captura_objetivo_pct": 100})
        puntos = {}
        if estado in OPERANDO:
            puntos[prod] = c_act
            if hoy > prod:
                puntos[hoy] = c_act
            if vreg > vact and (fin is None or fin > hoy):
                ini = max(prod, hoy + (1 if r["adicional"] else 0))
                puntos[ini] = c_act
                fq = plazo if (plazo is not None and plazo > ini) else ini + rampa
                puntos[fq] = 100
                hipotesis.append(f"Captura constante al nivel actual ({round(c_act)} %) desde la producción; rampa lineal hasta el 100 % en {etiqueta(fq)}"
                                 + (" (plazo del potencial)" if fq == plazo else f" ({rampa} trimestres: sin plazo del potencial)"))
            else:
                hipotesis.append(f"Captura constante al nivel actual ({round(c_act)} %) desde la producción")
        elif vreg > 0:
            puntos[prod] = 0
            fq = plazo if (plazo is not None and plazo > prod) else prod + rampa
            puntos[fq] = 100
            hipotesis.append(f"Rampa lineal desde la producción hasta el 100 % en {etiqueta(fq)}"
                             + (" (plazo del potencial)" if fq == plazo else f" ({rampa} trimestres: sin plazo del potencial)"))
        if tramos:
            hipotesis.append("Tramos: construcción y, si la hay, inversión adicional en el trimestre siguiente al de los datos, sin condición de paso fijada")
    tramos.sort(key=lambda t: t["q"])
    decl = (cv or {}).get("declive") or {}
    qd, pd = trimestre(decl.get("desde")), decl.get("pct_anual")
    costes = _mapa((cv or {}).get("coste_recurrente"))
    ref = (cv or {}).get("referencia") or {}
    ref_puntos = _mapa(ref.get("captura"))
    ref_vreg = _num(ref.get("valor_regimen"))
    ref_vreg = vreg if ref_vreg is None else ref_vreg
    reales = _mapa({k: (v.get("importe") if isinstance(v, dict) else v) for k, v in ((cv or {}).get("real") or {}).items()}, repartir=True)
    reales_val = _mapa({k: v.get("importe") for k, v in ((cv or {}).get("real") or {}).items() if isinstance(v, dict) and v.get("estado") == "validado"}, repartir=True)
    qa = min([q0, prod] + [t["q"] for t in tramos])
    serie, acum = [], 0.0
    for q in range(qa, q1 + 1):
        inv = sum(t["importe"] for t in tramos if t["q"] == q and t["situacion"] in EN_PLAN)
        cap = _interpola(puntos, q) if puntos else 0
        if fin is not None and q >= fin:
            cap = 0
        operando = (q >= prod or (origen == "reportada" and cap > 0)) and (fin is None or q < fin)
        factor = (1 - pd / 100) ** ((q - qd) / 4) if (qd is not None and pd and q >= qd) else 1
        valor = cap / 100 * vreg / 4 * factor if operando else 0
        coste = (costes[q] if q in costes else _coste_anual(cap, c_ref, rec, recp)) / 4 if operando else 0
        neto = valor - coste - inv
        acum += neto
        serie.append({"q": q, "inv": inv, "valor": valor, "coste": coste, "neto": neto, "acum": acum, "cap": cap if operando else 0,
                      "ref": (_interpola(ref_puntos, q) / 100 * ref_vreg / 4 if (ref_puntos and operando) else None),
                      "real": reales.get(q), "real_val": reales_val.get(q)})
    # rendimiento de cada tramo: neto anual que desbloquea frente al nivel del tramo anterior
    prev_cap, prev_coste = 0, 0
    for t in tramos:
        obj = t["captura_objetivo_pct"]
        if obj is None:
            t.update(valor_anual_inc=None, neto_anual_inc=None, rendimiento=None, payback_anios=None)
            continue
        coste_obj = _coste_anual(obj, c_ref, rec, recp)
        v_inc = (obj - prev_cap) / 100 * vreg
        n_inc = v_inc - (coste_obj - prev_coste)
        t.update(valor_anual_inc=v_inc, neto_anual_inc=n_inc, rendimiento=(n_inc / t["importe"]) if t["importe"] else None,
                 payback_anios=(t["importe"] / n_inc) if (t["importe"] and n_inc > 0) else None)
        prev_cap, prev_coste = obj, coste_obj
    for t in tramos:
        t["periodo"] = etiqueta(t["q"])
    out = {"id": caso.get("id"), "origen": origen, "estado": (cv or {}).get("estado") or "estimado_cati", "fuente": (cv or {}).get("fuente"),
           "valor_regimen": vreg, "captura_actual_pct": c_act, "produccion": etiqueta(prod), "produccion_estimada": prod_est,
           "hoy": hoy, "q0": q0, "q1": q1, "serie": serie, "tramos": tramos, "hipotesis": hipotesis}
    out.update(metricas(serie, hoy, q0, q1, cfg.get("tasa_descuento_anual_pct")))
    out["van_f7"] = van_f7(serie, tramos, cfg)
    reales_q = [x for x in serie if x["real"] is not None and x["q"] <= hoy]
    plan_r = sum((x["ref"] if x["ref"] is not None else x["valor"]) for x in reales_q)
    real_v = sum((x["real_val"] or 0) for x in reales_q)
    out["desviacion"] = ({"real": sum(x["real"] for x in reales_q), "plan": plan_r, "pct": 100 * sum(x["real"] for x in reales_q) / plan_r if plan_r else None,
                          "real_validado": real_v, "pct_validado": 100 * real_v / plan_r if plan_r else None,
                          "periodos": len(reales_q), "frente_a": "referencia" if ref_puntos else "plan"} if reales_q else None)
    return out


def van_f7(serie, tramos, cfg):
    """VAN F7 (40 §6 y §8): suma de los flujos anuales de la curva (inversion de los tramos del plan, valor y coste) descontados con r,
    desde el anio del primer tramo (t = 0) hasta t = H. r = 0 si C2 no fija tasa. None sin H o sin tramos."""
    H = cfg.get("horizonte_van_anios")
    if not H or not tramos:
        return None
    r = (cfg.get("tasa_descuento_anual_pct") or 0) / 100
    y0 = min(t["q"] for t in tramos) // 4
    flujos = {}
    for x in serie:
        y = x["q"] // 4
        if y0 <= y <= y0 + int(H):
            flujos[y] = flujos.get(y, 0) + x["neto"]
    return sum(v / (1 + r) ** (y - y0) for y, v in flujos.items())


def metricas(serie, hoy, q0, q1, tasa=None):
    """Metricas de una serie trimestral (de un caso o de una cartera): recuperacion, necesidad maxima de caja y lo que queda por delante."""
    minimo, qmin = 0, None
    for x in serie:
        if x["acum"] < minimo - 1e-9:
            minimo, qmin = x["acum"], x["q"]
    payback, motivo = None, None
    if qmin is None:
        motivo = "sin_inversion_neta"
    else:
        for x in serie:
            if x["q"] > qmin and x["acum"] >= 0:
                payback = x["q"]
                break
        if payback is None:
            motivo = "fuera_horizonte"
    hz = [x for x in serie if q0 <= x["q"] <= q1]
    fut = [x for x in serie if hoy < x["q"] <= q1]
    van = sum(x["neto"] / (1 + tasa / 100) ** ((x["q"] - hoy) / 4) for x in fut) if tasa else None
    # caja que aun hace falta por delante: cuanto baja el acumulado desde hoy hasta su minimo futuro (lo ya gastado no cuenta)
    pasado = [x["acum"] for x in serie if x["q"] <= hoy]
    acum_hoy = pasado[-1] if pasado else 0
    caja_futura = max(0, acum_hoy - min([x["acum"] for x in fut] or [acum_hoy]))
    return {"payback_q": payback, "payback": etiqueta(payback) if payback is not None else None, "payback_motivo": motivo,
            "caja_max": -minimo, "caja_max_q": qmin, "caja_futura": caja_futura, "inv_12m": sum(x["inv"] for x in serie if hoy < x["q"] <= hoy + 4),
            "inv_futura": sum(x["inv"] for x in fut), "valor_futuro": sum(x["valor"] for x in fut), "neto_futuro": sum(x["neto"] for x in fut),
            "van_futuro": van, "neto_horizonte": sum(x["neto"] for x in hz), "inv_horizonte": sum(x["inv"] for x in hz),
            "valor_horizonte": sum(x["valor"] for x in hz)}


def curva_cartera(curvas, meta):
    """Suma trimestral de las curvas de varios casos (la curva en J de la cartera) y sus metricas. Los casos sin curva (None) no suman."""
    curvas = [c for c in curvas if c]
    if not curvas:
        return None
    cfg = config_curva(meta)
    hoy, q0, q1 = curvas[0]["hoy"], curvas[0]["q0"], curvas[0]["q1"]
    qa = min(c["serie"][0]["q"] for c in curvas)
    por_q = {q: {"q": q, "inv": 0, "valor": 0, "coste": 0, "neto": 0, "real": None, "real_val": None, "ref": None} for q in range(qa, q1 + 1)}
    for c in curvas:
        for x in c["serie"]:
            d = por_q[x["q"]]
            for k in ("inv", "valor", "coste", "neto"):
                d[k] += x[k]
            if x["real"] is not None:
                d["real"] = (d["real"] or 0) + x["real"]
            if x.get("real_val") is not None:
                d["real_val"] = (d["real_val"] or 0) + x["real_val"]
            if x["ref"] is not None:
                d["ref"] = (d["ref"] or 0) + x["ref"]
    serie, acum = [], 0.0
    for q in range(qa, q1 + 1):
        acum += por_q[q]["neto"]
        serie.append({**por_q[q], "acum": acum})
    out = {"hoy": hoy, "q0": q0, "q1": q1, "serie": serie, "casos": len(curvas),
           "reportadas": sum(1 for c in curvas if c["origen"] == "reportada")}
    out.update(metricas(serie, hoy, q0, q1, cfg.get("tasa_descuento_anual_pct")))
    return out


def agrupar(serie, gran, q0, q1):
    """Agrega una serie trimestral por anio, semestre o trimestre dentro del horizonte; el acumulado es el del ultimo trimestre."""
    grupos = []
    for x in serie:
        if not (q0 <= x["q"] <= q1):
            continue
        et = etiqueta(x["q"], gran)
        if not grupos or grupos[-1]["periodo"] != et:
            grupos.append({"periodo": et, "q_ini": x["q"], "inv": 0, "valor": 0, "coste": 0, "neto": 0, "real": None, "real_val": None, "ref": None})
        g = grupos[-1]
        for k in ("inv", "valor", "coste", "neto"):
            g[k] += x[k]
        for k in ("real", "real_val", "ref"):
            if x.get(k) is not None:
                g[k] = (g[k] or 0) + x[k]
        g["acum"], g["q_fin"] = x["acum"], x["q"]
    return grupos


# ---------------------------------------------------------------- valor no cuantificado (40 regla 7 y §5.3; D135)
# Dimension y nivel de 0 a 3 con metrica fisica obligatoria (base, objetivo, actual) y motivo; nunca se convierte en euros.
# «opcion» es el valor de opcion de Transformar (40 §5.3).
DIMENSIONES_NM = {
    "imagen": "Imagen y reputación",
    "posicionamiento": "Posicionamiento competitivo",
    "cliente": "Experiencia de cliente",
    "distribucion": "Red comercial y de distribución",
    "talento": "Talento y capacidades",
    "opcion": "Opción estratégica (valor de opción)",
}
NIVELES_NM = ("sin efecto", "bajo", "medio", "alto")


def no_monetario(caso, curva_caso, meta):
    """Dimensiones de valor no cuantificado de un caso y si esta sostenido por el: nivel medio o alto con metrica y VAN F7 negativo o
    sin plan de realizacion que lo demuestre (o, si no hay H, sin recuperar la inversion en el horizonte). Necesita la proxima R6 con
    fecha (reporte_compania.revision_estrategica, que el conector toma de ciclo.proxima_revision)."""
    rep = caso.get("reporte_compania") or {}
    dims = []
    for d in rep.get("valor_no_monetario") or []:
        try:
            nivel = max(0, min(3, int(d.get("nivel") or 0)))
        except (TypeError, ValueError):
            nivel = 0
        dims.append({**d, "nivel": nivel, "con_indicador": bool(d.get("indicador")), "cuenta": nivel >= 1 and bool(d.get("indicador"))})
    max_nivel = max([d["nivel"] for d in dims if d["cuenta"]] or [0])
    sin_ind = sum(1 for d in dims if d["nivel"] >= 1 and not d["con_indicador"])
    rev = rep.get("revision_estrategica")
    if not curva_caso:
        sin_demostrar = True
    elif curva_caso.get("van_f7") is not None:
        sin_demostrar = curva_caso["van_f7"] < 0
    else:
        sin_demostrar = curva_caso.get("payback_motivo") == "fuera_horizonte"
    # solo en produccion (fases 6 y 7, donde hay R6); antes, el valor de opcion de Transformar se gobierna por etapas y gates (40 §8.3)
    fase = (caso.get("seveng") or {}).get("fase")
    estrategico = max_nivel >= 2 and sin_demostrar and (fase is None or fase >= 6)
    hoy = str((meta or {}).get("generado") or "")[:10]
    aviso = None
    if estrategico and not rev:
        aviso = "sin_revision"
    elif estrategico and rev and str(rev) < hoy:
        aviso = "revision_vencida"
    return {"dimensiones": dims, "max_nivel": max_nivel, "sin_indicador": sin_ind, "estrategico": estrategico,
            "revision": rev, "aviso": aviso}
