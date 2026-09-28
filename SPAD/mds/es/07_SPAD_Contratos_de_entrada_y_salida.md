# Contratos de entrada y salida

**La estructura obligatoria de cada artefacto de SPAD, legible por personas y por máquinas, para que la validación de «artefacto incompleto» pueda automatizarse y los agentes encadenen fases sin perder información**

| | |
|---|---|
| Documento | Documento 07 · Contratos de entrada y salida |
| Versión | 0.1 |
| Fecha | 19-09-2026 |
| Autor | Fernando García Varela |
| Estado | En construcción. Reescribe la especificación de contratos anterior con el vocabulario único de veredictos y el registro del modelo. |
| Tipo | Especificación |

<!-- cifras: 18 | contratos ; 1 | bloque común a todos ; 3 | valores de veredicto ; 4 | niveles de severidad -->

---

> **Versión en revisión: no difundir.** El estado actual de SPAD (versión 0.x) no está pensado para compartirse de forma general. Se mantiene en público para que un número reducido de personas pueda revisarlo, dar su opinión y ayudar a mejorarlo. Se está trabajando en la adecuación de los documentos y las herramientas para que sean reutilizables; este aviso desaparecerá cuando el marco pase a la versión 1.x.

> **Aviso legal y exención de responsabilidad.** SPAD es una metodología de referencia que se ofrece «tal cual» y con fines exclusivamente informativos. No constituye asesoramiento jurídico, regulatorio ni profesional, no garantiza resultados ni el cumplimiento de ninguna norma y no es una certificación. **Cada organización que use SPAD es la única responsable de validar sus resultados, identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio**, con el asesoramiento cualificado que corresponda. Esta metodología es una ayuda genérica y gratuita, compartida con la comunidad para que nadie tenga que empezar desde cero; cada persona u organización puede y debe adaptarla a su propio uso. No debe entenderse que sus partes jurídicamente sensibles hayan sido revisadas por una asesoría jurídica: esas revisiones, para cada empresa o sector, son responsabilidad última de la empresa, el consultor o la organización que la use. Aunque se procura mantenerla al día, alguna norma puede haber cambiado sin que se recoja aquí. En la máxima medida permitida por la ley, el autor no asume responsabilidad alguna por los efectos de su aplicación en ninguna organización ni por su aplicabilidad completa. La metodología no otorga certificación de ningún tipo. El autor no asume responsabilidad alguna por el uso que se haga de este contenido ni por las decisiones que se adopten con él. Los datos, cifras, compañías y casos de los ejemplos son ficticios o ilustrativos.

## 1. Objeto

Cada fase de SPAD produce un artefacto con una **estructura contractual**: secciones y campos obligatorios que la instrucción exige (documento 06) y cuya ausencia invalida la respuesta (documento 03). Este documento define esa estructura en JSON, de modo que:

- una persona pueda comprobar de un vistazo que la salida está completa;
- un validador automático pueda rechazar un artefacto incompleto antes de que lo vea nadie;
- un agente que encadena fases reciba de la anterior exactamente lo que necesita.

El artefacto puede presentarse en Markdown con las mismas secciones; el JSON es la forma canónica para la validación y el intercambio.

> **Por qué importa.** «Artefacto incompleto» es la causa de invalidación más frecuente y la más fácil de automatizar. Un contrato explícito convierte esa comprobación en un paso mecánico y deja a la persona el juicio que sí requiere una persona: si el contenido es correcto.

---

## 2. Convenciones comunes

### 2.1 Bloque común

Todo artefacto incluye estos campos:

```json
{
  "spad": { "version_contrato": "0.1" },
  "topic": "cadena, snake_case, máximo 20 caracteres",
  "fase": "PLAN | AUDIT_PLAN | CODE_PRIMER | TEST_STRATEGY | IMPLEMENTATION | TEST_IMPLEMENTATION | AUDIT_TESTS | AUDIT_CODE | FIX_PRIMERS | VERSION | DOCUMENT_EXISTING | DISCOVERY_LEGACY | DEBUG | HOTFIX | SECURITY_AUDIT | BEHAVIOUR_EVAL",
  "iteracion": "entero desde 1",
  "fecha": "ISO 8601",
  "modelo": {
    "proveedor": "cadena",
    "modelo": "cadena",
    "version_modelo": "cadena",
    "rol": "planificadora | revisora | constructora | correctora | analista | diagnostico | revisora_seguridad",
    "instruccion": "identificador y versión de la instrucción usada",
    "contexto_global": "versión",
    "contexto_proyecto": "versión"
  },
  "desviaciones": [
    { "situacion": "cadena", "decision_pedida": "cadena" }
  ]
}
```

