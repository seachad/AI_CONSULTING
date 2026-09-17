# Guía de conversación con el consejo

**Cómo hablar de IA con un consejo de administración: lenguaje, formato de respuesta, preguntas y guion de sesión**

| | |
|---|---|
| Documento | Documento 61 · Guía de conversación con el consejo |
| Versión | 0.1 (borrador de trabajo) |
| Fecha | 16-09-2026 |
| Autor | Fernando García · SEACHAD |
| Estado | Borrador para revisión. Integra el guion de sesión y las preguntas del mapa de esferas. |

<!-- cifras: 4 | formatos de respuesta ; 3 | casos en detalle por sesión ; 9 | esferas con preguntas para el consejo ; 60 | minutos de guion de sesión -->

---

> **Aviso legal y exención de responsabilidad.** SEVEN-G es un marco metodológico de referencia que se ofrece «tal cual» y con fines exclusivamente informativos. No constituye asesoramiento jurídico, regulatorio, financiero ni profesional, ni garantiza el cumplimiento de ninguna norma. Las referencias a regulación general (como el Reglamento Europeo de IA, el RGPD, DORA o NIS2), a normas técnicas y a regulación específica de cada sector o jurisdicción pueden ser incompletas, no aplicar a un caso concreto o quedar desactualizadas por cambios normativos, interpretaciones o criterios de las autoridades posteriores a su fecha de consulta. **Cada organización que use SEVEN-G es la única responsable de identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio**, con el asesoramiento cualificado que corresponda. El autor y SEACHAD no asumen responsabilidad alguna por el uso que se haga de este contenido ni por las decisiones que se adopten con él. Los datos, cifras, compañías y casos de los ejemplos son ficticios o ilustrativos.

## 1. Objeto y alcance

Esta guía ayuda a quien presenta la IA ante un consejo de administración o su comisión delegada —alta dirección, presidencia del comité de IA, oficina de IA, consejero o asesor con experiencia en IA— a mantener una conversación **útil para decidir y supervisar**.

Contiene:

- El lenguaje que se debe usar y los términos que conviene evitar.
- El formato de respuesta al consejo (especificación común §5.8), con ejemplos.
- Cuántos casos presentar y cómo elegirlos.
- Preguntas de referencia por esfera (las nueve) y por etapa del ciclo corporativo (C1–C5).
- Un guion detallado para una sesión de 60 minutos y su variante para sesiones de supervisión.
- Las preguntas difíciles más frecuentes y cómo responderlas con evidencia.
- El papel del consejero o asesor con experiencia en IA.
- Los errores más frecuentes.

El contenido del paquete que se entrega antes de la sesión está en el documento 60.

---

## 2. Principios de la conversación

| # | Principio | Qué significa en la sala |
|---|---|---|
| 1 | **El consejo decide sobre negocio, no sobre tecnología** | Se habla de riesgo, oportunidad, responsabilidad, ventaja competitiva y dinero. La tecnología solo aparece cuando cambia una de esas cosas. |
| 2 | **Primero la respuesta** | Cada respuesta empieza por uno de los cuatro formatos de la sección 4. Después, el motivo y la evidencia. |
| 3 | **Toda cifra tiene estado** | Validado, declarado o estimado. Si no se sabe, se dice "sin dato" y cuándo habrá dato. |
| 4 | **Pocos casos, bien contados** | Tres casos en detalle como máximo. El resto está en el panel. |
| 5 | **Decir lo que no funciona** | Paradas, retiradas, incidentes y valor no materializado se presentan con la misma claridad que los éxitos. |
| 6 | **Cada pregunta del consejo termina en el registro** | Si una pregunta no se puede responder en la sesión, se convierte en una recomendación o encargo con responsable y fecha (documento 62). |
| 7 | **Nadie defiende su propio examen** | Quien presenta una iniciativa no valora su cumplimiento; la valoración la hace alguien independiente. |

---

## 3. Lenguaje de negocio

### 3.1 Reglas

1. **Una idea por frase.** Frases cortas, verbos concretos.
2. **Dinero con fórmula.** "36 averías evitadas por 31.000 € de diferencia de coste por avería" se entiende y se puede comprobar; "reducción significativa de averías" no.
3. **Personas con rol.** "El médico revisa y firma la nota" en lugar de "hay supervisión humana".
4. **Plazos con fecha.** "Estará medido en la sesión de marzo" en lugar de "próximamente".
5. **Incertidumbre declarada.** "Todavía no sabemos si… Lo sabremos cuando…".
6. **Sin adjetivos de venta.** Nada de "revolucionario", "disruptivo", "de última generación".

### 3.2 Términos que conviene evitar y cómo decirlos

