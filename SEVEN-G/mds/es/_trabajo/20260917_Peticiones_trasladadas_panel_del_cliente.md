# Peticiones trasladadas al proyecto 100 - --- (panel del consejo)

| | |
|---|---|
| Tipo | Documento de trabajo interno |
| Fecha | 17-09-2026 |
| Objetivo | Conservar, para ejecutarlas en una sesión sobre el proyecto del cliente (100 - ---), cuatro peticiones del autor sobre el Panel de IA del Consejo que se formularon por error en la sesión de AI_CONSULTING. Lo aplicado aquí por error se ha revertido. |

> Documento interno. No se publica. Ejecutar estas peticiones sobre el motor de origen del panel (`build_dashboard.py`, `economia.py`, `panel_core.py`, `panel_movil.py`) en el proyecto del cliente y regenerar sus paneles.

## Texto para pegar en la sesión de 100 - ---

```
Peticiones sobre el Panel de IA del Consejo (motor build_dashboard.py de este proyecto). Ejecutarlas aquí, en el motor de origen del panel, y regenerar los paneles:

1. ZONA DE FILTROS. En la zona de filtros, en la pantalla, visualmente no se ve que sea un desplegable; los diferentes filtros visualmente tampoco se distinguen bien (las categorías COMPAÑÍA, UNIDAD DE NEGOCIO, TECNOLOGÍA, EXPOSICIÓN, …); además el botón de Limpiar filtros debería estar en la zona de filtros. Rehaz visualmente y el layout para que quede más operativa la zona de filtros.
   Sugerencia: barra-resumen con chevrón y contador de filtros activos; cada categoría en su propia fila (etiqueta a la izquierda en columna fija, chips a la derecha, fondo alterno y marca cuando tiene selección) con aspa para limpiar esa categoría; botón "Limpiar filtros" dentro del summary del panel de filtros (con preventDefault para que no pliegue el panel); apilado en móvil.

2. AGRUPACIÓN Y PRESENTACIÓN. Hoy el selector "Por compañía y unidad | Tabla" mezcla dos cosas. Deben ser dos controles independientes: (a) agrupar "Por compañía y unidad" (sí/no) y (b) presentación "Tarjetas | Tabla". Si la agrupación está activa, tanto las tarjetas como la tabla se agrupan por compañía y unidad (en la tabla, filas de cabecera con totales por compañía y unidad); si no está activa, salen todos los casos seguidos en el orden elegido en "Ordenar por". Cuatro combinaciones en total.

3. TÍTULOS DE SECCIÓN. Que las categorías del panel (Cartera y valor, Riesgo y cumplimiento, …) se detecten mejor: títulos más grandes. Hoy .sec h2 mide 15 px; hacerlos claramente mayores (p. ej. 22 px), con regla superior de color y más aire encima.

4. VALORES QUE NO TENEMOS (a cero). Recalcular los valores que no tenemos: dado que cualquier valor que pongamos va a ser irreal, no debe haber valores a cero; el valor que hoy está a cero se pone como un multiplicador sobre el coste calculado, se hace ver con un warning en todas las tarjetas y tablas donde haya valores inventados, y el valor será dos veces el coste incurrido, para evitar casos de uso deficitarios.
   Implementación sugerida: en economia.py y panel_core.py (deben seguir replicándose), cuando eficiencias + retorno del lado actual (y análogamente del potencial) sea 0, imputar valor = multiplicador × coste recurrente anual (multiplicador 2 por defecto, configurable en meta, p. ej. meta.valor_imputado_multiplicador), con un estado nuevo del importe ("imputado") y aviso visible en tarjetas, tabla, fichas, panel móvil y KPIs (recuento de casos con valor imputado); documentarlo en ESQUEMA.md y en el aviso del panel. Confirmar con el autor si "coste incurrido" es solo el coste recurrente anual o incluye la construcción.
```

## Estado en AI_CONSULTING

- Los cambios 1–3 se aplicaron por error en `SEVEN-G/herramientas/T17_panel_consejo/motor/build_dashboard.py` el 17-09-2026 y se han **revertido**: el fichero vuelve a ser idéntico a `AI_en_el_consejo/motor/build_dashboard.py` (más la línea de cabecera de la copia). La demo `ejemplo/salida/` se ha regenerado con el motor original.
- La petición 4 no llegó a aplicarse.
- Cuando estos cambios estén hechos en el proyecto del cliente, el autor decidirá si se propagan a la copia de T17 y a `AI_en_el_consejo`.