`desviaciones` recoge las situaciones que la fase no podía resolver y sobre las que se pide decisión; nunca contiene decisiones tomadas por la IA.

### 2.2 Escalas

| Escala | Valores |
|---|---|
| **Veredicto** | `GO` · `GO_CON_CAMBIOS` · `NO_GO` (todas las revisiones, incluida la de seguridad y la evaluación del comportamiento). |
| **Severidad** | `CRITICA` · `ALTA` · `MEDIA` · `BAJA`. |
| **Probabilidad** | `ALTA` · `MEDIA` · `BAJA`. |
| **Prioridad de recomendación** | `DEBE` · `DEBERIA` · `CONVENIENTE`. |
| **Calidad** | `EXCELENTE` · `BUENA` · `ADECUADA` · `POBRE` · `AUSENTE`. |

### 2.3 Registro de validación humana

No forma parte del artefacto de la IA: lo escribe la persona en `VALIDACION.md` del tema (documento 02, sección 4.2). Su forma canónica:

```json
{
  "artefacto": "SPAD_02_AUDIT_PLAN",
  "persona": "identificador",
  "fecha": "ISO 8601",
  "resultado": "VALIDO | INVALIDO | EXCEPCION_APROBADA",
  "causa_invalidacion": "VIOLACION_FASE | ARTEFACTO_INCOMPLETO | FUERA_DE_PLAN | SIN_REVISION_PREVIA | AUTOAPROBACION | null",
  "veredicto_ia": "GO | GO_CON_CAMBIOS | NO_GO | null",
  "veredicto_aceptado": "true | false | null",
  "observaciones": "cadena"
}
```

---

## 3. Contratos del ciclo principal

### 3.1 PLAN

```json
{
  "arquitectura": { "vision_general": "cadena", "patrones": ["cadena"] },
  "componentes": [
    { "nombre": "cadena", "responsabilidad": "cadena", "dependencias": ["cadena"], "interfaces": ["cadena"] }
  ],
  "flujos": [
    { "nombre": "cadena", "disparador": "cadena", "pasos": ["cadena"], "datos": "cadena" }
  ],
  "decisiones": [
    { "decision": "cadena", "justificacion": "cadena", "alternativas": ["cadena"], "contrapartidas": "cadena" }
  ],
  "riesgos": [
    { "riesgo": "cadena", "severidad": "CRITICA|ALTA|MEDIA|BAJA", "probabilidad": "ALTA|MEDIA|BAJA", "mitigacion": "cadena" }
  ],
  "sistema_con_ia": {
    "aplica": "true | false",
    "nivel_autonomia": "A0 | A1 | A2 | A3",
    "componentes_ia": ["modelo, instrucciones, recuperacion, herramientas, memoria"],
    "limites_actuacion": ["cadena"],
    "datos_al_modelo": { "proveedor": "cadena", "clases_de_informacion": ["cadena"] },
    "modos_de_fallo": [ { "fallo": "cadena", "comportamiento_seguro": "cadena" } ],
    "cambio_de_modelo": "estrategia ante actualizaciones del proveedor"
  }
}
```

### 3.2 AUDIT_PLAN

```json
{
  "problemas": [
    { "id": "cadena", "categoria": "ACOPLAMIENTO|COHESION|ESCALABILIDAD|CONCURRENCIA|SEGURIDAD|OBSERVABILIDAD|OTRA",
      "severidad": "CRITICA|ALTA|MEDIA|BAJA", "descripcion": "cadena", "ubicacion": "sección del plan", "impacto": "cadena" }
  ],
  "recomendaciones": [
    { "problema": "id", "recomendacion": "cadena", "prioridad": "DEBE|DEBERIA|CONVENIENTE" }
  ],
  "excepciones_evaluadas": [
    { "regla_global": "cadena", "excepcion": "cadena", "evaluacion": "cadena" }
  ],
  "veredicto": "GO|GO_CON_CAMBIOS|NO_GO",
  "justificacion": "cadena",
  "pasos_siguientes": ["cadena"]
}
```

