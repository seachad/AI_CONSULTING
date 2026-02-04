Consideraciones globales a tener en cuenta para cualquier proyecto

## 1. Non-Negotiable Rules
- todos los documentos que generes como resultado de la ejecución de una phase en un chat los generes en documentation/<chat_title>/AECF_<num>_<nombre_documento>, de tal manera que chat_title es el titulo del chat que estamos manteniendo y nombre_documento es el nombre del documento que generas como respuesta a la phase de AECF en que estemos. <num> es el numero correlativo de documento
- No global state unless justified
- No magic behavior
- Deterministic outputs
- es importante que generes documentación interna en el código que escribas que explique qué es lo que hace cada sección o codigo importante
- cualquier código que se haga tiene que ser compatible con usar varias sesiones con haproxy, si se graban ficheros, se protegerán con lock pero se tendrá un sistema que garantice que no hay errores o cuelgue de la plataforma con condiciones de carrera
- si algo se puede hacer con thread, también se podrá hacer con queue y se pondrá, para ello, una variable CM_ que determinará si "thread" o "queue", los nombres de los threads comenzarán con T_ y los de las queues con Q_ (verás ejemplos en el código existente)
- cualquier función cuyo objetivo sea hacer debug debe tener el decorator function_not_for_production, como verás que ya hay funciones que lo llevan, esto me ayuda a saber qué se está ejecutando código que por debug, log o lo que sea, puede afectar al performance del sistema en producción
- MERMAID:
    cuando te pida creación de un flow de mermaid
    tiene que tener extensión .mmd
    no debe contener comentarios de markdown
    inspírate en un flow sencillo como el de flowchart TD.mmd en documentation
    lo generas en documentation
- HAPROXY:
    Cualquier variable o función, escritura en ficheros o json comunes, tiene que estar preparado para waitress y para múltiples instancias con haproxy, protegido contra condiciones de carrera, sobreescrituras, etc...

## 2. IMPORTANT CONSIDERATIONS
- **CM_ Variables**: cualquier variable introducida del tipo CM_ debe aparecer en production_env_overrides.json manteniendo la estructura que tiene el resto, no se incluirá por defecto en ningún .env que haya en el sistema
- **.md documentation**: la documentación con extensión .md siempre irá al directorio documentation, los documentos generadors por los AECF prompts 
- **commit**: los mensajes de commit deben ser claros y descriptivos, siguiendo las mejores prácticas de git. Incluyelo cuando te lo pida para incluirlo en github cuando haga el commit. La orden será commit_message. si generas un commit_message.md hazlo siempre con un nombre descriptivo despues de commit_message y lo generas en documentation/commit_messages
- **TESTS**: siempre que generes código que pueda ser testeado, tienes que generar también los tests correspondientes en el directorio tests, siguiendo la estructura y convenciones de los tests ya existentes en el proyecto. Los tests deben cubrir tanto casos normales como casos límite para asegurar la robustez del código.
