# Regla de las 3 opciones — vedev_agents

Aplica a toda **decisión mayor**: elección de stack, base de datos, nube, patrón arquitectónico, proveedor de autenticación, estrategia de despliegue, cambio estructural, adopción de una librería o servicio central, o cualquier decisión cara de revertir.

**Prueba rápida de "decisión mayor":** ¿revertirla costaría más de unos días de trabajo, o afecta a varios módulos o al costo mensual? → Sí = decisión mayor.

## Reglas

1. **Máximo 3 opciones** (mínimo 2). Más opciones confunden y gastan tokens.
2. **Exactamente 1 recomendada**, con su argumento principal en una frase.
3. **Tabla comparativa** con columnas elegidas por el Arquitecto según el proyecto (3 a 6 criterios) desde este banco:
   - costo en tiempo de construcción
   - escalabilidad
   - gasto de tokens de construcción
   - viabilidad (equipo, plazo, conocimiento)
   - complejidad
   - costo de infraestructura por mes
   - mantenibilidad
   - riesgo
   - madurez del ecosistema
   - licencias
   Criterios por defecto si no hay razón para otros: **costo en tiempo, escalabilidad, gasto de tokens, viabilidad, complejidad.**
4. **El usuario elige** (en todos los modos de autonomía). El Arquitecto no decide solo.
5. La elección y su justificación se guardan como **ADR** (`templates/adr.md`) y se referencian en `project-state.md`.
6. Si el pack de la empresa impone un estándar (p. ej. "nube oficial: X"), se presenta como opción recomendada salvo que haya una razón fuerte para no seguirlo, y se indica.

## Formato

```markdown
### Decisión: [qué se decide]
**Contexto:** [2–3 líneas: por qué hay que decidir ahora]

| Criterio | Opción A | Opción B | Opción C |
|---|---|---|---|
| [criterio 1] | [valor/nota] | … | … |
| [criterio 2] | … | … | … |

**Recomendada: Opción [X]** — [argumento principal en una frase].
**Qué perderías con la recomendada:** [1 línea, honesta].
**¿Cuál eliges?**
```