Regla de coherencia: `veredicto = GO` es incompatible con cualquier problema de severidad `CRITICA` o `ALTA`.

### 3.3 CODE_PRIMER

```json
{
  "estructura": { "directorios": "árbol", "modulos": "cadena" },
  "reglas": [
    { "categoria": "NOMBRES|ESTRUCTURA|ERRORES|CONCURRENCIA|PRUEBAS|DOCUMENTACION|REGISTRO|OTRA",
      "regla": "cadena", "ejemplos": ["cadena"], "caracter": "OBLIGATORIA|RECOMENDADA" }
  ],
  "contratos": [
    { "tipo": "API|INTERFAZ|ESTRUCTURA_DATOS|EVENTO", "definicion": "cadena", "validacion": ["cadena"] }
  ],
  "antipatrones": [
    { "patron": "cadena", "por_que": "cadena", "alternativa": "cadena" }
  ],
  "reglas_ia": {
    "instrucciones_sistema": ["cadena"], "contratos_herramientas": ["cadena"], "registro_interacciones": ["cadena"]
  }
}
```

### 3.4 TEST_STRATEGY

```json
{
  "cobertura": { "total_minima": "porcentaje", "unitaria_minima": "porcentaje", "integracion_minima": "porcentaje", "rutas_criticas": "100" },
  "capas": [ { "capa": "UNITARIA|INTEGRACION|E2E|RENDIMIENTO|SEGURIDAD", "proposito": "cadena", "herramientas": ["cadena"], "alcance": "cadena" } ],
  "casos": [
    { "id": "cadena", "nombre": "cadena", "tipo": "UNITARIA|INTEGRACION|E2E", "componente": "cadena",
      "escenario": "cadena", "resultado_esperado": "cadena", "prioridad": "CRITICA|ALTA|MEDIA|BAJA" }
  ],
  "dobles_y_datos": [ { "nombre": "cadena", "proposito": "cadena", "estructura": "cadena" } ],
  "casos_limite": [ { "caso": "cadena", "enfoque": "cadena" } ],
  "evaluacion_comportamiento": {
    "aplica": "true | false",
    "conjuntos": ["identificador y versión"],
    "criterios": [ { "metrica": "cadena", "umbral": "valor" } ],
    "adversarias": ["cadena"],
    "sesgo": ["cadena"]
  }
}
```

### 3.5 IMPLEMENTATION

```json
{
  "ficheros_creados": [ { "ruta": "cadena", "proposito": "cadena", "funciones_clave": ["cadena"] } ],
  "ficheros_modificados": [ { "ruta": "cadena", "cambios": "cadena", "motivo": "cadena" } ],
  "dependencias_anadidas": [ { "nombre": "cadena", "version": "cadena", "licencia": "cadena", "motivo": "cadena" } ],
  "conformidad": { "sigue_guia": "true | false", "sigue_plan": "true | false" },
  "siguiente": "TEST_IMPLEMENTATION"
}
```

Toda desviación va en el bloque común `desviaciones`, sin resolver.

### 3.6 TEST_IMPLEMENTATION

```json
{
  "pruebas": [ { "fichero": "cadena", "casos": ["id"], "tipo": "UNITARIA|INTEGRACION|E2E" } ],
  "dobles_y_datos": [ { "fichero": "cadena", "proposito": "cadena" } ],
  "ejecucion": { "comando": "cadena", "variables": ["cadena"], "requisitos": ["cadena"] },
  "cobertura_obtenida": { "total": "porcentaje", "unitaria": "porcentaje", "integracion": "porcentaje" },
  "conformidad": { "sigue_estrategia": "true | false" }
}
```

### 3.7 AUDIT_TESTS

```json
{
  "cobertura": { "real_total": "porcentaje", "esperada_total": "porcentaje", "real_unitaria": "porcentaje", "esperada_unitaria": "porcentaje", "real_integracion": "porcentaje", "esperada_integracion": "porcentaje", "huecos": ["cadena"] },
  "calidad": [ { "aspecto": "ASERCIONES|CASOS_LIMITE|RUTAS_ERROR|DOBLES|DATOS|CLARIDAD", "estado": "EXCELENTE|BUENA|ADECUADA|POBRE", "hallazgos": ["cadena"] } ],
  "revision_casos": [ { "id": "cadena", "implementado": "true | false", "calidad": "EXCELENTE|BUENA|ADECUADA|POBRE|AUSENTE", "problemas": ["cadena"] } ],
  "veredicto": "GO|GO_CON_CAMBIOS|NO_GO",
  "justificacion": "cadena",
  "correcciones_requeridas": [ { "problema": "cadena", "severidad": "CRITICA|ALTA|MEDIA|BAJA", "recomendacion": "cadena" } ]
}
```

