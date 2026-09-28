# Manual de operación

**Reúne lo necesario para operar el sistema de IA en producción de forma estable y controlada: responsables, rutinas, cambios, situaciones habituales, continuidad y registros.**

| | |
|---|---|
| Documento | Plantilla P24 · Manual de operación |
| Versión | 0.1 (borrador de trabajo) |
| Fecha | 16-09-2026 |
| Autor | Fernando García Varela |
| Estado | Borrador para revisión. |

---

> **Aviso legal y exención de responsabilidad.** SEVEN-G es un marco metodológico de referencia que se ofrece «tal cual» y con fines exclusivamente informativos. No constituye asesoramiento jurídico, regulatorio, financiero ni profesional, ni garantiza el cumplimiento de ninguna norma. Las referencias a regulación general (como el Reglamento Europeo de IA, el RGPD, DORA o NIS2), a normas técnicas y a regulación específica de cada sector o jurisdicción pueden ser incompletas, no aplicar a un caso concreto o quedar desactualizadas por cambios normativos, interpretaciones o criterios de las autoridades posteriores a su fecha de consulta. **Cada organización que use SEVEN-G es la única responsable de identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio**, con el asesoramiento cualificado que corresponda. Esta metodología es una ayuda genérica y gratuita, compartida con la comunidad para que nadie tenga que empezar desde cero; cada persona u organización puede y debe adaptarla a su propio uso. No debe entenderse que sus partes jurídicamente sensibles hayan sido revisadas por una asesoría jurídica: esas revisiones, para cada empresa o sector, son responsabilidad última de la empresa, el consultor o la organización que la use. Aunque se procura mantenerla al día, alguna norma puede haber cambiado sin que se recoja aquí. En la máxima medida permitida por la ley, el autor no asume responsabilidad alguna por los efectos de su aplicación en ninguna organización ni por su aplicabilidad completa. La metodología no otorga certificación de ningún tipo. El autor no asume responsabilidad alguna por el uso que se haga de este contenido ni por las decisiones que se adopten con él. Los datos, cifras, compañías y casos de los ejemplos son ficticios o ilustrativos.

## 1. Instrucciones de uso

| Aspecto | Indicación |
|---|---|
| **Cuándo se usa** | Se redacta en borrador en la fase 5 (requisito de P23) y se aprueba al inicio de la fase 6. Se mantiene vivo durante toda la operación. |
| **Quién la rellena** | Responsable de operación de IA, con el responsable técnico de IA. |
| **Quién la verifica** | Oficina de IA en Lite; auditor de IA en Enterprise. |
| **En qué *gate* se revisa** | Requisito previo de G5; se comprueba su vigencia en cada revisión de continuidad R6. |
| **Lite frente a Enterprise** | Lite puede omitir los campos marcados **(Enterprise)**. |
| **Relación** | P16 Linaje · P17 Supervisión humana · P18 Seguridad · P19 Reversión · P25 Monitorización y alertas · P26 Respuesta a incidentes · P27 Registro de incidentes y cambios · P28 Seguimiento de valor · documento 52 (Manual de operación de IA). |

Reglas:

- El manual debe poder seguirlo una persona de guardia que **no ha participado en la construcción**.
- Los procedimientos técnicos detallados pueden residir en la herramienta de operación de la compañía; aquí se enlazan con su versión.
- Todo cambio en producción se clasifica y se registra en P27 antes de ejecutarse, salvo los de emergencia, que se registran inmediatamente después.

---

## 2. Identificación

| Campo | Contenido | Guía |
|---|---|---|
| Código de la iniciativa | | IA-AAAA-NNN (T01). |
| Sistema(s) de IA | | Identificador en el inventario (T02). |
| Versión en producción | | Modelo, instrucciones y configuración (P16). |
| Fecha de puesta en producción | | Según P23. |
| Intensidad | | Lite · Enterprise. Determina la frecuencia de R6: trimestral en Enterprise y semestral en Lite. |
| Nivel de autonomía | | A0 · A1 · A2 · A3. |
| Versión del documento | | |
| Autor | | Rol y nombre. |
| Fecha | | DD-MM-AAAA. |
| Estado del documento | | Borrador · Presentado para verificación · Verificado · Aprobado · Sustituido. |

---

## 3. Descripción operativa

