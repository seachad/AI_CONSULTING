# Informe de entrega

**Deja constancia de qué se ha construido o integrado frente al diseño aprobado en G4, con qué coste y plazo, y en qué estado se entrega a la operación.**

| | |
|---|---|
| Documento | Plantilla P21 · Informe de entrega |
| Versión | 0.1 (borrador de trabajo) |
| Fecha | 16-09-2026 |
| Autor | Fernando García · SEACHAD |
| Estado | Borrador para revisión. |

---

> **Aviso legal y exención de responsabilidad.** SEVEN-G es un marco metodológico de referencia que se ofrece «tal cual» y con fines exclusivamente informativos. No constituye asesoramiento jurídico, regulatorio, financiero ni profesional, ni garantiza el cumplimiento de ninguna norma. Las referencias a regulación general (como el Reglamento Europeo de IA, el RGPD, DORA o NIS2), a normas técnicas y a regulación específica de cada sector o jurisdicción pueden ser incompletas, no aplicar a un caso concreto o quedar desactualizadas por cambios normativos, interpretaciones o criterios de las autoridades posteriores a su fecha de consulta. **Cada organización que use SEVEN-G es la única responsable de identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio**, con el asesoramiento cualificado que corresponda. El autor y SEACHAD no asumen responsabilidad alguna por el uso que se haga de este contenido ni por las decisiones que se adopten con él. Los datos, cifras, compañías y casos de los ejemplos son ficticios o ilustrativos.

## 1. Instrucciones de uso

| Aspecto | Indicación |
|---|---|
| **Cuándo se usa** | Fase 5 (Entrega y validación), al terminar la construcción o integración y antes de solicitar G5. |
| **Quién la rellena** | Responsable técnico de IA, con el responsable de producto de IA. Si hay proveedor, este aporta la información, pero el informe lo firma el responsable técnico de la compañía. |
| **Quién la verifica** | Responsable de riesgos de IA en Lite; auditor de IA en Enterprise. |
| **En qué *gate* se revisa** | G5 · Puesta en producción. |
| **Lite frente a Enterprise** | Lite puede omitir los campos marcados **(Enterprise)**. |
| **Relación** | P15–P20 (diseño aprobado) · P22 Resultados de validación y del piloto · P23 Firma de puesta en producción · P24 Manual de operación · P29 Registro de decisión de G4 (condiciones) · documentos 42 (Costes) y 53 (Construcción de soluciones). |

Reglas:

- El informe compara lo entregado con **lo aprobado**, no con lo que se pensaba hacer al final. Todo cambio frente al diseño se declara y se justifica.
- Las condiciones impuestas en G4 se verifican aquí; una condición vencida sin cumplir convierte el resultado en Iterar (01 §7.4, regla 4).
- Los costes reales se expresan en euros por categoría de coste y se distingue la inversión del coste recurrente.

---

## 2. Identificación

| Campo | Contenido | Guía |
|---|---|---|
| Código de la iniciativa | | IA-AAAA-NNN (T01). |
| Nombre de la iniciativa | | |
| Sistema(s) de IA | | Identificador en el inventario (T02). |
| Versión entregada | | Versión de modelo, instrucciones y configuración (P16). |
| Intensidad | | Lite · Enterprise. |
| Nivel de ambición | | Optimizar · Aumentar · Transformar. |
| Proveedores que han intervenido | | Nombre y referencia a P14. |
| Versión del documento | | |
| Autor | | Rol y nombre. |
| Fecha | | DD-MM-AAAA. |
| Estado del documento | | Borrador · Presentado para verificación · Verificado · Aprobado · Sustituido. |

---

## 3. Resumen de la entrega

| Campo | Contenido | Guía |
|---|---|---|
| Qué se ha entregado | | En tres a cinco líneas, en lenguaje comprensible. |
| Diferencias principales con el diseño aprobado | | Resumen del bloque 4. |
| Estado para la puesta en producción | | Preparado · Preparado con pendientes no críticos · No preparado. |
| Pendientes críticos | | Si existen, el estado no puede ser "Preparado". |

---

## 4. Alcance entregado frente al diseño aprobado

**Estado:** Entregado según diseño · Entregado con cambios · No entregado.

| Elemento del diseño | Evidencia de diseño | Estado | Cambios y justificación | ¿Afecta a riesgos, supervisión o seguridad? (Sí · No) | Aprobación del cambio |
|---|---|---|---|---|---|
| Arquitectura e integraciones | P15 | | | | |
| Datos y modelos | P16 | | | | |
| Supervisión humana | P17 | | | | |
| Controles de seguridad y de agentes | P18 | | | | |
| Mecanismo de reversión e interruptor de parada | P19 | | | | |
| Formación y adopción | P20 | | | | |
| Monitorización y alertas | P25 | | | | |
| Integración con el sistema del proveedor *(ejemplo ilustrativo)* | P15 | Entregado con cambios | Se sustituye la conexión en tiempo real por carga cada hora por limitaciones del proveedor | Sí: retraso de hasta una hora en los datos de entrada | Responsable técnico con conformidad de riesgos |

