# Protocolo de piloto y medición — vedev_agents

Objetivo: demostrar con datos si vedev mejora la forma de trabajar de un equipo **antes** de adoptarlo en serio. Sin piloto medido, las promesas de eficiencia son solo diseño.

## 1. Alcance del piloto

Tres tareas reales, una por ruta, en un proyecto del equipo:

| # | Ruta | Tarea sugerida | Duración típica |
|---|---|---|---|
| 1 | ⚡ PARCHE | Un bug real del backlog | Horas |
| 2 | 🧩 FEATURE | Una funcionalidad acotada ya priorizada | Días |
| 3 | 🏗️ PROYECTO | Un proyecto pequeño o módulo nuevo (o una auditoría completa de un repo existente) | 1–2 semanas |

## 2. Línea base

Para comparar, se necesita al menos una de estas:
- **Histórica:** tareas parecidas hechas antes sin vedev (tiempo, bugs escapados, retrabajo).
- **En paralelo:** una tarea equivalente hecha por el equipo sin vedev durante el piloto.

Sin línea base, el piloto solo mide adopción, no mejora; se dice así en el informe.

## 3. Métricas

| Métrica | Cómo se mide | Fuente |
|---|---|---|
| Tokens por tarea | Reportado por el entorno o estimado (marcar cuál) | Engram / Centinela |
| Tiempo de ciclo | Desde "historia lista" hasta "fusionado en la rama de pruebas" | Plataforma git / tickets |
| Iteraciones | Rondas Dev↔QA y Dev↔Reviewer; escalamientos por tope | Engram |
| Defectos detectados antes de fusionar | Hallazgos bloqueantes en revisión + fallos de QA | PRs, reportes de QA |
| Defectos escapados | Bugs de la tarea reportados en pruebas o producción en las 2–4 semanas siguientes | Tickets |
| Cumplimiento de puertas | Puertas aprobadas con evidencia / puertas aplicables | Engram |
| Clasificación correcta | ¿La ruta elegida fue la adecuada? (juicio del líder) | Retrospectiva |
| Satisfacción del equipo | Encuesta 1–5: claridad, utilidad, carga de ceremonia | Retrospectiva |

## 4. Procedimiento

1. Elegir las 3 tareas y registrar la línea base.
2. Aplicar la capa de cumplimiento (`enforcement/`) al repositorio del piloto.
3. Ejecutar cada tarea con vedev en modo **guiado** (para observar cada fase).
4. Registrar métricas al cerrar cada tarea.
5. Esperar la ventana de defectos escapados (2–4 semanas).
6. Retrospectiva con el equipo y completar `templates/pilot-report.md`.

## 5. Criterios de éxito (orientativos; el equipo los ajusta antes de empezar)

- La tarea PARCHE usó ≤ 3 agentes y no produjo documentos de proyecto.
- Defectos escapados iguales o menores que la línea base.
- Tiempo de ciclo no peor que +20% respecto a la línea base en PARCHE y FEATURE.
- Satisfacción media ≥ 3,5 / 5.
- 100% de puertas aplicables con evidencia.

## 6. Qué hacer con el resultado

- **Éxito:** adoptar en el equipo; publicar el informe (anonimizado) en el repositorio público como evidencia.
- **Éxito parcial:** ajustar protocolos (normalmente: menos ceremonia donde se sintió pesada) y repetir con otra tarea.
- **Fracaso:** documentar por qué; es información valiosa para el núcleo.

Los ajustes que salgan del piloto y sirvan a cualquier equipo van al núcleo; los específicos, al pack de la empresa.
