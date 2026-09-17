# Plan de reversión y prueba

**Define cuándo y cómo se detiene o se revierte el sistema de IA, quién lo hace y en cuánto tiempo, y deja constancia de que el plan se ha probado.**

| | |
|---|---|
| Documento | Plantilla P19 · Plan de reversión y prueba |
| Versión | 0.1 (borrador de trabajo) |
| Fecha | 16-09-2026 |
| Autor | Fernando García · SEACHAD |
| Estado | Borrador para revisión. |

---

> **Aviso legal y exención de responsabilidad.** SEVEN-G es un marco metodológico de referencia que se ofrece «tal cual» y con fines exclusivamente informativos. No constituye asesoramiento jurídico, regulatorio, financiero ni profesional, ni garantiza el cumplimiento de ninguna norma. Las referencias a regulación general (como el Reglamento Europeo de IA, el RGPD, DORA o NIS2), a normas técnicas y a regulación específica de cada sector o jurisdicción pueden ser incompletas, no aplicar a un caso concreto o quedar desactualizadas por cambios normativos, interpretaciones o criterios de las autoridades posteriores a su fecha de consulta. **Cada organización que use SEVEN-G es la única responsable de identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio**, con el asesoramiento cualificado que corresponda. El autor y SEACHAD no asumen responsabilidad alguna por el uso que se haga de este contenido ni por las decisiones que se adopten con él. Los datos, cifras, compañías y casos de los ejemplos son ficticios o ilustrativos.

## 1. Instrucciones de uso

| Aspecto | Indicación |
|---|---|
| **Cuándo se usa** | El plan (bloques 3 a 9) se elabora en la fase 4 y se revisa en G4. La prueba (bloque 10) se ejecuta en la fase 5 y es evidencia obligatoria de G5. Se actualiza tras cada cambio relevante (P27). |
| **Quién la rellena** | Responsable técnico de IA (plan) y responsable de operación de IA (ejecución de la prueba). |
| **Quién la verifica** | Oficina de IA o responsable de riesgos en Lite; auditor de IA en Enterprise. |
| **En qué *gate* se revisa** | G4 (plan) y G5 (prueba). Se comprueba su vigencia en R6. |
| **Lite frente a Enterprise** | Lite puede omitir los campos marcados **(Enterprise)**, pero no la prueba: el principio de reversibilidad exige plan probado antes de la puesta en producción (01 §3, principio 4). |
| **Relación** | P16 Linaje (versiones anteriores) · P17 Supervisión humana (modo degradado) · P18 Interruptor de parada · P24 Manual de operación · P25 Alertas · P26 Respuesta a incidentes · P27 Registro de cambios · documento 52. |

Reglas:

- Los disparadores deben ser **medibles** y estar conectados con la monitorización (P25). "Si el sistema funciona mal" no es un disparador.
- La reversión siempre tiene un **estado seguro de destino** conocido: versión anterior, modo degradado o proceso sin IA.
- Un simulacro solo documental no acredita la prueba; debe ejecutarse en producción controlada o en un entorno equivalente, y declararse cuál.

---

## 2. Identificación

| Campo | Contenido | Guía |
|---|---|---|
| Código de la iniciativa | | IA-AAAA-NNN (T01). |
| Sistema(s) de IA | | Identificador en el inventario (T02). |
| Versión del sistema cubierta por el plan | | Versión de modelo, instrucciones y configuración (P16). |
| Nivel de autonomía | | A0 · A1 · A2 · A3 (P17). |
| Intensidad | | Lite · Enterprise. |
| Versión del documento | | |
| Autor | | Rol y nombre. |
| Fecha | | DD-MM-AAAA. |
| Estado del documento | | Borrador · Presentado para verificación · Verificado · Aprobado · Sustituido. |

---

## 3. Alcance de la reversión

| Campo | Contenido | Guía |
|---|---|---|
| Componentes que pueden revertirse | | Modelo, instrucciones del sistema, base de conocimiento, herramientas del agente, integración, configuración. |
| Estado seguro de destino | | Versión anterior (identificador) · Modo degradado · Proceso sin IA. |
| Dependencias | | Sistemas que se ven afectados al revertir. |
| Efecto sobre resultados ya producidos | | Qué ocurre con decisiones, contenidos o acciones ya ejecutados (bloque 8). |

---

## 4. Disparadores

**Tipo:** Rendimiento · Seguridad · Cumplimiento · Incidente · Coste · Valor · Decisión de un órgano. **Activación:** Automática · Manual.

| ID | Disparador | Tipo | Umbral medible | Fuente de detección (alerta de P25) | Quién decide revertir | Activación |
|---|---|---|---|---|---|---|
| D-01 *(ejemplo ilustrativo)* | Degradación de la calidad de las propuestas | Rendimiento | Tasa de anulación humana superior al 25 % durante dos días seguidos | Alerta de supervisión humana | Responsable de operación de IA | Manual |
| D-02 *(ejemplo ilustrativo)* | Acción del agente fuera de límites | Seguridad | Una sola acción ejecutada que superó un límite del P18 | Registro de acciones | Automática; informa a seguridad | Automática |
| D-03 *(ejemplo ilustrativo)* | Incidente clasificado S1 | Incidente | Clasificación S1 según documento 37 | P26 | Coordinador del incidente | Manual |
| | | | | | | |

---

## 5. Opciones de reversión

Marque las que estén preparadas e indique cuál se aplica para cada disparador.

| Opción | Preparada (Sí · No) | Disparadores a los que responde | Observaciones |
|---|---|---|---|
| Volver a la versión anterior del modelo | | | |
| Volver a la versión anterior de instrucciones, base de conocimiento o configuración | | | |
| Reducir el nivel de autonomía (modo degradado, por ejemplo de A2 a A1) | | | |
| Desactivar la función de IA y volver al proceso sin IA | | | |
| Parada total mediante interruptor de parada | | | Siempre preparada en A2 y A3. |