Si un cambio afecta a riesgos, supervisión humana o seguridad, debe actualizarse la evidencia de diseño correspondiente y el registro de riesgos (P12) antes de G5.

---

## 5. Condiciones pendientes de *gates* anteriores

**Estado:** Cumplida · No cumplida · Vencida.

| Condición | *Gate* de origen | Responsable | Plazo | Estado | Evidencia |
|---|---|---|---|---|---|
| | | | | | |
| | | | | | |

---

## 6. Documentación entregada

| Documento | Entregado (Sí · No · No aplica) | Versión | Ubicación |
|---|---|---|---|
| Documentación técnica del sistema | | | |
| Linaje de datos y modelos actualizado (P16) | | | |
| Manual de usuario | | | |
| Manual de operación en borrador (P24) | | | |
| Configuración de monitorización y alertas (P25) | | | |
| Plan de respuesta a incidentes (P26) | | | |
| Documentación técnica exigida por la regulación para sistemas de alto riesgo **(Enterprise)** | | | Referencia al mapeo regulatorio (documento 34). |
| Documentación y garantías del proveedor **(Enterprise)** | | | |

---

## 7. Costes reales frente a previstos

Importes en euros. "Previsto" es lo aprobado en G3 (P10) o, si se actualizó, en G4.

| Categoría de coste | Inversión prevista | Inversión real | Coste recurrente anual previsto | Coste recurrente anual actualizado | Desviación y explicación |
|---|---|---|---|---|---|
| Licencias | | | | | |
| Consumo de modelos | | | | | |
| Cómputo e infraestructura | | | | | |
| Datos | | | | | |
| Personas de construcción | | | — | — | |
| Personas de operación | — | — | | | |
| Proveedores y servicios | | | | | |
| Control y cumplimiento | | | | | |
| Adopción y formación | | | | | |
| **Total** | | | | | |

Si el coste recurrente actualizado cambia el valor neto anual esperado, se recalcula en P22 y se señala al decisor del *gate*.

---

## 8. Plazos

| Hito | Fecha prevista | Fecha real | Días de desviación | Causa |
|---|---|---|---|---|
| Aprobación de G4 | | | | |
| Inicio de la construcción | | | | |
| Fin de la construcción | | | | |
| Inicio del piloto | | | | |
| Solicitud de G5 prevista | | | | |

Si la fase 5 supera el plazo de referencia aprobado en C2 (03 §3.6), indique los periodos en espera y su motivo.

---

## 9. Limitaciones conocidas, deuda técnica y riesgos abiertos

| # | Descripción | Tipo (Limitación · Deuda técnica · Riesgo abierto) | Efecto en operación | Tratamiento | Responsable | Fecha |
|---|---|---|---|---|---|---|
| 1 *(ejemplo ilustrativo)* | Los reentrenamientos requieren intervención manual | Deuda técnica | Mayor dependencia de dos personas | Automatizar antes del segundo R6 | Responsable técnico de IA | |
| | | | | | | |

---

## 10. Traspaso a la operación

| Comprobación | Estado (Cumple · No cumple · No aplica · Pendiente) | Observaciones |
|---|---|---|
| El responsable de operación de IA ha recibido y revisado la documentación. | | |
| Accesos, credenciales y permisos de operación configurados y revisados. | | |
| Alertas conectadas a los destinatarios de guardia. | | |
| Personal de operación formado en reversión e interruptor de parada. | | |
| Acuerdos de soporte con proveedores vigentes **(Enterprise)** | | |
| Inventario de sistemas de IA actualizado con la versión entregada. | | |

---

## 11. Criterios de calidad

Criterios formales de G5 en el documento 21; lista LV-G5 en el documento 22.

| # | Comprobación | Estado (Cumple · No cumple · No aplica · Pendiente) |
|---|---|---|
| 1 | Todo elemento del diseño tiene estado de entrega y los cambios están justificados y aprobados. | |
| 2 | Los cambios que afectan a riesgos, supervisión o seguridad han actualizado sus evidencias. | |
| 3 | Todas las condiciones de *gates* anteriores están cumplidas o se ha registrado su vencimiento. | |
| 4 | Los costes reales están por categoría, separando inversión y coste recurrente. | |
| 5 | Las limitaciones y riesgos abiertos tienen tratamiento y responsable. | |
| 6 | El traspaso a operación está completo o sus pendientes no son críticos. | |

---

## 12. Aprobación y verificación

| Función | Rol | Nombre | Fecha | Firma o referencia |
|---|---|---|---|---|
| Autor | Responsable técnico de IA | | | |
| Coautor | Responsable de producto de IA | | | |
| Recepción | Responsable de operación de IA | | | |
| Verificador | Responsable de riesgos de IA (Lite) · Auditor de IA (Enterprise) | | | |
| Decisor del *gate* | Según 01 §7.5 (registrado en P29) | | | |

Separación de funciones: el verificador no forma parte del equipo que construye.

---

## 13. Control de versiones

| Versión | Fecha | Cambios |
|---|---|---|
| 0.1 | 16-09-2026 | Primera versión de la plantilla. |
