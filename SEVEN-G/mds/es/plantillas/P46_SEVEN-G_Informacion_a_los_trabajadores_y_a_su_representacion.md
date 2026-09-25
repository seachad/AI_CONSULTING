# Información a los trabajadores y a su representación

**Prepara la ficha informativa de un sistema de IA que afecta al trabajo, deja constancia de cada información y consulta a la representación de los trabajadores y mantiene el registro interno de sistemas que afectan a los empleados.**

| | |
|---|---|
| Documento | Plantilla P46 · Información a los trabajadores y a su representación |
| Versión | 0.1 (borrador de trabajo) |
| Fecha | 19-09-2026 |
| Autor | Fernando García Varela |
| Estado | Borrador para revisión. |

---

> **Aviso legal y exención de responsabilidad.** SEVEN-G es un marco metodológico de referencia que se ofrece «tal cual» y con fines exclusivamente informativos. No constituye asesoramiento jurídico, regulatorio, financiero ni profesional, ni garantiza el cumplimiento de ninguna norma. Las referencias a regulación general (como el Reglamento Europeo de IA, el RGPD, DORA o NIS2), a normas técnicas y a regulación específica de cada sector o jurisdicción pueden ser incompletas, no aplicar a un caso concreto o quedar desactualizadas por cambios normativos, interpretaciones o criterios de las autoridades posteriores a su fecha de consulta. **Cada organización que use SEVEN-G es la única responsable de identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio**, con el asesoramiento cualificado que corresponda. Esta metodología es una ayuda genérica y gratuita, compartida con la comunidad para que nadie tenga que empezar desde cero; cada persona u organización puede y debe adaptarla a su propio uso. No debe entenderse que sus partes jurídicamente sensibles hayan sido revisadas por una asesoría jurídica: esas revisiones, para cada empresa o sector, son responsabilidad última de la empresa, el consultor o la organización que la use. Aunque se procura mantenerla al día, alguna norma puede haber cambiado sin que se recoja aquí. En la máxima medida permitida por la ley, el autor no asume responsabilidad alguna por los efectos de su aplicación en ninguna organización ni por su aplicabilidad completa. La metodología no otorga certificación de ningún tipo. El autor no asume responsabilidad alguna por el uso que se haga de este contenido ni por las decisiones que se adopten con él. Los datos, cifras, compañías y casos de los ejemplos son ficticios o ilustrativos.

> **Por qué importa.** Cuando un sistema de IA interviene en decisiones sobre condiciones de trabajo o empleo, informar antes de usarlo es cumplimiento legal, no comunicación interna: en los sistemas que lo requieren, G5 no puede resolverse con *Continuar* sin evidencia de que la información se ha realizado, y la falta no admite *Continuar con condiciones* (50 §7.2). Esta plantilla da a la compañía una ficha comprensible y un registro con fecha, contenido y respuesta que acredita qué se informó, a quién y cuándo. Sin ella, el riesgo RT-ORG-07 (incumplimiento de información y consulta) solo se descubre cuando la representación lo reclama.

## 1. Instrucciones de uso

| Aspecto | Indicación |
|---|---|
| **Cuándo se usa** | Por sistema: en la fase 3 se determina si hay obligación (sección 3); en la fase 4 se prepara la ficha (sección 4); la información o consulta se realiza antes del piloto con personas reales y, en todo caso, antes del uso en producción (sección 5); se actualiza con cada cambio relevante y se revisa en R6 (50 §7.2 y §13). Por compañía: el registro interno de la sección 6 se mantiene de forma continua. |
| **Quién la rellena** | El responsable de producto de IA con la función de personas o, si existe, el responsable de relaciones laborales para IA (50 §4.2). La determinación de la sección 3 la hacen relaciones laborales y la asesoría jurídica. |
| **Quién la verifica** | Oficina de IA en Lite; auditor de IA en Enterprise. |
| **Quién decide o aprueba** | El patrocinador de IA y el responsable de personas aprueban la ficha y el momento de entrega (34 §3.9). El órgano del *gate* comprueba la evidencia en G5. |
| **Etapa, *gate* o momento** | G3 (obligación analizada, criterio G3.16), G5 (información realizada cuando es obligatoria) y R6 (información actualizada). El registro interno se revisa en C4. |
| **Herramienta** | T20 · Plan de adopción y capacidad (34 §3.9). El registro interno se deriva del inventario T02, campo *Información a trabajadores y a su representación* (32 §3.5). |
| **Documento de referencia** | 50 §7 y §8; 23 §9.3, §11.1 y §13.2; 32 §3.5; 34 §3.9; P11; P17; P20. |
| **Lite frente a Enterprise** | **Igual en ambas intensidades cuando es obligatoria** (23 §13.2): ningún campo de esta plantilla puede omitirse en Lite si la sección 3 concluye que hay obligación. |

Reglas de cumplimentación:

- **Comprensible para no especialistas** (regla 10 de medición): la ficha explica parámetros y reglas sin revelar código fuente (50 §7.3).
- **Primero los afectados:** los colectivos afectados y su representación conocen los cambios antes que el resto de la organización y que el exterior (50 §10.1).
- **Jurisdicción.** Las referencias de la sección 3 son las de España y la Unión Europea que recogen 50 §7.1 y 34 §3.9; en otros países se sustituyen por las que identifique la declaración de contexto (P02).
- Esta plantilla no constituye asesoramiento jurídico. La obligación, su contenido y su plazo los determina la asesoría jurídica y laboral.

---

## 2. Identificación

| Campo | Contenido | Guía |
|---|---|---|
| Código de la iniciativa | | IA-AAAA-NNN. |
| Sistema de IA | | SIA-AAAA-NNN (P05). |
| Nombre del sistema | | Nombre funcional. |
| Intensidad y clasificación regulatoria | | P04 y P11. |
| Colectivos afectados y número de personas | | Del análisis de efecto de P20. |
| Centros y países | | |
| Órganos de representación existentes | | Comité de empresa · delegados de personal · delegados sindicales · ninguno. |
| Responsable de la ficha | | |
| Versión y fecha | | DD-MM-AAAA. |

---

## 3. Determinación de la obligación

### 3.1 Preguntas de identificación (50 §7.2, paso 1)

| # | Pregunta | Respuesta (Sí · No · Sin dato) | Fuente |
|---|---|---|---|
| 1 | ¿El sistema interviene en decisiones que pueden incidir en las condiciones de trabajo? | | P20 |
| 2 | ¿Interviene en el acceso al empleo o en su mantenimiento? | | P20; P11 |
| 3 | ¿Elabora perfiles de trabajadores o candidatos? | | P11 |
| 4 | ¿Es un sistema de alto riesgo del anexo III, punto 4 (empleo y gestión de trabajadores), usado en el lugar de trabajo? | | P11 |
| 5 | ¿Cambia la organización del trabajo aunque no sea un algoritmo de decisión? | | P20 |

### 3.2 Referencias aplicables (50 §7.1; 34 §3.9)

| Referencia | Qué exige | ¿Aplica? |
|---|---|---|
| Reglamento de IA, art. 26.7 | Los responsables del despliegue que sean empleadores informan a los representantes de los trabajadores y a los trabajadores afectados antes de poner en servicio o utilizar un sistema de IA de alto riesgo en el lugar de trabajo. | |
| Estatuto de los Trabajadores, art. 64.4.d) | Derecho del comité de empresa a ser informado de los parámetros, reglas e instrucciones de los algoritmos o sistemas de IA que afectan a decisiones que pueden incidir en las condiciones de trabajo, el acceso y mantenimiento del empleo, incluida la elaboración de perfiles. | |
| Estatuto de los Trabajadores, art. 64 (resto), y convenio colectivo aplicable | Información y consulta sobre cambios en la organización del trabajo; el convenio puede ampliar obligaciones. | |
| RGPD, arts. 13, 14, 15, 22 y 88 | Información a los interesados, derecho de acceso, decisiones individuales automatizadas y tratamiento en el ámbito laboral. | |
| LOPDGDD, arts. 87 a 91 | Derechos digitales en el ámbito laboral. | |
| Otras jurisdicciones (P02) | | |

### 3.3 Conclusión (50 §7.2, paso 2)

| Campo | Contenido | Guía |
|---|---|---|
| Conclusión | | Información obligatoria · Información y consulta obligatorias · Información recomendada · No aplica. |
| Destinatarios | | Representación de los trabajadores · trabajadores afectados · ambos. |
| Plazo | | Antes del piloto con personas reales · antes de producción · otro fijado por la asesoría. |
| Nota jurídica | | Referencia enlazada en P11. |
| Firmada por | | Relaciones laborales y asesoría jurídica, con fecha. |

---

## 4. Ficha informativa del sistema

Los ocho puntos de 50 §7.3. La versión resumida (puntos 1, 2, 5 y 7) alimenta el registro interno de la sección 6.

| # | Punto | Contenido | Guía |
|---|---|---|---|
| 1 | Identificación | | Sistema, finalidad, área, responsable y proveedor. |
| 2 | Decisiones afectadas | | Qué decisiones apoya o toma, sobre quién y con qué autonomía (A0 · A1 · A2 · A3); límites de 50 §8.2. |
| 3 | Datos | | Categorías, origen y periodo; exclusión o justificación de categorías especiales. |
| 4 | Parámetros y reglas | | Variables principales y su importancia relativa en términos comprensibles; reglas y umbrales; instrucciones dadas al sistema. |
| 5 | Intervención humana | | Quién revisa, con qué autoridad y cómo discrepar (P17). |
| 6 | Controles | | Pruebas de sesgo y resultado resumido; monitorización; revisión (P22, P25). |
| 7 | Derechos | | Cómo pedir información, explicación o revisión humana; canal de reclamación. |
| 8 | Cambios | | Versión, fecha y cambios respecto a la versión anterior. |

