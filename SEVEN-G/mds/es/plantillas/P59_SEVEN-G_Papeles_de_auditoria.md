# Papeles de trabajo de auditoría

**Documenta cada auditoría de IA de principio a fin: planificación, apertura, pruebas con su muestra y su evidencia, cierre y seguimiento de las recomendaciones.**

| | |
|---|---|
| Documento | Plantilla P59 · Papeles de trabajo de auditoría |
| Versión | 0.1 (borrador de trabajo) |
| Fecha | 19-09-2026 |
| Autor | Fernando García · SEACHAD |
| Estado | Borrador para revisión. |

---

> **Aviso legal y exención de responsabilidad.** SEVEN-G es un marco metodológico de referencia que se ofrece «tal cual» y con fines exclusivamente informativos. No constituye asesoramiento jurídico, regulatorio, financiero ni profesional, ni garantiza el cumplimiento de ninguna norma. Las referencias a regulación general (como el Reglamento Europeo de IA, el RGPD, DORA o NIS2), a normas técnicas y a regulación específica de cada sector o jurisdicción pueden ser incompletas, no aplicar a un caso concreto o quedar desactualizadas por cambios normativos, interpretaciones o criterios de las autoridades posteriores a su fecha de consulta. **Cada organización que use SEVEN-G es la única responsable de identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio**, con el asesoramiento cualificado que corresponda. El autor y SEACHAD no asumen responsabilidad alguna por el uso que se haga de este contenido ni por las decisiones que se adopten con él. Los datos, cifras, compañías y casos de los ejemplos son ficticios o ilustrativos.

> **Por qué importa.** Una conclusión de auditoría vale lo que la evidencia que la sostiene. Los papeles de trabajo permiten que otro auditor, la revisión de calidad, el auditor de cuentas o un supervisor reconstruyan qué se probó, sobre qué muestra, con qué resultado y por qué se concluyó así. Sin ellos, un hallazgo se puede discutir como opinión y una conclusión Conforme no demuestra nada. El tamaño de muestra justificado evita concluir sobre tres casos elegidos a conveniencia.

## 1. Instrucciones de uso

| Aspecto | Indicación |
|---|---|
| **Cuándo se usa** | En toda auditoría del plan anual (P58) y en las no planificadas: de *gate*, de continuidad, del marco, temática, de proveedor y del valor. Se abre en la planificación y se cierra con la última nota de seguimiento. |
| **Quién la rellena** | El auditor principal y los auditores del equipo; los expertos técnicos documentan sus pruebas bajo la dirección del auditor principal (38 §3.1). |
| **Quién la verifica** | El responsable de auditoría de IA o un auditor distinto revisa los papeles antes del informe (revisión de calidad, 38 §12.2). |
| **Quién decide o aprueba** | El auditor principal responde de la conclusión. El informe lo emite con P60. |
| **Etapa, *gate* o momento** | Según el plan anual. En las auditorías de *gate* las etapas se comprimen para respetar el plazo de decisión (38 §6.1): la verificación Enterprise debería concluir en un máximo de 7 días hábiles desde que las evidencias están completas. |
| **Herramienta** | No tiene herramienta propia. Las pruebas se apoyan en T01, T02, T03, T08, T10 y T12. Las fórmulas de la sección 7 permiten calcular los tamaños de muestra en una hoja de cálculo. |
| **Documento de referencia** | Documento 38 §6 (proceso y programas), §7 (técnicas y muestreo) y §10 (seguimiento); documento 21 §10.3–10.4. |
| **Lite frente a Enterprise** | En una auditoría de *gate* Lite por muestra pueden omitirse las secciones 4 y 8 (actas de apertura y cierre), sustituidas por una comunicación escrita. El resto es obligatorio. |

Reglas de cumplimentación:

- La **declaración de independencia** del auditor principal y de cada experto se firma **antes** de empezar, con la plantilla P41, y se cita en la sección 2. Sin ella no se inicia el trabajo.
- Cada prueba tiene su propio papel de trabajo (sección 6), con referencia correlativa dentro de la auditoría: AUD-AAAA-NNN/PT-01, PT-02…
- Siempre que sea posible se analiza la **población completa**. Si se muestrea, el tamaño se justifica con la sección 7 y se documenta el método de selección y la semilla.
- Las pruebas técnicas se hacen **sin alterar la producción** y con la versión exacta del sistema anotada (38 §7.3).
- El contraste de hallazgos con el responsable sirve para confirmar hechos, **no para negociar la clasificación**.

---

## 2. Identificación del encargo

