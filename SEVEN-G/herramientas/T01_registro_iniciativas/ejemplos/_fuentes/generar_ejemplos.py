# -*- coding: utf-8 -*-
"""Genera los registros T01 de demostración de la galería de ejemplos por sector (D136).

Cada sector se describe de forma compacta en _fuentes/<sector>.json (compañía ficticia, personas, iniciativas con su fase, valor y
riesgo principal). Este script despliega esa descripción en un registro T01 completo y coherente (esquema 0.8): eventos de alta y de
fase, decisiones de gate con todos los criterios del catálogo que aplican a su intensidad, evidencias por plantilla, valores esperados
y realizados, riesgos con nivel = probabilidad × impacto (documento 33) y cierres de las iniciativas paradas o retiradas.

Todo es ficticio. El resultado se escribe en ejemplos/<sector>/datos_demo.json y se valida contra esquema_registro.schema.json.

Uso (desde T01_registro_iniciativas/ejemplos/_fuentes):
  uv run --with jsonschema python generar_ejemplos.py            # todos los sectores
  uv run --with jsonschema python generar_ejemplos.py banca      # uno
"""
import datetime as dt
import json
import os
import re
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
EJEMPLOS = os.path.dirname(AQUI)
T01 = os.path.dirname(EJEMPLOS)
CANONICO = os.path.join(T01, "datos_demo.json")
CATALOGO = os.path.join(T01, "catalogo_criterios.json")
ESQUEMA = os.path.join(T01, "esquema_registro.schema.json")

GATES = ["G0", "G1", "G2", "G3", "G4", "G5"]
RANGO_ORGANO = {"producto": 0, "patrocinador": 1, "comite_ia": 2, "consejo": 3}
REQUERIDO = {"bajo": "producto", "medio": "patrocinador", "alto": "comite_ia", "critico": "consejo"}


def nivel(p, i):
    n = p * i
    return "critico" if n >= 16 else "alto" if n >= 10 else "medio" if n >= 5 else "bajo"


def fecha(d):
    return d.isoformat()


def dia_habil(d):
    while d.weekday() >= 5:
        d += dt.timedelta(days=1)
    return d


