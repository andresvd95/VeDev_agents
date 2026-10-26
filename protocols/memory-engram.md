# Memoria del proyecto ("Engram") — vedev_agents

El **Engram** es la memoria persistente de cada proyecto entre sesiones y entre agentes. Es un único archivo Markdown, `project-state.md`, versionado junto al código (raíz del proyecto, salvo que el pack indique otra ruta). Plantilla: `templates/project-state.md`.

> Nota: "Engram" es el nombre del formato dentro de vedev_agents. Funciona solo con archivos; no requiere ninguna herramienta externa de memoria. Si el entorno tiene una herramienta de memoria, puede usarse como complemento, pero la fuente de verdad es `project-state.md`.

## Qué contiene

1. Identidad y tipo del proyecto
2. Respuestas del intake
3. Clasificación de tamaño y ruta vigente
4. Modo de autonomía vigente
5. Decisiones y ADR vigentes (con enlace)
6. Stack
7. Estado por fases (pendiente / en curso / aprobada / bloqueada)
8. Especialistas activos y descartados (con razón)
9. Integraciones activas y ausentes
10. Presupuesto de tokens y consumo por fase
11. Riesgos y bloqueos
12. Bitácora breve (últimas 10 entradas; las antiguas se archivan en `docs/project-history.md`)

## Reglas

- **Un solo escritor:** solo el Orquestador escribe el Engram. Los agentes devuelven artefactos; el Orquestador los resume en el estado.
- **Lectura por secciones:** cada agente recibe solo las secciones que su fase necesita (p. ej. el Dev recibe stack, ADR vigentes e historia activa; no recibe presupuesto ni bitácora).
- **Breve:** el Engram es un índice, no un archivo de documentos. Enlaza a PRD, TDD, ADR; no los copia. Objetivo: menos de 200 líneas.
- **Al abrir sesión:** el Orquestador lo carga y resume "dónde estamos" en 5 líneas antes de actuar.
- **Al cerrar fase o tarea:** el Orquestador actualiza estado, consumo y bitácora.
- **Sin secretos:** nunca contiene valores de variables, credenciales ni datos personales reales.
- **Conflictos:** si dos personas del equipo actualizan el Engram en ramas distintas, se resuelve como cualquier conflicto de git; prevalece el estado de la rama de pruebas.