### 3.8 AUDIT_CODE

```json
{
  "fidelidad_plan": { "puntuacion": "0-100", "desviaciones": [ { "desviacion": "cadena", "justificada": "true | false", "justificacion": "cadena" } ] },
  "cumplimiento_guia": { "puntuacion": "0-100", "violaciones": [ { "regla": "cadena", "ubicacion": "cadena", "severidad": "CRITICA|ALTA|MEDIA|BAJA" } ] },
  "riesgos_tecnicos": [ { "riesgo": "cadena", "categoria": "RENDIMIENTO|SEGURIDAD|FIABILIDAD|MANTENIBILIDAD|ESCALABILIDAD", "severidad": "CRITICA|ALTA|MEDIA|BAJA", "evidencia": "cadena", "mitigacion": "cadena" } ],
  "deuda_tecnica": [ { "elemento": "cadena", "impacto": "cadena", "recomendacion": "cadena" } ],
  "dependencias": [ { "nombre": "cadena", "existe": "true | false", "procedencia": "cadena", "vulnerabilidades": ["identificador"], "licencia": "cadena", "compatible": "true | false" } ],
  "hallazgos": [ { "hallazgo": "cadena", "severidad": "CRITICA|ALTA|MEDIA|BAJA", "ubicacion": "cadena", "recomendacion": "cadena" } ],
  "veredicto": "GO|GO_CON_CAMBIOS|NO_GO",
  "justificacion": "cadena",
  "siguiente": "VERSION|FIX_PRIMERS|PLAN"
}
```

### 3.9 FIX_PRIMERS

```json
{
  "correcciones": [
    { "id": "cadena", "hallazgo": "id del hallazgo", "problema": "cadena", "fichero": "cadena", "ubicacion": "cadena",
      "cambio": "cadena", "justificacion": "cadena", "impacto": "cadena", "riesgo_regresion": "BAJA|MEDIA|ALTA" }
  ],
  "ficheros_modificados": ["cadena"],
  "pruebas_actualizadas": ["cadena"],
  "riesgo_regresion_global": "BAJA|MEDIA|ALTA",
  "siguiente": "AUDIT_CODE"
}
```

### 3.10 VERSION

```json
{
  "version": { "numero": "MAYOR.MENOR.PARCHE", "tipo": "MAYOR|MENOR|PARCHE", "justificacion": "cadena" },
  "cambios": [ { "categoria": "ANADIDO|CAMBIADO|OBSOLETO|ELIMINADO|CORREGIDO|SEGURIDAD", "descripcion": "cadena", "referencia": "topic o incidencia" } ],
  "cambios_incompatibles": [ { "cambio": "cadena", "impacto": "cadena", "migracion": "cadena" } ],
  "migracion": { "requerida": "true | false", "pasos": ["cadena"], "esfuerzo": "cadena" },
  "despliegue": { "requisitos": ["cadena"], "plan": "cadena", "reversion": "cadena", "reversion_probada": "true | false", "vigilancia": ["cadena"], "responsable_operacion": "cadena" },
  "sistema_con_ia": { "modelo": "cadena", "parametros": "cadena", "instrucciones_version": "cadena", "conjuntos_evaluacion_version": "cadena", "modelo_respaldo": "cadena" }
}
```

---

## 4. Contratos de los ciclos complementarios

### 4.1 DOCUMENT_EXISTING (L1)

```json
{
  "ubicacion_codigo": "cadena",
  "comportamiento": { "proposito": "cadena", "funcionalidad": ["cadena"], "entradas": ["cadena"], "salidas": ["cadena"], "efectos_secundarios": ["cadena"] },
  "componentes": [ { "nombre": "cadena", "tipo": "CLASE|FUNCION|MODULO|SERVICIO", "responsabilidad": "cadena", "dependencias": ["cadena"] } ],
  "dependencias": { "internas": ["cadena"], "externas": ["cadena"] },
  "diagramas": [ { "tipo": "FLUJO|ARQUITECTURA|SECUENCIA", "fichero": "cadena", "descripcion": "cadena" } ],
  "no_contrastado": ["afirmaciones inferidas sin evidencia de ejecución"],
  "riesgos": ["cadena"]
}
```

