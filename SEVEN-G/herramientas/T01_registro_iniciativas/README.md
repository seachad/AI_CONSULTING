# T01 · Registro de iniciativas

## Aviso legal y exención de responsabilidad

SEVEN-G y esta herramienta se ofrecen «tal cual» y con fines exclusivamente informativos. No constituyen asesoramiento jurídico, regulatorio, financiero ni profesional, ni garantizan el cumplimiento de ninguna norma. Los criterios, clasificaciones y referencias a regulación general (Reglamento Europeo de IA, RGPD, DORA, NIS2…) o sectorial pueden ser incompletos, no aplicar a un caso concreto o quedar desactualizados por cambios normativos. Cada organización que use la herramienta es la única responsable de identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio, con el asesoramiento cualificado que corresponda. El autor y SEACHAD no asumen responsabilidad alguna por el uso de la herramienta ni por las decisiones adoptadas con ella. Los datos de demostración son ficticios.

En la interfaz, este aviso figura en el pie de todas las vistas, se muestra destacado en la primera carga (al descartarlo se recuerda en el navegador) y está siempre accesible desde el enlace «Aviso legal» de la cabecera y del pie. Junto a la clasificación regulatoria (ficha, alta y edición, inventario T02 y determinación de intensidad T04) se indica que es orientativa y que debe realizarla la organización con criterio jurídico cualificado.

Herramienta de referencia de **SEVEN-G** (ola 1 · núcleo) para gestionar la cartera de IA como un embudo: fases, estados, eventos con fecha, criterios de *gate*, condiciones, valor y métricas. Incluye como módulos **T02** (inventario de sistemas de IA), **T03** (gestor de *gates*), **T04** (determinación de intensidad) y **T05** (clasificador de ambición).

Especificación: documento 03 (§3 y §4), documento 01 (§6–§9), documento 00 (§5.2 y §6) y documento 21 (criterios de *gate*).

## Ficheros

| Fichero | Contenido |
|---|---|
| `registro.html` | Aplicación completa en un único fichero (HTML, CSS y JavaScript sin dependencias). Lleva embebidos el catálogo de 128 criterios del documento 21 y los datos de demostración. |
| `esquema_registro.schema.json` | JSON Schema 2020-12 del modelo de datos común (03 §4), con listas cerradas y patrones de código. |
| `datos_demo.json` | Los mismos datos de demostración embebidos en la aplicación, válidos contra el esquema. |
| `README.md` · `README_en.md` | Este documento, en español e inglés. |

## Cómo se abre

1. Doble clic en `registro.html`. Funciona desde el disco (`file://`), sin servidor, sin instalación y sin conexión.
2. La primera vez se cargan los datos de demostración. A partir de ahí, cada cambio se guarda automáticamente en el almacenamiento local del navegador (`localStorage`), asociado a ese navegador y a esa ruta de fichero.
3. Arriba a la derecha se elige idioma (ES/EN) y tema (automático, claro u oscuro). La preferencia se recuerda.
4. En **Datos** se fija la *fecha de referencia* (fecha de corte para días y alertas). Los datos de demostración la fijan en 16-09-2026; vacía significa «hoy».

La aplicación no envía datos a terceros ni carga recursos externos (usa las fuentes del sistema; no se enlaza Google Fonts para no ceder datos de navegación).

## Vistas (03 §3.7)

| Vista | Qué hace |
|---|---|
| **Embudo** | Indicadores de cartera, embudo por fase con desglose por estado, estancadas y valor esperado, y tabla de iniciativas con días en fase frente al plazo y alertas. Filtros por esfera, ambición, intensidad, clasificación regulatoria, tecnología, exposición, tipo de valor, área, estado, fase, proveedor, etiqueta libre y texto. |
| **Tablero** | Tarjetas por fase (0–7) y columna de cerradas. Las tarjetas cambian de columna cuando se registra la decisión del *gate*. |
| **Ficha** | Pestañas: resumen (identificación, responsables con incompatibilidades, clasificación, ciclo de vida, valor, riesgo y cumplimiento), *gate* en curso (T03), condiciones, valor (validado, declarado o estimado), línea de tiempo de eventos e historial de *gates* con sus criterios. |
| **Gates pendientes** | Solicitudes a la espera de verificación o decisión, con días hábiles frente al plazo, bloqueantes y evidencias sin verificar; revisiones de continuidad próximas o caducadas. |
| **Alertas** | Estancadas, decisión fuera de plazo, condiciones vencidas, revisiones de continuidad caducadas, evidencias pendientes de verificación, tercera iteración (elevación), reanudación vencida, roles incompatibles y no conformidades fuera de plazo. |
| **Análisis** | Métricas de 03 §3.5 segmentables con los filtros (ver más abajo). |
| **Inventario (T02)** | Sistemas propios, de terceros y de uso corporativo, con clasificación, intensidad, autonomía, proveedores, responsable y revisión; avisos de coherencia con el registro. |
| **Datos** | Importación y exportación, preferencias, plazos de referencia (C2/C5), personas y proveedores. |

