# Feedback externo · Informe de recomendaciones para la evolución de SEVEN-G

Recibido por el autor el 01-10-2026 dentro de la ronda de revisión externa. Se conserva el texto tal como llegó, como fuente del plan [20261001_Plan_sprints_feedback_evolucion_SEVEN-G.md](20261001_Plan_sprints_feedback_evolucion_SEVEN-G.md). Las referencias entre paréntesis («Seachad», «ISO», «NIST AI Resource Center») eran enlaces en el original.

---

## Resumen ejecutivo

SEVEN-G presenta una propuesta sólida y poco habitual: abordar la inteligencia artificial no únicamente desde el riesgo, la tecnología o el cumplimiento, sino como una cartera empresarial que debe producir valor demostrable, mantenerse bajo gobierno y permitir decisiones explícitas de continuar, modificar, escalar o abandonar iniciativas.

Su mayor fortaleza está precisamente en integrar disciplinas que suelen aparecer separadas: estrategia, cartera, business case, gobierno, riesgo, cumplimiento, construcción, operación, medición de beneficios y supervisión por el consejo. El marco actual materializa esta propuesta en un ciclo 0–7 con puertas de decisión, un sistema corporativo de gobierno y un conjunto muy completo de instrumentos. Actualmente se publica como versión 0.1 y contiene 42 documentos, 74 plantillas y 7 aplicaciones. (Seachad)

La principal recomendación para su evolución no sería ampliar el marco, sino simplificar, validar y posicionar mejor lo que ya existe.

SEVEN-G tiene suficientes componentes. La siguiente etapa debería demostrar que estos componentes producen mejores decisiones empresariales con una carga de gobierno razonable.

## 1. Principales fortalezas

El primer acierto es tratar la IA como cartera de inversión, no como acumulación de proyectos tecnológicos. Cada iniciativa tiene responsable, coste, expectativa de valor, fase y decisiones de continuidad. Esto lleva la conversación desde “qué IA estamos haciendo” hacia “qué estamos financiando, por qué y con qué resultado”. (Seachad)

El segundo es la existencia de puertas de decisión con capacidad real de parar. La metodología incorpora iteración, pivote y abandono como resultados legítimos. Esta filosofía resulta especialmente valiosa en IA, donde el elevado número de experimentos puede generar carteras de pilotos que permanecen indefinidamente sin demostrar valor.

El tercer punto fuerte es la disciplina económica. La separación entre valor estimado, declarado y validado dificulta presentar beneficios teóricos como resultados realizados. La insistencia en línea base, hipótesis, atribución, coste y materialización de beneficios constituye uno de los elementos más diferenciadores de SEVEN-G.

También resulta acertada la separación entre optimización, aumento y transformación. Evita identificar automáticamente adopción tecnológica con transformación empresarial y obliga a buscar cambios observables en procesos, capacidades, organización o modelo económico.

Finalmente, SEVEN-G tiene una ventaja práctica importante frente a muchos marcos conceptuales: proporciona instrumentos de ejecución. El registro de iniciativas, los criterios de gate, las plantillas, el panel del consejo y las herramientas hacen que el marco pueda convertirse realmente en un sistema operativo de gobierno y no quedarse en un conjunto de principios. (Seachad)

## 2. Principal debilidad: riesgo de sobregobierno

La exhaustividad que constituye una fortaleza es también el principal riesgo de SEVEN-G.

El marco exige que cada iniciativa atraviese un ciclo formal de fases y decisiones. Incluso en alcance Lite se agrupan algunas puertas —G0–G2 y G4–G5— pero cada puerta continúa siendo una decisión que debe registrarse independientemente. (Seachad)

Esta filosofía proporciona trazabilidad, pero puede generar una carga desproporcionada en iniciativas pequeñas, reversibles y de bajo riesgo.

El problema no debe medirse únicamente contando documentos. La verdadera carga administrativa procede de las horas necesarias para preparar evidencias, revisarlas, obtener validaciones, coordinar participantes, celebrar gates y registrar las decisiones.

Una metodología que exige quince horas de gobierno para una iniciativa de cuatrocientas horas puede ser extraordinariamente eficiente. Si exige quince horas para una iniciativa que necesita veinticinco horas de ejecución, el modelo de gobierno empieza a destruir el valor que pretende proteger.

La recomendación fundamental sería pasar de:

“todas las iniciativas recorren el mismo ciclo, variando la profundidad”

a:

“todas las iniciativas cumplen los mismos principios de control, pero el recorrido administrativo depende de materialidad, riesgo y reversibilidad”.

Esto permitiría mantener la coherencia metodológica sin convertirla en uniformidad procesal.

## 3. Introducir un nivel Express

