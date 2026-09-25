# Clasificación regulatoria y evaluaciones de impacto

**Clasifica el sistema de IA según el Reglamento Europeo de IA, determina las evaluaciones de impacto que corresponden y traslada las obligaciones resultantes a fases, evidencias y responsables.**

| | |
|---|---|
| Documento | Plantilla P11 · Clasificación regulatoria y evaluaciones de impacto |
| Versión | 0.1 (borrador de trabajo) |
| Fecha | 16-09-2026 |
| Autor | Fernando García Varela |
| Estado | Borrador para revisión. |

> *Este documento no constituye asesoramiento jurídico.* La clasificación debe realizarse con criterio jurídico cualificado (01 §13). Referencias consultadas en septiembre de 2026. El Reglamento Europeo de IA (Reglamento (UE) 2024/1689) se aplica de forma escalonada y existen iniciativas de modificación del calendario de algunas obligaciones: verifíquense el calendario y el texto vigentes.

---

> **Aviso legal y exención de responsabilidad.** SEVEN-G es un marco metodológico de referencia que se ofrece «tal cual» y con fines exclusivamente informativos. No constituye asesoramiento jurídico, regulatorio, financiero ni profesional, ni garantiza el cumplimiento de ninguna norma. Las referencias a regulación general (como el Reglamento Europeo de IA, el RGPD, DORA o NIS2), a normas técnicas y a regulación específica de cada sector o jurisdicción pueden ser incompletas, no aplicar a un caso concreto o quedar desactualizadas por cambios normativos, interpretaciones o criterios de las autoridades posteriores a su fecha de consulta. **Cada organización que use SEVEN-G es la única responsable de identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio**, con el asesoramiento cualificado que corresponda. Esta metodología es una ayuda genérica y gratuita, compartida con la comunidad para que nadie tenga que empezar desde cero; cada persona u organización puede y debe adaptarla a su propio uso. No debe entenderse que sus partes jurídicamente sensibles hayan sido revisadas por una asesoría jurídica: esas revisiones, para cada empresa o sector, son responsabilidad última de la empresa, el consultor o la organización que la use. Aunque se procura mantenerla al día, alguna norma puede haber cambiado sin que se recoja aquí. En la máxima medida permitida por la ley, el autor no asume responsabilidad alguna por los efectos de su aplicación en ninguna organización ni por su aplicabilidad completa. La metodología no otorga certificación de ningún tipo. El autor no asume responsabilidad alguna por el uso que se haga de este contenido ni por las decisiones que se adopten con él. Los datos, cifras, compañías y casos de los ejemplos son ficticios o ilustrativos.

## 1. Instrucciones de uso

| Aspecto | Indicación |
|---|---|
| **Cuándo se usa** | Análisis preliminar en la fase 0 (para P04 y P05). Clasificación completa en la fase 3, antes de G3. Se revisa en cada R6 y siempre que cambien la finalidad prevista, el alcance, el rol de la compañía o la norma. |
| **Quién la rellena** | El responsable de riesgos de IA, con asesoría jurídica y el delegado de protección de datos. El responsable de producto aporta la descripción del sistema. |
| **Quién la verifica** | Lite: responsable de riesgos de IA; si él la ha elaborado, verifica la oficina de IA o el auditor de IA. Enterprise: auditor de IA. |
| **Quién decide** | Lite: patrocinador con conformidad de riesgos. Enterprise: comité de IA. La validación jurídica es requisito previo, no sustituye a la decisión. |
| **Gate en que se revisa** | G3 · Viabilidad; comprobación en G5 y R6. |
| **Herramienta** | T07 · Clasificador regulatorio. |
| **Lite frente a Enterprise** | Lite puede omitir los campos marcados **(Enterprise)**. El árbol de clasificación completo es obligatorio en ambas. |

Reglas de cumplimentación:

- Se clasifica **cada sistema de IA** (una plantilla por ficha P05) según su **finalidad prevista**, con la taxonomía literal de 03 §3.3.
- Si un sistema es de alto riesgo y además tiene obligaciones de transparencia, la etiqueta recoge la categoría más exigente y la sección 8, todas las obligaciones.
- Una práctica prohibida no pasa de la fase 3 en ningún caso (01 §6.5).

---

## 2. Identificación

| Campo | Contenido | Guía |
|---|---|---|
| Código de la iniciativa | | IA-AAAA-NNN. |
| Código y nombre del sistema | | De P05. |
| Finalidad prevista | | Copiar de P05. La clasificación vale solo para esta finalidad. |
| Versión del documento | | |
| Fecha | | DD-MM-AAAA. |
| Autor | | Nombre y rol. |
| Validación jurídica | | Persona, función y fecha. |

---

## 3. Árbol de clasificación

Se recorre en orden y se detiene en el primer resultado que aplica, salvo en el paso 4, que obliga a comprobar también el paso 5.

