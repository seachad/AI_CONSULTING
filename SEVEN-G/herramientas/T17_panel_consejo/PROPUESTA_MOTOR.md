Propuesta de evolución del motor del panel, que desde el 17-09-2026 se mantiene en esta carpeta (AI_CONSULTING). Pendiente de aplicar.

Actualización del 17-09-2026: `motor/` es ya la versión 8 (embudo y ciclo de vida, umbrales configurables). Parte de lo que pedía esta propuesta queda resuelto sin tocar el motor: las fases de SEVEN-G llegan al panel como etapas del embudo mediante `config_panel.json` (`ciclo_vida`) y el historial de estados que el conector construye con los eventos de T01. Siguen pendientes las claves heredadas (`estimado_cati`, `acciones_estimadas_cati`), el aviso legal nativo en el panel móvil y la lectura del bloque `seveng` (intensidad, esferas, madurez e índice).

# Propuesta de cambios del motor para SEVEN-G · v1

Fecha: 16-09-2026 · Estado: propuesta, **no aplicada** · Ámbito: motor del panel (T17), ahora en `SEVEN-G/herramientas/T17_panel_consejo/motor/` (texto original: «en su proyecto de origen; después, republicar en `AI_en_el_consejo/motor/`»).

Nota interna (carpeta ignorada por git). No contiene datos de clientes.

## 1. Punto de partida

- El conector `t01_a_panel.py` (hoy en `SEVEN-G/herramientas/T17_panel_consejo/`; entonces, `conectores/seven_g/t01_a_panel.py`) alimenta el panel y el registro desde T01 **sin tocar el motor**. Para lograrlo usa claves heredadas y dos apaños que deberían desaparecer:
  1. `inicio_estimado = ""` en casos «En uso» o «Desenganchado» sin fecha de producción, porque `fechaProd()` hace `String(null)` y el panel escribe «null (año estimado)».
  2. El aviso legal del panel móvil se inyecta en el HTML ya generado (`demos/fuente/publicacion.py → aviso_en_movil`), porque `panel_movil.build()` no recibe ni muestra `meta.textos`.
- Lo que SEVEN-G necesita y el motor no tiene: fase y estado del ciclo de vida, *gates*, métricas del embudo, esferas y ambición (mapa T16), madurez D1–D7 (T15), índice de transformación (T14), semáforo de programas (doc. 60 §9) y aviso legal nativo.
- Referencias: 03 §3–§4 (registro y modelo de datos), 10 §4 y §8 (esferas, mapa de calor), 11 §2 y §5 (madurez), 12 §4–§6 (índice), 60 §9–§10 (paquete del consejo y relación con T17).

Regla general: **`version_datos` pasa de 6 a 7**; el motor lee 6 y 7; escribe siempre 7. Toda normalización se hace **en un solo sitio por lenguaje**: `economia.normalizar(data)` en Python y `normalize(d)` en `panel_core.py` (JS), con la misma lógica y pruebas de paridad.

## 2. Renombrar claves heredadas (compatibilidad hacia atrás)

| Actual | Nueva | Dónde | Compatibilidad |
|---|---|---|---|
| `estado: "estimado_cati"` (items de `economia`) | `estado: "estimado"` + campo opcional `estimado_por` (`consejo_asesor` · `compania` · `equipo_iniciativa` · `proveedor`) | `economia.ESTADOS_DATO`, `resumen()` (`valor_por_estado`), `panel_core` JS, textos del panel y glosario | Al leer, `estimado_cati` → `estimado` con `estimado_por: "consejo_asesor"`. `valor_por_estado` devuelve `estimado`; durante una versión se duplica también como `estimado_cati` para fotos antiguas. |
| `detalle.acciones_estimadas_cati` | `detalle.acciones_estimadas` | panel completo (bloque de agentes) | Si solo existe la antigua, se copia. |
| `seguimiento.adopcion.aap` | `seguimiento.adopcion.plataforma_agentica` (`usuarios_activos`, `conversaciones_mes`) | panel completo (adopción) | Si solo existe `aap`, se copia. |
| `valor.acum_extrapolado_cati` (bloque heredado `valor`) | `valor.acum_extrapolado` | panel completo | Igual. Valorar retirar el bloque `valor` completo en v8. |
| Textos «estimado por el consejo asesor» | «estimado (por …)» según `estimado_por`; si falta, «estimado» | panel completo, móvil, glosario | — |