---

## 6. Pasos de ejecución

Una tabla por opción preparada. Los pasos deben poder seguirse sin conocer el diseño interno.

| # | Paso | Responsable (rol) | Tiempo estimado | Cómo se comprueba que está hecho |
|---|---|---|---|---|
| 1 *(ejemplo ilustrativo)* | Registrar la decisión de revertir y el disparador | Responsable de operación de IA | 5 min | Evento en P27 |
| 2 *(ejemplo ilustrativo)* | Activar el modo degradado A1 en la configuración | Técnico de guardia | 10 min | Las nuevas propuestas quedan pendientes de validación |
| 3 *(ejemplo ilustrativo)* | Avisar a los supervisores del cambio de modo | Responsable de producto de IA | 15 min | Confirmación de lectura |
| 4 *(ejemplo ilustrativo)* | Verificar que no hay acciones en cola ejecutándose | Técnico de guardia | 10 min | Cola vacía en el registro de acciones |
| | | | | |

---

## 7. Responsables, comunicación y tiempo objetivo

| Campo | Contenido | Guía |
|---|---|---|
| Quién autoriza la reversión | | Rol y sustituto. En disparadores automáticos, quién confirma a posteriori. |
| Quién ejecuta | | Rol y cobertura horaria. |
| A quién se informa | | Patrocinador, usuarios, soporte, riesgos; clientes si procede. |
| Tiempo objetivo de reversión | | Desde la decisión hasta alcanzar el estado seguro. |
| Tiempo máximo tolerable **(Enterprise)** | | Tiempo a partir del cual el impacto se considera inaceptable para el negocio. |
| Quién autoriza volver a la versión revertida | | Rol distinto del que ejecutó la reversión cuando hubo incidente. |

---

## 8. Continuidad del proceso y resultados ya producidos

| Campo | Contenido | Guía |
|---|---|---|
| Proceso alternativo | | Cómo se sigue prestando el servicio sin el sistema o en modo degradado. |
| Capacidad disponible para el proceso alternativo | | Personas y horas necesarias; si la capacidad liberada se ha reasignado (P20), cómo se recupera. |
| Revisión de resultados producidos durante el fallo | | Criterio para identificar y revisar decisiones o acciones afectadas. |
| Comunicación a personas afectadas **(Enterprise)** | | Cuándo y cómo, coordinado con P26. |

---

## 9. Revisión del plan

| Campo | Contenido | Guía |
|---|---|---|
| Revisión tras cambios relevantes | | El plan se revisa con cada cambio relevante registrado en P27. |
| Periodicidad de nueva prueba **(Enterprise)** | | La que fije la compañía; debería repetirse tras cambios de modelo, de autonomía o de proveedor. |

---

## 10. Registro de la prueba de reversión

Un bloque por prueba realizada.

| Campo | Contenido | Guía |
|---|---|---|
| Fecha de la prueba | | DD-MM-AAAA. Debe ser anterior a la solicitud de G5. |
| Entorno | | Producción controlada · Preproducción equivalente. Justifique la equivalencia si no es producción. |
| Escenario y disparador simulado | | Por ejemplo, D-01. |
| Opción de reversión probada | | Del bloque 5. |
| Participantes | | Roles; debería participar quien estaría de guardia en un caso real. |
| Tiempo medido | | Desde la decisión hasta el estado seguro. |
| Tiempo objetivo | | Del bloque 7. |
| Resultado | | Superada · Superada con observaciones · No superada. |
| Incidencias durante la prueba | | Pasos que fallaron o no estaban documentados. |
| Acciones derivadas | | Qué se corrige, responsable y fecha. |
| Evidencia | | Registros, capturas o actas enlazadas. |
| Verificada por | | Rol ajeno al equipo que construye. |

Ejemplo *(ejemplo ilustrativo)*: prueba en preproducción equivalente, disparador D-01, reversión a modo A1; tiempo objetivo 30 minutos, tiempo medido 42 minutos; resultado *Superada con observaciones* porque el aviso a supervisores dependía de una persona sin sustituto; acción: designar sustituto y repetir el paso 3 antes de G5.

---

## 11. Criterios de calidad

Criterios formales de G4 y G5 en el documento 21; listas LV-G4 y LV-G5 en el documento 22.

| # | Comprobación | Estado (Cumple · No cumple · No aplica · Pendiente) |
|---|---|---|
| 1 | Cada disparador tiene umbral medible y alerta asociada en P25. | |
| 2 | Existe al menos una opción de reversión preparada con estado seguro identificado. | |
| 3 | Los pasos tienen responsable, tiempo y comprobación. | |
| 4 | Hay tiempo objetivo de reversión y responsables con sustituto. | |
| 5 | El proceso alternativo tiene capacidad suficiente. | |
| 6 | La prueba se ha ejecutado antes de G5, en entorno válido, y su resultado es *Superada* o sus observaciones están resueltas. | |

---

## 12. Aprobación y verificación

| Función | Rol | Nombre | Fecha | Firma o referencia |
|---|---|---|---|---|
| Autor del plan | Responsable técnico de IA | | | |
| Responsable de la prueba | Responsable de operación de IA | | | |
| Verificador | Oficina de IA o responsable de riesgos (Lite) · Auditor de IA (Enterprise) | | | |
| Decisor del *gate* | Según 01 §7.5 (registrado en P29) | | | |

Separación de funciones: quien verifica la prueba no ha participado en su ejecución ni en el diseño del plan.

---

## 13. Control de versiones

| Versión | Fecha | Cambios |
|---|---|---|
| 0.1 | 16-09-2026 | Primera versión de la plantilla. |
