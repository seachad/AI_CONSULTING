# Declaración de contexto y restricciones

**Deja por escrito, antes de invertir, el marco estratégico, regulatorio, ético, de datos, económico y organizativo dentro del cual debe desarrollarse la iniciativa.**

| | |
|---|---|
| Documento | Plantilla P02 · Declaración de contexto y restricciones |
| Versión | 0.1 (borrador de trabajo) |
| Fecha | 16-09-2026 |
| Autor | Fernando García Varela |
| Estado | Borrador para revisión. |

---

> **Aviso legal y exención de responsabilidad.** SEVEN-G es un marco metodológico de referencia que se ofrece «tal cual» y con fines exclusivamente informativos. No constituye asesoramiento jurídico, regulatorio, financiero ni profesional, ni garantiza el cumplimiento de ninguna norma. Las referencias a regulación general (como el Reglamento Europeo de IA, el RGPD, DORA o NIS2), a normas técnicas y a regulación específica de cada sector o jurisdicción pueden ser incompletas, no aplicar a un caso concreto o quedar desactualizadas por cambios normativos, interpretaciones o criterios de las autoridades posteriores a su fecha de consulta. **Cada organización que use SEVEN-G es la única responsable de identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio**, con el asesoramiento cualificado que corresponda. Esta metodología es una ayuda genérica y gratuita, compartida con la comunidad para que nadie tenga que empezar desde cero; cada persona u organización puede y debe adaptarla a su propio uso. No debe entenderse que sus partes jurídicamente sensibles hayan sido revisadas por una asesoría jurídica: esas revisiones, para cada empresa o sector, son responsabilidad última de la empresa, el consultor o la organización que la use. Aunque se procura mantenerla al día, alguna norma puede haber cambiado sin que se recoja aquí. En la máxima medida permitida por la ley, el autor no asume responsabilidad alguna por los efectos de su aplicación en ninguna organización ni por su aplicabilidad completa. La metodología no otorga certificación de ningún tipo. El autor no asume responsabilidad alguna por el uso que se haga de este contenido ni por las decisiones que se adopten con él. Los datos, cifras, compañías y casos de los ejemplos son ficticios o ilustrativos.

## 1. Instrucciones de uso

| Aspecto | Indicación |
|---|---|
| **Cuándo se usa** | En la fase 0, junto con la carta de la iniciativa (P01). Se revisa en G3 y cuando cambie una restricción relevante (norma, presupuesto, proveedor, datos). |
| **Quién la rellena** | El responsable de producto de IA. Consulta al responsable de riesgos, a protección de datos, a seguridad de la información y a asesoría jurídica. |
| **Quién la verifica** | Lite: oficina de IA. Enterprise: auditor de IA. |
| **Quién decide** | Se aprueba con G0: patrocinador (Lite) · comité de IA (Enterprise). |
| **Gate en que se revisa** | G0 · Autorización; se vuelve a comprobar en G3 · Viabilidad. |
| **Herramienta** | T01 · Registro de iniciativas (enlace como evidencia de G0). |
| **Lite frente a Enterprise** | Lite puede omitir los campos marcados **(Enterprise)**. En Lite, las restricciones que no apliquen se marcan "No aplica" con una línea de motivo. |

Reglas de cumplimentación:

- Una restricción es algo que la iniciativa **no puede cambiar**. Si puede negociarse, es un supuesto y va a la sección 10.
- Esta declaración no sustituye la clasificación regulatoria (P11) ni la matriz de riesgos (P12): identifica lo que se sabe en la fase 0 para que no se descubra tarde.
- *Este documento no constituye asesoramiento jurídico.* La aplicabilidad de cada norma debe confirmarla quien tenga competencia jurídica en la compañía. Referencias normativas consultadas en septiembre de 2026; debe verificarse su vigencia.

---

## 2. Identificación

| Campo | Contenido | Guía |
|---|---|---|
| Código de la iniciativa | | IA-AAAA-NNN. |
| Nombre de la iniciativa | | Igual que en P01. |
| Versión del documento | | |
| Fecha | | DD-MM-AAAA. |
| Autor | | Nombre y rol. |
| Personas consultadas | | Funciones de segunda línea y asesoría jurídica consultadas, con fecha. |
| Intensidad aplicable | | Lite · Enterprise (P04). |

---

## 3. Contexto estratégico

