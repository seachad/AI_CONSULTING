# Evaluación de viabilidad

**Reúne la evidencia técnica, de datos, económica, organizativa, regulatoria y de riesgo necesaria para decidir en G3 si la iniciativa continúa o se para.**

| | |
|---|---|
| Documento | Plantilla P10 · Evaluación de viabilidad |
| Versión | 0.1 (borrador de trabajo) |
| Fecha | 16-09-2026 |
| Autor | Fernando García Varela |
| Estado | Borrador para revisión. |

---

> **Aviso legal y exención de responsabilidad.** SEVEN-G es un marco metodológico de referencia que se ofrece «tal cual» y con fines exclusivamente informativos. No constituye asesoramiento jurídico, regulatorio, financiero ni profesional, ni garantiza el cumplimiento de ninguna norma. Las referencias a regulación general (como el Reglamento Europeo de IA, el RGPD, DORA o NIS2), a normas técnicas y a regulación específica de cada sector o jurisdicción pueden ser incompletas, no aplicar a un caso concreto o quedar desactualizadas por cambios normativos, interpretaciones o criterios de las autoridades posteriores a su fecha de consulta. **Cada organización que use SEVEN-G es la única responsable de identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio**, con el asesoramiento cualificado que corresponda. El autor no asume responsabilidad alguna por el uso que se haga de este contenido ni por las decisiones que se adopten con él. Los datos, cifras, compañías y casos de los ejemplos son ficticios o ilustrativos.

## 1. Instrucciones de uso

| Aspecto | Indicación |
|---|---|
| **Cuándo se usa** | En la fase 3 (Viabilidad y riesgo), antes de G3, que es la principal puerta de parada del ciclo. |
| **Quién la rellena** | El responsable de producto de IA (viabilidad económica y organizativa) y el responsable técnico de IA (viabilidad técnica y de datos). El responsable de riesgos aporta el resumen de P11, P12, P13 y P14. |
| **Quién la verifica** | Lite: responsable de riesgos de IA. Enterprise: auditor de IA. Si el responsable de riesgos ha elaborado partes de este documento, en Lite verifica la oficina de IA o el auditor de IA. |
| **Quién decide** | Lite: patrocinador con conformidad de riesgos. Enterprise: comité de IA. |
| **Gate en que se revisa** | G3 · Viabilidad. |
| **Herramienta** | No tiene herramienta propia; los costes pueden calcularse con T13 y el valor con T11. |
| **Lite frente a Enterprise** | Lite puede omitir los campos y bloques marcados **(Enterprise)**. |

Reglas de cumplimentación:

- La viabilidad se **demuestra con datos reales**, no con supuestos (01 §6.5).
- Las prácticas prohibidas por la regulación **no pasan de esta fase en ningún caso**.
- Ningún riesgo residual Crítico sin la aprobación prevista en P12 puede superar G3.
- Los costes son **completos**: construcción, recurrentes y de adopción.

---

## 2. Identificación

| Campo | Contenido | Guía |
|---|---|---|
| Código de la iniciativa | | IA-AAAA-NNN. |
| Nombre de la iniciativa | | |
| Nivel de ambición confirmado | | Optimizar · Aumentar · Transformar. |
| Intensidad | | Lite · Enterprise (revisada en G3 con P04). |
| Versión del documento | | |
| Fecha | | DD-MM-AAAA. |
| Autores | | Nombres y roles por bloque. |

---

## 3. Resumen y recomendación

| Campo | Contenido | Guía |
|---|---|---|
| Conclusión técnica | | Viable · Viable con condiciones · No viable. |
| Conclusión de datos | | Viable · Viable con condiciones · No viable. |
| Conclusión económica | | Viable · Viable con condiciones · No viable. |
| Conclusión organizativa | | Viable · Viable con condiciones · No viable. |
| Conclusión regulatoria y de riesgo | | Viable · Viable con condiciones · No viable. |
| **Recomendación al órgano de decisión** | | Continuar · Continuar con condiciones · Iterar · Pivotar · Parar. |
| Motivo principal | | Dos o tres frases. |

