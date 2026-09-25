# Evaluación de impacto en derechos fundamentales

**Documenta la evaluación de impacto en derechos fundamentales que el Reglamento de IA exige a determinados responsables del despliegue de sistemas de alto riesgo antes del primer uso, y prepara su notificación a la autoridad de vigilancia del mercado.**

| | |
|---|---|
| Documento | Plantilla P48 · Evaluación de impacto en derechos fundamentales |
| Versión | 0.1 (borrador de trabajo) |
| Fecha | 19-09-2026 |
| Autor | Fernando García Varela |
| Estado | Borrador para revisión. |

> *Esta plantilla no constituye asesoramiento jurídico.* Referencias consultadas en septiembre de 2026; la obligación se aplica con el alto riesgo del anexo III (2-12-2027 tras el Reglamento (UE) 2026/1744). Verifíquese su vigencia (documento 34 §3.1 y §3.10).

---

> **Aviso legal y exención de responsabilidad.** SEVEN-G es un marco metodológico de referencia que se ofrece «tal cual» y con fines exclusivamente informativos. No constituye asesoramiento jurídico, regulatorio, financiero ni profesional, ni garantiza el cumplimiento de ninguna norma. Las referencias a regulación general (como el Reglamento Europeo de IA, el RGPD, DORA o NIS2), a normas técnicas y a regulación específica de cada sector o jurisdicción pueden ser incompletas, no aplicar a un caso concreto o quedar desactualizadas por cambios normativos, interpretaciones o criterios de las autoridades posteriores a su fecha de consulta. **Cada organización que use SEVEN-G es la única responsable de identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio**, con el asesoramiento cualificado que corresponda. Esta metodología es una ayuda genérica y gratuita, compartida con la comunidad para que nadie tenga que empezar desde cero; cada persona u organización puede y debe adaptarla a su propio uso. No debe entenderse que sus partes jurídicamente sensibles hayan sido revisadas por una asesoría jurídica: esas revisiones, para cada empresa o sector, son responsabilidad última de la empresa, el consultor o la organización que la use. Aunque se procura mantenerla al día, alguna norma puede haber cambiado sin que se recoja aquí. En la máxima medida permitida por la ley, el autor no asume responsabilidad alguna por los efectos de su aplicación en ninguna organización ni por su aplicabilidad completa. La metodología no otorga certificación de ningún tipo. El autor no asume responsabilidad alguna por el uso que se haga de este contenido ni por las decisiones que se adopten con él. Los datos, cifras, compañías y casos de los ejemplos son ficticios o ilustrativos.

> **Por qué importa.** Un sistema de alto riesgo que decide sobre el crédito, el seguro o el acceso a servicios públicos puede perjudicar a colectivos enteros sin que ningún indicador económico lo muestre. Esta evaluación obliga a describir, antes del primer uso, en qué procesos se usará el sistema, a quién afecta, qué perjuicios puede causar y qué hará la compañía si se materializan; sin ella el sistema no puede desplegarse legalmente en los supuestos obligados y el *gate* G5 no puede superarse. Hecha desde el diseño, además, evita rediseños tardíos.

## 1. Instrucciones de uso

| Aspecto | Indicación |
|---|---|
| **Cuándo se usa** | Se abre cuando P11 §9.2 concluye que la evaluación es **Requerida**, o **Recomendada** y la compañía decide hacerla. Se elabora en la fase 3, se actualiza en la fase 4 con el diseño, se notifica antes de G5 y se revisa en la fase 5, en cada R6 y cuando cambie alguno de sus elementos (artículo 27.2). |
| **Quién la rellena** | El responsable de riesgos de IA, con la segunda línea (asesoría jurídica y cumplimiento) y el responsable de producto de IA (34 §3.10). El área de negocio que usará el sistema describe los procesos. |
| **Quién la verifica** | Lite: oficina de IA o auditor de IA. Enterprise: auditor de IA. En la práctica, los sistemas de alto riesgo son siempre Enterprise. |
| **Quién decide o aprueba** | Comité de IA; la aceptación del riesgo residual, según P12 §6. |
| **Gate o momento** | G3 · Viabilidad (determinada e iniciada, G3.09); G4 · Diseño (completada y medidas en el diseño, G4.13); G5 · Puesta en producción (notificada, G5.15); R6 (vigente, R6.08). |
| **Herramienta** | T07 · Clasificador regulatorio (estado, fecha, enlace y fecha de notificación, 32 §3.5). |
| **Documento de referencia** | 32 §6.2, 34 §3.10 y §8.2, documento 33 (escalas de riesgo), documento 50 §8 (decisiones sobre personas). |
| **Lite frente a Enterprise** | Cuando es obligatoria, todo su contenido es obligatorio. Toda iniciativa Enterprise con decisiones sobre personas **debería** aplicar este contenido aunque no esté obligada (34 §3.10); en ese uso voluntario puede omitir la sección 10. |