| En lugar de… | Decir… | Por qué |
|---|---|---|
| "El modelo tiene un AUC de 0,85" | "De cada 100 clientes que el sistema señala como de riesgo, tantos lo son realmente; a cambio, se equivoca con tantos" | El consejo necesita el efecto en aciertos y errores, no la métrica. |
| "Hemos lanzado una PoC" | "Estamos haciendo una prueba acotada de tres meses; en junio decidiremos si sigue o se para" | Una prueba sin fecha de decisión es un coste abierto. |
| "ROI del 300 %" | "Neto anual de 900.000 €: eficiencias de 1,1 M€ menos coste recurrente de 210.000 €, validado por control de gestión" | El ROI agregado oculta casos con valor negativo y no dice qué está validado. |
| "Hemos ahorrado 20.000 horas" | "Hemos liberado 20.000 horas; de ellas, 6.000 se han reasignado y ninguna ha reducido todavía el coste" | La capacidad liberada no es ahorro hasta que se materializa. |
| "Transformación digital con IA" | "Esta iniciativa hace lo mismo con menos coste: es optimización" o "Esta iniciativa crea un servicio que no existía: es transformación" | La palabra se usa para cosas distintas. |
| "IA responsable" | "Antes de producción se ha probado si trata peor a algún colectivo; el resultado es…" | Un principio sin control verificable no informa. |
| "Alucinaciones" | "Respuestas incorrectas presentadas como ciertas" | Término técnico y coloquial a la vez. |
| "Inyección de *prompts*" | "Manipulación del sistema mediante instrucciones ocultas en textos o documentos" | Describe el riesgo, no la técnica. |
| "*Human in the loop*" | "Una persona valida cada acción antes de ejecutarla" (A1) o "El sistema actúa y una persona revisa después" (A2) | La diferencia entre ambos es la que importa al consejo. |
| "Deriva del modelo" | "El sistema pierde precisión con el tiempo porque la realidad ha cambiado; se vigila así…" | |
| "Agentes" sin más | "Un sistema que, además de recomendar, ejecuta acciones: envía comunicaciones, modifica datos o hace pagos" | El riesgo depende de lo que puede hacer. |
| "Guardarraíles" | "Límites que impiden al sistema hacer determinadas cosas, por ejemplo, conceder reembolsos por encima de un importe" | |
| "LLM", "RAG", "*fine-tuning*" | Evitarlos. Si es imprescindible: "modelo de lenguaje que responde con la documentación interna" | No cambian la decisión del consejo. |
| "Estamos a la vanguardia del sector" | Omitirlo o citar una fuente verificable con fecha | Sin fuente es una afirmación no demostrable. |
| "Riesgo controlado" | "Riesgo residual Medio, con estos dos controles, probados en tal fecha" | |
| "Cumplimos el Reglamento de IA" | "De 42 sistemas inventariados, 38 están clasificados con criterio jurídico; 3 son de alto riesgo y 2 tienen su evaluación de impacto" | El cumplimiento es un estado por sistema, no una afirmación global. |

---

## 4. Formato de respuesta al consejo

### 4.1 Los cuatro formatos

Toda pregunta del consejo que admita una respuesta de sí o no, y toda propuesta de decisión, se responde con uno de estos cuatro formatos (especificación común §5.8):

| Formato | Cuándo se usa | Qué debe incluir |
|---|---|---|
| **"Sí"** | La respuesta es afirmativa y hay evidencia verificada. | La evidencia principal en una frase. |
| **"Sí, con una condición: …"** | Es afirmativa si se cumple algo concreto. | La condición, su responsable y su plazo. Una sola condición; si hay varias, la respuesta real es "todavía no". |
| **"Todavía no, porque falta …"** | Puede llegar a ser afirmativa, pero hoy no lo es. | Qué falta exactamente, quién lo aporta y cuándo se volverá a traer. |
| **"No, porque …"** | La respuesta es negativa. | El motivo principal y, si existe, la alternativa. |

Reglas:

- **No se responde "depende".** Si depende de algo, el formato es "Sí, con una condición" o "Todavía no, porque falta".
- **La condición no puede afectar a controles críticos** de seguridad, cumplimiento legal o supervisión humana (01 §7.3). Si falta uno de esos controles, la respuesta es "Todavía no".
- **"Todavía no" genera un compromiso registrado** con responsable y fecha (documento 62).
- **"No" es una respuesta válida y valiosa.** Evitar una mala inversión también es generar valor.

### 4.2 Ejemplos

*Todos los ejemplos son ficticios.*

**"Sí"**

> **Pregunta:** ¿Podemos parar el agente de atención si empieza a fallar?
> **Respuesta:** Sí. Tiene un interruptor de parada que desvía todas las conversaciones a personas; se probó en el simulacro de mayo y tardó cuatro minutos.

> **Pregunta:** ¿Tienen todas las iniciativas en producción su revisión de continuidad al día?
> **Respuesta:** Sí. Las 14 tienen revisión en los últimos tres meses, verificada por el auditor de IA; el detalle está en el bloque de cartera del panel.

**"Sí, con una condición: …"**

> **Pregunta:** ¿Ampliamos la documentación clínica automática a todas las consultas?
> **Respuesta:** Sí, con una condición: que dirección médica apruebe antes de enero a qué actividad se destinan las horas liberadas. Sin esa reasignación, la ampliación añade coste y no añade valor.

> **Pregunta:** ¿Autorizamos la primera etapa del servicio por suscripción?
> **Respuesta:** Sí, con una condición: que la inversión de la etapa no supere 400.000 € y que la decisión de seguir se traiga en nueve meses con los contratos firmados.

**"Todavía no, porque falta …"**

> **Pregunta:** ¿Ponemos en producción el sistema de priorización de inspecciones?
> **Respuesta:** Todavía no, porque falta la evaluación de impacto en derechos fundamentales. La asesoría jurídica la entrega el 15 de noviembre y se trae a la sesión de diciembre.

> **Pregunta:** ¿Cuánto valor aporta la IA generativa en la compañía?
> **Respuesta:** Todavía no lo podemos decir, porque falta medirlo con grupo de control. Hoy tenemos uso (1.200 usuarios semanales) y coste (330.000 € al año), pero no valor. Control de gestión presentará el método en la próxima sesión.