class Generador:
    def __init__(self, spec, canonico, catalogo):
        self.s = spec
        self.cat = catalogo
        self.titulos = {}  # plantilla -> título de evidencia (del ejemplo canónico)
        for e in canonico["evidencias"]:
            if e.get("origen") != "referencia":  # una evidencia referenciada lleva el título de su documento de origen (D146)
                self.titulos.setdefault(e["plantilla"], e["titulo"])
        self.aviso = canonico["aviso_legal"]
        self.config = canonico["meta"]["configuracion"]
        self.hoy = dt.date.fromisoformat(spec["fecha_referencia"])
        self.n_evt = 0
        self.n_dg = {}
        self.n_evi = {}
        self.n_val = 0
        self.n_cnd = {}
        self.eventos, self.decisiones, self.evidencias, self.valores, self.condiciones, self.riesgos = [], [], [], [], [], []

    # ---- identificadores
    def evt(self, **kw):
        self.n_evt += 1
        e = {"id": f"EVT-{self.n_evt:06d}"}
        e.update(kw)
        self.eventos.append(e)
        return e

    def _id(self, contador, prefijo, anio, ancho):
        contador[anio] = contador.get(anio, 0) + 1
        return f"{prefijo}-{anio}-{contador[anio]:0{ancho}d}"

    # ---- personas y responsables
    def persona(self, clave):
        return self.s["roles"][clave]

    def responsables(self, ini):
        area = ini["area"]
        r = {"patrocinador": self.s["patrocinadores"][area], "producto": ini.get("producto") or self.s["producto_por_area"][area],
             "tecnico": self.persona("tecnico"), "operacion": self.persona("operacion"), "riesgos": self.persona("riesgos"),
             "auditor": self.persona("auditor") if ini["int"] == "enterprise" else None}
        if ini["estado"] == "registrada":
            r.update({"tecnico": None, "operacion": None, "riesgos": None, "auditor": None})
        return r

    # ---- criterios aplicables por gate e intensidad
    def criterios(self, gate, intensidad):
        clave = "l" if intensidad == "lite" else "n"
        return [c for c in self.cat if c["g"] == gate and c.get(clave) in ("si", "simpl")]

    def gate(self, ini, gate, iteracion, f_sol, resultado, motivo, cifras=None, pendiente=False, organo=None, motivo_cierre=None):
        anio = f_sol.year
        dg_id = self._id(self.n_dg, "DG", anio, 3)
        f_ver = dia_habil(f_sol + dt.timedelta(days=2))
        f_dec = None if pendiente else dia_habil(f_ver + dt.timedelta(days=2 if ini["int"] == "lite" else 5))
        evis = {}
        crits = []
        for c in self.criterios(gate, ini["int"]):
            # el catálogo puede citar varias plantillas o herramientas («P04 · T04»): la evidencia es la primera
            p = next((t for t in re.split(r"[^A-Z0-9]+", c.get("e") or "") if re.fullmatch(r"[PT]\d{2}", t)), "P01")
            if p not in evis:
                eid = self._id(self.n_evi, "EVI", anio, 4)
                evis[p] = eid
                self.evidencias.append({"id": eid, "iniciativa": ini["id"], "plantilla": p, "gate": gate,
                                        "titulo": self.titulos.get(p, f"Plantilla {p}"), "enlace": f"repositorio://{ini['id']}/{gate}/{p}",
                                        "version": "1.0", "autor": ini["resp"]["producto"], "fecha": fecha(f_sol - dt.timedelta(days=4)),
                                        "verificada": True, "verificador": self.persona("verificador"), "fecha_verificacion": fecha(f_ver)})
            crits.append({"codigo": c["c"], "estado": "cumple", "evidencias": [evis[p]]})
        if organo is None:
            organo = "patrocinador" if ini["int"] == "lite" else "comite_ia"
        decisor = None if pendiente else (ini["resp"]["patrocinador"] if organo.startswith("patrocinador") else self.persona("comite") if organo.startswith("comite") else self.persona("consejo"))
        self.decisiones.append({"id": dg_id, "iniciativa": ini["id"], "gate": gate, "iteracion": iteracion, "intensidad": ini["int"],
                                "ambicion": ini["amb"], "fecha_solicitud": fecha(f_sol), "solicitante": ini["resp"]["producto"],
                                "verificador": self.persona("verificador"), "fecha_verificacion": fecha(f_ver), "resultado_verificacion": "conforme",
                                "decisor": decisor, "organo": organo, "conformidad_riesgos": None, "elevada": False,
                                "fecha_decision": fecha(f_dec) if f_dec else None, "resultado": None if pendiente else resultado,
                                "motivo": "" if pendiente else motivo, "motivo_cierre": motivo_cierre, "criterios": crits})
        fase_gate = 6 if gate == "R6" else 7 if gate == "G7" else int(gate[1])
        self.evt(iniciativa=ini["id"], fecha=fecha(f_sol), tipo="solicitud_gate", autor=ini["resp"]["producto"],
                 motivo=f"Solicitud de {gate} · iteración {iteracion}. Evidencias presentadas.", fase=fase_gate, gate=gate, decision=dg_id)
        self.evt(iniciativa=ini["id"], fecha=fecha(f_ver), tipo="verificacion", autor=self.persona("verificador"),
                 motivo=f"Verificación de {gate} · iteración {iteracion}: conforme.", fase=fase_gate, gate=gate, decision=dg_id)
        if not pendiente:
            self.evt(iniciativa=ini["id"], fecha=fecha(f_dec), tipo="decision", autor=decisor, motivo=motivo, fase=fase_gate,
                     gate=gate, decision=dg_id, resultado=resultado)
        return dg_id, f_dec or f_ver

    # ---- cifras de los eventos (lo esperado se conoce desde G1)
    def cifras(self, ini, fase, realizado=False):
        v = ini.get("valor") or {}
        esp = v.get("esperado") or {}
        rea = v.get("realizado") or {}
        e = {k: (esp.get(k) if fase >= 2 else None) for k in ("inversion", "coste_recurrente", "eficiencias", "retorno")}
        r = {k: (rea.get(k) if realizado else None) for k in ("inversion", "coste_recurrente", "eficiencias", "retorno")}
        return {"esperado": e, "realizado": r}

    # ---- valores
    def val(self, ini, momento, tipo, importe, formula, estado, periodo, f, fuente, concepto=None):
        if importe is None:
            return
        self.n_val += 1
        self.valores.append({"id": f"VAL-{self.n_val:04d}", "iniciativa": ini["id"], "momento": momento, "tipo": tipo, "importe": importe,
                             "formula": formula, "estado": estado, "periodo": periodo, "fecha": f, "fuente": fuente, "concepto": concepto})

    def valores_ini(self, ini, f_g1, f_prod):
        v = ini.get("valor")
        if not v:
            return
        esp, rea = v.get("esperado") or {}, v.get("realizado") or {}
        conc = v.get("concepto")
        if f_g1:
            self.val(ini, "esperado", "eficiencias", esp.get("eficiencias"), esp.get("formula_eficiencias", "Estimación de la fase 1"), "estimado", "Anual", None, None, conc if esp.get("eficiencias") else None)
            self.val(ini, "esperado", "retorno", esp.get("retorno"), esp.get("formula_retorno", "Estimación de la fase 1"), "estimado", "Anual", None, None, v.get("concepto_retorno"))
            self.val(ini, "esperado", "coste_recurrente", esp.get("coste_recurrente"), "Licencias, cómputo y operación", "estimado", "Anual", None, None)
            self.val(ini, "esperado", "inversion", esp.get("inversion"), "Construcción e integración", "estimado", "Total", None, None)
        if f_prod and rea:
            f = fecha(min(self.hoy, f_prod + dt.timedelta(days=rea.get("dias_hasta_medida", 150))))
            est = rea.get("estado", "declarado")
            fuente = "Control de gestión" if est == "validado" else ini["area"]
            self.val(ini, "realizado", "eficiencias", rea.get("eficiencias"), rea.get("formula", "Medición del periodo anualizada"), est, rea.get("periodo", "Anualizado"), f, fuente, conc if rea.get("eficiencias") else None)
            self.val(ini, "realizado", "retorno", rea.get("retorno"), rea.get("formula_retorno", rea.get("formula", "Medición con grupo de control")), est, rea.get("periodo", "Anualizado"), f, fuente, v.get("concepto_retorno"))
            self.val(ini, "realizado", "coste_recurrente", rea.get("coste_recurrente"), "Coste real anualizado", "declarado", "Anual", f, "Finanzas")
            self.val(ini, "realizado", "inversion", rea.get("inversion"), "Inversión ejecutada", "declarado", "Total", f, "Finanzas")

    # ---- riesgo principal
    def riesgo(self, ini, f_alta):
        r = ini.get("riesgo")
        if not r:
            return None
        n_inh, n_res = nivel(r["p"], r["i"]), nivel(r["pr"], r["ir"])
        organo = REQUERIDO[n_res]
        persona = {"producto": ini["resp"]["producto"], "patrocinador": ini["resp"]["patrocinador"], "comite_ia": self.persona("comite"), "consejo": self.persona("consejo")}[organo]
        acept = None if ini["estado"] in ("registrada",) or ini["fase"] < 3 else {
            "organo": organo, "persona": persona, "fecha": fecha(f_alta), "vigencia": fecha(f_alta + dt.timedelta(days=365)), "referencia": "Decisión de gate con el riesgo residual documentado"}
        self.riesgos.append({"id": f"{ini['id']} · R01", "iniciativa": ini["id"], "descripcion": r["d"], "categoria": r["cat"],
                             "riesgo_tipo": r["rt"], "fecha_alta": fecha(f_alta), "probabilidad": r["p"], "impacto": r["i"], "eje_impacto": r.get("eje", "operativo"),
                             "nivel_inherente": n_inh, "controles": r["controles"], "eficacia_controles": r.get("eficacia", "eficaz" if acept else "no_probado"),
                             "probabilidad_residual": r["pr"], "impacto_residual": r["ir"], "tipo_residual": "verificado" if acept else "objetivo",
                             "nivel_residual": n_res, "respuesta": r.get("respuesta", "mitigar"), "contingencia": r.get("contingencia"),
                             "responsable": ini["resp"]["riesgos"] or ini["resp"]["producto"], "estado": "aceptado" if acept else "identificado",
                             "tendencia": "estable", "proxima_revision": fecha(f_alta + dt.timedelta(days=180)), "aceptacion": acept})
        return n_res

    # ---- una iniciativa
    def iniciativa(self, n, ini):
        alta = dt.date.fromisoformat(ini["alta"])
        ini["id"] = ini.get("id") or f"IA-{alta.year}-{n:03d}"
        ini["resp"] = self.responsables(ini)
        plazos = self.config["plazos_fase"][ini["int"]]
        ritmo = ini.get("ritmo", 1.0)
        self.evt(iniciativa=ini["id"], fecha=fecha(alta), tipo="alta", autor=ini["resp"]["producto"], motivo="Alta de la iniciativa en el registro.",
                 cifras=self.cifras(ini, 0))
        estado, fase_obj = ini["estado"], ini["fase"]
        f = alta
        f_g1 = f_prod = None
        f_entrada = alta
        iteracion = 1
        motivos = ini.get("motivos", {})
        if estado != "registrada":
            f = dia_habil(alta + dt.timedelta(days=5))
            self.evt(iniciativa=ini["id"], fecha=fecha(f), tipo="entrada_fase", autor=self.persona("verificador"), motivo="Entrada en la fase 0.", fase=0, cifras=self.cifras(ini, 0))
            f_entrada = f
            ultimo = min(fase_obj, 6)
            for k in range(0, ultimo):
                g = GATES[k]
                dur = int(plazos[str(k)] * 7 / 5 * ritmo)
                f_sol = dia_habil(f + dt.timedelta(days=dur))
                para = estado == "parada" and k == fase_obj
                _, f_dec = self.gate(ini, g, 1, f_sol, "continuar", motivos.get(g, "Criterios cumplidos con evidencia verificada."))
                if k == 1:
                    f_g1 = f_dec
                self.evt(iniciativa=ini["id"], fecha=fecha(f_dec), tipo="salida_fase", autor=ini["resp"]["patrocinador"], motivo=f"Salida de la fase {k} tras {g}.", fase=k)
                self.evt(iniciativa=ini["id"], fecha=fecha(f_dec), tipo="entrada_fase", autor=ini["resp"]["patrocinador"], motivo=f"Entrada en la fase {k + 1} tras {g}.",
                         fase=k + 1, cifras=self.cifras(ini, k + 1, realizado=False))
                f = f_dec
                f_entrada = f_dec
                if k + 1 == 6:
                    f_prod = f_dec
            # situación final
            if estado == "pendiente_gate":
                f_sol = dia_habil(min(self.hoy - dt.timedelta(days=4), f + dt.timedelta(days=int(plazos[str(fase_obj)] * 7 / 5))))
                self.gate(ini, GATES[fase_obj], 1, f_sol, None, "", pendiente=True)
            elif estado == "en_espera":
                e = ini["espera"]
                self.evt(iniciativa=ini["id"], fecha=e["desde"], tipo="espera_inicio", autor=ini["resp"]["producto"], motivo=e["comentario"],
                         fase=fase_obj, campo="espera.motivo", antes=None, despues=e["motivo"])
            elif estado == "parada":
                g = GATES[fase_obj]
                f_sol = dia_habil(f + dt.timedelta(days=int(plazos[str(fase_obj)] * 7 / 5)))
                c = ini["cierre"]
                dg, f_dec = self.gate(ini, g, 1, f_sol, "parar", c["comentario"], motivo_cierre=c["motivo"])
                self.evt(iniciativa=ini["id"], fecha=fecha(f_dec), tipo="parada", autor=self.persona("comite"), motivo=c["comentario"], fase=fase_obj,
                         gate=g, decision=dg, cifras=self.cifras(ini, fase_obj))
                ini["cierre_calc"] = {"tipo": "parada", "fecha": fecha(f_dec), "motivo": c["motivo"], "organo": "Comité de IA" if ini["int"] == "enterprise" else "Patrocinador",
                                      "gate": g, "comentario": c["comentario"], "sustituto": None, "tratamiento_datos": c.get("tratamiento_datos"),
                                      "comunicacion": None, "lecciones": c.get("lecciones")}
            elif fase_obj == 7:
                f_r6 = dia_habil(f + dt.timedelta(days=int(ini.get("dias_en_produccion", 300))))
                c = ini.get("cierre") or {}
                dg, f_dec = self.gate(ini, "R6", 1, f_r6, "adelantar_g7", c.get("motivo_r6", "El valor realizado no justifica el coste recurrente: se adelanta la retirada."), organo="patrocinador")
                self.evt(iniciativa=ini["id"], fecha=fecha(f_dec), tipo="salida_fase", autor=ini["resp"]["patrocinador"], motivo="Salida de la fase 6 tras R6.", fase=6)
                self.evt(iniciativa=ini["id"], fecha=fecha(f_dec), tipo="entrada_fase", autor=ini["resp"]["patrocinador"], motivo="Entrada en la fase 7 tras R6.", fase=7,
                         cifras=self.cifras(ini, 7, realizado=True))
                f_entrada = f_dec
                f_g7 = dia_habil(f_dec + dt.timedelta(days=30))
                if estado == "retirada":
                    dg7, f7 = self.gate(ini, "G7", 1, f_g7, "retirar", c["comentario"], organo="patrocinador", motivo_cierre=c["motivo"])
                    self.evt(iniciativa=ini["id"], fecha=fecha(f7), tipo="retirada", autor=ini["resp"]["operacion"], motivo="Plan de retirada ejecutado.",
                             fase=7, gate="G7", cifras=self.cifras(ini, 7, realizado=True))
                    ini["cierre_calc"] = {"tipo": "retirada", "fecha": fecha(f7), "gate": "G7", "motivo": c["motivo"], "organo": "Patrocinador",
                                          "comentario": c["comentario"], "sustituto": c.get("sustituto"), "tratamiento_datos": c.get("tratamiento_datos"),
                                          "comunicacion": c.get("comunicacion"), "lecciones": c.get("lecciones")}
                else:  # pendiente_g7
                    self.gate(ini, "G7", 1, min(f_g7, self.hoy - dt.timedelta(days=5)), None, "", pendiente=True, organo="patrocinador")
            elif estado == "en_produccion" and (self.hoy - f).days > 190:
                f_r6 = dia_habil(f + dt.timedelta(days=182))
                self.gate(ini, "R6", 1, f_r6, "continuar_operacion", motivos.get("R6", "Revisión de continuidad: valor y controles conformes."), organo="patrocinador")
        self.valores_ini(ini, f_g1, f_prod)
        n_res = self.riesgo(ini, f_g1 or alta)
        return self.salida_iniciativa(ini, f_entrada, n_res)

    def salida_iniciativa(self, ini, f_entrada, n_res):
        estado = ini["estado"]
        amb_conf = ini["amb"] if ini["fase"] >= 3 or estado in ("en_produccion", "retirada", "pendiente_g7") else None
        clas = {"esfera_principal": ini["esfera"], "ambicion_propuesta": ini["amb"], "intensidad": ini["int"], "regulatoria": ini["reg"],
                "tecnologia": ini["tec"], "exposicion": ini["exp"], "esfera_secundaria": ini.get("esfera2"), "ambicion_confirmada": amb_conf,
                "ambicion_real": ini["amb"] if estado in ("en_produccion", "retirada", "pendiente_g7") else None, "autonomia": ini.get("aut", "A1"),
                "tipo_valor": ini.get("tv", ["eficiencia"]), "proveedores": []}
        espera = None
        if estado == "en_espera":
            e = ini["espera"]
            espera = {"motivo": e["motivo"], "desde": e["desde"], "reanudacion_prevista": e.get("reanudacion"), "comentario": e["comentario"]}
        prox = None
        if estado == "en_produccion":
            prox = fecha(dt.date.fromisoformat(f_entrada.isoformat() if isinstance(f_entrada, dt.date) else f_entrada) + dt.timedelta(days=182 if ini["int"] == "lite" else 91))
        exp_personas = ini["exp"] != "interna" or "personas" in ini.get("etiquetas", [])
        salida = {
            "id": ini["id"], "nombre": ini["n"], "descripcion": ini["d"], "area": ini["area"], "fecha_registro": ini["alta"],
            "responsables": ini["resp"], "clasificacion": clas,
            "ciclo": {"fase": ini["fase"], "estado": estado, "fecha_entrada_fase": fecha(f_entrada), "iteracion": 1, "espera": espera, "proxima_revision": prox},
            "cierre": ini.get("cierre_calc"), "riesgo_residual_principal": n_res,
            "evaluaciones_impacto": [{"tipo": "eipd", "estado": ini.get("eipd", "hecha" if exp_personas and ini["fase"] >= 3 else "no_aplica"), "fecha": None},
                                     {"tipo": "eidf", "estado": "hecha" if ini["reg"] == "alto_riesgo" and ini["fase"] >= 3 else "pendiente" if ini["reg"] == "alto_riesgo" else "no_aplica", "fecha": None}],
            "inversion": {"realizada": (ini.get("valor") or {}).get("esperado", {}).get("inversion") if ini["fase"] >= 6 else None, "pendiente": 0 if ini["fase"] >= 6 else (ini.get("valor") or {}).get("esperado", {}).get("inversion")},
            "panel": {"complejidad": ini.get("complejidad", "media"), "prioridad": ini.get("prioridad", "media"), "plazo_potencial": ini.get("plazo_potencial"),
                      "observaciones_consejo": ini.get("observaciones"), "controles": ini.get("controles", {"seguridad": "hecho" if ini["fase"] >= 4 else "pendiente",
                                                                                                             "muc": "hecho" if ini["fase"] >= 5 else "pendiente",
                                                                                                             "ia_ofensiva": "hecho" if ini["exp"] == "clientes_directa" and ini["fase"] >= 5 else "no_aplica" if ini["exp"] == "interna" else "pendiente"})},
            "etiquetas_libres": ini.get("etiquetas", []),
        }
        if ini.get("alcance"):
            salida["alcance"] = ini["alcance"]
        if ini.get("indice"):
            salida["indice"] = ini["indice"]
        return salida

    # ---- registro completo
    def registro(self):
        s = self.s
        iniciativas = []
        orden = sorted(enumerate(s["iniciativas"]), key=lambda x: x[1]["alta"])
        por_anio = {}
        for _, ini in orden:
            a = ini["alta"][:4]
            por_anio[a] = por_anio.get(a, 0) + 1
            iniciativas.append(self.iniciativa(por_anio[a], ini))
        self.eventos.sort(key=lambda e: (e["fecha"], e["id"]))
        for k, e in enumerate(self.eventos, 1):  # identificadores en orden cronológico
            e["id"] = f"EVT-{k:06d}"
        personas = [{"id": f"PER-{k:02d}", "nombre": p[0], "cargo": p[1], "area": p[2], "organo": p[3] if len(p) > 3 else None} for k, p in enumerate(s["personas"], 1)]
        meta = {"organizacion": s["organizacion"], "generado": s["fecha_referencia"], "fecha_referencia": s["fecha_referencia"], "moneda": "EUR",
                "datos_ilustrativos": True, "areas": sorted({i["area"] for i in iniciativas}),
                "nota": "Datos ilustrativos y ficticios de la galería de ejemplos por sector. Cualquier parecido con una compañía o persona real es casual.",
                "panel": {"consejo_sigla": s.get("sigla", "Comité de IA")},
                "configuracion": self.config}
        if s.get("indice"):
            meta["indice"] = s["indice"]
        reg = {"$schema": "../../esquema_registro.schema.json", "version_esquema": "0.8", "aviso_legal": self.aviso, "meta": meta,
               "personas": personas, "iniciativas": iniciativas, "eventos": self.eventos, "decisiones_gate": self.decisiones,
               "condiciones": self.condiciones, "evidencias": self.evidencias, "valores": self.valores, "riesgos": self.riesgos}
        for k in ("incidentes", "recomendaciones", "decisiones_consejo", "proveedores"):
            if s.get(k):
                reg[k] = [{c: v for c, v in x.items() if not (c == "sistema" and v is None)} for x in s[k]]
        return reg