Reglas de cumplimentación:

- **Una evaluación por sistema de alto riesgo y por uso.** Si el mismo sistema (SIA-AAAA-NNN) se usa en procesos distintos, se describen todos.
- La evaluación se centra en las **personas y colectivos afectados**, no en la compañía. Se apoya en la información que el proveedor facilita con las instrucciones de uso.
- **Complementa, sin duplicar,** la evaluación de impacto en protección de datos (P47): lo que ya consta allí se referencia (sección 11).
- El Reglamento de IA prevé un cuestionario de la Oficina Europea de IA para la notificación: a fecha de consulta, la plantilla de la Oficina Europea de IA está pendiente de confirmar (34 §3.10). Cuando esté disponible, ese es el formato de notificación; **esta plantilla de SEVEN-G no lo sustituye**: sirve para preparar el contenido, integrarlo en el ciclo de la iniciativa y conservar la trazabilidad interna.
- Uso voluntario: puede apoyarse en ISO/IEC 42005:2025 (32 §6.2).

---

## 2. Identificación

| Campo | Contenido | Guía |
|---|---|---|
| Código de la iniciativa | | IA-AAAA-NNN. |
| Código y nombre del sistema | | SIA-AAAA-NNN de P05 (T02). |
| Proveedor del sistema | | Interno o tercero (P14). |
| Finalidad prevista | | Copiar de P05 y P11. |
| Clasificación y punto del anexo III | | De P11 §6.2 (por ejemplo, 5.b o 5.c). |
| Rol de la compañía | | Responsable del despliegue (y, en su caso, también proveedor). |
| Referencia a P11 | | Versión y fecha. |
| Referencia a P47 | | Si existe EIPD del mismo tratamiento. |
| Versión del documento | | |
| Fecha | | DD-MM-AAAA. |
| Estado | | Borrador · Presentada para verificación · Aprobada · Notificada · En revisión · Sustituida. |

---

## 3. Aplicabilidad

| Pregunta | Respuesta | Justificación |
|---|---|---|
| ¿El sistema es de alto riesgo del artículo 6.2 (anexo III) y no del punto 2 (infraestructuras críticas)? | Sí · No | |
| ¿La compañía es organismo de Derecho público o entidad privada que presta servicios públicos? | | |
| ¿El sistema está en el anexo III, punto 5, letra b) (solvencia o calificación crediticia) o letra c) (evaluación de riesgos y fijación de precios en seguros de vida y salud)? | | |
| **Resultado** | Obligatoria · Voluntaria · No aplica | Obligatoria si la primera respuesta es «Sí» y alguna de las otras dos también. |
| Fecha desde la que es exigible | | Con las obligaciones del anexo III. SEVEN-G recomienda realizarla desde el diseño (32 §6.2). |

---

## 4. Procesos en los que se usará el sistema (artículo 27.1.a)

| Campo | Contenido | Guía |
|---|---|---|
| Procesos del responsable del despliegue | | Descripción de cada proceso en lenguaje de negocio, conforme a la finalidad prevista. |
| Decisiones que apoya o toma el sistema | | Qué decide, qué recomienda y qué valida una persona (P17 §5). |
| Nivel de autonomía | | A0–A3. |
| Usos excluidos | | Usos que no están permitidos aunque el sistema pueda hacerlos. |

