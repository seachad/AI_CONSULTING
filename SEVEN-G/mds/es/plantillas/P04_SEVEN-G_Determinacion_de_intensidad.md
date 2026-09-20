# Determinación de intensidad

**Decide, con ocho preguntas de sí o no, si la iniciativa se gobierna con intensidad Lite o Enterprise y deja registrada la justificación.**

| | |
|---|---|
| Documento | Plantilla P04 · Determinación de intensidad |
| Versión | 0.1 (borrador de trabajo) |
| Fecha | 16-09-2026 |
| Autor | Fernando García Varela |
| Estado | Borrador para revisión. |

---

> **Aviso legal y exención de responsabilidad.** SEVEN-G es un marco metodológico de referencia que se ofrece «tal cual» y con fines exclusivamente informativos. No constituye asesoramiento jurídico, regulatorio, financiero ni profesional, ni garantiza el cumplimiento de ninguna norma. Las referencias a regulación general (como el Reglamento Europeo de IA, el RGPD, DORA o NIS2), a normas técnicas y a regulación específica de cada sector o jurisdicción pueden ser incompletas, no aplicar a un caso concreto o quedar desactualizadas por cambios normativos, interpretaciones o criterios de las autoridades posteriores a su fecha de consulta. **Cada organización que use SEVEN-G es la única responsable de identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio**, con el asesoramiento cualificado que corresponda. El autor no asume responsabilidad alguna por el uso que se haga de este contenido ni por las decisiones que se adopten con él. Los datos, cifras, compañías y casos de los ejemplos son ficticios o ilustrativos.

## 1. Instrucciones de uso

| Aspecto | Indicación |
|---|---|
| **Cuándo se usa** | En la fase 0, antes de G0. Se repite obligatoriamente en G3 y en cada revisión de continuidad (R6), y siempre que cambie un hecho que afecte a un criterio (01 §9.1). |
| **Quién la rellena** | El responsable de producto de IA, con el responsable de riesgos de IA. |
| **Quién la verifica** | Lite: oficina de IA. Enterprise: auditor de IA. Si el resultado es Lite, la verificación debería comprobar especialmente las respuestas "No". |
| **Quién decide** | El resultado es automático: no requiere decisión. El órgano del *gate* se limita a comprobar que las respuestas están justificadas. |
| **Gate en que se revisa** | G0 · Autorización, G3 · Viabilidad y R6 · Revisión de continuidad. |
| **Herramienta** | T04 · Determinación de intensidad (módulo de T01). |
| **Lite frente a Enterprise** | Esta plantilla es igual en ambas intensidades, porque es la que determina cuál aplica. No tiene campos **(Enterprise)**: el bloque 7 (cambio de intensidad) se rellena en ambas cuando cambia el resultado. |

Reglas de cumplimentación:

- **Basta un criterio Enterprise para aplicar esa intensidad** (01 §9.1).
- Toda respuesta, sea "Sí" o "No", se justifica con hechos y, cuando exista, con evidencia enlazada.
- En esta plantilla, una respuesta "Pendiente" cuenta como "Sí" hasta que se resuelva, con responsable y fecha. Así se evita avanzar con menos control por falta de información. Es una regla de prudencia propuesta por la plantilla que el documento 21 debería confirmar.
- La intensidad no puede rebajarse para acelerar un *gate*. Una iniciativa sin ningún criterio puede aplicar voluntariamente Enterprise.

---

## 2. Identificación

| Campo | Contenido | Guía |
|---|---|---|
| Código de la iniciativa | | IA-AAAA-NNN. |
| Nombre de la iniciativa | | |
| Momento de la determinación | | Fase 0 · G3 · R6 · Cambio relevante. |
| Intensidad determinada anteriormente | | Lite · Enterprise · Ninguna (primera determinación). |
| Versión del documento | | |
| Fecha | | DD-MM-AAAA. |
| Autor | | Nombre y rol. |

---

## 3. Fuentes consultadas

| Fuente | Referencia | Guía |
|---|---|---|
| Carta de la iniciativa | P01 | Alcance y exposición. |
| Declaración de contexto y restricciones | P02 | Datos, autonomía máxima, función crítica. |
| Ficha de inventario | P05 | Tecnología, exposición, autonomía, rol regulatorio. |
| Clasificación de ambición | P07 | Criterio 7. |
| Clasificación regulatoria | P11 | Criterio 1 (a partir de la fase 3). |
| Umbral de inversión aprobado en C2 | Documento 13 | Criterio 8. |

