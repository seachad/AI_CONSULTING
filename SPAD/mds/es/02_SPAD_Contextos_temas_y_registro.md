# Contextos, temas y registro de artefactos

**Qué reglas se cargan antes de cualquier fase, cómo se agrupa el trabajo en temas y qué queda registrado de cada artefacto, de cada validación humana y de cada modelo usado**

| | |
|---|---|
| Documento | Documento 02 · Contextos, temas y registro de artefactos |
| Versión | 0.1 |
| Fecha | 19-09-2026 |
| Autor | Fernando García Varela |
| Estado | En construcción. Desarrolla la gestión de contextos y temas anterior con el registro de validación y el registro del modelo. |
| Tipo | Guía operativa |

<!-- cifras: 2 | contextos obligatorios ; 1 | tema por trabajo ; 3 | registros por artefacto ; 20 | caracteres máximos del tema -->

---

> **Versión en revisión: no difundir.** El estado actual de SPAD (versión 0.x) no está pensado para compartirse de forma general. Se mantiene en público para que un número reducido de personas pueda revisarlo, dar su opinión y ayudar a mejorarlo. Se está trabajando en la adecuación de los documentos y las herramientas para que sean reutilizables; este aviso desaparecerá cuando el marco pase a la versión 1.x.

> **Aviso legal y exención de responsabilidad.** SPAD es una metodología de referencia que se ofrece «tal cual» y con fines exclusivamente informativos. No constituye asesoramiento jurídico, regulatorio ni profesional, no garantiza resultados ni el cumplimiento de ninguna norma y no es una certificación. Las referencias a regulación general (como el RGPD) pueden ser incompletas, no aplicar a un caso concreto o quedar desactualizadas. **Cada organización que use SPAD es la única responsable de validar sus resultados, identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio**, con el asesoramiento cualificado que corresponda. El autor no asume responsabilidad alguna por el uso que se haga de este contenido ni por las decisiones que se adopten con él. Los datos, cifras, compañías y casos de los ejemplos son ficticios o ilustrativos.

## 1. Objeto

Este documento define tres mecanismos que hacen que el trabajo con SPAD sea coherente entre proyectos y reconstruible después:

| Mecanismo | Pregunta que responde |
|---|---|
| **Contextos** | ¿Con qué reglas trabaja la IA en esta organización y en este proyecto? |
| **Temas** | ¿Dónde están todos los artefactos de esta funcionalidad, corrección o incidente? |
| **Registros** | ¿Quién validó cada salida, con qué resultado, y qué modelo la produjo? |

---

## 2. Contextos

Antes de ejecutar cualquier fase se cargan dos contextos. Ninguna instrucción (documento 06) se ejecuta sin ellos.

### 2.1 Contexto global

Reglas universales de la organización, aplicables a todos los proyectos que usan SPAD, con independencia de la tecnología o el dominio.

| Sección obligatoria | Contenido | Ejemplo ilustrativo |
|---|---|---|
| **Artefactos** | Ubicación, nombres y formato de los artefactos y de los diagramas. | `documentation/{{TOPIC}}/SPAD_NN_FASE.md`; diagramas en Mermaid. |
| **Pruebas** | Cobertura mínima por capa; pruebas de integración obligatorias para interfaces; extremo a extremo para flujos críticos. | Cobertura unitaria mínima del 80 % (valor de partida, a calibrar por cada organización). |
| **Versionado** | Versionado semántico; registro de cambios en cada entrega; cambios incompatibles documentados. | `MAYOR.MENOR.PARCHE`. |
| **Seguridad base** | Sin secretos en el código; validación de entradas; autenticación en puntos sensibles; referencia técnica para la revisión de seguridad. | OWASP Top 10 como lista de referencia. |
| **Datos y proveedores de modelos** | Qué clases de información pueden enviarse a cada proveedor y entorno de IA aprobado, y cuáles nunca (datos personales, secretos, código propietario según clasificación). | «Ningún dato personal real en instrucciones a proveedores externos; datos de prueba sintéticos». |
| **Prohibiciones** | Lo que ninguna fase puede hacer. | Código en la fase PLAN; decisiones de diseño en la implementación; autoaprobación. |
| **Parámetros de los ciclos complementarios** | Plazos máximos de plan simplificado y de vigilancia posterior en la corrección urgente; escala de severidades y quién acepta el riesgo residual. | Valores de partida, a calibrar (documento 04). |
| **Modelos aprobados** | Proveedores, modelos y versiones autorizados por rol, y cuáles no pueden coincidir en construcción y revisión. | «La IA revisora usa un modelo o proveedor distinto de la constructora en código sensible». |