| Campo | Contenido | Guía |
|---|---|---|
| Qué hace el sistema | | Resumen de P31, en lenguaje comprensible. |
| Usuarios y horario de servicio | | Quién lo usa y cuándo debe estar disponible. |
| Niveles de servicio comprometidos | | Disponibilidad, tiempo de respuesta, tiempo de resolución. |
| Dependencias internas | | Sistemas y datos de los que depende. |
| Proveedores y soporte **(Enterprise)** | | Proveedor, servicio, canal de soporte y nivel de servicio contratado (P14). |
| Limitaciones conocidas | | Del P16 y P21; qué no debe pedirse al sistema. Se trasladan a las instrucciones internas de uso (P49 §5). |

---

## 4. Roles y contactos operativos

Se indican roles y canales; los datos personales de contacto se mantienen en el directorio corporativo.

| Rol | Titular | Sustituto | Disponibilidad | Canal |
|---|---|---|---|---|
| Responsable de operación de IA | | | | |
| Guardia técnica | | | | |
| Responsable técnico de IA | | | | |
| Responsable de producto de IA | | | | |
| Supervisores designados (P17) | | | | |
| Seguridad de la información | | | | |
| Protección de datos | | | | |
| Responsable de riesgos de IA | | | | |

---

## 5. Rutinas operativas

**Frecuencia:** Continua · Diaria · Semanal · Mensual · Trimestral · Semestral.

| Actividad | Frecuencia | Responsable | Procedimiento o enlace | Registro |
|---|---|---|---|---|
| Revisar alertas abiertas y su tratamiento | Diaria | Guardia técnica | P25 | Herramienta de alertas |
| Comprobar calidad y actualidad de los datos de entrada | Diaria | | | |
| Revisar muestra de resultados (supervisión a posteriori) | Según P17 | Supervisores designados | P17 bloque 6 | |
| Revisar registro de acciones del agente y bloqueos | Semanal | | P18 bloque 10 | |
| Revisar consumo y coste frente a presupuesto | Mensual | | P25 | |
| Revisar deriva (también de uso), sesgo y rendimiento frente a referencia | Mensual | | P25 | |
| Revisar permisos e identidades del sistema | Trimestral | | P18 bloques 4 y 5 | |
| Actualizar el seguimiento de valor | Según P28 | Responsable de producto de IA | P28 | |
| Preparar la revisión de continuidad R6 | Trimestral (Enterprise) · Semestral (Lite) | Responsable de operación de IA | Bloque 10 | P29 |
| | | | | |

---

## 6. Gestión de cambios

| Tipo de cambio | Ejemplos | Pruebas exigidas | Quién aprueba | ¿Requiere revisar clasificación, intensidad o riesgos? |
|---|---|---|---|---|
| **Menor** | Ajuste de textos de interfaz; umbral de alerta sin efecto en el comportamiento | Verificación funcional | Responsable de operación de IA | No |
| **Relevante** | Nueva versión de modelo, instrucciones o base de conocimiento; nuevas herramientas o permisos del agente; cambio de nivel de autonomía; ampliación de población o finalidad; cambio de proveedor | Regresión, sesgo, seguridad e inyección según el caso; reversión preparada | Según documento 52; si cambia autonomía, finalidad o clasificación, decisión equivalente a G4/G5 y nueva firma (P23) | Sí |
| **Emergencia** | Contención de un incidente | Las posibles sin demorar la contención | Coordinador del incidente, con registro inmediato | Se revisa después |

---

## 7. Situaciones habituales

| Situación | Síntoma o alerta | Primera acción | A quién escalar | Referencia |
|---|---|---|---|---|
| Degradación del rendimiento | Alerta de rendimiento o aumento de anulaciones | Verificar datos de entrada y versión; valorar disparador de reversión | Responsable técnico de IA | P19 · P25 |
| Datos de entrada ausentes o tardíos | Alerta de actualidad | Activar modo degradado si se superan los umbrales | Responsable del dato | P19 |
| Proveedor de modelo no disponible | Errores de servicio | Aplicar alternativa prevista; informar a usuarios | Responsable de operación de IA | P14 · P19 |
| Coste de consumo por encima del umbral | Alerta de coste | Revisar uso anómalo; aplicar el nivel de la cascada de degradación por coste del bloque 8 | Responsable de producto de IA | P18 bloque 7 · documento 52 §10.3 |
| Cambio en lo que piden los usuarios (deriva de uso) | Alerta de consultas fuera del alcance validado o de cambio de temas | Ampliar el conjunto de evaluación con los casos nuevos y evaluar; si el uso cae fuera de la finalidad, limitar el alcance | Responsable de producto de IA | P25 · documento 52 §4.2.6 |
| Sospecha de inyección de instrucciones o acción anómala del agente | Bloqueos repetidos o acción fuera de finalidad | Valorar interruptor de parada; preservar registros | Seguridad de la información | P18 · P26 |
| Reclamación de una persona afectada | Reclamación recibida | Registrar; activar revisión humana | Responsable de producto de IA | P17 bloque 8 |
| Posible resultado discriminatorio | Alerta de equidad, de respuestas desiguales en pares contrafactuales o reclamación | Tratar como incidente y clasificar severidad | Responsable de riesgos de IA | P26 |
| | | | | |

