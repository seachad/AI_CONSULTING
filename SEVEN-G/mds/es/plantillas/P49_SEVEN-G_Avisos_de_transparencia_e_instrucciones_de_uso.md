# Avisos de transparencia e instrucciones de uso

**Reúne los textos que informan a las personas de que tratan con un sistema de IA o con contenido generado, la información a quienes se ven afectados por sus decisiones y las instrucciones de uso internas para quienes lo usan, con un registro de dónde y desde cuándo se muestra cada aviso.**

| | |
|---|---|
| Documento | Plantilla P49 · Avisos de transparencia e instrucciones de uso |
| Versión | 0.1 (borrador de trabajo) |
| Fecha | 19-09-2026 |
| Autor | Fernando García · SEACHAD |
| Estado | Borrador para revisión. |

> *Esta plantilla no constituye asesoramiento jurídico.* Los textos modelo son orientativos y deben validarse para cada caso. Referencias consultadas en septiembre de 2026; verifíquese su vigencia (documento 34 §3.11).

---

> **Aviso legal y exención de responsabilidad.** SEVEN-G es un marco metodológico de referencia que se ofrece «tal cual» y con fines exclusivamente informativos. No constituye asesoramiento jurídico, regulatorio, financiero ni profesional, ni garantiza el cumplimiento de ninguna norma. Las referencias a regulación general (como el Reglamento Europeo de IA, el RGPD, DORA o NIS2), a normas técnicas y a regulación específica de cada sector o jurisdicción pueden ser incompletas, no aplicar a un caso concreto o quedar desactualizadas por cambios normativos, interpretaciones o criterios de las autoridades posteriores a su fecha de consulta. **Cada organización que use SEVEN-G es la única responsable de identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio**, con el asesoramiento cualificado que corresponda. El autor y SEACHAD no asumen responsabilidad alguna por el uso que se haga de este contenido ni por las decisiones que se adopten con él. Los datos, cifras, compañías y casos de los ejemplos son ficticios o ilustrativos.

> **Por qué importa.** Las obligaciones de transparencia del artículo 50 del Reglamento de IA son exigibles desde el 2-08-2026 y se comprueban en G4 y G5; una persona que no sabe que habla con una IA, o que no sabe cómo pedir que una persona revise una decisión que le afecta, es a la vez un incumplimiento y una pérdida de confianza. Las instrucciones de uso internas son la base de una supervisión humana efectiva: quien usa el sistema debe saber qué hace, qué no debe pedirle y cómo avisar de un fallo. Sin un registro de avisos, la compañía no puede demostrar qué texto vio cada persona ni desde cuándo.

## 1. Instrucciones de uso

| Aspecto | Indicación |
|---|---|
| **Cuándo se usa** | Se redacta en la fase 4, a partir de P11 §7 (obligaciones de transparencia) y P17 §8 (transparencia y derechos). Se prueba en la fase 5 (P22) y se verifica en G5. Se mantiene viva en la fase 6: todo cambio de texto o de canal se registra en la sección 7. |
| **Quién la rellena** | El responsable de producto de IA, con el responsable técnico de IA (marcado técnico y presentación en la interfaz), la función de protección de datos y, para los textos a personas trabajadoras, relaciones laborales. |
| **Quién la verifica** | Lite: oficina de IA. Enterprise: auditor de IA. El responsable de riesgos de IA emite conformidad sobre la suficiencia de los avisos. |
| **Quién decide o aprueba** | El patrocinador de IA, con la validación jurídica de los textos. |
| **Gate o momento** | G4 · Diseño (G4.05); G5 · Puesta en producción (G5.15, prueba de que se muestran); R6 (vigencia). |
| **Herramienta** | T07 · Clasificador regulatorio (apartados del artículo 50 aplicables, 32 §3.4). |
| **Documento de referencia** | 34 §3.7, §3.9 y §3.11; 50 §7 y §8.3; P17 §8; P24. |
| **Lite frente a Enterprise** | Lite puede omitir los campos marcados **(Enterprise)**. Los avisos exigidos por la clasificación son obligatorios en ambas. |

Reglas de cumplimentación:

