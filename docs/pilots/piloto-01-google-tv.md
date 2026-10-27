# Informe de piloto 01 — vedev_agents v0.2.x

**Proyecto:** launcher (pantalla de inicio) personalizado para Google TV · **Equipo:** 1 persona + Claude Code (app de escritorio, Opus 5.5) · **Fecha:** 2026-10-26 (una sesión, ~3–4 h de reloj) · **Modo de ejecución:** sin subagentes (roles en secuencia) · **Línea base:** estimada, no medida

## 1. Resumen

- **Resultado del proyecto:** ✅ exitoso. App instalada y funcionando en la TV, con respaldo y restauración probados y PR abierto.
- **Estado del piloto:** 1 de 3 tareas completada (la de ruta PROYECTO). Faltan un PARCHE y una FEATURE medidos, y cerrar la ventana de defectos escapados.
- **En una frase:** la viabilidad con prueba de concepto evitó construir sobre supuestos falsos y la calidad fue alta, pero la ceremonia completa fue más de lo que pedía una app personal de una sola TV.

## 2. Tarea

| Ruta | Alcance | Roles usados | Costo | Tiempo de ciclo | Escalamientos |
|---|---|---|---|---|---|
| 🏗️ PROYECTO (ceremonia completa); el rediseño final se reclasificó como 🧩 FEATURE | Inicio con barra superior (reloj, Notificaciones, Play, Ajustes, Perfil), fila de Apps y fila de Recientes · menú al mantener OK (Mover, Fijar, Ocultar) · estados vacío, carga y error · flujo del botón Home por servicio de accesibilidad · operación: respaldo, instalar, reaplicar, restaurar/rescatar | 11 de 16: Orquestador, Viabilidad, Requerimientos, Arquitecto, UX/UI, Dev, Code Reviewer, QA, Ciberseguridad, Documentador, Git & Release | ~15–25 USD **estimado** (avisos de costo: ~6,5 USD a mitad, >10,9 USD en la PoC); tokens por fase no medidos | ~3–4 h, del descubrimiento de las TVs en la red al PR | 0 registrados |

**Especialistas:** Rendimiento se declaró activo pero no se convocó por separado (quedó como observación: la primera carga de banners es lenta). DBA, BI, Contenedores, Cloud, Infra/Redes e IA de producto se descartaron con su razón.

**Decisiones mayores:** 2 ADR (stack y forma de capturar el botón Home), con la regla de 3 opciones.

## 3. Calidad

| Fuente | Hallazgos | Estado |
|---|---|---|
| Code Reviewer | 6: 1 medio (estadísticas de uso leídas en el hilo principal), 3 bajos (tokens copiados a mano, "Quitar animaciones", punto de notificaciones), 2 conformes | Medio corregido; 3 bajos pendientes |
| QA en la TV | 5 defectos visuales: escala al doble, reloj con "p. m.", "Configuración" duplicada en Apps, foco inicial ausente, fila cortada antes del borde | Todos corregidos antes de entregar |
| Prueba de concepto | Se escapaba la última de varias pulsaciones rápidas de Home; destello de la interfaz original; recomendaciones de otras apps no legibles por restricción de Android | Los dos primeros corregidos; el tercero reemplazado por la fila de Recientes |
| Documentación | Script de restauración usaba una variable reservada | Corregido antes de entregar |
| **Defectos escapados** | 0 reportados | ⚠️ Ventana insuficiente: solo se probó el mismo día y en una sola TV |

## 4. Comparación (estimada, no medida)

| Escenario | Tiempo | Qué se obtiene |
|---|---|---|
| **Con vedev** | ~3–4 h | App + PoC + 2 ADR + respaldo/restauración probados + docs + PR |
| Claude Code sin vedev | ~1–2 h | MVP funcional, probablemente sin respaldo/restauración probada, sin PoC, decisiones sobre la marcha |
| Persona sola sin IA (con experiencia en Android TV) | ~3–5 días | Similar alcance, incluyendo investigación de permisos y del botón Home |

Lectura: vedev cuesta ~2× el tiempo de un MVP sin proceso, pero entrega lo que ese MVP no trae (decisiones registradas, pruebas desde las historias, rescate probado). Frente a hacerlo sin IA, es un orden de magnitud más rápido.

## 5. Lo que funcionó y lo que no

