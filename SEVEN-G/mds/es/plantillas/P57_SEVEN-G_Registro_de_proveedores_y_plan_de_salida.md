# Registro de proveedores y plan de salida

**Mantiene el registro de proveedores de IA de la compañía, documenta sus revisiones periódicas y prepara, prueba y cierra la salida de cada proveedor con portabilidad verificada y borrado certificado.**

| | |
|---|---|
| Documento | Plantilla P57 · Registro de proveedores y plan de salida |
| Versión | 0.1 (borrador de trabajo) |
| Fecha | 19-09-2026 |
| Autor | Fernando García Varela |
| Estado | Borrador para revisión. |

---

> **Aviso legal y exención de responsabilidad.** SEVEN-G es un marco metodológico de referencia que se ofrece «tal cual» y con fines exclusivamente informativos. No constituye asesoramiento jurídico, regulatorio, financiero ni profesional, ni garantiza el cumplimiento de ninguna norma. Las referencias a regulación general (como el Reglamento Europeo de IA, el RGPD, DORA o NIS2), a normas técnicas y a regulación específica de cada sector o jurisdicción pueden ser incompletas, no aplicar a un caso concreto o quedar desactualizadas por cambios normativos, interpretaciones o criterios de las autoridades posteriores a su fecha de consulta. **Cada organización que use SEVEN-G es la única responsable de identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio**, con el asesoramiento cualificado que corresponda. El autor no asume responsabilidad alguna por el uso que se haga de este contenido ni por las decisiones que se adopten con él. Los datos, cifras, compañías y casos de los ejemplos son ficticios o ilustrativos.

> **Por qué importa.** La dependencia de un proveedor se mide en todos los sistemas, no en uno (36 §2, principio 6), y la salida se diseña al entrar, no al terminar (principio 3). Sin un registro único, nadie sabe cuántos sistemas y cuánto valor dependen de un mismo proveedor, qué revisiones han vencido ni qué contratos carecen de cláusulas clave; y sin un plan de salida probado, cambiar de proveedor en una función crítica se vuelve inviable en plazo o coste (RT-TER-01, RT-TER-05, RT-TER-07).

## 1. Instrucciones de uso

| Aspecto | Indicación |
|---|---|
| **Cuándo se usa** | Registro vivo de compañía. Cada relación proveedor–servicio se da de alta en la etapa 1 del ciclo del proveedor (36 §5) y se actualiza en cada etapa. Las actas de revisión siguen la periodicidad del nivel; el plan de salida se documenta en la integración (fases 4–5), se prueba según el nivel y se activa en la etapa 6 (fase 7). La vista de concentración se revisa en C3 y se informa en C4. |
| **Quién la rellena** | Compras mantiene el registro (36 §11); el gestor de la relación y el responsable de operación de IA, las revisiones; el responsable técnico de IA, el plan de salida y la prueba de portabilidad; la asesoría jurídica, el cierre contractual y el certificado de borrado. |
| **Quién la verifica** | La oficina de IA comprueba que el registro está completo y las revisiones al día; el auditor de IA verifica en G3, G5 y G7 que la evaluación, el contrato y la salida corresponden al nivel (36 §11). |
| **Quién decide o aprueba** | Aprobación del proveedor según el nivel (36 §4.2). Límites de concentración y aceptación de riesgos Altos de terceros: comité de IA (36 §7.2). Información trimestral al consejo o su comisión delegada (36 §10). |
| **Etapa, *gate* o momento** | C3 y C4 (concentración) · G3 (G3.20) · G5 (G5.20: proveedor en el registro) · R6 (R6.12) · G7 (G7.12: borrado certificado y baja de accesos). |
| **Herramienta** | T09 · Registro de proveedores de IA, módulo de T01 sobre la entidad *Proveedor* del modelo de datos común (03 §4). Esta plantilla es su formato de trabajo y usa los mismos campos (36 §9). |
| **Documento de referencia** | Documento 36 §4.2 (requisitos por nivel), §5 (ciclo del proveedor), §6.2 (DORA), §7 (dependencia, portabilidad y concentración), §9 (campos) y §10 (indicadores). |
| **Lite frente a Enterprise** | El registro es único para la compañía. La profundidad de la revisión y de la salida depende del nivel N1–N3; los campos marcados **(Enterprise)** pueden omitirse para proveedores N1. |