| Paso | Pregunta | Si la respuesta es sí | Si la respuesta es no |
|---|---|---|---|
| 1 | ¿Es un sistema de IA según la definición del Reglamento (sección 4)? | Paso 2 | Fuera de ámbito (se anota "Reglas (no es IA)" en P05 si procede) |
| 2 | ¿Aplica alguna exclusión del ámbito (sección 4)? | Fuera de ámbito | Paso 3 |
| 3 | ¿Coincide con alguna práctica prohibida (sección 5)? | **Prohibido** | Paso 4 |
| 4 | ¿Es de alto riesgo (sección 6)? | **Alto riesgo** y paso 5 | Paso 5 |
| 5 | ¿Tiene obligaciones de transparencia (sección 7)? | **Obligaciones de transparencia** (o se añaden a Alto riesgo) | **Riesgo mínimo** si no era alto riesgo |

Si alguna respuesta no puede darse con la información disponible, el resultado es **Pendiente de clasificar**, con responsable y fecha, y P04 lo trata como criterio Enterprise pendiente.

---

## 4. Definición y ámbito

| Pregunta | Respuesta | Justificación |
|---|---|---|
| ¿Es un sistema basado en máquinas que, con algún nivel de autonomía, infiere a partir de las entradas cómo generar resultados (predicciones, contenidos, recomendaciones o decisiones) que pueden influir en entornos físicos o virtuales? | Sí · No | |
| ¿Aplica una exclusión del ámbito? Entre otras: uso exclusivo con fines militares, de defensa o de seguridad nacional; uso exclusivo para investigación y desarrollo científicos; actividades de investigación, prueba o desarrollo previas a la introducción en el mercado, sin pruebas en condiciones reales. | Sí · No | Indicar cuál, con validación jurídica. |

| Campo | Contenido | Guía |
|---|---|---|
| Rol de la compañía para este sistema | | Proveedor · Responsable del despliegue · Importador · Distribuidor · Representante autorizado · Fabricante del producto (coherente con P05). |
| Justificación del rol | | |
| ¿Puede la compañía pasar a considerarse proveedor? | | Sí · No. Revisar si pone su nombre o marca en un sistema de alto riesgo, lo modifica sustancialmente o cambia su finalidad prevista de forma que pase a ser de alto riesgo. |

---

## 5. Prácticas prohibidas

¿El sistema hace o permite alguna de estas prácticas? Una sola respuesta "Sí" confirmada jurídicamente clasifica el sistema como **Prohibido**.

| # | Práctica | Respuesta | Justificación |
|---|---|---|---|
| 1 | Técnicas subliminales, deliberadamente manipuladoras o engañosas que alteran de forma sustancial el comportamiento y causan o pueden causar perjuicios considerables. | Sí · No | |
| 2 | Explotación de vulnerabilidades por edad, discapacidad o situación social o económica, con el mismo efecto. | | |
| 3 | Evaluación o clasificación de personas por su comportamiento social o características personales con trato perjudicial injustificado o desproporcionado (puntuación social). | | |
| 4 | Evaluación del riesgo de que una persona cometa un delito basada únicamente en la elaboración de perfiles o en rasgos de personalidad. | | |
| 5 | Creación o ampliación de bases de datos de reconocimiento facial mediante extracción no selectiva de imágenes de internet o de circuitos cerrados de televisión. | | |
| 6 | Inferencia de emociones en el lugar de trabajo o en centros educativos, salvo por motivos médicos o de seguridad. | | |
| 7 | Categorización biométrica para deducir raza, opiniones políticas, afiliación sindical, convicciones religiosas o filosóficas, vida sexual u orientación sexual. | | |
| 8 | Identificación biométrica remota en tiempo real en espacios de acceso público con fines de garantía del cumplimiento del Derecho, fuera de las excepciones previstas. | | |

---

## 6. Alto riesgo

### 6.1 Componente de seguridad o producto regulado

| Pregunta | Respuesta | Justificación |
|---|---|---|
| ¿El sistema es un producto, o un componente de seguridad de un producto, cubierto por la legislación de armonización de la Unión enumerada en el Reglamento, que debe someterse a evaluación de conformidad por un tercero? | Sí · No | |

### 6.2 Ámbitos de alto riesgo

¿La finalidad prevista corresponde a alguno de estos ámbitos? Debe comprobarse el caso de uso concreto en el anexo del Reglamento, no solo el ámbito.

