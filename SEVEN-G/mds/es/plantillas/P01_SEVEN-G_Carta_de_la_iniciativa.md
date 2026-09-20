# Carta de la iniciativa

**Autoriza formalmente una iniciativa de IA y fija su objetivo, alcance, ambición preliminar, presupuesto y responsables.**

| | |
|---|---|
| Documento | Plantilla P01 · Carta de la iniciativa |
| Versión | 0.1 (borrador de trabajo) |
| Fecha | 16-09-2026 |
| Autor | Fernando García Varela |
| Estado | Borrador para revisión. |

---

> **Aviso legal y exención de responsabilidad.** SEVEN-G es un marco metodológico de referencia que se ofrece «tal cual» y con fines exclusivamente informativos. No constituye asesoramiento jurídico, regulatorio, financiero ni profesional, ni garantiza el cumplimiento de ninguna norma. Las referencias a regulación general (como el Reglamento Europeo de IA, el RGPD, DORA o NIS2), a normas técnicas y a regulación específica de cada sector o jurisdicción pueden ser incompletas, no aplicar a un caso concreto o quedar desactualizadas por cambios normativos, interpretaciones o criterios de las autoridades posteriores a su fecha de consulta. **Cada organización que use SEVEN-G es la única responsable de identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio**, con el asesoramiento cualificado que corresponda. El autor no asume responsabilidad alguna por el uso que se haga de este contenido ni por las decisiones que se adopten con él. Los datos, cifras, compañías y casos de los ejemplos son ficticios o ilustrativos.

## 1. Instrucciones de uso

| Aspecto | Indicación |
|---|---|
| **Cuándo se usa** | En la fase 0 (Contexto y restricciones), antes de solicitar G0. Se actualiza si cambian el alcance, el presupuesto autorizado o los responsables, y al escalar en G7 (nueva fase 0 para el alcance ampliado). |
| **Quién la rellena** | El responsable de producto de IA, con el patrocinador de IA, que responde del contenido. |
| **Quién la verifica** | Lite: oficina de IA. Enterprise: auditor de IA. |
| **Quién decide** | Lite: patrocinador de IA. Enterprise: comité de IA. |
| **Gate en que se revisa** | G0 · Autorización. |
| **Herramienta** | T01 · Registro de iniciativas (los campos de identificación y clasificación alimentan la ficha de la iniciativa). |
| **Lite frente a Enterprise** | Lite puede omitir los campos marcados **(Enterprise)**. El resto es obligatorio en ambas intensidades. |
| **Plantillas relacionadas** | P02 (restricciones), P03 (roles), P04 (intensidad), P05 (inventario), P07 (ambición), P29 (decisión de *gate*), P31 (ficha de caso de uso). |

Reglas de cumplimentación:

- Sin G0 aprobado la iniciativa no está autorizada: no puede consumir presupuesto ni acceder a datos de producción (01 §6.2).
- Las cifras de esta carta son órdenes de magnitud y se marcan como *estimadas*. El compromiso de valor se formula en P08.
- "Sin dato" no es cero: si un campo no se conoce, se escribe "sin dato" y se indica cuándo se obtendrá.
- Las filas y textos marcados *(ejemplo ilustrativo)* son ficticios y deben borrarse antes de presentar la carta.

---

## 2. Identificación

| Campo | Contenido | Guía |
|---|---|---|
| Código de la iniciativa | | Formato IA-AAAA-NNN, asignado por el registro de iniciativas (T01). No se reutiliza. |
| Nombre de la iniciativa | | Nombre breve y descriptivo, sin siglas internas. |
| Área promotora | | Unidad de negocio que tiene la necesidad. |
| Versión del documento | | 0.1, 0.2… mientras es borrador; 1.0 cuando se presenta a G0. |
| Fecha | | DD-MM-AAAA. |
| Autor | | Nombre y rol en SEVEN-G. |
| Fase y estado | | Fase 0 · Registrada o En fase (03 §3.2). |
| Ubicación de la evidencia | | Enlace al repositorio documental de la compañía. |

---

## 3. Problema u oportunidad de negocio

| Campo | Contenido | Guía |
|---|---|---|
| Descripción comprensible | | Qué es y para qué se usará, en lenguaje para no especialistas (regla 10 de medición). Tres a cinco frases. Se reutiliza en P31. |
| Necesidad de negocio | | El problema o la oportunidad, no la tecnología. *Ejemplo ilustrativo: el tiempo de respuesta a consultas de clientes sobre el estado de sus pedidos supera las 24 horas en temporada alta.* |
| Proceso o decisión afectada | | Proceso de negocio, tarea o decisión concreta. |
| Personas afectadas | | Usuarios internos, clientes u otras personas externas, y cómo les afecta. |
| Por qué ahora | | Motivo de oportunidad o de urgencia. |
| Consecuencia de no actuar | | Qué ocurre si la iniciativa no se autoriza. |