Fotos del histórico (`snapshot.py`): al comparar, normalizar ambas claves de `valor_por_estado`.

Pruebas: regenerar las once demos con JSON v6 y comprobar huella de cálculo idéntica (totales `economia.totales`) frente a v6; convertir un JSON a v7 y comprobar los mismos totales.

## 3. Ciclo de vida SEVEN-G en cada caso

### 3.1 Bloque `casos[].seveng` (hoy lo escribe el conector y el panel lo ignora)

```json
"seveng": {
  "codigo": "IA-2026-001",
  "fase": 3, "fase_nombre": "Viabilidad y riesgo",
  "estado": "pendiente_gate",
  "fecha_entrada_fase": "2026-04-22", "dias_en_fase_sin_espera": 147, "plazo_referencia_dias": 45, "estancada": true,
  "iteracion": 1,
  "espera": {"motivo": "datos", "desde": "2026-08-10", "reanudacion_prevista": "2026-09-01"},
  "proxima_revision": null,
  "gate_pendiente": {"gate": "G3", "iteracion": 1, "fecha_solicitud": "2026-09-01", "dias_habiles": 11, "plazo_dias_habiles": 10, "elevada": false,
                     "grado_cumplimiento_pct": 82, "bloqueantes": ["G3.04"], "condicionables_abiertos": 1},
  "gates": [{"gate": "G2", "iteracion": 1, "fecha_solicitud": "2026-04-13", "fecha_decision": "2026-04-22", "resultado": "continuar",
             "organo": "comite_ia", "grado_cumplimiento_pct": 100}],
  "condiciones": {"abiertas": 1, "vencidas": 0},
  "intensidad": "enterprise",
  "esfera_principal": "04", "esfera_secundaria": "05",
  "ambicion": {"propuesta": "optimizar", "confirmada": "optimizar", "real": null},
  "autonomia": "A2", "regulatoria": "riesgo_minimo",
  "programa": "Programa eficiencia financiera",
  "etiquetas_libres": ["Agentes"], "sistemas": ["SIA-2026-003"]
}
```

Nombres y listas cerradas iguales a `esquema_registro.schema.json` de T01 (fase 0–7; estados `registrada · en_fase · pendiente_gate · en_espera · en_produccion · pendiente_g7 · parada · retirada`; resultados `continuar · continuar_condiciones · iterar · pivotar · parar · escalar · retirar · continuar_operacion · adelantar_g7`).

### 3.2 Estado del panel

- Si hay `seveng`, el panel muestra **fase y estado SEVEN-G** (badge «F3 · Pendiente de G3») y filtra por ellos; `estado` (4 valores) se mantiene como agregado derivado con la tabla del conector (`Desenganchado` si parada/retirada; `En uso` si fase 6–7; `En desarrollo` si fase 4–5; `POC` si fase 0–3).
- Distinguir **parada** (nunca llegó a producción) de **retirada**: hoy ambas son «Desenganchado» y los movimientos solo cuentan `alta · retirada · reevaluacion`. Añadir tipo `parada` a `movimientos[]` y a los contadores.
- Corregir `fechaProd()`: con `produccion` y `inicio_estimado` nulos devolver `{f:null}` (y no contar el caso por año). Elimina el apaño del conector.

### 3.3 `tags.riesgo` frente a clasificación de la compañía

Hoy `tags.riesgo` se rotula «estimación del consejo asesor» y `clasificacion_ria` es la de la compañía. Con SEVEN-G la fuente habitual es solo el registro. Propuesta: `tags.riesgo` pasa a ser la clasificación vigente (con `clasificacion_fuente`: `compania` · `consejo_asesor`), y la estimación independiente, opcional, va en `reporte_compania.estimacion_consejo_ria`. El semáforo solo compara si existen ambas.

## 4. Embudo y *gates* (03 §3.5) · `seguimiento.embudo`

Calculado por T01 (o por el conector) a la fecha de corte; el panel lo muestra y no lo recalcula, salvo lo que ya calcula de fechas por caso.