---

## 4. Criterios Enterprise

Responda a las ocho preguntas. Referencia: 01 §9.2.

| # | Criterio | Pregunta | Respuesta | Justificación | Evidencia |
|---|---|---|---|---|---|
| 1 | Alto riesgo regulatorio | ¿El sistema está clasificado, o hay indicios razonables de que será clasificado, como de alto riesgo según la regulación aplicable? | Sí · No · Pendiente | | P11 o análisis preliminar |
| 2 | Decisiones sobre personas | ¿El resultado influye de forma significativa en decisiones que afectan a personas, como empleo, crédito, seguros o acceso a servicios? | Sí · No · Pendiente | | |
| 3 | Exposición directa | ¿Clientes, pacientes, ciudadanos u otras personas externas interactúan directamente con el sistema? | Sí · No · Pendiente | | Exposición en P05 |
| 4 | Agentes con capacidad de actuar | ¿El sistema ejecuta acciones, como escribir en sistemas, enviar comunicaciones o realizar pagos, sin que una persona valide cada acción antes de ejecutarla (A2 o A3), y esas acciones tienen efecto sobre terceros, dinero, datos personales o sistemas de producción? | Sí · No · Pendiente | | Nivel de autonomía en P05 |
| 5 | Datos especialmente protegidos | ¿Trata categorías especiales de datos personales o información confidencial crítica? | Sí · No · Pendiente | | P02 §6 |
| 6 | Función crítica | ¿Soporta una función crítica o importante del negocio, o sujeta a regulación sectorial de resiliencia operativa? | Sí · No · Pendiente | | |
| 7 | Nivel Transformar | ¿La iniciativa está clasificada como Transformar? | Sí · No | | P07 |
| 8 | Inversión | ¿La inversión prevista supera el umbral aprobado por el consejo en C2? | Sí · No · Pendiente | Indicar umbral e inversión estimada. | P01 §7 |

Guía para las preguntas que más dudas generan:

| # | Guía |
|---|---|
| 1 | Mientras P11 no esté hecho, se responde con el análisis preliminar. Si el sistema cae en un ámbito de alto riesgo (por ejemplo, empleo, acceso a servicios esenciales, infraestructuras críticas, educación o biometría) y no se ha descartado de forma documentada, la respuesta es "Pendiente". |
| 2 | "Significativa" incluye los casos en que la persona que decide suele seguir el resultado del sistema, aunque formalmente tenga la última palabra. |
| 3 | Equivale a la exposición "Clientes o personas externas de forma directa" de la taxonomía (03 §3.3). La exposición indirecta no activa el criterio, aunque debe valorarse en el criterio 2. |
| 4 | Se responde "Sí" cuando el nivel de autonomía es A2 (Actuación supervisada) o A3 (Actuación autónoma) y las acciones tienen efecto sobre terceros, dinero, datos personales o sistemas de producción (01 §9.2; niveles de autonomía en el documento 35). Con A0 o A1, o con A2 o A3 sin ese efecto, se responde "No" y se justifica. |
| 5 | Categorías especiales son, entre otras, datos de salud, biométricos para identificar, origen étnico, opiniones políticas, convicciones religiosas, afiliación sindical, vida u orientación sexual. Los datos sobre condenas e infracciones penales deberían tratarse con el mismo criterio. |
| 6 | Para entidades sujetas a DORA, se consideran las funciones críticas o importantes que la entidad haya identificado. |
| 8 | Se considera la inversión total prevista de la iniciativa, no solo el presupuesto autorizado en G0. |

---

## 5. Resultado

**Regla de cálculo:** si al menos una respuesta es "Sí" o "Pendiente", la intensidad es **Enterprise**. Si todas son "No", la intensidad es **Lite**.

En una hoja de cálculo: `=SI(CONTAR.SI(rango_respuestas;"No")=8;"Lite";"Enterprise")`.