### 4.2 DISCOVERY_LEGACY (L2)

```json
{
  "objetivo_cambio": "cadena",
  "areas_afectadas": [ { "componente": "cadena", "impacto": "CRITICA|ALTA|MEDIA|BAJA", "motivo": "cadena" } ],
  "riesgos_modificacion": [ { "riesgo": "cadena", "severidad": "CRITICA|ALTA|MEDIA|BAJA", "mitigacion": "cadena" } ],
  "pruebas": { "existentes": ["cadena"], "cobertura": "porcentaje", "huecos": ["cadena"], "caracterizacion_requerida": ["comportamientos sin prueba"] },
  "casos_limite": [ { "caso": "cadena", "comportamiento_actual": "cadena", "tiene_prueba": "true | false" } ],
  "recomendaciones": ["cadena"],
  "siguiente": "PLAN"
}
```

### 4.3 DEBUG (D1)

```json
{
  "incidente": { "fecha": "ISO 8601", "descripcion": "cadena", "entorno": "DESARROLLO|PREPRODUCCION|PRODUCCION" },
  "modo": "ESTATICO|CON_EJECUCION",
  "evidencias": { "ficheros": ["cadena"], "comandos": ["cadena"], "registros": ["cadena"], "trazas": ["cadena"] },
  "causa_raiz": { "resumen": "cadena", "explicacion": "cadena", "categoria": "LOGICA|CONFIGURACION|CONCURRENCIA|RECURSOS|DEPENDENCIA|OTRA" },
  "veredicto": "CODIGO|CONFIGURACION|INFRAESTRUCTURA",
  "acciones": [ { "accion": "cadena", "prioridad": "CRITICA|ALTA|MEDIA|BAJA", "siguiente": "PLAN|HOTFIX|CONFIGURACION|INFRAESTRUCTURA" } ]
}
```

### 4.4 HOTFIX (U2–U7)

```json
{
  "prioridad": "P1|P2",
  "tipo_correccion": "PROVISIONAL|DEFINITIVA",
  "causa_raiz": "resumen del informe D1",
  "plan_simplificado": { "cambio": "cadena", "alcance": "cadena", "riesgo": "cadena", "pruebas_minimas": ["cadena"], "reversion": "cadena" },
  "revision_acelerada": { "veredicto": "GO|GO_CON_CAMBIOS|NO_GO", "justificacion": "cadena" },
  "implementacion": { "ficheros": ["cadena"], "cambios": "cadena", "pruebas_ejecutadas": ["cadena"] },
  "despliegue": { "fecha": "ISO 8601", "metodo": "cadena", "aprobacion_emergencia": "persona", "reversion_disponible": "true | false" },
  "vigilancia": { "duracion_minutos": "entero", "indicadores": ["cadena"], "estado": "ESTABLE|INESTABLE|REVERTIDO" },
  "analisis_posterior": { "cronologia": ["cadena"], "causa_raiz": "cadena", "eficacia": "RESUELTO|MITIGADO|INEFICAZ", "lecciones": ["cadena"], "acciones": [ { "accion": "cadena", "responsable": "cadena", "fecha": "cadena" } ] },
  "plan_definitivo": { "requerido": "true | false", "topic": "cadena" }
}
```

### 4.5 SECURITY_AUDIT (S1)

```json
{
  "alcance": { "ficheros": ["cadena"], "componentes": ["cadena"] },
  "vulnerabilidades": [
    { "id": "cadena", "severidad": "CRITICA|ALTA|MEDIA|BAJA",
      "categoria": "INYECCION|XSS|AUTENTICACION|AUTORIZACION|CRIPTOGRAFIA|SECRETOS|VALIDACION_ENTRADAS|IA_INYECCION_INSTRUCCIONES|IA_FUGA_DATOS|IA_PERMISOS_HERRAMIENTAS|OTRA",
      "referencia": "entrada de la lista de referencia", "descripcion": "cadena", "ubicacion": "cadena", "explotacion": "cadena", "remediacion": "cadena" }
  ],
  "secretos": { "encontrados": "true | false", "ubicaciones": ["cadena"], "recomendacion": "cadena" },
  "dependencias_vulnerables": [ { "nombre": "cadena", "version": "cadena", "vulnerabilidad": "identificador", "severidad": "CRITICA|ALTA|MEDIA|BAJA" } ],
  "decision_despliegue": { "criticas": "entero", "altas": "entero", "medias": "entero", "bajas": "entero", "bloquea": "true | false", "justificacion": "cadena" },
  "riesgos_residuales_propuestos": [ { "riesgo": "cadena", "severidad": "MEDIA|BAJA", "recomendacion": "cadena" } ],
  "veredicto": "GO|GO_CON_CAMBIOS|NO_GO"
}
```

