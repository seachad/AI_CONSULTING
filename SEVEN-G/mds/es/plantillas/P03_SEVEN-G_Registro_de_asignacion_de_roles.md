# Registro de asignación de roles

**Designa a las personas que asumen cada rol de la iniciativa y demuestra que se respetan la separación de funciones y las incompatibilidades.**

| | |
|---|---|
| Documento | Plantilla P03 · Registro de asignación de roles |
| Versión | 0.1 (borrador de trabajo) |
| Fecha | 16-09-2026 |
| Autor | Fernando García Varela |
| Estado | Borrador para revisión. |

---

> **Aviso legal y exención de responsabilidad.** SEVEN-G es un marco metodológico de referencia que se ofrece «tal cual» y con fines exclusivamente informativos. No constituye asesoramiento jurídico, regulatorio, financiero ni profesional, ni garantiza el cumplimiento de ninguna norma. Las referencias a regulación general (como el Reglamento Europeo de IA, el RGPD, DORA o NIS2), a normas técnicas y a regulación específica de cada sector o jurisdicción pueden ser incompletas, no aplicar a un caso concreto o quedar desactualizadas por cambios normativos, interpretaciones o criterios de las autoridades posteriores a su fecha de consulta. **Cada organización que use SEVEN-G es la única responsable de identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio**, con el asesoramiento cualificado que corresponda. Esta metodología es una ayuda genérica y gratuita, compartida con la comunidad para que nadie tenga que empezar desde cero; cada persona u organización puede y debe adaptarla a su propio uso. No debe entenderse que sus partes jurídicamente sensibles hayan sido revisadas por una asesoría jurídica: esas revisiones, para cada empresa o sector, son responsabilidad última de la empresa, el consultor o la organización que la use. Aunque se procura mantenerla al día, alguna norma puede haber cambiado sin que se recoja aquí. En la máxima medida permitida por la ley, el autor no asume responsabilidad alguna por los efectos de su aplicación en ninguna organización ni por su aplicabilidad completa. La metodología no otorga certificación de ningún tipo. El autor no asume responsabilidad alguna por el uso que se haga de este contenido ni por las decisiones que se adopten con él. Los datos, cifras, compañías y casos de los ejemplos son ficticios o ilustrativos.

## 1. Instrucciones de uso

| Aspecto | Indicación |
|---|---|
| **Cuándo se usa** | En la fase 0, antes de G0. Se actualiza cada vez que cambia una persona, cuando cambia la intensidad y antes de cada *gate* en el que intervengan roles no asignados todavía. |
| **Quién la rellena** | El responsable de producto de IA, con la oficina de IA. |
| **Quién la verifica** | Lite: oficina de IA. Enterprise: auditor de IA. Si la oficina de IA ha elaborado el registro, verifica el auditor de IA. |
| **Quién decide** | Se aprueba con G0: patrocinador (Lite) · comité de IA (Enterprise). La designación del auditor de IA la hace la tercera línea, no el patrocinador. |
| **Gate en que se revisa** | G0 · Autorización. En todos los *gates* se comprueba que el verificador y el decisor registrados son los de este documento. |
| **Herramienta** | T01 · Registro de iniciativas (bloque *Responsables* de la ficha). |
| **Lite frente a Enterprise** | Lite puede omitir los campos marcados **(Enterprise)**. En Lite el auditor de IA interviene por muestreo, pero debe estar identificado quién lo haría. |

Reglas de cumplimentación:

- Nadie aprueba su propio trabajo y quien construye no controla (01 §8).
- Una persona puede asumir más de un rol solo si la tabla de incompatibilidades lo permite (01 §8.2).
- Cada persona acepta expresamente su rol, con fecha.

---

## 2. Identificación

| Campo | Contenido | Guía |
|---|---|---|
| Código de la iniciativa | | IA-AAAA-NNN. |
| Nombre de la iniciativa | | |
| Intensidad aplicable | | Lite · Enterprise (P04). Si cambia, se revisa este registro. |
| Nivel de ambición | | Optimizar · Aumentar · Transformar. En Transformar interviene el consejo en G2 y G7. |
| Versión del documento | | |
| Fecha | | DD-MM-AAAA. |
| Autor | | Nombre y rol. |

