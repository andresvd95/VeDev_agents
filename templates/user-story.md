# HU-[NNN] — [Título]

**Prioridad:** [Must | Should | Could] · **Ruta:** [PARCHE | FEATURE | PROYECTO] · **Ticket:** [ID en el gestor, si aplica]

## Historia
**Como** [rol] **quiero** [acción] **para** [beneficio].

## Criterios de aceptación
1. **Dado** [contexto] **cuando** [acción] **entonces** [resultado verificable].
2. **Dado** [ … ] **cuando** [ … ] **entonces** [ … ].

## Casos borde
- [caso — resultado esperado]

## Fuera de alcance
- [ … ]

## Notas técnicas (opcional)
- [ADR, contratos o pantallas relacionadas]

## Definición de terminado
- [ ] Criterios de aceptación cumplidos y probados por QA (tests derivados de esta historia)
- [ ] Revisión aprobada
- [ ] Documentación actualizada si cambió comportamiento
- [ ] Sin secretos ni valores mágicos en el diff

---
### Versión mínima (ruta exprés / PARCHE)
**Problema:** [qué falla] · **Criterio:** Dado [ … ] cuando [ … ] entonces [ … ] · **Prueba:** [cómo se reproduce]

*Ejemplo mínimo:* Problema: el login falla con correos en mayúsculas. Criterio: Dado un usuario registrado como "ana@x.com", cuando inicia sesión con "ANA@x.com", entonces accede correctamente.
