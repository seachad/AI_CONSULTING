# Declaración de aplicabilidad de ISO/IEC 42001

**Recoge, para cada control del anexo A de ISO/IEC 42001, si aplica a la compañía, por qué, dónde lo cubre SEVEN-G, con qué evidencia y en qué estado de implantación está.**

| | |
|---|---|
| Documento | Plantilla P74 · Declaración de aplicabilidad de ISO/IEC 42001 |
| Versión | 0.1 (borrador de trabajo) |
| Fecha | 25-09-2026 |
| Autor | Fernando García Varela |
| Estado | Borrador para revisión. Debe revisarla una asesoría jurídica o un auditor de ISO/IEC 42001 antes de ofrecerla a una compañía. |

---

> **Aviso legal y exención de responsabilidad.** SEVEN-G es un marco metodológico de referencia que se ofrece «tal cual» y con fines exclusivamente informativos. No constituye asesoramiento jurídico, regulatorio, financiero ni profesional, ni garantiza el cumplimiento de ninguna norma. Las referencias a regulación general (como el Reglamento Europeo de IA, el RGPD, DORA o NIS2), a normas técnicas y a regulación específica de cada sector o jurisdicción pueden ser incompletas, no aplicar a un caso concreto o quedar desactualizadas por cambios normativos, interpretaciones o criterios de las autoridades posteriores a su fecha de consulta. **Cada organización que use SEVEN-G es la única responsable de identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio**, con el asesoramiento cualificado que corresponda. El autor no asume responsabilidad alguna por el uso que se haga de este contenido ni por las decisiones que se adopten con él. Los datos, cifras, compañías y casos de los ejemplos son ficticios o ilustrativos.

> **Advertencias de esta plantilla.** (1) **No reproduce la norma**: identifica los controles del anexo A solo por su código y resume su tema en términos propios; la declaración de la compañía **debe cotejarse con el texto de ISO/IEC 42001 adquirido** por ella (34 §4.2). (2) **SEVEN-G no certifica** ni esta plantilla acredita la conformidad con la norma (01 §14; documento 93): la certificación de un sistema de gestión de IA solo la emite una entidad de certificación acreditada (38 §12). (3) La columna de subcategorías del NIST AI RMF es orientativa: la propone SEVEN-G a partir de 34 §5.4 y de la correspondencia AI RMF ↔ ISO/IEC 42001 del AIRC, hecha sobre el borrador final de la norma.

> **Por qué importa.** ISO/IEC 42001 exige que la organización declare qué controles aplica, cuáles excluye y por qué (cláusula 6.1.3). Es la pieza que convierte «alineada con 42001» en algo que un auditor puede verificar: sin ella, la compañía no puede demostrar que el tratamiento de sus riesgos de IA es completo ni preparar una certificación. Apoyarla en SEVEN-G evita construir un segundo sistema de evidencias: cada control remite a la plantilla, el documento o la herramienta donde la compañía ya deja la prueba.

## 1. Instrucciones de uso

| Aspecto | Indicación |
|---|---|
| **Cuándo se usa** | En **C2 · Dirección**, al definir el alcance del sistema de gestión de IA, y cada vez que cambian ese alcance, el tratamiento de riesgos o los controles; se revisa en **C5**. Solo si la compañía usa ISO/IEC 42001 como referencia o aspira a certificarse. |
| **Quién la rellena** | La oficina de IA con el responsable de riesgos de IA, que propone la aplicabilidad y la justificación de cada control. |
| **Quién la verifica** | El auditor de IA o la tercera línea, que comprueba las evidencias y el estado de implantación (38 §12.1). Una auditoría de certificación la hace, si procede, la entidad acreditada. |
| **Quién decide o aprueba** | La alta dirección aprueba la declaración, como parte del tratamiento de riesgos de la cláusula 6.1.3; se informa al comité de IA y a la comisión delegada. |
| **Etapa del ciclo corporativo** | C2 (aprobación), C4 (seguimiento del estado de implantación) y C5 (revisión). |
| **Herramienta** | No tiene aplicación propia en la versión 0.x. El estado de las evidencias sale del registro de iniciativas (T01), de la verificación de *gates* (T03) y de los registros que cita cada fila. |
| **Documento de referencia** | Documento 34 §4 (ISO/IEC 42001: cláusulas 4 a 10 y anexo A por grupos) y §5.4 (perfil del AI RMF); documento 38 §12 (relación con ISO/IEC 42001 y con la certificación). |
| **Lite frente a Enterprise** | La declaración es la misma. En alcance Lite puede agruparse la evidencia por proceso en lugar de por iniciativa. |