Reglas de cumplimentación:

- **Cada relación proveedor–servicio es un registro**, con código PRV-AAAA-NNN. Un mismo proveedor puede tener niveles distintos para servicios distintos (36 §4.1).
- Salida por nivel (36 §4.2): N1, exportación de datos garantizada; N2, plan de salida documentado; N3, plan de salida con alternativa identificada y ensayo o prueba documentada, y prueba de portabilidad al menos una vez al año o antes de renovar (36 §7.1).
- Revisión por nivel (36 §4.2): N1 anual; N2 semestral con indicadores de servicio; N3 trimestral, con indicadores mensuales y reunión de gobierno de la relación.
- Si la compañía está sujeta a DORA, T09 alimenta el registro de información del art. 28.3 (36 §6.2).
- *Este documento no constituye asesoramiento jurídico.*

---

## 2. Identificación del registro

| Campo | Contenido | Guía |
|---|---|---|
| Compañía o perímetro | | Entidad o grupo al que se aplica. |
| Responsable del registro | | Compras, con la oficina de IA. |
| Fecha de corte | | DD-MM-AAAA. |
| Límites de concentración aplicables | | Aprobados en C2 (documento 13). |
| Sujeta a DORA | | Sí · No. |
| Versión del documento | | |

---

## 3. Registro de proveedores (T09)

### 3.1 Identificación y servicio

| Código | Razón social · grupo · país | Tipo de tercero (36 §1.1) | Servicio (descripción comprensible) | Modelos y versiones | Tipo de contratación | Sistemas e iniciativas | Gestor de la relación |
|---|---|---|---|---|---|---|---|
| PRV-AAAA-NNN | | | | | Construir sobre · Comprar · Adaptar · Aliarse | SIA-AAAA-NNN · IA-AAAA-NNN | |
| *(ejemplo ilustrativo)* PRV-2026-003 | Proveedor Alfa, S.A. (ficticio) · Grupo Alfa · Irlanda | Proveedor de modelos | Modelo de lenguaje por interfaz de programación para el asistente de consultas | Modelo general, versión fijada 2026-06 | Construir sobre | SIA-2026-007 · IA-2026-012 | Responsable técnico del área de clientes |

### 3.2 Clasificación y datos

| Código | Criticidad | Datos | Autonomía | Sustituibilidad | Nivel | Función crítica o importante | Rol regulatorio (proveedor · compañía) | Datos personales | Ubicación y garantía de transferencias | Retención | Uso para entrenamiento |
|---|---|---|---|---|---|---|---|---|---|---|---|
| | N1 · N2 · N3 | N1 · N2 · N3 | N1 · N2 · N3 | N1 · N2 · N3 | El más alto | Sí · No | | Sí · No | | | Excluido · Autorizado · Sin verificar |
| *(ejemplo ilustrativo)* PRV-2026-003 | N2 | N2 | N1 | N2 | N2 | No | Proveedor de modelo de propósito general · responsable del despliegue | Sí | UE; sin transferencias | 30 días | Excluido |

### 3.3 Contrato y evaluación

