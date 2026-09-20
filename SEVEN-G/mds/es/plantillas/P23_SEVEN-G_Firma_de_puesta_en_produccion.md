# Firma de puesta en producción

**Registra la firma multinivel con capacidad de veto que autoriza a poner en producción un sistema de IA: quién firma, en qué sentido, cuándo y por qué.**

| | |
|---|---|
| Documento | Plantilla P23 · Firma de puesta en producción |
| Versión | 0.1 (borrador de trabajo) |
| Fecha | 16-09-2026 |
| Autor | Fernando García Varela |
| Estado | Borrador para revisión. |

---

> **Aviso legal y exención de responsabilidad.** SEVEN-G es un marco metodológico de referencia que se ofrece «tal cual» y con fines exclusivamente informativos. No constituye asesoramiento jurídico, regulatorio, financiero ni profesional, ni garantiza el cumplimiento de ninguna norma. Las referencias a regulación general (como el Reglamento Europeo de IA, el RGPD, DORA o NIS2), a normas técnicas y a regulación específica de cada sector o jurisdicción pueden ser incompletas, no aplicar a un caso concreto o quedar desactualizadas por cambios normativos, interpretaciones o criterios de las autoridades posteriores a su fecha de consulta. **Cada organización que use SEVEN-G es la única responsable de identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio**, con el asesoramiento cualificado que corresponda. El autor no asume responsabilidad alguna por el uso que se haga de este contenido ni por las decisiones que se adopten con él. Los datos, cifras, compañías y casos de los ejemplos son ficticios o ilustrativos.

## 1. Instrucciones de uso

| Aspecto | Indicación |
|---|---|
| **Cuándo se usa** | Fase 5, una vez completas las evidencias de la fase y antes de la decisión de G5. También ante un cambio relevante que suponga una nueva puesta en producción (P27). |
| **Quién la rellena** | La oficina de IA prepara el registro; cada firmante cumplimenta su propia fila. |
| **Quién la verifica** | Auditor de IA (Enterprise); oficina de IA (Lite) (01 §7.5). |
| **En qué *gate* se revisa** | G5 · Puesta en producción. En Enterprise, el comité de IA decide **tras** la firma multinivel (01 §7.5). |
| **Lite frente a Enterprise** | **Enterprise:** firma multinivel obligatoria con los cuatro firmantes del bloque 5 (01 §6.7). **Lite:** basta la conformidad del responsable de riesgos de IA; se usa solo la fila correspondiente y los bloques 3, 4 y 7. Los campos que Lite puede omitir se marcan **(Enterprise)**. |
| **Herramienta** | T03 Gestor de *gates*. |
| **Relación** | P12 Registro de riesgos · P17 Supervisión humana · P18 Diseño de seguridad · P19 Prueba de reversión · P21 Informe de entrega · P22 Resultados de validación y del piloto · P29 Registro de decisión de *gate*. |

Reglas de la firma:

1. **Sentido de la firma:** Conforme · Conforme con condiciones · Veto. Toda firma lleva fecha y motivo, también la conforme.
2. **El veto bloquea** la puesta en producción. No puede ser anulado por el patrocinador ni por el comité de IA; solo se levanta cuando quien lo emitió (o quien le sustituya formalmente en su función) registra una nueva firma tras resolverse el motivo. La discrepancia persistente sobre un veto debería elevarse al órgano superior, que puede decidir no poner en producción, pero no sustituir la firma.
3. **Conforme con condiciones** solo cabe sobre aspectos no críticos. Si la condición afecta a un control crítico de seguridad, cumplimiento legal o supervisión humana, el sentido debe ser Veto (01 §7.3).
4. Cada firmante revisa las evidencias de su ámbito; firmar sin haberlas revisado es una no conformidad.
5. Los firmantes de la segunda línea no forman parte del equipo que construye la iniciativa (01 §8.1 y §8.3).
6. Un riesgo residual **Crítico** sin aprobación expresa del consejo o de su comisión delegada bloquea G5 (documento 33).

Esta plantilla no constituye asesoramiento jurídico.

---

## 2. Identificación

