# De dónde viene SEVEN-G, en qué se diferencia y por qué es abierto

**El origen práctico del marco, lo que corrige de los enfoques habituales de adopción de IA, lo que toma de la gestión comercial del embudo y los motivos de su licencia abierta**

| | |
|---|---|
| Documento | Documento 04 · Orígenes, diferencias y apertura |
| Versión | 0.1 (borrador de trabajo) |
| Fecha | 19-09-2026 |
| Autor | Fernando García Varela |
| Estado | Borrador para revisión. Documento explicativo: no añade reglas al marco. |

<!-- cifras: 6 | carencias habituales que el marco corrige ; 6 | disciplinas de gestión que reúne ; 5 | diferencias con un embudo comercial ; 0 | obligaciones de contratar al autor -->

---

> **Aviso legal y exención de responsabilidad.** SEVEN-G es un marco metodológico de referencia que se ofrece «tal cual» y con fines exclusivamente informativos. No constituye asesoramiento jurídico, regulatorio, financiero ni profesional, ni garantiza el cumplimiento de ninguna norma. Las referencias a regulación general (como el Reglamento Europeo de IA, el RGPD, DORA o NIS2), a normas técnicas y a regulación específica de cada sector o jurisdicción pueden ser incompletas, no aplicar a un caso concreto o quedar desactualizadas por cambios normativos, interpretaciones o criterios de las autoridades posteriores a su fecha de consulta. **Cada organización que use SEVEN-G es la única responsable de identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio**, con el asesoramiento cualificado que corresponda. El autor no asume responsabilidad alguna por el uso que se haga de este contenido ni por las decisiones que se adopten con él. Los datos, cifras, compañías y casos de los ejemplos son ficticios o ilustrativos.

<!-- esencial: consulta | Documento explicativo. Cuenta de dónde nace SEVEN-G (de la práctica, no de una metodología concreta), qué corrige de la forma habitual de adoptar la IA, qué toma de la gestión comercial del embudo y en qué se aparta de ella, y por qué el marco es gratuito y de libre distribución. No contiene reglas ni evidencias obligatorias: se lee una vez, para entender el porqué del marco. -->

## 1. Objeto y alcance

Este documento responde a tres preguntas que se hace quien conoce SEVEN-G por primera vez: **de dónde viene**, **en qué se diferencia** de lo que su compañía ya hace o ya conoce, y **por qué se ofrece gratis y con licencia abierta**.

Es un documento explicativo. No añade reglas, criterios ni evidencias: las reglas del marco están en el documento 01 y en los documentos que lo desarrollan. Se dirige a consejeros, directivos y responsables de IA que valoran adoptar el marco, y a consultores y auditores que quieren entender su planteamiento antes de aplicarlo.

> **Por qué importa.** Un marco se adopta mejor cuando se entiende qué problema quiso resolver su autor y qué decidió no hacer.

---

## 2. De dónde viene SEVEN-G

### 2.1 Nace de la práctica, no de otra metodología

SEVEN-G **no declara como inspiración directa ninguna metodología concreta** de gestión de proyectos, de desarrollo de software, de ciencia de datos, de servicios de tecnología o de gobierno de tecnología. Ningún documento del marco se presenta como adaptación, extensión o perfil de otra metodología, y no hace falta conocer ninguna para aplicarlo.

El origen es otro: la observación directa de cómo adoptan la IA las organizaciones y de dónde falla esa adopción. El marco se construyó como **alternativa a los enfoques habituales**, que suelen dar prioridad a la experimentación sobre el valor de negocio y a los prototipos sobre la producción estable. Lo que SEVEN-G corrige no es una metodología rival, sino una forma de trabajar muy extendida que no tiene nombre porque casi nunca se decide: simplemente ocurre.

Esto no significa que el marco parta de cero. Reúne **disciplinas de gestión que las empresas ya practican** —se describen en la sección 3— y las aplica, juntas, a un objeto nuevo. Lo que no hace es tomar prestada la estructura de una metodología con nombre propio y añadirle la palabra «IA».

### 2.2 Qué corrige de los enfoques habituales de adopción de IA