| Campo | Contenido | Guía |
|---|---|---|
| Código de la auditoría | | AUD-AAAA-NNN (P58). |
| Tipo | | *Gate* · Continuidad · Marco · Temática · Proveedor · Valor · Seguimiento · Reauditoría. |
| Objeto | | SIA-AAAA-NNN, IA-AAAA-NNN, proveedor, proceso o tema. |
| Periodo auditado | | DD-MM-AAAA a DD-MM-AAAA. |
| Auditor principal | | |
| Equipo y expertos | | Nombre, especialidad y alcance de su trabajo. |
| Declaraciones de independencia (P41) | | Referencia y fecha de cada una; todas anteriores al inicio. |
| Responsable del objeto auditado | | Interlocutor de la auditoría. |
| Auditorías previas del mismo objeto | | Códigos y hallazgos abiertos. |

---

## 3. Memorando de planificación

| Campo | Contenido | Guía |
|---|---|---|
| Objetivo | | Qué conclusión debe permitir la auditoría. |
| Alcance | | Sistemas, versiones, procesos, periodos y ubicaciones incluidos. |
| Fuera de alcance | | Lo que no se audita y por qué. |
| Criterios | | Códigos G*n*.*nn* o R6.*nn* del documento 21, listas LV del documento 22, documentos y normas aplicables. |
| Información revisada para planificar | | Ficha de inventario (P05), registro de riesgos (P12), incidentes (P27, T08), auditorías previas, R6. |
| Riesgos clave identificados | | Qué podría ir mal en el objeto auditado y dónde se concentra la prueba. |
| Pruebas planificadas | | Referencias PT de la sección 5. |
| Uso del trabajo de terceros | | Informes independientes o de otras funciones de aseguramiento en los que se apoya el auditor, con la evaluación de su independencia, competencia, alcance y fecha (38 §7.3 y §12.2). |
| Accesos y datos necesarios | | Con minimización de datos personales. |
| Calendario | | Apertura, trabajo de campo, cierre, borrador, respuesta de la dirección e informe final (plazos orientativos de 38 §6.1). |
| Solicitud de información | | Lista de documentos y registros pedidos, con fecha de entrega. |

---

## 4. Acta de la reunión de apertura

| Campo | Contenido | Guía |
|---|---|---|
| Fecha y asistentes | | Auditoría y responsables del objeto auditado. |
| Alcance y criterios presentados | | |
| Calendario acordado | | |
| Accesos concedidos y pendientes | | Sistemas, entornos de prueba, registros. |
| Interlocutores por área | | |
| Restricciones comunicadas por el auditado | | Si limitan el trabajo, se anotan también como limitación en P60. |

---

## 5. Programa de pruebas

Se marcan las pruebas que aplican al tipo de auditoría y se asigna a cada una su papel de trabajo. En las auditorías temáticas, de proveedor y del valor, el programa se construye con las preguntas del tema (38 §4.1), el documento 36 o las pruebas de 43 §12.3.

### 5.1 Auditoría de *gate* (38 §6.2)

| # | Prueba | Aplica (Sí · No) | Referencia PT | Estado |
|---|---|---|---|---|
| 1 | Completitud de las evidencias obligatorias frente a LV-G*n* | | | Cumple · No cumple · No aplica · Pendiente |
| 2 | Trazabilidad: autor, fecha, versión y verificación | | | |
| 3 | Anterioridad de las evidencias a la solicitud | | | |
| 4 | Resultados tangibles reejecutados o recalculados | | | |
| 5 | Criterios G*n*.*nn* aplicables en Cumple con evidencia válida | | | |
| 6 | Criterios por nivel de ambición (01 §7.6) | | | |
| 7 | Separación de funciones (P03, T03) | | | |
| 8 | Condiciones previas cumplidas o regla de condición vencida aplicada | | | |
| 9 | Clasificación, intensidad y aceptación del riesgo residual | | | |
| 10 | Controles críticos diseñados o probados (G4 y G5) | | | |
| 11 | Firma multinivel sin veto pendiente (G5 Enterprise, P23) | | | |

### 5.2 Auditoría de continuidad (38 §6.3)

| # | Área | Aplica (Sí · No) | Referencia PT | Estado |
|---|---|---|---|---|
| 1 | Inventario | | | |
| 2 | Clasificación | | | |
| 3 | Monitorización | | | |
| 4 | Rendimiento y degradación | | | |
| 5 | Supervisión humana | | | |
| 6 | Incidentes y cambios | | | |
| 7 | Agentes | | | |
| 8 | Valor | | | |
| 9 | Coste | | | |
| 10 | Cumplimiento | | | |
| 11 | Revisiones R6 | | | |

---

## 6. Papel de trabajo por prueba

Se copia este bloque para cada prueba.