---

## 4. Viabilidad técnica

| Campo | Contenido | Guía |
|---|---|---|
| Enfoque técnico evaluado | | Tipo de solución, modelos, construir o comprar. |
| Pruebas realizadas | | Prueba de concepto o experimento, con fechas y datos reales usados. |
| Integración | | Sistemas con los que debe integrarse y complejidad identificada. |
| Escalabilidad y rendimiento | | Volúmenes previstos y resultados de pruebas. |
| Madurez de la tecnología y del proveedor | | Estabilidad, soporte, hoja de ruta. |
| Capacidades internas | | Conocimientos disponibles y carencias. |
| Reversibilidad preliminar | | Cómo podría detenerse o volver al proceso anterior. |

| Requisito | Umbral exigido | Resultado obtenido | Cumple |
|---|---|---|---|
| | | | Sí · No · Parcial |
| *(ejemplo ilustrativo)* Respuestas correctas sobre estado de pedido (muestra revisada) | ≥ 95 % | 96,8 % sobre 1.000 conversaciones de prueba | Sí |
| *(ejemplo ilustrativo)* Tiempo de respuesta | ≤ 5 s en el 95 % | 3,2 s | Sí |
| *(ejemplo ilustrativo)* Resistencia a inyección de instrucciones | 0 fugas de datos de otros clientes | 2 fugas en 300 ataques de prueba | No |

---

## 5. Viabilidad de datos

| Fuente | Disponibilidad | Calidad | Base jurídica y finalidad | Sesgos o limitaciones | Acción necesaria | Resultado |
|---|---|---|---|---|---|---|
| | Disponible · Parcial · No disponible | Completitud, exactitud, actualidad | | | | Viable · Con condiciones · No viable |
| *(ejemplo ilustrativo)* Sistema logístico de pedidos | Disponible por API | 99 % de pedidos con estado actualizado en menos de 1 h | Ejecución del contrato con el cliente | No refleja incidencias de transportistas externos | Integrar avisos del transportista | Con condiciones |

---

## 6. Viabilidad económica

### 6.1 Costes completos

| Categoría | Inversión única (€) | Coste recurrente anual (€) | Supuestos |
|---|---|---|---|
| Licencias | | | |
| Consumo de modelos | | | |
| Cómputo e infraestructura | | | |
| Datos | | | |
| Personas de construcción | | | |
| Personas de operación | | | |
| Proveedores y servicios | | | |
| Control y cumplimiento | | | |
| Adopción y formación | | | |
| **Total** | | | |

### 6.2 Resultado económico

| Concepto | Valor | Guía |
|---|---|---|
| Eficiencias anuales esperadas (€) | | De P08, actualizadas con lo aprendido en la fase 3. |
| Retorno anual esperado (€) | | De P08. |
| Coste recurrente anual (€) | | De 6.1. |
| **Valor neto anual esperado (€)** | | Eficiencias + retorno − coste recurrente. |
| Inversión adicional necesaria (€) | | De 6.1. |
| **Neto adicional por euro** | | Neto anual adicional esperado ÷ inversión adicional necesaria. |
| Horizonte fijado en C2 | | ¿El neto esperado es coherente con el horizonte? Sí · No. |
| Escenarios **(Enterprise)** | | Valor neto anual en escenario prudente, central y favorable, con los supuestos que cambian. |
| Estado de los importes | | En esta fase, normalmente *estimado*. |

---

## 7. Viabilidad organizativa y de adopción

| Campo | Contenido | Guía |
|---|---|---|
| Usuarios y cambio en su trabajo | | Qué tareas cambian, cuántas personas y en qué medida. |
| Efecto sobre roles y puestos | | Cambios de rol, reasignación de capacidad, necesidades de formación. |
| Disposición a la adopción | | Evidencias: pruebas con usuarios, resistencias detectadas. |
| Capacidad para operar | | Quién operará el sistema y si tiene capacidad. |
| Relaciones laborales **(Enterprise)** | | Obligaciones de información o consulta y estado. |
| Plan de adopción preliminar | | Referencia a P20, que se completa en la fase 4. |

