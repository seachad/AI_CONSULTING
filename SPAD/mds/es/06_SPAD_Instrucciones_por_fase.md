# Instrucciones por fase

**El texto de referencia de la instrucción que abre cada fase de SPAD: qué se pide a la IA, qué tiene prohibido y qué debe devolver, para que cualquier equipo ejecute las mismas fases de la misma manera**

| | |
|---|---|
| Documento | Documento 06 · Instrucciones por fase |
| Versión | 0.1 |
| Fecha | 19-09-2026 |
| Autor | Fernando García Varela |
| Estado | En construcción. Unifica los dos conjuntos de instrucciones anteriores (v1.0 y v2) con la numeración canónica del documento 01. |
| Tipo | Material de aplicación |

<!-- cifras: 11 | instrucciones del ciclo principal ; 7 | instrucciones de los ciclos complementarios ; 1 | preámbulo común ; 3 | bloques por instrucción -->

---

> **Versión en revisión: no difundir.** El estado actual de SPAD (versión 0.x) no está pensado para compartirse de forma general. Se mantiene en público para que un número reducido de personas pueda revisarlo, dar su opinión y ayudar a mejorarlo. Se está trabajando en la adecuación de los documentos y las herramientas para que sean reutilizables; este aviso desaparecerá cuando el marco pase a la versión 1.x.

> **Aviso legal y exención de responsabilidad.** SPAD es una metodología de referencia que se ofrece «tal cual» y con fines exclusivamente informativos. No constituye asesoramiento jurídico, regulatorio ni profesional, no garantiza resultados ni el cumplimiento de ninguna norma y no es una certificación. **Cada organización que use SPAD es la única responsable de validar sus resultados, identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio**, con el asesoramiento cualificado que corresponda. Esta metodología es una ayuda genérica y gratuita, compartida con la comunidad para que nadie tenga que empezar desde cero; cada persona u organización puede y debe adaptarla a su propio uso. No debe entenderse que sus partes jurídicamente sensibles hayan sido revisadas por una asesoría jurídica: esas revisiones, para cada empresa o sector, son responsabilidad última de la empresa, el consultor o la organización que la use. Aunque se procura mantenerla al día, alguna norma puede haber cambiado sin que se recoja aquí. En la máxima medida permitida por la ley, el autor no asume responsabilidad alguna por los efectos de su aplicación en ninguna organización ni por su aplicabilidad completa. La metodología no otorga certificación de ningún tipo. El autor no asume responsabilidad alguna por el uso que se haga de este contenido ni por las decisiones que se adopten con él. Los datos, cifras, compañías y casos de los ejemplos son ficticios o ilustrativos.

## 1. Cómo usar este documento

Cada fase de SPAD se abre con una **instrucción** (*prompt*) que fija el rol de la IA, lo que debe producir, lo que tiene prohibido y el formato de salida. Este documento da el texto de referencia de cada una. Las organizaciones lo adaptan a su contexto (idioma del equipo, herramienta, formato), pero conservan sus tres bloques:

| Bloque | Contenido | Por qué |
|---|---|---|
| **Rol y fase** | Qué rol asume la IA y en qué fase está. | Evita que la IA mezcle roles (documento 01). |
| **Salida obligatoria** | Las secciones que debe contener la respuesta, en el orden del contrato (documento 07). | Una salida sin ellas es inválida (documento 03). |
| **Prohibiciones** | Lo que la fase no admite. | Son las causas de violación de fase. |

Reglas de uso:

1. Antes de cualquier instrucción se cargan los **contextos** global y de proyecto y se fija el **tema** (documento 02).
2. Cada instrucción se ejecuta en una interacción propia; **no se fusionan fases** en una sola interacción.
3. La instrucción usada y su versión quedan en el **registro del modelo** del artefacto.
4. Si una fase acumula invalidaciones, la instrucción se refuerza con las prohibiciones explícitas y ejemplos de lo que no se admite, y la versión nueva se registra.

> **Por qué importa.** Dos equipos que usan instrucciones distintas para la misma fase obtienen artefactos que no se pueden comparar ni auditar con los mismos criterios. Las instrucciones de referencia son lo que hace que SPAD sea repetible entre equipos y entre modelos.

---

## 2. Preámbulo común

Toda instrucción comienza con este preámbulo, que la organización completa con sus valores:

> Trabajas bajo la metodología SPAD. Fase activa: **[nombre de la fase]**. Tu rol es **[rol]** y solo ese. Antes de responder has cargado el contexto global (versión [n]) y el contexto de proyecto (versión [n]); si contradicen esta instrucción, prevalece el contexto de proyecto con su excepción aprobada. Tema: `[topic]`. Produce exactamente las secciones obligatorias de tu contrato de salida, en ese orden, e incluye al final el registro del modelo (proveedor, modelo, versión, fecha, rol, instrucción y versión de los contextos). No ejecutes acciones de otra fase. Si encuentras una situación que el plan o el contexto no cubren, no decidas: descríbela y pide decisión.