Reglas de cumplimentación:

- **Aplicable**: Sí · No. Excluir un control exige una justificación concreta (por ejemplo, la compañía no desarrolla sistemas y solo los usa); «no nos afecta» no es justificación.
- **Estado de implantación**: Implantado · Implantado en parte · Planificado · No iniciado. «Implantado» exige evidencia existente, aprobada y aplicada en la fecha de la declaración, con el mismo criterio que 11 §4.5.
- La columna «Dónde lo cubre SEVEN-G» viene propuesta; la compañía la ajusta a su implantación real y a sus propios procedimientos.
- Una celda sin dato se deja en blanco: nunca se da un control por implantado sin evidencia.

---

## 2. Identificación

| Campo | Contenido | Guía |
|---|---|---|
| Organización y alcance del sistema de gestión de IA | | El alcance aprobado (cláusula 4.3): unidades, sistemas, procesos y papel respecto a la IA (proveedor, responsable del despliegue, usuario). |
| Edición de la norma cotejada | | ISO/IEC 42001:2023 u otra posterior; la compañía indica que ha cotejado la declaración con el texto adquirido. |
| Identificador y versión de la declaración | | Formato propuesto DA-AAAA-NN. |
| Fecha | | DD-MM-AAAA. |
| Responsable de la declaración | | Oficina de IA. |
| Evaluación de riesgos y plan de tratamiento de referencia | | Documento 33; P12 y P13 de las iniciativas; P35 (apetito de riesgo). |
| Perfil del AI RMF de referencia, si existe | | P73, con su fecha de corte. |

---

## 3. Declaración por control del anexo A

Una fila por control. El tema es un resumen propio del objetivo del control; el texto que obliga es el de la norma.