```json
"embudo": {
  "fecha_corte": "2026-09-16", "fuente": "T01",
  "por_fase": [{"fase": 3, "por_estado": {"en_fase": 0, "pendiente_gate": 1, "en_espera": 0}, "valor_esperado": 120000, "sin_dato_valor": 0,
                "mezcla_ambicion": {"optimizar": 1, "aumentar": 0, "transformar": 0, "sin_clasificar": 0}}],
  "estancadas": [{"caso": "IA-2026-001", "fase": 3, "dias": 147, "plazo": 45}],
  "gates_pendientes": [{"caso": "IA-2026-002", "gate": "G2", "iteracion": 3, "dias_habiles": 6, "plazo": 10, "elevada": true, "organo": "organo_superior"}],
  "tiempo_en_fase": {"3": {"mediana": 41, "p80": 70, "n_cerrados": 6, "n_en_curso": 2}},
  "tiempo_decision": {"G3": {"mediana": 7, "p80": 9, "n": 8}},
  "tiempo_hasta_produccion": {"mediana": 212, "registro_a_g3": 110, "g3_a_g5": 98, "n": 4},
  "conversion_por_gate": {"G3": {"continuan": 6, "iteran": 1, "pivotan": 1, "paran": 1}},
  "iteraciones_por_gate": {"G2": {"media": 1.4, "maximo": 3}},
  "cumplimiento_gates": {"grado_medio_pct": {"G3": 91}, "criterios_mas_bloqueantes": [{"codigo": "G3.04", "veces": 3}]},
  "condiciones": {"abiertas": 3, "vencidas": 2},
  "espera": {"episodios": 3, "dias": 88, "por_causa": {"proveedor": 49, "presupuesto": 49, "datos": 37}},
  "motivos_cierre": {"riesgo_inaceptable": 1, "sustituida": 1},
  "valor_ponderado": {"mostrado": false, "motivo": "historial insuficiente (3 de 5)", "valor": null, "fases_excluidas": [0, 1, 2]},
  "cohortes": [{"trimestre": "2025-T1", "registradas": 3, "superan_g3": 3, "produccion": 3, "cerradas_sin_produccion": 0, "mediana_dias_produccion": 198}]
}
```

Vista en el panel completo: nuevo bloque «Embudo y *gates*» (barras por fase con desglose por estado, estancadas, *gates* pendientes fuera de plazo, conversión por *gate*, condiciones vencidas). Móvil: una línea en «Alertas» (estancadas, *gates* fuera de plazo, condiciones vencidas). `seguimiento.agilidad` sigue existiendo; si hay `embudo`, sus mosaicos toman `tiempo_decision` y `tiempo_hasta_produccion`.

## 5. Mapa esferas × ambición (10 §8, T16)

### 5.1 Tesis de C2 · `meta.tesis`

```json
"tesis": {
  "fecha_aprobacion": "2026-03-20", "organo": "consejo",
  "esferas": {"01": {"ambicion_objetivo": "transformar", "prioritaria": true}, "04": {"ambicion_objetivo": "optimizar", "prioritaria": true}},
  "gobierno": {"08": {"cumplimiento": "sistematico", "anticipacion": "basico", "liderazgo_etico": "basico"},
               "09": {"estructura": "sistematico", "velocidad_control": "sistematico", "ecosistema_proveedores": "basico"}},
  "umbrales_mapa": {"baja_pct": 5, "media_pct": 15, "fuera_tesis_pct": 5, "sin_evidencia_meses": 12}
}
```

Grados de 08 y 09: `basico · sistematico · avanzado` (10 §6.1 y §7.1), con `null` = sin evaluar.

### 5.2 Mapa · calculado por el motor desde `casos[].seveng` y `economia`

Filas 01–07 × columnas `optimizar · aumentar · transformar · sin_clasificar`. Cada celda: `n`, `n_produccion`, `inversion` (construcción), `coste_recurrente`, `neto_validado` (solo importes validados), `ambicion_objetivo` de la fila, `color` (`sin_actividad · baja · media · alta` sobre inversión + coste recurrente de 01–07) y marcas `brecha`, `fuera_tesis`, `sin_evidencia`, `secundaria` (número de casos con la esfera como secundaria, sin importes). Imputación solo a la esfera principal (10 §4.1 regla 6).

Filas 08 y 09: **grados por dimensión**, nunca columnas de ambición; su inversión va en una banda aparte «Habilitación de gobierno y cumplimiento» (10 §4.2).

Salida en el JSON exportado del panel, para el paquete del consejo: `seguimiento.mapa_esferas` (misma estructura, generada, no editable). Vista: nuevo bloque en «Cartera y valor», que sustituye o amplía «Dónde invierte la compañía (ambición)». Filtros nuevos: esfera principal, fase, intensidad, programa.

## 6. Madurez D1–D7 (11 §2 y §5, T15) · `madurez`