## Reglas que aplica la herramienta

**Eventos.** Toda modificación (alta, entrada y salida de fase, solicitud, verificación, decisión, elevación, condiciones, espera y reanudación, cambios de clasificación, edición de campos, valor, evidencias, retirada) genera un evento con fecha del hecho, autor, motivo obligatorio y, cuando procede, campo, valor anterior y nuevo. Los eventos no se editan ni se borran desde la interfaz.

**Gestor de gates (T03).**
- Catálogo embebido de los criterios G0.01–G7.12 y R6.01–R6.16 del documento 21, en español e inglés (texto y nota por ambición de las versiones española e inglesa del documento, con los mismos códigos), con obligatoriedad (Sí, Sí ◆, Condicionable; «Rec.» en la columna de intensidad se trata como recomendado), aplicación Lite/Enterprise y nota por ambición.
- *No aplica* automático y justificado por intensidad, etiquetas [GEN], [AG] y [TER], criterios solo de Transformar y criterios de resultado (Escalar, Iterar, Retirar) según el resultado propuesto. Un *No aplica* manual sin justificación se trata como *No cumple*.
- Grado de cumplimiento (cumplen ÷ aplicables), bloqueantes, condicionables abiertos y recomendados omitidos.
- Impide **Continuar** (y Continuar la operación o Escalar) con obligatorios en *No cumple* o *Pendiente*, o con condicionables abiertos; **Continuar con condiciones** solo sobre condicionables abiertos y sin bloqueantes; ningún resultado sin verificación conforme; solo **Parar** con práctica prohibida (G3.08); con condiciones vencidas no cabe continuar; en G5 Enterprise, continuar exige las cuatro firmas conformes y sin veto.
- Separación de funciones: el verificador no puede ser patrocinador ni del equipo (producto, técnico, operación) ni autor de evidencias; el decisor no puede ser del equipo, ni el verificador, ni autor de evidencias; en Lite G3–G5 exige conformidad de riesgos de alguien ajeno al equipo.
- A partir de la tercera decisión en el mismo *gate* obliga a marcar la elevación y a elegir órgano superior o consejo; en Transformar, G2 (continuar) y G7 (escalar) exigen decisión del consejo.
- Condiciones con descripción, responsable, plazo posterior a la decisión y forma de verificación; alerta al vencer; se pueden marcar cumplidas, anuladas o vencidas.
- Resultados por puerta (21 §5.3): G0 y G4–G5 sin Pivotar; G1–G3 con Pivotar (vuelta a la fase 2); **R6**: Continuar la operación · Continuar con condiciones · Adelantar G7 (casilla de desviación que obliga a adelantar); **G7**: Escalar (vuelve a fase 6 y abre el alta de la nueva iniciativa de alcance ampliado) · Iterar (fase de vuelta, por defecto 6) · Retirar (motivo codificado, plan ejecutado o pendiente de registrar).
- Quién verifica y decide según 01 §7.5 (en Lite, G3–G5: patrocinador con conformidad de riesgos).

**T04 · Intensidad.** Ocho criterios de 01 §9.2 con Sí/No/Sin dato; basta uno para Enterprise. Si no hay ningún sí pero hay criterios sin dato, el resultado se marca como Lite provisional.

**T05 · Ambición.** Cinco preguntas de 00 §5.2: 1 o 4 → Transformar; 2 o 3 → Aumentar; 1–4 negativas → Optimizar. Según el momento actualiza la ambición propuesta (fase 1), confirmada (fase 2) o real (fase 7). Transformar fuerza intensidad Enterprise.

