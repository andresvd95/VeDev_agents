# Economía de tokens — vedev_agents

**Es ley, no sugerencia.** Cada token gastado debe producir un artefacto que alguien consume.

## 1. Pisos de modelo

| Piso | Para qué | Agentes típicos |
|---|---|---|
| **Económico** | Exploración, búsqueda, tareas mecánicas y repetitivas, resúmenes | Repo Scout, Git & Release (commits, notas), Centinela (chequeos rutinarios) |
| **Estándar** | Desarrollo, pruebas, documentación, análisis de requisitos | Devs, QA, Documentador, Requirements, UX/UI, DevOps, la mayoría de especialistas |
| **Fuerte** | Arquitectura, decisiones mayores, revisión crítica, seguridad | Arquitecto, Code Reviewer, Ciberseguridad, Orquestador en decisiones mayores |

El pack o el usuario mapea cada piso a modelos concretos del entorno. Si el entorno solo tiene un modelo, los pisos se ignoran pero el resto de reglas sigue.

### Quién decide el modelo (precedencia)

1. **El usuario** (una instrucción expresa en la sesión, o `/model`) manda sobre todo lo demás.
2. **Esta skill (y el pack):** el piso de cada agente es la decisión del equipo. El Orquestador **fija el modelo en cada lanzamiento de agente**: pasa el parámetro `model` si el entorno lo admite y, además, escribe como **primera línea del prompt del agente** `modelo-fijado: <haiku|sonnet|opus>` (el modelo concreto que el pack asigna a ese piso). Esa línea permite que un mod o enrutador del entorno reconozca que una skill ya decidió y no la reemplace.
3. **Un mod o enrutador del entorno** (por ejemplo, un router de modelo por costo) solo decide cuando la skill no dijo nada. Si el mod no entiende la línea `modelo-fijado`, la skill igualmente declara su elección, y el Orquestador verifica en el reporte el modelo que realmente corrió.
4. **Presión de uso** (límites de la suscripción): avisa, pero **no baja** un modelo fijado por la skill. Si el uso es alto, el Orquestador propone al usuario bajar el piso, reducir alcance o pausar, en lugar de degradar en silencio.

Si el entorno corre por suscripción (no por API), los modelos disponibles y los límites dependen del plan; el pack debe mapear los pisos solo a modelos que el plan incluya.

## 2. Comunicación por artefactos

- Los agentes se comunican **solo** por artefactos con plantilla (`templates/`): entradas acotadas, salidas acotadas.
- **Nunca** se pasa el historial del chat a un agente.
- El Engram se entrega **por secciones**, no completo.
- Los artefactos se **enlazan**, no se copian (el TDD referencia el ADR; no lo repite).

## 3. Reutilizar antes que escribir

Primero el Repo Scout busca si ya existe algo (librería, scaffold, servicio); después se escribe código. Aplica a cualquier pieza no trivial.

## 4. Paralelismo

Los agentes trabajan en paralelo cuando sus piezas no se pisan (archivos o módulos distintos y contratos definidos). Si dos piezas comparten archivos, van en secuencia.

## 5. Topes duros

| Bucle | Tope |
|---|---|
| Dev ↔ QA | **3 rondas** |
| Dev ↔ Code Reviewer | 3 rondas |
| Cualquier otro bucle de corrección | 3 (criticidad baja/media) a 5 (criticidad alta), según el intake |

**Al llegar al tope:** detenerse y escalar al usuario con (1) qué se intentó, (2) por qué falla, (3) 2–3 opciones con su costo. **Jamás seguir quemando tokens en silencio.**

## 6. Activación mínima

Ningún agente entra a una fase si su artefacto de salida no se consume en esa fase. Ningún especialista se activa "por si acaso" (ver `protocols/coverage-matrix.md`). La ruta del intake (PARCHE/FEATURE/PROYECTO) fija el máximo de agentes posibles.

## 7. Presupuesto y medición

- El presupuesto de tokens se fija en el intake (o "sin límite explícito").
- El Centinela registra el consumo por fase en `project-state.md`:
  - **Reportado** si el entorno expone el uso de tokens.
  - **Estimado** si no (por tamaño de entradas y salidas), y se marca como estimación.
- **Medición por diferencia:** si el entorno muestra un contador acumulado de la sesión (tokens o costo), el Centinela anota el valor **al abrir y al cerrar cada fase** y registra la diferencia. Es más preciso que estimar y no requiere herramientas extra.
- Fuentes en orden de preferencia: (1) uso reportado por la API o el entorno por fase, (2) diferencia del contador acumulado, (3) estimación. El registro indica cuál se usó.
- Al cerrar el trabajo, el consumo total y por fase va a `project-state.md` y, en un piloto, al informe (`templates/pilot-report.md`).
- Alertas al **50%, 80% y 100%** del presupuesto. Al 100% el Orquestador se detiene y pide decisión: ampliar presupuesto, reducir alcance o pausar.

## 8. Señales de desperdicio (el Orquestador las corrige)

- Un agente relee archivos que no son de su fase.
- Un artefacto repite contenido de otro en vez de enlazarlo.
- Una tarea PARCHE con más de 3 agentes.
- Reportes largos sin decisiones ni artefactos nuevos.