| Código | Referencia del contrato | Inicio · renovación · fin | Preaviso | Estado de las 16 cláusulas (P56 §3) | Diligencia debida (P55 · P14): fecha y resultado | Certificaciones e informes y vigencia | Evaluación de seguridad | Condiciones impuestas | Registro de información DORA |
|---|---|---|---|---|---|---|---|---|---|
| | | | | Presentes · parciales · ausentes (números) | | | | | Sí · No · No aplica |
| *(ejemplo ilustrativo)* PRV-2026-003 | Contrato 2026/044 (ficticio) | 01-11-2026 · 01-11-2027 · — | 90 días | 14 presentes; parcial: 8; ausente: 11 | 10-10-2026 · Conforme con observaciones | ISO/IEC 27001 hasta 03-2028 | Documental, conforme | Captura de configuración antes de G5 | No aplica |

### 3.4 Riesgo, seguimiento, dependencia y estado

| Código | Riesgos vinculados (T06) | Nivel residual principal | Indicadores de servicio | Incidentes imputables | Cambios de modelo notificados | Última · próxima revisión | Sustituibilidad estimada | Alternativa identificada | Plan de salida (fecha de prueba) | Valor de cartera dependiente | Estado |
|---|---|---|---|---|---|---|---|---|---|---|---|
| | RT-TER-NN · IA-AAAA-NNN · Rnn | Bajo · Medio · Alto · Crítico | | INC-AAAA-NNN | | | | | Sí · No | | En evaluación · Aprobado · Aprobado con condiciones · Rechazado · En salida · Finalizado |
| *(ejemplo ilustrativo)* PRV-2026-003 | RT-TER-01, RT-TER-03 | Medio | Disponibilidad 99,8 % | Ninguno | 1 (evaluado antes de su efecto) | 15-01-2027 · 15-07-2027 | 6 meses | Proveedor Beta (ficticio) | Sí (sin prueba; N2) | 8 % del valor validado | Aprobado con condiciones |

### 3.5 Subencargados **(Enterprise)**

| Código PRV | Subencargado | Ubicación | Función | ¿Subcontrata una función crítica? | ¿Común a otros proveedores N2 o N3? |
|---|---|---|---|---|---|
| | | | | Sí · No | Sí · No |

### 3.6 Historial

| Fecha | Código PRV | Evento | Autor | Motivo |
|---|---|---|---|---|
| | | Alta · Cambio de nivel · Revisión · Disparador · Incidente · Cambio de estado · Salida | | |

---

## 4. Concentración y dependencia de cartera

Indicadores de 36 §7.2, medidos en cartera (33 §10). Cuando se supera un límite, el comité de IA decide entre diversificar, reforzar la salida o aceptar el riesgo (33 §7).

| Indicador | Valor por proveedor | Límite aprobado (C2) | Situación | Decisión del comité de IA |
|---|---|---|---|---|
| Sistemas en producción por proveedor de modelos y de plataforma | | | Dentro · Superado | |
| Valor dependiente (proporción del valor validado) | | | | |
| Funciones críticas o importantes dependientes | | | | |
| Proveedores N3 sin salida probada (número y antigüedad) | | | | |
| Subencargados comunes a varios proveedores N2 o N3 | | | | |

Información trimestral al consejo o su comisión delegada (36 §10): concentración, proveedores N3 sin salida probada, incidentes S1 y S2 imputables a terceros y aceptaciones de riesgos de terceros de nivel Alto.

---

## 5. Acta de revisión periódica del proveedor

Una por revisión y por relación (36 §5, etapa 5). Periodicidad según el nivel (sección 1).

| Campo | Contenido | Guía |
|---|---|---|
| Código PRV y proveedor | | |
| Fecha y tipo de revisión | | Periódica · Por disparador · Previa a la renovación. |
| Asistentes | | Gestor de la relación, responsable de operación de IA y, en N3, representantes del proveedor (reunión de gobierno de la relación). |
| Indicadores de servicio del periodo | | Frente a los niveles de la cláusula 9. |
| Incidentes imputables | | INC-AAAA-NNN y severidad. |
| Cambios de modelo, versiones y retiradas | | ¿Se notificaron y evaluaron antes de su efecto? |
| Cambios de subencargados o ubicación | | |
| Cumplimiento del contrato | | Cláusulas incumplidas o parciales. |
| Funciones de IA nuevas (IA embebida) | | Revisión de actualizaciones y configuración (36 §8.1, paso 6). |
| Disparadores de reevaluación | | Cambio de modelo o versión principal · cambio de subencargados o ubicación · incidente S1 o S2 · cambio de propiedad · cambio de uso o de autonomía · nueva obligación regulatoria · deterioro de indicadores · aviso de retirada de un modelo (36 §5). |
| Reevaluación del nivel | | Se mantiene · Cambia a N*n* (actualizar P14 y, si procede, P55). |
| Conclusión | | Continuar · Continuar con condiciones · Activar el plan de salida. |