**"No, porque …"**

> **Pregunta:** ¿Dejamos que el sistema de optimización de baterías opere en el mercado sin supervisión?
> **Respuesta:** No, porque una orden ejecutada en el mercado no se puede revertir y el riesgo residual es Crítico, fuera del apetito aprobado. La alternativa es que recomiende y un operador decida.

> **Pregunta:** ¿Podemos decir que la compañía se está transformando con IA?
> **Respuesta:** No, porque el 92 % del valor validado procede de eficiencias y ninguna iniciativa de Transformar ha llegado a producción. Somos eficientes, que es un buen resultado, pero no es transformación.

### 4.3 Estructura de una intervención

1. **Respuesta** con uno de los cuatro formatos (una frase).
2. **Motivo** (una o dos frases).
3. **Evidencia**: qué documento, dato o prueba lo sostiene y quién lo ha verificado.
4. **Lo que se pide al consejo**: decidir, tomar conocimiento o nada.

---

## 5. Cuántos casos presentar

### 5.1 Regla

En cada sesión se presentan **como máximo tres casos en detalle**. Tres casos permiten que el consejo entienda, pregunte y decida; con más, la sesión se convierte en una exposición y las decisiones se aplazan.

### 5.2 Cómo elegirlos

Los criterios de selección son los del documento 60 (sección 4.8). Una combinación equilibrada suele ser:

| Caso | Qué aporta al consejo |
|---|---|
| **Un caso que requiere decisión** | La sesión tiene un propósito concreto. |
| **Un caso de riesgo, incidente, parada o retirada** | El consejo ve que el sistema de control funciona y aprende de lo que no sale bien. |
| **Un caso de valor o de transformación** | El consejo sigue sus apuestas y el valor con evidencia. |

### 5.3 Cómo contar un caso en cinco minutos

| Minuto | Contenido |
|---|---|
| 1 | Qué es y para qué se usa, en lenguaje de negocio. Esfera y nivel de ambición. |
| 2 | Qué valor aporta: fórmula, importe y estado de validación; coste recurrente; neto. |
| 3 | Qué riesgo tiene: nivel residual, clasificación regulatoria, quién supervisa y cómo se para. |
| 4 | Qué ha pasado desde la última sesión y qué ha decidido quien corresponde. |
| 5 | Qué se pide al consejo, con el formato de respuesta. |

---

## 6. Preguntas por esfera

Las preguntas de referencia proceden del mapa de esferas (00 §4.1). Cada esfera incluye preguntas de seguimiento, la evidencia que el consejo debería pedir y la señal que debería llamar su atención.

### 6.1 Esferas donde se genera valor

| Esfera | Pregunta de referencia | Preguntas de seguimiento | Evidencia que pedir | Señal de alerta |
|---|---|---|---|---|
| **01 · Cliente** | Si un competidor conoce mejor a nuestros clientes porque usa mejor la IA, ¿cuánto tardamos en perder relevancia? | ¿Qué decisiones sobre clientes toma o prepara hoy un sistema? ¿Sabemos si trata peor a algún colectivo? ¿Qué parte de la relación con el cliente pasa por un asistente? | Casos por nivel de ambición en la esfera; retención o conversión medidas con grupo de control; pruebas de equidad; tasas de derivación a personas. | Todo el valor declarado en la esfera es ahorro de atención; no hay ningún caso de retorno medido. |
| **02 · Producto y servicio** | ¿Usamos la IA para proteger el producto actual o para construir el siguiente? | ¿Hay algún producto o servicio que solo exista gracias a la IA? ¿Compiten por los mismos recursos la protección y la construcción? | Iniciativas de Transformar en la esfera con sus hitos de aprendizaje y límite por etapa; ingresos habilitados por IA. | Ninguna apuesta de Transformar aprobada, o apuestas aprobadas sin criterios de parada. |
| **03 · Personas** | ¿La IA sustituye, aumenta o reorganiza el trabajo de las personas? | ¿Qué ocurre con la capacidad liberada? ¿Hemos informado a la representación de los trabajadores cuando corresponde? ¿Qué nuevos roles necesitamos? | Posición aprobada por la dirección; capacidad liberada materializada y reasignada; plan de formación y alfabetización en IA; sistemas que evalúan a empleados y su clasificación. | Horas liberadas presentadas como ahorro; ninguna posición explícita sobre el efecto en el empleo. |
| **04 · Operaciones** | ¿Qué procesos tienen un retorno demostrable a corto plazo y cuáles requieren un rediseño completo? | ¿Se automatizan tareas o se rediseñan procesos de extremo a extremo? ¿Qué pasa si el sistema se cae? | Línea base y valor validado por proceso; plan de reversión probado; incidentes y tiempo de recuperación. | Muchos pilotos sin fecha de decisión; sin plan de reversión en procesos críticos. |

### 6.2 Esferas habilitadoras