---

## 4. Objetivo y encaje estratégico

| Campo | Contenido | Guía |
|---|---|---|
| Objetivo de la iniciativa | | Resultado de negocio que se persigue, en una frase. Las métricas y umbrales se fijan en P08. |
| Encaje con la tesis de IA | | Referencia a la tesis de IA y a la ambición aprobada en C2 para la esfera. |
| Esfera principal | | 01 Cliente · 02 Producto y servicio · 03 Personas · 04 Operaciones · 05 Datos · 06 Conocimiento · 07 Decisión · 08 Regulación, ética y responsabilidad · 09 Gobierno de la IA |
| Esfera secundaria | | Misma lista, o "ninguna". |
| Nivel de ambición preliminar | | Optimizar · Aumentar · Transformar. Se clasifica formalmente con P07 en la fase 1. |
| Tipo de uso de IA | | Iniciativa de IA · IA de terceros integrada en procesos · Uso corporativo de IA de propósito general · Regularización de uso no autorizado (01 §1.2). |
| Inclusión en la cartera (C3) | | Sí · No. Si no figura en la cartera priorizada, justificar por qué se propone fuera de ciclo. |
| Iniciativas relacionadas **(Enterprise)** | | Códigos IA-AAAA-NNN con dependencias o resultados compartidos. Si comparten valor, se declarará el reparto en P08 (regla 5). |

---

## 5. Alcance

| Campo | Contenido | Guía |
|---|---|---|
| Dentro del alcance | | Procesos, unidades, canales, geografías y usuarios incluidos. |
| Fuera del alcance | | Exclusiones expresas. Todo lo no incluido se entiende excluido. |
| Sistemas de IA previstos | | Nombre provisional y enlace a su ficha P05 (alta en el inventario). |
| Proveedores previstos | | Terceros que podrían aportar modelos, plataformas o servicios. Se evaluarán con P14 en la fase 3. |
| Supuestos iniciales | | Hechos que se dan por ciertos y que, si fallan, cambian la carta. |

---

## 6. Valor esperado preliminar

| Campo | Contenido | Guía |
|---|---|---|
| Tipo de valor previsto | | Eficiencia · Retorno · Riesgo evitado · Cumplimiento (taxonomía de 03 §3.3). Puede haber varios. |
| Hipótesis preliminar | | Una frase. *Ejemplo ilustrativo: un asistente de respuesta resolverá sin intervención humana una parte relevante de las consultas sobre pedidos.* |
| Orden de magnitud del valor | | Rango anual en euros, con estado *estimado*. Un potencial sin inversión, hipótesis y plazo no es un dato (regla 4). |
| Orden de magnitud de la inversión | | Rango en euros. |
| Plazo previsto hasta la primera evidencia de valor | | Meses hasta el piloto (fase 5). |

---

## 7. Presupuesto y plazos autorizados

| Campo | Contenido | Guía |
|---|---|---|
| Presupuesto autorizado en G0 | | Tope de gasto hasta el siguiente punto de decisión (habitualmente G2 o G3). No es el presupuesto total. |
| Umbral de inversión aprobado en C2 | | Si la inversión total prevista lo supera, se aplica intensidad Enterprise (P04, criterio 8). |
| Fechas objetivo de G1 y G2 | | Coherentes con los plazos de referencia por fase aprobados en C2 (03 §3.6). |
| Categorías de coste previstas **(Enterprise)** | | Licencias · consumo de modelos · cómputo e infraestructura · datos · personas de construcción · personas de operación · proveedores y servicios · control y cumplimiento · adopción y formación. |
| Origen de la financiación **(Enterprise)** | | Presupuesto del área, presupuesto de cartera u otro. |

---

## 8. Responsables y órganos

| Rol | Persona y cargo | Guía |
|---|---|---|
| Patrocinador de IA | | Responde del valor y de la inversión. |
| Responsable de producto de IA | | Responde de la hipótesis de valor y de la adopción. |
| Responsable técnico de IA | | Puede designarse en la fase 3 si aún no se conoce la solución. |
| Responsable de operación de IA | | Puede designarse antes de la fase 4. |
| Responsable de riesgos de IA | | De segunda línea. No puede formar parte del equipo que construye. |
| Auditor de IA **(Enterprise)** | | Independiente del equipo y sin dependencia jerárquica del patrocinador. |
| Órgano que decide G0 | | Patrocinador (Lite) · Comité de IA (Enterprise). |