**Funcionó**
- **Viabilidad con prueba de concepto antes de construir.** Detectó que las recomendaciones de otras apps eran imposibles de leer y que deshabilitar la interfaz original rompía perfiles y notificaciones.
- **Regla de 3 opciones.** Dejó las dos decisiones mayores claras y registradas.
- **QA desde las historias.** Encontró 5 defectos visuales reales antes de entregar.
- **Respaldo y restauración probados antes de tocar el dispositivo.**

**No funcionó o sobró**
- **PRD con 13 historias** para un launcher personal de una sola TV: con historias mínimas bastaba.
- **Documento de opciones, TDD completo y STRIDE formal** en una app sin red ni cuentas.
- **Reportes por fase** que repetían lo que ya estaba en los documentos.
- **Fricción del entorno** (ajena a vedev): hooks de seguridad del entorno que pedían confirmación en cada archivo y comando, y fallos de compilación por una tilde en el nombre del usuario de Windows. Sumó tiempo y costo.
- **Puertas incompletas:** sin capa de cumplimiento, sin puerta de Release formal; la instalación en la TV hizo de deploy.

## 6. Cambios propuestos

| # | Cambio | ¿Núcleo o pack? | Prioridad |
|---|---|---|---|
| 1 | **Señales de proyecto pequeño más claras:** uso personal o un solo dispositivo, sin red ni cuentas → recomendar historias mínimas, sin PRD, TDD ligero y checklist en lugar de STRIDE | Núcleo (`ceremony-options.md`) | Alta |
| 2 | **Prueba de concepto como paso formal opcional de la viabilidad** cuando hay supuestos técnicos de plataforma sin verificar | Núcleo (`feasibility-analyst.md`, pipeline) | Alta |
| 3 | **Reporte corto por defecto** en sesiones de una persona (3 líneas + enlaces); el completo bajo pedido | Núcleo (`SKILL.md` §8, `ceremony-options.md`) | Media |
| 4 | **Especialista declarado activo = convocado**, o se reclasifica como observación registrada | Núcleo (`coverage-matrix.md`) | Media |
| 5 | **Interfaces para TV (10 pies):** breakpoint `tv`, foco visible y foco inicial obligatorio, navegación con control remoto, márgenes seguros de pantalla, escala por densidad | Núcleo (`design-tokens.md`, `ux-ui-designer.md`, `dev-frontend.md`) | Media |
| 6 | **Deploy a dispositivo** (instalar en TV, móvil o equipo) reconocido como tipo de despliegue, con su versión reducida de la puerta de Release | Núcleo (`devops-deploy.md`, `quality-gates.md`) | Media |
| 7 | **Nota de entorno en los adaptadores:** rutas con tildes o espacios en Windows y hooks del entorno que piden confirmación | Núcleo (`adapters/`) | Baja |
| 8 | Medir tokens por fase con algo más preciso que los avisos de costo | Núcleo (`token-economy.md`) | Baja |

**Estado de los cambios (2026-10-26):** aplicados al núcleo los cambios 1 a 6 y el 8. El 7 (nota de entorno en los adaptadores) se dejó fuera por decisión del responsable.

## 7. Criterios de éxito (protocolo `protocols/pilot.md`)

| Criterio | Meta | Resultado | ✔/✘ |
|---|---|---|---|
| PARCHE con ≤ 3 agentes | ≤ 3 | No aplica (tarea PROYECTO) | — |
| Defectos escapados ≤ línea base | ≤ línea base | 0, con ventana insuficiente | ⏳ |
| Tiempo de ciclo ≤ +20% vs. línea base | ≤ +20% | ~+100% vs. MVP sin proceso; mucho menor vs. sin IA | ✘ (con alcance mayor) |
| Satisfacción del equipo ≥ 3,5/5 | ≥ 3,5 | No medida | — |
| Puertas aplicables con evidencia | 100% | Sin puerta de Release formal ni capa de cumplimiento | ✘ |

## 8. Siguientes pasos del piloto

1. Ejecutar y medir un **PARCHE** (p. ej. uno de los 3 hallazgos bajos pendientes) y una **FEATURE**.
2. Mantener la observación de defectos escapados 2–4 semanas y, si es posible, probar en una segunda TV.
3. Registrar satisfacción (1–5) al cerrar las tres tareas.
4. Aplicar los cambios de la sección 6 antes de las siguientes tareas, para medirlos.