| Enfoque habitual | Carencia | Respuesta de SEVEN-G | Dónde está |
|---|---|---|---|
| **Experimentar primero y buscar el valor después.** Se empieza por la tecnología disponible y se busca un problema al que aplicarla. | Pilotos que funcionan pero no resuelven nada que el negocio esté dispuesto a pagar. | Ninguna iniciativa pasa de la fase 2 sin una hipótesis de valor falsable, con línea base, método de atribución y criterios de parada fijados de antemano. | documento 01, sección 6; documento 40 |
| **El prototipo como destino.** El éxito se mide por la demostración, no por la operación. | Muchos pilotos y pocos casos en producción; coste recurrente sin retorno. | «La producción es la única verdad»: el valor solo se valida en condiciones reales, con firma de puesta en producción, plan de reversión probado y revisión periódica de continuidad. | documento 01, secciones 3 y 7; documento 52 |
| **Nadie puede parar.** No existen criterios para iterar, pivotar o retirar. | Carteras que solo crecen y concentran riesgo. | Puertas de decisión con cinco resultados posibles, límite de iteraciones, una puerta principal de parada (G3) y procedimiento de retirada. Parar a tiempo es un buen resultado. | documento 21; documento 14, sección 10 |
| **El valor se declara.** Las horas liberadas se suman como ahorro y nadie las comprueba. | Cifras que no resisten una auditoría y decisiones de inversión mal fundadas. | Diez reglas de medición; cada importe lleva fórmula y estado (validado, declarado o estimado); la capacidad liberada no suma hasta que se materializa. | documento 40; documento 43 |
| **Quien construye también aprueba.** El gobierno llega al final, como trámite. | Controles débiles, riesgo regulatorio y de seguridad tratado tarde. | Separación de funciones desde la fase 0, validación dual (resultado y documentación), clasificación regulatoria y riesgos antes de diseñar. | documento 01, sección 8; documento 30; documento 32; documento 33 |
| **Todo se llama transformación.** Eficiencia y transformación se mezclan en el mismo discurso y se juzgan con los mismos criterios. | La compañía cree que se transforma cuando solo se eficienta, o bloquea sus apuestas de transformación con criterios de recorte de costes. | Tres niveles de ambición con criterios de puerta distintos y un índice de transformación de la compañía basado en evidencias. | documento 10; documento 12 |

### 2.3 Cómo ha evolucionado el marco

SEVEN-G no apareció de una vez: creció a partir de un trabajo de investigación previo y se ha ido ampliando desde entonces. Esta cronología es la del **marco en su conjunto** (una versión de producto, que crece con cada bloque nuevo) y es distinta de la **versión de cada documento**, que se numera por separado (sección 10 de cada documento) y avanza cuando ese documento concreto cambia.

> **Por qué importa.** Un marco que dice de dónde viene y cómo ha crecido es más fácil de confiar que uno que aparece ya terminado. La cronología también explica por qué algunas piezas (medición del valor, riesgos) son más maduras que otras (índice de transformación, curso): lleva más tiempo trabajando en ellas.