> **Por qué importa.** La sección de datos y proveedores es la que más se olvida y la que más daño evita: sin ella, cada persona decide por su cuenta qué código, datos o secretos pega en una herramienta externa. Es también el punto de unión con la política corporativa de uso de la IA ([SEVEN-G 31 · Política corporativa y uso aceptable](../../../SEVEN-G/html/es/31_SEVEN-G_Politica_corporativa_y_uso_aceptable.html)).

### 2.2 Contexto de proyecto

Reglas del proyecto concreto, que completan o excepcionan el contexto global.

| Sección | Contenido |
|---|---|
| **Tecnología** | Lenguaje, marcos, versiones, base de datos, infraestructura. |
| **Arquitectura** | Patrones y restricciones (sin estado, multiinstancia, colas, límites de latencia). |
| **Reglas de dominio** | Reglas de negocio que el diseño no puede violar (por ejemplo, doble autorización en operaciones monetarias, retención de registros). |
| **Cumplimiento** | Obligaciones aplicables (protección de datos, regulación sectorial) y su efecto en el diseño. |
| **Convenciones del equipo** | Nombres, revisiones, ramas. |
| **Despliegue** | Entornos, ventanas, restricciones. |
| **Excepciones justificadas** | Reglas del contexto global que este proyecto no cumple, con justificación y riesgo (sección 2.3). |

### 2.3 Precedencia y excepciones

Si el contexto de proyecto contradice al global:

1. **Prevalece el de proyecto**, solo si la excepción está escrita y justificada.
2. La excepción incluye **el riesgo** de apartarse de la regla global y cómo se mitiga.
3. La IA revisora **evalúa** la excepción en la revisión del plan y la señala en su veredicto.
4. **La aprueba la persona que orquesta** (o quien el contexto global designe para excepciones), y la aprobación queda en el registro de validación (sección 4). Ninguna IA aprueba una excepción.

*Ejemplo ilustrativo.* El contexto global exige el 80 % de cobertura unitaria. Un proyecto de migración de código heredado sin pruebas fija el 70 % para el código nuevo y un incremento del 10 % por iteración para el heredado. La IA revisora lo evalúa como razonable por el plan gradual; el responsable técnico lo aprueba y queda registrado con fecha.

---

## 3. Temas

Cada trabajo con SPAD se asocia a un **tema** (*TOPIC*): un identificador corto que agrupa todos sus artefactos.

| Regla | Detalle |
|---|---|
| **Formato** | `snake_case`, máximo 20 caracteres, descriptivo. |
| **Representa** | Una funcionalidad, una corrección, un incidente o una iniciativa. |
| **Se fija** | En la fase 0, de forma explícita (lo da la persona) o inferida (lo propone la IA y la persona lo confirma). |
| **Persiste** | Durante todo el trabajo; no cambia a mitad; no se reutiliza para otra funcionalidad. |
| **Ejemplos válidos** | `user_auth`, `pdf_export`, `payment_gateway`, `cache_mem_leak`. |
| **Ejemplos no válidos** | `feature_123` (no descriptivo), `tmp`, `fix` (genéricos), nombres largos en otro formato. |

### 3.1 Organización de artefactos

```
documentation/
├── {{TOPIC}}/
│   ├── SPAD_01_PLAN.md
│   ├── SPAD_01_AUDIT_PLAN.md          (NO-GO)
│   ├── SPAD_02_PLAN.md                (segunda iteración)
│   ├── SPAD_02_AUDIT_PLAN.md          (GO)
│   ├── SPAD_02_CODE_PRIMER.md
│   ├── SPAD_02_TEST_STRATEGY.md
│   ├── SPAD_02_IMPLEMENTATION.md
│   ├── SPAD_02_TEST_IMPLEMENTATION.md
│   ├── SPAD_02_AUDIT_TESTS.md
│   ├── SPAD_02_AUDIT_CODE.md
│   ├── SPAD_02_FIX_PRIMERS.md
│   ├── SPAD_02_VERSION.md
│   ├── VALIDACION.md                  (registro de validación humana)
│   └── diagramas/
└── {{TOPIC_2}}/
```

La **numeración secuencial** conserva todas las iteraciones: un plan rechazado no se borra, se conserva con su revisión y la siguiente iteración toma el número siguiente. Así se ve qué se intentó, por qué se rechazó y qué cambió.

