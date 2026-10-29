# [Nombre del proyecto] — Lectura rápida

> **Para quién:** cualquier persona que necesite entender el proyecto completo sin leer toda la documentación.
> **Regla Pareto:** esto es el 20 % que da el 100 % del contexto. No es la documentación (README, API, runbook): es el mapa para entenderla. **Lectura: 5–10 minutos (800–2000 palabras).**
> **Dónde vive:** `docs/LECTURA-RAPIDA.md` · **Mantiene:** Documentador · **Sin secretos ni datos personales.**

**Versión del proyecto:** [x.y.z] · **Última actualización:** [AAAA-MM-DD] · **Verificado contra el código en:** [commit corto o tag]

## 1. Qué es, en 3 líneas
[Qué hace, para quién y qué problema resuelve. Sin jerga: que lo entienda alguien que no programa.]

## 2. Por qué existe y qué valor da
[El problema de negocio, quién lo sufre y cómo se mide que funciona. Una cosa que NO hace a propósito.]

## 3. El mapa completo en un dibujo
```mermaid
flowchart LR
  %% Actores, sistemas, datos y el flujo principal. Máximo ~10 nodos.
```

## 4. Cómo funciona (el flujo principal)
[Los 4–7 pasos que describen el caso de uso más importante, de punta a punta, en lenguaje natural.]

## 5. Las piezas que importan
| Pieza | Qué hace | Dónde está |
|---|---|---|
| [módulo/servicio/pantalla] | [una línea] | [ruta o enlace] |

*(Solo las piezas que explican el 80 % del comportamiento; el resto, en la documentación.)*

## 6. Reglas y datos que no son obvios
- [Regla de negocio, cálculo, estado o dato que sorprende a quien llega nuevo y rompe cosas si se ignora]

## 7. Decisiones que dieron forma al proyecto
| Decisión | Por qué | Costo o compromiso aceptado |
|---|---|---|
| [stack, arquitectura, alcance recortado] | [razón] | [qué se sacrificó] |

## 8. Cómo se trabaja con él
[Cómo correrlo, probarlo y desplegarlo en 3–5 líneas, con enlace al README. Ramas y ambientes. Quién decide qué.]

## 9. Estado actual
- **Fase / versión:** [ … ]
- **Funciona hoy:** [ … ]
- **En curso o pendiente:** [ … ]
- **Riesgos y trampas conocidas:** [ … ]

## 10. Dónde profundizar
[Enlaces: README, API, TDD, ADR, runbook, `project-state.md`, historias. Una línea por enlace sobre cuándo leerlo.]

---
### Reglas para quien lo actualiza (Documentador)
1. Describe lo que el sistema **hace hoy**, no lo planeado. Lo planeado va en "Estado actual".
2. Si una frase no se puede verificar en el código o en un artefacto, no entra.
3. Respeta el tope: si pasa de 2000 palabras, recorta; si hace falta más, va a la documentación y aquí queda un enlace.
4. Actualiza el encabezado (versión, fecha, commit) en cada edición, aunque el cambio sea pequeño.
5. Lenguaje claro para una persona no técnica; los términos técnicos van acompañados de su significado la primera vez.
6. Nunca incluyas secretos, URLs internas sensibles ni datos personales.