> **Resuelto el 22-09-2026 (D100)** con un bloque más sencillo: el conector pasa `madurez` (ver `motor/ESQUEMA.md`) desde el registro T01 (esquema 0.6, escrito por T15) y el motor muestra la tarjeta en «Cartera y valor» y un bloque en el móvil. La propuesta original se conserva como referencia.

```json
"madurez": {
  "fecha_corte": "2026-06-30", "modalidad": "verificada", "version_cuestionario": "1.0",
  "verificador": "Auditoría interna",
  "pesos": {"D1": 1, "D2": 1, "D3": 1, "D4": 1, "D5": 1, "D6": 1, "D7": 1},
  "dimensiones": {
    "D1": {"nombre": "Estrategia y gobierno", "nivel": 3, "avance_pct": 50, "bloqueantes": ["D1.09"], "criterios_adelantados": ["D1.11"]},
    "D6": {"nombre": "Riesgo, seguridad y cumplimiento", "nivel": 1, "avance_pct": 25, "bloqueantes": ["D6.05", "D6.07"], "criterios_adelantados": []}
  },
  "media_ponderada": 3.00, "limite": 2, "limite_aplicado": true, "nivel_global": 2,
  "declaracion_aplicacion_seven_g": false,
  "anterior": {"fecha_corte": "2025-06-30", "nivel_global": 1, "dimensiones": {"D1": 2}}
}
```

Reglas del motor: no mostrar si `modalidad = "autodiagnostico"` (11 §4.1: no se usa en el panel), salvo con rótulo «autoevaluación no verificada»; comprobar `nivel_global = min(floor(media), min(D1, D6) + 1)` y avisar si no cuadra; pesos entre 10 % y 25 % cada uno. Vista: radar o barras por dimensión con nivel 0–5, avance al siguiente y bloqueantes; en el móvil, nivel global y D1/D6.

## 7. Índice de transformación (12 §4–§6, T14) · `indice_transformacion`

> **Resuelto el 19-09-2026 (D71)** con un bloque más sencillo: el conector pasa `indice` (ver `motor/ESQUEMA.md`) desde el JSON que exporta la calculadora T14 (`--indice`), y el motor muestra la tarjeta «Índice de transformación de la compañía» en «Cartera y valor» sin recalcular nada. Queda pendiente la vista en el panel móvil. La propuesta original se conserva como referencia.

```json
"indice_transformacion": {
  "fecha_corte": "2026-06-30", "version_umbrales": "12-v1", "calculo": "anual",
  "condiciones_base": {"B1": {"valor_pct": 86, "cumple": true}, "B2": {"valor_pct": 43, "cumple": false}, "B3": {"valor": 3, "umbral": 5, "cumple": false}},
  "senales": {
    "IT-S1": {"nombre": "Composición de la inversión", "valor": 31.5, "unidad": "%", "detalle": {"transformar_pct": 8.2}, "puntuacion": 2, "tendencia": 1},
    "IT-S2": {"nombre": "Composición del valor", "valor": null, "unidad": "%", "puntuacion": null},
    "IT-S3": {"nombre": "Materialización", "valor": null, "puntuacion": null},
    "IT-S4": {"nombre": "Profundidad del cambio", "valor": 0, "unidad": "%", "puntuacion": 1},
    "IT-S5": {"nombre": "Modelo operativo", "valor": 0, "unidad": "%", "puntuacion": 1},
    "IT-S6": {"nombre": "Ingresos habilitados por IA", "valor": null, "puntuacion": null},
    "IT-S7": {"nombre": "Paso a producción", "valor": {"CR": 0.6, "TR": 1.8}, "puntuacion": 2},
    "IT-S8": {"nombre": "Decisión del consejo", "valor": {"apuestas": 1, "revisiones": 2, "decisiones_etapa": 0}, "puntuacion": 2}
  },
  "suma": 8, "cobertura": 5, "provisional": true, "plan_datos_faltantes": [{"senal": "IT-S3", "responsable": "Control de gestión", "plazo": "2026-12-31"}],
  "declaracion": {"IT-D1": true, "IT-D2": false, "IT-D3": true, "D": true},
  "perfil_evidenciado": "eficiencia_tactica",
  "perfil_asignado": "transformacion_declarada_no_evidenciada",
  "perfil_subyacente": "eficiencia_tactica",
  "alertas": ["apuestas_atascadas"],
  "que_moveria_el_perfil": [{"condicion": "B2 ≥ 50 %", "responsable": "Control de gestión", "plazo": "2027-03-31"}],
  "anterior": {"fecha_corte": "2025-06-30", "perfil_asignado": "exploracion_dispersa", "suma": 5}
}
```