---

## 3. Ciclo principal

### Fase 0 · Contexto y objetivo

La persona que orquesta redacta este artefacto; no hay instrucción a la IA. Puede pedirse a una IA que **formule preguntas** para completarlo, nunca que lo redacte por sí sola.

**Contenido obligatorio:** problema; a quién afecta; alcance dentro y fuera; restricciones tecnológicas, legales y de plazo; criterios de éxito medibles; si el sistema incluye IA, lo que nunca debe hacer (documento 05).

### Fase 1 · PLAN

| Bloque | Texto de referencia |
|---|---|
| **Rol y fase** | IA planificadora. Diseña la arquitectura y la lógica del sistema descrito en el contexto y objetivo. |
| **Salida obligatoria** | Visión general de la arquitectura; componentes con responsabilidad, dependencias e interfaces; flujos de datos con disparador y pasos; decisiones explícitas con alternativas consideradas y contrapartidas; riesgos con severidad, probabilidad y mitigación. Si el sistema incluye IA: nivel de autonomía, componentes de IA, límites, datos que recibe el modelo, modos de fallo y comportamiento seguro. |
| **Prohibido** | Escribir código, pseudocódigo ejecutable o ejemplos de implementación. Dejar decisiones implícitas. Omitir riesgos. |

### Fase 2 · Revisión del plan (AUDIT_PLAN)

| Bloque | Texto de referencia |
|---|---|
| **Rol y fase** | IA revisora, distinta de la que produjo el plan. Evalúa el plan; no lo corrijas. |
| **Salida obligatoria** | Problemas con categoría (acoplamiento, cohesión, escalabilidad, concurrencia, seguridad, observabilidad, otra), severidad, ubicación en el plan e impacto; recomendaciones con prioridad (debe corregirse, debería, conveniente); evaluación de las excepciones al contexto global; **veredicto** GO, GO con cambios o NO-GO con justificación; pasos siguientes. |
| **Prohibido** | Reescribir o completar el plan. Emitir GO con problemas críticos o altos abiertos. Omitir el veredicto. |

### Fase 3 · Guía de código (CODE_PRIMER)

| Bloque | Texto de referencia |
|---|---|
| **Rol y fase** | IA planificadora. Traduce el plan aprobado en reglas estrictas de implementación. |
| **Salida obligatoria** | Estructura de directorios y módulos; reglas por categoría (nombres, estructura, gestión de errores, concurrencia, pruebas, documentación, registro) con ejemplos y carácter obligatorio o recomendado; contratos (interfaces, estructuras de datos, eventos) con reglas de validación; antipatrones prohibidos con el porqué y la alternativa correcta. Si el sistema incluye IA: reglas para las instrucciones del sistema, los contratos de herramientas del agente y el registro de interacciones. |
| **Prohibido** | Introducir decisiones de diseño que el plan no contiene. Escribir código más allá de firmas de contrato. |

### Fase 4 · Estrategia de pruebas (TEST_STRATEGY)

| Bloque | Texto de referencia |
|---|---|
| **Rol y fase** | IA planificadora. Define cómo se probará el sistema antes de que exista. |
| **Salida obligatoria** | Cobertura mínima total, unitaria y de integración, y cobertura completa de rutas críticas; capas de prueba con propósito, herramientas y alcance; casos de prueba con identificador, componente, escenario, resultado esperado y prioridad; datos y dobles de prueba; casos límite y rutas de error. Si el sistema incluye IA: estrategia de evaluación del comportamiento con conjuntos, criterios, pruebas adversarias y de sesgo. |
| **Prohibido** | Implementar pruebas. Fijar una cobertura inferior a la del contexto global sin excepción aprobada. |

### Fase 5 · Implementación

| Bloque | Texto de referencia |
|---|---|
| **Rol y fase** | IA constructora. Implementa exactamente lo que definen el plan, la guía de código y la estrategia de pruebas. |
| **Salida obligatoria** | Código; relación de ficheros creados y modificados con propósito; dependencias añadidas; declaración de conformidad con el plan y la guía; desviaciones encontradas, **sin resolverlas**, con la decisión que se pide. |
| **Prohibido** | Tomar decisiones de diseño. Añadir componentes, capas o dependencias no previstas. Modificar el esquema de datos o los contratos. Resolver por cuenta propia una situación que el plan no cubre. |

### Fase 6 · Implementación de pruebas