| Campo | Contenido | Guía |
|---|---|---|
| Tesis de IA aplicable | | Extracto o referencia de la tesis aprobada en C2 que ampara la iniciativa. |
| Ambición aprobada para la esfera | | Nivel de ambición que el consejo fijó en C2 para la esfera principal. |
| Apetito de riesgo aplicable | | Límites de C2 que afectan a esta iniciativa: nivel de riesgo residual aceptable, autonomía máxima, exposición a clientes, umbrales económicos. |
| Situación actual del proceso | | Cómo se hace hoy, con qué medios y con qué problemas conocidos. |
| Iniciativas o sistemas existentes | | Otros sistemas de IA del inventario que ya cubren parte del proceso. |
| Horizonte de retorno fijado en C2 **(Enterprise)** | | Plazo en el que el neto esperado debe ser positivo para Optimizar y Aumentar. |

---

## 4. Restricciones regulatorias

Indique para cada referencia si aplica. "Por determinar" obliga a resolverla antes de G3.

| Referencia | ¿Aplica? | Motivo | Implicación para la iniciativa | Quién lo confirma |
|---|---|---|---|---|
| Reglamento Europeo de IA (Reglamento (UE) 2024/1689) | Sí · No · Por determinar | | Clasificación y obligaciones según el rol de la compañía (P11). | |
| RGPD (Reglamento (UE) 2016/679) y normativa nacional de protección de datos | | | Base jurídica, minimización, evaluación de impacto en protección de datos, decisiones automatizadas. | |
| DORA (Reglamento (UE) 2022/2554) | | Solo entidades financieras incluidas en su ámbito. | Riesgo de proveedores TIC, incidentes, funciones esenciales o importantes. | |
| NIS2 (Directiva (UE) 2022/2555) y su transposición nacional | | Entidades esenciales o importantes. | Gestión de riesgos de ciberseguridad y notificación de incidentes. | |
| Regulación sectorial | | Supervisores y normas del sector. | | |
| Legislación laboral | | Si el sistema afecta a condiciones de trabajo, acceso al empleo o evaluación de personas trabajadoras. | Información a la representación legal de las personas trabajadoras (en España, artículo 64.4.d del Estatuto de los Trabajadores). | |
| Consumo, publicidad y contratación a distancia | | Si hay interacción con clientes. | Información precontractual, prácticas comerciales, reclamaciones. | |
| Propiedad intelectual y secretos empresariales **(Enterprise)** | | Uso de contenidos de terceros o generación de contenidos. | Licencias de datos y de resultados. | |
| Accesibilidad **(Enterprise)** | | Productos o servicios incluidos en la Directiva (UE) 2019/882 sobre requisitos de accesibilidad (en España, Ley 11/2023). | | |
| Normas internas | | Política corporativa de IA y uso aceptable (documento 31), seguridad, protección de datos, compras. | | |

---

## 5. Restricciones éticas y de uso

| Campo | Contenido | Guía |
|---|---|---|
| Principios corporativos aplicables | | Principios de la política corporativa de IA que condicionan el diseño. |
| Usos no admitidos | | Usos expresamente prohibidos por la compañía, además de las prácticas prohibidas por la regulación. |
| Personas o colectivos vulnerables | | Menores, personas mayores, personas con discapacidad, situaciones de dificultad económica. |
| Supervisión humana mínima exigida | | Qué decisiones deben quedar siempre en manos de una persona. |
| Autonomía máxima permitida | | A0 Asistencia · A1 Recomendación · A2 Actuación supervisada · A3 Actuación autónoma (documento 35). |
| Líneas rojas | | Lo que la iniciativa no hará en ningún caso. *Ejemplo ilustrativo: el asistente no modificará pedidos ni emitirá reembolsos.* |

---

## 6. Restricciones de datos

| Campo | Contenido | Guía |
|---|---|---|
| Fuentes de datos previstas | | Sistemas, ficheros o proveedores. |
| Datos personales | | Sí · No. Si sí, categorías de interesados. |
| Categorías especiales o datos especialmente protegidos | | Sí · No · Por determinar. Si sí, activa el criterio Enterprise 5 de P04. |
| Información confidencial crítica | | Secretos empresariales, información privilegiada, datos de clientes sujetos a secreto. |
| Base jurídica y finalidad | | Referencia al registro de actividades de tratamiento. Uso compatible con la finalidad original. |
| Ubicación y transferencias internacionales | | Dónde se tratarán los datos y si salen del Espacio Económico Europeo. |
| Uso de datos por proveedores | | Si el proveedor puede usar datos o instrucciones para entrenar o mejorar sus modelos. Debe quedar prohibido o regulado por contrato. |
| Calidad conocida | | Problemas de calidad, completitud o sesgo ya conocidos. |
| Retención y eliminación **(Enterprise)** | | Plazos de conservación de entradas, salidas y registros. |