| Campo | Contenido | Guía |
|---|---|---|
| Código de la iniciativa | | IA-AAAA-NNN (T01). |
| Nombre de la iniciativa | | |
| Sistema(s) de IA | | Identificador en el inventario (T02). |
| Intensidad | | Lite · Enterprise. |
| Nivel de ambición | | Optimizar · Aumentar · Transformar. |
| Clasificación regulatoria | | Prohibido · Alto riesgo · Obligaciones de transparencia · Riesgo mínimo · Fuera de ámbito · Pendiente de clasificar. Un sistema *Prohibido* o *Pendiente de clasificar* no puede firmarse. |
| Nivel de autonomía | | A0 · A1 · A2 · A3 (P17). |
| Tipo de puesta en producción | | Inicial · Cambio relevante · Ampliación de alcance. |
| Versión del documento | | |
| Fecha de apertura del registro | | DD-MM-AAAA. |
| Estado del registro | | Abierto a firmas · Firmas completas · Bloqueado por veto · Cerrado. |

---

## 3. Requisitos previos

Si alguno obligatorio está en *No cumple* o *Pendiente*, no se abre la ronda de firmas.

| # | Requisito | Evidencia | Estado (Cumple · No cumple · No aplica · Pendiente) |
|---|---|---|---|
| 1 | G4 aprobado y sus condiciones cumplidas | P29 de G4 · P21 bloque 5 | |
| 2 | Informe de entrega verificado | P21 | |
| 3 | Resultados de validación y del piloto verificados | P22 | |
| 4 | Prueba de reversión superada | P19 bloque 10 | |
| 5 | Pruebas de seguridad e inyección de instrucciones ejecutadas y hallazgos críticos resueltos | P18 bloque 11 | |
| 6 | Registro de riesgos actualizado; ningún riesgo residual Crítico sin aprobación del consejo | P12 | |
| 7 | Clasificación regulatoria y evaluaciones de impacto aplicables completadas | P11 | |
| 8 | Supervisión humana operativa y supervisores formados | P17 · P20 | |
| 9 | Manual de operación, monitorización y plan de respuesta a incidentes disponibles | P24 · P25 · P26 | |
| 10 | Inventario de sistemas de IA actualizado | P05 · T02 | |
| 11 | Contratos y garantías de proveedores vigentes **(Enterprise)** | P14 | |

---

## 4. Alcance de lo que se autoriza

| Campo | Contenido | Guía |
|---|---|---|
| Versión autorizada | | Modelo, instrucciones y configuración (P16). Otra versión requiere nueva firma. |
| Población y perímetro | | Áreas, canales, países, clientes o casos incluidos. |
| Nivel de autonomía autorizado | | No puede superar el de P17. |
| Despliegue gradual | | Sí · No. Si es Sí, etapas y criterio para pasar de una a otra. |
| Fecha prevista de puesta en producción | | |
| Periodo de vigilancia reforzada **(Enterprise)** | | Duración y qué se vigila con más frecuencia. |

---

## 5. Firmas multinivel

**Sentido:** Conforme · Conforme con condiciones · Veto.

| Firmante | Qué atestigua | Nombre y cargo | Fecha | Sentido | Motivo | Evidencias revisadas |
|---|---|---|---|---|---|---|
| **Responsable técnico de IA** | La solución entregada corresponde al diseño aprobado, las pruebas técnicas son válidas y la reversión funciona. | | | | | |
| **Riesgos y cumplimiento** | Los riesgos están evaluados y tratados dentro del apetito de riesgo; las obligaciones regulatorias aplicables están cubiertas. | | | | | |
| **Seguridad de la información** | Los controles de seguridad, incluidos los de agentes, están implantados y probados. | | | | | |
| **Protección de datos** | El tratamiento tiene base legal, se han realizado las evaluaciones de impacto que proceden y se respetan los derechos de las personas. | | | | | |
| Responsable de operación de IA *(recomendada)* | La operación está preparada para asumir el sistema. | | | | | |
| **Patrocinador de IA** | Asume el valor y la inversión y acepta las condiciones. No sustituye ni anula ninguna firma anterior. | | | | | |