| # | Ámbito | Respuesta | Caso de uso concreto |
|---|---|---|---|
| 1 | Biometría (identificación remota, categorización, reconocimiento de emociones, en los casos permitidos). | Sí · No | |
| 2 | Infraestructuras críticas (componentes de seguridad en su gestión y funcionamiento). | | |
| 3 | Educación y formación profesional (acceso, evaluación, vigilancia de exámenes). | | |
| 4 | Empleo, gestión de trabajadores y acceso al autoempleo (selección, decisiones sobre condiciones, promoción, despido, asignación de tareas, evaluación del rendimiento). | | |
| 5 | Acceso a servicios privados esenciales y a servicios y prestaciones públicos esenciales (entre otros, solvencia o calificación crediticia salvo detección de fraude, y evaluación de riesgos y fijación de precios en seguros de vida y salud). | | |
| 6 | Garantía del cumplimiento del Derecho. | | |
| 7 | Migración, asilo y gestión del control fronterizo. | | |
| 8 | Administración de justicia y procesos democráticos. | | |

### 6.3 Excepción documentada

Un sistema de los ámbitos de 6.2 puede no considerarse de alto riesgo si no plantea un riesgo importante para la salud, la seguridad o los derechos fundamentales, por ejemplo porque realiza una tarea de procedimiento limitada, mejora el resultado de una actividad humana ya realizada, detecta patrones de decisión sin sustituir la valoración humana o realiza una tarea preparatoria. **La excepción no aplica si el sistema elabora perfiles de personas físicas.**

| Campo | Contenido | Guía |
|---|---|---|
| ¿Se invoca la excepción? | | Sí · No. |
| Condición que se cumple | | Cuál y por qué. |
| ¿Elabora perfiles de personas físicas? | | Si es "Sí", la excepción no aplica. |
| Documentación de la evaluación | | Referencia; el proveedor debe documentarla y, en los casos previstos, registrar el sistema. |

---

## 7. Obligaciones de transparencia

| # | Situación | Respuesta | Obligación principal |
|---|---|---|---|
| 1 | El sistema interactúa directamente con personas físicas. | Sí · No | Diseño que informe de que interactúan con un sistema de IA, salvo que resulte evidente (proveedor). |
| 2 | El sistema genera contenido sintético de audio, imagen, vídeo o texto. | | Marcado del contenido en formato legible por máquina (proveedor). |
| 3 | El sistema realiza reconocimiento de emociones o categorización biométrica. | | Informar a las personas expuestas (responsable del despliegue). |
| 4 | El sistema genera o manipula ultrasuplantaciones. | | Divulgar que el contenido ha sido generado o manipulado. |
| 5 | El sistema genera o manipula texto publicado para informar al público sobre asuntos de interés público. | | Divulgarlo, salvo revisión humana con responsabilidad editorial. |

**Modelos de IA de uso general (Enterprise).** Si la compañía desarrolla, o modifica de forma que pueda considerarse proveedora de, un modelo de IA de uso general, debe analizarse por separado el capítulo del Reglamento dedicado a estos modelos.

Textos y registro de avisos en P49.

---

## 8. Resultado de la clasificación

| Campo | Contenido | Guía |
|---|---|---|
| **Clasificación regulatoria** | | Prohibido · Alto riesgo · Obligaciones de transparencia · Riesgo mínimo · Fuera de ámbito · Pendiente de clasificar. |
| Obligaciones adicionales | | Por ejemplo, transparencia además de alto riesgo. |
| Rol de la compañía | | De la sección 4. |
| Motivación | | Resumen del recorrido por el árbol. |
| Pendientes | | Qué falta, responsable y fecha. |
| Validación jurídica | | Persona, fecha y referencia. |

*(ejemplo ilustrativo)* Asistente de respuesta a consultas sobre pedidos. Es sistema de IA; no hay exclusión; no es práctica prohibida; no corresponde a ámbitos de alto riesgo; interactúa directamente con clientes. Rol: proveedor (desarrolla el asistente sobre un modelo de terceros y lo pone en servicio con su nombre) y responsable del despliegue. Clasificación: **Obligaciones de transparencia**.

---

## 9. Evaluaciones de impacto

### 9.1 Evaluación de impacto en protección de datos (RGPD)

| Pregunta | Respuesta | Justificación |
|---|---|---|
| ¿Trata datos personales? | Sí · No | |
| ¿Hay evaluación sistemática y exhaustiva de aspectos personales basada en tratamiento automatizado, incluida la elaboración de perfiles, que produzca efectos jurídicos o afecte significativamente a las personas? | | |
| ¿Hay tratamiento a gran escala de categorías especiales de datos o de datos relativos a condenas e infracciones penales? | | |
| ¿Hay observación sistemática a gran escala de una zona de acceso público? | | |
| ¿El tratamiento figura en la lista de tratamientos que requieren evaluación publicada por la autoridad de control? | | |
| ¿Se toman decisiones basadas únicamente en tratamiento automatizado con efectos jurídicos o significativos? | | Si es "Sí", revisar además las garantías del RGPD sobre decisiones automatizadas. |
| **Resultado** | Requerida · No requerida · Recomendada | Si es requerida, debe realizarse antes del tratamiento. |
| Referencia y fecha de la evaluación | | Se documenta en P47. |
| Opinión del delegado de protección de datos | | |

