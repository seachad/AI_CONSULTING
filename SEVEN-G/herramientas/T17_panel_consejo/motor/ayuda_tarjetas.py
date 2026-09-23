# -*- coding: utf-8 -*-
"""Ayuda de cada tarjeta del panel del consejo (completo y movil): boton «?» junto al titulo que explica que muestra
la tarjeta y por que importa (D108).

Se activa con meta.navegacion.ayuda_tarjetas (config_panel.json); sin esa clave el panel no cambia (D53).
Cada elemento del panel que tiene ayuda lleva data-ayuda="<clave>"; los textos de partida estan aqui y
meta.ayuda_tarjetas puede sustituir campos de una clave ({"titulo", "que", "porque", "donde"}) o quitarla (false).
Los textos son HTML de confianza (vienen del motor o del JSON general de configuracion, no de los casos).
Los codigos que citan («documento 40», T14…) pasan a ser enlaces si el panel carga el indice de codigos (D99).
"""
import json

AYUDA = {
    # ---- Cartera y valor: indicadores de cabecera
    "kpi-casos": {
        "titulo": "Casos seleccionados",
        "que": "Cuántos casos de uso cumplen los filtros y la búsqueda, repartidos por estado; cuántos no tienen descripción y, si se compara con una foto guardada, cuántos son nuevos o han pasado a producción desde entonces.",
        "porque": "Es la base de todas las cifras de la página: antes de leer un importe hay que saber sobre qué casos se calcula. Un caso sin descripción no se puede defender ante el consejo.",
        "donde": "documento 14 (gestión de cartera)",
    },
    "kpi-costes": {
        "titulo": "Costes",
        "que": "Coste recurrente anual de los casos seleccionados (en régimen, si se mira el potencial), inversión de construcción, inversión adicional para llegar al potencial y cuántos casos tienen el coste estimado en lugar de declarado. Al pulsar la tarjeta se abre el desglose.",
        "porque": "El valor solo se entiende frente a su coste completo (licencias, consumo, personas, integración y mantenimiento). Los costes estimados señalan dónde falta el dato de la compañía.",
        "donde": "documento 42 (costes de IA)",
    },
    "kpi-retorno": {
        "titulo": "Retorno total",
        "que": "Eficiencias materializadas más retorno (ingresos, margen o pérdidas evitadas) de los casos seleccionados. La capacidad liberada que no se ha materializado se muestra aparte y no suma. Al pulsar la tarjeta se abre el desglose.",
        "porque": "Separa el valor que ya llega a la cuenta de resultados de las horas liberadas que todavía no se han convertido en menor coste ni en capacidad reasignada: sumarlas inflaría el valor de la IA.",
        "donde": "documento 40 (reglas de medición del valor)",
    },
    "kpi-neto": {
        "titulo": "Neto anual",
        "que": "Retorno total menos costes recurrentes de los casos seleccionados; en potencial, cuánto más daría la cartera y con qué inversión adicional; y cuántos casos en uso tienen neto negativo.",
        "porque": "Responde a la pregunta del consejo: ¿la cartera de IA aporta o consume dinero cada año? Un caso en uso con neto negativo es candidato a iterar o retirar en G7.",
        "donde": "documento 40 y documento 43 (realización de beneficios)",
    },
    "kpi-validado": {
        "titulo": "Valor actual validado",
        "que": "Qué parte del valor actual está validada por una función independiente (Control de Gestión), frente a la declarada por la compañía y la estimada por el consejo asesor. El color sigue los umbrales del JSON general de configuración.",
        "porque": "Un valor declarado por quien construye el caso no es una evidencia. Antes de decidir inversiones sobre una cifra, el consejo debe saber cuánto de ella ha comprobado alguien que no la defiende.",
        "donde": "documento 40",
    },
    "kpi-clasificados": {
        "titulo": "Clasificados por la compañía",
        "que": "Casos con clasificación según el Reglamento de IA hecha por la compañía con criterio jurídico, frente al total; el resto solo tiene la estimación del consejo asesor.",
        "porque": "La clasificación decide las obligaciones (prácticas prohibidas, alto riesgo, transparencia) y las sanciones. Un caso sin clasificar es un riesgo de cumplimiento sin medir.",
        "donde": "documento 32 (inventario y clasificación) y documento 34 (mapeo regulatorio)",
    },
    "kpi-controles": {
        "titulo": "Casos con controles completos",
        "que": "Casos con todos sus controles hechos o marcados como no aplicables: clasificación regulatoria, evaluación de impacto en derechos fundamentales, evaluación de impacto en protección de datos, seguridad, manual de uso y control y análisis del riesgo de ataques con IA.",
        "porque": "Un caso en producción sin sus controles expone a la compañía a sanciones, incidentes y daño reputacional. El color muestra de un vistazo si la cobertura está en objetivo.",
        "donde": "documento 33 (riesgos) y documento 35 (seguridad)",
    },
    # ---- Cartera y valor: tarjetas
    "c1": {
        "titulo": "Eficiencias, retorno y coste por compañía y unidad",
        "que": "Para cada compañía y unidad de negocio, barras con las eficiencias, el retorno y la capacidad no materializada, y al lado el coste recurrente; actual o potencial según el selector de la barra.",
        "porque": "Muestra dónde se concentran el valor y el coste de la IA. Una unidad con mucho coste y poco retorno, o con valor solo en capacidad no materializada, pide una conversación con su responsable de negocio.",
        "donde": "documento 40",
    },
    "c2": {
        "titulo": "Dónde rinde más la inversión adicional",
        "que": "Los casos (hasta quince) con inversión adicional estimada y neto adicional positivo, ordenados por euros de neto anual adicional por cada euro invertido. Al pulsar una barra se abre la economía del caso.",
        "porque": "Ayuda a decidir dónde poner el siguiente euro: escalar lo que ya funciona suele rendir más que abrir casos nuevos. Son cifras potenciales: dependen de las hipótesis y del plazo de cada caso.",
        "donde": "documento 14 y documento 40",
    },
    "cdm": {
        "titulo": "Cuadro de mando de la compañía frente a este panel",
        "que": "Compara, caso a caso, el valor que declara el cuadro de mando de la compañía con el de este panel, y recoge las incoherencias del propio documento y las advertencias sobre él.",
        "porque": "El consejo recibe a menudo dos cifras de valor distintas. Esta tarjeta explica de dónde sale la diferencia y qué dato falta, para que la decisión no dependa de la fuente que se mire.",
        "donde": "documento 60 (paquete para el consejo)",
    },
    "indice": {
        "titulo": "Índice de transformación",
        "que": "El último cálculo de la calculadora T14: perfil asignado, condiciones de base (B1–B3), ocho señales puntuadas de 0 a 3, tendencia frente al cálculo anterior, alertas y qué movería el perfil. Es de la compañía en su conjunto: los filtros no lo cambian.",
        "porque": "Responde si la compañía se está transformando con la IA o solo se está haciendo más eficiente, con evidencias y no con declaraciones: una transformación declarada que las señales no respaldan se señala.",
        "donde": "documento 12 (índice de transformación)",
    },
    "madurez": {
        "titulo": "Madurez de la compañía (D1–D7)",
        "que": "El último diagnóstico de T15: nivel global y de cada una de las siete dimensiones (0 a 5), avance hacia el nivel siguiente, bloqueantes, límite por gobierno (D1) o riesgo (D6), tendencia y si es un autodiagnóstico o está verificado. Los filtros no lo cambian.",
        "porque": "Indica si la compañía tiene capacidad para sostener la cartera y la ambición que se le presentan: subir la ambición sin gobierno ni control del riesgo multiplica el riesgo. Una autoevaluación sin verificar no vale para el consejo.",
        "donde": "documento 11 (modelo de madurez)",
    },
    "transv": {
        "titulo": "Iniciativas transversales y plataformas habilitadoras",
        "que": "Las herramientas que usan varias unidades y las plataformas en las que se apoyan otros casos: por unidad, despliegue, adopción (licencias activas sobre asignadas) frente al umbral, horas y capacidad liberadas (no suman), coste y valor materializado; y el neto de la cartera con ellas y sin ellas.",
        "porque": "Un asistente en la suite ofimática tiene un coste seguro y un valor difícil de probar. Medirlo por unidad y presentar el neto con y sin estas iniciativas evita que diluyan u oculten el resultado del resto de la cartera.",
        "donde": "documento 40 §7.2",
    },
    "cart1": {
        "titulo": "Movimientos del periodo",
        "que": "Altas, retiradas y reevaluaciones desde la sesión anterior, con su fecha, motivo, quién lo decidió y qué caso lo sustituye.",
        "porque": "Una cartera sana también retira casos. Si nunca hay retiradas, probablemente no se está ejerciendo la capacidad de parar, y el coste de los casos que no aportan sigue corriendo.",
        "donde": "documento 14",
    },
    "cart2": {
        "titulo": "Agilidad por nivel de riesgo",
        "que": "Mediana de días de la idea a la aprobación y de la aprobación a producción, por nivel de riesgo, frente al plazo comprometido (SLA); y el uso de la vía rápida y la aprobación a la primera.",
        "porque": "El gobierno no debe convertirse en un freno. Separar por nivel de riesgo muestra si los casos sencillos avanzan rápido y si el tiempo se pierde al arrancar los casos o al entregarlos.",
        "donde": "documento 20 (manuales de fase) y documento 21 (criterios de gate)",
    },
    # ---- Embudo y ciclo de vida
    "emb-entradas": {
        "titulo": "Entradas en el embudo",
        "que": "Todos los casos seleccionados que han entrado alguna vez en el embudo y, de ellos, cuántos entraron en los últimos doce meses.",
        "porque": "Mide si la compañía sigue generando ideas y oportunidades. Sin entradas nuevas, la cartera envejece aunque sus cifras actuales sean buenas.",
        "donde": "documento 14",
    },
    "emb-encurso": {
        "titulo": "En curso",
        "que": "Casos que están ahora dentro del embudo, repartidos por etapa (propuestos, en hipótesis de valor, en prueba de concepto y en desarrollo).",
        "porque": "Es la actividad corriente de la cartera: dice cuánto trabajo hay abierto y en qué etapa se acumula.",
        "donde": "documento 20",
    },
    "emb-ganados": {
        "titulo": "Ganados: en uso",
        "que": "Casos que están ahora en producción y, aparte, cuántos llegaron alguna vez a producción (incluidos los que se desengancharon después).",
        "porque": "Llegar a producción es el resultado que importa del embudo: solo lo que está en uso puede producir valor.",
        "donde": "documento 14",
    },
    "emb-perdidos": {
        "titulo": "Perdidos",
        "que": "Casos que salieron del embudo, por salida: no aprobados, descartados y desenganchados después de estar en uso.",
        "porque": "Parar a tiempo es un resultado, no un fracaso: cada caso perdido con su motivo es aprendizaje de la organización y dinero que deja de gastarse.",
        "donde": "documento 21",
    },
    "emb-conversion": {
        "titulo": "Conversión a producción",
        "que": "Casos que llegaron a producción divididos por la suma de esos casos y los que se perdieron antes de llegar. Si los datos no incluyen casos no aprobados ni descartados, no se puede medir.",
        "porque": "Una conversión muy alta puede indicar que no se para nada; una muy baja, que se abren demasiados casos sin hipótesis de valor. Las dos piden revisar los criterios de las puertas.",
        "donde": "documento 21",
    },
    "emb-atascados": {
        "titulo": "Casos atascados",
        "que": "Casos que superan el límite de días de su estado (en rojo) o que se acercan a él (en amarillo). Los límites están en el JSON general de configuración.",
        "porque": "Un caso atascado consume recursos sin decisión. Pide que alguien decida: continuar, iterar, pivotar o parar.",
        "donde": "documento 20 y documento 21",
    },
    "embudo": {
        "titulo": "Embudo de casos de uso",
        "que": "Los casos al vuelo por etapa (propuesto, hipótesis de valor, prueba de concepto, en desarrollo): la anchura son los casos que alcanzaron la etapa y el número, los que están ahora en ella. A la derecha de cada etapa, los casos que no la superaron, con su motivo y lo aprendido; debajo, los que ya están en uso y los desenganchados. Al pulsar una etapa o una salida se ven sus casos.",
        "porque": "Gestiona la cartera como un embudo comercial: muestra dónde se acumulan y dónde se pierden los casos, y por qué. Así el consejo ve si las puertas filtran de verdad y qué ha aprendido la organización de lo que no salió.",
        "donde": "documento 00 §4.3 y documento 14",
    },
    "embudo-det": {
        "titulo": "Casos de una etapa",
        "que": "Los casos de la etapa o la salida que se haya pulsado en el embudo: días en la etapa frente a su límite y desviación frente a la media o la mediana del estado; en las salidas, el motivo y las cifras que tenía el caso al salir.",
        "porque": "Identifica qué casos concretos están atascados o por qué se perdieron, y a quién hay que pedir una decisión.",
        "donde": "documento 20",
    },
    "embudo-preg": {
        "titulo": "Preguntas sobre los tiempos",
        "que": "Respuestas, con los casos filtrados, a preguntas sobre el historial de estados: cuánto se está en cada estado, cuánto se tarda de uno a otro, si cambia según el tipo de caso, qué casos se atascan y cuántas entradas, ganados y perdidos hay por periodo.",
        "porque": "Convierte el historial en aprendizaje: qué tipo de caso tarda más y en qué etapa conviene simplificar el proceso o reforzarlo.",
        "donde": "documento 14",
    },
    # ---- Histórico y adopción
    "hist": {
        "titulo": "Histórico y tendencia",
        "que": "Las fotos guardadas al cierre de cada sesión: evolución de eficiencias, retorno, coste y neto; casos nuevos, retirados y cambios de estado frente a la foto elegida; y puestas en producción por año.",
        "porque": "El consejo decide mejor con tendencias que con fotos sueltas. Comparar con la sesión anterior muestra si se cumplió lo previsto y qué ha cambiado desde entonces.",
        "donde": "documento 60",
    },
    "adop": {
        "titulo": "Adopción y capacidad",
        "que": "Licencias activas sobre asignadas, uso de la plataforma de agentes, usos de IA fuera de los canales aprobados (shadow AI) y controles técnicos frente a ellos, cobertura de la formación obligatoria y vacantes clave.",
        "porque": "La IA que no se usa no genera valor, y la que se usa fuera de los canales aprobados genera riesgo. La formación es además una obligación del Reglamento de IA (alfabetización).",
        "donde": "documento 23 (adopción y cambio), documento 31 (uso aceptable) y documento 50 (personas)",
    },
    # ---- Riesgo y cumplimiento
    "rie1": {
        "titulo": "Semáforo regulatorio",
        "que": "Casos por nivel del Reglamento de IA según la clasificación de la compañía y según la estimación del consejo asesor, y la cobertura de cada control (hecho, pendiente, no aplica o sin dato).",
        "porque": "Las discrepancias entre las dos clasificaciones y los controles pendientes señalan dónde puede haber obligaciones sin cubrir antes de que las descubra un supervisor.",
        "donde": "documento 32, documento 33 y documento 34",
    },
    "rie2": {
        "titulo": "Incidentes de IA y brechas de datos",
        "que": "Incidentes del periodo por tipo y origen (agente atacante, agente propio manipulado, proveedor), horas hasta detectar, contener y resolver frente al objetivo de recuperación, brechas de datos personales y si se notificaron a la autoridad en 72 horas.",
        "porque": "Los incidentes son la prueba real de que los controles funcionan. El plazo de 72 horas del RGPD es una obligación legal con sanción.",
        "donde": "documento 37 (no conformidades e incidentes)",
    },
    "rie3": {
        "titulo": "Guardarraíles y operación de los asistentes",
        "que": "Para los asistentes generativos y los agentes: contención (consultas resueltas sin persona), derivación a una persona, activación de los guardarraíles y fecha de las pruebas adversarias (red teaming).",
        "porque": "Muestra si los asistentes resuelven lo que prometen y si están protegidos. Un asistente en uso sin pruebas adversarias es un riesgo sin evaluar.",
        "donde": "documento 35 y documento 52 (operación)",
    },
    "iaof": {
        "titulo": "Exposición a ataques con IA",
        "que": "Doble factor en las aplicaciones expuestas, vulnerabilidades críticas abiertas, horas hasta detectar y contener, identidades de agentes con permisos excesivos, agentes que escriben o pagan sin validación humana, brechas y preparación (pruebas de intrusión, simulacros y procedimiento de respuesta).",
        "porque": "Los atacantes ya usan agentes que operan a velocidad de máquina. El consejo debe saber si la compañía detecta y contiene a esa velocidad, y qué le falta para hacerlo.",
        "donde": "documento 35 (seguridad de IA y agentes)",
    },
    "agt": {
        "titulo": "Identidad, permisos e intención de los agentes",
        "que": "Para cada agente: qué acciones puede ejecutar, con qué identidades y credenciales, si cumple el mínimo privilegio, si un control externo al modelo autoriza cada acción, si hay validación humana, botón de parada, trazabilidad y prueba de inyección de instrucciones.",
        "porque": "Un agente que actúa (autonomía A2 o A3) puede mover dinero, datos o sistemas. Sin mínimo privilegio y sin botón de parada, un error o una manipulación se convierte en un incidente.",
        "donde": "documento 35",
    },
    # ---- Inventario
    "inventario": {
        "titulo": "Inventario por compañía y unidad",
        "que": "Cada caso con su estado, sus cifras y sus etiquetas, agrupado por compañía y unidad o seguido, en tarjetas o en tabla. Al pulsar un caso se abre su ficha.",
        "porque": "Es el detalle que respalda todas las cifras agregadas del panel: cualquier importe se puede rastrear hasta los casos que lo forman.",
        "donde": "documento 32 y T01",
    },
    # ---- Panel móvil
    "m-resumen": {
        "titulo": "Resumen",
        "que": "Neto anual de la IA (retorno total menos costes) con su evolución entre fotos, retorno total, costes, valor validado (o inversión adicional, en potencial), casos con controles completos y casos por estado.",
        "porque": "Es la respuesta en treinta segundos: si la cartera aporta dinero, cuánto de ese valor está comprobado y si los casos tienen sus controles.",
        "donde": "documento 40",
    },
    "m-alertas": {
        "titulo": "Alertas",
        "que": "Lo que requiere atención del consejo, calculado con los datos del panel: valor sin validar, casos sin clasificar o sin controles completos por debajo de su umbral, dependencia de un solo caso, casos en uso con neto negativo, capacidad liberada sin materializar, brechas de datos sin notificar a tiempo y agentes sin ficha de permisos, entre otros.",
        "porque": "Resume lo que hay que preguntar en la sesión, sin tener que recorrer el panel completo.",
        "donde": "documento 61 (conversación con el consejo)",
    },
    "m-embudo": {
        "titulo": "Embudo de casos",
        "que": "Casos ahora en cada etapa, cuántos la alcanzaron, mediana de días y casos atascados; debajo, los que están en uso y los que no pasaron o se desengancharon, con su motivo. Al pulsar una etapa se ven sus casos.",
        "porque": "Muestra dónde se acumulan y dónde se pierden los casos, y por qué: parar a tiempo es un resultado y forma parte del aprendizaje.",
        "donde": "documento 14",
    },
    "m-top": {
        "titulo": "Casos que más aportan",
        "que": "Los cinco casos con mayor neto anual positivo (actual o potencial) y su variación frente a la foto elegida.",
        "porque": "Dice de qué casos depende el resultado de la cartera: son los que más conviene proteger, medir bien y, si procede, escalar.",
        "donde": "documento 43",
    },
    "m-rinde": {
        "titulo": "Dónde rinde más el siguiente euro",
        "que": "Los cinco casos con más neto anual adicional por euro de inversión adicional, con la inversión, el neto que añadiría y el plazo.",
        "porque": "Ayuda a decidir dónde poner la siguiente inversión. Son cifras potenciales: dependen de las hipótesis de cada caso.",
        "donde": "documento 14 y documento 40",
    },
    "m-novedades": {
        "titulo": "Novedades",
        "que": "Casos nuevos, puestos en producción, retirados o con cambio de estado desde la foto elegida.",
        "porque": "Es lo que ha cambiado desde la última sesión: lo primero que el consejo querrá saber.",
        "donde": "documento 60",
    },
}