| Control | Tema (resumen propio) | Aplicable | Justificación | Dónde lo cubre SEVEN-G | Evidencia | Estado de implantación | Subcategorías del AI RMF relacionadas (orientativo) |
|---|---|---|---|---|---|---|---|
| A.2.2 | Política de IA documentada | | | Documento 31; 13 §15; P35 | | | GOVERN 1.1, GOVERN 1.2 |
| A.2.3 | Coherencia de la política de IA con las demás políticas | | | Documentos 31 y 35; 01 §13 | | | GOVERN 1.2, MEASURE 2.7, MEASURE 2.10 |
| A.2.4 | Revisión periódica de la política de IA | | | C5; P37 | | | GOVERN 1.5 |
| A.3.2 | Roles y responsabilidades sobre la IA | | | 01 §8; documento 30; P03, P38 | | | GOVERN 2.1, GOVERN 3.2 |
| A.3.3 | Cauce para comunicar preocupaciones | | | Documento 31; documento 37 | | | GOVERN 4.3, MEASURE 3.3 |
| A.4.2 | Documentación de los recursos de cada sistema | | | P10, P15 | | | GOVERN 1.6, MAP 2.1 |
| A.4.3 | Recursos de datos | | | P16, P64; documento 51 | | | GOVERN 1.6, MAP 2.3 |
| A.4.4 | Recursos de herramientas | | | P15, P54; documento 53 | | | GOVERN 1.6, MANAGE 3.2 |
| A.4.5 | Recursos de sistemas y de cómputo | | | P15, P63; documento 42 | | | GOVERN 1.6, MEASURE 2.12 |
| A.4.6 | Personas y competencias | | | P03, P20, P45; documento 50 | | | GOVERN 3.1, MAP 3.4 |
| A.5.2 | Proceso de evaluación de impacto | | | P11; 32 §6 | | | MAP 1.1, MAP 5.1 |
| A.5.3 | Documentación de las evaluaciones de impacto | | | P11, P47, P48 | | | MAP 5.1, MANAGE 1.4 |
| A.5.4 | Impacto en personas y colectivos | | | P11, P48 | | | MAP 5.1, MEASURE 2.11 |
| A.5.5 | Impacto en la sociedad | | | P11, P48 | | | MAP 5.1, MEASURE 2.12 |
| A.6.1.2 | Objetivos de desarrollo responsable | | | Documentos 20 y 53; 01 §3 | | | GOVERN 1.2, GOVERN 4.1 |
| A.6.1.3 | Procesos de diseño y desarrollo responsables | | | Documentos 20, 21 y 53; P29 | | | MAP 2.3, MANAGE 1.1 |
| A.6.2.2 | Requisitos y especificación del sistema | | | P01, P15, P17 | | | MAP 1.4, MAP 1.6 |
| A.6.2.3 | Documentación del diseño y del desarrollo | | | P15, P16; documento 53 | | | MAP 2.1 |
| A.6.2.4 | Verificación y validación | | | P22; G5 | | | MEASURE 2.1, MEASURE 2.5 |
| A.6.2.5 | Despliegue | | | P21, P23; G5 | | | MEASURE 2.5, MANAGE 1.1 |
| A.6.2.6 | Operación y seguimiento | | | P24, P25; documento 52; R6 | | | MEASURE 2.4, MANAGE 4.1 |
| A.6.2.7 | Documentación técnica | | | P15, P21; documento 53 | | | MAP 2.2, MEASURE 2.9 |
| A.6.2.8 | Registro de eventos del sistema | | | P25; AG-10; 34 §3.7 | | | MEASURE 2.4 |
| A.7.2 | Datos para desarrollar y mejorar el sistema | | | P16, P64; documento 51 | | | MAP 2.3 |
| A.7.3 | Adquisición de datos | | | P14, P64; documento 51 | | | MAP 2.3, MEASURE 2.10 |
| A.7.4 | Calidad de los datos | | | P16; documento 51 | | | MAP 2.3, MEASURE 2.3 |
| A.7.5 | Procedencia de los datos | | | P16; SEG-08 | | | MAP 2.3, MEASURE 2.9 |
| A.7.6 | Preparación de los datos | | | P16; documento 51 | | | MAP 2.3 |
| A.8.2 | Documentación e información para los usuarios | | | P17, P24, P49 | | | MAP 2.2, MEASURE 2.9 |
| A.8.3 | Comunicación externa | | | P51; documento 60 | | | GOVERN 5.1, MEASURE 3.3 |
| A.8.4 | Comunicación de incidentes | | | P26, P51; documento 37 | | | GOVERN 4.3, MANAGE 4.3 |
| A.8.5 | Información a las partes interesadas | | | P46, P49; documento 60 | | | GOVERN 4.2, MANAGE 4.3 |
| A.9.2 | Procesos de uso responsable | | | Documento 31; P43 | | | GOVERN 4.1, MANAGE 1.1 |
| A.9.3 | Objetivos de uso responsable | | | Documento 31; P17 | | | GOVERN 1.2, MAP 2.2 |
| A.9.4 | Uso previsto del sistema | | | P01, P17, P49 | | | MAP 1.4, MANAGE 2.4 |
| A.10.2 | Reparto de responsabilidades con terceros | | | Documento 36; P56 | | | GOVERN 6.1, MANAGE 3.1 |
| A.10.3 | Proveedores | | | Documento 36; P14, P55, P57 | | | GOVERN 6.1, GOVERN 6.2 |
| A.10.4 | Clientes | | | P49, P56; 34 §3.8 | | | GOVERN 5.1, MANAGE 4.1 |
| *(ejemplo ilustrativo)* A.10.3 | Proveedores | Sí | La compañía integra dos modelos de terceros en procesos de atención al cliente. | Documento 36; P14, P55, P57 | Evaluaciones P14 de los dos proveedores (03-2026) y registro P57 vigente. | Implantado en parte | GOVERN 6.1, GOVERN 6.2 |