| Esfera | Pregunta de referencia | Preguntas de seguimiento | Evidencia que pedir | Señal de alerta |
|---|---|---|---|---|
| **05 · Datos** | ¿Sabemos qué datos tenemos, quién responde de su calidad y si podemos usarlos legalmente para IA? | ¿Cuántas iniciativas se han parado o retrasado por datos? ¿Qué datos compartimos con proveedores de modelos y en qué condiciones? | Responsables de datos por dominio; motivos de parada por datos insuficientes; base legal documentada; cláusulas de uso de datos en contratos. | "Datos insuficientes" es el motivo de parada más frecuente y no hay iniciativa para resolverlo. |
| **06 · Conocimiento** | ¿Cuánto conocimiento crítico depende de pocas personas y no está disponible para la organización? | Si mañana se fueran las personas que más saben, ¿qué se perdería? ¿Los asistentes internos responden con fuentes verificables? | Mapa de conocimiento crítico; asistentes con medición de respuestas correctas y fuentes citadas. | Asistentes internos en uso sin medición de la calidad de las respuestas. |
| **07 · Decisión** | ¿Qué decide la IA sola, qué requiere validación humana y qué no se delega nunca? | ¿Hay sistemas que actúan sin revisión individual? ¿Queda registrado qué recomendó el sistema y qué decidió la persona? | Inventario con nivel de autonomía A0–A3; lista aprobada de decisiones no delegables; registro de acciones de los agentes. | No existe una lista de decisiones no delegables: se está delegando por defecto. |

### 6.3 Límites y meta-esfera

**08 · Regulación, ética y responsabilidad.** Pregunta de referencia: *¿Gobernamos de forma proactiva o esperamos a que el regulador nos obligue?*

| Eje de evaluación | Preguntas | Evidencia que pedir |
|---|---|---|
| **Cumplimiento** | ¿Están todos los sistemas inventariados y clasificados con criterio jurídico? ¿Se han hecho las evaluaciones de impacto que corresponden? ¿Sabemos notificar un incidente grave en plazo? | Inventario con clasificación regulatoria; evaluaciones de protección de datos y de derechos fundamentales; procedimiento y simulacro de notificación. |
| **Anticipación** | ¿Qué obligaciones nuevas nos afectan en los próximos doce meses? ¿Quién vigila los cambios? | Mapeo regulatorio con fechas de consulta y de aplicación (documento 34). |
| **Liderazgo ético** | ¿Tenemos principios propios más allá del mínimo legal? ¿Alguien puede vetar un caso por motivos éticos? ¿Informamos al público de cómo usamos la IA? | Política corporativa aprobada; órgano con capacidad de veto real y decisiones registradas; información pública. |

Señal de alerta: el consejo solo oye hablar de regulación cuando hay una sanción o un incidente.

**09 · Gobierno de la IA.** Pregunta de referencia: *¿Tiene la IA un gobierno corporativo con la misma formalidad que finanzas, riesgos o cumplimiento?*

| Eje de evaluación | Preguntas | Evidencia que pedir |
|---|---|---|
| **Estructura** | ¿Quién tiene la responsabilidad última de la estrategia de IA? ¿Hay una cartera priorizada por valor y riesgo? ¿Recibe el consejo información periódica y comprensible? | Tesis de IA aprobada; comité de IA con mandato; paquete trimestral (documento 60). |
| **Equilibrio entre velocidad y control** | ¿Hay puertas de decisión con capacidad real de parar? ¿Cuánto se tarda desde la idea hasta la aprobación y hasta producción? ¿Se ha parado alguna iniciativa? | Registro de decisiones de *gate*; métricas de agilidad por nivel de riesgo; motivos de parada. |
| **Ecosistema de proveedores** | ¿Dependemos de un solo proveedor de modelos? ¿Decidimos construir, comprar o aliarnos caso a caso? ¿Protegen los contratos nuestros datos y nuestra propiedad intelectual? ¿Entendemos la estructura de costes? | Registro de proveedores con criticidad y estrategia de salida; coste por caso con reparto. |

Señal de alerta: nadie puede decir cuándo se paró la última iniciativa, ni por qué.

---

## 7. Preguntas por etapa del ciclo corporativo

| Etapa | Preguntas del consejo | Evidencia que responde |
|---|---|---|
| **C1 · Diagnóstico** | ¿Cuántos sistemas de IA tenemos, incluidos los de proveedores y los que usan los empleados por su cuenta? ¿Cuál es nuestra madurez real y con qué evidencia? ¿Cuánto valor está validado y cuánto cuesta la IA hoy? ¿Somos eficientes o nos estamos transformando? | Inventario; madurez D1–D7 con evidencia; valor por estado y coste recurrente; perfil del índice de transformación. |
| **C2 · Dirección** | ¿En qué esferas queremos Optimizar, Aumentar o Transformar? ¿Qué riesgos no aceptamos en ningún caso? ¿A partir de qué inversión debe decidir el consejo? ¿Qué no vamos a hacer con IA? | Tesis de IA; ambición por esfera; apetito de riesgo y umbrales; política corporativa; presupuesto marco. |
| **C3 · Cartera** | ¿Qué financiamos y qué paramos? ¿Está equilibrada la cartera entre eficiencia y transformación? ¿Dónde rinde más el siguiente euro? ¿Tenemos capacidad para ejecutarla? | Cartera priorizada con neto adicional por euro; distribución por nivel de ambición; criterios de retirada; capacidad disponible. |
| **C4 · Supervisión** | ¿Se cumple lo decidido? ¿Qué ha cambiado desde la última sesión? ¿Qué incidentes ha habido y cómo se han gestionado? ¿Qué recomendaciones están vencidas? ¿Qué tenemos que decidir hoy? | Paquete trimestral; panel; registro de recomendaciones y decisiones. |
| **C5 · Revisión** | ¿Hemos avanzado en madurez con evidencia? ¿Ha cambiado nuestro perfil de transformación? ¿Se ha cumplido la tesis? ¿Qué hemos aprendido de lo que paramos y retiramos? ¿Qué cambiamos para el próximo ciclo? | Revisión de madurez e índice; ambición real frente a objetivo; motivos de parada y retirada; propuesta de ajustes. |

