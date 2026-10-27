# Ajustes de ceremonia (negociables) — vedev_agents

La ruta (PARCHE / FEATURE / PROYECTO) fija el nivel de ceremonia **por defecto**. Pero un proyecto pequeño o sencillo no siempre necesita todo lo que trae la ruta completa. Este protocolo define qué se puede **ajustar** y cómo.

## Regla central

> **Nada se omite en silencio.** El Orquestador **pregunta** al usuario si desea reducir u omitir cada punto negociable, con una recomendación. Lo no negociable no se pregunta: se cumple siempre.

## Cuándo se pregunta

- **FEATURE y PROYECTO:** en el intake (Paso 3 de `protocols/intake.md`), una sola vez, todos los puntos aplicables en **un solo mensaje**.
- **PARCHE:** no se pregunta; la ruta exprés ya es el mínimo.
- **Durante el trabajo:** si aparece un punto nuevo (p. ej. se decide añadir interfaz), se pregunta solo ese punto.
- El usuario puede cambiar cualquier ajuste después ("ahora sí quiero ADR").

## Señales de proyecto pequeño (el Orquestador recomienda reducir)

- 1–2 personas, plazo corto (días o pocas semanas).
- Uso interno o prototipo, pocos usuarios.
- Sin datos sensibles ni regulación aplicable.
- Criticidad baja.
- Uso personal o un solo dispositivo/instalación.
- Sin red expuesta ni cuentas de usuario.

Si **hay datos sensibles, regulación o criticidad alta**, los puntos marcados 🔒 dejan de ser negociables (se cumplen en su versión completa) y el Orquestador lo explica.

### Perfil recomendado para un proyecto pequeño

Cuando hay varias señales de proyecto pequeño, el Orquestador recomienda por defecto:

- **Historias:** 1–3 historias mínimas con criterios (no un set completo).
- **PRD:** omitido; las historias bastan.
- **TDD:** versión ligera (contexto, modelo de datos, stack).
- **Seguridad:** checklist en lugar de modelo STRIDE formal, sobre todo si no hay red expuesta ni cuentas.
- **Reportes:** formato corto.

*Origen: piloto 01 (`docs/pilots/piloto-01-google-tv.md`), donde un PRD de 13 historias, TDD completo y STRIDE resultaron excesivos para una app personal de una sola TV.*

## Puntos negociables

| # | Punto | Completo (por defecto en PROYECTO) | Versión reducida | ¿Omitible? |
|---|---|---|---|---|
| 1 | **Historias de usuario** | Todas las historias con criterios, casos borde y MoSCoW | 1–3 historias que cubren el alcance, con criterios de aceptación | No (mínimo 1 con criterios) |
| 2 | **PRD** | PRD completo | PRD de 1 página (problema, objetivo, alcance, fuera de alcance) | Sí, si las historias bastan |
| 3 | **Dictamen de viabilidad** | Documento con riesgos y alternativas | 3–5 líneas en el reporte del Orquestador | Sí |
| 4 | **TDD** | Diagramas C4/UML, modelo de datos, contratos | Diagrama de contexto + modelo de datos + stack, 1–2 páginas | No (mínimo: stack y estructura) |
| 5 | **ADR** | Un ADR por decisión mayor | Decisiones registradas en una lista dentro del Engram | Sí, la lista basta |
| 6 | **Regla de 3 opciones** | 3 opciones con tabla | 2 opciones, o recomendación directa que el usuario confirma | No (el usuario siempre decide lo mayor) |
| 7 | **Especificación UX/UI** | Cada pantalla en 3 tamaños con 4 estados | Pantallas clave + estados de error y vacío | No, si hay interfaz |
| 8 | **Design tokens** | Todas las categorías | Color, tipografía y espaciado | No, si hay interfaz |
| 9 | **Cobertura mínima de pruebas** | 70% en lógica de negocio | Valor menor acordado (p. ej. 40%) o solo criterios de aceptación | Reducible 🔒 |
| 10 | **Pruebas E2E** | Flujos críticos automatizados | Prueba manual guiada y documentada | Sí 🔒 |
| 11 | **Modelo de amenazas (STRIDE)** | Documento formal | Checklist de seguridad sin modelo formal | Sí 🔒 |
| 12 | **Documentación** | README, API, guía de usuario, runbook, changelog | README + changelog | Parcial (README siempre) |
| 13 | **Ambiente de pruebas / rama `develop`** | `develop` → URL de pruebas; `main` → producción | Ramas cortas → PR → `main`, sin ambiente intermedio | Sí 🔒 |
| 14 | **Notas de versión formales** | Plantilla completa por release | Entrada en el changelog + tag | Sí |
| 15 | **Centinela operativo** | Presupuestos, simulacros de restauración, salud, alertas | Solo presupuesto de tokens | Sí, si no hay datos en producción 🔒 |
| 16 | **Capa de cumplimiento** | CI, plantillas, hooks, protección de ramas | Solo hooks locales + plantilla de PR | Sí |
| 17 | **Revisión humana adicional** | Code Reviewer + una persona del equipo | Solo Code Reviewer | Sí |
| 18 | **Formato de reportes** | Reporte completo por fase | Resumen de 3 líneas por fase (**por defecto si trabaja una sola persona**) | Sí |

