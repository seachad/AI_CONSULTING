# Copia mantenida en AI_CONSULTING (SEVEN-G, T17) desde 17-09-2026; origen: AI_en_el_consejo/motor (MIT, mismo autor).
# -*- coding: utf-8 -*-
"""Siglas y terminos de los paneles de IA del Consejo. Glosario generico: nada de una organizacion concreta.
Los terminos propios de una organizacion se pasan desde los datos (meta.glosario_extra) y se fusionan al generar:
cada termino extra es [grupo, sigla, desarrollo, explicacion, en_movil (opcional)]."""
import html

# (grupo, [(sigla, desarrollo, explicacion)])
GLOSARIO = [
 ("Valor y negocio", [
  ("VNB", "Valor de Nuevo Negocio", "Valor actual de los beneficios futuros que se esperan de las pólizas vendidas en un periodo, descontados los costes y el capital necesario. No es un ingreso ni entra en caja ese año: es el beneficio esperado de toda la vida de la póliza, traído a hoy. En seguros es la métrica habitual para medir la venta nueva y la venta cruzada."),
  ("PTA", "Prima Tarifa Anualizada", "Importe anual de prima de las pólizas vendidas o influidas por el caso de uso. Mide volumen de venta, no rentabilidad. VNB y PTA miden las mismas ventas desde dos ángulos: no se pueden sumar."),
  ("Fraude recuperado o evitado", "", "Importe de siniestros u operaciones fraudulentas que no se paga o se recupera gracias a la detección. Las herramientas de terceros suelen declarar el importe recuperado bruto, no el incremental atribuible a la herramienta frente a lo que ya se detectaba."),
  ("Valor potencial", "", "Valor que la compañía declara sin haberlo validado ni materializado; no es retorno realizado hasta que Control de Gestión lo valida."),
  ("Grupo de control", "", "Clientes o casos a los que no se aplica el modelo, para comparar y medir cuánto aporta realmente (valor incremental)."),
  ("Línea base", "", "Valor de la métrica antes de implantar el caso de uso. Sin ella no se puede medir el valor incremental."),
  ("ROI", "Return on Investment", "Retorno de la inversión: beneficio neto dividido por el coste."),
  ("TCO", "Total Cost of Ownership", "Coste total de propiedad: construcción, licencias, plataforma, equipo y mantenimiento durante la vida útil."),
  ("Inversión", "", "Lo que cuesta el caso de uso: construcción (una vez) y coste recurrente anual en personas internas, servicios externos, licencias, plataforma compartida, infraestructura, cumplimiento y mantenimiento. En el potencial, la inversión adicional necesaria para alcanzarlo."),
  ("Eficiencias", "", "Menor coste gracias al caso de uso, en euros al año: personas o externalización, herramientas retiradas, siniestros (fraude, recobros, sobrefacturación), otros costes operativos y penalizaciones evitadas."),
  ("Capacidad liberada", "", "Horas de trabajo que el caso libera, valoradas en euros. No suma en el neto hasta que se materializa en menor coste (menos contratación, externalización u horas extra)."),
  ("Retorno", "", "Más negocio gracias al caso de uso, en euros al año: venta nueva y cruzada (en VNB), valor de la cartera retenida, mejor precio o margen técnico y recibos recuperados."),
  ("Valor de la cartera retenida", "", "Valor de las pólizas que no se dan de baja gracias al caso de uso, calculado con la misma metodología que el VNB: pólizas retenidas × prima × margen × duración esperada, traído a valor presente."),
  ("Neto anual", "", "Eficiencias materializadas + retorno − coste recurrente anual. Se calcula para el valor actual y para el potencial."),
  ("Potencial", "", "Máximo al que puede llegar el caso con las hipótesis indicadas (cobertura, adopción, contención…), la inversión adicional y el plazo. Un potencial sin su coste no se considera dato."),
  ("Neto adicional por euro invertido", "", "Neto anual potencial menos neto actual, dividido por la inversión adicional. Indica dónde rinde más el siguiente euro."),
  ("Payback", "", "Tiempo en que el neto anual recupera la inversión de construcción."),
  ("Estado del dato", "", "Validado (por Control de Gestión u Optimización de Costes), declarado (por la compañía, sin validar), estimado (por el consejo asesor) o imputado (sin dato: valor convencional). El panel indica qué parte del valor está validada."),
  ("Valor imputado", "", "Valor convencional que el panel asigna a un caso con coste recurrente pero sin ningún valor reportado ni estimado: un múltiplo de su coste (por defecto 2). Se marca con ⚠ allí donde aparece: no es un dato de la compañía; solo evita que el caso figure a cero o deficitario hasta que se mida su valor."),
  ("Clave de reparto", "", "Regla para imputar a cada caso el coste de una plataforma compartida: consumo medido (tokens, DBU, minutos) o usuarios para las herramientas de productividad."),
  ("Foto (histórico)", "", "Copia del estado del panel guardada al cierre de cada sesión (snapshot.py). Permite comparar, ver casos nuevos y retirados y dibujar la tendencia."),
  ("Puesta en producción", "", "Fecha en que el caso empieza a operar. Si la compañía no la aporta, el panel usa el año estimado por el consejo asesor y lo indica."),
  ("KPI", "Key Performance Indicator", "Indicador clave de rendimiento."),
  ("CdM", "Cuadro de mando", "Panel de indicadores."),
  ("CdU", "Caso de uso", "Abreviatura que usa la compañía."),
  ("NBA", "Next Best Action", "Siguiente mejor acción comercial recomendada para cada cliente."),
  ("CSAT / NPS", "Customer Satisfaction / Net Promoter Score", "Satisfacción del cliente tras una interacción y propensión a recomendar."),
  ("ROAS", "Return on Ad Spend", "Ingresos atribuidos a una campaña publicitaria por cada euro invertido en ella."),
  ("VOC / CX", "Voice of the Customer / Customer Experience", "Voz del cliente (lo que dice en encuestas, llamadas y quejas) y experiencia de cliente."),
 ]),
 ("Tecnología", [
  ("IA", "Inteligencia artificial", "Sistemas que infieren a partir de datos para predecir, clasificar, recomendar o generar contenido."),
  ("GenAI", "IA generativa", "Sistemas que generan texto, voz, imagen o vídeo nuevos a partir de instrucciones (GPT, Claude, Gemini, Veo), a diferencia de la IA predictiva, que clasifica o puntúa."),
  ("LLM", "Large Language Model", "Modelo grande de lenguaje: el motor de la IA generativa."),
  ("GPAI", "General-Purpose AI", "Modelo de IA de propósito general (GPT, Claude…). El Reglamento de IA impone obligaciones a su proveedor; la aseguradora es desplegadora."),
  ("RAG", "Retrieval-Augmented Generation", "El asistente busca primero en documentos autorizados y responde a partir de ellos, lo que reduce las respuestas inventadas."),
  ("ML", "Machine Learning, aprendizaje automático", "Modelos que aprenden patrones de datos históricos para predecir o clasificar (propensión, scoring, fraude). «Tradicional» o «predictivo» por oposición a generativo."),
  ("Scoring", "", "Modelo que asigna a cada cliente o lead una puntuación de probabilidad (de comprar, de darse de baja, de ser fraude)."),
  ("GLM", "Generalized Linear Model", "Modelo lineal generalizado: técnica estadística estándar en tarificación actuarial."),
  ("NLP", "Natural Language Processing", "Procesamiento del lenguaje natural: técnicas para clasificar, extraer o entender texto y voz."),
  ("OCR", "Optical Character Recognition", "Reconocimiento óptico de caracteres: convertir la imagen de un documento en texto."),
  ("IDP", "Intelligent Document Processing", "Captura, clasificación y extracción automática de datos de documentos (OCR más modelos)."),
  ("RPA", "Robotic Process Automation", "Robots de software que repiten tareas en aplicaciones. Según la Política de IA de la compañía, solo cuenta como IA si integra un componente que infiere."),
  ("Agente / agéntico", "", "Sistema basado en un modelo de lenguaje que planifica, usa herramientas y sistemas y actúa con cierta autonomía, en lugar de limitarse a responder."),
  ("IVR", "Interactive Voice Response", "Sistema telefónico automático; aquí, el asistente de voz con IA generativa que atiende las llamadas de clientes."),
  ("STT / TTS", "Speech-to-Text / Text-to-Speech", "Transcribir voz a texto y generar voz a partir de texto: los dos componentes de voz de un asistente telefónico."),
  ("SaaS", "Software as a Service", "Aplicación de un proveedor usada por suscripción en la nube."),
  ("POC", "Proof of Concept", "Prueba de concepto: experimento acotado para comprobar si algo funciona, previo al piloto."),
  ("API", "Application Programming Interface", "Interfaz para que dos sistemas se comuniquen de forma automática."),
  ("BI / GIS", "Business Intelligence / Geographic Information System", "Herramientas de análisis y visualización de datos de negocio y de datos geolocalizados (por ejemplo, ESRI)."),
  ("H3", "", "Sistema de celdas hexagonales para dividir el territorio en zonas comparables; se usa en el análisis de mercado por zonas."),
  ("DBU", "Databricks Unit", "Unidad de consumo con la que Databricks factura su plataforma; permite imputar su coste a cada modelo."),
  ("CRM", "Customer Relationship Management", "Sistema de gestión de la relación con clientes."),
  ("SQL", "Structured Query Language", "Lenguaje de consulta de bases de datos."),
  ("QA", "Quality Assurance", "Aseguramiento de la calidad: pruebas del software antes de producción."),
  ("JSON", "JavaScript Object Notation", "Formato de fichero de datos. Todo lo que muestran los paneles sale de un único JSON."),
 ]),
 ("Métricas operativas de los modelos y asistentes", [
  ("Contención", "", "Porcentaje de conversaciones que el asistente resuelve sin pasar a una persona."),
  ("Derivación", "", "Transferencia de una conversación del asistente a una persona."),
  ("STP", "Straight-Through Processing", "Tasa de tratamiento directo: porcentaje de expedientes que se procesan de principio a fin sin intervención manual."),
  ("AUC", "Area Under the Curve", "Área bajo la curva ROC: capacidad de un modelo para ordenar bien (1 = perfecto, 0,5 = azar)."),
  ("PSI", "Population Stability Index", "Índice de estabilidad de población: mide si los datos actuales se han alejado de los de entrenamiento (deriva)."),
  ("Deriva (drift)", "", "Degradación de un modelo porque los datos actuales ya no se parecen a los del entrenamiento."),
  ("Falso positivo", "", "Alerta que resulta incorrecta; en fraude, un siniestro legítimo marcado como sospechoso."),
  ("Evals", "", "Evaluaciones sistemáticas y repetibles de un sistema de IA generativa, antes de cada cambio y periódicamente en producción."),
  ("Red teaming", "", "Pruebas adversarias: intentar deliberadamente que el sistema falle, revele datos o se salga de su función, para encontrar fallos antes que un atacante."),
  ("Guardarraíl", "", "Mecanismo que limita lo que un sistema de IA puede decir o hacer: filtros de contenido, instrucciones, validaciones contra los sistemas, límites de acción."),
  ("SLA", "Service Level Agreement", "Nivel de servicio comprometido; aquí, el plazo máximo comprometido para una fase del ciclo de un caso de uso."),
  ("Tier", "", "Nivel de riesgo asignado a un caso (bajo, medio, alto) que determina la profundidad de validación y las aprobaciones necesarias."),
  ("Fast-track", "", "Vía rápida de aprobación para casos de riesgo mínimo."),
  ("RTO", "Recovery Time Objective", "Tiempo máximo admisible de interrupción de un sistema antes de recuperarlo."),
 ]),
 ("Riesgo, regulación y controles", [
  ("Reglamento de IA", "Reglamento (UE) 2024/1689, AI Act", "Clasifica los sistemas de IA por nivel de riesgo (prohibido, alto riesgo, transparencia, mínimo) e impone obligaciones proporcionales."),
  ("Art. 50", "", "Artículo del Reglamento de IA sobre transparencia: informar a la persona de que interactúa con una IA y marcar el contenido sintético. Vigente desde el 2 de agosto de 2026."),
  ("Anexo III", "", "Lista de usos de alto riesgo del Reglamento de IA; para una aseguradora, entre otros, la tarificación de vida y salud y la selección y evaluación de empleados."),
  ("RIA", "Análisis de riesgo de IA", "Cuestionario interno que analiza el riesgo de cada caso de uso conforme al Reglamento de IA."),
  ("FRIA", "Fundamental Rights Impact Assessment", "Evaluación de impacto en derechos fundamentales, exigida a los desplegadores de sistemas de alto riesgo del sector financiero (art. 27 del Reglamento de IA)."),
  ("DPIA", "Data Protection Impact Assessment", "Evaluación de impacto en protección de datos (art. 35 del RGPD), obligatoria en tratamientos de alto riesgo como biometría, perfilado o voz."),
  ("MUC", "Marco Unificado de Controles", "Catálogo interno de controles aplicables a cada caso de uso de IA."),
  ("RGPD", "Reglamento General de Protección de Datos", "Reglamento (UE) 2016/679. Su art. 22 limita las decisiones basadas únicamente en tratamiento automatizado con efectos sobre las personas."),
  ("PII", "Personally Identifiable Information", "Información personal identificable: nombre, DNI, teléfono, número de póliza…"),
  ("DORA", "Digital Operational Resilience Act", "Reglamento (UE) 2022/2554 de resiliencia operativa digital, aplicable a aseguradoras desde enero de 2025: riesgo tecnológico y de proveedores tecnológicos."),
  ("PCI DSS", "Payment Card Industry Data Security Standard", "Estándar de seguridad para datos de tarjetas de pago; relevante si un agente de voz gestiona cobros."),
  ("IDD", "Insurance Distribution Directive", "Directiva de distribución de seguros: exige ofrecer productos acordes con las demandas y necesidades del cliente."),
  ("DLP", "Data Loss Prevention", "Controles técnicos que impiden sacar datos confidenciales fuera de los canales autorizados (por ejemplo, pegarlos en una herramienta de IA no gestionada)."),
  ("Shadow AI", "", "Uso de herramientas de IA por empleados al margen de los canales y controles corporativos."),
  ("Gate (GO / NO-GO)", "", "Punto de decisión formal en el que se autoriza o se rechaza que un caso pase a la fase siguiente, con criterios y registro."),
  ("Sunset", "", "Retirada ordenada de un caso de uso, con fecha, motivo, decisor y sustituto."),
  ("AEPD", "Agencia Española de Protección de Datos", "Autoridad de control del RGPD en España. El 14-09-2026 publicó la primera notificación recibida de una brecha de datos personales causada por un ataque ejecutado con un agente de IA."),
  ("Brecha de datos personales", "", "Incidente que provoca la destrucción, pérdida, alteración, comunicación o acceso no autorizado a datos personales. Se notifica a la AEPD en un máximo de 72 horas desde que se conoce (art. 33 del RGPD), salvo que sea improbable que suponga un riesgo para las personas."),
  ("IA ofensiva", "", "Uso de la IA, y en particular de agentes, para atacar: buscar vulnerabilidades, probar credenciales, explotar fallos y moverse por los sistemas de forma autónoma y a velocidad de máquina."),
  ("CCN-CERT BP/36", "", "Guía de buenas prácticas del Centro Criptológico Nacional frente a la IA ofensiva: reforzar controles esenciales, acelerar la gestión de vulnerabilidades, proteger identidades, controlar la cadena de suministro y gobernar el uso de agentes."),
  ("Prompt injection", "Inyección de instrucciones", "Ataque que introduce instrucciones maliciosas en lo que lee un asistente o agente (un correo, un documento, una web, la voz del cliente) para que haga algo distinto de su tarea."),
  ("IBAC", "Intent-Based Access Control, control de acceso basado en la intención", "Antes de cada acción de un agente, un punto de decisión externo al modelo comprueba que la acción concreta (herramienta, parámetros, datos) encaja con la intención y el mandato de la tarea, y solo entonces emite un permiso de corta duración limitado a esa acción. Detiene desviaciones antes de ejecutarlas."),
  ("Identidad no humana", "Non-Human Identity (NHI)", "Cuenta de servicio, clave API, token o certificado con el que un agente o programa accede a sistemas. Si tiene más permisos de los necesarios, un atacante que la obtenga opera a velocidad de máquina."),
  ("Token / clave API", "", "Credencial que usa un programa para identificarse ante otro sistema; conviene que sea de corta duración, limitada a lo necesario y rotada con frecuencia."),
  ("Mínimo privilegio", "", "Principio por el que cada identidad, humana o no, tiene solo los permisos imprescindibles para su tarea."),
  ("MFA", "Multi-Factor Authentication, doble factor", "Autenticación que exige algo más que la contraseña (código, aplicación, llave). En el caso de la AEPD el atacante entró con un login válido."),
  ("Botón de parada (kill switch)", "", "Mecanismo para desactivar de inmediato un agente o una de sus capacidades sin desplegar código."),
  ("Prueba de intrusión (pentest)", "", "Ataque controlado y autorizado para encontrar vulnerabilidades; con IA ofensiva, el atacante simulado usa agentes."),
 ]),
 ("Organización y documentos", [
  ("TMO", "Transformation Management Office", "Oficina de gestión de la cartera de proyectos, a través de la cual la compañía detecta proyectos que usan IA."),
  ("SAC", "Servicio de Atención al Cliente", "Canal de quejas y reclamaciones, con plazos regulatorios de respuesta."),
  ("RR. HH. / HR", "Recursos Humanos", "Área de Personas."),
  ("Consejo asesor", "", "Órgano que asesora al Consejo de Administración en tecnología e IA; elabora estos paneles y el registro de recomendaciones."),
  ("R-xx", "Identificador de recomendación", "Cada recomendación del consejo asesor tiene un identificador que nunca se reinicia, para seguir su estado sesión a sesión."),
  ("Qué es y para qué se usa", "", "Descripción breve de cada caso de uso: qué tecnología o herramienta es y para qué la usa la compañía. Sin ella no se puede valorar el caso."),
 ]),
]