---

## 8. Guion de una sesión de 60 minutos

### 8.1 Para qué sirve

Es el guion de una **primera sesión de trabajo con el consejo** sobre IA: presenta el mapa de impacto, sitúa a la compañía y termina con un mandato para los primeros noventa días. Se usa antes de C1 o como apertura de C2 cuando el consejo no ha trabajado antes con el marco.

### 8.2 Preparación

| Cuándo | Qué | Quién |
|---|---|---|
| **Dos o tres semanas antes** | Entrevistas breves con la presidencia, la presidencia de la comisión delegada y la alta dirección de negocio, tecnología y riesgos. Inventario preliminar de sistemas de IA. | Quien presenta, con la oficina de IA si existe |
| **Dos semanas antes** | Selección de un ejemplo por nivel de ambición en las esferas 01 a 04, a ser posible de la propia compañía; si no los hay, ejemplos ficticios del sector marcados como tales. | Quien presenta |
| **Una semana antes** | Envío de una nota de dos páginas: objetivo de la sesión, nueve esferas, tres niveles, las preguntas de referencia y la decisión que se pedirá al final. | Secretaría del consejo |
| **El día anterior** | Ensayo con tiempos. Cada bloque cabe en su tiempo o se recorta. | Quien presenta |

### 8.3 Guion

| Bloque | Minutos | Objetivo |
|---|---|---|
| **01 · Encuadre estratégico** | 0–10 | Situar la IA como una cuestión de negocio y presentar el mapa de impacto. |
| **02 · Esferas donde se genera valor** | 10–22 | Ver dónde está hoy la IA de la compañía y dónde podría estar. |
| **03 · Esferas habilitadoras** | 22–32 | Diagnosticar la capacidad real: sin datos, conocimiento y reglas de decisión, nada funciona. |
| **04 · Regulación, ética y responsabilidad** | 32–42 | Saber si la compañía gobierna de forma proactiva o reactiva. |
| **05 · Posición sobre las personas** | 42–50 | Obtener un posicionamiento explícito del consejo sobre el efecto de la IA en el trabajo. |
| **06 · Gobierno de la IA y primeros 90 días** | 50–60 | Cerrar con una decisión: mandato, responsable y fecha de vuelta. |

**Bloque 01 · Encuadre estratégico (0–10 minutos)**

| | |
|---|---|
| **Pregunta de apertura** | "¿En qué negocio estamos y cómo cambia la IA sus reglas?" |
| **Qué se presenta** | Por qué la IA es un asunto del consejo: riesgo, oportunidad, responsabilidad y ventaja competitiva. Las nueve esferas agrupadas en donde se genera valor (01–04), habilitadoras (05–07), límites (08) y meta-esfera (09). Los tres niveles de ambición: Optimizar, Aumentar y Transformar, que no son una escalera sino tres tipos de apuesta con distinto coste, riesgo, plazo y resistencia organizativa. |
| **Material** | Componente gráfico de esferas; tabla de niveles de ambición (00 §4.1). |
| **Qué se pregunta al consejo** | ¿Qué dos o tres esferas les preocupan más hoy? |
| **Resultado** | Esferas prioritarias anotadas para el resto de la sesión. |
| **Evitar** | Empezar por la tecnología o por la evolución de los modelos. |

**Bloque 02 · Esferas donde se genera valor (10–22 minutos)**

| | |
|---|---|
| **Qué se presenta** | Cliente, Producto y servicio, Personas y Operaciones, con un ejemplo de cada nivel de ambición por esfera. Por ejemplo, en Cliente: clasificar y enrutar consultas (Optimizar), personalizar la propuesta a cada cliente (Aumentar), un canal de relación principal atendido por un asistente con supervisión (Transformar). |
| **Material** | Mapa de la cartera actual por esfera y nivel, aunque sea preliminar; si no hay datos, se dice. |
| **Qué se pregunta al consejo** | Las preguntas de referencia de las esferas 01 a 04 (sección 6.1). En particular: "¿Usamos la IA para proteger el producto actual o para construir el siguiente?". |
| **Resultado** | Primera lectura de dónde está la cartera y de si hay alguna apuesta de Transformar. |
| **Evitar** | Recorrer todos los ejemplos posibles. Uno por nivel basta. |

**Bloque 03 · Esferas habilitadoras (22–32 minutos)**

| | |
|---|---|
| **Qué se presenta** | Datos, Conocimiento y Decisión. Diagnóstico honesto de la capacidad real: calidad y base legal de los datos, dependencia del conocimiento de pocas personas, qué decisiones están ya delegadas en sistemas. |
| **Material** | Hallazgos de las entrevistas previas; inventario preliminar con nivel de autonomía si se conoce. |
| **Qué se pregunta al consejo** | "¿Hemos definido qué decisiones puede tomar la IA sola, cuáles requieren validación humana y cuáles no deben delegarse nunca?" |
| **Resultado** | Reconocimiento de las carencias habilitadoras que condicionan cualquier ambición. |
| **Evitar** | Convertir el bloque en una revisión de arquitectura tecnológica. |

**Bloque 04 · Regulación, ética y responsabilidad (32–42 minutos)**