### 3.1 Controles adicionales

La cláusula 6.1.3 permite añadir controles de otras fuentes. Si la compañía aplica controles de SEVEN-G que no tienen equivalente directo en el anexo A (por ejemplo, los controles de agentes AG del documento 35), los declara aquí.

| Control adicional | Origen | Por qué se añade | Evidencia | Estado de implantación |
|---|---|---|---|---|
| | | | | |
| *(ejemplo ilustrativo)* AG-09 · Interruptor de parada | Documento 35 §7 | La compañía opera agentes con autonomía A2. | Pruebas del interruptor en P19 y P24. | Implantado |

---

## 4. Resumen

| Concepto | Número | Guía |
|---|---|---|
| Controles del anexo A declarados | 38 | Si la edición cotejada tiene otro número de controles, se ajusta la tabla y se indica aquí. |
| Aplicables | | |
| Excluidos, con justificación | | Cada exclusión tiene justificación concreta. |
| Implantados · en parte · planificados · no iniciados | | Solo sobre los aplicables. |
| Controles adicionales | | Sección 3.1. |
| Acciones abiertas para completar la implantación | | Con responsable y plazo, en el plan de tratamiento (P13) o en el plan de mejora del informe de madurez (P34 §6.6). |

---

## 5. Criterios de calidad

| # | Comprobación | Estado |
|---|---|---|
| 1 | La compañía ha cotejado la declaración con el texto adquirido de ISO/IEC 42001 y lo indica en la sección 2. | Cumple · No cumple · No aplica · Pendiente |
| 2 | Todos los controles del anexo A de la edición cotejada figuran en la tabla, sin reproducir el texto de la norma. | |
| 3 | Cada exclusión tiene una justificación concreta, coherente con el alcance del sistema de gestión y con la evaluación de riesgos. | |
| 4 | Cada control marcado «Implantado» tiene evidencia existente, aprobada y aplicada en la fecha de la declaración. | |
| 5 | La declaración es coherente con el plan de tratamiento de riesgos (P13) y con el perfil del AI RMF (P73), si existe. | |
| 6 | Ningún texto de la declaración afirma que la compañía está certificada ni que SEVEN-G certifica la conformidad. | |

---

## 6. Aprobación y verificación

| Función | Rol en SEVEN-G | Nombre y cargo | Fecha | Firma o referencia |
|---|---|---|---|---|
| Prepara la declaración | Oficina de IA con el responsable de riesgos de IA | | | |
| Verifica evidencias y estado | Auditor de IA o tercera línea | | | |
| Aprueba | Alta dirección | | | |
| Recibe | Comité de IA y comisión delegada | | | |

Separación de funciones: quien prepara la declaración no la verifica; el auditor de IA no verifica controles cuya implantación ha dirigido.

---

## 7. Control de versiones

**Documento cumplimentado**

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| | | | |

**Plantilla**

| Versión | Fecha | Cambios |
|---|---|---|
| 0.1 | 25-09-2026 | Primera versión. Declaración de aplicabilidad de los 38 controles del anexo A de ISO/IEC 42001:2023, identificados por su código y con el tema resumido en términos propios, con la cobertura propuesta en SEVEN-G y las subcategorías del NIST AI RMF relacionadas (orientativo). Pendiente de revisión por asesoría jurídica o por un auditor de ISO/IEC 42001. |