*(ejemplo ilustrativo, punto 2)* «El sistema propone la asignación semanal de turnos del centro logístico a partir de la previsión de volumen y de las preferencias registradas. Actúa con autonomía A1: la jefatura de turno valida o modifica cada propuesta antes de publicarla. No usa datos de salud ni de afiliación sindical.»

---

## 5. Registro de información y consultas

Una fila por entrega, reunión o respuesta. **Momento:** Antes del piloto · Antes de producción · Cambio relevante · R6 · A petición de la representación.

| Código | Fecha | Momento | Destinatario | Tipo | Versión de la ficha | Medio | Preguntas o posición de la representación | Respuesta de la compañía y fecha | Referencia (acta o acuse) |
|---|---|---|---|---|---|---|---|---|---|
| INF-AAAA-NNN | | | Comité de empresa · delegados · trabajadores afectados | Información · Consulta | | Reunión · escrito · intranet | | | |
| *(ejemplo ilustrativo)* INF-2026-004 | 14-10-2026 | Antes del piloto | Comité de empresa | Información | 1.0 | Reunión y entrega por escrito | Pregunta si los datos de productividad se usarán en la evaluación individual | Respuesta escrita el 21-10-2026: no se usan para evaluar a personas (50 §9.2) | Acta de la reunión del 14-10-2026 |
| | | | | | | | | | |

---

## 6. Registro interno de sistemas que afectan a los empleados

Registro de compañía, accesible a todos los empleados (50 §7.4). Se deriva de T02: sistemas con exposición a empleados o con decisiones sobre personas en el ámbito *Empleo y relaciones laborales* (32 §3.3).

| Código (T02) | Sistema | Para qué se usa | Colectivos | Decisiones y autonomía | Cómo pedir revisión humana | Versión de la ficha | Última información a la representación | Estado del sistema |
|---|---|---|---|---|---|---|---|---|
| SIA-AAAA-NNN | | | | | | | INF-AAAA-NNN, fecha | Piloto · En producción · Suspendido · Retirado |
| *(ejemplo ilustrativo)* SIA-2026-030 | Asignación de turnos | Propone los turnos semanales del centro logístico | Personal de almacén | Asignación de turnos · A1 | Jefatura de turno o canal de reclamación de personas | 1.0 | INF-2026-004, 14-10-2026 | Piloto |

---

## 7. Indicador

| Indicador | Fórmula | Referencia orientativa | Resultado | Periodicidad |
|---|---|---|---|---|
| PER-08 · IND-ADO-12 · Información previa a la representación | Sistemas con efecto en condiciones de trabajo o empleo informados antes de su uso ÷ sistemas con ese efecto | 100 % | | Trimestral |

---

## 8. Criterios de calidad

| # | Comprobación | Estado |
|---|---|---|
| 1 | La obligación se ha analizado en la fase 3 con criterio jurídico (criterio G3.16 del documento 21). | Cumple · No cumple · No aplica · Pendiente |
| 2 | La ficha cubre los ocho puntos de 50 §7.3 y es comprensible para no especialistas. | |
| 3 | Si la información es obligatoria, consta realizada antes del piloto con personas reales y, en todo caso, antes de G5 (23 §11.1; 50 §7.2). | |
| 4 | Cada entrega tiene fecha, destinatario, versión de la ficha y referencia de acta o acuse, y las preguntas tienen respuesta registrada. | |
| 5 | Los cambios relevantes han dado lugar a una nueva versión de la ficha y a una nueva información (revisado en R6). | |
| 6 | El registro interno está accesible a los empleados y coincide con el inventario. | |
| 7 | La información y la consulta se registran cuando la normativa o los acuerdos lo exigen (pregunta D5.08 del documento 11). | |

---

## 9. Aprobación y verificación

| Función | Rol en SEVEN-G | Nombre y cargo | Fecha | Firma o referencia |
|---|---|---|---|---|
| Elabora la ficha y el registro | Responsable de producto de IA con la función de personas | | | |
| Determina la obligación | Relaciones laborales y asesoría jurídica | | | |
| Aprueba la ficha y el momento de entrega | Patrocinador de IA y responsable de personas | | | |
| Verifica | Oficina de IA (Lite) · Auditor de IA (Enterprise) | | | |
| Decide el *gate* | Órgano de 01 §7.5 (registrado en P29) | | | |

Separación de funciones: quien elabora la ficha no verifica que la información se ha realizado.

---

## 10. Control de versiones

**Documento cumplimentado**

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| | | | |

**Plantilla**

| Versión | Fecha | Cambios |
|---|---|---|
| 0.1 | 19-09-2026 | Primera versión. Determinación de la obligación con las referencias de 50 §7.1 y 34 §3.9, ficha informativa de ocho puntos (50 §7.3), registro de información y consultas, obligatorio en Lite y Enterprise (23 §13.2), y registro interno de sistemas que afectan a los empleados (50 §7.4). Propone el código INF-AAAA-NNN. |
