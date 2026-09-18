# Esquema de datos de los paneles

Todo lo que muestran los dos paneles (completo y móvil) sale de un único JSON. `null` significa «sin dato» y el panel lo muestra así: no se inventan valores. Importes en euros, porcentajes de 0 a 100, fechas `AAAA-MM-DD`.

Se genera con `generar(datos, carpeta)` de `build_dashboard.py`. Los dos HTML llevan la misma huella de datos (`<meta name="panel-datos">`) y el mismo número de versión.

## `meta`: identidad y textos

| Campo | Contenido |
|---|---|
| `organizacion`, `consejo_sigla`, `compania_principal` | Nombre del grupo, siglas del consejo asesor y compañía que se muestra primero. |
| `generado`, `ejercicio_valor`, `periodo.etiqueta` | Fecha de los datos, ejercicio del valor actual y texto del periodo. |
| `prefijo_ficheros` | Prefijo de los HTML generados (`<prefijo>Dashboard_Casos_Uso_IA_vN.html`, `<prefijo>Dashboard_Movil_IA_vN.html`). |
| `navegacion` | Opcional. Menú del panel completo: `pagina_todo` (`false` suprime la página «Todo»), `pagina_inicial` (`cartera`, `embudo`, `historico`, `riesgo`, `inventario` o `glosario`; por defecto «Todo») `desplegar_todo` (`true`: al entrar en una página, todas sus tarjetas se muestran desplegadas) y `filtros_modal` (`true`: los filtros se componen en un diálogo modal —se añaden campos y se eligen sus valores— y sobre el panel queda la consulta aplicada en píldoras, sin desplazar el contenido; por defecto, panel de filtros desplegable). |
| `umbrales_kpi` | Opcional. Umbrales del semáforo de los indicadores, en porcentaje: `valor_validado_pct`, `clasificados_compania_pct` y `controles_completos_pct`, cada uno con `amarillo` y `rojo` (por debajo de `amarillo`, amarillo; por debajo de `rojo`, rojo). Por defecto 50/20, 80/50 y 80/50. Se aplican en el panel completo y en el móvil. |
| `ciclo_vida` | Opcional. Reglas del ciclo de vida de los casos, como en un CRM (vista «Embudo y ciclo de vida»): `embudo` (etapas en orden), `ganado` (la etapa en producción), `salidas` (estados de pérdida y etapas desde las que se llega a cada uno), `fecha_de_estado` (fecha de `reporte_compania.fechas` equivalente a entrar en cada estado, para cuando falta el historial), `dias_limite` (días máximos por estado: un número, o por complejidad `baja`/`media`/`alta`/`sin_dato`; sin límite en producción y en las salidas) y `aviso_pct_limite` (desde qué % del límite se marca en amarillo; por encima, en rojo). Las claves de primer nivel que se informan sustituyen enteras a las del motor. Por defecto: Propuesto → Aprobado → POC → En desarrollo → En uso, con salidas No aprobado, Descartado y Desenganchado. |
| `mostrar_refs` | `false` oculta las referencias a identificadores de un registro de recomendaciones concreto. |
| `leer_json_servidor` | `false` impide que el panel, servido por HTTP, lea un `dashboard_data.json` de su carpeta. |
| `textos` | Textos de contexto opcionales: `aviso_previo`, `aviso_valor`, `pie`, `movimientos_vacio`, `agilidad_sin_fechas`, `backlog_sin_dato`, `adopcion_sin_telemetria`, `ref_guardarrailes`, `nota_concentracion`, `sin_que_es`, y etiquetas `ret_<concepto>` y `ef_<concepto>`. |
| `glosario_extra` | Términos propios de la organización: `[grupo, sigla, desarrollo, explicación, en_móvil]`. |

## `casos[]`

| Campo | Contenido |
|---|---|
| `id`, `nombre` | Identificador y nombre. |
| `que_es` | **Qué es y para qué se usa**, en una o dos frases. Sin ella no se puede valorar el caso; el panel avisa si falta. |
| `descripcion` | Observaciones del consejo asesor. |
| `compania`, `unidad`, `estado` | `estado`: una etapa de `meta.ciclo_vida.embudo` o una de sus `salidas`. Siempre se muestran `En uso`, `En desarrollo`, `POC` y `Desenganchado`; un estado que no esté en el ciclo de vida se admite, pero el panel lo señala como no previsto. |
| `inicio_estimado` | Año de puesta en producción estimado si la compañía no aporta la fecha. |
| `tags` | `tecnologia`, `naturaleza`, `exposicion`, `riesgo` (estimación según el Reglamento de IA), `funcion`, `prioridad` y, opcional, `ambicion`. Todas sirven de filtro. |
| `detalle` | `tipo`, `decision`, `datos`, `aiact`, `proveedores`, `valor_tipo`, `es_ia`, `acciones_estimadas_cati` (lectura, escritura o pagos, para agentes). |
| `economia` | Inversión, eficiencias y retorno (ver abajo). |
| `reporte_compania` | Lo que aporta la compañía (ver abajo). |

### `economia`: todo en euros, actual y potencial

Cada importe es un *item*: `importe`, `formula` (unidad física × valor unitario), `estado` (`validado`, `declarado` o `estimado_cati`), `fuente`, `fecha`, `atribucion`, `hipotesis`.

