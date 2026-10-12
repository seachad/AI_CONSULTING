# Batida de códigos (nombre primero) y contraste con «Tu inteligencia artificial corporativa necesita un cuadro de mando»

| Campo | Valor |
|---|---|
| Fecha | 12-10-2026 |
| Estado | **Propuesta, a validar por el autor.** No cambia ningún documento publicado. |
| Petición | (1) «Pegar una batida a toda la metodología»: los códigos de paso, puerta, documento… van hoy primero y confunden; el código debe ir siempre después de la explicación, entre paréntesis, con un vocabulario interno para que cada cosa se llame siempre igual, y enlazado al documento cuando haga falta. (2) Analizar el artículo de Enrique Dans y decir si SEVEN-G está en esa línea, qué hay que modificar y qué falta. |
| Fuente del artículo | Enrique Dans, *Tu inteligencia artificial corporativa necesita un cuadro de mando*, enriquedans.com, 12-10-2026 (versión inglesa en Medium: *Your company's AI needs a scoreboard*; publicado antes en Fast Company). Leído completo en el blog; Medium bloquea la descarga. |

---

## Parte 1 · Batida de códigos: nombre primero, código después

### 1.1 Cómo está hoy

Medido sobre `SEVEN-G/mds/es/` (documentos, plantillas y curso):

| Patrón | Cuántas veces | Ejemplo real |
|---|---|---|
| Fila de tabla que **empieza por el código en negrita** | **1.341** | `\| **HI-05** \| E2 \| Inventario completo con clasificación…` · `\| **P23** \| Firma de puesta en producción \|` |
| Mención «documento NN» en texto corrido | 1.419 | «se mapean en el documento 34» |
| Mención de una puerta por su código (G0–G7) | 2.384 | «en G3 y en cada R6», «G0–G2 en una sesión» |
| Título de sección o rótulo con **código primero** | sistemático | 21 §6: «G0 · Autorización», «G3 · Viabilidad» · 01 §6 y 20: «Fase 3 · Viabilidad y riesgo» |
| Forma **«nombre (código)»**, la que pide el autor | existe, minoritaria | «la política de uso aceptable (documento 31)», «el registro de iniciativas (T01)», «el recorrido de implantación (T23)» (entrada y documento 00) |
| Regla escrita que lo ampara | 02 §2.4 «Referencias cruzadas» | Fija justo lo contrario: «NN §x.y», «documento NN» y «código» como formas de citar. |

Dos observaciones:

1. **El vocabulario ya existe y es coherente; lo que falla es el orden.** Las puertas se llaman igual en 01, 20, 21 y 22 (Autorización, Oportunidad, Hipótesis, Viabilidad, Diseño, Puesta en producción, Revisión de continuidad, Escalado o retirada); las fases, igual en 01 y 20; los hitos tienen nombre en 96; cada documento, plantilla, herramienta y módulo tiene su título en `codigos.js` (lo genera `codigos.ps1` en cada compilación). No hace falta inventar nombres: hace falta **una lista única de nombres canónicos** y la regla de ponerlos delante.
2. **El lector nuevo lee código y no sabe qué es.** «G3 por separado» obliga a saber que G3 es la puerta de viabilidad y que es la de parada; «Viabilidad: la puerta de parada, que se decide siempre por separado (G3)» se entiende sin haber leído nada antes. El enlace automático con tooltip (D94, D99) mitiga en HTML, pero no en PDF, en Word ni en el curso en presentación.

### 1.2 La regla propuesta (R16, en 02 §2.4)

> **Nombre primero, código después.** Todo elemento del marco con código (documento, plantilla, herramienta, módulo, fase, puerta, criterio, lista, hito, regla del núcleo, indicador, riesgo tipo, control, dimensión de madurez, ciclo C1–C5, perfil, arquetipo) se cita por su **nombre canónico** y, a continuación, su código entre paréntesis: *la puerta de viabilidad (G3)*, *el registro de iniciativas (T01)*, *la matriz y registro de riesgos (P12)*, *las reglas de medición del valor (documento 40)*. En HTML el código es el enlace (ya lo hace `build.ps1`); en PDF y Word se lee igual.
>
> **Primera mención en la sección: nombre (código). Siguientes menciones en la misma sección: solo el nombre.** El código solo aparece suelto (a) en las tablas cuya primera columna es un identificador, que pasan a llevar el nombre en la primera columna y el código en la segunda, y (b) dentro de las herramientas y los registros, donde el código es el dato.
>
> **Un nombre, un código.** Los nombres canónicos viven en una sola lista (`SEVEN-G/build/nombres.json`, ES/EN; la generan `codigos.ps1` para documentos, plantillas, herramientas y módulos, y las tablas de 01 §6.1, 21 §6, 96 §4.1 y 01 §14.1 para fases, puertas, hitos y núcleo). `verificar_coherencia.ps1` falla si un nombre se escribe de dos formas distintas o si un código aparece delante de su nombre en un título, un rótulo o una primera columna.

Casos que conviene fijar en la regla, porque son los que más se repiten:

| Hoy | Propuesta |
|---|---|
| «en G3 y en cada R6» | «en la puerta de viabilidad (G3) y en cada revisión de continuidad (R6)» |
| «G0–G2 en una sesión, G3 por separado, G4–G5 en una sesión» | «entrada (autorización, oportunidad e hipótesis, G0–G2) en una sesión; viabilidad (G3) por separado; puesta en uso (diseño y puesta en producción, G4–G5) en una sesión» (es exactamente la forma que ya usa Express en 01 §9.4) |
| «documento 40» | «las reglas de medición del valor (documento 40)» la primera vez; después «las reglas de medición» |
| «01 §7.3» | «los resultados posibles de una puerta (01 §7.3)»: la referencia con sección se mantiene, pero precedida de qué hay allí |
| `\| **G3.05** \| Plan de realización en borrador… \|` | `\| Plan de realización en borrador… \| G3.05 \|` (columnas intercambiadas) |
| Título «G3 · Viabilidad» | «Viabilidad (G3)» |
| Título «Fase 3 · Viabilidad y riesgo» | «Viabilidad y riesgo (fase 3)» |
| «HI-05 inventario completo» | «inventario completo con clasificación (HI-05)» |
| «D6 ≥ 2» | «riesgo y cumplimiento (D6) en nivel 2 o superior» |

Lo que **no** cambia: los códigos siguen existiendo (son lo que hace navegable el sitio y lo que leen las herramientas); el índice de códigos y el buscador no se tocan; la convención «NN §x.y» sigue valiendo para la referencia precisa, solo que precedida de qué se va a encontrar.

### 1.3 Cómo se hace sin que sea una reescritura a mano de 45 documentos

| Paso | Qué | Cómo | Tamaño |
|---|---|---|---|
| **1 · Lista de nombres canónicos** | `nombres.json` (ES/EN) con código → nombre corto y nombre largo | Generado: `codigos.ps1` ya extrae títulos; se añaden fases, puertas, hitos, núcleo, dimensiones, ciclos, perfiles | Una sesión |
| **2 · Regla y glosario** | R16 en `_trabajo/…Ajustes_de_coherencia…md`; 02 §2.4 reescrito; guía de traducción | Texto | Media sesión |
| **3 · Mecánico** | Intercambiar columnas en las tablas con código en la primera columna (1.341 filas); títulos «G3 · Viabilidad» → «Viabilidad (G3)»; «Fase 3 · X» → «X (fase 3)» | Script PowerShell sobre los Markdown ES/EN con la lista del paso 1; revisión por muestreo | Una sesión; el script queda para el futuro |
| **4 · Editorial, por orden de lectura** | Texto corrido: «en G3» → «en la puerta de viabilidad (G3)», «documento 40» → «las reglas de medición (documento 40)». Primero lo que lee quien llega: entrada, 00, 01, 90, 94, 96, curso M00–M09, 60 y 61; después 10–14, 20–23, 30–38, 40–43, 50–54, 62, 91–95; las plantillas al final (son formularios: el nombre ya va en el título de cada sección) | A mano, documento a documento, ES y EN a la vez (D12) | Cuatro a seis sesiones |
| **5 · Verificación** | Sección nueva: ningún título, rótulo ni primera columna empieza por código; nombres canónicos sin variantes; muestra de «en G[0-7]» sin nombre delante en los documentos de lectura | `verificar_coherencia.ps1` | Con el paso 3 |

Lo que cambia de forma visible para el lector al terminar el paso 3 (mecánico) ya es la mayor parte del problema: las tablas y los títulos son donde el código se ve primero.

---

## Parte 2 · El artículo de Dans frente a SEVEN-G

### 2.1 Lo que dice el artículo

1. La mayoría de las compañías está en «la IA del oficinista» (automatizaciones modestas); las que quieren ir más allá se preguntan «¿será la IA suficientemente inteligente?», y la pregunta útil es **«¿cómo sabe la IA si lo que hizo mejoró realmente el negocio?»**.
2. **Outputs frente a resultados.** Las métricas actuales de IA miden calidad de respuesta, tareas completadas, latencia y coste; a la empresa le importan abandono, margen, conversión, plazos, valor del ciclo de vida. «Un agente podría estar completando perfectamente la tarea y, aun así, perjudicar a la empresa».
3. **Goodhart y el «descuento con éxito»**: el agente que consigue la renovación con un 20 % de descuento optimiza la métrica y hunde el margen. «Lo que cuenta como éxito depende del marcador». Las métricas mal elegidas son peligrosas cuando se optimizan de forma agresiva.
4. **Evaluación continua**: la IA no se aprueba una vez y se olvida; las pruebas antes del despliegue (NIST) no capturan lo que emerge en uso real; la evaluación es parte de las operaciones. El valor se juzga a nivel de **flujo de trabajo completo**, no de tokens.
5. **El objetivo es una decisión de gobierno**: los objetivos entran en conflicto (ventas, margen, abandono, cumplimiento, marca); el consejo y la dirección deciden **qué debe mejorar, qué no puede sacrificarse nunca y qué compromisos se aceptan**. «En cuanto los sistemas puedan optimizar continuamente, el propio objetivo se convierte en una decisión de gobernanza».
6. **Aprender del marcador**: AlphaZero mejora porque actúa, ve consecuencias y tiene un objetivo inequívoco; la empresa necesita retroalimentación ligada a un objetivo y una «función de control» que aprenda de episodios repetidos.
7. **Las preguntas del CEO**: ¿qué está optimizando exactamente nuestra IA? ¿cómo sabremos si sus acciones mejoraron el negocio? ¿cambia lo que aprende lo que hace la próxima vez? Si no se responden, «autónomo» significa «actividad no supervisada».

### 2.2 Dónde SEVEN-G ya está en esa línea

| Idea del artículo | Dónde está en SEVEN-G | Grado |
|---|---|---|
| Outputs ≠ resultados; medir lo que importa al negocio | Reglas de medición (40): solo cuenta el valor validado, con fórmula y estado; **tres perspectivas del caso** (40 §11.1, D150): valor económico · **resultado operativo con indicadores físicos** (41) con línea base, objetivo y actual · exposición al riesgo; sin fusionar ni traducir a euros | **Cubierto, y más estricto**: SEVEN-G exige además que el valor lo valide control de gestión y que «sin dato» nunca sea cero |
| Goodhart: una métrica optimizada agresivamente daña otra | Hipótesis de valor falsable con **criterio de parada** (P08 §8, N-09); criterios **«Sí ◆»** que nunca se admiten como condición (N-08: seguridad, cumplimiento, supervisión humana); apetito de riesgo aprobado en C2 (13) | Cubierto en parte: hay «lo que para» y «lo que nunca se sacrifica», pero no se pide explícitamente **qué otra métrica no puede empeorar** mientras se optimiza la principal |
| Evaluación continua, no aprobación única | Operación (52): monitorización, **deriva de datos, de uso y sesgo** (§4.2.6–4.2.7), evaluación con conjuntos de prueba antes de cada cambio (D4.08); **revisión de continuidad (R6)** trimestral, semestral o anual; escalado o retirada (G7); regularización de lo que ya está en producción (N-11) | Cubierto: es uno de los pilares del marco. Matiz: la **evaluación del resultado de negocio** es periódica (R6, paquete trimestral), la continua es la técnica (deriva) |
| Valor a nivel de flujo completo, no de tokens | Coste completo F1–F4 y TCO (42), presupuesto de consumo y cascada de degradación (P63, 52 §10.3), escalera por unidad en transversales (40 §7.2) | Cubierto |
| El objetivo es decisión de gobierno | Tesis de IA, ambición por esfera y apetito (C2, N-12); el consejo aprueba Transformar; ambición objetivo por esfera en T01 (D131) | Cubierto a nivel de **compañía y cartera**; a nivel de **cada iniciativa o agente**, el objetivo está en P08 (una métrica objetivo) y la supervisión en P17, pero no como «marcador» con lo que no se sacrifica |
| Aprender de los resultados | Lecciones aprendidas (P30, D55), motivos de parada codificados que cambian los criterios de entrada (D2.12), recalibración de umbrales en C5 (D7.11), realización frente a la curva (43, F10) | Cubierto a nivel de **cartera y marco**. A nivel de **agente** (lo que hace la próxima vez), SEVEN-G gobierna el cambio (G5, 52 §6.4: un cambio de instrucciones o modelo se evalúa antes), pero no describe un bucle de aprendizaje ligado al resultado |
| Las tres preguntas del CEO | «¿Qué está optimizando?» → P08 y tesis; «¿Mejoró el negocio?» → valor validado y resultado operativo; «¿Cambia lo que hace?» → R6, G7, C5 | Las tres se responden con el panel (T17) y el paquete del consejo (60), pero **nadie las hace en ese orden**: la guía de conversación (61 §9) no las tiene como tales |

Conclusión: **SEVEN-G está en la línea del artículo y, en medición del valor y evaluación continua, es más exigente** (valor validado por control de gestión, criterios de parada, R6, regularización). El artículo aporta un ángulo que el marco tiene disperso y no nombra: el **marcador de cada iniciativa o agente** —qué optimiza, qué no puede empeorar, qué compromisos se aceptan— como decisión explícita de gobierno, y la **retroalimentación** como mecanismo, no solo como revisión periódica.

### 2.3 Qué modificar (dentro del presupuesto de D143: ni documentos ni herramientas nuevos)

| # | Cambio | Dónde | Por qué | Grado (M/E/R) |
|---|---|---|---|---|
| 1 | **Bloque «Marcador de la iniciativa»** en la hipótesis de valor (P08): (a) qué optimiza: **una** métrica de resultado de negocio, no de output; (b) **qué no puede empeorar**: dos o tres métricas con su umbral (margen, abandono, reclamaciones, cumplimiento, tiempo de respuesta al cliente…), enlazadas a los criterios «Sí ◆» y al apetito de C2 cuando corresponda; (c) **compromisos aceptados** (qué se admite perder y cuánto); (d) métricas de output que se siguen pero no deciden; (e) quién lee el marcador y cada cuánto. Un agente A2/A3 lo lleva obligatorio (es su función objetivo); un asistente Express, en una línea | P08 §5 (ES/EN); 40 regla nueva «el marcador antes que el output»; 20 fase 2; criterio G2 existente G2.04 (valor con fórmula) gana la comprobación de las restricciones | Es lo que el artículo llama «elegir el marcador» y lo que el «descuento con éxito» rompe. Hoy P08 fija una métrica objetivo y un criterio de parada, pero no qué no puede empeorar | **M** la métrica de resultado y una restricción; **E** el resto con disparadores 2, 3, 4 (personas, clientes, agentes) |
| 2 | **Las restricciones del marcador entran en la supervisión humana y en la monitorización**: P17 (quién interviene cuando una restricción se incumple) y 52 (alerta cuando una restricción se acerca al umbral, no solo cuando hay deriva técnica) | P17 §diseño; 52 §4.2 (nueva subsección «deriva de resultado»); P25 | Cierra «evaluación continua del resultado», que hoy es periódica (R6) | **E** con disparadores 2, 3, 4; en producción |
| 3 | **Esquema de T01**: `iniciativas[].marcador` opcional (objetivo, restricciones con umbral y actual, compromisos); se muestra en la pestaña Valor junto a las tres perspectivas y el panel lo lleva en la ficha del caso y en la tarjeta de riesgo cuando una restricción se incumple | T01 (0.8, campo opcional, D53), conectores Python y JS (misma correspondencia), motor T17, `mapa_datos.json`, ayuda ES/EN | El marcador es dato, no texto: así se ve en el panel si una iniciativa «gana» por su métrica y «pierde» por una restricción | — |
| 4 | **Conjuntos de evaluación ligados al marcador**: la evaluación antes de cada cambio (D4.08, 52 §6.4, P22) incluye los casos donde la restricción se rompió en producción (el «descuento con éxito» real de la compañía), no solo calidad de respuesta | 52 §6.4; P22 | Es el «aprender de episodios repetidos»: lo que falló en el negocio entra en la prueba del siguiente cambio | **E** disparadores 9, 10 (generativa, agentes) |
| 5 | **Las tres preguntas del CEO** como preguntas difíciles 18–20 de la guía de conversación con el consejo (61 §9), respondidas con el marcador, el valor validado y las R6 | 61 §9 (ES/EN) | Da al consejo la forma de preguntar que el artículo propone, con la respuesta que el marco ya tiene | R |
| 6 | **Glosario**: «marcador de la iniciativa», «restricción del marcador», «métrica de output» frente a «métrica de resultado» | 02 §3; guía de traducción (*scoreboard* → marcador) | Vocabulario | — |

Lo que **no** se propone: un indicador compuesto (va contra 40 §11.1, D150: las perspectivas no se fusionan), ni un bucle de aprendizaje automático del agente sobre el objetivo de negocio (cambiar el comportamiento de un agente sin pasar por G5 y la evaluación previa contradice 52 §6.4 y N-11; el aprendizaje del marco es gobernado: cambio evaluado, R6, G7, C5).

### 2.4 Lo que falta en el artículo y SEVEN-G ya tiene

Para la conversación con el autor del marco, no para publicar: el artículo no dice quién valida que «mejoró el negocio» (SEVEN-G: control de gestión, no el equipo), no distingue valor declarado de validado, no tiene puerta de parada antes de invertir, no separa capacidad liberada de ahorro, y trata «autónomo» sin niveles (A0–A3) ni separación de funciones. Son justo las piezas que convierten un «cuadro de mando» en gobierno.

---

## 3. Lo que necesita decidir el autor

1. **La regla R16** (nombre primero, código entre paréntesis, primera mención por sección) y que 02 §2.4 se reescriba en ese sentido.
2. **El orden de la batida**: mecánico primero (tablas y títulos, con script), editorial después por orden de lectura; las plantillas al final.
3. **Que `nombres.json` sea la lista única** de nombres canónicos (generada) y que la verificación falle ante variantes y ante código delante del nombre.
4. **El marcador de la iniciativa** (§2.3, cambios 1–3) con su grado M/E, y si un agente A2/A3 lo lleva obligatorio.
5. **Los cambios 4–6** (conjuntos de evaluación ligados al marcador, preguntas del CEO en el 61, glosario).
6. **Cuándo**: la batida toca todos los documentos en ES y EN; conviene hacerla **después** de integrar la rama de Express y de la etiqueta M/E/R en las plantillas (propuesta del 12-10-2026 §8), porque son las mismas tablas, y así se pasan una sola vez.
