# Ficha de inventario del sistema de IA

**Da de alta y mantiene actualizado cada sistema de IA en el inventario de la compañía, con su tipo de uso, su clasificación, su rol regulatorio y sus responsables.**

| | |
|---|---|
| Documento | Plantilla P05 · Ficha de inventario del sistema de IA |
| Versión | 0.1 (borrador de trabajo) |
| Fecha | 16-09-2026 |
| Autor | Fernando García · SEACHAD |
| Estado | Borrador para revisión. |

---

> **Aviso legal y exención de responsabilidad.** SEVEN-G es un marco metodológico de referencia que se ofrece «tal cual» y con fines exclusivamente informativos. No constituye asesoramiento jurídico, regulatorio, financiero ni profesional, ni garantiza el cumplimiento de ninguna norma. Las referencias a regulación general (como el Reglamento Europeo de IA, el RGPD, DORA o NIS2), a normas técnicas y a regulación específica de cada sector o jurisdicción pueden ser incompletas, no aplicar a un caso concreto o quedar desactualizadas por cambios normativos, interpretaciones o criterios de las autoridades posteriores a su fecha de consulta. **Cada organización que use SEVEN-G es la única responsable de identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio**, con el asesoramiento cualificado que corresponda. El autor y SEACHAD no asumen responsabilidad alguna por el uso que se haga de este contenido ni por las decisiones que se adopten con él. Los datos, cifras, compañías y casos de los ejemplos son ficticios o ilustrativos.

## 1. Instrucciones de uso

| Aspecto | Indicación |
|---|---|
| **Cuándo se usa** | En la fase 0 se da de alta el sistema previsto. Se completa en las fases 3 a 5, se actualiza en cada R6 y en cada cambio relevante, y se cierra con la retirada. También se usa en C1 para inventariar sistemas existentes, uso corporativo de IA de propósito general y usos no autorizados detectados. |
| **Quién la rellena** | El responsable de producto de IA (o el responsable del área usuaria en uso corporativo). La oficina de IA mantiene el inventario. |
| **Quién la verifica** | Lite: oficina de IA. Enterprise: auditor de IA. |
| **Quién decide** | No es una decisión: es un registro. El alta es evidencia obligatoria de G0. |
| **Gate en que se revisa** | G0 (alta), G3 (clasificación completa), G5 (datos de producción), R6 (vigencia) y G7 (retirada). |
| **Herramienta** | T02 · Inventario de sistemas de IA (módulo de T01). Estructura de detalle en el documento 32. |
| **Lite frente a Enterprise** | Lite puede omitir los campos marcados **(Enterprise)**. Las etiquetas de la taxonomía controlada son obligatorias en ambas. |

Reglas de cumplimentación:

- **Una ficha por sistema de IA.** Una iniciativa puede tener varios sistemas y un sistema puede servir a varias iniciativas.
- Los campos de clasificación usan **literalmente** la taxonomía controlada de 03 §3.3.
- "Sin dato" no es cero: lo que todavía no se conoce se marca "sin dato" con la fase en que se completará.

---

## 2. Identificación de la ficha

| Campo | Contenido | Guía |
|---|---|---|
| Código del sistema | | Código persistente asignado por el inventario según el documento 32. |
| Nombre del sistema | | Nombre funcional, no el nombre comercial del producto. |
| Iniciativas asociadas | | Códigos IA-AAAA-NNN. Vacío solo en uso corporativo o uso no autorizado. |
| Versión de la ficha | | |
| Fecha de alta en el inventario | | DD-MM-AAAA. |
| Fecha de última actualización | | DD-MM-AAAA. |
| Autor de la última actualización | | Nombre y rol. |

---

## 3. Descripción

| Campo | Contenido | Guía |
|---|---|---|
| Descripción comprensible | | Qué hace y para qué se usa, en lenguaje para no especialistas (regla 10). |
| Finalidad prevista | | Uso concreto para el que se diseña o se adquiere el sistema, con sus límites. Es la base de la clasificación regulatoria. |
| Usos no previstos o excluidos | | Usos que no deben hacerse con el sistema. |
| Área usuaria | | |
| Usuarios | | Perfiles y número aproximado. |
| Situación del sistema | | Previsto · En construcción o integración · En piloto · En producción · Suspendido · Retirado. Lista propuesta, a confirmar en el documento 32. |
| Fase y estado de la iniciativa | | Fase 0–7 y estado (03 §3.2): Registrada · En fase · Pendiente de gate · En espera · En producción · Pendiente de G7 · Parada · Retirada. |
| Fecha de puesta en producción | | |