| Cuándo | Qué se incorporó |
|---|---|
| Febrero de 2025 | Investigación inicial: estado de la gobernanza de la IA en las organizaciones y comparativa de metodologías y marcos existentes en el mercado (marcos de gestión de riesgos, normas de gestión de IA, prácticas internas de consultoras). Sin versión publicada todavía. |
| Marzo de 2025 | Primeros borradores del ciclo de vida de la iniciativa y de las puertas de decisión, partiendo de la disciplina de inversión por fases y de la gestión comercial del embudo (sección 4). |
| Abril de 2025 | **Versión 0.1** (primera versión interna): fases 0–7, puertas G0–G7 con sus cinco resultados posibles y primer borrador del mapa de esferas de impacto. |
| Mayo de 2025 | Primer modelo de gobierno (consejo, comité de IA, tres líneas de defensa) y primeras plantillas de evidencia. |
| Junio de 2025 | Reglas de medición del valor (estados validado, declarado y estimado) y primer borrador del índice de transformación. |
| Julio de 2025 | Metodología de riesgos de IA (matriz de probabilidad e impacto) y primer mapeo regulatorio (Reglamento Europeo de IA, RGPD). |
| Agosto de 2025 | Primeras pruebas del marco con casos de uso reales, anonimizados; ajuste de puertas y reglas de medición con esa experiencia. |
| **Septiembre de 2025** | **Primera publicación pública** del marco (documento de presentación y biblioteca inicial en español). |
| Octubre de 2025 | Traducción al inglés de la biblioteca inicial; guía de traducción y glosario común. |
| Noviembre de 2025 | Catálogo de herramientas (T01–T22) y primer diseño del registro de iniciativas (T01). |
| Diciembre de 2025 | Modelo de madurez (siete dimensiones) y primer cuestionario de diagnóstico. |
| Enero de 2026 | Metodología de riesgos ampliada a IA generativa y agentes; niveles de autonomía A0–A3. |
| Febrero de 2026 | Primer panel de IA para el consejo (T17), conectado al registro de iniciativas. |
| Marzo de 2026 | Controles específicos de IA generativa: deriva de uso, sesgo con pares contrafactuales, cascada de degradación por coste. |
| Abril de 2026 | Guía de implantación y primera calibración del alcance Lite y Enterprise por compañía. |
| Mayo de 2026 | Marco de auditoría de IA y plantilla de declaración de aplicación. |
| Junio de 2026 | SPHERES como metodología de apoyo (esferas y niveles de ambición) y SPAD como metodología de construcción de software con IA, ambas referenciadas desde SEVEN-G. |
| Julio de 2026 | Índice de transformación de la compañía (ocho señales) y su calculadora (T14). |
| Agosto de 2026 | Biblioteca ampliada a las plantillas P32–P71 y a las herramientas de valor, madurez y riesgos (T06, T11, T14, T15). |
| Septiembre de 2026 | **Versión 0.80** (actual): biblioteca completa (documentos 00–94, ES/EN), curso de SEVEN-G con lectura por capas, comunidad de incidencias y peticiones, y el ajuste continuo de documentos y herramientas de cara a la versión 1.0. |

Mientras el número de versión del marco no llegue a 1.0, sigue aplicando el aviso de «versión en revisión» de la sección 6.4: el contenido es operativo (documento 00, decisión D40), pero se pide no difundirlo de forma general porque documentos y herramientas se siguen adecuando para que sean reutilizables.

---

## 3. Disciplinas de gestión que SEVEN-G reúne

Las piezas del marco resultan familiares a cualquier directivo porque proceden de disciplinas de gestión asentadas. Lo propio de SEVEN-G es **reunirlas en un solo sistema**, con un único registro y un único lenguaje, y adaptarlas a lo que la IA tiene de distinto: resultados probabilísticos, degradación con el tiempo, dependencia de datos y de proveedores, autonomía de los agentes y una regulación específica.

| Disciplina de gestión | Qué toma SEVEN-G | Qué cambia o añade |
|---|---|---|
| **Inversión por fases con puertas de decisión** | Avanzar por etapas y comprometer el dinero por tramos, con una decisión formal al final de cada etapa. | Validación dual, criterios distintos según la ambición, separación entre quien verifica y quien decide, y una fase de operación que no termina en la entrega: revisión de continuidad y puerta de escalado o retirada. |
| **Gestión comercial del embudo** | Etapas, requisitos para avanzar, tiempo en cada etapa, conversión, motivos de pérdida y previsión ponderada. | El objetivo no es convertir más, sino decidir bien (sección 4). |
| **Gestión de riesgos y control interno** | Riesgo inherente y residual, apetito de riesgo aprobado por el consejo, tres líneas con funciones separadas. | Categorías propias de la IA (generativa y agentes, seguridad e IA ofensiva, terceros), niveles de autonomía y controles críticos que no admiten condiciones. |
| **Control de gestión y realización de beneficios** | Línea base, responsable del beneficio, seguimiento por periodo y conciliación con las cuentas. | Estados del importe, métodos de atribución, coste completo por caso y un neto de cartera que solo cuenta lo validado. |
| **Gobierno corporativo** | El consejo fija la dirección, aprueba el apetito de riesgo y supervisa con información comparable. | Panel del consejo, registro de decisiones y recomendaciones, y una pregunta permanente: si la compañía se transforma o solo se eficienta. |
| **Gestión del cambio** | El valor depende de que las personas adopten la solución. | La adopción es evidencia de puerta, y la capacidad liberada se mide, se materializa o se reasigna de forma explícita. |

Ninguna de estas disciplinas se sustituye. Una compañía que ya tiene su gestión de riesgos, su oficina de proyectos o su control de gestión **los mantiene** y conecta SEVEN-G con ellos (documento 01, secciones 1.2 y 13).

---