| | |
|---|---|
| **Qué se presenta** | Qué exige el Reglamento Europeo de IA según el nivel de riesgo de cada sistema; protección de datos en decisiones automatizadas; regulación sectorial aplicable. Los tres ejes de evaluación: Cumplimiento, Anticipación y Liderazgo ético. Es, con frecuencia, el tema que más preocupa al consejo. |
| **Material** | Mapeo regulatorio resumido con fecha de consulta; estado del inventario y de la clasificación. |
| **Qué se pregunta al consejo** | "¿Gobernamos de forma proactiva o esperamos a que el regulador nos obligue?" |
| **Resultado** | Saber si existe inventario con clasificación regulatoria y quién responde de él. |
| **Evitar** | Presentar la regulación como un catálogo de sanciones o dar por cerradas interpretaciones que requieren criterio jurídico. |

**Bloque 05 · Posición sobre las personas (42–50 minutos)**

| | |
|---|---|
| **Pregunta** | "¿La IA va a sustituir, aumentar o reorganizar el trabajo de las personas en esta compañía?" |
| **Qué se presenta** | Los tres papeles simultáneos de los empleados ante la IA: **receptores** (les cambian herramientas y expectativas, y de la gestión del cambio depende la adopción), **sujetos** (la IA puede reestructurar o eliminar su puesto, y el consejo responde de cómo se gestiona) y **promotores** (quien mejor conoce un proceso identifica usos que nadie de fuera vería). |
| **Qué se pide al consejo** | Un posicionamiento explícito, aunque sea provisional. Si el consejo no está en condiciones de fijarlo, se encarga una propuesta para C2 con fecha. |
| **Resultado** | Posición o encargo registrado. |
| **Evitar** | Rebajar la pregunta para que resulte cómoda. Esa respuesta define la cultura, la capacidad de atraer y retener talento y la relación con la plantilla durante años. |

**Bloque 06 · Gobierno de la IA y primeros 90 días (50–60 minutos)**

| | |
|---|---|
| **Qué se presenta** | La meta-esfera: Estructura, Equilibrio entre velocidad y control y Ecosistema de proveedores. El plan de noventa días de 01 §5.3: **mes 1**, diagnóstico de madurez con evidencia e inventario; **mes 2**, mapa de riesgos y oportunidades por esfera con responsable, impacto económico y plazo; **mes 3**, estructura de gobierno con órganos, roles, umbrales, *gates*, métricas y ritmo de reporte. |
| **Qué se pide al consejo** | Decisión con el formato de la sección 4: "¿Encargamos el diagnóstico y la estructura de gobierno en noventa días?". |
| **Resultado** | Decisión registrada (DEC) con responsable ejecutivo, órgano que recibe el resultado y fecha de la sesión de vuelta. |
| **Evitar** | Terminar sin decisión o con "lo estudiaremos". |

### 8.4 Después de la sesión

| Plazo | Acción | Responsable |
|---|---|---|
| **2 días hábiles** | Nota de conclusiones: esferas prioritarias, posición sobre personas, decisión adoptada. | Quien presenta |
| **5 días hábiles** | Registro de decisiones y encargos con código, responsable y fecha (documento 62). | Secretaría del consejo |
| **Siguiente sesión** | Primer punto del orden del día: estado de lo decidido. | Presidencia del comité de IA |

### 8.5 Variante para sesiones de supervisión (C4)

| Minutos | Contenido | Documento de apoyo |
|---|---|---|
| 0–5 | Mensaje principal con formato de respuesta; cambios desde la sesión anterior. | Resumen de una página (60 §4.2) |
| 5–20 | Decisiones solicitadas, una a una. | Fichas de decisión (60 §5) |
| 20–35 | Tres casos en detalle, cinco minutos cada uno. | Sección 5.3 de esta guía |
| 35–45 | Riesgos, incidentes y no conformidades; semáforo de programas. | 60 §4.5, §4.6 y §9 |
| 45–55 | Recomendaciones vencidas y discrepancias entre estado declarado y valoración. | Registro (documento 62) |
| 55–60 | Resumen de decisiones y encargos, con responsable y fecha. | — |

---

## 9. Preguntas difíciles frecuentes

Las respuestas son orientativas y se adaptan con los datos de la compañía. Todas las cifras de los ejemplos son ficticias.