---

## 4. Tipo de uso y clasificación

| Campo | Contenido | Guía |
|---|---|---|
| Tipo de uso de IA | | Iniciativa de IA · IA de terceros integrada en procesos · Uso corporativo de IA de propósito general · Uso no autorizado (01 §1.2). |
| Esfera principal | | 01 Cliente · 02 Producto y servicio · 03 Personas · 04 Operaciones · 05 Datos · 06 Conocimiento · 07 Decisión · 08 Regulación, ética y responsabilidad · 09 Gobierno de la IA |
| Esfera secundaria | | Misma lista o "ninguna". |
| Nivel de ambición | | Optimizar · Aumentar · Transformar. |
| Intensidad | | Lite · Enterprise (P04). |
| Tecnología | | ML predictivo · IA generativa · Agente · Procesamiento de lenguaje y documentos · Visión · Optimización · IA de terceros embebida · Reglas (no es IA). Puede marcarse más de una. |
| Exposición | | Interna · Empleados · Clientes de forma indirecta · Clientes o personas externas de forma directa. |
| Nivel de autonomía | | A0 Asistencia · A1 Recomendación · A2 Actuación supervisada · A3 Actuación autónoma. |
| Clasificación regulatoria | | Prohibido · Alto riesgo · Obligaciones de transparencia · Riesgo mínimo · Fuera de ámbito · Pendiente de clasificar (P11). |
| Tipo de valor | | Eficiencia · Retorno · Riesgo evitado · Cumplimiento. |

Si la tecnología es "Reglas (no es IA)", se documenta el motivo y se valora si debe mantenerse en el inventario.

---

## 5. Rol de la compañía según el Reglamento Europeo de IA

Marque todos los roles que correspondan. La determinación final se valida en P11 con criterio jurídico. *Este documento no constituye asesoramiento jurídico.*

| Rol | ¿Aplica? | Justificación | Guía |
|---|---|---|---|
| Proveedor | Sí · No | | Desarrolla el sistema, o lo hace desarrollar, y lo introduce en el mercado o lo pone en servicio con su nombre o marca, incluido para uso propio. |
| Responsable del despliegue | Sí · No | | Utiliza bajo su autoridad un sistema de IA en una actividad profesional. |
| Importador | Sí · No | | Introduce en el mercado de la Unión un sistema con nombre o marca de una persona establecida fuera de la Unión. |
| Distribuidor | Sí · No | | Comercializa el sistema sin ser proveedor ni importador. |
| Representante autorizado **(Enterprise)** | Sí · No | | Mandato de un proveedor establecido fuera de la Unión. |
| Fabricante del producto **(Enterprise)** | Sí · No | | Integra el sistema en un producto propio sujeto a legislación de armonización. |

| Campo | Contenido | Guía |
|---|---|---|
| Posible cambio de rol a proveedor | | Sí · No. Revisar si la compañía pone su nombre o marca, modifica sustancialmente el sistema o cambia su finalidad prevista. |
| Modelo de IA de uso general subyacente | | Sí · No. Si sí, proveedor, modelo y versión. |
| Registro en la base de datos de la UE **(Enterprise)** | | Sí · No · No aplica. Solo para los sistemas y roles que lo exijan según P11. |

---

## 6. Datos

| Campo | Contenido | Guía |
|---|---|---|
| Fuentes de datos | | Sistemas o proveedores de origen. |
| Datos personales | | Sí · No. Categorías de interesados. |
| Categorías especiales | | Sí · No. Cuáles. |
| Información confidencial crítica | | Sí · No. |
| Referencia al registro de actividades de tratamiento | | Tratamiento en el que se integra. |
| Ubicación del tratamiento | | País o región de alojamiento y de proceso. |
| Transferencias internacionales | | Sí · No. Destino y garantía. |
| Uso de datos por el proveedor para entrenamiento | | Prohibido por contrato · Permitido con condiciones · Sin dato. |
| Conservación de registros **(Enterprise)** | | Qué entradas, salidas y registros se conservan y durante cuánto tiempo. |

---

## 7. Proveedores y componentes

| Proveedor | Servicio o componente | Nivel de exigencia | Contrato | Evaluación |
|---|---|---|---|---|
| | | N1 Estándar · N2 Reforzado · N3 Crítico | Referencia y vencimiento | P14 y fecha |
| *(ejemplo ilustrativo)* Proveedor X | Modelo de lenguaje por API | N2 Reforzado | CT-0000, vence 30-06-2028 | P14 de 10-11-2026, Conforme con observaciones |