## 4. La cartera como embudo: qué se toma de la gestión comercial

### 4.1 La idea

Una dirección comercial no gestiona sus oportunidades de memoria: las registra, sabe en qué etapa está cada una, cuánto tiempo lleva en ella, qué le falta para avanzar, cuánto vale y por qué se perdieron las que se perdieron. SEVEN-G aplica esa misma disciplina a las iniciativas de IA. **Para llegar a producción hay que atravesar un conjunto obligatorio de estados**, y la cartera se lee como un embudo.

> **Por qué importa.** Casi ninguna compañía sabe cuánto tarda en llevar una idea de IA a producción, en qué fase se atascan sus iniciativas ni por qué se pararon las que se pararon. Un equipo comercial sin esos datos no sabría gestionar sus ventas; una cartera de IA sin ellos no aprende.

### 4.2 Qué se toma

| En la gestión comercial | En SEVEN-G | Dónde está |
|---|---|---|
| Oportunidad registrada | Iniciativa dada de alta en el registro, con código único y responsables. | documento 03, sección 3 |
| Etapas del embudo | Fases 0 a 7 y, en el panel del consejo, etapas agrupadas. | documento 01, sección 6 |
| Requisitos para pasar de etapa | Criterios de cada puerta, con estado y evidencia. | documento 21 |
| Días en la etapa | Tiempo en fase y tiempo de decisión de cada puerta. | documento 03, sección 3.5 |
| Oportunidades estancadas | Iniciativas que superan el plazo de referencia de su fase. | documento 03, sección 3.6; documento 14, sección 8 |
| Conversión entre etapas | Proporción que continúa, itera, pivota o para en cada puerta. | documento 03, sección 3.5 |
| Motivo de pérdida | Motivo codificado de parada o de retirada, con lo aprendido. | documento 03, sección 3.3 |
| Previsión ponderada | Valor ponderado de la cartera con la probabilidad histórica propia. | documento 03, sección 3.5 |
| Panel de dirección comercial | Registro de iniciativas T01 y panel del consejo T17. | documento 60 |

### 4.3 El control de tiempos

El registro guarda la fecha de entrada y de salida de cada fase, los periodos en espera con su motivo y la fecha de solicitud, verificación y decisión de cada puerta. Con esos datos se obtienen cuatro medidas que casi ninguna cartera de IA tiene:

- **Tiempo en fase**: dónde están los cuellos de botella.
- **Tiempo de decisión**: cuánto tarda el propio gobierno en decidir. Mide a los órganos, no a los equipos.
- **Tiempo hasta producción**: la velocidad real de la cartera, de la idea a G3 y de G3 a producción.
- **Tiempo en espera**, separado del anterior, para distinguir los retrasos propios de las dependencias externas.

La compañía aprueba en C2 los **plazos de referencia por fase** y los recalibra cada año con sus datos. Una iniciativa que los supera se marca como estancada y la revisa el comité de IA. El plazo no obliga a aprobar antes: obliga a decidir —continuar, esperar con motivo o parar— en lugar de dejar que la iniciativa consuma presupuesto sin que nadie lo decida.

### 4.4 En qué se aparta SEVEN-G de un embudo comercial

| En un embudo comercial | En SEVEN-G |
|---|---|
| Se busca la **máxima conversión**: cada oportunidad perdida es un ingreso perdido. | **No se busca convertir más.** Parar en G3 una iniciativa inviable es un buen resultado, porque evita el coste de construirla. Una conversión cercana al 100 % indica puertas blandas, no una buena cartera. |
| Quien lleva la oportunidad la empuja y suele ser quien informa de su avance. | Quien construye **no verifica ni decide** su propio avance. El estado de cada criterio lo fija un verificador independiente. |
| La probabilidad de cierre la estima el comercial. | La probabilidad de llegar a producción es **histórica y propia**, y el valor ponderado solo se muestra cuando hay historial suficiente. |
| La venta cierra el ciclo. | La puesta en producción **abre** otro: operación, revisión de continuidad y decisión de escalar, iterar o retirar. Un caso en uso puede desengancharse, y también se aprende de ello. |
| El importe de la oportunidad cuenta en la previsión desde el principio. | El valor esperado **no es valor**: solo llega al neto de la cartera lo que se valida en producción. |

---

## 5. En qué se diferencia SEVEN-G, en resumen