---

## 5. Periodo y frecuencia de uso (artículo 27.1.b)

| Campo | Contenido | Guía |
|---|---|---|
| Fecha prevista de primer uso | | Fecha de G5. |
| Periodo de uso | | Indefinido con revisión en R6, o fecha de fin. |
| Frecuencia | | Continua, diaria, por solicitud, por campaña. |
| Volumen | | Decisiones o personas evaluadas por periodo (orden de magnitud). |

---

## 6. Personas y colectivos afectados (artículo 27.1.c)

| Categoría de personas o colectivo | Cómo les afecta el sistema | Volumen aproximado | ¿Colectivo vulnerable? | Guía |
|---|---|---|---|---|
| | | | Sí · No | Por edad, discapacidad, situación económica o social, u otras. |
| | | | | |
| *(ejemplo ilustrativo)* Solicitantes de préstamos personales | Su puntuación condiciona la aprobación y el precio | Unas 40.000 solicitudes al año | Sí: personas con historial crediticio corto | |

---

## 7. Riesgos específicos de perjuicio (artículo 27.1.d)

Considere la información facilitada por el proveedor (instrucciones de uso) y valore con la **escala común** (documento 33): **Nivel = Probabilidad × Impacto**; Bajo 1–4 · Medio 5–9 · Alto 10–15 · Crítico 16–25. El eje dominante será normalmente «Personas y derechos». Los riesgos de nivel Medio o superior se trasladan a P12.

| Nº | Riesgo de perjuicio (causa, evento y consecuencia) | Colectivo afectado | Derecho o interés afectado | P inh. | I inh. | Nivel inherente | Medidas (secciones 8 y 9) | Nivel residual | Código en P12 |
|---|---|---|---|---|---|---|---|---|---|
| F01 | | | | 1–5 | 1–5 | | | | IA-AAAA-NNN · Rnn |
| F02 | | | | | | | | | |
| *(ejemplo ilustrativo)* F01 | Variables que actúan como sustitutas del origen o la edad hacen que un colectivo reciba peores puntuaciones y se le deniegue o encarezca el crédito. | Solicitantes con historial crediticio corto | No discriminación; acceso a servicios esenciales | 3 | 4 | 12 Alto | Exclusión de variables sustitutas (P16); pruebas de sesgo antes del piloto y en producción (P22, P25); revisión humana de denegaciones (P17) | 6 Medio | IA-2026-021 · R02 |

---

## 8. Medidas de supervisión humana (artículo 27.1.e)

Según las instrucciones de uso del proveedor y el diseño de P17.

| Campo | Contenido | Guía |
|---|---|---|
| Modos de supervisión | | Validación previa · Supervisión en tiempo real · Revisión a posteriori por muestreo · Supervisión agregada (P17 §6). |
| Personas que supervisan | | Rol, competencia, formación y autoridad (artículo 26.2; P20). |
| Capacidad de no usar, anular o detener el sistema | | P17 §7; interruptor de parada (P18, P19). |
| Coherencia con las instrucciones de uso del proveedor | | Qué exige el proveedor y cómo se cumple. |

---

## 9. Medidas si los riesgos se materializan (artículo 27.1.f)

| Campo | Contenido | Guía |
|---|---|---|
| Gobierno interno | | Quién decide suspender o limitar el uso, escalado y plazos (P26, documento 30). |
| Mecanismos de reclamación | | Canal, plazo interno de respuesta y rol que revisa (P17 §8; P49). |
| Explicación de decisiones individuales | | Cómo se atienden las solicitudes (artículo 86; P49). |
| Reparación de las personas afectadas | | Revisión de decisiones ya tomadas, corrección y comunicación. |
| Información al proveedor y a las autoridades | | Vigilancia y comunicación de incidentes graves (artículo 26.5; P26, P27). |

---

## 10. Notificación a la autoridad de vigilancia del mercado (artículo 27.3)