---

## 8. Responsables

| Rol | Persona y cargo |
|---|---|
| Responsable de producto de IA | |
| Responsable técnico de IA | |
| Responsable de operación de IA | |
| Responsable de riesgos de IA | |
| Propietario de negocio del sistema **(Enterprise)** | |

En uso corporativo de IA de propósito general se indica, como mínimo, el responsable del servicio y el responsable de riesgos.

---

## 9. Cumplimiento y control

| Campo | Contenido | Guía |
|---|---|---|
| Clasificación regulatoria validada | | Fecha de P11 y persona con criterio jurídico que la valida. |
| Evaluación de impacto en protección de datos | | Realizada (fecha) · No requerida (motivo) · Pendiente. |
| Evaluación de impacto en derechos fundamentales | | Realizada (fecha) · No requerida (motivo) · Pendiente. |
| Obligaciones de transparencia implantadas | | Qué se informa y dónde. |
| Supervisión humana | | Resumen y referencia a P17. |
| Nivel de riesgo residual principal | | Bajo · Medio · Alto · Crítico (P12). |
| No conformidades abiertas | | Códigos NC-AAAA-NNN. |
| Incidentes en los últimos 12 meses **(Enterprise)** | | Códigos INC-AAAA-NNN y severidad S1–S4. |
| Última revisión de continuidad y próxima | | Fechas de R6. |

---

## 10. Uso no autorizado

Rellenar solo si el tipo de uso es "Uso no autorizado".

| Campo | Contenido | Guía |
|---|---|---|
| Fecha y medio de detección | | Controles técnicos, auditoría, comunicación interna. |
| Herramienta y usuarios | | Herramienta usada, áreas y número aproximado de usuarios. |
| Datos que pudieron exponerse | | Tipo de datos introducidos. |
| No conformidad asociada | | NC-AAAA-NNN. |
| Decisión de regularización | | Autorización · Sustitución · Bloqueo. |
| Fecha de cierre | | |

---

## 11. Retirada

| Campo | Contenido | Guía |
|---|---|---|
| Fecha de retirada | | |
| Motivo | | Sin valor plausible · Hipótesis refutada · Datos insuficientes · Inviable técnicamente · Coste superior al valor · Riesgo inaceptable · Regulación · Sin adopción · Sustituida por otra solución · Cambio de prioridad estratégica. |
| Sustituto | | Sistema o proceso que lo sustituye. |
| Tratamiento de datos y modelos | | Eliminación, conservación o transferencia. Referencia a P30. |

---

## 12. Criterios de calidad

Los criterios formales están en el documento 21 (ver criterios G0.xx y R6.xx) y el detalle del inventario en el documento 32.

| # | Comprobación | Estado |
|---|---|---|
| 1 | Existe una ficha por cada sistema de la iniciativa. | Cumple · No cumple · No aplica · Pendiente |
| 2 | Las etiquetas usan literalmente la taxonomía controlada. | |
| 3 | La finalidad prevista es concreta y tiene límites. | |
| 4 | El rol regulatorio está justificado y es coherente con P11. | |
| 5 | Datos personales, categorías especiales y transferencias están identificados. | |
| 6 | Proveedores con nivel de exigencia y evaluación enlazada. | |
| 7 | Responsables asignados coherentes con P03. | |
| 8 | La fecha de última actualización es posterior al último cambio relevante. | |

---

## 13. Aprobación y verificación

| Función | Rol en SEVEN-G | Nombre y cargo | Fecha | Firma o referencia |
|---|---|---|---|---|
| Elabora | Responsable de producto de IA | | | |
| Registra en el inventario | Oficina de IA | | | |
| Verifica | Oficina de IA (Lite) · Auditor de IA (Enterprise) | | | |

Separación de funciones: si la oficina de IA ha elaborado la ficha, verifica el auditor de IA o el responsable de riesgos.

---

## 14. Control de versiones

**Documento cumplimentado**

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| | | | |

**Plantilla**

| Versión | Fecha | Cambios |
|---|---|---|
| 0.1 | 16-09-2026 | Primera versión. Campos coherentes con 03 §3.3 y §4, los cuatro tipos de uso de 01 §1.2 y los roles del Reglamento Europeo de IA. |