CSS = r"""
/* ayuda de cada tarjeta (D108) */
[data-ayuda]:not(h2):not(h3){position:relative}
.ayuda-btn{display:inline-flex;align-items:center;justify-content:center;width:20px;height:20px;margin:0 0 0 8px;padding:0;border:1px solid var(--muted);border-radius:50%;background:transparent;color:var(--muted);font:700 12px/1 system-ui,-apple-system,"Segoe UI",sans-serif;cursor:pointer;vertical-align:middle;flex:0 0 auto;text-decoration:none}
.ayuda-btn:hover,.ayuda-btn:focus-visible{background:var(--ink);color:var(--surface);border-color:var(--ink);outline:none}
.ayuda-btn.flota{position:absolute;top:8px;right:8px;margin:0;z-index:1}
[data-ayuda]:has(>.ayuda-btn.flota)>:first-child{padding-right:24px}
@media (pointer:coarse){.ayuda-btn{width:26px;height:26px;font-size:14px}}
@media print{.ayuda-btn{display:none!important}}
.ayuda-t h2{margin:0 0 10px;padding-right:80px;font-size:18px;text-transform:none;letter-spacing:0;color:var(--ink)}
.ayuda-t h3{margin:14px 0 4px;font-size:14px}
.ayuda-t p{margin:0;line-height:1.5}
.ayuda-t .ayuda-donde{margin-top:14px;font-size:12.5px;color:var(--muted)}
"""

