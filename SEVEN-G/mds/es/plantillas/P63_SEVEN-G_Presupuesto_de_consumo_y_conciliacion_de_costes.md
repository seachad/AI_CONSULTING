# Presupuesto de consumo y conciliación de costes

**Fija el presupuesto de consumo de cada caso con sus alertas y su cascada de degradación, registra las claves de reparto de los costes compartidos, concilia el coste de IA con la contabilidad y calcula el coste de parar.**

| | |
|---|---|
| Documento | Plantilla P63 · Presupuesto de consumo y conciliación de costes |
| Versión | 0.1 (borrador de trabajo) |
| Fecha | 19-09-2026 |
| Autor | Fernando García · SEACHAD |
| Estado | Borrador para revisión. |

---

> **Aviso legal y exención de responsabilidad.** SEVEN-G es un marco metodológico de referencia que se ofrece «tal cual» y con fines exclusivamente informativos. No constituye asesoramiento jurídico, regulatorio, financiero ni profesional, ni garantiza el cumplimiento de ninguna norma. Las referencias a regulación general (como el Reglamento Europeo de IA, el RGPD, DORA o NIS2), a normas técnicas y a regulación específica de cada sector o jurisdicción pueden ser incompletas, no aplicar a un caso concreto o quedar desactualizadas por cambios normativos, interpretaciones o criterios de las autoridades posteriores a su fecha de consulta. **Cada organización que use SEVEN-G es la única responsable de identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio**, con el asesoramiento cualificado que corresponda. El autor y SEACHAD no asumen responsabilidad alguna por el uso que se haga de este contenido ni por las decisiones que se adopten con él. Los datos, cifras, compañías y casos de los ejemplos son ficticios o ilustrativos.

> **Por qué importa.** El coste de la IA generativa y de los agentes es variable y puede dispararse en días. Si el consumo no tiene presupuesto, alertas y una respuesta definida, al agotarse el dinero solo quedan dos malas opciones: cortar el servicio o seguir gastando. Si los costes compartidos se reparten sin claves aprobadas, el coste de cada caso se discute en cada comité y el neto deja de ser comparable. Y si el coste de IA no se concilia con la contabilidad, el consejo no puede fiarse de ninguna cifra de valor neto. Esta plantilla deja esas tres cosas registradas y verificables.

## 1. Instrucciones de uso

| Aspecto | Indicación |
|---|---|
| **Cuándo se usa** | Presupuesto, alertas, límites y cascada (secciones 3 a 7): se aprueban en G5 y se revisan en cada R6. Seguimiento (sección 8): cada mes. Claves de reparto (sección 9): en C3, una vez por ejercicio. Conciliación (sección 10): en cada cierre mensual. Coste de parar (sección 11): al registrar una parada o una retirada. |
| **Quién la rellena** | Secciones 3 a 8: responsable de operación de IA con el responsable técnico. Secciones 9 y 10: control de gestión con la oficina de IA. Sección 11: responsable de producto de IA con control de gestión. |
| **Quién la verifica** | Oficina de IA en Lite; auditor de IA en Enterprise (42 §11.2). |
| **Quién decide o aprueba** | El presupuesto de consumo se aprueba con la decisión de G5 (órgano de 01 §7.5). Las claves de reparto, el comité de IA con control de gestión en C3. Los suplementos de presupuesto, el patrocinador de IA con la oficina de IA. |
| **Etapa, *gate* o momento** | G5, R6, C3, cierre mensual y cierre anual; parada o retirada. |
| **Herramienta** | T13 · Calculadora de costes por caso (módulos de parámetros, consumo, costes compartidos, conciliación y paradas, 42 §12). |
| **Documento de referencia** | Documento 42 (§6, §7, §8, §10, §11); documento 52 §10.3 (cascada de degradación por coste); P24 y P25. |
| **Lite frente a Enterprise** | Lite puede omitir los campos marcados **(Enterprise)**. En la cascada, Lite define al menos N1 y N4; Enterprise la define completa y la prueba antes de G5 (52 §14). |

