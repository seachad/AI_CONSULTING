# Copia mantenida en AI_CONSULTING (SEVEN-G, T17) desde 17-09-2026; origen: AI_en_el_consejo/motor (MIT, mismo autor).
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
  - Valor imputado (17-09-2026): un caso con coste recurrente y sin valor (ni eficiencias que cuenten ni retorno) no se deja a
    cero ni deficitario: se le imputa un valor = multiplicador x coste recurrente anual (meta.valor_imputado_multiplicador;
    el motor generico lo trae desactivado, 0, y cada organizacion lo fija en sus datos). Se guarda aparte (valor_imputado / valor_imputado_pot), suma en el neto y se marca como estado de dato
    "imputado": NO es un dato de la organizacion y el panel lo avisa en todo lo que lo muestre. Con multiplicador 0 se desactiva.

Este modulo lo usan build_data.py (para construir el bloque), snapshot.py (para las fotos historicas) y make_example.py.
La misma logica esta replicada en el JavaScript del panel (panel_core.py): si se cambia aqui, cambiarla alli.
"""

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
ESTADOS_VALOR = ESTADOS_DATO + ("imputado",)   # claves de valor_por_estado: los estados de dato mas el valor imputado
NO_NETO = {"capacidad_liberada"}
VALOR_IMPUTADO_MULTIPLICADOR = 0               # motor generico: desactivado; meta.valor_imputado_multiplicador lo activa


def multiplicador(data_o_meta):
    """Multiplicador del valor imputado que fija meta.valor_imputado_multiplicador (None o ausente = por defecto; 0 desactiva)."""
    meta = (data_o_meta or {}).get("meta", data_o_meta) or {}
    m = meta.get("valor_imputado_multiplicador")
    return VALOR_IMPUTADO_MULTIPLICADOR if m is None else float(m)


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


def resumen(caso, mult=None):
    """Cifras derivadas de un caso (identicas a las que calcula el panel). None = sin dato.
    `mult`: multiplicador del valor imputado (economia.multiplicador(data)); None = por defecto."""
    if mult is None:
        mult = VALOR_IMPUTADO_MULTIPLICADOR
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
    # valor imputado: sin valor (eficiencias que cuentan + retorno = 0 o sin dato) pero con coste recurrente > 0
    r["imputado"] = bool(mult) and z("eficiencias") + z("retorno") == 0 and z("recurrente") > 0
    r["imputado_pot"] = bool(mult) and z("eficiencias_pot") + z("retorno_pot") == 0 and z("recurrente_pot") > 0
    r["valor_imputado"] = mult * z("recurrente") if r["imputado"] else 0
    r["valor_imputado_pot"] = mult * z("recurrente_pot") if r["imputado_pot"] else 0
    r["neto"] = z("eficiencias") + z("retorno") + r["valor_imputado"] - z("recurrente")
    r["neto_pot"] = z("eficiencias_pot") + z("retorno_pot") + r["valor_imputado_pot"] - z("recurrente_pot")
    r["neto_adicional"] = r["neto_pot"] - r["neto"]
    r["rendimiento_adicional"] = (r["neto_adicional"] / r["adicional"]) if r["adicional"] else None
    r["payback_anios"] = (r["construccion"] / r["neto"]) if (r["construccion"] and r["neto"] > 0) else None
    # euros del valor actual (eficiencias que cuentan + retorno) por estado del dato, mas el imputado aparte
    por_estado = {k: 0 for k in ESTADOS_VALOR}
    for l in list(ef) + list(rt):
        if not cuenta(l) and l in ef:
            continue
        it = l.get("actual") or {}
        if _imp(it) is not None:
            por_estado[it.get("estado") or "estimado_cati"] = por_estado.get(it.get("estado") or "estimado_cati", 0) + _imp(it)
    por_estado["imputado"] = r["valor_imputado"]
    r["valor_por_estado"] = por_estado
    return r


CAMPOS_TOTALES = ("construccion", "recurrente", "eficiencias", "capacidad", "retorno", "valor_imputado", "neto",
                  "adicional", "recurrente_pot", "eficiencias_pot", "capacidad_pot", "retorno_pot", "valor_imputado_pot", "neto_pot")


def totales(resumenes):
    t = {k: sum((r.get(k) or 0) for r in resumenes) for k in CAMPOS_TOTALES}
    t["valor_por_estado"] = {k: sum(r["valor_por_estado"].get(k, 0) for r in resumenes) for k in ESTADOS_VALOR}
    # vale tanto para resumenes completos como para los casos de una foto (que guardan el importe y el indicador)
    t["casos_imputados"] = sum(1 for r in resumenes if r.get("imputado") or (r.get("valor_imputado") or 0) > 0)
    return t