JS = r"""
// ---- ayuda de cada tarjeta (meta.navegacion.ayuda_tarjetas, D108): un «?» junto al título de cada tarjeta marcada con data-ayuda
// abre qué muestra y por qué importa. meta.ayuda_tarjetas sustituye campos de una clave o la quita (false). Sin la opción, nada cambia.
const AYUDA_TARJETAS = __AYUDA__;
function ayudaDe(k){
  const o = (((typeof DATA!=="undefined" && DATA.meta) || {}).ayuda_tarjetas || {})[k];
  if (o === false) return null;
  const b = AYUDA_TARJETAS[k];
  return (b || o) ? Object.assign({}, b || {}, o || {}) : null;
}
function ayudaHtml(a){
  const e = s => String(s == null ? "" : s).replace(/[&<>"]/g, c=>({"&":"&amp;","<":"&lt;",">":"&gt;",'"':"&quot;"}[c]));
  return `<div class="ayuda-t"><h2>${e(a.titulo)}</h2><h3>Qué muestra</h3><p>${a.que||""}</p><h3>Por qué importa</h3><p>${a.porque||""}</p>${a.donde?`<p class="ayuda-donde">Dónde se explica: ${a.donde}</p>`:""}</div>`;
}
function ponerAyudas(abrir){
  document.querySelectorAll("[data-ayuda]").forEach(el=>{
    const a = ayudaDe(el.dataset.ayuda); if (!a) return;
    // dónde va el botón: dentro del título de la tarjeta si lo tiene; si no, flotando en su esquina
    let host = null;
    if (/^H[23]$/.test(el.tagName)) host = el;
    else if (el.tagName === "DETAILS") host = el.querySelector(":scope>summary>h3") || el.querySelector(":scope>summary");
    else host = el.querySelector(":scope>h2, :scope>h3");
    const flota = !host; if (flota) host = el;
    if (!host || host.querySelector(":scope>.ayuda-btn")) return;
    const b = document.createElement("button");
    b.type = "button"; b.className = "ayuda-btn" + (flota ? " flota" : ""); b.textContent = "?";
    b.title = `Qué muestra «${a.titulo}» y por qué importa`; b.setAttribute("aria-label", b.title);
    // el botón vive a veces dentro de un <summary> o de una tarjeta que se pulsa: su clic no pliega ni abre nada más
    b.addEventListener("click", ev=>{ ev.preventDefault(); ev.stopPropagation(); abrir(ayudaHtml(a)); });
    b.addEventListener("keydown", ev=>{ if (ev.key === "Enter" || ev.key === " ") ev.stopPropagation(); });
    host.appendChild(b);
  });
}
// las tarjetas se vuelven a dibujar con cada filtro: se vigila el contenedor y se repone el botón donde falte
function vigilarAyudas(raiz, abrir){
  if (!raiz) return;
  ponerAyudas(abrir);
  let pend = false;
  new MutationObserver(()=>{ if (pend) return; pend = true; requestAnimationFrame(()=>{ pend = false; ponerAyudas(abrir); }); }).observe(raiz, {childList: true, subtree: true});
}
"""


def js():
    return JS.replace("__AYUDA__", json.dumps(AYUDA, ensure_ascii=False))