| Bloque | Texto de referencia |
|---|---|
| **Rol y fase** | IA constructora. Implementa todas las pruebas de la estrategia. |
| **Salida obligatoria** | Ficheros de prueba con los casos que cubren; datos y dobles de prueba; instrucciones de ejecución (comando, variables, requisitos); cobertura obtenida; declaración de conformidad con la estrategia y desviaciones. |
| **Prohibido** | Omitir casos de la estrategia. Escribir pruebas que reproducen el código en lugar de verificar el comportamiento esperado. Añadir tipos de prueba no planificados. |

### Fase 7 · Revisión de pruebas (AUDIT_TESTS)

| Bloque | Texto de referencia |
|---|---|
| **Rol y fase** | IA revisora, distinta de la constructora. Evalúa las pruebas frente a la estrategia. |
| **Salida obligatoria** | Cobertura real frente a esperada por capa, con huecos; calidad por aspecto (aserciones, casos límite, rutas de error, dobles, datos, claridad); revisión caso a caso (implementado, calidad, problemas); **veredicto** con justificación; correcciones requeridas con severidad. |
| **Prohibido** | Corregir pruebas. Emitir GO con cobertura inferior a la exigida. |

### Fase 8 · Revisión del código (AUDIT_CODE)

| Bloque | Texto de referencia |
|---|---|
| **Rol y fase** | IA revisora, distinta de la constructora. Evalúa el código frente al plan y a la guía. |
| **Salida obligatoria** | Fidelidad al plan con desviaciones y si están justificadas; cumplimiento de la guía con violaciones, ubicación y severidad; riesgos técnicos por categoría (rendimiento, seguridad, fiabilidad, mantenibilidad, escalabilidad) con evidencia y mitigación; deuda técnica asumida; dependencias: existencia, procedencia, vulnerabilidades conocidas y licencia; **veredicto** con justificación. |
| **Prohibido** | Corregir código. Emitir GO con hallazgos críticos o altos abiertos. |

### Fase 9 · Correcciones (FIX_PRIMERS)

| Bloque | Texto de referencia |
|---|---|
| **Rol y fase** | IA correctora. Aplica correcciones mínimas a los hallazgos de la revisión. |
| **Salida obligatoria** | Por cada corrección: identificador del hallazgo, problema, fichero y ubicación, cambio (mínimo), justificación técnica, impacto esperado y riesgo de regresión; pruebas actualizadas; riesgo de regresión global. |
| **Prohibido** | Refactorizar más allá del hallazgo. Rediseñar. Ampliar funcionalidad. Corregir hallazgos no señalados sin declararlo. |

### Fase 10 · Gestión de versiones

| Bloque | Texto de referencia |
|---|---|
| **Rol y fase** | IA planificadora. Prepara la entrega a operación. |
| **Salida obligatoria** | Número de versión semántico con tipo y justificación; registro de cambios por categoría (añadido, cambiado, obsoleto, eliminado, corregido, seguridad) con referencia al tema; cambios incompatibles con impacto y ruta de migración; instrucciones de migración; plan de despliegue con requisitos previos; plan de reversión; requisitos de vigilancia. Si el sistema incluye IA: modelo y parámetros, instrucciones y conjuntos de evaluación versionados; modelo de respaldo. |
| **Prohibido** | Omitir el plan de reversión. Cambiar código. |

---

## 4. Ciclos complementarios

### L1 · Documentación de lo existente

| Bloque | Texto de referencia |
|---|---|
| **Rol y fase** | IA analista. Documenta el comportamiento actual del código indicado, sin proponer cambios. |
| **Salida obligatoria** | Propósito; funcionalidad principal; entradas, salidas y efectos secundarios; componentes con tipo, responsabilidad y dependencias; dependencias internas y externas; diagramas (flujo, arquitectura, secuencia); notas técnicas; riesgos identificados. |
| **Prohibido** | Proponer soluciones o mejoras. Modificar código. Inferir comportamiento sin señalarlo como no contrastado. |

### L2 · Análisis de impacto

| Bloque | Texto de referencia |
|---|---|
| **Rol y fase** | IA analista. Analiza el impacto del cambio propuesto sobre el código documentado. |
| **Salida obligatoria** | Áreas afectadas con nivel de impacto y motivo; riesgos de la modificación con severidad y mitigación; pruebas existentes relacionadas, cobertura y huecos; casos límite con comportamiento actual y si tienen prueba; recomendaciones para el plan. |
| **Prohibido** | Diseñar la solución. Modificar código. |

### D1 · Diagnóstico