def comprobar(reg):
    """Coherencia que exige la verificación: P×I y órgano de aceptación (documento 33) y referencias internas."""
    ids = {i["id"] for i in reg["iniciativas"]}
    errores = []
    for r in reg.get("riesgos", []):
        if r["nivel_inherente"] != nivel(r["probabilidad"], r["impacto"]) or r["nivel_residual"] != nivel(r["probabilidad_residual"], r["impacto_residual"]):
            errores.append(f"{r['id']}: nivel incoherente")
        if r["aceptacion"] and RANGO_ORGANO[r["aceptacion"]["organo"]] < RANGO_ORGANO[REQUERIDO[r["nivel_residual"]]]:
            errores.append(f"{r['id']}: órgano de aceptación inferior al requerido")
    for coleccion in ("eventos", "valores", "decisiones_gate", "evidencias", "riesgos"):
        for x in reg.get(coleccion, []):
            if x.get("iniciativa") and x["iniciativa"] not in ids:
                errores.append(f"{coleccion} {x['id']}: iniciativa inexistente")
    pers = {p["id"] for p in reg["personas"]}
    for i in reg["iniciativas"]:
        for rol, p in i["responsables"].items():
            if p and p not in pers:
                errores.append(f"{i['id']}: {rol} {p} inexistente")
    return errores


