# Cláusulas contractuales tipo de IA

**Ofrece una redacción de partida para las dieciséis cláusulas clave del documento 36, con su exigencia por nivel N1–N3, un anexo de IA para contratos existentes y una adenda para la IA embebida en software ya contratado.**

| | |
|---|---|
| Documento | Plantilla P56 · Cláusulas contractuales tipo de IA |
| Versión | 0.1 (borrador de trabajo) |
| Fecha | 19-09-2026 |
| Autor | Fernando García Varela |
| Estado | Borrador para revisión. |

---

> **Aviso legal y exención de responsabilidad.** SEVEN-G es un marco metodológico de referencia que se ofrece «tal cual» y con fines exclusivamente informativos. No constituye asesoramiento jurídico, regulatorio, financiero ni profesional, ni garantiza el cumplimiento de ninguna norma. Las referencias a regulación general (como el Reglamento Europeo de IA, el RGPD, DORA o NIS2), a normas técnicas y a regulación específica de cada sector o jurisdicción pueden ser incompletas, no aplicar a un caso concreto o quedar desactualizadas por cambios normativos, interpretaciones o criterios de las autoridades posteriores a su fecha de consulta. **Cada organización que use SEVEN-G es la única responsable de identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio**, con el asesoramiento cualificado que corresponda. El autor no asume responsabilidad alguna por el uso que se haga de este contenido ni por las decisiones que se adopten con él. Los datos, cifras, compañías y casos de los ejemplos son ficticios o ilustrativos.

> **Por qué importa.** Lo que no está en el contrato no se puede exigir: ni que el proveedor no entrene con los datos de la compañía, ni que avise antes de cambiar el modelo, ni que devuelva y borre los datos al salir. El documento 36 dice qué debe asegurar cada cláusula; esta plantilla da un texto de partida para negociar, evita que cada contrato empiece de cero y permite comprobar en G3, G5 y R6 qué cláusulas están presentes.

**Advertencia.** Los textos de esta plantilla son **textos de partida**. Deben revisarse y adaptarse por la asesoría jurídica de la compañía al contrato, a la ley aplicable, a la jurisdicción y a la regulación sectorial antes de usarse. Los elementos entre corchetes se sustituyen o se eligen en cada caso.

## 1. Instrucciones de uso

| Aspecto | Indicación |
|---|---|
| **Cuándo se usa** | En la etapa 3 del ciclo del proveedor (36 §5), fases 3–4: al preparar el contrato o el anexo de IA de un proveedor nuevo; al revisar contratos existentes (sección 7); al incorporar funciones de IA embebida en software ya contratado (sección 8, 36 §8.1 paso 5); y al renovar. |
| **Quién la rellena** | Asesoría jurídica y compras redactan y negocian; el responsable técnico de IA valida el contenido técnico (cambios de modelo, registros, salida); protección de datos valida las cláusulas 2 y 3. |
| **Quién la verifica** | El responsable de riesgos de IA comprueba que la lista de la sección 3 corresponde al nivel; el auditor de IA lo verifica en G3 y G5 (Enterprise). |
| **Quién decide o aprueba** | Según el nivel (36 §4.2): N1, responsable de producto de IA con conformidad de compras; N2, patrocinador de IA con conformidad de riesgos y de protección de datos; N3, comité de IA con conformidad de riesgos, seguridad de la información, protección de datos y asesoría jurídica. |
| **Etapa o *gate*** | G3 (G3.21: cláusulas fijadas como requisito de contratación) · G4 (G4.22: incorporadas al contrato o al borrador) · G5 (G5.20: contrato firmado) · R6 (R6.12) · G7 (G7.12: borrado y baja de accesos). |
| **Herramienta** | T09 · Registro de proveedores de IA: el estado de las 16 cláusulas se anota en el bloque *Contrato* (P57 §3.3). |
| **Documento de referencia** | Documento 36 §6 (cláusulas), §6.1 (Reglamento de IA en la cadena de valor), §6.2 (DORA) y §8 (IA embebida). P14 §5 recoge la verificación. |
| **Lite frente a Enterprise** | La exigencia depende del nivel N1–N3 del proveedor, no de la intensidad. |

Reglas de cumplimentación:

- **Sí** = debe figurar · **Rec.** = recomendada · **—** = no requerida (36 §6).
- En N1 muchas cláusulas no son negociables: se verifican en las condiciones estándar del proveedor y, si faltan, se registra el riesgo en P12 y quién lo acepta (sección 9).
- En N1 las condiciones estándar se revisan al menos frente a las cláusulas 1 a 4; en N2 se firma un anexo de IA y un encargo de tratamiento con las cláusulas marcadas para N2; en N3 el contrato se negocia con todas las cláusulas (36 §4.2).
- *Este documento no constituye asesoramiento jurídico.* Referencias consultadas en septiembre de 2026; debe verificarse su vigencia.

---

## 2. Identificación

| Campo | Contenido | Guía |
|---|---|---|
| Código de la relación proveedor–servicio | | PRV-AAAA-NNN (P57). |
| Proveedor | | Razón social y país. |
| Servicio | | |
| Nivel de exigencia | | N1 · N2 · N3 (P14 §3). |
| Función crítica o importante | | Sí · No. Si la compañía está sujeta a DORA, ver sección 6. |
| Instrumento | | Contrato nuevo · Anexo de IA a contrato existente · Adenda de IA embebida · Renovación. |
| Referencia del contrato | | |
| Iniciativas y sistemas vinculados | | IA-AAAA-NNN · SIA-AAAA-NNN. |
| Versión del documento y fecha | | DD-MM-AAAA. |

---

## 3. Mapa de cláusulas por nivel y estado

Estado: **Presente · Parcial · Ausente · No aplica** (36 §9).

| # | Cláusula | N1 | N2 | N3 | Adenda de IA embebida | Estado | Observaciones |
|---|---|---|---|---|---|---|---|
| 1 | Uso de datos para entrenamiento | Sí | Sí | Sí | Mínima | | |
| 2 | Confidencialidad y tratamiento de datos | Sí | Sí | Sí | Según nivel | | |
| 3 | Ubicación y transferencias | Sí | Sí | Sí | Mínima | | |
| 4 | Seguridad | Sí | Sí | Sí | Según nivel | | |
| 5 | Subencargados | Rec. | Sí | Sí | Según nivel | | |
| 6 | Propiedad intelectual y resultados | Rec. | Sí | Sí | Según nivel | | |
| 7 | Notificación de incidentes | Rec. | Sí | Sí | Según nivel | | |
| 8 | Cambios de modelo | Rec. | Sí | Sí | Mínima | | |
| 9 | Niveles de servicio | — | Sí | Sí | Según nivel | | |
| 10 | Registros y trazabilidad | — | Sí | Sí | Según nivel | | |
| 11 | Auditoría y acceso | — | Rec. | Sí | Según nivel | | |
| 12 | Obligaciones del Reglamento de IA en la cadena de valor | Rec. | Sí | Sí | Según nivel | | |
| 13 | Transparencia sobre funciones de IA | Rec. | Sí | Sí | Mínima | | |
| 14 | Continuidad | — | Rec. | Sí | Según nivel | | |
| 15 | Salida y transición | Rec. | Sí | Sí | Según nivel | | |
| 16 | Terminación | Rec. | Sí | Sí | Según nivel | | |
| *(ejemplo ilustrativo)* 8 | Cambios de modelo | Rec. | Sí | Sí | Mínima | Parcial | Preaviso de 30 días aceptado; el proveedor no admite fijar versión. Riesgo RT-TER-03 en P12. |

---

## 4. Definiciones

A efectos de las cláusulas siguientes:

- **Datos de la Compañía:** cualquier dato, documento o información que la Compañía o sus usuarios faciliten al Proveedor o que el Servicio genere por cuenta de la Compañía, incluidas las Entradas y los Resultados.
- **Entradas:** instrucciones, consultas, contextos, documentos y demás contenidos introducidos en el Servicio.
- **Resultados:** contenidos, predicciones, recomendaciones o acciones generados por el Servicio.
- **Modelo:** cualquier modelo de IA, propio o de terceros, que el Servicio utilice.
- **Cambio relevante:** cambio de versión, de comportamiento o de configuración del Modelo o del Servicio que pueda afectar a la calidad, la seguridad, el cumplimiento o el coste; y la retirada de un Modelo.
- **Función de IA:** funcionalidad del Servicio basada en un Modelo.
- **Subencargado:** tercero al que el Proveedor recurre para prestar el Servicio o tratar Datos de la Compañía.
- **Incidente:** suceso que afecta o puede afectar a la disponibilidad, integridad o confidencialidad del Servicio o de los Datos de la Compañía, o al comportamiento esperado del Modelo.