---

## 3. Roles de la iniciativa

| Rol | Función | Persona | Cargo y unidad | Dedicación prevista | Fecha de aceptación | Sustituto **(Enterprise)** |
|---|---|---|---|---|---|---|
| Patrocinador de IA | Decide | | | | | |
| Responsable de producto de IA | Construye | | | | | |
| Responsable técnico de IA | Construye | | | | | |
| Responsable de operación de IA | Construye | | | | | |
| Responsable de riesgos de IA | Controla | | | | | |
| Auditor de IA | Controla | | | | | |
| *(ejemplo ilustrativo)* Responsable de producto de IA | Construye | Persona A | Responsable de experiencia de cliente | 30 % | 02-10-2026 | Persona B |

Guía de la dedicación: porcentaje de jornada o días al mes durante la fase en curso. Si un rol se asignará más adelante, indicar la fase en la que se designará.

---

## 4. Comprobación de incompatibilidades

Marque si la misma persona asume ambos roles. Cualquier "Sí" en una combinación incompatible impide superar G0.

| Combinación | Regla (01 §8.2) | ¿Misma persona? | Resultado |
|---|---|---|---|
| Patrocinador y responsable de producto | Compatible solo en Lite | Sí · No | Compatible · Incompatible |
| Patrocinador y responsable técnico | Compatible solo en Lite | | |
| Patrocinador y responsable de operación | Compatible solo en Lite | | |
| Patrocinador y responsable de riesgos | Incompatible | | |
| Patrocinador y auditor | Incompatible | | |
| Producto, técnico u operación entre sí | Compatible | | |
| Producto, técnico u operación y responsable de riesgos | Incompatible | | |
| Producto, técnico u operación y auditor | Incompatible | | |
| Responsable de riesgos y auditor | Incompatible en Enterprise | | |

Comprobaciones de independencia:

| Comprobación | Respuesta | Guía |
|---|---|---|
| El auditor de IA no depende jerárquicamente del patrocinador. | Sí · No | Indicar la línea jerárquica del auditor. |
| El auditor de IA no participa en el diseño, construcción u operación. | Sí · No | |
| El responsable de riesgos no forma parte del equipo que construye. | Sí · No | |
| Si el responsable de riesgos elabora evidencias de la fase 3 (P11, P12, P13), la verificación de G3 en Lite la realiza otra persona. | Sí · No · No aplica | Evita que el responsable de riesgos verifique su propio trabajo (01 §7.4, regla 1). |

---

## 5. Verificación y decisión por *gate*

Referencia: 01 §7.5. Indique la persona u órgano concreto que actuará en cada puerta.

| Puerta | Verifica (Lite · Enterprise) | Decide (Lite · Enterprise) | Designación concreta |
|---|---|---|---|
| G0 · Autorización | Oficina de IA · Auditor de IA | Patrocinador · Comité de IA | |
| G1 · Oportunidad | Oficina de IA · Auditor de IA | Patrocinador · Patrocinador, informando al comité | |
| G2 · Hipótesis | Oficina de IA · Auditor de IA | Patrocinador · Comité de IA | |
| G3 · Viabilidad | Responsable de riesgos · Auditor de IA | Patrocinador con conformidad de riesgos · Comité de IA | |
| G4 · Diseño | Oficina de IA · Auditor de IA | Responsable técnico con conformidad de riesgos · Comité de IA | |
| G5 · Puesta en producción | Responsable de riesgos · Auditor de IA | Patrocinador con conformidad de riesgos · Comité de IA tras firma multinivel | |
| R6 · Continuidad | Oficina de IA · Auditor de IA | Patrocinador · Comité de IA | |
| G7 · Escalado o retirada | Oficina de IA · Auditor de IA | Patrocinador · Comité de IA | |

En iniciativas de **Transformar**, además, el consejo o su comisión delegada aprueba en G2 y en G7 cuando se decide escalar.

**Firmantes de la puesta en producción (Enterprise)**

