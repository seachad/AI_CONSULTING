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
| `umbrales_kpi` | Opcional. Umbrales del semáforo de los indicadores, en porcentaje: `valor_validado_pct`, `clasificados_compania_pct`, `controles_completos_pct`, `planes_realizacion_pct` (iniciativas en fases 3 a 7 con plan de realización) y `realizacion_pct` (realización acumulada F10), cada uno con `amarillo` y `rojo` (por debajo de `amarillo`, amarillo; por debajo de `rojo`, rojo). Por defecto 50/20, 80/50, 80/50, 80/50 y 90/70. Se aplican en el panel completo y en el móvil. |
| `ciclo_vida` | Opcional. Reglas del ciclo de vida de los casos, como en un CRM (vista «Embudo y ciclo de vida»): `embudo` (etapas en orden), `ganado` (la etapa en producción), `salidas` (estados de pérdida y etapas desde las que se llega a cada uno), `fecha_de_estado` (fecha de `reporte_compania.fechas` equivalente a entrar en cada estado, para cuando falta el historial), `dias_limite` (días máximos por estado: un número, o por complejidad `baja`/`media`/`alta`/`sin_dato`; sin límite en producción y en las salidas) y `aviso_pct_limite` (desde qué % del límite se marca en amarillo; por encima, en rojo). Las claves de primer nivel que se informan sustituyen enteras a las del motor. Por defecto: Propuesto → Aprobado → POC → En desarrollo → En uso, con salidas No aprobado, Descartado y Desenganchado. |
| `mostrar_refs` | `false` oculta las referencias a identificadores de un registro de recomendaciones concreto. |
| `leer_json_servidor` | `false` impide que el panel, servido por HTTP, lea un `dashboard_data.json` de su carpeta. |
| `textos` | Textos de contexto opcionales: `aviso_previo`, `aviso_valor`, `pie`, `movimientos_vacio`, `agilidad_sin_fechas`, `backlog_sin_dato`, `adopcion_sin_telemetria`, `ref_guardarrailes`, `nota_concentracion`, `sin_que_es`, y etiquetas `ret_<concepto>` y `ef_<concepto>`. |
| `glosario_extra` | Términos propios de la organización: `[grupo, sigla, desarrollo, explicación, en_móvil]`. |
| `mapa_impacto` | Opcional (D127). Mapa de calor esferas × niveles de ambición (T16, documento 10 §8) de la tarjeta «Dónde está el impacto»: `filas` (esferas de valor en su orden; sin ella, las de `tags.funcion`), `habilitacion` (esferas de la banda de habilitación, fuera del total), `objetivo_c2` (ambición objetivo por esfera, por código o etiqueta: `Optimizar`, `Aumentar`, `Transformar` o `no_prioritaria`), `umbrales` (`baja`, `alta`, en %), `meses_retiradas` y `objetivo_fuente` (código de la decisión del registro T01 de la que sale `objetivo_c2`, si la pone el conector; D131). |
| `curva_valor` | Opcional (D135). Plan de realización: curva y tramos (documento 43 §4.1, 14 §6.2 y 40 §8): `granularidad` (periodo por defecto de la curva: `anual`, `semestral` o `trimestral`; el panel deja cambiarlo y el cálculo es trimestral), `horizonte` (`desde`, `hasta`: años que se muestran), `estimar_sin_curva` (`false` en SEVEN-G: un caso sin `economia.curva` no tiene curva y cuenta como «sin plan»; con `true`, el motor la estima con reglas fijas y la marca), `horizonte_van_anios` y `tasa_descuento_anual_pct` (H y r del VAN F7 aprobados en C2; sin tasa, r = 0), y las reglas de la estimación (`rampa_sin_plazo_trimestres`, `produccion_sin_fecha_trimestres`), que SEVEN-G no usa. |
| `gobierno` | Opcional (D148). Coste del propio gobierno (documento 41, IND-COS-12 a 14): `coste_hora` (coste por hora de gobierno de C2) y `objetivo_pct` (`{express, lite, enterprise}`: coste máximo del gobierno sobre la inversión, en %). Lo escribe el conector desde `meta.configuracion` de T01; con `casos[].seveng.gobierno`, el motor dibuja la tarjeta «Coste del gobierno». Las horas nunca se estiman. |
| `frenos_escalado` | Opcional (D126). Lectura «Qué frena el escalado» (documento 60 §10.4): `umbral_madurez` (por defecto 2), `meses_patron` (12), `motivos` (texto del motivo de parada → `FE-1`…`FE-6`) y `textos` (por freno: `nombre`, `accion`, `resp`, `donde`). |

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
| `alcance` | Opcional: solo en iniciativas transversales o plataformas habilitadoras; sin él, el caso es de una unidad y el panel no cambia. `tipo` (`transversal` o `plataforma`), `umbral_adopcion_pct` (licencias activas sobre asignadas por debajo del cual una unidad en uso se marca), `habilita` (plataforma: `[{id, nombre}]` de los casos a los que se imputa su valor) y `unidades` (transversal: una fila por unidad de negocio con `unidad`, `estado` —`previsto`, `piloto`, `en_uso`, `retirado`—, `desde`, `licencias_asignadas`, `licencias_activas`, `usuarios_activos_semanales`, `horas_liberadas_mes`, `coste_anual`, `coste_previsto`, `valor_materializado`, `valor_validado`, `capacidad_liberada`, `fuente`, `fecha_dato`; una fila con `unidad` null recoge lo común). Con él, el panel muestra en «Cartera y valor» la tarjeta de iniciativas transversales y plataformas (con el neto de la cartera con y sin ellas), el desglose por unidad en la ficha económica, el filtro «Alcance» (`tags.alcance`) y, en el móvil, la lista por unidad y la alerta de adopción baja. Los importes del caso (`economia`) ya incluyen todas sus unidades: el desglose no suma dos veces. |
| `seveng` | Opcional: bloque que escribe el conector de T01 (`fase`, `esfera_principal`, `esfera_secundaria`, `ambicion` con `propuesta`, `confirmada` y `real`, `intensidad`, `autonomia`…). El motor solo lee `fase` (perímetro del mapa de impacto: G0 superado; y superar G2 para la marca de brecha), `esfera_secundaria`, si la ambición es solo propuesta, `intensidad` y, opcional (D148), `gobierno` (`horas` declaradas en las decisiones de gate o `null`, `decisiones`, `decisiones_con_horas`, `evidencias`, `evidencias_referenciadas`) para la tarjeta «Coste del gobierno» y, opcional (D150), `perspectivas` (`resultado_operativo[]` con `indicador`, `nombre`, `unidad`, `sentido`, `base`, `fecha_base`, `objetivo`, `actual`, `fecha_actual` y `fuente`; `riesgos_altos_abiertos`, `incidentes_abiertos` y `no_conformidades_abiertas`) para el bloque «Tres perspectivas del caso» de la ficha (documento 40 §11.1, regla 11); sin él, usa la etapa del embudo. |

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
| `curva` | Opcional (D135). Plan de realización del caso, que el conector toma de `iniciativas[].plan_realizacion` de T01: `estado`, `fuente`, `fecha`; `tramos[]` (`id`, `fecha` AAAA-MM, `importe`, `estado`, `alcance`, `gate`, `condicion_paso`, `situacion` —`ejecutado`, `comprometido`, `previsto` u `opcional`, que no suma—, `captura_objetivo_pct`); `captura` (`{periodo: %}` del valor anual en régimen; periodos `AAAA`, `AAAA-Sn` o `AAAA-Tn`; lineal entre puntos, antes del primero 0, después del último el último); `fecha_regimen`; `referencia` (`{fecha, captura}`, curva aprobada con la que se mide la realización F10); `real` (`{periodo: {importe, estado}}`, valor realizado del periodo); `declive` (`{desde, pct_anual}`). El valor en régimen es el de los potenciales (eficiencias + retorno); el coste recurrente es el actual hasta el nivel de hoy y sube en proporción hasta el de régimen. |