| Campo | Contenido | Guía |
|---|---|---|
| Número de criterios en "Sí" | | Recuento automático. |
| Número de criterios en "Pendiente" | | Recuento automático. |
| **Intensidad resultante** | | Lite · Enterprise. |
| Criterios que la determinan | | Números de los criterios en "Sí" o "Pendiente". |
| Aplicación voluntaria de Enterprise | | Sí · No. Solo si el resultado es Lite y la compañía decide aplicar Enterprise. |
| Pendientes por resolver | | Criterio, responsable y fecha. |

*(ejemplo ilustrativo)* Asistente de respuesta a consultas de clientes sobre pedidos: criterio 3 "Sí" (los clientes conversan con el asistente); resto "No". Intensidad resultante: **Enterprise**.

---

## 6. Consecuencias de la intensidad

Referencia: 01 §9.3 y, para verificación y decisión, 01 §7.5.

| Aspecto | Lite | Enterprise |
|---|---|---|
| Puertas | G0–G2 y G4–G5 pueden agruparse | Todas por separado |
| Evidencias | Plantillas simplificadas | Plantillas completas |
| Verificación | Oficina de IA; auditor de IA por muestreo | Auditor de IA en todos los *gates* |
| Decisión | Patrocinador, con conformidad de riesgos en G3, G4 y G5 | Comité de IA; consejo en Transformar |
| Puesta en producción | Conformidad de riesgos | Firma multinivel con veto |
| Revisión de continuidad | Semestral | Trimestral |
| Visibilidad | Panel del consejo agregado | Panel del consejo por iniciativa |

---

## 7. Cambio de intensidad

Rellenar solo si el resultado difiere de la determinación anterior. Es obligatorio en las dos intensidades: el paso de Lite a Enterprise se registra precisamente cuando la iniciativa aún es Lite.

| Fecha | De | A | Criterio que cambia | Evidencias que deben completarse | *Gates* afectados | Registrado por |
|---|---|---|---|---|---|---|
| | Lite · Enterprise | Lite · Enterprise | | | | |
| *(ejemplo ilustrativo)* 15-01-2027 | Lite | Enterprise | 4: se añade la actuación automática sobre pedidos | P17 y P18 completas; firma multinivel en G5 | G4 y G5 por separado | Oficina de IA |

Un paso de Lite a Enterprise obliga a completar con plantillas completas las evidencias de los *gates* pendientes. Un paso de Enterprise a Lite solo es posible si desaparecen todos los criterios y debe registrarse como evento de cambio de clasificación (03 §3.3).

---

## 8. Criterios de calidad

Los criterios formales están en el documento 21 (ver criterios G0.xx, G3.xx y R6.xx).

| # | Comprobación | Estado |
|---|---|---|
| 1 | Las ocho preguntas tienen respuesta. | Cumple · No cumple · No aplica · Pendiente |
| 2 | Cada respuesta tiene justificación basada en hechos. | |
| 3 | Las respuestas son coherentes con P01, P02, P05, P07 y, desde la fase 3, con P11. | |
| 4 | El resultado aplica la regla "basta uno". | |
| 5 | Los criterios pendientes tienen responsable y fecha. | |
| 6 | Si hay cambio de intensidad, están identificadas las evidencias y *gates* afectados. | |

---

## 9. Aprobación y verificación

| Función | Rol en SEVEN-G | Nombre y cargo | Fecha | Firma o referencia |
|---|---|---|---|---|
| Elabora | Responsable de producto de IA | | | |
| Consultado | Responsable de riesgos de IA | | | |
| Verifica | Oficina de IA (Lite) · Auditor de IA (Enterprise) | | | |
| Toma conocimiento | Órgano que decide el *gate* | | | |

Separación de funciones: quien verifica no ha respondido al cuestionario.

---

## 10. Control de versiones

**Documento cumplimentado**

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| | | | |

**Plantilla**

| Versión | Fecha | Cambios |
|---|---|---|
| 0.1 | 16-09-2026 | Primera versión. Convierte los ocho criterios Enterprise de 01 §9.2 en preguntas con resultado automático y registra los cambios de intensidad. Ajustes de coherencia con 01 (separación de funciones en Lite, resultados de R6, criterio de agentes) y con 34 y 37. |
| 0.1 | 19-09-2026 | El bloque 7 (cambio de intensidad) deja de ser *(Enterprise)*: se rellena también en Lite, que es cuando se registra el paso a Enterprise. |