| # | Pregunta | Cómo responder | Evidencia que la sostiene | Qué evitar |
|---|---|---|---|---|
| 1 | **¿Cuánto nos ahorra la IA?** | Separar eficiencias, retorno y coste recurrente; dar el neto y la proporción validada; indicar aparte la capacidad liberada no materializada. | Seguimiento de valor por caso con estado (T12). | Una cifra única sin estado o que suma horas liberadas. |
| 2 | **¿Vamos por detrás de la competencia?** | "No tenemos una comparación fiable" si no hay fuente verificable. Ofrecer la comparación que sí es fiable: la compañía consigo misma en el tiempo (madurez, índice, agilidad). | Madurez e índice de transformación con evidencia; fuentes externas solo si son verificables y con fecha. | Citar cifras de mercado sin fuente. |
| 3 | **¿Por qué no usamos agentes como hacen otros?** | Responder por esferas y riesgo: dónde tendría sentido que un sistema actúe, con qué nivel de autonomía y qué controles harían falta. Si hay una propuesta, llevarla por el ciclo. | Inventario con autonomía A0–A3; criterios de seguridad de agentes (documento 35). | Adoptar una tecnología para no parecer rezagados. |
| 4 | **¿Cuántos empleos va a eliminar la IA?** | Dar la posición aprobada (sustituir, aumentar o reorganizar) y los datos: capacidad liberada, materializada y reasignada; puestos afectados; plan de formación. Si no hay posición, decirlo y proponer fijarla en C2. | Plan de adopción y capacidad (T20); documento 50. | Negar el efecto o dar cifras sin base. |
| 5 | **¿Cumplimos el Reglamento de IA?** | Responder por sistema: cuántos inventariados, cuántos clasificados con criterio jurídico, cuántos de alto riesgo y con qué evaluaciones hechas o pendientes. Indicar la fecha de consulta de la norma. | Inventario y clasificación (T02, T07); mapeo regulatorio (documento 34). | "Sí, cumplimos" sin inventario completo. |
| 6 | **¿Quién responde si la IA se equivoca?** | Nombrar los roles: el patrocinador responde del valor y de la inversión; el responsable de operación, de la estabilidad y los incidentes; el responsable de riesgos, de la evaluación y el seguimiento; la compañía responde ante terceros. La responsabilidad no se traslada al sistema ni al proveedor. | Registro de asignación de roles (P03); contratos con proveedores. | "Es responsabilidad del proveedor". |
| 7 | **¿Por qué hemos parado esto después de invertir?** | "Porque no se cumplió el criterio de parada fijado antes de invertir". Dar la inversión consumida, la que se evitó y lo aprendido. | Registro de decisión de *gate* con criterios de parada (P29). | Justificarse o presentar la parada como un fracaso del equipo. |
| 8 | **¿Por qué tardamos tanto en poner algo en producción?** | Dar los tiempos por tramo (idea → aprobación → producción) y por nivel de riesgo; señalar el cuello de botella y qué se propone. | Métricas del embudo (03 §3.5). | Proponer saltarse *gates* sin analizar dónde está el retraso. |
| 9 | **¿Qué pasa si el sistema falla o nos atacan?** | Explicar la severidad de los incidentes posibles, la contención, el interruptor de parada o el plan de reversión probado y los plazos de notificación. | Plan de respuesta a incidentes (P26); prueba de reversión; simulacros. | Afirmar que no puede ocurrir. |
| 10 | **¿Dependemos demasiado de un proveedor?** | Dar la concentración: qué casos dependen de cada proveedor, su criticidad y si hay estrategia de salida probada o solo escrita. | Registro de proveedores (T09); nivel de exigencia N1–N3. | "Es el líder del mercado" como respuesta. |
| 11 | **¿Esto es transformación o solo eficiencia?** | Aplicar las cinco preguntas de clasificación (00 §5.2) en la sala. Si las cuatro primeras son negativas, es optimización, y está bien que lo sea. | Clasificación de ambición confirmada (P07). | Llamar transformación a una automatización. |
| 12 | **¿Por qué es tan bajo el valor validado?** | Explicar qué falta para validar (línea base, grupo de control, validación de control de gestión) y el plan con fechas. Un porcentaje bajo y honesto es preferible a uno alto sin respaldo. | Seguimiento de valor por estado (T12). | Reclasificar importes declarados como validados. |
| 13 | **¿Cuánto cuesta de verdad la IA?** | Dar el coste recurrente por categorías y por caso, incluido el consumo de modelos y las personas de operación. Si hay costes sin imputar, decirlo. | Coste por caso con reparto (T13; documento 42). | Presentar solo las licencias. |
| 14 | **¿Usan los empleados herramientas de IA no autorizadas?** | Dar lo que se sabe: detecciones, controles técnicos activos, formación, regularizaciones. Si no se mide, "Todavía no lo sabemos, porque falta…". | Monitor de uso corporativo (T21); no conformidades por uso no autorizado. | Decir que no ocurre porque está prohibido. |
| 15 | **¿Podemos acelerar si relajamos los controles?** | "Sí, con una condición" solo para controles no críticos y con aceptación del riesgo por quien corresponde; "No" para seguridad, cumplimiento legal y supervisión humana. | Apetito de riesgo aprobado en C2; reglas de condiciones (01 §7.3). | Aceptar la presión de plazo sin registro. |

---

## 10. Papel del consejero o asesor con experiencia en IA

### 10.1 Para qué sirve

SEVEN-G prevé que el consejo o su comisión delegada puedan apoyarse en un **consejero o asesor con experiencia en IA** (01 §8.3). Su función es ayudar al consejo a **preguntar bien, interpretar la evidencia y seguir lo decidido**, no gestionar la IA de la compañía.

### 10.2 Qué hace y qué no hace

| Hace | No hace |
|---|---|
| Ayuda a preparar el orden del día y las preguntas del consejo. | Dirigir la oficina de IA ni el comité de IA. |
| Revisa el paquete antes de la sesión y señala cifras sin estado, ausencias no declaradas y tecnicismos. | Elaborar el paquete que luego revisa. |
| Traduce a lenguaje de negocio las cuestiones técnicas que plantean la dirección o el consejo. | Tomar decisiones que corresponden al consejo, al comité o a los patrocinadores. |
| Formula recomendaciones al consejo, que se registran con código (documento 62). | Asignarse a sí mismo la valoración de recomendaciones cuya ejecución depende de trabajos que él o su organización prestan. |
| Aporta la valoración independiente del cumplimiento de recomendaciones cuando el consejo se la encarga. | Valorar como cumplido lo que no tiene evidencia. |
| Contribuye a la formación del consejo en IA. | Recomendar proveedores, productos o servicios en los que tenga interés. |

