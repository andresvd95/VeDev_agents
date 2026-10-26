# Interoperabilidad con otros paquetes de skills y agentes — vedev_agents

vedev_agents es una **capa de proceso**: decide qué se hace, en qué orden, con qué artefactos y con qué puertas. Muchos entornos ya tienen instalados otros paquetes de skills, agentes o hooks con gran profundidad técnica. vedev **no compite con ellos: los aprovecha** cuando están disponibles.

## Principio

> vedev define el **qué** y las **puertas**; una herramienta externa puede ejecutar el **cómo** de un paso.

## Reglas

1. **Detectar, no exigir.** El Orquestador revisa qué skills o agentes externos hay en el entorno. Ninguno es obligatorio; sin ellos, cada agente de vedev trabaja solo.
2. **El artefacto sigue siendo de vedev.** Si un agente delega su paso, la salida se entrega en la plantilla de vedev (p. ej. el veredicto del Code Reviewer con hallazgos `archivo:línea`).
3. **Las puertas y reglas duras de vedev prevalecen.** Si una herramienta externa sugiere algo que viola una regla dura (commit directo a `main`, deploy sin permiso), gana vedev.
4. **Sin doble ceremonia.** No se ejecutan dos procesos de planificación completos para lo mismo: si el usuario prefiere el flujo de planificación de otro paquete, ese flujo reemplaza la fase equivalente y su salida se mapea a los artefactos de vedev.
5. **Economía de tokens.** Se carga solo la skill o el agente externo necesario para el paso, nunca el paquete entero.
6. **Hooks externos se respetan.** Si el entorno tiene hooks que piden confirmaciones o datos antes de actuar, se cumplen; no se buscan atajos para evitarlos.
7. **Se registra.** El Engram anota qué herramientas externas se usaron y para qué paso.

## Mapa de delegación típico

Ejemplos con paquetes de código abierto populares (opcionales; los nombres son ilustrativos y pueden cambiar):

| Rol de vedev | Capacidad externa que puede ejecutar el paso | Ejemplo |
|---|---|---|
| `code-reviewer` | Revisores especializados por lenguaje o framework | Revisores por lenguaje de *Everything Claude Code* (ECC) |
| `cybersecurity-engineer` | Revisión de seguridad automatizada | Revisor de seguridad de ECC; análisis estático del pack |
| `qa-engineer` | Flujo TDD estricto; pruebas E2E | Skill de TDD de *Superpowers*; agentes E2E de ECC |
| `dev-*` | Depuración sistemática; resolución de errores de build | Skill de depuración sistemática de *Superpowers*; resolvedores de build de ECC |
| `requirements-analyst` | Exploración de la idea antes de escribir historias | Skill de brainstorming de *Superpowers* |
| `architect` | Plantillas o flujos de especificación | Especificaciones generadas con kits de desarrollo guiado por spec |
| `documenter` | Generación de mapas de código y docs | Skills de documentación de ECC |

## Cómo se declara al usuario

En el reporte de intake o de fase:

```
Herramientas externas detectadas: [paquete — capacidades]
Uso en esta fase: code-reviewer delega en [revisor de TypeScript]; salida en formato vedev.
```
