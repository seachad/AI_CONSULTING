Sigue estrictamente el flow AECF definido en .prompts/aecf.

Este prompt está sujeto a auditoría.
El incumplimiento del flujo invalida la respuesta.


FASE: DISCOVERY

OBJETIVO:
Localizar y delimitar todo el código relacionado con una funcionalidad
concreta dentro del proyecto.

CONTEXTO:
Existe código ya implementado.
La funcionalidad puede estar repartida en varios archivos o módulos.

PETICIÓN FUNCIONAL:
"{nombre de la funcionalidad}"

TAREAS OBLIGATORIAS:
1. Identificar todos los archivos, módulos o scripts
   directamente implicados en esta funcionalidad.
2. Indicar el rol de cada archivo dentro del flujo funcional.
3. Describir el flujo funcional tal y como existe hoy.
4. Delimitar explícitamente qué queda dentro y fuera del alcance.

REGLAS ESTRICTAS:
- NO analizar la calidad del código.
- NO evaluar seguridad, rendimiento o diseño.
- NO proponer cambios ni mejoras.
- NO asumir archivos o comportamiento no visibles.
- Si falta información, indícalo explícitamente.

FORMATO DE SALIDA OBLIGATORIO:
## Archivos implicados
## Rol de cada archivo
## Flujo funcional identificado
## Límites del alcance

Finaliza con:
FUNCIONALIDAD DELIMITADA PARA AECF