### 10.3 Independencia

- **Declaración de intereses** al inicio del mandato y cada vez que cambie: relaciones con proveedores de tecnología, consultoras y la propia compañía.
- **Incompatibilidad** con la prestación de servicios de implantación en las mismas iniciativas que supervisa (documento 91, sección 5).
- **Acceso a la información** a través de la secretaría del consejo y de los canales formales, no mediante relaciones directas con los equipos que eludan la dirección.
- **Confidencialidad**: la información de la compañía no se usa en ningún otro ámbito.

### 10.4 Formación del consejo

El Reglamento Europeo de IA incluye obligaciones de alfabetización en IA para el personal de proveedores y responsables del despliegue (artículo 4). Con independencia de su alcance exacto para los órganos de administración, que debe valorarse con criterio jurídico, el consejo debería recibir formación suficiente para ejercer su supervisión. Una sesión inicial con el guion de la sección 8 y una actualización anual con la revisión C5 son una base razonable. Referencias regulatorias consultadas en septiembre de 2026; se debe verificar su vigencia. *Este documento no constituye asesoramiento jurídico.*

---

## 11. Errores frecuentes

| Error | Consecuencia | Qué hacer |
|---|---|---|
| Presentar un inventario de proyectos técnicos | El consejo no puede priorizar ni exigir. | Presentar esferas, niveles de ambición, valor y riesgo. |
| Llevar diez casos a la sesión | No se decide nada y la sesión se alarga. | Tres casos en detalle; el resto en el panel. |
| Dar cifras sin estado de validación | Decisiones sobre valor que no existe. | Estado en cada importe y proporción validada visible. |
| Sumar las horas liberadas como ahorro | Valor inflado que no aparece en la cuenta de resultados. | Informar aparte la capacidad liberada. |
| Responder "depende" | El consejo no sabe qué decidir. | Usar uno de los cuatro formatos. |
| Ocultar paradas e incidentes | Pérdida de confianza cuando se conocen. | Presentarlos con lo aprendido. |
| Llamar transformación a cualquier iniciativa | La compañía cree que se transforma y no toma las decisiones que exigiría hacerlo. | Clasificar con las cinco preguntas. |
| Terminar la sesión sin decisiones registradas | Lo hablado depende de la memoria de los asistentes. | Registrar decisiones y encargos con código, responsable y fecha. |
| Que quien presenta una iniciativa valore su cumplimiento | Autoevaluación sin credibilidad. | Valoración independiente en el registro. |
| Compararse con el mercado sin fuente | Afirmaciones que no resisten una pregunta. | Compararse con uno mismo en el tiempo o citar fuentes verificables. |
| Hablar de modelos en lugar de decisiones | El consejo se desconecta. | Traducir con la tabla de la sección 3.2. |
| Pedir aprobación sin opciones | El consejo no puede ejercer su función. | Incluir al menos dos opciones, una de ellas no hacer o parar. |

---

## 12. Herramientas y plantillas asociadas

| Código | Nombre | Uso en este documento |
|---|---|---|
| T05 | Clasificador de ambición | Pregunta difícil 11; clasificación en la sala. |
| T15 | Diagnóstico de madurez | Bloque 06 del guion; etapa C1. |
| T16 | Mapa de esferas de la cartera | Bloques 02 y 03 del guion. |
| T17 | Panel de IA para el consejo | Casos en detalle y sesiones de supervisión. |
| T18 | Registro de recomendaciones del consejo | Registro de decisiones y encargos tras cada sesión. |
| P07 | Clasificación de esfera y ambición | Evidencia de la clasificación. |
| P29 | Registro de decisión de *gate* | Respuesta a paradas y criterios. |
| P31 | Ficha de caso de uso | Cómo contar un caso en cinco minutos. |

---

## 13. Documentos relacionados

| Documento | Relación |
|---|---|
| **00 · Qué es SEVEN-G y para qué sirve** | Esferas, niveles de ambición, preguntas de referencia y reglas de medición. |
| **01 · Metodología fundacional** | Ciclo corporativo, órganos y reglas de decisión. |
| **10 · Mapa de esferas y niveles de ambición** | Desarrollo de las esferas y sus indicadores. |
| **13 · Tesis de IA, ambición y apetito de riesgo** | Decisiones del consejo en C2. |
| **34 · Mapeo regulatorio** | Base de las respuestas regulatorias. |
| **35 · Seguridad de IA y agentes** | Autonomía, controles de agentes y exposición a ataques. |
| **50 · Personas y organización** | Posición sobre las personas y capacidad liberada. |
| **60 · Paquete para el consejo** | Información que se entrega antes de la sesión. |
| **62 · Registro de recomendaciones y decisiones** | Registro de lo que se decide y se encarga. |
| **90 · Guía de implantación** | Primeros noventa días. |
| **91 · Guía para consultores** | Independencia del asesor. |

---

## 14. Control de versiones

| Versión | Fecha | Cambios |
|---|---|---|
| 0.1 | 16-09-2026 | Primera versión. Integra las preguntas y el guion de sesión del mapa de esferas en el marco SEVEN-G; define el lenguaje de negocio, el formato de respuesta al consejo con ejemplos, la regla de tres casos, las preguntas por esfera y por etapa, las preguntas difíciles, el papel del consejero o asesor con experiencia en IA y los errores frecuentes. |