---

## 5. Cláusulas modelo

### 5.1 Cláusula 1 · Uso de datos para entrenamiento

**Texto modelo.** El Proveedor no utilizará los Datos de la Compañía, incluidas las Entradas y los Resultados, para entrenar, ajustar, evaluar o mejorar ningún Modelo, propio o de terceros, ni para ningún otro fin distinto de la prestación del Servicio, salvo autorización previa, expresa, escrita y específica de la Compañía, que indicará los datos, la finalidad y el plazo. El Proveedor mantendrá [desactivada por defecto / desactivada por configuración verificable] cualquier opción que permita ese uso.

**Nota de uso.** Exigible en N1, N2 y N3. En N1 se comprueba en las condiciones estándar y en la configuración del entorno; se conserva la evidencia. Controla RT-TER-02.

### 5.2 Cláusula 2 · Confidencialidad y tratamiento de datos

**Texto modelo.** El Proveedor tratará los Datos de la Compañía como información confidencial durante la vigencia del contrato y [número] años después. Cuando trate datos personales por cuenta de la Compañía, lo hará como encargado del tratamiento conforme al art. 28 del RGPD y al contrato de encargo que figura como [anexo]. El Proveedor conservará los Datos de la Compañía solo durante [plazo] o el tiempo necesario para prestar el Servicio, y los borrará al término de ese plazo.

**Nota de uso.** Exigible en N1, N2 y N3. Protección de datos valida el encargo de tratamiento y el plazo de retención.

### 5.3 Cláusula 3 · Ubicación y transferencias

**Texto modelo.** El Proveedor tratará y almacenará los Datos de la Compañía únicamente en [regiones o países autorizados]. Cualquier transferencia internacional se ajustará a las garantías del capítulo V del RGPD. El Proveedor notificará a la Compañía cualquier cambio de ubicación con [número] días de antelación y la Compañía podrá oponerse o resolver el contrato sin penalización si el cambio no ofrece garantías equivalentes.

**Nota de uso.** Exigible en N1, N2 y N3; mínima en la adenda de IA embebida. Controla RT-TER-04.

### 5.4 Cláusula 4 · Seguridad

**Texto modelo.** El Proveedor aplicará las medidas de seguridad descritas en [anexo de medidas], mantendrá vigentes durante el contrato las certificaciones [indicar] con un alcance que cubra el Servicio, gestionará las vulnerabilidades en los plazos de [anexo] y aplicará protecciones frente a amenazas específicas de la IA, como la inyección de instrucciones, la fuga de información y la extracción del Modelo. Informará sin demora de la pérdida o reducción de alcance de cualquier certificación.

**Nota de uso.** Exigible en N1, N2 y N3. En N2 y N3, seguridad de la información contrasta el anexo con los controles SEG y AG aplicables del documento 35.

### 5.5 Cláusula 5 · Subencargados

**Texto modelo.** El Proveedor mantendrá a disposición de la Compañía una lista actualizada de Subencargados con su ubicación y función. [No recurrirá a nuevos Subencargados sin autorización previa por escrito de la Compañía / Notificará a la Compañía cualquier cambio con [número] días de antelación, y la Compañía podrá oponerse de forma motivada]. El Proveedor impondrá a cada Subencargado obligaciones equivalentes a las de este contrato y responderá de su cumplimiento.

**Nota de uso.** Recomendada en N1; exigible en N2 y N3. En DORA, ver sección 6.

### 5.6 Cláusula 6 · Propiedad intelectual y resultados

**Texto modelo.** Los Resultados [pertenecen a la Compañía / pueden ser utilizados por la Compañía sin restricción para sus fines]. Lo desarrollado a medida para la Compañía será de su propiedad desde su creación. El Proveedor mantendrá indemne a la Compañía frente a reclamaciones de terceros por infracción de derechos de propiedad intelectual o industrial derivadas del Modelo o de sus datos de entrenamiento, [con el alcance y los límites siguientes].