1. **Parte del valor de negocio, no de la tecnología.** Es agnóstico de sector, de proveedor y de técnica.
2. **Une en un solo sistema lo que suele estar separado**: ciclo de vida, gobierno, riesgo, cumplimiento, medición y consejo comparten registro, códigos y lenguaje.
3. **Llega hasta el consejo.** No es solo un método para equipos: da a los órganos de gobierno decisiones, un panel y un registro de lo decidido.
4. **Distingue eficiencia de transformación** con criterios verificables, en cada iniciativa y en la compañía.
5. **Hace de parar una decisión normal**, con criterios fijados antes de empezar y motivos que se conservan para aprender.
6. **Mide el propio sistema de decisión**: tiempos, conversión, iteraciones y condiciones vencidas.
7. **Exige evidencia, no declaración**, y separa a quien construye de quien verifica y de quien decide.
8. **Es proporcional**: intensidad Lite o Enterprise por iniciativa y alcance de implantación por compañía (documento 94).
9. **Es compatible y modular**: convive con los marcos y órganos que la compañía ya tiene y puede adoptarse por componentes.
10. **Es abierto**: se puede usar, adaptar y redistribuir sin pedir permiso ni pagar (sección 6).

---

## 6. Por qué es gratuito y de libre distribución

### 6.1 El motivo

**Nota del autor.** He visto en primera persona la necesidad que tienen muchas empresas de poner orden: dudan de cómo empezar, de cómo inventariar lo que ya están haciendo y de cómo ordenar un mundo caótico y muy rápido de innovaciones. Por eso he decidido compartir mi conocimiento y mi forma de trabajo: mi objetivo es ayudar al mercado a avanzar en un uso gobernado de la inteligencia artificial, no ganar dinero directamente con la metodología, sus documentos, sus plantillas o sus herramientas. **Todo el sitio se puede usar, leer y descargar sin necesidad siquiera de registrarse**, y desde aquí nunca se envía un correo ni ninguna otra comunicación buscando captar clientes. Donde sí hay una aportación personal con coste es si alguien quiere requerir mis servicios —un curso a medida sobre la metodología, consultoría o asesoramiento al consejo de una compañía, por ejemplo—, y esa decisión queda por completo a voluntad de quien lee esto: **soy accesible, pero es usted quien decide, si lo desea, ponerse en contacto conmigo.**

— Fernando García Varela

### 6.2 Qué significa en la práctica