**Espera.** Requiere causa (presupuesto, dependencia, proveedor, datos u otra) y fecha prevista de reanudación; el tiempo en espera no cuenta en el tiempo en fase.

**«Sin dato» no es cero.** Los importes vacíos se guardan como `null`, se muestran como «Sin dato», no suman y se cuentan aparte. El valor neto anual es eficiencias + retorno − coste recurrente y solo se calcula si hay al menos un beneficio y el coste recurrente con importe; la capacidad liberada, el riesgo evitado y el cumplimiento no suman.

## Métricas del análisis (03 §3.5)

| Métrica | Cálculo |
|---|---|
| Tiempo en fase | Intervalos entre eventos `entrada_fase` y `salida_fase`, menos los días entre `espera_inicio` y `espera_fin`. Mediana y percentil 80 (interpolación lineal) de los intervalos cerrados; se indican los que están en curso. |
| Tiempo de decisión | Días hábiles (lunes a viernes, sin festivos) entre `fecha_solicitud` y `fecha_decision`, por *gate*. |
| Tiempo hasta producción | Días naturales registro → primera decisión G3 que continúa → primera entrada en fase 6. |
| Conversión por gate | Distribución de resultados; «continúan» = Continuar, Continuar con condiciones, Continuar la operación y Escalar. |
| Iteraciones por gate | Media y máximo de iteraciones previas en las decisiones finales (resultado distinto de Iterar). |
| Cumplimiento | Grado medio por *gate* de las decisiones tomadas y criterios que más veces bloquean. |
| Estancadas | Días en fase sin espera por encima del plazo de referencia de la fase y la intensidad (la fase 6 no tiene plazo). |
| Tiempo en espera y motivos de parada/retirada | Episodios y días por causa; distribución de motivos codificados. |
| Mezcla de ambición y valor por fase | Iniciativas activas por fase según ambición confirmada (o propuesta) y suma de su valor esperado con recuento aparte de las que no tienen dato. |
| Valor ponderado | Para las fases 0–5: valor esperado × probabilidad histórica de llegar a producción (iniciativas del registro que pasaron por la fase y llegaron a producción ÷ las resueltas, en producción o cerradas). Solo se muestra si hay al menos `historial_minimo_ponderado` resueltas (5 por defecto); el valor de las fases sin historial se informa como excluido. |
| Cohortes | Por trimestre de registro: registradas, superan G3, llegan a producción, cerradas sin producción y mediana hasta producción. |

## Importar y exportar

- **Exportar JSON completo**: todo el registro en el formato de `esquema_registro.schema.json`. Es la copia de seguridad y el medio para compartir datos. Incluye el campo raíz `aviso_legal` con el aviso legal en el idioma de la interfaz.
- **Exportar CSV de iniciativas**: una fila por iniciativa con clasificación, ciclo de vida, responsables, valor, condiciones, cierre y alertas. Separador punto y coma, UTF-8 con BOM; listas separadas por `|`; celda vacía = sin dato; los códigos de las listas cerradas se exportan sin traducir. **No incluye el aviso legal**: el CSV no admite líneas de comentario y una primera línea añadida rompería la cabecera al abrirlo en una hoja de cálculo o importarlo; quien distribuya el CSV debe acompañarlo del aviso.
- **Exportar JSON para el panel del consejo**: estructura de `AI_en_el_consejo/motor/ESQUEMA.md` (ver correspondencia). Como el esquema del panel no prevé un campo raíz para el aviso, este va en `meta.textos.aviso_previo` (el panel lo muestra en su aviso inicial) y, además, en `seveng_t01.aviso_legal`; siempre en español, como el resto del panel.
- **Importar JSON**: selector de fichero; se valida (estructura, patrones de código, listas cerradas, fechas, referencias y resultados admitidos por *gate*) y, si no hay errores, se pide confirmación y se sustituyen los datos actuales. No fusiona registros.
- **Restaurar demostración** y **borrar datos locales** piden confirmación.

## Modelo de datos

Un único objeto JSON con `version_esquema` (`0.1`), `aviso_legal` (texto, opcional al importar), `meta` (organización, fecha de referencia, moneda, configuración de plazos) y una lista por entidad de 03 §4. `null` significa «sin dato». Fechas `AAAA-MM-DD`.