**Nota de uso.** Recomendada en N1; exigible en N2 y N3. Especialmente relevante con integradores (propiedad de lo construido).

### 5.7 Cláusula 7 · Notificación de incidentes

**Texto modelo.** El Proveedor notificará a la Compañía cualquier Incidente en un plazo máximo de [número] horas desde su detección, con al menos: descripción, sistemas y datos afectados, causa conocida, medidas adoptadas y persona de contacto. Cooperará en la investigación y facilitará en plazo la información que la Compañía necesite para sus notificaciones regulatorias.

**Nota de uso.** Recomendada en N1; exigible en N2 y N3. El plazo debe ser compatible con las obligaciones propias de la compañía (documento 37); en N3, orientativamente 24 horas o menos (36 §4.2).

### 5.8 Cláusula 8 · Cambios de modelo

**Texto modelo.** El Proveedor comunicará cualquier Cambio relevante con al menos [número] días de antelación e información suficiente para que la Compañía evalúe su efecto antes de que se produzca. La Compañía podrá mantener fijada la versión en uso durante [periodo] desde el aviso. La retirada de un Modelo se comunicará con [número] meses de antelación. Si el cambio afecta al cumplimiento o al rendimiento acordado, la Compañía podrá resolver el contrato sin penalización.

**Nota de uso.** Recomendada en N1; exigible en N2 y N3; mínima en la adenda de IA embebida. Controla RT-TER-03.

### 5.9 Cláusula 9 · Niveles de servicio

**Texto modelo.** El Proveedor prestará el Servicio con los niveles de disponibilidad, latencia y soporte de [anexo de niveles de servicio], medidos según el método que en él se describe. El incumplimiento dará lugar a las penalizaciones de [anexo] sin perjuicio de otros derechos.

**Nota de uso.** No requerida en N1; exigible en N2 y N3.

### 5.10 Cláusula 10 · Registros y trazabilidad

**Texto modelo.** El Proveedor generará y conservará durante [plazo] los registros necesarios para la supervisión, la investigación de incidentes y las obligaciones regulatorias de la Compañía, y le dará acceso a ellos en [formato y plazo].

**Nota de uso.** No requerida en N1; exigible en N2 y N3. El plazo de conservación se alinea con el registro de arquitectura (P15).

### 5.11 Cláusula 11 · Auditoría y acceso

**Texto modelo.** La Compañía, los auditores que designe y los supervisores competentes podrán auditar, inspeccionar y acceder a la información, instalaciones y sistemas relacionados con el Servicio, [con preaviso de [número] días salvo requerimiento del supervisor]. [En N2: el Proveedor facilitará anualmente informes independientes que cubran el Servicio.]

**Nota de uso.** No requerida en N1; recomendada en N2 (informes independientes anuales); exigible en N3 (derecho de auditoría directo o por tercero designado).

### 5.12 Cláusula 12 · Obligaciones del Reglamento de IA en la cadena de valor

**Texto modelo.** Las partes declaran que, respecto del Servicio, el Proveedor actúa como [proveedor del sistema / proveedor de modelo de propósito general / otro] y la Compañía como [responsable del despliegue / otro]. El Proveedor entregará la documentación técnica y las instrucciones de uso, e informará de las capacidades y limitaciones del sistema, de modo que la Compañía pueda cumplir sus obligaciones. Cooperará en la supervisión humana, la conservación de registros, la vigilancia posterior a la comercialización y la gestión de incidentes graves. [Cuando el Proveedor suministre herramientas, servicios, componentes o procesos a un sistema de alto riesgo de la Compañía, las partes firman el acuerdo escrito del art. 25.4 del Reglamento de IA como [anexo], con la información, capacidades, acceso técnico y asistencia necesarios.]

**Nota de uso.** Recomendada en N1; exigible en N2 y N3. Aplique la situación que corresponda de 36 §6.1: despliegue de un sistema de alto riesgo de un proveedor (art. 26); la compañía pasa a ser proveedor (art. 25.1 y 25.2); componentes de un tercero para un sistema de alto riesgo propio (art. 25.4); integración de un modelo de propósito general (art. 53). Los contratos de larga duración firmados antes del 2 de diciembre de 2027 **deberían** incluirla ya.