| # | Acuerdo o acción | Responsable | Plazo | Estado |
|---|---|---|---|---|
| | | | | Abierta · Cumplida · Vencida |
| *(ejemplo ilustrativo)* 1 | Evaluar la nueva versión anunciada con el conjunto de evaluación propio antes de su efecto | Responsable técnico de IA | 30-06-2027 | Abierta |

---

## 6. Plan de salida

Uno por relación N2 o N3 (36 §4.2). Se documenta en la integración y se revisa en cada revisión periódica.

### 6.1 Planteamiento

| Campo | Contenido | Guía |
|---|---|---|
| Código PRV y servicio | | |
| Causas de activación | | Terminación, incumplimiento grave, cambio regulatorio, disparador no resuelto, decisión de retirar en G7 (P30). |
| Alternativa identificada | | Proveedor, modelo o solución interna. Obligatoria en N3. |
| Plazo objetivo de sustitución | | Coherente con la sustituibilidad del nivel (36 §4.1). |
| Coste de salida estimado | | Categorías del documento 42; se incluye en el coste total de P10. |
| Continuidad durante la transición | | Periodo de transición contractual (cláusula 15) y medidas del servicio. |

### 6.2 Qué se recupera

| Elemento | Formato de exportación | Responsable | Comprobado (fecha) |
|---|---|---|---|
| Datos de la compañía | | | |
| Configuraciones | | | |
| Instrucciones y flujos | | | |
| Registros | | | |
| Índices, memorias y bases de conocimiento | | | |
| Conjunto de evaluación propio y resultados | | | |
| Documentación y conocimiento del integrador **(Enterprise)** | | | |

### 6.3 Pasos de la salida

| # | Paso | Responsable | Plazo | Evidencia |
|---|---|---|---|---|
| 1 | Notificación al proveedor y activación de la transición | Asesoría jurídica | | |
| 2 | Exportación y comprobación de integridad | Responsable técnico de IA | | |
| 3 | Puesta en marcha de la alternativa y validación | Responsable técnico de IA | | P22 si hay cambio relevante |
| 4 | Revocación de accesos, identidades y credenciales | Responsable técnico de IA | | |
| 5 | Borrado por el proveedor y sus subencargados; certificado | Asesoría jurídica | | Sección 8 |
| 6 | Cierre de la relación y lecciones | Gestor de la relación | | Sección 9 |

---

## 7. Prueba de portabilidad

Obligatoria para servicios N3 al menos una vez al año o antes de renovar (36 §7.1); en N2, **debería** hacerse antes de renovar.

| Campo | Contenido | Guía |
|---|---|---|
| Código PRV | | |
| Fecha de la prueba | | |
| Conjunto de evaluación propio usado | | Versión y tamaño. |
| Alternativa probada | | Modelo o proveedor. |
| Diferencia de resultados | | Métricas de calidad frente al proveedor actual. |
| Diferencia de coste | | Coste por uso o total anual. |
| Esfuerzo de migración | | Personas, plazo y cambios necesarios. |
| Conclusión | | Salida viable · Viable con condiciones · No viable (se informa al comité de IA). |
| Próxima prueba | | |