Listas cerradas: perfiles `transformacion_en_curso · eficiencia_a_escala · eficiencia_tactica · exploracion_dispersa · transformacion_declarada_no_evidenciada`; alertas `transformacion_fragil · eficiencia_no_materializada · apuestas_atascadas · transformacion_sin_consejo · cambio_sin_supervision`. «Sin dato» = `valor` y `puntuacion` a `null`, nunca 0; `cobertura` = señales con dato (de 8); `provisional` si cobertura < 6. Vista: tabla de señales (valor medido, puntuación, tendencia, sin dato explícito) y perfil con subyacente y cobertura (12 §10). El motor no recalcula el perfil; solo valida coherencia básica (cobertura, provisional, paso 2).

## 8. Semáforo de programas (60 §9) · `programas[]`

```json
"programas": [{"nombre": "Programa cliente digital", "patrocinador": "Dirección comercial", "casos": ["IA-2025-002", "IA-2026-005"],
               "ejes": {"plazo": "verde", "coste": "verde", "valor": "ambar", "riesgo": "rojo", "gobierno": "verde", "adopcion": "sin_dato"},
               "global": "rojo", "explicacion": "…", "rojo_trimestres_consecutivos": 1}]
```

El motor aplica y comprueba las reglas 60 §9.3 (peor eje; sin dato impide verde; sin dato en riesgo o en dos ejes = rojo). Estados con texto, no solo color.

## 9. Aviso legal nativo

- Nuevo `meta.textos.aviso_legal` (HTML corto permitido). Si falta, texto por defecto del motor (el mismo de `publicacion.AVISO_LEGAL_DATOS_PROPIOS`; con `meta.demo = true`, la versión «datos ficticios»).
- Panel completo: en el **pie**, siempre visible, además de `aviso_previo` en la banda de cabecera.
- Panel móvil: `panel_movil.build()` recibe `meta.textos` y muestra `aviso_previo` arriba (colapsable) y `aviso_legal` antes del pie. Mismo texto y misma huella en los dos paneles.
- Tras publicar el motor: retirar `aviso_en_movil()` de `demos/fuente/publicacion.py` y la versión corta del pie de `textos_con_aviso()`, y pasar el aviso por `aviso_legal`.

## 10. Otros ajustes detectados al integrar T01

- La banda «Aviso» del panel completo cita `dashboard_data.json` y `dashboard_schema.md`; debería citar `ESQUEMA.md` (y no nombrar un fichero cuando los datos van incrustados).
- Con una sola compañía, la gráfica por compañía y unidad repite el nombre de la compañía truncado en cada barra: usar solo la unidad cuando hay una compañía.
- Mosaico de construcción: «N de M casos con coste estimado por el consejo asesor» debe usar `estimado_por`.
- `seguimiento.incidentes[].tipo`: aceptar severidad `S1–S4` como campo propio (`severidad`) y no como tipo.
- Movimientos «del periodo»: filtrar por `meta.periodo.desde` si existe (hoy muestra todo lo que recibe).
- Registro de recomendaciones (T18): admitir `iniciativas[]` por recomendación con enlace a la ficha del caso (`#caso=IA-…`), y estados de T01 (`abierta · en_curso · cerrada · descartada`) además de los actuales.

## 11. Orden sugerido y efecto en el conector

1. v7 con renombres y compatibilidad (§2), `fechaProd` y aviso legal nativo (§3.2, §9). Conector: escribe `estimado`, `estimado_por: "equipo_iniciativa"`, `aviso_legal`; quita `inicio_estimado = ""`.
2. `seveng` leído por el panel, tipo `parada`, filtros por fase, esfera, intensidad y programa (§3).
3. Embudo (§4) y mapa esferas × ambición (§5): el conector calcula `embudo` con las mismas reglas que T01 (03 §3.5) o T01 lo exporta.
4. Madurez (§6), índice (§7) y programas (§8): bloques opcionales que llegan de T15, T14 y del semáforo; si faltan, el panel no los muestra (no «sin dato» a pantalla completa).
5. Cada paso: regenerar demos, probar completo, móvil a 375 px y registro, y verificación de términos prohibidos antes de publicar.
