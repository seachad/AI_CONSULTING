A tener en cuenta para este proyecto en AECF

HARD PRECONDITION: Load and enforce ./00_CONTEXT_GENERCIS.md before executing this prompt.

## REGLAS GENERALES:
todos los documentos que generes como resultado de la ejecución de una phase en un chat los generes en documentation/<chat_title>/AECF_<num>_<nombre_documento>, de tal manera que chat_title es el titulo del chat que estamos manteniendo y nombre_documento es el nombre del documento que generas como respuesta a la phase de AECF en que estemos. <num> es el numero correlativo de documento

## TEMPORAL FILES
# todos los archivos temporales, trazas, logs, etc... se hará siempre el directorio producido por dot_flask_dashboards("<nombre_sub_directorio>", "<nombre_archivo>"), nunca rutas hardcodeadas ni relativas, de esta manera se garantiza que funcionará en cualquier entorno y con múltiples instancias
# para logs el subdirectorio siempre será logs, para otros tipos de ficheros se usará otro subdirectorio adecuado, las trazas irán dentro de server_trace/<subdirectorio_especcífico_traza>, hay ejemplos en el código existente...

## VARIABLES DE ENTORNO:
----------------------------
Siempre se documentan, se pone su valor por defecto en el .env correspondiente
Siempre van en mayúsculas y empiezan por CM_
Siempre que te pida que creemos una variable de entorno la crearás al final de la sección DEVELOPMENT AND DEBUGGING STD (salvo que explícitamente se ponga en una sección diferente), la pondrá con su valor por defecto y pondrás una descripción de para qué vale y su valor por defecto
se incluirá automáticamente  production_env_overrides.json en su zona correspondiente con su valor por defecto
si alguna variable de entorno no sabes dónde ponerla que se agregue a la sección NEW_VARIABLES STD
Las variables CM_ nuevas nunca se añaden automáticamente a ningún .env*.* , solo a production_env_overrides.json y a la documentación, la inclusión en los .env*.* se hará manualmente después por parte del usuario. no se incluye automaticamente en .env-seachad tampoco

# AECF – Project Context Contract

## 1. Domain
- Application type: 
- Business domain:
- Regulated / non-regulated:

## 2. Architectural Constraints
- Language versions
- Frameworks allowed / forbidden
- Runtime environment - flask_dashboards_sso_ptyhon_3_13_dependabot
- Async / sync constraints

## 3. Security & Compliance
- Data sensitivity
- Auth model
- Forbidden patterns

## 4. Non-Negotiable Rules
- No global state unless justified
- No magic behavior
- Deterministic outputs

## 5. Output Expectations
- Format rules
- Naming conventions
- Documentation level

## 6. AECF Overrides
- What CANNOT be changed even if requested