def _fusionar(extra):
    grupos = [(g, list(items)) for g, items in GLOSARIO]
    for x in extra or []:
        grupo, sigla, desarrollo, explicacion = x[0], x[1], x[2], x[3]
        destino = next((items for g, items in grupos if g == grupo), None)
        if destino is None:
            destino = []; grupos.append((grupo, destino))
        for k, (s, _, _) in enumerate(destino):
            if s == sigla:
                destino[k] = (sigla, desarrollo, explicacion); break
        else:
            destino.append((sigla, desarrollo, explicacion))
    return grupos


def glosario_html(terminos=None, abierto=False, clase="gloss", extra=None):
    """Devuelve un <details> desplegable con el glosario. `terminos`: siglas a incluir (None = todas). `extra`: terminos de la organizacion."""
    partes, n = [], 0
    for grupo, items in _fusionar(extra):
        filas = [(s, d, e) for s, d, e in items if terminos is None or s in terminos]
        if not filas:
            continue
        n += len(filas)
        cuerpo = "".join(
            f'<tr><th scope="row">{html.escape(s)}</th><td>{("<b>" + html.escape(d) + ".</b> ") if d else ""}{html.escape(e)}</td></tr>'
            for s, d, e in filas)
        partes.append(f'<h4>{html.escape(grupo)}</h4><div class="glx"><table class="gtab"><tbody>{cuerpo}</tbody></table></div>')
    return (f'<details class="{clase}"{" open" if abierto else ""}><summary>Siglas y términos usados ({n}) · '
            f'haz clic para desplegar</summary><div class="gbody">{"".join(partes)}</div></details>')


