# Intake — vedev_agents

Diagnóstico inicial que ejecuta el Orquestador al recibir una solicitud nueva (o al abrir un proyecto sin `project-state.md`). Tres pasos, en orden. Todas las respuestas se guardan en `project-state.md`.

---

## Paso 0 — Tamaño de la tarea y RUTA EXPRÉS

Clasifica la tarea **antes que todo**. Es la decisión que más tokens ahorra.

| Tamaño | Señales | Ceremonia | Qué se produce | Quién se convoca | Puertas |
|---|---|---|---|---|---|
| **PARCHE** | Fix puntual, ajuste menor, sin decisión de arquitectura ni alcance nuevo; afecta pocos archivos de una capa | **Exprés** | Historia mínima (problema + criterio de aceptación) · código · prueba que reproduce y cubre el caso | Dev de la capa + Code Reviewer + QA · Seguridad solo con mini-checklist si toca datos, entradas o permisos | Revisión + suite de humo (+ mini-checklist) |
| **FEATURE** | Funcionalidad nueva acotada sobre un proyecto existente | **Estándar** | Historias con criterios · porción del TDD afectada · ADR solo si hay decisión mayor · specs UX si hay interfaz | Requerimientos, Arquitecto (porción), UX/UI (si aplica), Devs, Reviewer, QA, Seguridad, Documentador | Las de las fases tocadas |
| **PROYECTO** | Proyecto nuevo, escalamiento mayor, refactor estructural, cambio de stack | **Completa** | Todo el pipeline: viabilidad, PRD, TDD, ADR, tokens, código, pruebas, seguridad, docs, deploy | Todos los del Piso 1 que apliquen + especialistas de la matriz | Todas |

**Reglas:**
- Declara la clasificación al usuario en una línea: "Lo trato como **FEATURE** (ceremonia estándar) porque…".
- **Regla de oro:** un bugfix NUNCA paga el peaje de un proyecto.
- **Reclasificación:** si un PARCHE resulta tocar una decisión de arquitectura vigente o abrir alcance nuevo, sube a FEATURE y avisa. Si una FEATURE obliga a cambiar el stack o la estructura, sube a PROYECTO.
- En duda entre dos tamaños, elige el menor y deja explícito qué haría subirlo.
- En ruta exprés la viabilidad la declara el Orquestador en una línea del reporte.

---

## Paso 1 — Clasificar el proyecto

**(a) Situación:** nuevo (greenfield) · escalamiento · mantenimiento · fix puntual · documentación · auditoría.

**(b) Tipo:** web · API/servicio · móvil · datos/BI · producto con IA · otro (describir).

**(c) Fase de entrada** (proyectos existentes): ¿en qué fase del pipeline entra? Diagnóstico mínimo: leer README, estructura de carpetas, dependencias, pruebas existentes, CI, historial reciente de git. Si el proyecto no tiene `project-state.md`, se crea con lo encontrado.

---

## Paso 2 — Preguntas que cambian la ruta

Hazlas **siempre** (en el idioma del usuario), salvo las que ya estén respondidas en el Engram o en el pack. En ruta exprés, solo las que afecten al parche.

1. **Dependencias:** ¿el sistema es independiente o depende de otro? ¿Cuál y cómo se integra?
2. **API:** ¿expone una API, consume APIs de terceros, o ambas?
3. **Equipo:** ¿trabaja una persona o un equipo que se reparte? ¿Cuántos y con qué roles?
4. **Datos y regulación:** ¿maneja datos personales, financieros, de salud u otros sensibles? ¿Qué regulación aplica?
5. **Plazo y presupuesto de tokens:** ¿fecha objetivo? ¿Presupuesto de tokens deseado para el trabajo (o "sin límite explícito")?
6. **Criticidad:** baja / media / alta (define el tope de iteraciones: 3 baja-media, 5 alta) y la cobertura mínima de pruebas acordada (por defecto: 70% en lógica de negocio).
7. **Modo de autonomía:** piloto automático / semiautomático / guiado / auditoría.
8. **Integraciones disponibles:** ¿GitHub/GitLab, Jira/Confluence, SonarQube, Figma? (ver `protocols/integrations.md`).
9. **Capa de cumplimiento:** ¿se aplica al repositorio el kit de `enforcement/` (CI, plantillas de PR e issues, hooks)? Recomendado en FEATURE y PROYECTO. ¿Quién puede configurar la protección de ramas?

---

## Salida del intake

1. `project-state.md` creado o actualizado.
2. Reporte al usuario con: tamaño y ruta, tipo y situación, fase de entrada, especialistas activos y descartados (matriz de cobertura) con su razón, modo, presupuesto y siguiente paso.
