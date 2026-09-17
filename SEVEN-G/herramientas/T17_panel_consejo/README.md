# T17 · Conector del registro T01 al panel del consejo

## Aviso legal y exención de responsabilidad

SEVEN-G y esta herramienta se ofrecen «tal cual» y con fines exclusivamente informativos. No constituyen asesoramiento jurídico, regulatorio, financiero ni profesional, ni garantizan el cumplimiento de ninguna norma. Los criterios, clasificaciones y referencias a regulación general (Reglamento Europeo de IA, RGPD, DORA, NIS2…) o sectorial pueden ser incompletos, no aplicar a un caso concreto o quedar desactualizados por cambios normativos. Cada organización que use la herramienta es la única responsable de identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio, con el asesoramiento cualificado que corresponda. El autor y SEACHAD no asumen responsabilidad alguna por el uso de la herramienta ni por las decisiones adoptadas con ella. Los datos de demostración son ficticios.

Todo lo que genera el conector (panel completo, panel móvil y registro de recomendaciones) lleva este aviso: en la banda de avisos y el pie del panel completo, antes del pie del panel móvil y en el pie del registro.

---

Convierte el **JSON completo** que exporta el registro de iniciativas **T01** de SEVEN-G (esquema `esquema_registro.schema.json`, versión `0.1`) en el JSON del panel (`motor/ESQUEMA.md`) y genera con el motor del panel, incluido en `motor/`:

- el **panel completo** y el **panel móvil** (T17), sincronizados (misma huella de datos);
- el **JSON del panel**, para inspeccionarlo o guardarlo como foto con `motor/snapshot.py`;
- el **registro de recomendaciones** (T18), si T01 trae recomendaciones.

Especificación: documento 03 (§5.4, T17 y T18; §2, principios) y documento 60 (paquete del consejo).

[English version](README_en.md) · [Página del conector](index.html)

## Ficheros

| Fichero | Contenido |
|---|---|
| `t01_a_panel.py` | El conector: mapeo T01 → esquema del panel y generación con el motor. Solo biblioteca estándar. |
| `motor/` | El motor del panel: `build_dashboard.py` (panel completo), `panel_movil.py`, `panel_core.py` (núcleo JavaScript común), `economia.py`, `glosario.py`, `snapshot.py`, `ESQUEMA.md` (esquema del JSON) y `demo_lib.py` (plantilla del registro de recomendaciones). Copia mantenida en AI_CONSULTING desde el 17-09-2026; origen: `AI_en_el_consejo/motor` (MIT, mismo autor). A partir de ahora el motor evoluciona aquí. |
| `publicacion_panel.py` | Aviso legal, pie de autoría, inserción del aviso en el panel móvil y página del registro de recomendaciones. Lo importa el conector desde esta carpeta. |
| `index.html` | Página del conector (ES/EN, sin servidor ni recursos externos) con los enlaces a la demo y el aviso legal. |
| `ejemplo/salida/` | Demo generada con los datos ficticios de T01. Nunca se editan a mano los HTML: se regeneran con el conector. |
| `PROPUESTA_MOTOR.md` | Documento de trabajo: cambios propuestos al motor del panel para leer los datos de SEVEN-G. Para el proyecto de origen del motor; no se aplica en la copia pública. |
| `README.md` · `README_en.md` | Este documento, en español e inglés. |

## Requisitos