def main(argv):
    # --comprobar: genera en memoria y compara con los ficheros publicados, sin escribir (verificar_coherencia.ps1, sección 34)
    comprobar_solo = "--comprobar" in argv
    argv = [a for a in argv if a != "--comprobar"]
    canonico = json.load(open(CANONICO, encoding="utf-8"))
    catalogo = json.load(open(CATALOGO, encoding="utf-8"))
    try:
        import jsonschema
        esquema = json.load(open(ESQUEMA, encoding="utf-8"))
    except ImportError:
        jsonschema = esquema = None
        print("aviso: sin jsonschema no se valida contra el esquema (uv run --with jsonschema ...)")
    sectores = argv or sorted(f[:-5] for f in os.listdir(AQUI) if f.endswith(".json"))
    fallos = 0
    for sector in sectores:
        spec = json.load(open(os.path.join(AQUI, f"{sector}.json"), encoding="utf-8"))
        reg = Generador(spec, canonico, catalogo).registro()
        errores = comprobar(reg)
        if jsonschema:
            v = jsonschema.Draft202012Validator(esquema)
            errores += [f"esquema: {'/'.join(map(str, e.path))}: {e.message[:160]}" for e in list(v.iter_errors(reg))[:15]]
        if errores:
            fallos += 1
            print(f"{sector}: {len(errores)} errores\n  " + "\n  ".join(errores[:20]))
            continue
        destino = os.path.join(EJEMPLOS, sector)
        texto = json.dumps(reg, ensure_ascii=False, indent=1) + "\n"
        if comprobar_solo:
            ruta = os.path.join(destino, "datos_demo.json")
            actual = open(ruta, encoding="utf-8").read().replace("\r\n", "\n") if os.path.exists(ruta) else None
            if actual != texto:
                fallos += 1
                print(f"{sector}: ejemplos/{sector}/datos_demo.json no coincide con _fuentes/{sector}.json (ejecutar generar_ejemplos.py)")
            else:
                print(f"{sector}: al día")
            continue
        os.makedirs(destino, exist_ok=True)
        with open(os.path.join(destino, "datos_demo.json"), "w", encoding="utf-8", newline="\n") as f:
            f.write(texto)
        print(f"{sector}: {len(reg['iniciativas'])} iniciativas, {len(reg['eventos'])} eventos, {len(reg['decisiones_gate'])} decisiones, "
              f"{len(reg['valores'])} valores, {len(reg['riesgos'])} riesgos -> ejemplos/{sector}/datos_demo.json")
    return 1 if fallos else 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