🔒 = deja de ser negociable si hay datos sensibles, regulación aplicable o criticidad alta.

## No negociables (nunca se preguntan ni se omiten)

- Al menos **un criterio de aceptación verificable** por cada cosa que se construye.
- **Revisión independiente** de todo cambio (nadie aprueba su propio código).
- **Pruebas** que cubren los criterios de aceptación, escritas desde la especificación.
- **Sin secretos** en el código ni en el historial; `.env` reales fuera de git.
- **Sin commits directos a `main`** ni force-push a ramas compartidas.
- **Deploy a producción solo con autorización** de ese despliegue, con plan de rollback.
- **Backup verificado** antes de tocar datos de producción.
- **Confirmación** del usuario en decisiones mayores y versiones MAJOR.
- **Mini-checklist de seguridad** cuando el cambio toca datos, entradas o permisos.
- **README actualizado** cuando cambia cómo se corre o se usa el sistema.
- **Topes de iteración** y escalamiento al usuario.

## Formato de la pregunta

Un solo mensaje, con la recomendación ya marcada, para que el usuario pueda responder "acepto":

```
Este proyecto parece pequeño (1 persona, uso interno, sin datos sensibles).
Puedo reducir algunos entregables. Recomiendo:

 1. Historias: 2–3 con criterios (en vez del set completo) ........ reducir
 2. PRD: omitir, las historias bastan ............................ omitir
 5. ADR: lista de decisiones en el estado del proyecto ........... reducir
13. Sin rama develop: ramas cortas → PR → main ................... reducir
15. Centinela: solo presupuesto de tokens ........................ reducir
 9. Cobertura de pruebas: mantener 70% ........................... mantener

Responde "acepto" o dime qué cambiar (p. ej. "mantén el PRD").
Lo no negociable (revisión, pruebas de los criterios, sin secretos, deploy con permiso) se mantiene siempre.
```

Pregunta solo los puntos **aplicables** (p. ej. no preguntes por UX/UI si no hay interfaz). Si el usuario no responde a un punto, se aplica el nivel completo.

## Registro

Cada ajuste queda en `project-state.md`, sección "Ajustes de ceremonia": punto, nivel elegido (completo / reducido / omitido), quién lo decidió y fecha. Las puertas de calidad verifican el **nivel acordado**, no el completo.

## Packs de empresa

Un pack puede **bloquear** puntos (volverlos no negociables para esa empresa, p. ej. "ADR siempre") o cambiar las recomendaciones por defecto. Nunca puede volver negociable algo de la lista de no negociables.