Además de Lite y Enterprise, sería conveniente estudiar un tercer nivel, provisionalmente denominado Express.

Express podría reservarse para iniciativas de bajo coste, uso interno, fácilmente reversibles, sin decisiones significativas sobre personas, sin datos especialmente sensibles, sin autonomía para ejecutar acciones relevantes y sin impacto sobre funciones críticas.

En ese nivel, contexto, oportunidad, hipótesis de valor, riesgo, responsable, prueba, aprobación y reversión podrían registrarse en una única ficha viva y una decisión consolidada, aunque conceptualmente sigan existiendo los principios de las distintas fases.

Lite mantendría un gobierno intermedio y Enterprise conservaría el modelo completo.

La proporcionalidad dejaría así de afectar solamente a la profundidad documental y pasaría también a afectar al propio recorrido.

## 4. Evitar que SEVEN-G duplique la organización existente

Una gran empresa ya dispone normalmente de mecanismos equivalentes a muchas evidencias de SEVEN-G: business cases, Jira o Azure DevOps, arquitectura empresarial, ciberseguridad, DPIA, compras, vendor risk, change management, controles financieros, auditoría y registros corporativos.

SEVEN-G debería reforzar explícitamente el principio:

“referenciar evidencia antes que reproducir evidencia”.

Una evidencia existente debería poder satisfacer directamente un criterio de SEVEN-G mediante referencia, responsable, versión y fecha, sin necesidad de copiarla a una plantilla adicional.

La arquitectura ideal sería que SEVEN-G funcionase como capa de orquestación y trazabilidad sobre procesos corporativos existentes, no como un sistema documental paralelo.

Esto es particularmente importante para su adopción en grandes organizaciones.

## 5. Intersección con estándares

SEVEN-G ocupa una posición interesante porque intersecta con varias normas sin coincidir exactamente con ninguna.

ISO/IEC 42001:2023 establece requisitos para crear, implementar, mantener y mejorar un sistema de gestión de IA en una organización. Su enfoque es organizativo y sigue la lógica de un sistema de gestión, en lugar de prescribir detalladamente cómo debe gestionarse cada iniciativa concreta. (ISO)

ISO/IEC 38507:2022 se concentra en las implicaciones de gobierno de la IA para los órganos de gobierno y la dirección. (ISO)

ISO/IEC 23894:2023 proporciona orientación específica sobre integración de la gestión de riesgos de IA. (ISO)

ISO/IEC 42005:2025 desarrolla específicamente las evaluaciones de impacto de sistemas de IA a lo largo de su ciclo de vida. (ISO)

NIST AI RMF, por su parte, estructura la gestión del riesgo alrededor de Govern, Map, Measure y Manage y especifica que sus actividades no constituyen necesariamente una secuencia ni una checklist obligatoria. (NIST AI Resource Center)

SEVEN-G añade a esos ámbitos algo que ninguno de ellos coloca en el centro con la misma intensidad: disciplina de cartera, gates de inversión, medición económica, materialización de beneficios y distinción entre eficiencia y transformación.

Por ello, el posicionamiento más prometedor probablemente no sea presentar SEVEN-G como alternativa a esos estándares.

Resultaría más potente posicionarlo como:

la capa operativa que conecta estrategia, inversión, valor, ciclo de vida y gobierno, permitiendo materializar requisitos y prácticas procedentes de ISO, NIST y regulación dentro de un único proceso de decisión empresarial.

En otras palabras: los estándares ayudan a determinar qué debe existir; SEVEN-G puede especializarse en explicar cómo hacer que todo ello funcione iniciativa por iniciativa y cartera por cartera.

## 6. Desarrollar un verdadero crosswalk de conformidad

Una oportunidad importante sería construir una matriz explícita y versionada:

SEVEN-G ↔ ISO/IEC 42001 ↔ ISO/IEC 38507 ↔ ISO/IEC 23894 ↔ ISO/IEC 42005 ↔ NIST AI RMF ↔ AI Act.

No debería limitarse a indicar que un documento “está relacionado” con una norma. Debería señalar exactamente qué requisito, control u outcome queda soportado por qué proceso y qué evidencia de SEVEN-G.

También debería distinguir claramente:

cubierto directamente / parcialmente soportado / requiere control externo / no cubierto.

Esa honestidad aumentaría mucho su credibilidad y evitaría cualquier impresión de equivalencia con una certificación, algo que el propio SEVEN-G ya descarta expresamente en su documentación. (Seachad)

## 7. Separar con mayor claridad lo obligatorio de lo recomendado

A medida que el marco crece, resulta cada vez más importante diferenciar tres categorías:

Principio obligatorio → condición necesaria para decir que se aplica SEVEN-G.