- **Una plantilla por sistema de IA** (SIA-AAAA-NNN). Se cumplimentan solo los avisos que la sección 3 marca como aplicables.
- La información se facilita de forma **clara y distinguible, a más tardar en la primera interacción o exposición** (artículo 50.5), en el idioma de la persona y con criterios de accesibilidad.
- Los textos entre [corchetes] se sustituyen por los datos del caso. No se publica ningún texto con corchetes pendientes.
- Apoyo: Directrices sobre las obligaciones de transparencia (art. 50) de la Comisión y código de buenas prácticas sobre marcado y etiquetado (34 §3.3).
- Si el sistema realiza reconocimiento de emociones, compruebe antes en P11 §5 que no es una práctica prohibida (inferencia de emociones en el lugar de trabajo o en centros educativos, artículo 5.1.f).

---

## 2. Identificación

| Campo | Contenido | Guía |
|---|---|---|
| Código de la iniciativa | | IA-AAAA-NNN. |
| Código y nombre del sistema | | SIA-AAAA-NNN de P05 (T02). |
| Clasificación regulatoria | | De P11 §8. |
| Apartados del artículo 50 aplicables | | Ninguna · 50.1 · 50.2 · 50.3 · 50.4 (P11 §7; 32 §3.4). |
| Rol de la compañía | | Proveedor · Responsable del despliegue (determina quién debe cada aviso). |
| Canales en que se usa el sistema | | Web, aplicación, teléfono, correo, documentos, herramienta interna. |
| Versión del documento | | |
| Fecha | | DD-MM-AAAA. |
| Estado | | Borrador · Validación jurídica · Aprobado · Publicado · Sustituido. |

---

## 3. Avisos necesarios

| # | Situación | Base | Obligado | ¿Aplica? | Texto modelo |
|---|---|---|---|---|---|
| 1 | Personas que interactúan directamente con el sistema | Reglamento de IA, art. 50.1 (salvo que resulte evidente) | Proveedor | Sí · No | 4.1 |
| 2 | Contenido sintético de audio, imagen, vídeo o texto | Art. 50.2 (marcado legible por máquina) | Proveedor | | 4.2 (marcado técnico, P18) |
| 3 | Ultrasuplantaciones y textos publicados para informar al público sobre asuntos de interés público | Art. 50.4 (salvo revisión humana con responsabilidad editorial, para textos) | Responsable del despliegue | | 4.2 |
| 4 | Personas expuestas a reconocimiento de emociones o categorización biométrica | Art. 50.3 | Responsable del despliegue | | 4.3 |
| 5 | Personas sujetas a un sistema del anexo III que toma decisiones o ayuda a tomarlas | Art. 26.11 | Responsable del despliegue | | 4.4 |
| 6 | Decisiones automatizadas y lógica aplicada; derecho de acceso | RGPD, arts. 13.2.f, 14.2.g, 15.1.h y 22 | Responsable del tratamiento | | 4.4 |
| 7 | Explicación de decisiones individuales | Reglamento de IA, art. 86 | Responsable del despliegue de alto riesgo del anexo III | | 4.5 |
| 8 | Personas trabajadoras y su representación | Reglamento de IA, art. 26.7; Estatuto de los Trabajadores, art. 64.4.d) | Empleador | | 4.6 |
| 9 | Personas que usan el sistema en la compañía | Instrucciones de uso (arts. 13 y 26.1 en alto riesgo; buena práctica en todos) | Proveedor y responsable del despliegue | Sí | Sección 5 |

---

## 4. Textos modelo

### 4.1 Interacción con un sistema de IA

| Canal | Texto modelo | Momento |
|---|---|---|
| Asistente escrito | «Está hablando con [nombre del asistente], un asistente de inteligencia artificial de [compañía]. Puede cometer errores. Si prefiere que le atienda una persona, escriba [palabra clave] o llame al [canal].» | Al abrir la conversación, antes del primer mensaje. |
| Voz | «Le atiende un asistente automático con inteligencia artificial de [compañía]. Para hablar con una persona, diga [palabra clave] en cualquier momento.» | Al inicio de la llamada. |
| Correo o mensaje generado y enviado sin revisión humana | «Este mensaje ha sido redactado por un sistema de inteligencia artificial de [compañía]. Para cualquier consulta, responda a este mensaje o escriba a [canal].» | En el propio mensaje. |

### 4.2 Contenido generado o manipulado