| Campo | Contenido | Guía |
|---|---|---|
| Autoridad competente | | Identificada en P11 (AESIA o autoridad sectorial; 34 §8.2). |
| Formato utilizado | | El modelo que facilite la Oficina Europea de IA, cuando esté disponible; mientras tanto, el que indique la autoridad. |
| Fecha de notificación | | Antes de G5 (P23). |
| Referencia o acuse | | |
| Notificaciones de actualización | | Fecha y motivo de cada actualización notificada. |

---

## 11. Relación con la evaluación de impacto en protección de datos (P47)

| Elemento | ¿Consta ya en P47? | Referencia o complemento en esta evaluación |
|---|---|---|
| Descripción del tratamiento y de los datos | Sí · No | |
| Riesgos para la protección de datos | | |
| Riesgos para otros derechos (no discriminación, acceso a servicios, tutela, otros) | | Solo en esta evaluación. |
| Medidas comunes | | |

---

## 12. Conclusión y revisión

| Campo | Contenido | Guía |
|---|---|---|
| Nivel residual más alto | | De la sección 7. |
| Conclusión | | El sistema puede desplegarse · Puede desplegarse con condiciones · No puede desplegarse. |
| Condiciones | | Medidas que deben estar verificadas antes de G5. |
| Aceptación del riesgo residual | | Órgano según P12 §6. Un residual Crítico sin aprobación del consejo o de su comisión delegada bloquea G3 y G5. |
| Próxima revisión | | Siguiente R6 o cambio de proceso, colectivo, frecuencia, proveedor o instrucciones de uso (artículo 27.2; P27). |

| Fecha | Motivo | Cambios | Nivel residual | ¿Se notifica la actualización? | Revisado por |
|---|---|---|---|---|---|
| | Fase 5 · R6 · Cambio · Incidente | | | Sí · No | |

---

## 13. Criterios de calidad

Los criterios formales están en el documento 21 (G3.09, G4.13, G5.15 y R6.08).

| # | Comprobación | Estado |
|---|---|---|
| 1 | La aplicabilidad coincide con P11 §9.2 y está justificada. | Cumple · No cumple · No aplica · Pendiente |
| 2 | Están los seis elementos del artículo 27.1: procesos, periodo y frecuencia, personas afectadas, riesgos, supervisión humana y medidas ante materialización. | |
| 3 | Se ha usado la información del proveedor y sus instrucciones de uso. | |
| 4 | Los riesgos se valoran con la escala común y los de nivel Medio o superior están en P12. | |
| 5 | Hay mecanismo de reclamación y vía de explicación operativos (P17, P49). | |
| 6 | Se reutiliza la EIPD (P47) sin duplicarla. | |
| 7 | La notificación a la autoridad consta antes de G5, con fecha y referencia. | |
| 8 | Está vigente en la última R6 y se notifican las actualizaciones. | |

---

## 14. Aprobación y verificación

| Función | Rol en SEVEN-G | Nombre y cargo | Fecha | Firma o referencia |
|---|---|---|---|---|
| Coordina y elabora | Responsable de riesgos de IA | | | |
| Describe procesos y supervisión | Responsable de producto de IA y área de negocio | | | |
| Valida jurídicamente | Segunda línea (asesoría jurídica o cumplimiento) | | | |
| Consultado | Delegado de protección de datos | | | |
| Verifica | Auditor de IA | | | |
| Aprueba | Comité de IA; aceptación del residual según P12 §6 | | | |
| ☐ Declaración: «La organización confirma que esta evaluación se ha realizado con asesoramiento cualificado y asume su responsabilidad; SEVEN-G es solo una referencia metodológica.» | Mismo órgano que aprueba | | | |

Separación de funciones: quien elabora la evaluación no la verifica; el área que usará el sistema no acepta su riesgo residual.

---

## 15. Control de versiones

**Documento cumplimentado**

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| | | | |

**Plantilla**

| Versión | Fecha | Cambios |
|---|---|---|
| 0.1 | 19-09-2026 | Primera versión. Desarrolla la evaluación que P11 §9.2 declara necesaria, con los elementos del artículo 27 recogidos en 32 §6.2 y 34 §3.10, la notificación a la autoridad y el enlace con P47 y P12. Referencias consultadas en septiembre de 2026. |
