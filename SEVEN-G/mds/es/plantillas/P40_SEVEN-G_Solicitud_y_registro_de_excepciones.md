# Solicitud y registro de excepciones

**Tramita cada excepción temporal a la política o al marco con su justificación, riesgo, medidas compensatorias, órgano que aprueba, condiciones y caducidad, y mantiene el registro de excepciones de la compañía.**

| | |
|---|---|
| Documento | Plantilla P40 · Solicitud y registro de excepciones |
| Versión | 0.1 (borrador de trabajo) |
| Fecha | 19-09-2026 |
| Autor | Fernando García Varela |
| Estado | Borrador para revisión. |

---

> **Aviso legal y exención de responsabilidad.** SEVEN-G es un marco metodológico de referencia que se ofrece «tal cual» y con fines exclusivamente informativos. No constituye asesoramiento jurídico, regulatorio, financiero ni profesional, ni garantiza el cumplimiento de ninguna norma. Las referencias a regulación general (como el Reglamento Europeo de IA, el RGPD, DORA o NIS2), a normas técnicas y a regulación específica de cada sector o jurisdicción pueden ser incompletas, no aplicar a un caso concreto o quedar desactualizadas por cambios normativos, interpretaciones o criterios de las autoridades posteriores a su fecha de consulta. **Cada organización que use SEVEN-G es la única responsable de identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio**, con el asesoramiento cualificado que corresponda. Esta metodología es una ayuda genérica y gratuita, compartida con la comunidad para que nadie tenga que empezar desde cero; cada persona u organización puede y debe adaptarla a su propio uso. No debe entenderse que sus partes jurídicamente sensibles hayan sido revisadas por una asesoría jurídica: esas revisiones, para cada empresa o sector, son responsabilidad última de la empresa, el consultor o la organización que la use. Aunque se procura mantenerla al día, alguna norma puede haber cambiado sin que se recoja aquí. En la máxima medida permitida por la ley, el autor no asume responsabilidad alguna por los efectos de su aplicación en ninguna organización ni por su aplicabilidad completa. La metodología no otorga certificación de ningún tipo. El autor no asume responsabilidad alguna por el uso que se haga de este contenido ni por las decisiones que se adopten con él. Los datos, cifras, compañías y casos de los ejemplos son ficticios o ilustrativos.

> **Por qué importa.** Una excepción es una decisión consciente de no cumplir un requisito durante un tiempo, con el riesgo a la vista y un responsable. Sin solicitud ni registro, las excepciones se convierten en incumplimientos tolerados que nadie aprueba ni vigila, y la comisión delegada no puede recibir cada trimestre las vigentes, como exige 30 §7.4. Una excepción vencida sin cierre es no conformidad mayor (31 §3.8).

## 1. Instrucciones de uso

| Aspecto | Indicación |
|---|---|
| **Cuándo se usa** | Antes de dejar de cumplir cualquier requisito de la política corporativa, de la política de uso aceptable o del marco que admita excepción. Nunca a posteriori. |
| **Quién la rellena** | Quien propone según el tipo (sección 5): responsable de producto de IA, área solicitante, patrocinador de IA o comité de IA. La oficina de IA asigna el código y mantiene el registro. |
| **Quién la verifica** | La oficina de IA comprueba la admisibilidad y la completitud; la segunda línea valora el riesgo y emite conformidad cuando se exige. |
| **Quién decide o aprueba** | El órgano de la matriz de delegación de 30 §7.4, según el tipo. Quien propone no aprueba (30, I-9). |
| **Etapa, *gate* o momento** | En cualquier momento; se revisan las vigentes en cada sesión mensual del comité de IA y se informan trimestralmente a la comisión delegada (C4). |
| **Herramienta** | T01 · Registro de iniciativas (excepciones vinculadas a iniciativas y decisiones, 30 §13). |
| **Documento de referencia** | 30 §7.4 y §8.3; 31 §3.7, §3.8 y §4; 37 §3. |

Reglas de cumplimentación:

- Las excepciones **nunca** se admiten sobre prácticas prohibidas, obligaciones legales, separación de funciones en ningún *gate*, firma multinivel Enterprise ni existencia de un mecanismo de parada (30 §7.4), ni sobre las líneas rojas de la política corporativa (31 §3.7).
- Una excepción no sustituye a un «Continuar con condiciones» de un *gate*: si el asunto se decide en un *gate*, se trata en P29.
- Código propuesto: **EXC-AAAA-NNN**, con año de solicitud y número correlativo que no se reutiliza, también si la solicitud se deniega.
- La prórroga se tramita como una **nueva solicitud** enlazada a la anterior, aprobada por el mismo órgano (regla propuesta por esta plantilla).

