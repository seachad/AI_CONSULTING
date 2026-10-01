# De dónde viene SEVEN-G, en qué se diferencia y por qué es abierto

**El origen práctico del marco, lo que corrige de los enfoques habituales de adopción de IA, lo que toma de la gestión comercial del embudo y los motivos de su licencia abierta**

| | |
|---|---|
| Documento | Documento 04 · Orígenes, diferencias y apertura |
| Versión | 0.2 (borrador de trabajo) |
| Fecha | 01-10-2026 |
| Autor | Fernando García Varela |
| Estado | Borrador para revisión. Documento explicativo: no añade reglas al marco. |

<!-- cifras: 6 | carencias habituales que el marco corrige ; 6 | disciplinas de gestión que reúne ; 5 | diferencias con un embudo comercial ; 0 | obligaciones de contratar al autor -->

---

> **Aviso legal y exención de responsabilidad.** SEVEN-G es un marco metodológico de referencia que se ofrece «tal cual» y con fines exclusivamente informativos. No constituye asesoramiento jurídico, regulatorio, financiero ni profesional, ni garantiza el cumplimiento de ninguna norma. Las referencias a regulación general (como el Reglamento Europeo de IA, el RGPD, DORA o NIS2), a normas técnicas y a regulación específica de cada sector o jurisdicción pueden ser incompletas, no aplicar a un caso concreto o quedar desactualizadas por cambios normativos, interpretaciones o criterios de las autoridades posteriores a su fecha de consulta. **Cada organización que use SEVEN-G es la única responsable de identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio**, con el asesoramiento cualificado que corresponda. Esta metodología es una ayuda genérica y gratuita, compartida con la comunidad para que nadie tenga que empezar desde cero; cada persona u organización puede y debe adaptarla a su propio uso. No debe entenderse que sus partes jurídicamente sensibles hayan sido revisadas por una asesoría jurídica: esas revisiones, para cada empresa o sector, son responsabilidad última de la empresa, el consultor o la organización que la use. Aunque se procura mantenerla al día, alguna norma puede haber cambiado sin que se recoja aquí. En la máxima medida permitida por la ley, el autor no asume responsabilidad alguna por los efectos de su aplicación en ninguna organización ni por su aplicabilidad completa. La metodología no otorga certificación de ningún tipo. El autor no asume responsabilidad alguna por el uso que se haga de este contenido ni por las decisiones que se adopten con él. Los datos, cifras, compañías y casos de los ejemplos son ficticios o ilustrativos.

<!-- esencial: consulta | Documento explicativo. Cuenta de dónde nace SEVEN-G (de la práctica, no de una metodología concreta), qué corrige de la forma habitual de adoptar la IA, qué toma de la gestión comercial del embudo y en qué se aparta de ella, por qué el marco es gratuito y de libre distribución, y en qué se distingue de otras metodologías (sección 8). No contiene reglas ni evidencias obligatorias: se lee una vez, para entender el porqué del marco. -->

## 1. Objeto y alcance

