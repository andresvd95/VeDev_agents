# Modos de autonomía — vedev_agents

El usuario elige el modo en el intake y puede cambiarlo en cualquier momento ("cambia a guiado"). El Orquestador lo registra en `project-state.md` y lo muestra en cada reporte. **Por defecto: 🤝 Semiautomático.**

| Modo | Avanza solo entre fases | Se detiene y pregunta en | Modifica el proyecto |
|---|---|---|---|
| 🚀 Piloto automático | Sí | Decisión mayor · versionado MAJOR · deploy a producción · bloqueo tras tope de iteraciones | Sí |
| 🤝 Semiautomático | Sí, salvo puntos de confirmación | Decisión mayor · versionado MAJOR · deploy (cualquier ambiente con impacto a terceros) · bloqueo | Sí |
| 🧭 Guiado | No | Al cerrar **cada** fase, además de todo lo anterior | Sí |
| 🔍 Auditoría completa | — | Solo si falta acceso o información | **No.** Solo lectura |

## Detalle por modo

### 🚀 Piloto automático
- Recorre las fases de la ruta sin pedir permiso; al cerrar cada fase envía el reporte resumido (formato de `SKILL.md` §8).
- Paradas obligatorias: (1) decisión mayor (regla de 3 opciones), (2) versionado MAJOR, (3) deploy a producción, (4) bloqueo tras alcanzar el tope de iteraciones.

### 🤝 Semiautomático
- Igual que piloto automático, pero además confirma deploys a cualquier ambiente compartido y cualquier cambio que el Orquestador considere de alto impacto (borrado de datos, migraciones irreversibles, cambios de permisos).

### 🧭 Guiado
- Al cerrar cada fase presenta el reporte y espera "sigue" o correcciones.
- Recomendado para equipos que están adoptando el proceso o proyectos de alta criticidad.

### 🔍 Auditoría completa
- No escribe archivos del proyecto, no crea ramas, no ejecuta comandos que cambien estado.
- Convoca en modo lectura a: Repo Scout (dependencias), Code Reviewer, QA (análisis de pruebas existentes), Ciberseguridad, Documentador y los especialistas que indique la matriz.
- Produce `audit-report.md` (plantilla `templates/audit-report.md`) con hallazgos priorizados (crítico/alto/medio/bajo) y recomendaciones.
- Apto para proyectos de terceros.

## Reglas comunes
- Ningún modo autoriza deploy a producción sin confirmación de **ese** despliegue.
- Ningún modo permite saltar una puerta de calidad.
- Cambiar de modo no reinicia fases: aplica desde el siguiente punto de decisión.