GLOSARIO_CSS = """
details.gloss{margin:28px 0 8px;border:1px solid var(--line, var(--grid));border-radius:10px;background:var(--card, var(--surface))}
details.gloss>summary{cursor:pointer;padding:12px 16px;font-weight:650;list-style:none;user-select:none}
details.gloss>summary::-webkit-details-marker{display:none}
details.gloss>summary:before{content:"▸ ";color:var(--muted)}
details.gloss[open]>summary:before{content:"▾ "}
details.gloss .gbody{padding:0 16px 14px}
details.gloss h4{margin:14px 0 6px;font-size:12px;text-transform:uppercase;letter-spacing:.05em;color:var(--muted)}
details.gloss .glx{overflow-x:auto}
table.gtab{border-collapse:collapse;width:100%;font-size:13px;min-width:0}
table.gtab th{width:190px;text-align:left;vertical-align:top;padding:6px 10px 6px 0;font-weight:650;white-space:normal;background:transparent;text-transform:none;letter-spacing:0;color:var(--ink);font-size:13px}
table.gtab td{padding:6px 0;vertical-align:top;border-bottom:1px solid var(--line, var(--grid))}
table.gtab th{border-bottom:1px solid var(--line, var(--grid))}
@media (max-width:600px){table.gtab th{width:110px}}
"""