| *(ejemplo ilustrativo)* | Contenido |
|---|---|
| Resultado | Calidad del modelo alternativo 3 puntos inferior en el conjunto de evaluación; coste un 10 % menor; migración estimada en seis semanas. Salida viable con condiciones: ajustar instrucciones. |

---

## 8. Certificado de borrado (modelo)

Texto de partida que firma el proveedor al terminar (cláusula 15 de P56). Debe revisarlo la asesoría jurídica.

**[El Proveedor]**, representado por **[nombre y cargo]**, certifica que el **[fecha]** ha borrado de forma irreversible los Datos de la Compañía relacionados con el contrato **[referencia]**, incluidas Entradas, Resultados, registros, índices, memorias y copias de seguridad, en sus sistemas y en los de sus Subencargados **[relación]**, mediante **[método]**, salvo los datos que deba conservar por obligación legal, que se detallan en **[apéndice]** con su fundamento y plazo. Todos los accesos de la Compañía han sido revocados.

| Verificación por la compañía | Contenido |
|---|---|
| Certificado recibido (fecha) | |
| Cubre subencargados y copias de seguridad | Sí · No |
| Datos conservados por obligación legal justificados | Sí · No · No aplica |
| Accesos revocados comprobados | Sí · No |
| Verificado por (protección de datos) | |

---

## 9. Acta de cierre de la relación

| Campo | Contenido | Guía |
|---|---|---|
| Código PRV y fecha de cierre | | |
| Motivo de la salida | | |
| Transición completada | | Sí · No; incidencias. |
| Certificado de borrado | | Referencia (sección 8). |
| Accesos revocados | | Fecha. |
| Coste real de salida frente al estimado | | |
| Lecciones aprendidas | | También en P30 si la salida acompaña a una retirada. |
| Estado final en T09 | | Finalizado. |

---

## 10. Criterios de calidad

| # | Comprobación | Estado |
|---|---|---|
| 1 | Cada proveedor en uso tiene un registro por servicio con nivel justificado por los cuatro factores (G3.20). | Cumple · No cumple · No aplica · Pendiente |
| 2 | Todo proveedor de un sistema en producción está en el registro con contrato firmado (G5.20). | |
| 3 | Ninguna revisión periódica está vencida; los cambios del proveedor se han revisado (R6.12). | |
| 4 | Los proveedores N2 tienen plan de salida documentado y los N3 alternativa y prueba documentada. | |
| 5 | Los indicadores de concentración se comparan con los límites de C2 y las superaciones tienen decisión del comité de IA. | |
| 6 | En cada retirada consta el borrado certificado y la baja de accesos (G7.12). | |
| 7 | Si aplica DORA, el registro de información está al día. | |
| 8 | Los proveedores se evalúan con los niveles N1–N3 (D6.08 del documento 11). | |

---

## 11. Aprobación y verificación

| Función | Rol en SEVEN-G | Nombre y cargo | Fecha | Firma o referencia |
|---|---|---|---|---|
| Mantiene el registro | Compras | | | |
| Revisa la relación | Gestor de la relación · responsable de operación de IA | | | |
| Elabora el plan de salida y la prueba de portabilidad | Responsable técnico de IA | | | |
| Verifica | Oficina de IA · Auditor de IA (G3, G5 y G7) | | | |
| Decide sobre concentración y riesgos Altos | Comité de IA | | | |

Separación de funciones: quien gestiona la relación con el proveedor no verifica sus revisiones ni la prueba de portabilidad; el borrado lo certifica el proveedor y lo verifica protección de datos.

---

## 12. Control de versiones

**Documento cumplimentado**

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| | | | |

**Plantilla**

| Versión | Fecha | Cambios |
|---|---|---|
| 0.1 | 19-09-2026 | Primera versión. Campos del registro de 36 §9, concentración de 36 §7.2, acta de revisión periódica (36 §5), plan de salida, prueba de portabilidad (36 §7.1), certificado de borrado y acta de cierre. Formato de trabajo de T09. |