| Situación | Texto modelo | Guía |
|---|---|---|
| Imagen, audio o vídeo que es una ultrasuplantación | «Contenido generado o modificado con inteligencia artificial.» | Visible junto al contenido; forma y excepciones según las directrices de la Comisión sobre el art. 50. |
| Texto publicado para informar al público sobre asuntos de interés público | «Este texto ha sido generado [o modificado] con inteligencia artificial [y revisado por [rol]].» | No se exige si hay revisión humana con responsabilidad editorial; en ese caso, registre quién la asume. |
| Marcado legible por máquina del contenido sintético | No es un texto: es una medida técnica del proveedor (metadatos, marcas de agua u otras). | Se documenta en P18 y se prueba en P22. |

### 4.3 Reconocimiento de emociones o categorización biométrica

| Texto modelo | Momento |
|---|---|
| «En [lugar o servicio], [compañía] utiliza un sistema de inteligencia artificial que [analiza expresiones o la voz para estimar emociones / clasifica a las personas según características biométricas] con la finalidad de [finalidad]. Los datos se tratan conforme a [referencia a la información de protección de datos]. Más información y ejercicio de derechos: [canal].» | Antes de la exposición, en el punto de acceso o en el primer contacto. |

### 4.4 Información a personas afectadas por decisiones

| Situación | Texto modelo |
|---|---|
| Sistema del anexo III que toma o apoya decisiones sobre la persona | «En la [evaluación / tramitación] de su [solicitud], [compañía] utiliza un sistema de inteligencia artificial que [describe lo que hace: calcula una puntuación, ordena, propone]. La decisión final la toma [rol]. Puede pedir una explicación de la decisión, expresar su punto de vista y solicitar que una persona la revise en [canal], en un plazo de [plazo interno].» |
| Decisión basada únicamente en tratamiento automatizado, cuando esté permitida | «Esta decisión se ha tomado de forma automatizada. Los principales factores considerados son [factores en lenguaje comprensible] y su consecuencia es [efecto]. Tiene derecho a obtener intervención humana, a expresar su punto de vista y a impugnar la decisión en [canal].» |

La información significativa sobre la lógica aplicada se redacta en términos comprensibles y no requiere revelar código fuente (50 §7.3); su alcance se analiza con la Sentencia del TJUE C-203/22 (Dun & Bradstreet Austria) (34 §6.2).

### 4.5 Respuesta a una solicitud de explicación

| Elemento de la respuesta | Contenido |
|---|---|
| Qué decisión se explica | [decisión, fecha y referencia] |
| Papel del sistema de IA | [qué hizo el sistema y qué decidió una persona] |
| Principales elementos de la decisión | [factores y su peso relativo, en lenguaje comprensible] |
| Qué puede hacer la persona | [revisión humana, reclamación, plazo y canal] |
| Quién responde | [rol que revisa, nunca el propio sistema] |

### 4.6 Personas trabajadoras y su representación

Se usa la ficha informativa del documento 50 §7.3 (identificación, decisiones afectadas, datos, parámetros y reglas, intervención humana, controles, derechos y cambios). Texto breve de aviso a la plantilla afectada:

«Desde el [fecha], en [proceso] se utiliza [nombre del sistema], un sistema de inteligencia artificial que [qué hace]. La decisión final corresponde a [rol]. La representación de las personas trabajadoras ha sido informada el [fecha]. Puede consultar la ficha del sistema en [ubicación] y pedir revisión humana en [canal].»

---

## 5. Instrucciones de uso internas

Para las personas que usan o supervisan el sistema. En alto riesgo, se basan en las instrucciones de uso del proveedor (artículo 13) y la compañía debe usar el sistema conforme a ellas (artículo 26.1). Se entregan con la formación del P20 y se enlazan desde el manual de operación (P24).

| Apartado | Contenido modelo | Guía |
|---|---|---|
| Qué es y para qué sirve | «[Nombre del sistema] [qué hace] para [finalidad]. Solo debe usarse para [usos permitidos].» | Coherente con la finalidad prevista (P05). |
| Qué no debe hacerse | «No lo use para [usos excluidos]. No introduzca [categorías de información no permitidas según la política de uso].» | Documento 31. |
| Limitaciones conocidas | «Puede equivocarse en [situaciones]. Su rendimiento es menor cuando [condiciones].» | De P16 y P21. |
| Cómo interpretar el resultado | «El resultado es [una propuesta / una puntuación / un borrador]. Revise siempre [elementos] antes de [acción].» | P17 §7. |
| Supervisión humana | «Usted debe validar [decisiones]. Puede no usar, corregir o anular el resultado en [función]. No se decide nunca de forma automática sobre [decisiones indelegables].» | P17 §5 y §6. |
| Riesgo de confianza excesiva | «El sistema puede parecer seguro aunque se equivoque. Si el resultado no le parece razonable, no lo aplique y consúltelo.» | P17 §7. |
| Cómo avisar de un fallo | «Si detecta un error, un resultado discriminatorio, una fuga de información o un comportamiento extraño, comuníquelo en [canal] indicando [datos mínimos]. En caso urgente, [procedimiento de parada o contacto de guardia].» | P26 y P27. |
| Contacto | [rol responsable y canal] | P24 §4. |
| Versión | [versión del sistema y de estas instrucciones, fecha] | Se actualiza con cada cambio relevante (P27). |