Práctica recomendada → forma aconsejada de satisfacerlo.

Instrumento opcional → plantilla o herramienta proporcionada para facilitarlo.

Esta separación permitiría que el núcleo metodológico fuese pequeño y estable mientras documentos, plantillas y herramientas pudieran evolucionar mucho más rápidamente.

También acercaría conceptualmente SEVEN-G a la estructura de los estándares maduros: un core pequeño y normativo rodeado de abundante guidance.

## 8. Validar empíricamente el marco

La versión actual se identifica correctamente como 0.1 y borrador de trabajo. (Seachad) El camino hacia una versión 1.0 debería pasar principalmente por aplicación práctica.

Sería particularmente útil obtener casos de organizaciones de distintos tamaños y sectores y medir qué ocurre al utilizar SEVEN-G.

No solo debería observarse el éxito de las iniciativas de IA. También debería estudiarse el propio método.

Propongo incorporar cuatro métricas de gobierno: horas de gobierno por iniciativa; tiempo medio para superar cada gate; porcentaje de evidencias reutilizadas desde sistemas existentes; y relación entre coste de gobierno y coste total de la iniciativa.

Esto permitiría establecer empíricamente cuándo Lite resulta realmente ligero y cuándo debería activarse Express o Enterprise.

También permitiría calibrar los pesos y umbrales del Índice de Transformación, que es conceptualmente atractivo pero necesita datos reales antes de poder interpretarse como una medida robusta entre organizaciones.

## 9. Mantener separados valor, rendimiento y riesgo

La disciplina de monetización de SEVEN-G es útil porque dificulta el uso de métricas decorativas. Sin embargo, debe evitarse que la búsqueda de equivalentes económicos genere una falsa precisión.

No todo resultado importante necesita convertirse inmediatamente en euros.

Sería aconsejable presentar siempre tres perspectivas paralelas:

valor económico | resultado operativo | exposición al riesgo.

Posteriormente pueden relacionarse, pero no es necesario fusionarlas artificialmente en un único indicador.

Una mejora de calidad, un aumento de resiliencia o una reducción de determinado riesgo pueden constituir resultados legítimos incluso cuando su traducción financiera exacta sea incierta.

## 10. Convertir la simplicidad en un requisito de diseño

La próxima versión debería tratar la reducción de burocracia como una característica funcional del marco y no simplemente como una opción de implantación.

Sería especialmente útil adoptar una regla de diseño como:

Ninguna evidencia debe solicitarse dos veces, ninguna decisión debe necesitar más participantes de los necesarios y ninguna iniciativa debe soportar un coste de gobierno desproporcionado respecto a su riesgo y materialidad.

Esta podría llegar a convertirse en uno de los principios distintivos de SEVEN-G.

## Recomendaciones prioritarias para una versión 1.0

1. No añadir significativamente más contenido. Consolidar y simplificar lo existente.
2. Crear Express / Lite / Enterprise, permitiendo recorridos realmente diferentes.
3. Definir un núcleo metodológico mínimo, separándolo de guidance, plantillas y herramientas.
4. Convertir la reutilización de evidencias corporativas en principio explícito.
5. Crear un crosswalk riguroso y versionado con ISO, NIST y regulación.
6. Medir el coste del propio gobierno y establecer objetivos de proporcionalidad.
7. Validar SEVEN-G en organizaciones reales, publicando casos, problemas detectados y cambios realizados.
8. Calibrar empíricamente el Índice de Transformación antes de presentarlo como instrumento comparable.
9. Mantener separadas las métricas económicas, operativas y de riesgo cuando no exista una conversión económica suficientemente defendible.
10. Posicionar SEVEN-G como operating model de IA, no como sustituto de los estándares.

## Conclusión

SEVEN-G ya tiene una amplitud comparable, en determinados aspectos funcionales, a la combinación de varios marcos existentes. Su particularidad es que incorpora además una capa de gestión económica y de cartera que los estándares de gobierno y riesgo no suelen desarrollar de forma tan operativa.

Su reto principal ya no parece ser demostrar que es completo.

Es demostrar que puede ser completo sin ser pesado.

Si consigue reducir la fricción administrativa, integrarse con las evidencias que las organizaciones ya poseen, demostrar interoperabilidad rigurosa con estándares reconocidos y validar sus mecanismos mediante implantaciones reales, podría ocupar un espacio muy interesante:

un sistema operativo abierto para convertir estrategia de IA, inversión, gobierno, riesgo y valor en un único proceso empresarial trazable.

El mejor consejo para la siguiente etapa podría resumirse así:

menos extensión, más evidencia; menos documentos nuevos, más interoperabilidad; menos uniformidad de proceso, más proporcionalidad; y más validación independiente en situaciones reales.