Ejemplo de fila cumplimentada *(ejemplo ilustrativo)*:

| Firmante | Qué atestigua | Nombre y cargo | Fecha | Sentido | Motivo | Evidencias revisadas |
|---|---|---|---|---|---|---|
| Protección de datos | Base legal, evaluaciones y derechos | Delegada de protección de datos | 12-05-2026 | Conforme con condiciones | Tratamiento conforme; falta actualizar la cláusula informativa del canal web, aspecto no crítico porque el canal no se activa hasta la segunda etapa del despliegue | P11 v1.2, P16 v1.0 |

---

## 6. Condiciones de las firmas

| # | Firmante que la impone | Condición | ¿Afecta a un control crítico? (debe ser No) | Responsable | Plazo | Cómo se verificará | Estado (Abierta · Cumplida · Vencida) |
|---|---|---|---|---|---|---|---|
| 1 | | | | | | | |
| 2 | | | | | | | |

Las condiciones se trasladan a P29 para que el órgano que decide G5 las haga suyas. Una condición vencida sin cumplir convierte el resultado en Iterar (01 §7.4, regla 4).

---

## 7. Resultado de la ronda de firmas

| Campo | Contenido | Guía |
|---|---|---|
| Resultado | | Todas conformes · Conformes con condiciones · Bloqueada por veto. |
| Vetos registrados | | Firmante, motivo y qué debe resolverse para levantarlo. |
| Fecha de cierre de la ronda | | |
| Remisión al órgano que decide | | Comité de IA (Enterprise) · Patrocinador con conformidad de riesgos (Lite). Referencia a P29. |
| Fecha efectiva de puesta en producción | | Se completa tras la decisión de G5. |

---

## 8. Historial de cambios de sentido

Toda modificación de una firma se registra; no se sobrescribe la firma anterior.

| Fecha | Firmante | Sentido anterior | Nuevo sentido | Motivo del cambio | Evidencia |
|---|---|---|---|---|---|
| | | | | | |

---

## 9. Criterios de calidad

Criterios formales de G5 en el documento 21; lista LV-G5 en el documento 22.

| # | Comprobación | Estado (Cumple · No cumple · No aplica · Pendiente) |
|---|---|---|
| 1 | Los requisitos previos obligatorios están en *Cumple* antes de la primera firma. | |
| 2 | En Enterprise constan las cuatro firmas obligatorias, cada una con fecha, sentido y motivo. | |
| 3 | Ninguna condición afecta a controles críticos de seguridad, cumplimiento o supervisión humana. | |
| 4 | Los firmantes de la segunda línea no pertenecen al equipo que construye. | |
| 5 | No hay veto vigente en el momento de la decisión de G5. | |
| 6 | El alcance autorizado coincide con la versión y el nivel de autonomía probados. | |
| 7 | Las firmas son anteriores a la fecha de decisión de G5 y a la puesta en producción. | |

---

## 10. Aprobación y verificación

| Función | Rol | Nombre | Fecha | Firma o referencia |
|---|---|---|---|---|
| Preparación del registro | Oficina de IA | | | |
| Verificador | Oficina de IA (Lite) · Auditor de IA (Enterprise) | | | |
| Decisor de G5 | Patrocinador con conformidad de riesgos (Lite) · Comité de IA (Enterprise) | | | |
| ☐ Declaración: «La organización confirma que la clasificación y el cumplimiento regulatorio han sido verificados con asesoramiento cualificado y asume su responsabilidad; SEVEN-G es solo una referencia metodológica.» | Decisor de G5 | | | |

Separación de funciones: el verificador no forma parte del equipo que construye. En Enterprise, el auditor de IA no firma en el bloque 5. En Lite, 01 §7.5 asigna la verificación a la oficina de IA y la conformidad al responsable de riesgos de IA, que no puede verificar y dar conformidad a la vez.

---

## 11. Control de versiones

| Versión | Fecha | Cambios |
|---|---|---|
| 0.1 | 16-09-2026 | Primera versión de la plantilla. Ajustes de coherencia con 01 (separación de funciones en Lite, resultados de R6, criterio de agentes) y con 34 y 37. |