El detalle, las incompatibilidades y los sustitutos se registran en P03.

---

## 9. Restricciones, intensidad e inventario

| Campo | Contenido | Guía |
|---|---|---|
| Restricciones principales | | Resumen de P02: regulatorias, éticas, de datos, presupuestarias, de plazo y tecnológicas. |
| Líneas rojas | | Lo que la iniciativa no hará en ningún caso. |
| Intensidad determinada | | Lite · Enterprise, con el criterio que la determina (P04). |
| Clasificación regulatoria preliminar | | Prohibido · Alto riesgo · Obligaciones de transparencia · Riesgo mínimo · Fuera de ámbito · Pendiente de clasificar. En fase 0 suele ser "Pendiente de clasificar"; se resuelve en P11. |
| Alta en el inventario | | Referencia de la ficha P05 y fecha de alta. |

---

## 10. Riesgos y dependencias iniciales

| Nº | Riesgo o dependencia | Tipo | Responsable | Tratamiento previsto |
|---|---|---|---|---|
| 1 | | Riesgo · Dependencia | | |
| 2 | | | | |
| *(ejemplo ilustrativo)* | Las respuestas del asistente podrían contener información incorrecta sobre plazos de entrega. | Riesgo | Responsable de producto | Se valorará en P12; en el piloto, revisión humana de una muestra. |

La valoración formal de riesgos se hace en la fase 3 con P12. Aquí solo se anotan los conocidos para que el decisor de G0 los tenga presentes.

---

## 11. Condiciones de la autorización

| Campo | Contenido | Guía |
|---|---|---|
| Qué autoriza G0 | | Actividades, presupuesto y accesos permitidos hasta el siguiente *gate*. |
| Qué no autoriza | | Por ejemplo, acceso a datos de producción o contratación de proveedores antes de G3. |

| Nº | Condición | Plazo | Responsable | Estado |
|---|---|---|---|---|
| 1 | | | | Abierta · Cumplida · Vencida |
| *(ejemplo ilustrativo)* | Designar responsable técnico antes de iniciar la fase 3. | 30 días | Patrocinador | Abierta |

Una condición vencida sin cumplir convierte el resultado en **Iterar** (01 §7.4). La decisión se registra en P29.

---

## 12. Criterios de calidad

El verificador comprueba, al menos, lo siguiente. Los criterios formales de G0 están en el documento 21 (ver criterios G0.xx).

| # | Comprobación | Estado |
|---|---|---|
| 1 | La necesidad está formulada en términos de negocio y no de tecnología. | Cumple · No cumple · No aplica · Pendiente |
| 2 | Existe descripción comprensible para no especialistas. | |
| 3 | La esfera, la ambición preliminar y el tipo de uso usan la taxonomía controlada. | |
| 4 | El encaje con la tesis de IA y con la cartera está justificado. | |
| 5 | El alcance incluye exclusiones expresas. | |
| 6 | Las cifras tienen estado *estimado* y no se presentan como compromiso. | |
| 7 | El presupuesto autorizado tiene tope y punto de decisión. | |
| 8 | Hay patrocinador comprometido y los roles asignados figuran en P03 sin incompatibilidades. | |
| 9 | P02, P04 y P05 existen y son coherentes con esta carta. | |
| 10 | El documento tiene autor, fecha y versión, y existía antes de solicitar el *gate*. | |

---

## 13. Aprobación y verificación

| Función | Rol en SEVEN-G | Nombre y cargo | Fecha | Firma o referencia |
|---|---|---|---|---|
| Elabora | Responsable de producto de IA | | | |
| Responde del contenido | Patrocinador de IA | | | |
| Verifica | Oficina de IA (Lite) · Auditor de IA (Enterprise) | | | |
| Decide | Patrocinador de IA (Lite) · Comité de IA (Enterprise) | | | |

Separación de funciones: quien verifica no ha elaborado la carta; la fecha de verificación es anterior a la de decisión; en Enterprise el patrocinador presenta, pero no decide sobre su propia iniciativa.

---

## 14. Control de versiones

**Documento cumplimentado**

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| | | | |

**Plantilla**

| Versión | Fecha | Cambios |
|---|---|---|
| 0.1 | 16-09-2026 | Primera versión. Estructura alineada con 01 §6.2 y con la taxonomía controlada de 03 §3.3. |