| Lista | Entidad | Código |
|---|---|---|
| `iniciativas` | Iniciativa: identificación, responsables, clasificación (taxonomía controlada), T04, T05, ciclo de vida (fase, estado, entrada, iteración, espera, próxima revisión), cierre, riesgo residual, evaluaciones de impacto, inversión, etiquetas libres, sistemas | `IA-AAAA-NNN` |
| `sistemas` | Sistema de IA (T02) | `SIA-AAAA-NNN` |
| `eventos` | Evento con fecha, autor, motivo y cambio | `EVT-NNNNNN` |
| `decisiones_gate` | Solicitud, verificación, decisión, órgano, elevación, resultado propuesto y resultado, firmas G5, criterios evaluados (`codigo`, `estado`, `justificacion`, `evidencias`) | `DG-AAAA-NNN` |
| `condiciones` | Condición con decisión, criterio, responsable, plazo, verificación y estado | `CND-AAAA-NNN` |
| `evidencias` | Enlace, plantilla, versión, autor, fecha y verificación (se enlaza, no se copia) | `EVI-AAAA-NNNN` |
| `valores` | Importe esperado o realizado por tipo, fórmula, estado (validado, declarado, estimado), periodo y fuente | `VAL-NNNN` |
| `riesgos` · `no_conformidades` · `incidentes` · `proveedores` · `recomendaciones` | Entidades relacionadas (en esta versión se muestran y se exportan; su gestión completa corresponde a T06, T08, T09 y T18) | `IA-AAAA-NNN · Rnn` · `NC-AAAA-NNN` · `INC-AAAA-NNN` · `PRV-NNN` · `REC-AAAA-NNN` |
| `personas` | Personas asignables a roles, verificación, decisión y condiciones | `PER-NN` |

Listas cerradas (valores en el esquema): esfera `01`–`09`; ambición `optimizar · aumentar · transformar`; intensidad `lite · enterprise`; clasificación regulatoria `prohibido · alto_riesgo · transparencia · riesgo_minimo · fuera_ambito · pendiente`; tecnología `ml_predictivo · ia_generativa · agente · lenguaje_documentos · vision · optimizacion · ia_terceros_embebida · reglas`; exposición `interna · empleados · clientes_indirecta · clientes_directa`; tipo de valor `eficiencia · retorno · riesgo_evitado · cumplimiento`; motivo de parada o retirada (10 códigos); estados (8); resultados (9); estados de criterio (4); tipos de evento (18); autonomía `A0`–`A3`.

## Correspondencia con el panel del consejo (T17)

| Panel (`ESQUEMA.md`) | Origen en T01 |
|---|---|
| `casos[].id`, `nombre`, `que_es`, `unidad` | `id`, `nombre`, `descripcion`, `area` |
| `casos[].estado` | Aproximación: fase 6–7 → `En uso`; fase 5 → `POC`; fases 0–4 → `En desarrollo`; parada o retirada → `Desenganchado` |
| `tags.tecnologia`, `exposicion`, `riesgo`, `funcion`, `ambicion` | Etiquetas de tecnología, exposición, clasificación regulatoria, esfera principal y ambición (confirmada o propuesta), en español |
| `detalle.aiact`, `proveedores`, `valor_tipo`, `es_ia` | Clasificación regulatoria, nombres de proveedores, tipos de valor, tecnología distinta de «Reglas» |
| `economia.inversion.construccion` / `recurrente_anual` / `recurrente_potencial` / `adicional_potencial` | Valor `inversion` (realizado o esperado) / `coste_recurrente` realizado / `coste_recurrente` esperado / `inversion.pendiente` |
| `economia.eficiencias[]`, `retorno[]` | `eficiencias` → concepto `operativo`; `capacidad_liberada` → `capacidad_liberada`; `retorno` → `otros` (realizado = `actual`, esperado = `potencial`) |
| Estado de cada importe | `validado` y `declarado` iguales; `estimado` → `estimado_cati` |
| `reporte_compania.propietario_negocio`, `responsable_tecnico` | Patrocinador y responsable técnico |
| `fechas.idea`, `inicio`, `aprobacion`, `piloto`, `produccion`, `ultima_revision`, `retirada` | Registro, G0 aprobado, G3 aprobado, entrada en fase 5, entrada en fase 6, última R6, fecha de retirada |
| `retirada`, `tier_riesgo`, `clasificacion_ria`, `controles.DPIA`/`FRIA` | Cierre (motivo, órgano, sustituto), riesgo residual principal, clasificación (`fuera_ambito` → `no_es_ia`; `pendiente` → `null`), evaluaciones EIPD y de derechos fundamentales |
| `seguimiento.movimientos[]` | Eventos `alta`, `parada`, `retirada` y `cambio_clasificacion` |
| `seguimiento.incidentes[]` | `incidentes` (tipo = severidad S1–S4) |