### 5.13 Cláusula 13 · Transparencia sobre funciones de IA

**Texto modelo.** El Proveedor avisará a la Compañía con al menos [número] días de antelación de cualquier nueva Función de IA en el Servicio. La Compañía podrá mantener cada nueva Función de IA desactivada hasta haberla evaluado, sin coste adicional ni pérdida de otras funcionalidades.

**Nota de uso.** Recomendada en N1; exigible en N2 y N3; mínima en la adenda de IA embebida. Controla RT-TER-06.

### 5.14 Cláusula 14 · Continuidad

**Texto modelo.** El Proveedor mantendrá planes de continuidad y recuperación del Servicio, los probará al menos [periodicidad] e informará a la Compañía de sus resultados y de las medidas correctoras.

**Nota de uso.** No requerida en N1; recomendada en N2; exigible en N3.

### 5.15 Cláusula 15 · Salida y transición

**Texto modelo.** A la terminación del contrato por cualquier causa, el Proveedor: a) mantendrá el Servicio durante un periodo de transición de [número] meses; b) prestará la asistencia razonable para migrar a la Compañía o a un nuevo proveedor; c) entregará en formatos utilizables [indicar formatos] los datos, configuraciones, instrucciones y registros de la Compañía; d) borrará después los Datos de la Compañía, también en poder de sus Subencargados, y entregará un certificado de borrado en [número] días; e) revocará todos los accesos.

**Nota de uso.** Recomendada en N1 (en N1 basta con la exportación de datos garantizada); exigible en N2 y N3. El plan de salida y el certificado de borrado se documentan en P57 §6 y §8. En DORA, ver sección 6.

### 5.16 Cláusula 16 · Terminación

**Texto modelo.** La Compañía podrá resolver el contrato, sin penalización, por: a) incumplimiento grave del Proveedor; b) cambio regulatorio que impida o haga ilícita la prestación; c) incumplimiento de seguridad; d) cambio de control del Proveedor; e) instrucción de un supervisor competente. La resolución activa la cláusula 15.

**Nota de uso.** Recomendada en N1; exigible en N2 y N3.

---

## 6. Entidades sujetas a DORA

Solo si la compañía es una entidad financiera sujeta a DORA y el servicio de IA es un servicio TIC prestado por un tercero (36 §6.2). Si no lo es, estos requisitos **pueden** usarse como referencia de buenas prácticas para servicios N3.

| Requisito (36 §6.2) | Referencia | Dónde se cubre | Comprobado |
|---|---|---|---|
| Cláusulas contractuales mínimas para todos los servicios TIC | Art. 30.2 | Sección 5; revisión jurídica del contrato completo. | Sí · No |
| Cláusulas reforzadas para funciones críticas o importantes | Art. 30.3 | Todo servicio N3 se revisa contra el art. 30.3. | Sí · No · No aplica |
| Estrategia de salida para servicios que soportan funciones críticas o importantes | Art. 28.8 | Cláusula 15; plan de salida probado (P57 §6–7). | Sí · No · No aplica |
| Subcontratación en cadena | Art. 29; Reglamento Delegado (UE) 2025/532 | Cláusula 5. | Sí · No · No aplica |
| Registro de información | Art. 28.3; Reglamento de Ejecución (UE) 2024/2956 | T09 alimenta el registro (P57). | Sí · No |

---

## 7. Anexo de IA para contratos existentes (modelo)

Se usa cuando un contrato vigente no recoge las cláusulas del nivel (36 §4.2: en N2, anexo de IA). Texto de partida:

**Anexo de IA al contrato [referencia] entre [la Compañía] y [el Proveedor].**

1. **Objeto.** Este anexo completa el contrato con las condiciones aplicables al uso de Funciones de IA y Modelos en el Servicio.
2. **Definiciones.** Se aplican las definiciones de la sección 4 de esta plantilla.
3. **Cláusulas incorporadas.** Se incorporan las cláusulas [enumerar según el nivel de la sección 3: en N2, 1 a 10, 12, 13, 15 y 16, y las recomendadas que se acuerden; en N3, todas].
4. **Prevalencia.** En caso de contradicción con el contrato, prevalece este anexo en lo relativo a Datos de la Compañía, Modelos y Funciones de IA.
5. **Entrada en vigor.** Desde su firma; las obligaciones sobre Funciones de IA ya activas se cumplirán en [plazo].