Reglas de cumplimentación:

- **El coste no se rebaja:** se imputa completo desde el primer día; un coste desconocido es "sin dato" y el neto también (42 §2).
- **Sin etiqueta no hay recurso:** cada recurso, clave de acceso a modelos y licencia lleva la etiqueta de su iniciativa (42 §7). El etiquetado se verifica en G5.
- **Las claves de reparto no se cambian a mitad de ejercicio** salvo error, y el cambio se registra.
- **La cascada reduce coste, no controles:** ninguna degradación desactiva filtros, supervisión humana, límites de agentes ni registros (52 §10.3, regla 6).
- Los umbrales de esta plantilla son orientativos; la compañía los fija en C2 (documento 13).

---

## 2. Identificación

| Campo | Contenido | Guía |
|---|---|---|
| Código de la iniciativa | | IA-AAAA-NNN (T01). En las secciones 9 y 10, «cartera» o la plataforma (`PLAT-` en la etiqueta, 42 §7.1). |
| Sistemas de IA | | SIA-AAAA-NNN (P05). |
| Tipo de sistema | | ML predictivo · IA generativa · Agente · IA de terceros embebida. |
| Intensidad | | Lite · Enterprise. |
| Ejercicio y periodo | | Por ejemplo, 2027 · marzo. |
| Versión de los parámetros de T13 | | Parámetros versionados por ejercicio. |
| Versión del documento, autor y fecha | | DD-MM-AAAA. |

---

## 3. Etiquetado y claves de acceso

| Etiqueta o clave | Valor | Verificado en G5 (Sí · No) |
|---|---|---|
| `iniciativa` | | |
| `sistema` | | |
| `entorno` | desarrollo · pruebas · preproducción · producción | |
| `centro_coste` | | |
| Clave de acceso a modelos por caso y entorno | | |
| Credenciales y presupuesto propios de cada agente | | |

---

## 4. Presupuesto de consumo del caso

| Categoría de coste variable | Presupuesto mensual (€) | Presupuesto anual (€) | Hipótesis de volumen | Fuente del consumo | Perfil no lineal (cierres, campañas) |
|---|---|---|---|---|---|
| Consumo de modelos | | | | Pasarela de modelos o facturación del proveedor | |
| Cómputo e infraestructura | | | | Facturación de nube | |
| Otros costes variables | | | | | |
| *(ejemplo ilustrativo)* Consumo de modelos del asistente de atención | 12.000 | 144.000 | 60.000 consultas al mes | Pasarela de modelos | Pico en la última semana del mes |

**Previsión de cierre del mes = consumo acumulado ÷ días transcurridos × días del mes.** Se recalcula a diario en agentes y en casos con exposición directa, y semanalmente en el resto (42 §8.1).

---

## 5. Alertas y respuesta

| Umbral | Valor aprobado | Alerta a | Respuesta | Enlace a P25 |
|---|---|---|---|---|
| Consumo sobre presupuesto (orientativo 50 %) | | Responsable de operación | Revisar la previsión. | |
| Consumo sobre presupuesto (orientativo 80 %) o previsión de cierre > 100 % | | Responsable de operación y de producto | Analizar la causa y decidir medidas; activar N1 si está definido. | |
| Consumo sobre presupuesto (orientativo 100 %) | | Patrocinador y oficina de IA | Nivel de la cascada que corresponda o suplemento con motivo. | |
| Consumo anómalo | | Responsable de operación y seguridad | Tratarlo como posible incidente (documento 37). | |

---

## 6. Límites técnicos por agente

Solo si el sistema incluye agentes. Se configuran en P18 y se comprueban en G5 (42 §8.3).

| Agente | Coste máximo por ejecución | Llamadas máximas por ejecución | Gasto máximo diario y mensual | Ejecuciones concurrentes | Acción al alcanzar el límite |
|---|---|---|---|---|---|
| | | | | | Detener · Derivar a una persona · Modo degradado, con registro |

El interruptor de parada del agente puede activarse también por motivo de coste.

---

## 7. Cascada de degradación por coste