### 9.2 Evaluación de impacto en derechos fundamentales

La exige el Reglamento Europeo de IA a determinados responsables del despliegue de sistemas de alto riesgo, antes de su primera utilización.

| Pregunta | Respuesta | Justificación |
|---|---|---|
| ¿El sistema es de alto riesgo y la compañía es responsable del despliegue? | Sí · No | |
| ¿La compañía es un organismo de Derecho público o una entidad privada que presta servicios públicos? | | |
| ¿El sistema evalúa la solvencia o la calificación crediticia de personas físicas, o evalúa riesgos y fija precios en seguros de vida o de salud? | | |
| **Resultado** | Requerida · No requerida · Recomendada | Los sistemas de infraestructuras críticas quedan fuera de esta obligación. |

Contenido mínimo cuando es requerida: procesos en los que se usará el sistema; periodo y frecuencia de uso; categorías de personas afectadas; riesgos específicos de perjuicio; medidas de supervisión humana; medidas si los riesgos se materializan, incluidos gobierno interno y reclamaciones. Se comunican los resultados a la autoridad de vigilancia del mercado y puede complementar la evaluación de impacto en protección de datos. La evaluación se documenta en P48. Referencia y fecha: ____.

### 9.3 Otras evaluaciones **(Enterprise)**

Indique si se requieren y dónde constan: evaluación de riesgos TIC o de terceros (DORA, NIS2), evaluación ética interna, información a la representación de las personas trabajadoras y evaluaciones sectoriales.

---

## 10. Obligaciones derivadas

Cada obligación se vincula a una fase, una evidencia y un responsable. El mapeo detallado está en el documento 34.

| Obligación | Aplica a la compañía como | Fase | Evidencia | Responsable | Estado |
|---|---|---|---|---|---|
| | | | Código P o documento | | Pendiente · En curso · Cumplida |
| Alfabetización en IA de las personas que usan el sistema | Proveedor o responsable del despliegue | 4–5 | P20 | | |
| *(ejemplo ilustrativo)* Diseñar el asistente para que el cliente sepa que conversa con un sistema de IA | Proveedor | 4 | P17 | Responsable de producto | Pendiente |

En alto riesgo, como responsable del despliegue, revisar al menos: uso conforme a las instrucciones, supervisión humana competente, datos de entrada pertinentes, vigilancia, conservación de registros, información a trabajadores y afectados, y explicación de decisiones individuales.

---

## 11. Criterios de calidad

Los criterios formales de G3 están en el documento 21 (ver criterios G3.xx).

| # | Comprobación | Estado |
|---|---|---|
| 1 | La finalidad prevista es concreta y coincide con P05. | Cumple · No cumple · No aplica · Pendiente |
| 2 | Se han respondido todos los pasos del árbol en orden. | |
| 3 | El rol de la compañía está justificado. | |
| 4 | Si se invoca la excepción de alto riesgo, está documentada y no hay elaboración de perfiles. | |
| 5 | El resultado usa la taxonomía controlada. | |
| 6 | Consta la validación jurídica con fecha. | |
| 7 | Se ha determinado la necesidad de cada evaluación de impacto y, si es requerida, existe o tiene fecha anterior al tratamiento o a la primera utilización. | |
| 8 | Las obligaciones derivadas tienen fase, evidencia y responsable. | |

---

## 12. Aprobación y verificación

| Función | Rol en SEVEN-G | Nombre y cargo | Fecha | Firma o referencia |
|---|---|---|---|---|
| Elabora | Responsable de riesgos de IA | | | |
| Valida jurídicamente | Asesoría jurídica o cumplimiento | | | |
| Consultado | Delegado de protección de datos | | | |
| Verifica | Oficina de IA o auditor de IA (Lite, si elabora riesgos) · Auditor de IA (Enterprise) | | | |
| Decide | Patrocinador con conformidad de riesgos (Lite) · Comité de IA (Enterprise) | | | |
| ☐ Declaración: «La organización confirma que la clasificación y el cumplimiento regulatorio han sido verificados con asesoramiento cualificado y asume su responsabilidad; SEVEN-G es solo una referencia metodológica.» | Mismo órgano que decide | | | |

Separación de funciones: el responsable de riesgos no verifica una clasificación que ha elaborado.

---

## 13. Control de versiones

**Documento cumplimentado**

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| | | | |

**Plantilla**

| Versión | Fecha | Cambios |
|---|---|---|
| 0.1 | 16-09-2026 | Primera versión. Árbol de clasificación según el Reglamento Europeo de IA, evaluación de impacto en protección de datos y evaluación de impacto en derechos fundamentales, con la taxonomía de 03 §3.3. Referencias consultadas en septiembre de 2026. |