Este documento responde a tres preguntas que se hace quien conoce SEVEN-G por primera vez: **de dónde viene**, **en qué se diferencia** de lo que su compañía ya hace o ya conoce, y **por qué se ofrece gratis y con licencia abierta**. La sección 8 añade una comparación, solo de diferencias, con otras metodologías de mercado para la adopción y el gobierno de la IA.

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
| ¿El sitio mide las visitas? | Sí, solo de forma agregada: cuántas visitas tiene cada página, desde qué país y con qué tipo de dispositivo, con [Umami](https://umami.is/), una herramienta de código abierto que no usa *cookies*, no guarda datos personales ni direcciones IP y no sigue a nadie entre sitios; respeta la señal «No rastrear» del navegador. Sirve para saber qué documentos se leen. La página de comunidad no se mide. Lo que se introduce en las herramientas nunca llega a ningún servidor: se guarda solo en el navegador de quien lo introduce; el documento 95 explica dónde están esos datos, qué sale del navegador y cómo instalar el sitio en un servidor propio. |
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

## 8. Comparación con otras metodologías de mercado

### 8.1 Cómo se compara

Quien conoce SEVEN-G suele conocer ya otras metodologías o marcos de mercado para la adopción y el gobierno de la IA, y quiere saber en qué se distinguen. Esta sección los compara uno a uno con el mismo criterio:

- **Solo diferencias, sin valoración.** No se dice qué metodología es mejor o peor ni cuál conviene elegir: se describe qué hace cada una y en qué se distingue de SEVEN-G. Cada metodología responde a un propósito y a un tipo de usuario distintos.
- **Las mismas dimensiones para todas**, para que las comparaciones se puedan leer juntas: naturaleza y propósito; acceso y licencia; unidad de gestión; ciclo de vida y decisiones; madurez; priorización de casos de uso; medición del valor; riesgo, seguridad y cumplimiento; papel del consejo; plantillas y herramientas; datos de mercado; certificación.
- **Solo fuentes oficiales del autor de cada metodología**, enlazadas y con su fecha de consulta (D41). Cuando el detalle de una metodología solo está disponible para sus clientes, se compara con lo que su autor publica en abierto y se dice así.
- **Solo lo que su autor publica en abierto, con palabras propias.** No se reproducen textos, figuras ni gráficos, no se usa investigación reservada a clientes y no se citan sus estudios ni sus previsiones como apoyo de SEVEN-G: se describe en qué consiste cada metodología, con un resumen propio.
- **Marcas y ausencia de vínculo.** Los nombres de otras firmas y de sus marcos se citan solo para identificarlos; son marcas de sus titulares. SEVEN-G no tiene relación con ellas ni cuenta con su respaldo, y la comparación no lo sugiere.
- **Compatibilidad.** Ninguna comparación sugiere sustituir lo que la compañía ya usa: SEVEN-G puede convivir con otros marcos y convalidar lo que ya existe documentando la correspondencia (documento 01, sección 1.2; documento 96, modificador MP4).

La sección crece por entregas: de momento incluye Gartner, y se irán añadiendo otras metodologías de mercado con la misma estructura a medida que surjan.

> **Por qué importa.** Una compañía que ya trabaja con un marco de referencia necesita saber qué le aporta SEVEN-G de distinto y qué solapa, para decidir qué adopta y cómo lo encaja, sin tener que leer las dos metodologías completas.

### 8.2 Gartner

**Qué es.** Gartner es una firma de investigación y asesoramiento. No publica una única metodología de IA, sino un conjunto de marcos y estudios que se usan juntos. Los principales para la adopción y el gobierno de la IA son:

| Marco de Gartner | Qué es, según su autor | Fuente |
|---|---|---|
| **AI Maturity Model and AI Roadmap Toolkit** | Herramienta de diagnóstico y planificación: establece una línea base de la capacidad de IA de la organización, orienta la planificación y la asignación de recursos y permite seguir el avance. Se organiza en siete líneas de trabajo: estrategia, valor, organización, personas y cultura, gobierno, ingeniería y datos (Gartner también las nombra como estrategia, datos, gobierno, ingeniería, modelo operativo, cultura y producto o valor de IA). Cada una se valora en una escala de cinco niveles: *Foundational* (experimentación sin coordinar), *Emerging* (primeros pilotos), *Operational* (IA en algunos procesos con responsables definidos), *Scaled* (IA en varias funciones con retorno medible) y *Transformational* (la IA cambia la toma de decisiones, el modelo operativo y la ventaja competitiva). | [Gartner, AI Maturity Model and AI Roadmap Toolkit](https://www.gartner.com/en/chief-information-officer/research/ai-maturity-model-toolkit) |
| **AI TRiSM** (*AI Trust, Risk and Security Management*) | Base técnica para aplicar el gobierno de la IA: cuatro capas de capacidades técnicas (gobierno de la IA, inspección y aplicación de políticas en ejecución, gobierno de la información e infraestructura) que hacen cumplir las políticas de gobierno. | [Gartner, AI Governance Needs More Than Policies](https://www.gartner.com/en/articles/ai-governance-trism) |
| **AI Opportunity Radar** y **Use-Case Prism** | Priorización: el radar define la ambición de IA de la empresa en términos de oportunidad y de viabilidad; la oportunidad dice dónde se usa la IA (operaciones internas o actividades de cara al cliente) y cómo (IA «de cada día», que mejora la productividad, o IA que «cambia las reglas del juego»), en cuatro áreas: *back office*, *front office*, nuevos productos y servicios y nuevas capacidades centrales. Los prismas sitúan los casos de uso de cada sector o función según su valor de negocio y su viabilidad. | [Gartner, For AI Value, Focus on Your Use Cases](https://www.gartner.com/en/articles/ai-value) |
| **Hype Cycle for Artificial Intelligence** | Representación gráfica de la madurez y la adopción de las tecnologías de IA en cinco fases, de la aparición de la innovación a la meseta de productividad. Se publica cada año. | [Gartner, Hype Cycle Research Methodology](https://www.gartner.com/en/research/methodologies/gartner-hype-cycle) |

**Diferencias con SEVEN-G**

| Dimensión | Gartner | SEVEN-G |
|---|---|---|
| **Naturaleza y propósito** | Investigación y asesoramiento: diagnostica, compara con el mercado y recomienda prioridades. Varios marcos independientes (madurez, riesgo, priorización, tendencias). | Marco operativo: define cómo se decide, se gobierna y se mide cada iniciativa de IA, con reglas, evidencias y un registro común. Un solo sistema con códigos y lenguaje compartidos (sección 5). |
| **Acceso y licencia** | El detalle de los marcos (*toolkits*, guías de mercado, informes del Hype Cycle) es investigación para clientes; en abierto se publican artículos, notas de prensa y resúmenes. Los contenidos son propiedad de Gartner. | Todo es público y gratuito: documentos, plantillas y herramientas, con licencia CC BY 4.0 para los contenidos y MIT para el código; se puede adaptar y redistribuir citando la autoría (sección 6). |
| **Unidad de gestión** | La organización y sus capacidades, organizadas en siete líneas de trabajo. | Dos niveles: el ciclo corporativo C1–C5 de la compañía y el ciclo de vida de **cada iniciativa**, fases 0 a 7 (documento 01). |
| **Ciclo de vida y decisiones** | La hoja de ruta ordena el avance de las capacidades; los casos de uso se priorizan por valor y viabilidad. | Puertas G0–G7 con resultado formal (Continuar, Continuar con condiciones, Iterar, Pivotar o Parar; en G7, Escalar, Iterar o Retirar), validación dual, límite de dos iteraciones y G3 como principal puerta de parada (documentos 20 y 21). |
| **Madurez** | Escala de cinco niveles por línea de trabajo, que sitúa a la organización y orienta su hoja de ruta. | Siete dimensiones D1–D7 en escala 0–5 con evidencias, nivel global limitado por el gobierno (D1) y el riesgo (D6), y tres lentes: la huella tecnológica no suma madurez, fija el gobierno mínimo exigible (documento 11). |
| **Priorización de casos de uso** | Radar de ambición (de cada día o que cambia las reglas; interno o de cara al cliente) y prismas por sector o función según valor y viabilidad. | Nueve esferas de impacto por tres niveles de ambición (Optimizar, Aumentar, Transformar) con criterios de puerta distintos para cada nivel, y mapa de impacto frente a la ambición fijada en C2 (documento 10). |
| **Medición del valor** | Recomienda medir el retorno con métricas ligadas a la cuenta de resultados (reducción de costes, crecimiento de ingresos o experiencia del empleado) en lugar de métricas de actividad como la productividad o la adopción, eligiendo dos o tres métricas por objetivo ([5 AI Metrics That Actually Prove ROI to Your Board](https://www.gartner.com/en/articles/ai-value-metrics)). | Reglas obligatorias: coste completo, estado de cada importe (validado, declarado o estimado), solo lo validado llega al neto, plan de realización por tramos y realización frente a la curva aprobada (documentos 40 y 43). |
| **Distinguir eficiencia y transformación** | El radar distingue IA de productividad e IA que cambia el modelo de negocio. | Índice de transformación de la compañía con ocho señales y condiciones de base, que separa la transformación evidenciada de la declarada (documento 12). |
| **Riesgo, seguridad y cumplimiento** | AI TRiSM: capacidades técnicas para hacer cumplir las políticas de gobierno; guías del mercado de soluciones de gobierno de la IA. Para los agentes, propone un gobierno proporcional por niveles de autonomía en lugar de aplicar los mismos controles a todos ([nota de prensa de 26-05-2026](https://www.gartner.com/en/newsroom/press-releases/2026-05-26-gartner-says-applying-uniform-governance-across-ai-agents-will-lead-to-enterprise-ai-agent-failure)). | Riesgo P×I 5×5 con aceptación por el órgano de su nivel, catálogo de riesgos tipo, controles de seguridad y de agentes, niveles de autonomía A0–A3 y correspondencia con el Reglamento Europeo de IA, el RGPD, DORA, NIS2, el NIST AI RMF, el NIST CSF 2.0 e ISO/IEC 42001 (documentos 32–35). |
| **Papel del consejo** | Material para que la dirección y el consejo entiendan la IA y sus prioridades. | Funciones formales: el consejo aprueba la tesis y el apetito de riesgo en C2, las apuestas de Transformar en G2 y el escalado en G7; panel del consejo y registro de decisiones y recomendaciones (documentos 30, 60 y 62). |
| **Plantillas y herramientas** | *Toolkit* de diagnóstico en línea e informes para clientes. | Plantillas editables en Word (bloque H de la biblioteca) y herramientas de un solo HTML (registro de iniciativas, calculadoras, diagnóstico de madurez, recorrido de implantación y panel del consejo) que funcionan sin servidor (documento 03). |
| **Datos de mercado** | Encuestas propias, comparación con otras organizaciones, previsiones y el Hype Cycle. | No compara a la compañía con el mercado: mide con los datos de la propia compañía; la galería por sector cita solo estudios con fuente abierta. |
| **Certificación** | No consta en las fuentes publicadas por Gartner para estos marcos. | No hay certificación: la declaración de aplicación es una autodeclaración verificable por auditoría (documento 01, sección 14). |

**Si la compañía ya usa los marcos de Gartner.** Los dos enfoques responden a preguntas distintas y pueden usarse a la vez: el diagnóstico y las prioridades de Gartner pueden alimentar el diagnóstico C1 y la tesis C2 de SEVEN-G, y su evaluación de madurez puede convalidarse documentando su correspondencia con las dimensiones D1–D7 (documento 96, modificador MP4).

*Gartner y Hype Cycle son marcas registradas de Gartner, Inc. o de sus filiales, y los nombres de sus marcos citados aquí pertenecen a su titular. SEVEN-G y su autor no tienen relación con Gartner ni cuentan con su respaldo; esta comparación es una descripción propia hecha a partir de lo que Gartner publica en abierto.*

*Fuentes de gartner.com cotejadas el 01-10-2026 con el texto que su autor publica en abierto (registro de referencias, MER-GAR-01 a MER-GAR-04, MER-GAR-08 y MER-GAR-09). Los marcos de Gartner cambian con el tiempo: esta comparación describe lo que su autor publicaba en esa fecha.*

---

## 9. Herramientas y plantillas asociadas

| Código | Nombre | Relación con este documento |
|---|---|---|
| T01 | Registro de iniciativas | Aplica la gestión del embudo: fases, tiempos, criterios, motivos de parada y valor. |
| T17 | Panel de IA para el consejo | Muestra el embudo, los casos que salieron de él y por qué. |
| P29 | Registro de decisión de *gate* | Conserva el resultado y el motivo de cada decisión. |
| P30 | Decisión de escalado o retirada | Recoge las lecciones aprendidas de cada retirada. |

---

## 10. Documentos relacionados

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

## 11. Control de versiones

| Versión | Fecha | Cambios |
|---|---|---|
| 0.1 | 19-09-2026 | Primera versión. Origen práctico del marco, carencias de los enfoques habituales que corrige, disciplinas de gestión que reúne, la cartera como embudo comercial y sus diferencias, motivos de la licencia abierta, control que conserva el autor y contacto. |
| 0.2 | 01-10-2026 | Nueva sección 8, «Comparación con otras metodologías de mercado»: criterio común (solo diferencias, sin valoración, mismas dimensiones, fuentes oficiales, solo contenido publicado en abierto y resumido con palabras propias, marcas de sus titulares sin vínculo ni respaldo) y primera comparación, con Gartner, cotejada con las fuentes de gartner.com (nombres de las líneas y de los cinco niveles de madurez, áreas del radar, métricas de valor y gobierno proporcional de los agentes), con nota de marcas y sin citar sus previsiones de mercado. Las secciones 8 a 10 pasan a 9 a 11. |
