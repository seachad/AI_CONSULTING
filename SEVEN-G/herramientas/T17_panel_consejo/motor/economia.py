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