Definida en P24, con la calidad mínima de P25 y el modelo de respaldo registrado en P16 (52 §10.3).

| Nivel | Qué se hace en este sistema | Disparador | Quién lo activa | Condición cumplida (Sí · No · No aplica) | Calidad mínima durante el nivel |
|---|---|---|---|---|---|
| N0 · Operación normal | Modelo principal y configuración de G5 | — | — | — | — |
| N1 · Optimización sin cambio de modelo | | *(ejemplo ilustrativo)* 80 % del presupuesto | | Parámetros dentro de los rangos de G5 | |
| N2 · Modelo de respaldo **(Enterprise; opcional en Lite)** | | *(ejemplo ilustrativo)* 100 % del presupuesto | | Evaluado antes de G5 con el conjunto de referencia y las pruebas de sesgo; versión en P16 | |
| N3 · Alcance reducido | | | | Criterio de reparto en P24 y personas disponibles | |
| N4 · Alternativa sin IA | | | | Plan de reversión probado (P19) | |

| Campo | Contenido | Guía |
|---|---|---|
| ¿El sistema decide o recomienda sobre personas, soporta una función crítica o es de alto riesgo? | | Si es Sí, no se usa N2 salvo validación específica para ese uso; se pasa a N3, N4 o suplemento (52 §10.3, regla 2). |
| Prueba de la cascada antes de G5 | | Fecha y resultado, junto con la prueba de reversión. |

---

## 8. Seguimiento mensual del consumo

| Mes | Presupuesto (€) | Consumo real (€) | % | Días en N1 · N2 · N3 · N4 | Calidad medida en el modo frente al mínimo (OPE-18) | Suplementos aprobados | Causa y acción |
|---|---|---|---|---|---|---|---|
| *(ejemplo ilustrativo)* Marzo 2027 | 12.000 | 12.600 | 105 % | 6 · 5 · 0 · 0 | 91 % frente a 88 % | No | Crecimiento del volumen real; la R6 ajusta el presupuesto |
| | | | | | | | |

Cada activación y cada vuelta a N0 se registran en P27. Más de un mes en N2 o superior se lleva a la siguiente R6 con propuesta: suplemento, optimización definitiva (42 §8.5) o cambio del modelo principal.

---

## 9. Claves de reparto de costes compartidos

Aprobadas en C3 por el comité de IA con control de gestión, para todo el ejercicio (42 §6 y §11.2). Método en el orden de 42 §6.1: imputación directa · consumo medido · inductor de coste · reparto ponderado.

| Nº | Coste compartido | Importe anual (€) | Método | Clave preferente | Clave alternativa | Lo que no se reparte a casos | Tolerancia de consumo sin etiquetar | Fecha de aprobación |
|---|---|---|---|---|---|---|---|---|
| CR-01 *(ejemplo ilustrativo)* | Plataforma de modelos compartida | 240.000 | Consumo medido | Consumo por clave de acceso | Llamadas por caso | Pruebas de la plataforma | 5 % | 15-01-2027 |
| CR-02 *(ejemplo ilustrativo)* | Oficina de IA | 280.000 | Reparto ponderado | Horas imputadas | Casos ponderados por intensidad (Enterprise 2, Lite 1) | 40 % de estructura corporativa | — | 15-01-2027 |
| CR-01 | | | | | | | | |

| Campo | Contenido | Guía |
|---|---|---|
| Cambios de clave durante el ejercicio | | Solo por error; fecha, motivo y quién lo aprueba. |
| Comprobación: suma repartida = total del coste compartido | | Por cada clave (42 §12). |

---

## 10. Conciliación mensual

**Coste total de IA en contabilidad = Σ coste imputado a casos + coste de uso corporativo + coste de estructura de gobierno + coste no atribuido** (42 §11.3).

| Mes | Coste total en contabilidad (€) | Imputado a casos (€) | Uso corporativo (€) | Estructura de gobierno (€) | No atribuido (€) (IND-COS-08) | Diferencia (€) | Explicación o corrección | Cierres consecutivos sin explicar |
|---|---|---|---|---|---|---|---|---|
| | | | | | | | | |