| Campo | Contenido |
|---|---|
| `inversion.construccion` | Inversión de construcción (una vez). |
| `inversion.recurrente_anual`, `inversion.desglose_recurrente` | Coste recurrente anual y su desglose: `personas`, `servicios`, `licencias`, `plataforma`, `infraestructura`, `cumplimiento`, `mantenimiento`. |
| `inversion.adicional_potencial`, `inversion.recurrente_potencial` | Inversión adicional para alcanzar el potencial y coste recurrente en régimen. |
| `eficiencias[]` | `{concepto, actual, potencial}`. Conceptos: `personas` (materializado), `capacidad_liberada` (**no suma en el neto**), `herramientas`, `siniestros`, `operativo`, `penalizaciones`. |
| `retorno[]` | `{concepto, actual, potencial}`. Conceptos: `venta_nueva`, `venta_cruzada`, `retencion`, `precio_margen`, `cobros`, `otros`. |
| `plazo_potencial`, `hipotesis_potencial`, `comparte_valor_con`, `clave_reparto`, `nota_caso` | Plazo e hipótesis del potencial, casos con riesgo de doble contabilidad, regla de imputación de plataforma compartida y nota libre. |

Cifras derivadas, iguales en `economia.py` y en el panel: **neto anual** = eficiencias materializadas + retorno − coste recurrente; **neto potencial**, igual con los potenciales; **neto adicional por euro** = (neto potencial − neto actual) / inversión adicional; **payback** = construcción / neto anual.

### `reporte_compania`

`propietario_negocio`, `responsable_tecnico`, `empresa_grupo`; `fechas` (`idea`, `aprobacion`, `inicio`, `piloto`, `produccion`, `ultima_revision`, `retirada`); `retirada` (`motivo`, `decisor`, `sustituto`); `tier_riesgo`; `clasificacion_ria` (`prohibido`, `alto_riesgo`, `transparencia`, `minimo`, `no_es_ia`); `controles` (`RIA`, `FRIA`, `DPIA`, `seguridad`, `MUC`, `IA_ofensiva`: `hecho`, `pendiente` o `no_aplica`); `valor_validado` (`base`, `objetivo`, `actual`, `metodo_atribucion`, `validado_por`, `fecha_validacion`, `recurrente`); `operacion` (contención, derivación, guardarraíl, QA humano, evals, red teaming, AUC, PSI, STP, precisión, usuarios, volumen, incidentes).

Ciclo de vida: `historial_estados`, lista de cambios de estado `{estado, fecha, fuente, nota}`, uno por cada vez que el caso entra en un estado, incluidas las vueltas atrás. El último debe coincidir con `estado`; si no, el panel lo marca como incoherente y no cuenta el tramo abierto. Si la lista está vacía, el panel reconstruye el recorrido con `fechas` (según `ciclo_vida.fecha_de_estado`) y lo indica; sin fechas no hay tiempos: nunca se estiman. El tramo abierto se mide hasta `meta.generado`. `complejidad` (`baja`, `media`, `alta`) elige el límite de días cuando `ciclo_vida.dias_limite` va por complejidad.

Para agentes, `agente`: `identidades`, `tipo_credenciales`, `minimo_privilegio`, `rotacion_secretos_dias`, `acciones`, `datos_accesibles`, `control_intencion` (IBAC), `validacion_humana_escrituras`, `kill_switch`, `logging_acciones_pct`, `prueba_prompt_injection_fecha`.

Para proveedores, `proveedor_dora`: `en_registro`, `criticidad`, `estrategia_salida`, `incidentes_proveedor_12m`.

## `seguimiento`

| Campo | Contenido |
|---|---|
| `movimientos[]` | Altas, retiradas y reevaluaciones: `fecha`, `tipo`, `caso`, `motivo`, `decisor`, `sustituto`. |
| `incidentes[]` | Datos del incidente: `fecha`, `caso`, `tipo`, `descripcion`, `resolucion_horas`, `rto_horas`. Origen y detección: `origen` (agente atacante externo, agente propio manipulado, proveedor, interno), `vector`, `horas_detectar`, `horas_contener`. Si hubo brecha: `brecha_datos_personales`, `afectados`, `notificacion_aepd_horas` (plazo de 72 h), `notificacion_dora`. |
| `adopcion` | Licencias y uso de las suites de productividad, conversaciones de la plataforma agéntica, shadow AI, controles técnicos, formación, vacantes y rotación. |
| `agilidad` | SLA por nivel de riesgo, vía rápida, aprobación a la primera, ciclo del comité y backlog. Los días idea → aprobación → producción se calculan de las fechas por caso. |
| `ia_ofensiva` | Exposición a ataques ejecutados con IA. Superficie: doble factor en aplicaciones expuestas, vulnerabilidades críticas, detección de tráfico automatizado. Agentes: identidades con permisos excesivos, claves sin rotar. Pruebas: prueba de intrusión con IA, éxito de la inyección de instrucciones, tratamientos con este riesgo analizado. Preparación: registro de acciones, runbook, simulacro y ensayo de notificación. |
| `cdm_compania` | Opcional: contraste con el cuadro de mando de valor de la propia compañía. Si falta, el bloque no se muestra. |

## `historico[]`

Una foto por sesión (`snapshot.py`): `fecha`, `etiqueta`, `casos_por_estado`, `totales` y, por caso, estado, fecha de producción y cifras derivadas. El panel compara los datos de hoy con cualquier foto: variaciones, casos nuevos o puestos en producción, retiradas, cambios de estado y tendencia.