| Firma con capacidad de veto | Persona y cargo |
|---|---|
| Responsable técnico | |
| Riesgos y cumplimiento | |
| Seguridad de la información | |
| Protección de datos | |

---

## 6. Participantes consultados e informados

| Función | Persona y cargo | Momento de intervención | Tipo |
|---|---|---|---|
| Delegado de protección de datos | | Fases 0, 3, 4 y 5 | Consultado |
| Seguridad de la información | | Fases 3, 4 y 5 | Consultado |
| Asesoría jurídica y cumplimiento | | Fases 0 y 3 | Consultado |
| Personas y organización | | Fases 3, 4 y 7 | Consultado |
| Control de gestión | | Fases 2, 5, 6 y 7 (validación del valor) | Consultado |
| Representación de las personas trabajadoras **(Enterprise)** | | Cuando proceda | Informado |
| Proveedores | | Fases 3 a 6 | Informado |

---

## 7. Matriz de responsabilidades por fase **(Enterprise)**

Se parte de 01 §8.4. Cualquier cambio respecto de la matriz de referencia debe justificarse y no puede romper la separación de funciones.

| Fase | Patrocinador | Producto | Técnico | Operación | Riesgos | Auditor | Cambio y justificación |
|---|---|---|---|---|---|---|---|
| 0 · Contexto | A | R | C | I | C | V | |
| 1 · Descubrimiento | A | R | C | I | C | V | |
| 2 · Hipótesis de valor | A | R | C | I | C | V | |
| 3 · Viabilidad y riesgo | A | R | R | C | R | V | |
| 4 · Diseño | I | C | A/R | C | C | V | |
| 5 · Entrega y validación | I | A | R | C | C | V | |
| 6 · Operación | I | C | C | A/R | C | V | |
| 7 · Evolución o retirada | A | R | C | C | C | V | |

**A** responde del resultado · **R** realiza · **C** consultado · **I** informado · **V** verifica.

---

## 8. Declaración de conflictos de interés

| Persona | Rol | ¿Conflicto de interés? | Descripción | Medida adoptada |
|---|---|---|---|---|
| | | Sí · No | | |
| *(ejemplo ilustrativo)* Persona C | Responsable de riesgos | Sí | Participó en la selección del proveedor en otra iniciativa. | Se abstiene en la conformidad de P14; la emite su sustituto. |

---

## 9. Registro de cambios de asignación

| Fecha | Rol | Persona anterior | Persona nueva | Motivo | Aprobado por |
|---|---|---|---|---|---|
| | | | | | |

Cada cambio genera un evento en el registro de iniciativas (03 §3.3).

---

## 10. Criterios de calidad

Los criterios formales de G0 están en el documento 21 (ver criterios G0.xx).

| # | Comprobación | Estado |
|---|---|---|
| 1 | Los seis roles están asignados o tienen fase prevista de designación. | Cumple · No cumple · No aplica · Pendiente |
| 2 | No hay combinaciones incompatibles según la intensidad aplicable. | |
| 3 | El auditor de IA es independiente del equipo y del patrocinador. | |
| 4 | Cada persona ha aceptado su rol con fecha. | |
| 5 | Verificador y decisor de cada *gate* están identificados. | |
| 6 | En Enterprise, están identificados los firmantes de la puesta en producción. | |
| 7 | Se han declarado los conflictos de interés. | |

---

## 11. Aprobación y verificación

| Función | Rol en SEVEN-G | Nombre y cargo | Fecha | Firma o referencia |
|---|---|---|---|---|
| Elabora | Responsable de producto de IA | | | |
| Verifica | Oficina de IA (Lite) · Auditor de IA (Enterprise) | | | |
| Decide | Patrocinador de IA (Lite) · Comité de IA (Enterprise), con G0 | | | |

Separación de funciones: nadie verifica un registro en el que figura con un rol incompatible con la verificación.

---

## 12. Control de versiones

**Documento cumplimentado**

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| | | | |

**Plantilla**

| Versión | Fecha | Cambios |
|---|---|---|
| 0.1 | 16-09-2026 | Primera versión. Traslada a formato de registro los roles, incompatibilidades, reparto de verificación y decisión y responsabilidades por fase de 01 §7.5 y §8. |