Cifras derivadas, iguales en `economia.py` y en el panel: **neto anual** = eficiencias materializadas + retorno − coste recurrente; **neto potencial**, igual con los potenciales; **neto adicional por euro** = (neto potencial − neto actual) / inversión adicional; **payback** = construcción / neto anual. Con `curva` (D135), por caso: serie trimestral de inversión, valor, coste, neto y acumulado; VAN F7 (flujos anuales descontados con r desde el año del primer tramo, t = 0, hasta t = H), recuperación F9 sobre el acumulado (informativa), caja máxima y caja por delante, inversión de los próximos 12 meses, neto anual que desbloquea cada tramo y su F3, y realización F10 acumulada (en total y solo validada). La cartera suma las curvas de los casos con plan.

### `reporte_compania`

`propietario_negocio`, `responsable_tecnico`, `empresa_grupo`; `fechas` (`idea`, `aprobacion`, `inicio`, `piloto`, `produccion`, `ultima_revision`, `retirada`); `retirada` (`motivo`, `decisor`, `sustituto` y, opcional, `lecciones`: el embudo muestra en la tarjeta de cada caso perdido o desenganchado por qué salió y qué se aprendió, y avisa si el motivo no consta); `tier_riesgo`; `clasificacion_ria` (`prohibido`, `alto_riesgo`, `transparencia`, `minimo`, `no_es_ia`); `controles` (`RIA`, `FRIA`, `DPIA`, `seguridad`, `MUC`, `IA_ofensiva`: `hecho`, `pendiente` o `no_aplica`); `valor_validado` (`base`, `objetivo`, `actual`, `metodo_atribucion`, `validado_por`, `fecha_validacion`, `recurrente`); `operacion` (contención, derivación, guardarraíl, QA humano, evals, red teaming, AUC, PSI, STP, precisión, usuarios, volumen, incidentes); opcional (D135), `valor_no_monetario` (valor no cuantificado, documento 40 regla 7 y §5.3: `[{dimension, nivel, indicador, base, objetivo, actual, estado, efecto_desde, nota}]`, con `dimension` `imagen`, `posicionamiento`, `cliente`, `distribucion`, `talento` u `opcion`, `nivel` de 0 a 3, `indicador` la métrica física y `nota` el motivo; nunca en euros; sin métrica no cuenta) y `revision_estrategica` (la próxima R6, `ciclo.proxima_revision` de T01): un caso en producción (`seveng.fase` ≥ 6) con nivel medio o alto y VAN F7 negativo o sin plan es «sostenido por valor no cuantificado» y el panel avisa si la revisión falta o ha vencido.