| Magnitud del cierre | Valor | Guía |
|---|---|---|
| Consumo sin etiquetar sobre tolerancia | | Si la supera, no se reparte: coste no atribuido y acción de etiquetado; dos cierres seguidos, no conformidad menor (42 §6.3). |
| Licencias ociosas (IND-COS-09) **(Enterprise)** | | Licencias asignadas sin uso × coste unitario. |
| Desviación presupuestaria por caso (IND-COS-04) | | Trimestral. |
| Diferencia sin explicar dos cierres consecutivos | | Se informa al comité de IA. |

---

## 11. Coste de parar e inversión evitada

Al registrar una parada o una retirada en T01 y T13 (42 §10).

| Magnitud | Importe (€) | Tratamiento |
|---|---|---|
| Presupuesto aprobado | | |
| Gastado hasta la decisión (coste hundido) | | No interviene en la decisión; se registra para lecciones. |
| Compromisos no cancelables | | Se informan aparte; se busca su reutilización. |
| Coste de parar (cierre, penalizaciones, conservación o borrado) | | Coste de la iniciativa. |
| **Inversión evitada = aprobado − gastado − compromisos** | | IND-COS-10. No suma en el valor. |
| Coste recurrente evitado estimado | | Estimado. No suma en el valor. |

*(Ejemplo ilustrativo)* Aprobado 400.000 €; gastado 45.000 €; compromisos 20.000 €; penalización 8.000 € y cierre 5.000 €. Coste de parar: 13.000 €. Inversión evitada: 335.000 €.

---

## 12. Criterios de calidad

Criterios formales en el documento 21 (G3.04, G4.08, G4.16, G5.16, R6.03 y G7.05); reglas en el documento 42.

| # | Comprobación | Estado |
|---|---|---|
| 1 | El caso tiene etiquetas y claves propias verificadas antes de G5. | Cumple · No cumple · No aplica · Pendiente |
| 2 | El presupuesto de consumo es mensual y anual, con hipótesis de volumen, y está aprobado en G5. | |
| 3 | Cada umbral de alerta tiene destinatario y respuesta, y está configurado en P25. | |
| 4 | Los agentes tienen límites técnicos y acción al alcanzarlos. | |
| 5 | La cascada define disparadores, quién activa y calidad mínima; N2 solo con modelo evaluado antes de G5. | |
| 6 | Ningún nivel de la cascada desactiva controles críticos. | |
| 7 | Cada coste compartido tiene clave aprobada en C3 y la suma repartida coincide con el total. | |
| 8 | La conciliación mensual está hecha y las diferencias explicadas o corregidas. | |
| 9 | En una parada, la inversión evitada y el coste de parar constan y no suman en el valor. | |

---

## 13. Aprobación y verificación

| Función | Rol en SEVEN-G | Nombre y cargo | Fecha | Firma o referencia |
|---|---|---|---|---|
| Elabora presupuesto, alertas y cascada | Responsable de operación de IA | | | |
| Aprueba el presupuesto de consumo | Órgano que decide G5 (01 §7.5) | | | |
| Aprueba las claves de reparto | Comité de IA con control de gestión (C3) | | | |
| Concilia | Control de gestión | | | |
| Verifica | Oficina de IA (Lite) · Auditor de IA (Enterprise) | | | |

Separación de funciones: quien opera el sistema no aprueba su propio suplemento de presupuesto; control de gestión aprueba las claves y concilia, pero no participa en la construcción de las iniciativas.

---

## 14. Control de versiones

**Documento cumplimentado**

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| | | | |

**Plantilla**

| Versión | Fecha | Cambios |
|---|---|---|
| 0.1 | 19-09-2026 | Primera versión. Recoge el presupuesto de consumo, las alertas y los límites de 42 §8, la cascada de degradación por coste de 52 §10.3, las claves de reparto de 42 §6 y §11.2, la conciliación de 42 §11.3 y el coste de parar de 42 §10. |