- **Python 3.11 o superior** con [`uv`](https://docs.astral.sh/uv/). Solo biblioteca estándar; no instala paquetes.
- Nada más: el **motor del panel está incluido** en `motor/` y no hace falta ningún otro repositorio. El conector añade a `sys.path` esta carpeta y `./motor`.
- Opcional: `--panel <ruta>` usa otro motor, indicando un checkout del repositorio [AI en el Consejo](https://github.com/Seachad-TEAM/AI_en_el_consejo) (`<ruta>/motor` y `<ruta>/demos/fuente`). Si falta algo, el conector se detiene con un mensaje claro.

## Uso

Desde esta carpeta:

```bash
uv run python t01_a_panel.py --t01 export_t01.json --salida carpeta [--sigla CA] [--organizacion "Nombre"] [--prefijo t01_] [--panel ruta]
```

| Opción | Qué hace |
|---|---|
| `--t01` | JSON completo exportado desde T01 (**Datos → Exportar JSON completo**). No sirve el CSV ni la exportación «para el panel». Por defecto, `../T01_registro_iniciativas/datos_demo.json` (datos ficticios). |
| `--salida` | Carpeta de salida. Se crea si no existe. Por defecto, `./ejemplo/salida`. |
| `--sigla` | Siglas del consejo asesor que aparecen en los textos. Por defecto, «consejo asesor». |
| `--organizacion` | Nombre de la organización. Por defecto, `meta.organizacion` de T01. |
| `--prefijo` | Prefijo de los ficheros. Por defecto, `t01_`. |
| `--panel` | Opcional: usar otro motor, indicando un checkout del repositorio *AI en el Consejo*. Por defecto, `./motor`. |

Ficheros que genera: `<prefijo>Dashboard_Casos_Uso_IA_v7.html`, `<prefijo>Dashboard_Movil_IA_v7.html`, `<prefijo>dashboard_data.json` y, si hay recomendaciones, `<prefijo>Registro_Recomendaciones.html`.

Si `meta.datos_ilustrativos` de T01 es `true`, los textos dicen que los datos son ficticios; si no, llevan una versión del aviso legal para datos propios.

El conector no escribe `__pycache__` (`sys.dont_write_bytecode`).

## Demo

`uv run python t01_a_panel.py` sin argumentos convierte `../T01_registro_iniciativas/datos_demo.json` (compañía, personas y proveedores ficticios) en `ejemplo/salida/` y enlaza los pies a `index.html`. Es la demo que abre la página del conector. Nunca se editan a mano los HTML generados.

## Principios del mapeo

1. **«Sin dato» no es cero.** Lo que T01 no registra queda a `null` (o lista vacía) y el panel lo muestra como «sin dato» (documento 03 §2, principio 7).
2. **El conector no modifica el motor.** Se usan sus claves heredadas: `estimado_cati` para los importes estimados y `acciones_estimadas_cati` (a `null`). Los cambios del motor (renombrar claves, leer `seveng`, aviso legal nativo) están propuestos en `PROPUESTA_MOTOR.md` y se aplicarán en `motor/`.
3. **Una sola fuente.** Todo sale del JSON de T01; no se añaden estimaciones (documento 03 §2, principio 1).

## Estado del panel

El panel solo admite cuatro estados. Se derivan del estado y la fase de T01, en este orden:

| Condición en T01 | Estado del panel | Por qué |
|---|---|---|
| Estado `parada` o `retirada`, o iniciativa con `cierre` | `Desenganchado` | Cerrada: ya no consume ni aporta. |
| Estado `en_produccion` o `pendiente_g7`, o fase 6–7 | `En uso` | Superado G5: está operando. |
| Fase 4–5 (con cualquier otro estado: en fase, pendiente de *gate*, en espera) | `En desarrollo` | Superado G3: se diseña, construye y valida. |
| Fase 0–3 (registrada, en fase, pendiente de *gate*, en espera) | `POC` | Antes de G3: exploración, hipótesis y viabilidad. |

La fase y el estado originales se conservan en `casos[].seveng`.

## Tabla de mapeo

### `meta`

| Panel | Origen en T01 | Nota |
|---|---|---|
| `organizacion`, `compania_principal` | `--organizacion` o `meta.organizacion` | |
| `consejo_sigla` | `--sigla` | T01 no lo registra; por defecto «consejo asesor». |
| `generado`, `ejercicio_valor`, `periodo` | `meta.fecha_referencia` (o `meta.generado`) | Etiqueta «Registro de iniciativas T01 · corte dd-mm-aaaa»; trimestre calculado de la fecha. `periodo.anterior` sin dato. |
| `prefijo_ficheros` | `--prefijo` | |
| `demo` | `meta.datos_ilustrativos` | |
| `textos` | Generados por el conector | Aviso legal, aviso de valor, pie con autoría y textos de «sin dato». |
| `glosario_extra` | Generado por el conector | SEVEN-G, T01, G3, G5, R6 y ambición. |
| `origen` | `version_esquema` y versión del conector | Bloque propio; el panel no lo lee. |

### `casos[]` (una por iniciativa)

| Panel | Origen en T01 | Nota |
|---|---|---|
| `id`, `nombre` | `id`, `nombre` | |
| `que_es` | `descripcion` | |
| `area`, `unidad` | `area` | |
| `compania` | organización | T01 no tiene grupo de compañías. |
| `estado` | `ciclo.fase` y `ciclo.estado` | Tabla anterior. |
| `descripcion` | — | Sin dato: son observaciones del consejo asesor. |
| `inicio_estimado` | — | Sin dato. Excepción técnica: `""` en casos «En uso» o «Desenganchado» sin fecha de producción, para que el motor actual no escriba «null (año estimado)». |
| `tags.tecnologia` | `clasificacion.tecnologia` | Una etiqueta para filtrar: `agente` si está; si no, `ia_generativa`; si no, la primera. Vocabulario del panel (`Agéntico`, `GenAI`, `ML predictivo`, `NLP / IDP`, `Visión artificial`, `Optimización`, `IA de tercero`, `Reglas (no es IA)`), que el motor usa para detectar agentes. |
| `tags.naturaleza` | Derivada de la tecnología principal | |
| `tags.exposicion` | `clasificacion.exposicion` | `interna` → Interno · `empleados` → Empleado · `clientes_indirecta` → Cliente (indirecta) · `clientes_directa` → Cliente / persona externa (directa). |
| `tags.riesgo`, `detalle.aiact` | `clasificacion.regulatoria` | Prohibido · Alto riesgo · Transparencia (art. 50) · Riesgo mínimo · Fuera de ámbito · Por confirmar (`pendiente`). **Es la clasificación del registro**, no una estimación independiente del consejo asesor, aunque el panel la rotule así. |
| `tags.funcion` | `clasificacion.esfera_principal` | «04 Operaciones», etc. |
| `tags.ambicion` | `ambicion_real`, si no `ambicion_confirmada`, si no `ambicion_propuesta` | Optimizar · Aumentar · Transformar. |
| `tags.prioridad` | — | Sin dato. |
| `detalle.tipo` | `clasificacion.tecnologia` (todas) | |
| `detalle.proveedores` | `clasificacion.proveedores` → `proveedores[].nombre` | |
| `detalle.valor_tipo` | `clasificacion.tipo_valor` | |
| `detalle.es_ia` | Naturaleza de la tecnología principal | |
| `detalle.decision`, `datos`, `acciones_estimadas_cati` | — | Sin dato. |
| `valor` (bloque heredado) | — | Todo sin dato salvo `medido` (hay algún importe realizado) y `fuente`. |
| `seveng` | `ciclo`, `clasificacion`, decisiones pendientes | Bloque propio (fase, estado, iteración, espera, *gate* pendiente, intensidad, esferas, ambiciones, autonomía, etiquetas, sistemas). El panel actual no lo lee. |

### `casos[].economia`

Cada importe de `valores` pasa a un *item* con `importe`, `formula`, `estado`, `fuente` y `fecha`; `atribucion` e `hipotesis` quedan sin dato. Si hay varios importes del mismo momento y tipo, se usa el más reciente. Estado: `validado` y `declarado` iguales; `estimado` → `estimado_cati` (clave heredada del motor; en T01 lo estima el equipo de la iniciativa, no el consejo asesor, y el aviso del panel lo explica).

| Panel | Origen en T01 | Nota |
|---|---|---|
| `inversion.construccion` | Valor `inversion` realizado; si no, `inversion.realizada` de la ficha (declarado); si no, valor `inversion` esperado | |
| `inversion.recurrente_anual` | Valor `coste_recurrente` realizado | |
| `inversion.recurrente_potencial` | Valor `coste_recurrente` esperado | |
| `inversion.adicional_potencial` | `inversion.pendiente` de la ficha (declarado) | |
| `inversion.desglose_recurrente` | — | Sin dato: T01 no desglosa el coste. |
| `eficiencias[]` concepto `operativo` | Valores `eficiencias` (realizado → `actual`, esperado → `potencial`) | T01 no distingue personas, herramientas, siniestros, etc. |
| `eficiencias[]` concepto `capacidad_liberada` | Valores `capacidad_liberada` | No suma en el neto. |
| `retorno[]` concepto `otros` | Valores `retorno` | T01 no distingue venta nueva, retención, etc. |
| `hipotesis_potencial` | Fórmulas de los valores esperados | |
| `nota_caso` | Fase y estado de T01; importes de `riesgo_evitado` y `cumplimiento` | Se informan como texto: no suman en el neto (regla de T01). |
| `moneda` | `meta.moneda` | |
| `plazo_potencial`, `clave_reparto` | — | Sin dato. `comparte_valor_con` vacío. |

En las iniciativas **cerradas** (paradas o retiradas) solo se conserva la construcción; sus demás importes se citan en `nota_caso` y no suman en el panel.

### `casos[].reporte_compania`

| Panel | Origen en T01 | Nota |
|---|---|---|
| `propietario_negocio`, `responsable_tecnico` | `responsables.patrocinador`, `responsables.tecnico` → nombre de la persona | |
| `empresa_grupo` | organización | |
| `fechas.idea` | `fecha_registro` | |
| `fechas.aprobacion` | Primera decisión de **G3** con resultado Continuar o Continuar con condiciones | |
| `fechas.inicio` | Primera entrada en la fase 4 | Empieza el diseño de la solución. |
| `fechas.piloto` | Primera entrada en la fase 5 | Entrega y validación. |
| `fechas.produccion` | Primera decisión de **G5** que continúa; si no hay, primera entrada en la fase 6 | |
| `fechas.ultima_revision` | Última decisión de R6 | |
| `fechas.retirada` | `cierre.fecha` | Fecha de parada o de retirada. |
| `retirada` | `cierre`: tipo, *gate*, motivo codificado y comentario; `organo`; `sustituto` | |
| `tier_riesgo` | `riesgo_residual_principal` | `critico` → `alto`. |
| `clasificacion_ria` | `clasificacion.regulatoria` | `riesgo_minimo` → `minimo` · `fuera_ambito` → `no_es_ia` · `pendiente` → sin dato. |
| `controles.RIA` | `clasificacion.regulatoria` | `pendiente` → pendiente; cualquier otra → hecho. |
| `controles.FRIA` | `evaluaciones_impacto` tipo `eidf` | hecha → hecho · pendiente · no_aplica. |
| `controles.DPIA` | `evaluaciones_impacto` tipo `eipd` | Igual. |
| `controles.seguridad`, `MUC`, `IA_ofensiva` | — | Sin dato. |
| `valor_validado.actual`, `metodo_atribucion`, `validado_por`, `fecha_validacion` | Valores realizados validados de eficiencias y retorno | |
| `valor_validado.objetivo` | Suma de eficiencias y retorno esperados | |
| `valor_validado.base`, `recurrente`; `coste_real` | — | Sin dato. |
| `operacion`, `agente`, `proveedor_dora` | — | Sin dato. |

### `seguimiento`

| Panel | Origen en T01 | Nota |
|---|---|---|
| `movimientos[]` tipo `alta` | Eventos `alta` | Decisor = autor del evento. |
| `movimientos[]` tipo `retirada` | Eventos `parada` y `retirada` | El motivo empieza por «Parada en G3» o «Retirada en G7»: el panel solo cuenta altas, retiradas y reevaluaciones. Decisor = órgano del cierre; sustituto del cierre. |
| `movimientos[]` tipo `reevaluacion` | Eventos `cambio_clasificacion` y decisiones de **R6** | |
| `incidentes[]` | `incidentes` | `tipo` = «Severidad S1–S4»; `horas_detectar`, `horas_contener`, descripción, notificaciones y estado. `resolucion_horas`, `rto_horas`, `origen`, `vector`, brecha, afectados y plazos de notificación: sin dato. |
| `adopcion`, `agilidad`, `ia_ofensiva`, `cdm_compania` | — | Sin dato. La agilidad idea → aprobación → producción la calcula el panel con las fechas de cada caso. |

Los movimientos incluyen **todo el historial** del registro, no solo el último periodo.

### `historico[]`

Vacío: T01 no guarda fotos del panel. Al cierre de cada sesión, desde esta carpeta: `uv run python motor/snapshot.py --datos <prefijo>dashboard_data.json --etiqueta "Sesión N"`.

### Registro de recomendaciones (T18)

| Registro | Origen en T01 | Nota |
|---|---|---|
| `id`, `texto`, `destinatario` | `recomendaciones[]` | Al texto se añaden las iniciativas vinculadas. |
| `estado` | `estado` | `abierta` → pendiente · `en_curso` → en curso · `cerrada` → cumplida · `descartada`. |
| Sesión | `fecha` | Una sesión por fecha distinta. |
| Ámbito | Esfera principal de las iniciativas vinculadas | «General» si no hay. |
| Evidencia | `evidencia` | |
| Enlace al panel | Inventario, si hay iniciativas vinculadas | |
| Fecha comprometida, valoración del consejo asesor | — | Sin dato. |

## Qué de T01 no llega al panel

Decisiones y criterios de *gate*, condiciones, evidencias, iteraciones, esperas, plazos y estancadas, T04 y T05, métricas del embudo (conversión, tiempo de decisión, valor ponderado, cohortes), riesgos, no conformidades, proveedores (salvo el nombre), sistemas (salvo su código en `seveng`) y personas (salvo los nombres de responsables y decisores). El motor actual no tiene dónde mostrarlos; la fase, el estado, la intensidad, las esferas y la ambición viajan en `casos[].seveng` para cuando el motor los lea (`PROPUESTA_MOTOR.md`).

## Limitaciones conocidas

- **Motor heredado.** `motor/` es la copia del motor publicado en *AI en el Consejo* a 17-09-2026 (versión de datos 6) y desde entonces evoluciona aquí, con independencia de aquel repositorio. Conserva claves y rótulos pensados para el consejo asesor; `PROPUESTA_MOTOR.md` recoge lo pendiente.
- **Aviso legal en el móvil.** El motor no muestra `meta.textos` en el panel móvil. `publicacion_panel.py` añade el aviso al HTML ya generado, antes del pie, sin cambiar los datos ni la huella. En el panel completo el aviso va en la banda de avisos de la cabecera (`aviso_previo`) y, en versión corta, en el pie.
- **`tags.riesgo`.** El panel la rotula como estimación del consejo asesor; aquí es la clasificación registrada en T01.
- **Estado «estimado».** El panel lo atribuye al consejo asesor; en T01 lo estima el equipo. El aviso de valor lo aclara.
- **Una tecnología por caso** en los filtros; la lista completa está en la ficha (`detalle.tipo`).
- **Textos en español**, como el motor; la página del conector y los README están en español e inglés.

## Licencia

Código bajo licencia **MIT**, incluido el motor de `motor/` (derivado de [AI en el Consejo](https://github.com/Seachad-TEAM/AI_en_el_consejo), MIT, mismo autor). Contenidos (documentación, página del conector y datos de ejemplo) bajo **CC BY 4.0**.

© 2026 Fernando García · SEACHAD · Metodología SEVEN-G