Ciclo de vida: `historial_estados`, lista de cambios de estado `{estado, fecha, fuente, nota}` y, opcional, `cifras` (`previsto` y `actual`, cada uno con `inversion`, `recurrente`, `eficiencias` y `retorno`: las cifras del caso al entrar en ese estado, que el panel muestra en el ciclo de vida de la ficha y en las tarjetas de los casos que salieron del embudo), uno por cada vez que el caso entra en un estado, incluidas las vueltas atrás. El último debe coincidir con `estado`; si no, el panel lo marca como incoherente y no cuenta el tramo abierto. Si la lista está vacía, el panel reconstruye el recorrido con `fechas` (según `ciclo_vida.fecha_de_estado`) y lo indica; sin fechas no hay tiempos: nunca se estiman. El tramo abierto se mide hasta `meta.generado`. `complejidad` (`baja`, `media`, `alta`) elige el límite de días cuando `ciclo_vida.dias_limite` va por complejidad.

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

## `indice` (opcional)

Índice de transformación de la compañía calculado por la calculadora T14 de SEVEN-G (documento 12). Si falta, la tarjeta no se muestra. No depende de los filtros.

| Campo | Contenido |
|---|---|
| `fecha_corte`, `tipo`, `version_umbrales` | Fecha de corte, tipo de cálculo (formal, seguimiento, extraordinario) y versión de umbrales. |
| `perfil_asignado`, `perfil_evidenciado`, `perfil_subyacente` | `curso`, `escala`, `tactica`, `exploracion` o `declarada` (transformación declarada, no evidenciada). |
| `provisional`, `cobertura`, `suma` | Perfil provisional si la cobertura es inferior a 6 de 8; señales con dato; suma de 0 a 24. |
| `condiciones_base` | `B1`, `B2` y `B3`, verdadero o falso. |
| `senales[]` | `senal` (1 a 8), `valor` (porcentaje; en la 7, conversión relativa; en la 8, número de apuestas), `puntuacion` (0 a 3), `sin_dato`. |
| `alertas[]`, `perfil_objetivo`, `mover[]` | Códigos de las alertas del documento 12 §5.3 y condiciones que moverían el perfil hacia el objetivo. |
| `anterior` | El cálculo anterior con los mismos campos, para la tendencia; `null` si no lo hay. |