---

## 8. Adenda de IA embebida (modelo)

Se usa con proveedores de software ya contratado que incorporan Funciones de IA (36 §8.1, paso 5). Incluye como mínimo las cláusulas 1, 3, 8 y 13, más las que correspondan al nivel. Texto de partida:

**Adenda de IA al contrato [referencia] entre [la Compañía] y [el Proveedor].**

1. **Funciones de IA existentes.** El Proveedor declara en [apéndice] las Funciones de IA incluidas hoy en el software, los datos que tratan, los Modelos y proveedores de Modelos que usan y dónde se tratan los datos (respuestas del anexo A de P55).
2. **Estado de activación.** Las Funciones de IA que traten datos personales o confidenciales permanecerán desactivadas hasta que la Compañía las evalúe y autorice por escrito. [Si no pueden desactivarse, el Proveedor lo declara y describe las medidas disponibles.]
3. **Cláusulas incorporadas.** Se incorporan las cláusulas 1 (uso de datos para entrenamiento), 3 (ubicación y transferencias), 8 (cambios de modelo) y 13 (transparencia sobre funciones de IA), y [otras según el nivel].
4. **Nuevas funciones.** Toda nueva Función de IA se rige por la cláusula 13.

---

## 9. Registro de negociación y riesgo aceptado

Cláusulas exigibles que el proveedor no acepta o acepta en parte. En N1, si faltan en las condiciones estándar, se registra el riesgo y quién lo acepta (36 §6).

| # | Cláusula | Posición del proveedor | Alternativa acordada o medida compensatoria | Riesgo en P12 | Nivel residual | Aceptado por (P12 §6) | Fecha |
|---|---|---|---|---|---|---|---|
| | | | | | | | |
| *(ejemplo ilustrativo)* 11 | Auditoría y acceso | Solo aporta informes independientes anuales. | Informe anual de tercero con alcance del servicio; derecho de acceso del supervisor. | IA-2026-021 · R04 | Medio | Patrocinador de IA con conformidad de riesgos | 02-10-2026 |

---

## 10. Criterios de calidad

| # | Comprobación | Estado |
|---|---|---|
| 1 | Las cláusulas mínimas están fijadas como requisito de contratación antes de G3 (G3.21). | Cumple · No cumple · No aplica · Pendiente |
| 2 | Las cláusulas exigidas están en el contrato o en el borrador en negociación antes de G4 (G4.22). | |
| 3 | El contrato está firmado con las cláusulas exigidas antes de G5 y consta en T09 (G5.20). | |
| 4 | Cada cláusula exigible ausente o parcial tiene riesgo registrado y aceptación del órgano que corresponde. | |
| 5 | La cláusula 12 aplica la situación correcta de 36 §6.1. | |
| 6 | Si aplica DORA, el servicio N3 se ha revisado contra el art. 30.3. | |
| 7 | La adenda de IA embebida incluye al menos las cláusulas 1, 3, 8 y 13. | |
| 8 | La asesoría jurídica ha revisado y adaptado los textos. | |

---

## 11. Aprobación y verificación

| Función | Rol en SEVEN-G | Nombre y cargo | Fecha | Firma o referencia |
|---|---|---|---|---|
| Redacta y negocia | Asesoría jurídica y compras | | | |
| Valida el contenido técnico y de datos | Responsable técnico de IA · protección de datos | | | |
| Emite conformidad | Responsable de riesgos de IA | | | |
| Verifica | Responsable de riesgos de IA (Lite) · Auditor de IA (Enterprise) | | | |
| Aprueba | Según el nivel (36 §4.2) | | | |

Separación de funciones: quien negocia el contrato no verifica la lista de cláusulas; quien tenga conflicto de interés con el proveedor lo declara en P03.

---

## 12. Control de versiones

**Documento cumplimentado**

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| | | | |

**Plantilla**

| Versión | Fecha | Cambios |
|---|---|---|
| 0.1 | 19-09-2026 | Primera versión. Texto de partida de las dieciséis cláusulas de 36 §6 con su exigencia por nivel, requisitos de DORA de 36 §6.2, anexo de IA para contratos existentes y adenda de IA embebida (36 §8.1). |