La aceptación de los riesgos residuales no forma parte del contrato: la escribe una persona en el registro de validación.

### 4.6 BEHAVIOUR_EVAL (E)

```json
{
  "conjunto": { "id": "cadena", "version": "cadena", "casos": "entero" },
  "resultados": [ { "metrica": "cadena", "valor": "número", "umbral": "número", "cumple": "true | false" } ],
  "fallos": [ { "categoria": "cadena", "recuento": "entero", "ejemplos": ["cadena"] } ],
  "adversarias": [ { "prueba": "cadena", "resultado": "SUPERADA|FALLIDA", "detalle": "cadena" } ],
  "sesgo": [ { "prueba": "cadena", "segmentos": ["cadena"], "diferencia": "número", "umbral": "número", "cumple": "true | false" } ],
  "muestra_revision_humana": { "casos": "entero", "criterio_seleccion": "cadena" },
  "veredicto": "GO|GO_CON_CAMBIOS|NO_GO",
  "justificacion": "cadena",
  "fase_retorno": "PLAN|IMPLEMENTATION|null"
}
```

---

## 5. Formato de los contextos

Los contextos no son artefactos de fase y se escriben en Markdown con secciones fijas (documento 02):

```
# CONTEXTO_GLOBAL (versión n)
## Artefactos
## Pruebas
## Versionado
## Seguridad base
## Datos y proveedores de modelos
## Prohibiciones
## Parámetros de los ciclos complementarios
## Modelos aprobados

# CONTEXTO_PROYECTO (versión n)
## Tecnología
## Arquitectura
## Reglas de dominio
## Cumplimiento
## Convenciones del equipo
## Despliegue
## Excepciones justificadas
```

---

## 6. Validación automática

Un validador de artefactos comprueba, antes de la validación humana:

| Comprobación | Resultado si falla |
|---|---|
| Bloque común presente y completo, incluido `modelo`. | Artefacto incompleto. |
| Todas las secciones obligatorias del contrato de la fase. | Artefacto incompleto. |
| Valores de veredicto, severidad y prioridad dentro de las escalas. | Artefacto incompleto. |
| `veredicto = GO` con problemas críticos o altos abiertos. | Autoaprobación. |
| `topic` en formato correcto y coincidente con la carpeta. | Artefacto incompleto. |
| `iteracion` correlativa con el artefacto anterior de la misma fase. | Artefacto incompleto. |
| Referencias cruzadas (`hallazgo`, `caso`, `problema`) existentes en el artefacto anterior. | Artefacto incompleto. |

El validador **no juzga el contenido**: eso corresponde a la IA revisora y a la persona. Una herramienta sin servidor con esta función forma parte de los siguientes pasos de SPAD (documento 08).

---

## 7. Documentos relacionados

| Documento | Relación |
|---|---|
| **documento 01 · Guía operativa** | Fases que producen cada artefacto. |
| **documento 02 · Contextos, temas y registro de artefactos** | Registro del modelo y de validación. |
| **documento 03 · Política de validación** | Causas que el validador automático detecta. |
| **documento 04 · Ciclos complementarios** | Contratos L1, L2, D1, U y S1. |
| **documento 05 · Sistemas que incluyen IA** | Contrato de la evaluación del comportamiento y campos `sistema_con_ia`. |
| **documento 06 · Instrucciones por fase** | Instrucciones que exigen estas salidas. |

---

## 8. Control de versiones

| Versión | Fecha | Cambios |
|---|---|---|
| 0.1 | 19-09-2026 | Primera versión. Reescribe la especificación anterior: bloque común con registro del modelo y desviaciones; escalas únicas; registro de validación humana; contratos del ciclo principal con dependencias y licencias; contratos de los ciclos complementarios; contrato de la evaluación del comportamiento; formato de contextos; comprobaciones del validador automático. |