## `madurez` (opcional)

Diagnóstico de madurez de la compañía (documento 11 de SEVEN-G, diagnóstico T15), que el conector toma del registro T01 (esquema 0.6; desde el 0.7 puede traer `perfiles`, el resumen de los perfiles NIST del último diagnóstico, que la tarjeta muestra en una tabla aparte y el móvil en una lista, y desde el 0.8 `lentes`, la madurez en tres lentes; claves opcionales). Si falta, la tarjeta «Madurez de la compañía (D1–D7)» del panel completo y el bloque del móvil no se muestran. No depende de los filtros y el motor no recalcula nada: solo lee el bloque.

| Campo | Contenido |
|---|---|
| `id`, `fecha_corte`, `ciclo`, `version_cuestionario` | Identificador del diagnóstico (`EM-AAAA-NN`), fecha de corte, ciclo corporativo en que se hizo (`C1`, `C5`…) y versión del cuestionario del documento 11. |
| `modalidad`, `verificador`, `organo_aprobacion` | `autodiagnostico`, `verificada` o `independiente`; quién verificó y qué órgano aprobó el resultado. Un autodiagnóstico se muestra con el rótulo «autoevaluación no verificada: no vale para el consejo» (11 §4.1). |
| `validez`, `declaracion_posible` | `auto` (autodiagnóstico), `pend` (verificación incompleta) u `ok`; y si procede la declaración de aplicación de SEVEN-G (11 §7.3). |
| `nivel_global`, `nivel_minimo`, `media`, `tope`, `tope_aplicado`, `limitante[]` | Nivel global 0–5 (`null` si hay preguntas sin responder que bloquean el cálculo: se muestra «sin dato» y `nivel_minimo` como mínimo garantizado), media ponderada, tope min(D1, D6) + 1, si se aplicó y qué dimensiones lo imponen. |
| `dimensiones[]` | Una por dimensión D1–D7: `dimension`, `nombre`, `nivel` (0–5 o `null`), `avance` (porcentaje hacia el nivel siguiente, o `null`) y `bloqueantes[]` (códigos de los criterios que impiden subir). |
| `perfiles` | Opcional (esquema 0.7, D115): resumen de los perfiles NIST (`ai_rmf`, `csf`) con `funciones[]`, `areas[]` (solo CSF) y `total` (`subcategorias`, `con_nivel`, `minimo`, `frecuente`, `con_objetivo`, `con_brecha`). |
| `lentes` | Opcional (esquema 0.8, D120; documentos 11 §7.6 y 12 §3.7): `fuente` (`t01` o `manual`); `huella` (`nivel` HT0–HT5 más alto en uso, `amplitud` —tipos de tecnología—, `tipos[]`, `sistemas_en_uso`, `iniciativas_en_uso`, `pilotos` —iniciativas en fases 1 a 5— y `nivel_exploracion`); `alcance` (iniciativas en uso por nivel `IM1`–`IM4`); `exigible` (gobierno mínimo exigible por la huella, por dimensión) y `alertas[]` (`codigo`: `adopcion_por_delante`, `gobierno_sin_uso` o `transformacion_sin_personas`; `gravedad`: `alta` o `media`; y, si procede, `dimension`, `nivel`, `minimo` o `maximo`). La tarjeta lo muestra en la tabla «Madurez en tres lentes» y el móvil con una línea por lente y las alertas. La huella y el alcance no cambian el nivel de madurez. |
| `anterior` | El diagnóstico anterior (`id`, `fecha_corte`, `modalidad`, `nivel_global`, `dimensiones[]` con `dimension` y `nivel`) para la tendencia; `null` si no lo hay. |

Niveles: 0 Inexistente · 1 Inicial · 2 En desarrollo · 3 Definido · 4 Gestionado · 5 Optimizado.

## `historico[]`

Una foto por sesión (`snapshot.py`): `fecha`, `etiqueta`, `casos_por_estado`, `totales` y, por caso, estado, fecha de producción y cifras derivadas. El panel compara los datos de hoy con cualquier foto: variaciones, casos nuevos o puestos en producción, retiradas, cambios de estado y tendencia.
