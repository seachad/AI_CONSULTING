# Inventario de identidades no humanas y componentes

**Registra las identidades no humanas de los sistemas de IA y agentes —con permisos, responsable humano, credenciales y revisiones periódicas— y los modelos y componentes de software de los que dependen, con versión, origen, licencia y vulnerabilidades.**

| | |
|---|---|
| Documento | Plantilla P54 · Inventario de identidades no humanas y componentes |
| Versión | 0.1 (borrador de trabajo) |
| Fecha | 19-09-2026 |
| Autor | Fernando García Varela |
| Estado | Borrador para revisión. |

---

> **Aviso legal y exención de responsabilidad.** SEVEN-G es un marco metodológico de referencia que se ofrece «tal cual» y con fines exclusivamente informativos. No constituye asesoramiento jurídico, regulatorio, financiero ni profesional, ni garantiza el cumplimiento de ninguna norma. Las referencias a regulación general (como el Reglamento Europeo de IA, el RGPD, DORA o NIS2), a normas técnicas y a regulación específica de cada sector o jurisdicción pueden ser incompletas, no aplicar a un caso concreto o quedar desactualizadas por cambios normativos, interpretaciones o criterios de las autoridades posteriores a su fecha de consulta. **Cada organización que use SEVEN-G es la única responsable de identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio**, con el asesoramiento cualificado que corresponda. El autor no asume responsabilidad alguna por el uso que se haga de este contenido ni por las decisiones que se adopten con él. Los datos, cifras, compañías y casos de los ejemplos son ficticios o ilustrativos.

> **Por qué importa.** Un agente actúa con credenciales y permisos; si nadie sabe qué identidades existen, quién responde de ellas y qué pueden hacer, una credencial robada o un permiso heredado se convierten en la vía de ataque más barata (35 §3.2, abuso de identidad y privilegios). Del mismo modo, un sistema de IA depende de modelos, bibliotecas, conectores y servidores de herramientas que pueden estar manipulados o ser vulnerables: sin inventario no se puede reaccionar cuando se publica una vulnerabilidad ni retirar un componente. Este inventario es la evidencia de AG-01, AG-03, AG-13, AG-20 y SEG-09, y permite demostrar al consejo que no hay permisos excesivos, credenciales sin rotar ni identidades huérfanas (35 §10).

## 1. Instrucciones de uso

| Aspecto | Indicación |
|---|---|
| **Cuándo se usa** | Las identidades y componentes se dan de alta en la fase 4, al diseñar la seguridad (P18), y se confirman antes de G5. Se mantienen vivos en la fase 6: cada alta, cambio de permisos, rotación, revisión o baja es un evento. En G7, la retirada revoca identidades y credenciales. |
| **Quién la rellena** | El responsable técnico de IA da de alta identidades y componentes; el responsable humano de cada identidad certifica sus permisos en cada revisión AG-20; seguridad de la información aporta el análisis de vulnerabilidades. |
| **Quién la verifica** | Seguridad de la información revisa y emite conformidad. El auditor de IA (Enterprise) o la oficina de IA (Lite) comprueba en G4, G5 y R6 que el inventario coincide con la configuración real, no solo con el documento. |
| **Quién decide o aprueba** | El responsable humano de cada identidad aprueba sus permisos. La incorporación de un componente o conector nuevo la aprueba el responsable técnico de IA con conformidad de seguridad de la información (AG-13). Las excepciones de plazo de corrección de vulnerabilidades siguen los plazos aprobados de SEG-13. |
| **Etapa, *gate* o momento** | G4 (G4.15, G4.16), G5, R6 (R6.11) y G7 (G7.11). En el ámbito corporativo, C4 para los indicadores del consejo. |
| **Herramienta** | T10 · Evaluación de seguridad de agentes (estado de AG-01, AG-03, AG-13, AG-20 y SEG-09) y T02 · Inventario (responsable humano del agente, P05). La relación de componentes puede generarse con la herramienta de análisis de dependencias de la compañía; esta plantilla recoge los campos que SEVEN-G exige. |
| **Documento de referencia** | Documento 35 §4.1–4.3 (identidad, permisos y credenciales), §5.3 (frecuencias), §7 (AG-01, AG-02, AG-03, AG-13, AG-20) y §6 (SEG-09, SEG-13); documento 53 §7.4–7.5 (componentes, dependencias y licencias); documento 36 (proveedores). |
| **Lite frente a Enterprise** | El inventario de identidades y el de modelos y componentes con versión y procedencia son obligatorios en ambas. Lite puede omitir los campos marcados **(Enterprise)**; la relación completa de componentes de software (SBOM) es **(Enterprise)** (53 §7.4). |

Reglas de cumplimentación:

- Código de identidad propuesto: **IDN-AAAA-NNN** (año de alta). Los componentes se numeran dentro de cada sistema: SIA-AAAA-NNN · C*nn*.
- Cada agente tiene una identidad no humana propia, distinta de la de cualquier empleado y de la de otros agentes (AG-01). Nunca se registra una identidad compartida.
- Cuando el agente actúa por cuenta de un usuario, no puede obtener más permisos que ese usuario (35 §4.1).
- Los secretos se guardan en un gestor de secretos; este inventario registra **dónde** están y **cuándo** se rotaron, nunca su valor.
- Todo permiso no listado está denegado; lectura y escritura se registran por separado (AG-02).
- Una identidad sin responsable humano vigente o sin sistema activo es una identidad huérfana: se revoca o se regulariza.

---

## 2. Identificación

| Campo | Contenido | Guía |
|---|---|---|
| Ámbito del inventario | | Sistema (SIA-AAAA-NNN) · Iniciativa (IA-AAAA-NNN) · Compañía. |
| Nivel de autonomía | | A0 · A1 · A2 · A3. Determina la frecuencia de revisión AG-20. |
| Intensidad | | Lite · Enterprise. |
| Responsable del inventario | | Responsable técnico de IA. |
| Fecha de la última actualización | | DD-MM-AAAA. |
| Fecha de la última revisión AG-20 | | |
| Versión del documento | | |

---

## 3. Inventario de identidades no humanas

**Tipo:** Agente · Cuenta de servicio · Clave de API · Certificado · Identidad de conector o servidor de herramientas · Agente de construcción (53 §7.4). **Actúa por cuenta de:** Un usuario (delegación) · La compañía (proceso). **Estado:** Activa · Suspendida · Revocada.

| Código | Nombre técnico | Tipo | Sistema | Finalidad | Actúa por cuenta de | Responsable humano | Sustituto **(Enterprise)** | Estado | Fecha de alta |
|---|---|---|---|---|---|---|---|---|---|
| | | | | | | | | | |
| | | | | | | | | | |
| IDN-2026-012 *(ejemplo ilustrativo)* | agente-devoluciones-prod | Agente | SIA-2026-004 | Tramitar devoluciones de pedidos propios | La compañía (proceso) | Responsable de operación de IA | Responsable técnico de IA | Activa | 02-10-2026 |

---

## 4. Permisos de cada identidad

Coherentes con la matriz de permisos de P18 §5. **Operación:** Lectura · Escritura · Borrado · Envío externo · Operación económica · Cambio de configuración.

| Identidad | Sistema o herramienta | Operación | Alcance concreto | Justificación | Validación humana previa | ¿Coincide con la configuración real? (Sí · No) |
|---|---|---|---|---|---|---|
| | | | | | | |
| IDN-2026-012 *(ejemplo ilustrativo)* | Pasarela de devoluciones | Operación económica | Reembolsos de pedidos propios hasta el límite de P18 §7 | Resolver devoluciones | Sí, por encima del límite | Sí |

---

## 5. Credenciales

| Identidad | Tipo de credencial | Ubicación (gestor de secretos) | Duración | Ámbito | Plazo de rotación | Última rotación | Próxima rotación | ¿Revocación vinculada al interruptor de parada? | Tiempo de revocación probado |
|---|---|---|---|---|---|---|---|---|---|
| | | | | | | | | | |
| IDN-2026-012 *(ejemplo ilustrativo)* | Token de corta duración | Gestor de secretos corporativo | 1 hora | Pasarela de devoluciones | Clave raíz trimestral | 01-10-2026 | 01-01-2027 | Sí | 40 segundos |

Una credencial fuera de plazo de rotación se señala y se informa en el indicador «Credenciales sin rotar en plazo» (35 §10).

---

## 6. Revisiones periódicas de permisos (AG-20)

Frecuencia mínima (35 §5.3): **A1** anual · **A2** semestral · **A3** trimestral. En A0 es recomendada.

| Fecha | Identidades revisadas | Revisado por (responsable humano) | Permisos retirados | Credenciales rotadas o revocadas | Identidades huérfanas detectadas | Hallazgos | Referencia del acta |
|---|---|---|---|---|---|---|---|
| | | | | | | | |
| *(ejemplo ilustrativo)* 15-01-2027 | IDN-2026-010 a IDN-2026-014 | Responsable de operación de IA | 1 (lectura de un histórico no usado) | 0 | 0 | Permiso heredado de una fase de pruebas | Acta AG-20 del primer trimestre de 2027 |

Los hallazgos de permisos excesivos se informan en el indicador «Identidades de agentes con permisos excesivos» (35 §10), cuyo objetivo es cero. La desactivación en producción de un control crítico (AG-01 en A2 y A3; AG-02 y AG-03 de A1 a A3; 35 §5.4) es una no conformidad crítica (P50).

---

## 7. Inventario de modelos y componentes

Evidencia de SEG-09 y AG-13. **Tipo:** Modelo (propio, de proveedor o abierto) · Pesos · Biblioteca o dependencia · Conector · Servidor de herramientas · Imagen o contenedor · Servicio de proveedor · Conjunto de datos de evaluación. **Estado:** Aprobado · En evaluación · Obsoleto · Retirado.