| Pregunta | Respuesta |
|---|---|
| ¿Hay que pagar por usar SEVEN-G? | No. Ni los documentos, ni las plantillas, ni las herramientas. |
| ¿Hay que registrarse o dar un correo para usar el sitio? | No. Todo se lee, se usa y se descarga sin cuenta ni registro. |
| ¿El sitio envía correos o busca captar contactos? | No. Desde aquí nunca se envía un correo ni ninguna comunicación buscando engagement; el contacto con el autor es siempre iniciativa de quien lo decide (sección 7). |
| ¿El sitio mide las visitas? | Sí, solo de forma agregada: cuántas visitas tiene cada página, desde qué país y con qué tipo de dispositivo, con [Umami](https://umami.is/), una herramienta de código abierto que no usa *cookies*, no guarda datos personales ni direcciones IP y no sigue a nadie entre sitios; respeta la señal «No rastrear» del navegador. Sirve para saber qué documentos se leen. La página de comunidad no se mide. |
| ¿Hay que pedir permiso? | No, mientras se cumpla la licencia. |
| ¿Se puede adaptar a la compañía? | Sí: cambiar umbrales, traducir, integrar las plantillas en los sistemas propios. |
| ¿Puede usarlo una consultora o un auditor en servicios de pago? | Sí. La licencia admite el uso comercial (documento 91). |
| ¿Obliga a contratar al autor? | No. El marco está pensado para que una compañía, consultora o profesional pueda aplicarlo por sí misma. |
| ¿Cómo gana el autor con esto, entonces? | No directamente con la metodología: la aportación personal del autor tiene coste solo si alguien contrata sus servicios (curso a medida, consultoría o asesoramiento al consejo de una compañía). |
| ¿Y si la compañía quiere acompañamiento? | Puede pedirlo al autor o a cualquier otro profesional. El documento 91 describe los modelos de acompañamiento y cómo evitar la dependencia del consultor. |

### 6.3 Qué control conserva el autor

La apertura no es ausencia de reglas. El autor eligió el mínimo control necesario para que el marco pueda circular sin perder su autoría ni su coherencia:

| Elemento | Qué se controla | Por qué |
|---|---|---|
| **Contenidos bajo CC BY 4.0** | Una sola exigencia: reconocer la autoría (Fernando García Varela), enlazar la licencia e indicar si se han hecho cambios. | Se descartó prohibir el uso comercial porque generaría dudas en las empresas usuarias y en quienes las asesoran. |
| **Código bajo MIT** | Conservar el aviso de derechos de autor y la licencia. | Las herramientas deben poder integrarse en los sistemas de cada compañía. |
| **Nombre SEVEN-G** | Usar el nombre no implica respaldo del autor. No existe certificación oficial: la declaración de aplicación es una autodeclaración verificable por auditoría. | Evitar que el nombre se use para prometer lo que nadie ha comprobado. |
| **Versiones publicadas** | La licencia de una versión publicada no se revoca. | Quien adopta el marco necesita saber que no se le retirará. |
| **Exención de responsabilidad** | El marco se ofrece «tal cual»; cada organización responde de su cumplimiento regulatorio, y las obras derivadas deben conservar el aviso. | El autor no puede responder de usos que no conoce. |

El detalle está en el documento 93. Este documento no constituye asesoramiento jurídico.

### 6.4 El aviso de versión en revisión

Mientras el marco esté en la versión 0.x, sus páginas principales piden **no difundirlo de forma general**. Es una petición del autor, no una restricción de la licencia: CC BY 4.0 ya permite compartir estas versiones. La petición tiene un motivo práctico —los documentos y las herramientas se están adecuando para que sean reutilizables— y desaparecerá con la versión 1.x.

---

## 7. Contacto

Para consultas sobre el marco, propuestas de mejora, comunicación de errores o solicitudes de acompañamiento: **Fernando García Varela**, en su perfil profesional de LinkedIn: <https://www.linkedin.com/in/fernandogarciavarela/>. **SEVEN-G es una marca registrada a nombre de Fernando García Varela** (documento 93, sección 7).

No es necesario contactar ni pedir permiso para ningún uso que cumpla la licencia; el sitio no lo pide en ningún momento y nunca contacta por iniciativa propia a quien lo visita. Contactar con el autor no convierte un uso en respaldado (documento 93, sección 7).

---

## 8. Herramientas y plantillas asociadas

| Código | Nombre | Relación con este documento |
|---|---|---|
| T01 | Registro de iniciativas | Aplica la gestión del embudo: fases, tiempos, criterios, motivos de parada y valor. |
| T17 | Panel de IA para el consejo | Muestra el embudo, los casos que salieron de él y por qué. |
| P29 | Registro de decisión de *gate* | Conserva el resultado y el motivo de cada decisión. |
| P30 | Decisión de escalado o retirada | Recoge las lecciones aprendidas de cada retirada. |

---

## 9. Documentos relacionados

| Documento | Relación |
|---|---|
| **00 · Qué es SEVEN-G y para qué sirve** | El problema que resuelve el marco y sus principios. |
| **01 · Metodología fundacional** | Compatibilidad y adopción modular (sección 1.2), trazabilidad del ciclo de vida (sección 6.11) y normas de referencia (sección 13). |
| **03 · Herramientas y registro de iniciativas** | La analogía con un CRM, las métricas del embudo y los plazos de referencia (sección 3). |
| **14 · Gestión de cartera** | Iniciativas estancadas y procedimiento de retirada. |
| **91 · Guía para consultores** | Modelos de acompañamiento y transferencia a la compañía. |
| **93 · Licencia, uso por terceros y citación** | Texto completo sobre licencias, nombre, obras derivadas y exención de responsabilidad. |
| **94 · Matriz de obligatoriedad y lectura por capas** | Qué es obligatorio siempre y qué depende de cada compañía e iniciativa. |

---

## 10. Control de versiones

| Versión | Fecha | Cambios |
|---|---|---|
| 0.1 | 19-09-2026 | Primera versión. Origen práctico del marco, carencias de los enfoques habituales que corrige, disciplinas de gestión que reúne, la cartera como embudo comercial y sus diferencias, motivos de la licencia abierta, control que conserva el autor y contacto. |