---

## 2. Identificación

| Campo | Contenido | Guía |
|---|---|---|
| Código | | EXC-AAAA-NNN. |
| Fecha de solicitud | | DD-MM-AAAA. |
| Solicitante y área | | |
| Tipo de excepción | | Metodológica menor · De política de uso · De requisito del ciclo de vida · De umbral corporativo (30 §7.4). |
| Ámbito | | Iniciativa (IA-AAAA-NNN), sistema (SIA-AAAA-NNN), herramienta, área o compañía. |
| Excepción anterior enlazada | | Si es una prórroga. |

---

## 3. Comprobación de admisibilidad

Si alguna respuesta es Sí, la solicitud es inadmisible y se archiva con motivo.

| # | ¿La excepción afecta a…? | Sí · No |
|---|---|---|
| 1 | Una práctica prohibida por el artículo 5 del Reglamento (UE) 2024/1689 o cualquier otra línea roja de la política corporativa. | |
| 2 | Una obligación legal o regulatoria. | |
| 3 | La separación de funciones en cualquier *gate* (quien construye verifica o decide). | |
| 4 | La firma multinivel de puesta en producción Enterprise. | |
| 5 | La existencia de un mecanismo de parada (interruptor de parada o proceso alternativo). | |

| Campo | Contenido |
|---|---|
| Resultado | Admisible · Inadmisible |
| Comprobado por (oficina de IA) y fecha | |

---

## 4. Solicitud

Campos mínimos de 31 §3.8.

| Campo | Contenido | Guía |
|---|---|---|
| Requisito afectado | | Documento, sección y texto; criterio de *gate* del documento 21 o control SEG-NN o AG-NN si aplica. |
| Justificación | | Por qué no puede cumplirse ahora y qué se perdería sin la excepción. |
| Riesgo | | Qué puede pasar mientras dure (sección 6). |
| Medidas compensatorias | | Controles temporales que reducen el riesgo. |
| Plazo solicitado | | Dentro del máximo del tipo (sección 5). |
| Responsable | | Persona que responde de las medidas y del cierre. |
| Plan de cierre | | Qué se hará para cumplir el requisito al vencer. |
| *(ejemplo ilustrativo)* Requisito afectado | Política de uso aceptable 31 §4.2: solo herramientas del catálogo autorizado. | Piloto de cuatro semanas de una herramienta de resumen no catalogada, solo con datos ficticios. |

---

## 5. Órgano que aprueba

Matriz de 30 §7.4. La compañía puede endurecerla en C2, no rebajarla.

| Tipo | Ejemplo ilustrativo | Propone | Aprueba | Plazo máximo |
|---|---|---|---|---|
| **Metodológica menor** | Usar una plantilla propia equivalente. | Responsable de producto | Oficina de IA | Hasta el siguiente *gate* |
| **De política de uso** | Herramienta no catalogada en un piloto con datos ficticios. | Área solicitante | Oficina de IA con conformidad de seguridad | 90 días |
| **De requisito del ciclo de vida** | Aplazar una evidencia no crítica fuera de un «Continuar con condiciones». | Patrocinador | Comité de IA | 6 meses |
| **De umbral corporativo** | Superar el límite de inversión por etapa o el horizonte de retorno de C2. | Comité de IA | Consejo o comisión delegada | Según acuerdo |

En el comité de IA, las excepciones requieren la presencia y la conformidad de la segunda línea (30 §3.3 y §8.3). Si la segunda línea deniega su conformidad, el comité no puede aprobarla y puede elevar el desacuerdo a la comisión delegada (E-13).

---

## 6. Evaluación de riesgo

Escalas de la especificación común §5.1 y del documento 33.

| Campo | Contenido | Guía |
|---|---|---|
| Riesgo durante la excepción | | Causa, evento y consecuencia. |
| Probabilidad e impacto sin medidas | | 1–5 × 1–5; impacto: el mayor de los cinco ejes. |
| Nivel sin medidas | | Bajo 1–4 · Medio 5–9 · Alto 10–15 · Crítico 16–25. |
| Eficacia de las medidas compensatorias | | Existentes y probadas; las previstas no reducen el nivel. |
| Nivel con medidas | | |
| Conformidad de la segunda línea | | Obligatoria en las excepciones que decide el comité de IA y en las de política de uso (seguridad). |
| Coherencia con la aceptación de riesgo | | Si el nivel con medidas es Alto, solo lo acepta el comité de IA; si es Crítico, la excepción no se aprueba salvo decisión expresa del consejo o su comisión dentro del apetito (30 §7.2). |