**Lo que no mapea.**
- Del panel, sin origen en T01 (se exportan `null` o vacíos): `descripcion` (observaciones del consejo), `inicio_estimado`, `tags.naturaleza` y `prioridad`, `detalle.tipo`, `decision`, `datos` y `acciones_estimadas_cati`, `desglose_recurrente`, `plazo_potencial`, `comparte_valor_con`, `clave_reparto`, `valor_validado` (base, objetivo, actual), `operacion`, `agente`, `proveedor_dora`, `controles.RIA`, `seguridad`, `MUC` e `IA_ofensiva`, `seguimiento.adopcion`, `agilidad`, `ia_ofensiva`, `cdm_compania` e `historico`.
- De T01, sin campo en el panel: fase y estado SEVEN-G, iteraciones, decisiones y criterios de *gate*, condiciones, evidencias, eventos distintos de los movimientos, T04 y T05, plazos, estancadas, alertas, probabilidad histórica y valor ponderado, y los importes de `riesgo_evitado` y `cumplimiento`. Un resumen del embudo se añade en el bloque `seveng_t01`, que el panel actual no lee.
- Los conceptos de eficiencias y retorno del panel son más finos que los tipos de T01; la exportación no los desglosa.

## Datos de demostración

Compañía ficticia (*Compañía Ejemplo Industrial, S.A.*), 21 personas y 4 proveedores ficticios, 14 iniciativas registradas entre 2025 y 2026 en todas las fases (0–7) y en los ocho estados: una registrada, en fase, pendientes de *gate* (una en tercera iteración, elevada al órgano superior), una en espera con reanudación vencida, en producción (una con revisión de continuidad caducada), una pendiente de G7 adelantado por R6, una **parada** en G3 por riesgo inaceptable y una **retirada** tras G7 por sustitución. Hay iniciativas estancadas, dos **condiciones vencidas**, un pivotaje, decisiones con condiciones, una firma multinivel G5 Enterprise, importes validados, declarados, estimados y sin dato, 9 sistemas (incluido uno de uso corporativo), incidentes y no conformidades. Los datos son ilustrativos: cualquier parecido con una compañía o persona real es casual.

## Limitaciones

- Días hábiles de lunes a viernes, sin calendario de festivos. La periodicidad de R6 se aproxima en días (182 Lite y 91 Enterprise, configurable).
- Herramienta monousuario y local: sin autenticación, control de acceso, firma electrónica ni sellado de tiempo; el autor de cada evento es declarativo. Los datos de `localStorage` no se comparten entre navegadores ni equipos; hay que exportar el JSON.
- La importación sustituye el registro completo (no fusiona) y valida la estructura principal, no el JSON Schema completo.
- Riesgos (T06), no conformidades e incidentes (T08), proveedores (T09), realización de valor por periodos (T12), retiradas (T22) y recomendaciones (T18) se muestran, generan alertas y se exportan, pero su gestión completa corresponde a esas herramientas (olas 2 y 3).
- Las puertas agrupadas en Lite (G0–G2, G4–G5) se registran como decisiones separadas del mismo día; no hay una sesión conjunta.
- Escalar abre el alta de la nueva iniciativa con la etiqueta «Escalado de IA-…», sin vínculo formal entre ambas.
- La probabilidad histórica no se segmenta por intensidad, ambición ni cohorte.
- Probada en Microsoft Edge (Chromium). Debería funcionar en otros navegadores actuales con soporte de `<dialog>`, pero no se ha probado.

## Licencia

Código bajo licencia **MIT**. Contenidos (textos, catálogo de criterios, modelo y datos de demostración) bajo **CC BY 4.0**.

© 2026 Fernando García · SEACHAD · Metodología SEVEN-G