---

## 8. Continuidad y modo degradado

| Campo | Contenido | Guía |
|---|---|---|
| Modo degradado disponible | | Descripción y cómo se activa (P19). |
| Proceso sin IA | | Quién lo ejecuta y con qué capacidad. |
| Tiempo máximo sin servicio aceptable | | Coherente con P19. |
| Recuperación tras el modo degradado | | Comprobaciones antes de volver al funcionamiento normal y quién autoriza. |
| Cascada de degradación por coste | | Solo sistemas con consumo variable. Niveles aplicables (N1 optimización, N2 modelo de respaldo, N3 alcance reducido, N4 sin IA), disparador de cada uno (por ejemplo, N1 al 80 % y N2 al 100 % del presupuesto), quién los activa y usos excluidos de N2 (documento 52 §10.3). |
| Modelo de respaldo | | Identificador en P16, resultado de su evaluación antes de G5 y calidad mínima exigida en P25. |

---

## 9. Accesos, registros y conservación

| Campo | Contenido | Guía |
|---|---|---|
| Gestión de altas y bajas de usuarios | | Procedimiento y responsable. |
| Revisión periódica de accesos | | Frecuencia y evidencia. |
| Registros que se conservan | | Registros de inferencia, acciones del agente, validaciones humanas, cambios, alertas. |
| Plazo de conservación | | No inferior al que exija la regulación aplicable (documento 34). |
| Vigilancia exigida por la regulación **(Enterprise)** | | Qué se vigila tras la puesta en producción, quién lo hace y cómo se informa al proveedor o a la autoridad cuando proceda (documento 34). |

---

## 10. Revisión de continuidad (R6)

| Campo | Contenido | Guía |
|---|---|---|
| Frecuencia | | Al menos trimestral en Enterprise y semestral en Lite (01 §6.8). |
| Próxima fecha | | |
| Información que se prepara | | Valor realizado frente a hipótesis (P28), estabilidad (P25), incidentes y cambios (P27), cumplimiento y vigencia de la clasificación de riesgo e intensidad (P04, P11, P12). |
| Criterio para proponer adelantar G7 | | Desviaciones relevantes de valor, riesgo o cumplimiento. |

---

## 11. Criterios de calidad

Criterios formales de G5 y R6 en el documento 21.

| # | Comprobación | Estado (Cumple · No cumple · No aplica · Pendiente) |
|---|---|---|
| 1 | Todos los roles operativos tienen titular y sustituto. | |
| 2 | Las rutinas tienen frecuencia, responsable y registro. | |
| 3 | Los tipos de cambio y su aprobación están definidos y conectados con P27. | |
| 4 | Las situaciones habituales tienen primera acción y escalado. | |
| 5 | El modo degradado y el proceso sin IA están descritos y son coherentes con P19. | |
| 6 | La fecha de la próxima R6 está fijada según la intensidad. | |
| 7 | En sistemas con consumo variable, la cascada de degradación por coste está definida, no desactiva controles críticos y se ha probado. | |

---

## 12. Aprobación y verificación

| Función | Rol | Nombre | Fecha | Firma o referencia |
|---|---|---|---|---|
| Autor | Responsable de operación de IA | | | |
| Coautor | Responsable técnico de IA | | | |
| Verificador | Oficina de IA (Lite) · Auditor de IA (Enterprise) | | | |
| Aprobación | Patrocinador (Lite) · Comité de IA (Enterprise), dentro de la decisión de G5 | | | |

Separación de funciones: el responsable de operación no verifica evidencias de su propia operación (01 §8.1).

---

## 13. Control de versiones

| Versión | Fecha | Cambios |
|---|---|---|
| 0.1 | 16-09-2026 | Primera versión de la plantilla. |
| 0.1 | 18-09-2026 | Cascada de degradación por coste y modelo de respaldo en el bloque 8; deriva de uso y pares contrafactuales en las situaciones habituales; criterio de calidad 7. |
