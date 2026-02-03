# AECF_POLICY.md
## Política humana de validación e invalidación de respuestas AECF

### Versión
AECF Policy v1.0


IMPORTANTE: es una guía no se ejecuta nunca como prompt.

---

## 1. Objetivo de esta política

Establecer cuándo una respuesta generada por una LLM debe considerarse **INVÁLIDA**, independientemente de su calidad aparente, para garantizar que el flujo **AECF** se respeta de forma estricta, trazable y auditable.

Esta política:
- **NO se aplica mediante prompts**
- **NO debe ser interpretada por la LLM**
- Es una **regla humana y de proceso**

---

## 2. Principio fundamental

> **En AECF, el cumplimiento del flujo es más importante que la calidad del resultado.**

Una respuesta técnicamente correcta que viole una fase:
- no es aceptable
- no se reutiliza
- no se corrige
- se descarta

---

## 3. Definición de “Respuesta inválida”

Una respuesta se considera **INVÁLIDA** cuando se produce cualquiera de las situaciones descritas en esta política, independientemente de:
- si el código funciona
- si el análisis es correcto
- si el resultado parece razonable

---

## 4. Causas de invalidación (Phase Violation)

### 4.1 Violación de fase

La respuesta ejecuta acciones que **no corresponden** a la fase AECF activa.

**Ejemplos:**
- DISCOVERY o PLAN generan o modifican código
- PLAN propone fixes o refactors concretos
- AUDIT-CODE corrige o reescribe código
- FIX-CODE rediseña o amplía funcionalidad

**Acción:**
- ❌ Respuesta inválida
- 🔁 Reejecutar la misma fase

---

### 4.2 Ausencia o alteración de artefactos obligatorios

La respuesta:
- omite secciones exigidas por el prompt
- no incluye sentinels obligatorios
- altera el formato contractual

**Acción:**
- ❌ Respuesta inválida
- 🔁 Reejecutar la fase

---

### 4.3 Decisiones fuera del PLAN aprobado

La respuesta introduce:
- decisiones técnicas nuevas
- cambios de alcance
- supuestos no documentados

aunque estén bien razonados.

**Acción:**
- ❌ Respuesta inválida
- 🔁 Volver a PLAN o FIX-PLAN según corresponda

---

### 4.4 Implementación sin auditoría previa

Se genera o modifica código cuando:
- no existe un PLAN aprobado
- no existe AUDIT-PLAN o AUDIT-CODE previo

**Acción:**
- ❌ Respuesta inválida
- 🔁 Volver a la fase correcta

---

### 4.5 Autojustificación del modelo

La respuesta:
- se autoaprueba
- minimiza violaciones
- justifica incumplimientos  
  (“aunque pedías X, he hecho Y porque…”)

**Acción:**
- ❌ Respuesta inválida inmediata

---

## 5. Qué NO invalida una respuesta

No se considera causa de invalidación:

- Hallazgos CRÍTICOS o WARNING
- Veredicto NO-GO
- Errores menores de estilo
- Código poco elegante pero correcto
- Opiniones técnicas razonables **dentro de la fase**

AECF **prefiere un NO-GO válido a un GO fuera de proceso**.

---

## 6. Procedimiento ante respuesta inválida

Cuando se detecta una respuesta inválida:

1. No se corrige
2. No se reutiliza
3. No se edita
4. Se descarta completamente
5. Se reejecuta la misma fase con el mismo prompt
6. Si la violación se repite:
   - se endurece el prompt
   - se documenta la violación

---

## 7. Registro de violaciones (opcional, recomendado)

Para flujos críticos se recomienda registrar:

- Fase AECF
- Motivo de invalidación
- Fecha
- Modelo utilizado

Ejemplo:

```md
2026-02-03
Fase: DISCOVERY
Motivo: Generación de código
Acción: Respuesta descartada