---

## 7. Restricciones presupuestarias y de plazo

| Campo | Contenido | Guía |
|---|---|---|
| Presupuesto máximo | | Tope autorizado y punto de revisión (coherente con P01). |
| Restricciones de coste recurrente | | Coste anual máximo admisible en operación. |
| Fechas límite externas | | Fechas regulatorias, contractuales o de negocio que no pueden moverse. |
| Ventanas de cambio | | Periodos en los que no se pueden hacer despliegues (cierres, campañas). |

---

## 8. Restricciones tecnológicas y de terceros

| Campo | Contenido | Guía |
|---|---|---|
| Arquitectura y plataformas corporativas | | Plataformas obligatorias o excluidas. |
| Proveedores homologados | | Si la compañía exige proveedores ya homologados o un proceso de compra concreto. |
| Requisitos de seguridad | | Clasificación de la información, requisitos de identidad y acceso, entornos permitidos. |
| Dependencia y sustituibilidad **(Enterprise)** | | Límites a la concentración en un proveedor; exigencia de plan de salida. |
| Funciones críticas o importantes **(Enterprise)** | | Si el sistema soportará una función crítica, con los requisitos de resiliencia que correspondan. |

---

## 9. Restricciones organizativas y de personas

| Campo | Contenido | Guía |
|---|---|---|
| Capacidad disponible | | Personas y dedicación que el área puede aportar. |
| Efecto previsto sobre el trabajo | | Tareas, roles o puestos que podrían cambiar. |
| Formación y alfabetización en IA | | Nivel de conocimientos requerido para usuarios y supervisores. |
| Relaciones laborales | | Obligaciones de información o consulta a la representación de las personas trabajadoras. |
| Idiomas, canales y accesibilidad | | Requisitos de uso para usuarios internos o externos. |

---

## 10. Supuestos y cuestiones abiertas

| Nº | Supuesto o cuestión abierta | Efecto si resulta falso | Responsable | Fecha límite | Estado |
|---|---|---|---|---|---|
| 1 | | | | | Abierta · Resuelta |
| 2 | | | | | |
| *(ejemplo ilustrativo)* | El proveedor de la plataforma de atención permite desactivar el uso de conversaciones para entrenamiento. | Habría que cambiar de proveedor o anonimizar antes del envío. | Responsable técnico | Antes de G3 | Abierta |

---

## 11. Criterios de calidad

Los criterios formales de G0 y G3 están en el documento 21 (ver criterios G0.xx y G3.xx).

| # | Comprobación | Estado |
|---|---|---|
| 1 | Todas las referencias regulatorias tienen respuesta; las "Por determinar" tienen responsable y fecha anterior a G3. | Cumple · No cumple · No aplica · Pendiente |
| 2 | Las restricciones de datos identifican datos personales, categorías especiales y transferencias. | |
| 3 | Se declara la autonomía máxima permitida y las decisiones que no se delegan. | |
| 4 | Las líneas rojas son concretas y verificables. | |
| 5 | Los límites económicos son coherentes con P01. | |
| 6 | Constan las funciones de segunda línea consultadas y la fecha. | |
| 7 | Los supuestos están separados de las restricciones. | |
| 8 | El documento tiene autor, fecha y versión, y existía antes de solicitar el *gate*. | |

---

## 12. Aprobación y verificación

| Función | Rol en SEVEN-G | Nombre y cargo | Fecha | Firma o referencia |
|---|---|---|---|---|
| Elabora | Responsable de producto de IA | | | |
| Consultado | Responsable de riesgos de IA · protección de datos · seguridad · asesoría jurídica | | | |
| Verifica | Oficina de IA (Lite) · Auditor de IA (Enterprise) | | | |
| Decide | Patrocinador de IA (Lite) · Comité de IA (Enterprise), con G0 | | | |

Separación de funciones: la consulta a segunda línea no equivale a verificación. Quien verifica no ha elaborado el documento.

---

## 13. Control de versiones

**Documento cumplimentado**

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| | | | |

**Plantilla**

| Versión | Fecha | Cambios |
|---|---|---|
| 0.1 | 16-09-2026 | Primera versión. Estructura alineada con 01 §6.2 y §13. |
