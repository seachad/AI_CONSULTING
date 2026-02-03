# AECF — AI Engineering Controlled Flow

## Qué es AECF

**AECF (AI Engineering Controlled Flow)** es el **protocolo obligatorio de trabajo con IA** en este repositorio.

No es un prompt.  
No es una guía de estilo.  
No es opcional.

Es un **flujo de ingeniería controlado**, diseñado para generar código **seguro, auditable y apto para producción** mediante modelos de lenguaje.

---

## Por qué existe AECF

Los modelos de lenguaje son muy buenos generando código plausible, pero no son fiables para:
- entender el contexto completo de un sistema
- preservar invariantes globales
- modelar riesgo de producción
- respetar disciplina de ingeniería implícita

Sin estructura, la IA:
- salta directamente a implementar
- mezcla razonamiento y ejecución
- oculta decisiones de diseño
- produce sistemas frágiles

AECF existe para **separar pensar, validar y ejecutar**.

---

## Principios fundamentales

1. **Proceso por encima de prompts**  
   Los prompts son instrucciones.  
   AECF es un sistema de trabajo.

2. **Fases explícitas con autoridad clara**  
   Cada fase tiene:
   - rol definido
   - permisos explícitos
   - prohibiciones explícitas

3. **Auditoría antes de confiar**  
   Ningún código llega a producción sin una fase de auditoría independiente.

4. **Detección antes que obediencia ciega**  
   AECF asume que una LLM puede violar instrucciones.
   Las violaciones deben ser detectables y descartables.

5. **Control humano mínimo, máximo apalancamiento**  
   El humano valida el flujo, no revisa línea a línea.

---

## Flujo AECF

### Funcionalidad nueva

```
PLAN
 → AUDIT-PLAN (GO / NO-GO)
   → IMPLEMENT
     → AUDIT-CODE (GO / GO CONDICIONAL / NO-GO)
       → FIX-CODE (si aplica)
```

### Funcionalidad legacy

```
DISCOVERY
 → PLAN
   → AUDIT-PLAN (GO / NO-GO)
     → IMPLEMENT
       → AUDIT-CODE (GO / GO CONDICIONAL / NO-GO)
         → FIX-CODE
```

Saltarse una fase **invalida el resultado**.

---

## Responsabilidad de las fases (resumen)

- **DISCOVERY**: localizar y delimitar. Solo lectura.
- **PLAN**: definir alcance, riesgos y criterios.
- **AUDIT-PLAN**: validar el diseño.
- **IMPLEMENT**: escribir código según el PLAN aprobado.
- **AUDIT-CODE**: auditar código y emitir veredicto.
- **FIX-CODE**: corregir solo lo auditado.

---

## Estados GO

- **GO**: apto para producción.
- **GO CONDICIONAL**: producción con riesgo residual aceptado.
- **NO-GO**: bloqueado hasta FIX.

---

## Phase Violation Detection

Cualquier violación del flujo invalida la respuesta:
- código en DISCOVERY o PLAN
- fixes en auditoría
- rediseño en FIX
- artefactos obligatorios ausentes

Las respuestas inválidas se descartan y se reejecuta la fase.

La política completa está definida en **AECF_POLICY.md**.  

Las reglas vinculantes están en **AECF_RULES.md**.

---

## Qué NO es AECF

- No es prompting
- No es burocracia
- No es documentación decorativa
- No garantiza código perfecto

AECF es un **sistema de contención de riesgo**.

---

## Principio final

> **La IA amplifica la disciplina de ingeniería que ya existe.**

AECF garantiza que lo amplificado sea **disciplina**, no fragilidad.

---

## Estado

- AECF operativo
- Prompts versionados
- Política activa
- Listo para producción


## Diagrama oficial del flujo AECF

El diagrama oficial del flujo AECF se encuentra en:

➡️ [Ver diagrama AECF](docs/aecf_flow.mmd)

Este diagrama es la referencia visual canónica del proceso.