| Campo | Contenido | Guía |
|---|---|---|
| Referencia | | AUD-AAAA-NNN/PT-NN. |
| Prueba y área | | Número del programa de la sección 5. |
| Objetivo | | Qué se quiere comprobar. |
| Criterio | | Requisito con referencia exacta (código del documento 21, regla EV, apartado de un documento, plantilla). |
| Población | | Qué elementos forman la población, cuántos son y de qué fuente salen. |
| Técnica | | Revisión de evidencias · Indagación · Observación · Inspección de configuraciones · Reejecución · Análisis de datos · Confirmación externa · Análisis forense de versiones (38 §7.1). |
| Muestra | | Tamaño, cálculo (sección 7), método de selección y semilla; o «población completa». |
| Procedimiento | | Pasos seguidos, de forma que otro auditor pueda repetirlos. |
| Resultado | | Elementos probados, desviaciones encontradas y su naturaleza. |
| Evidencia | | Documentos, extractos, capturas o registros obtenidos, con ubicación en el expediente. |
| Conclusión | | Sin desviaciones · Hallazgo H-NN (clase provisional). |
| Elaborado por y fecha | | |
| Revisado por y fecha | | Revisión de calidad. |

Detalle de la muestra:

| Elemento | Identificador | Atributo comprobado | Resultado (Cumple · No cumple) | Evidencia | Comentario |
|---|---|---|---|---|---|
| 1 | | | | | |
| 2 | | | | | |

*(ejemplo ilustrativo)* PT-05 de una auditoría de continuidad: **objetivo**, comprobar que la supervisión humana definida en P17 se ejerce sobre las respuestas que el asistente marca como dudosas; **población**, 1.240 respuestas marcadas en el periodo según el registro del sistema; **muestra**, 29 (confianza del 95 %, tasa tolerable del 10 %), selección aleatoria con semilla 4817; **resultado**, 28 con revisión registrada y 1 sin revisión por una caída del turno de noche; **conclusión**, hallazgo H-02, no conformidad menor provisional, pendiente de valorar si la desviación es sistemática.

---

## 7. Cálculo del tamaño de muestra

### 7.1 Muestreo de atributos para controles

Con cero desviaciones esperadas, confianza *C* y tasa tolerable *T* (38 §7.2): *n = ln(1 − C) ÷ ln(1 − T)*, redondeado al alza. Con población reducida *N*: *n' = n ÷ (1 + (n − 1) ÷ N)*, redondeado al alza; si *N* es igual o menor que la muestra, se revisa la población completa.

En una hoja de cálculo:

- Tamaño: `=REDONDEAR.MAS(LN(1-C)/LN(1-T);0)`
- Corrección por población: `=SI(N<=n;N;REDONDEAR.MAS(n/(1+(n-1)/N);0))`

| Confianza | Tasa tolerable | Tamaño | Uso orientativo |
|---|---|---|---|
| 90 % | 20 % | 11 | *Gates* Lite de bajo riesgo; controles de riesgo bajo |
| 95 % | 20 % | 14 | Controles de riesgo moderado con población reducida |
| 90 % | 10 % | 22 | Fichas de inventario de uso corporativo |
| 95 % | 10 % | 29 | Controles relevantes |
| 95 % | 5 % | 59 | Controles críticos |
| 99 % | 5 % | 90 | Controles críticos con alta exposición o antecedentes de incidentes |

### 7.2 Controles periódicos

Referencia práctica, no estadística: 1 de 1 anual · 2 de 4 trimestrales · 2 a 5 de 12 mensuales · 5 a 15 semanales · 20 a 40 diarios o múltiples al día. El auditor puede aumentar estos tamaños según el riesgo.

### 7.3 Estimación de proporciones en resultados de modelos

Con confianza del 95 % y proporción más desfavorable (50 %): *n = 1,96² × 0,5 × 0,5 ÷ e²*. En una hoja de cálculo: `=REDONDEAR.MAS(1,96^2*0,25/e^2;0)` (± 10 puntos: 97 · ± 5: 385 · ± 3: 1.068). En pruebas de sesgo se calcula el tamaño **por grupo**.

### 7.4 Registro del cálculo por prueba

| Referencia PT | Tipo de muestreo | Población *N* | Confianza | Tasa tolerable o margen | Tamaño calculado | Tamaño tras corrección | Método de selección y semilla |
|---|---|---|---|---|---|---|---|
| | Atributos · Periódico · Proporción · Dirigida · Población completa | | | | | | |
| *(ejemplo ilustrativo)* PT-05 | Atributos | 1.240 | 95 % | 10 % | 29 | 29 | Aleatoria · semilla 4817 |