| Código | Componente | Tipo | Versión fijada | Origen o proveedor | Fuente aprobada (Sí · No) | Verificación de integridad | Licencia | Vulnerabilidades conocidas | Responsable | Estado |
|---|---|---|---|---|---|---|---|---|---|---|
| | | | | | | | | | | |
| | | | | | | | | | | |
| SIA-2026-004 · C03 *(ejemplo ilustrativo)* | Conector con el sistema de pedidos | Conector | 2.4.1 | Desarrollo propio | Sí | Firma verificada en el despliegue | Interna | Ninguna en el último análisis | Responsable técnico de IA | Aprobado |

### 7.1 Campos complementarios

| Campo | Contenido | Guía |
|---|---|---|
| Relación completa de componentes de software (SBOM) **(Enterprise)** | | Referencia del fichero generado, herramienta y fecha. Se regenera en cada cambio (53 §7.4). |
| Dependencias propuestas por herramientas de IA | | Verificadas antes de incorporarse: existencia, procedencia, mantenimiento y vulnerabilidades conocidas (53 §7.4). |
| Política de licencias aplicada | | Comprobación frente a la política de la compañía (53 §7.5). |
| Análisis de vulnerabilidades | | Herramienta, frecuencia y fecha del último análisis. |
| Plazos de corrección aplicables | | Los aprobados para sistemas expuestos y componentes de IA (SEG-13). |
| Proveedores de modelos y conectores | | Nivel de exigencia N1 · N2 · N3 y evaluación en P14 (documento 36). |

### 7.2 Vulnerabilidades y cambios de componentes

| Fecha | Componente | Vulnerabilidad o cambio | Gravedad | Plazo de corrección | Acción | Fecha de cierre | Cambio registrado en P27 |
|---|---|---|---|---|---|---|---|
| | | | | | | | |

Un cambio de versión de modelo, de conector o de servidor de herramientas es un cambio que se registra en P27 y se evalúa antes de ejecutarse (37 §7.2).

---

## 8. Bajas y retirada

| Identidad o componente | Motivo de la baja | Fecha | Credenciales revocadas (Sí · No) | Permisos retirados (Sí · No) | Registros conservados hasta | Verificado por |
|---|---|---|---|---|---|---|
| | | | | | | |

En la retirada del sistema (G7, P30) se revocan identidad, credenciales y permisos y se conservan los registros el periodo definido (G7.11); no deben quedar identidades ni credenciales huérfanas (35 §8, fase 7).

---

## 9. Criterios de calidad

Criterios formales en el documento 21 (G4.15, G4.16, R6.11 y G7.11) y lista LV-AG del documento 22 §12.

| # | Comprobación | Estado |
|---|---|---|
| 1 | Cada agente tiene una identidad propia, no compartida, con responsable humano vigente. | Cumple · No cumple · No aplica · Pendiente |
| 2 | Los permisos registrados coinciden con los mínimos aprobados en P18 y con la configuración real. | |
| 3 | Las credenciales están en un gestor de secretos, dentro de plazo de rotación y con revocación vinculada al interruptor de parada. | |
| 4 | Las revisiones AG-20 se han hecho con la frecuencia del nivel de autonomía y constan en acta. | |
| 5 | No hay identidades huérfanas ni permisos heredados sin justificar. | |
| 6 | Todos los modelos, conectores y servidores de herramientas tienen versión fijada, origen verificado y aprobación (AG-13, SEG-09). | |
| 7 | Las licencias y vulnerabilidades están revisadas y las correcciones están dentro de plazo. | |
| 8 | En Enterprise existe una relación completa de componentes de software actualizada con el último cambio. | |

---

## 10. Aprobación y verificación

| Función | Rol en SEVEN-G | Nombre y cargo | Fecha | Firma o referencia |
|---|---|---|---|---|
| Elabora y mantiene | Responsable técnico de IA | | | |
| Certifica los permisos de cada identidad | Responsable humano de la identidad (normalmente, responsable de operación de IA) | | | |
| Revisa y emite conformidad | Seguridad de la información | | | |
| Verifica | Oficina de IA (Lite) · Auditor de IA (Enterprise) | | | |

Separación de funciones: quien administra las identidades no certifica sus propios permisos; la certificación AG-20 la firma el responsable humano de cada identidad y la verifica alguien ajeno al equipo que construye.

---

## 11. Control de versiones

**Documento cumplimentado**

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| | | | |

**Plantilla**

| Versión | Fecha | Cambios |
|---|---|---|
| 0.1 | 19-09-2026 | Primera versión. Inventario de identidades no humanas con permisos, credenciales, responsable y revisiones AG-20 (35 §4.1, §7) e inventario de modelos y componentes con versión, origen, licencia y vulnerabilidades (SEG-09, AG-13, 53 §7.4). Propone el código IDN-AAAA-NNN. |