---

## 6. Solicitudes de explicación y revisión **(Enterprise)**

Registro de las solicitudes recibidas por los canales de las secciones 4.4 y 4.5. Sin datos personales identificativos: se usa la referencia del expediente.

| Nº | Fecha | Referencia del expediente | Tipo | Plazo interno | Respuesta y fecha | Rol que revisa | ¿Cambió la decisión? |
|---|---|---|---|---|---|---|---|
| | | | Explicación · Revisión humana · Reclamación · Acceso | | | | Sí · No |
| *(ejemplo ilustrativo)* 01 | 03-02-2027 | EXP-00871 | Revisión humana | 10 días hábiles | Revisada y mantenida, 11-02-2027 | Responsable del área | No |

Las reclamaciones y los cambios de decisión alimentan los indicadores de P17 §10 y P25.

---

## 7. Registro de avisos

| Nº | Aviso (sección) | Canal y ubicación | Versión del texto | Fecha de publicación | Responsable | Prueba en P22 | Estado |
|---|---|---|---|---|---|---|---|
| AV01 | | | | | | Superada · No superada · Pendiente | Vigente · Sustituido · Retirado |
| AV02 | | | | | | | |
| *(ejemplo ilustrativo)* AV01 | 4.1 Asistente escrito | Ventana de chat de la web, antes del primer mensaje | 1.1 | 15-01-2027 | Responsable de producto de IA | Superada | Vigente |

La numeración AVnn es local a cada sistema. Un texto sustituido se conserva con su periodo de vigencia.

---

## 8. Criterios de calidad

Los criterios formales están en el documento 21 (G4.05 y G5.15).

| # | Comprobación | Estado |
|---|---|---|
| 1 | Los avisos aplicables coinciden con P11 §7 y con el rol de la compañía. | Cumple · No cumple · No aplica · Pendiente |
| 2 | Cada aviso se muestra a más tardar en la primera interacción o exposición, de forma clara y accesible. | |
| 3 | No quedan textos con [corchetes] sin sustituir y los textos tienen validación jurídica. | |
| 4 | Las personas afectadas por decisiones saben cómo pedir explicación y revisión humana (G4.05). | |
| 5 | El marcado técnico del contenido sintético está documentado en P18 y probado en P22, cuando aplica. | |
| 6 | Las instrucciones de uso internas cubren finalidad, límites, supervisión humana y cómo avisar de fallos, y se han entregado con la formación. | |
| 7 | La presencia de cada aviso se ha probado antes de G5 (G5.15) y el registro está al día. | |

---

## 9. Aprobación y verificación

| Función | Rol en SEVEN-G | Nombre y cargo | Fecha | Firma o referencia |
|---|---|---|---|---|
| Elabora | Responsable de producto de IA | | | |
| Implanta en la interfaz y marca el contenido | Responsable técnico de IA | | | |
| Valida jurídicamente | Asesoría jurídica o cumplimiento; delegado de protección de datos | | | |
| Emite conformidad | Responsable de riesgos de IA | | | |
| Verifica | Oficina de IA (Lite) · Auditor de IA (Enterprise) | | | |
| Aprueba | Patrocinador de IA | | | |

Separación de funciones: quien redacta los textos no verifica su presencia en producción.

---

## 10. Control de versiones

**Documento cumplimentado**

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| | | | |

**Plantilla**

| Versión | Fecha | Cambios |
|---|---|---|
| 0.1 | 19-09-2026 | Primera versión. Textos modelo y registro de avisos de transparencia del artículo 50, información a personas afectadas por decisiones e instrucciones de uso internas, a partir de 34 §3.7, §3.9 y §3.11, 50 §7, P17 §8 y P24. Referencias consultadas en septiembre de 2026. |