> **Por qué importa.** La carpeta del tema es la unidad de auditoría. Quien necesite saber, meses después, por qué un componente está construido así, encuentra en un solo lugar la intención inicial, el plan, la revisión, el código, las pruebas, las correcciones, la versión y quién validó cada paso.

---

## 4. Registros por artefacto

Cada artefacto lleva tres registros. Los dos primeros son obligatorios en todo trabajo; el tercero, en la versión completa.

### 4.1 Registro del modelo

Qué produjo el artefacto. Sin él, un resultado no puede reproducirse ni explicarse cuando cambia el proveedor.

| Campo | Contenido |
|---|---|
| Proveedor y modelo | Nombre y versión del modelo (o identificador de la herramienta). |
| Fecha y hora | De la generación. |
| Rol | Planificadora, revisora, constructora, correctora, analista, diagnóstico, revisora de seguridad. |
| Instrucción | Referencia a la instrucción usada (documento 06) y su versión; en la versión completa, el texto íntegro de las instrucciones adicionales. |
| Contextos | Versión del contexto global y del de proyecto cargados. |

### 4.2 Registro de validación humana

Quién validó el artefacto y con qué resultado. Es la evidencia del control humano; sin él, la trazabilidad solo prueba lo que hizo la IA.

| Campo | Contenido |
|---|---|
| Artefacto | Nombre y número de iteración. |
| Persona | Quien valida (rol de orquestación o revisión humana del código). |
| Fecha | De la validación. |
| Resultado | Válido · Inválido (con la causa de la política de validación, documento 03) · Excepción aprobada. |
| Veredicto aceptado | Si el artefacto es una revisión: el veredicto de la IA y si la persona lo acepta o lo rechaza, con motivo. |
| Observaciones | Lo que la persona añade o discrepa. |

El registro se guarda en `VALIDACION.md` dentro del tema (o en el sistema de control de versiones, si la organización lo prefiere) y se completa **en el momento**, no al final.

### 4.3 Registro de infracciones

Cada respuesta descartada por la política de validación (documento 03) se anota con fecha, fase, causa, modelo y acción. Es la materia prima de las métricas del proceso (documento 08) y de la mejora de las instrucciones.

> **Por qué importa.** Los tres registros responden a las tres preguntas de cualquier auditoría del desarrollo: qué herramienta hizo esto, qué persona lo aceptó y cuántas veces hubo que descartar y repetir. En SEVEN-G, esos registros son el insumo de las evidencias de las fases de diseño y entrega ([SEVEN-G 53](../../../SEVEN-G/html/es/53_SEVEN-G_Construccion_de_soluciones_con_IA.html), sección 7.2).

---

## 5. Lista de comprobación antes de empezar

- [ ] Contexto global cargado, con su versión.
- [ ] Contexto de proyecto cargado, con su versión.
- [ ] Conflictos entre contextos identificados y excepciones aprobadas por una persona.
- [ ] Tema fijado, en el formato correcto, y carpeta creada.
- [ ] Modelos asignados a cada rol conforme a los modelos aprobados; la IA revisora no coincide con la constructora.
- [ ] Registro de validación abierto.
- [ ] Clase de información autorizada para los proveedores que se van a usar, comprobada.

---

## 6. Documentos relacionados

| Documento | Relación |
|---|---|
| **documento 01 · Guía operativa** | Fases en las que se producen los artefactos registrados. |
| **documento 03 · Política de validación** | Causas de invalidación que alimentan los registros. |
| **documento 07 · Contratos de entrada y salida** | Estructura de los artefactos, con los campos del registro del modelo. |
| **documento 08 · Autoevaluación y métricas** | Uso de los registros como evidencia y como fuente de las métricas. |
| [SEVEN-G 31 · Política corporativa y uso aceptable](../../../SEVEN-G/html/es/31_SEVEN-G_Politica_corporativa_y_uso_aceptable.html) | Origen de las reglas sobre datos y proveedores del contexto global. |
| [SEVEN-G 53 · Construcción de soluciones con IA](../../../SEVEN-G/html/es/53_SEVEN-G_Construccion_de_soluciones_con_IA.html) | Cómo se derivan los contextos de las evidencias de SEVEN-G y qué exige la trazabilidad. |

---

## 7. Control de versiones

| Versión | Fecha | Cambios |
|---|---|---|
| 0.1 | 19-09-2026 | Primera versión. Desarrolla la gestión de contextos y temas anterior; añade al contexto global las secciones de datos y proveedores, parámetros de los ciclos complementarios y modelos aprobados; las excepciones las aprueba una persona; incorpora el registro del modelo, el registro de validación humana y el registro de infracciones. |