---

## 7. Resolución

| Campo | Contenido | Guía |
|---|---|---|
| Resultado | | Aprobada · Aprobada con condiciones · Denegada. |
| Órgano y referencia | | Acta (P39) o registro de la oficina de IA. |
| Condiciones | | Cada una con responsable y plazo. |
| Fecha de inicio de la vigencia | | |
| Fecha de caducidad | | Nunca posterior al máximo del tipo. En umbral corporativo, la del acuerdo. |
| Motivo de la denegación | | Obligatorio si se deniega. |
| Comunicación al solicitante | | Fecha. |

---

## 8. Seguimiento y cierre

**Estados propuestos:** Solicitada · Inadmitida · En evaluación · Denegada · Vigente · Cerrada · Vencida. Una excepción vigente cuya fecha de caducidad pasa sin cierre queda **Vencida** y se registra una no conformidad mayor (31 §3.8; documento 37).

| Campo | Contenido | Guía |
|---|---|---|
| Revisiones | | Fecha y resultado de cada revisión mensual del comité de IA. |
| Fecha de cierre | | Cuando se cumple el requisito o cesa la actividad exceptuada. |
| Evidencia del cierre | | Enlace. |
| No conformidad abierta por vencimiento | | NC-AAAA-NNN, si procede. |

---

## 9. Registro de excepciones de la compañía

| Código | Tipo | Ámbito | Requisito afectado | Nivel de riesgo con medidas | Aprobada por | Referencia | Inicio | Caducidad | Responsable | Estado |
|---|---|---|---|---|---|---|---|---|---|---|
| EXC-AAAA-NNN | | | | Bajo · Medio · Alto | | | | | | |
| *(ejemplo ilustrativo)* EXC-2026-003 | De política de uso | Área de marketing | 31 §4.2 | Bajo | Oficina de IA con conformidad de seguridad | Registro de la oficina 2026-11 | 02-11-2026 | 30-11-2026 | Persona G | Vigente |

**Resumen trimestral para la comisión delegada** (se incorpora a P42):

| Periodo | Vigentes | Aprobadas | Denegadas | Cerradas | Vencidas | Con riesgo Alto |
|---|---|---|---|---|---|---|
| AAAA-Tn | | | | | | |

---

## 10. Criterios de calidad

| # | Comprobación | Estado |
|---|---|---|
| 1 | La solicitud es anterior a la actividad exceptuada. | Cumple · No cumple · No aplica · Pendiente |
| 2 | La comprobación de admisibilidad se ha hecho y ninguna respuesta es Sí. | |
| 3 | Constan los seis campos mínimos de 31 §3.8. | |
| 4 | Aprueba el órgano de 30 §7.4 y no es quien propone (I-9). | |
| 5 | Consta la conformidad de la segunda línea cuando se exige. | |
| 6 | La caducidad no supera el plazo máximo del tipo. | |
| 7 | Las vigentes se han informado a la comisión delegada en el trimestre. | |
| 8 | Ninguna excepción vencida sigue sin no conformidad registrada. | |

---

## 11. Aprobación y verificación

| Función | Rol en SEVEN-G | Nombre y cargo | Fecha | Firma o referencia |
|---|---|---|---|---|
| Propone | Según el tipo (sección 5) | | | |
| Comprueba admisibilidad y registra | Oficina de IA | | | |
| Valora el riesgo y da conformidad | Segunda línea (seguridad, riesgos o cumplimiento) | | | |
| Aprueba | Órgano de 30 §7.4 | | | |

Separación de funciones: quien propone no aprueba; si la oficina de IA propone una excepción, la aprueba el comité de IA.

---

## 12. Control de versiones

**Documento cumplimentado**

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| | | | |

**Plantilla**

| Versión | Fecha | Cambios |
|---|---|---|
| 0.1 | 19-09-2026 | Primera versión. Aplica 30 §7.4 y 31 §3.8; propone el código EXC-AAAA-NNN, los estados y la regla de prórroga como nueva solicitud. |
