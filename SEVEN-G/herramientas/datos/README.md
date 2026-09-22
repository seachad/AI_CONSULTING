# Carpeta de datos de la copia de la compañía · Company data folder

**ES.** Esta carpeta existe para la **copia del sitio que una compañía monta en su propio servidor** (documento 03 §2.1). En el sitio público está vacía y así debe seguir: en él solo viven los datos de ejemplo, que nadie puede cambiar.

Cuando el sitio se sirve por http y en esta carpeta hay uno de estos ficheros, la herramienta correspondiente lo carga en lugar de sus datos de ejemplo y toda la compañía ve la misma versión:

| Fichero | Herramienta | Cómo se obtiene |
|---|---|---|
| `T01_registro.json` | T01 · Registro de iniciativas | «Datos» → «Exportar JSON completo» |
| `T11_calculadora.json` | T11 · Hipótesis de valor y costes (con T13) | «Datos» → «Exportar» |
| `T14_indice.json` | T14 · Índice de transformación | «Datos» → «Exportar» |
| `T15_madurez.json` | T15 · Diagnóstico de madurez | «Datos» → «Exportar» |

Los cambios que cada persona hace en una herramienta se guardan en su navegador o en un fichero de su equipo (botón «Datos: …» de la barra de la herramienta); **publicar una versión nueva para toda la compañía es sustituir el fichero de esta carpeta** por el JSON exportado. El panel del consejo (T17) se regenera aparte con `t01_a_panel.py` a partir de `T01_registro.json`.

Ningún JSON de datos de esta carpeta se versiona en el repositorio público (`verificar_coherencia.ps1` lo comprueba).

**EN.** This folder exists for the **copy of the site that a company sets up on its own server** (document 03 §2.1). On the public site it is empty and must stay so: only the sample data lives there, and nobody can change it.

When the site is served over http and this folder holds one of these files, the corresponding tool loads it instead of its sample data and the whole company sees the same version:

| File | Tool | How to obtain it |
|---|---|---|
| `T01_registro.json` | T01 · Initiative register | "Data" → "Export full JSON" |
| `T11_calculadora.json` | T11 · Value hypothesis and costs (with T13) | "Data" → "Export" |
| `T14_indice.json` | T14 · Transformation index | "Data" → "Export" |
| `T15_madurez.json` | T15 · Maturity diagnosis | "Data" → "Export" |

The changes each person makes in a tool are saved in their browser or in a file on their computer ("Data: …" button in the tool bar); **publishing a new version for the whole company means replacing the file in this folder** with the exported JSON. The board dashboard (T17) is regenerated separately with `t01_a_panel.py` from `T01_registro.json`.

No data JSON in this folder is versioned in the public repository (`verificar_coherencia.ps1` checks it).