---

## 8. Viabilidad regulatoria y de riesgo

| Campo | Contenido | Guía |
|---|---|---|
| Clasificación regulatoria | | Taxonomía de 03 §3.3, con referencia a P11 y a la validación jurídica. |
| Práctica prohibida | | Sí · No. Si es "Sí", la recomendación es **Parar**. |
| Evaluaciones de impacto | | Evaluación de impacto en protección de datos y evaluación de impacto en derechos fundamentales: realizadas, no requeridas o pendientes. |
| Riesgos residuales Altos y Críticos | | Número y referencia a P12; aprobación de aceptación cuando corresponda. |
| Plan de mitigación y contingencia | | Referencia a P13. |
| Proveedores | | Nivel de exigencia y conclusión de P14. |
| Encaje con el apetito de riesgo de C2 | | Sí · No, con justificación. |

---

## 9. Comprobación por nivel de ambición en G3

Referencia: 01 §7.6.

| Nivel | Qué debe demostrarse | Resultado | Cumple |
|---|---|---|---|
| Optimizar | Neto anual esperado positivo dentro del horizonte fijado en C2. | | Sí · No · No aplica |
| Aumentar | Viabilidad de la adopción y del cambio de rol, además del neto esperado. | | |
| Transformar | Viabilidad de la primera etapa; criterios de parada por etapa; valor de opción documentado. | | |

---

## 10. Condiciones propuestas

| Nº | Condición | Plazo | Responsable | *Gate* en que se verifica |
|---|---|---|---|---|
| 1 | | | | |
| *(ejemplo ilustrativo)* 1 | Corregir la vulnerabilidad a inyección de instrucciones y repetir la prueba con 0 fugas. | Antes de G4 | Responsable técnico | G4 |

No se admite "Continuar con condiciones" para controles críticos de seguridad, cumplimiento legal o supervisión humana (01 §7.3). En el ejemplo, la condición afecta a un control crítico de seguridad: la recomendación correcta sería **Iterar** hasta corregirla.

---

## 11. Criterios de calidad

Los criterios formales de G3 están en el documento 21 (ver criterios G3.xx).

| # | Comprobación | Estado |
|---|---|---|
| 1 | La viabilidad técnica se basa en pruebas con datos reales. | Cumple · No cumple · No aplica · Pendiente |
| 2 | Cada fuente de datos tiene disponibilidad, calidad y base jurídica evaluadas. | |
| 3 | Los costes cubren las nueve categorías y distinguen inversión y recurrente. | |
| 4 | Valor neto anual y neto adicional por euro están calculados con estado. | |
| 5 | El impacto en las personas está valorado. | |
| 6 | Existen P11, P12, P13 y, si hay proveedores, P14. | |
| 7 | No hay prácticas prohibidas ni riesgos Críticos sin la aprobación exigida. | |
| 8 | Se aplican los criterios de G3 del nivel de ambición. | |
| 9 | Las condiciones propuestas no afectan a controles críticos. | |

---

## 12. Aprobación y verificación

| Función | Rol en SEVEN-G | Nombre y cargo | Fecha | Firma o referencia |
|---|---|---|---|---|
| Elabora (económica y organizativa) | Responsable de producto de IA | | | |
| Elabora (técnica y datos) | Responsable técnico de IA | | | |
| Emite conformidad de riesgos | Responsable de riesgos de IA | | | |
| Verifica | Responsable de riesgos (Lite) · Auditor de IA (Enterprise) | | | |
| Decide | Patrocinador con conformidad de riesgos (Lite) · Comité de IA (Enterprise) | | | |

Separación de funciones: nadie verifica un bloque que ha elaborado. La conformidad de riesgos y la verificación son actos distintos y deben constar por separado.

---

## 13. Control de versiones

**Documento cumplimentado**

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| | | | |

**Plantilla**

| Versión | Fecha | Cambios |
|---|---|---|
| 0.1 | 16-09-2026 | Primera versión. Estructura alineada con 01 §6.5 y §7.6 y con las categorías de coste de la especificación común §5.7. |