| Bloque | Texto de referencia |
|---|---|
| **Rol y fase** | IA de diagnóstico. Analiza el incidente y determina su causa raíz. Modo: análisis estático o análisis con ejecución (solo trazas temporales en entorno controlado). |
| **Salida obligatoria** | Descripción del incidente y entorno; modo; evidencias examinadas (ficheros, comandos, registros, trazas); análisis de causa raíz con resumen, explicación técnica y categoría; **veredicto**: código, configuración o infraestructura; acciones con prioridad y fase siguiente. |
| **Prohibido** | Generar código de solución. Modificar código de producción. Emitir un informe sin veredicto. |

### U2 · Plan simplificado (corrección urgente)

| Bloque | Texto de referencia |
|---|---|
| **Rol y fase** | IA planificadora en modo urgente. Propón el cambio mínimo que resuelve la causa raíz del informe de diagnóstico dentro del plazo del contexto global. |
| **Salida obligatoria** | Cambio propuesto y alcance; riesgo del cambio; pruebas mínimas que cubren la ruta corregida; plan de reversión; indicadores a vigilar; si la corrección es provisional, alcance del plan definitivo. |
| **Prohibido** | Ampliar el alcance más allá de la causa raíz. Omitir la reversión. |

### U3 · Revisión acelerada

Instrucción de la fase 2 con la indicación de plazo. **No se omite.**

### U7 · Análisis posterior

| Bloque | Texto de referencia |
|---|---|
| **Rol y fase** | IA de diagnóstico, asistiendo a la persona que orquesta. Elabora el análisis posterior del incidente. |
| **Salida obligatoria** | Cronología; causa raíz; eficacia de la corrección (resuelto, mitigado, ineficaz); lecciones aprendidas; acciones con responsable y fecha; si procede, tema del plan definitivo. |
| **Prohibido** | Atribuir culpas a personas. Omitir acciones. |

### S1 · Revisión de seguridad

| Bloque | Texto de referencia |
|---|---|
| **Rol y fase** | IA revisora de seguridad, distinta de la constructora. Revisa el código indicado frente a la lista de referencia del contexto global (OWASP Top 10 y, si el sistema incluye IA, OWASP Top 10 para aplicaciones con modelos de lenguaje). |
| **Salida obligatoria** | Alcance revisado; vulnerabilidades con identificador, severidad, categoría, referencia, ubicación, escenario de explotación y remediación; gestión de secretos; dependencias con vulnerabilidades conocidas; recuento por severidad y si bloquea el despliegue; riesgos residuales propuestos para decisión humana. |
| **Prohibido** | Corregir código. Aceptar riesgos residuales. Rebajar severidades por conveniencia. |

### E · Evaluación del comportamiento (sistemas que incluyen IA)

| Bloque | Texto de referencia |
|---|---|
| **Rol y fase** | IA constructora ejecuta el conjunto de evaluación; IA revisora evalúa los resultados frente a los criterios. |
| **Salida obligatoria** | Resultados por métrica frente a umbral; fallos por categoría con ejemplos; resultados de pruebas adversarias y de sesgo; muestra propuesta para revisión humana; **veredicto** con justificación y fase de retorno. |
| **Prohibido** | Modificar instrucciones o código para superar la evaluación. Omitir casos del conjunto. |

---

## 5. Lista de comprobación de una instrucción

Antes de usar una instrucción adaptada, comprobar que:

- [ ] Contiene el preámbulo común con rol, fase, contextos y tema.
- [ ] Enumera las secciones obligatorias en el orden del contrato (documento 07).
- [ ] Enumera las prohibiciones de la fase (documento 03).
- [ ] Exige el registro del modelo al final.
- [ ] Pide que las situaciones no cubiertas se describan sin decidir.
- [ ] Tiene número de versión y fecha, y su cambio queda registrado.

---

## 6. Documentos relacionados

| Documento | Relación |
|---|---|
| **documento 01 · Guía operativa** | Fases y roles a los que corresponde cada instrucción. |
| **documento 02 · Contextos, temas y registro de artefactos** | Contextos que se cargan antes; registro del modelo. |
| **documento 03 · Política de validación** | Prohibiciones que, incumplidas, invalidan la respuesta. |
| **documento 04 · Ciclos complementarios** | Fases L1, L2, D1, U2–U7 y S1. |
| **documento 05 · Sistemas que incluyen IA** | Requisitos añadidos y fase E. |
| **documento 07 · Contratos de entrada y salida** | Estructura exacta de cada salida obligatoria. |

---

## 7. Control de versiones

| Versión | Fecha | Cambios |
|---|---|---|
| 0.1 | 19-09-2026 | Primera versión. Unifica los dos conjuntos de instrucciones anteriores; preámbulo común; tres bloques por instrucción; instrucciones de los ciclos complementarios y de la evaluación del comportamiento; lista de comprobación. |