Si aparece una desviación en una muestra diseñada con cero desviaciones esperadas, no se concluye que el control funciona al nivel planificado: se evalúa su causa y, si se amplía la muestra, se replanifica con una tasa esperada distinta de cero y se documenta. La selección dirigida detecta problemas, pero no permite extrapolar.

---

## 8. Contraste de hallazgos y acta de la reunión de cierre

| Hallazgo | Comunicado a | Fecha | Hechos confirmados (Sí · No) | Comentarios del responsable | Posición del auditor |
|---|---|---|---|---|---|
| H-01 | | | | | |

| Campo | Contenido | Guía |
|---|---|---|
| Fecha y asistentes | | |
| Hallazgos presentados y clasificación | | Observación · No conformidad menor · mayor · crítica (38 §8.1). |
| Resultado provisional | | Conforme · Conforme con observaciones · No conforme. |
| Discrepancias de la dirección | | Se recogen en la respuesta de la dirección de P60. |
| No conformidades críticas comunicadas por escalado | | Toda no conformidad crítica se comunica en cuanto se confirma, antes del informe (30, E-5). |
| Plazos acordados | | Borrador, respuesta de la dirección e informe final. |

---

## 9. Nota de seguimiento de recomendaciones

Una nota por verificación (38 §10).

| Campo | Contenido | Guía |
|---|---|---|
| Auditoría de origen y hallazgo | | AUD-AAAA-NNN · H-NN · NC-AAAA-NNN (T08). |
| Clase | | Observación · No conformidad menor · mayor · crítica. |
| Acción comprometida, responsable y plazo | | De la respuesta de la dirección en P60. |
| Verificación realizada | | Documental (menor) · De eficacia durante un periodo razonable (mayor y crítica) · Prueba técnica cuando proceda. |
| Evidencia obtenida | | |
| Resultado | | Corregido · Corregido sin eficacia demostrada · No corregido · Riesgo aceptado. |
| Si riesgo aceptado | | Órgano que acepta con nivel suficiente (30 §7.2), fecha y acta. No cabe si el incumplimiento es legal. |
| Si vencida | | Escalado según 30 §8.2; una no conformidad mayor no corregida en plazo se reclasifica como crítica si el riesgo que controla es Alto o Crítico. |
| Estado en T08 | | Abierta · Cerrada. |
| Verificado por y fecha | | |

Cerrar no es implantar: una acción implantada sin evidencia de eficacia no cierra una no conformidad mayor o crítica.

---

## 10. Criterios de calidad

| # | Comprobación | Estado |
|---|---|---|
| 1 | Las declaraciones de independencia (P41) son anteriores al inicio y cubren a todo el equipo y a los expertos. | Cumple · No cumple · No aplica · Pendiente |
| 2 | El memorando fija objetivo, alcance, criterios y riesgos clave antes del trabajo de campo. | |
| 3 | Cada prueba tiene papel de trabajo con objetivo, criterio, población, muestra, procedimiento, resultado, evidencia y conclusión. | |
| 4 | Los tamaños de muestra están justificados y el método de selección es reproducible. | |
| 5 | Las pruebas de anterioridad comparan fechas de evidencias con los eventos de T01 (38 §6.2, prueba 3). | |
| 6 | Las pruebas técnicas documentan la versión del sistema y no alteraron la producción. | |
| 7 | Cada hallazgo se contrastó con el responsable y remite a su papel de trabajo. | |
| 8 | Las notas de seguimiento verifican la eficacia en las no conformidades mayores y críticas. | |

---

## 11. Aprobación y verificación

| Función | Rol en SEVEN-G | Nombre y cargo | Fecha | Firma o referencia |
|---|---|---|---|---|
| Elabora | Auditor de IA (auditor principal) y equipo | | | |
| Aporta pruebas especializadas | Experto técnico de apoyo | | | |
| Revisa la calidad | Responsable de auditoría de IA u otro auditor | | | |
| Recibe el acta de cierre | Responsable del objeto auditado | | | |

Separación de funciones: quien ha tenido rol en el diseño, la construcción u operación del objeto, o ha asesorado sobre sus controles en los doce meses anteriores, no elabora ni revisa estos papeles (30, I-10 e I-11).

---

## 12. Control de versiones

**Documento cumplimentado**

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| | | | |

**Plantilla**

| Versión | Fecha | Cambios |
|---|---|---|
| 0.1 | 19-09-2026 | Primera versión. Aplica el programa de trabajo tipo, los programas de *gate* y de continuidad, las técnicas, las fórmulas de muestreo y el seguimiento de 38 §6, §7 y §10; propone la referencia de papel de trabajo AUD-AAAA-NNN/PT-NN. |
