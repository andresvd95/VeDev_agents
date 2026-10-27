# Proceso de desarrollo del equipo — versión para personas

> Este documento explica **cómo trabajamos**, con o sin IA. Los agentes de vedev_agents siguen exactamente este proceso; si alguien trabaja sin ellos, sigue las mismas reglas. Léelo en 10 minutos.

## 1. Todo empieza clasificando el tamaño

| Tamaño | Ejemplos | Qué se necesita |
|---|---|---|
| **PARCHE** | Corregir un bug, ajustar un texto, cambio menor | Historia mínima (problema + criterio) · código · prueba del caso · revisión |
| **FEATURE** | Nueva funcionalidad acotada | Historias con criterios · diseño de la parte afectada · pantallas si hay UI · pruebas · revisión · checklist de seguridad · docs |
| **PROYECTO** | Sistema nuevo, gran escalamiento, refactor estructural | Todo: viabilidad, PRD, diseño técnico, decisiones registradas, diseño UX, construcción, pruebas, seguridad, docs, despliegue |

**Regla de oro:** un bugfix nunca paga el peaje de un proyecto. Ante la duda, elige el menor y súbelo si crece.

**Proyectos pequeños:** en FEATURE y PROYECTO se pregunta (no se decide solo) si se reducen u omiten entregables negociables: número de historias, PRD, ADR, ambiente de pruebas, documentación extra, entre otros. Lo no negociable se mantiene siempre: criterios de aceptación, revisión, pruebas, sin secretos, nada directo a `main`, deploy con permiso. Lista completa: `protocols/ceremony-options.md`.

## 2. Definición de Listo (antes de programar)

Una historia está lista para construirse si:
- [ ] Tiene rol, acción y beneficio.
- [ ] Tiene criterios **Dado / Cuando / Entonces** que se pueden probar sin interpretar.
- [ ] Si tiene interfaz: tiene su especificación de pantalla con estados (vacío, carga, error, éxito).
- [ ] Si implica una decisión mayor: la decisión está registrada (ADR).

## 3. Flujo de ramas

```
feat/123-descripcion ──PR──> develop ──(pruebas)──> URL de pruebas
                                │
                         PR de release
                                ↓
                              main ──> URL de producción
```

- Ramas cortas desde `develop`. Nada directo a `main`. Nada de force-push a ramas compartidas.
- Urgencia en producción: `hotfix/` desde `main`, vuelve a `main` **y** a `develop`.

## 4. Commits

`tipo(ámbito): descripción en imperativo` — tipos: `feat`, `fix`, `docs`, `refactor`, `test`, `chore`, `perf`, `ci`, `build`.
Ejemplo: `fix(auth): normaliza el correo antes de buscar el usuario`

## 5. Pull Request

Para fusionar:
- [ ] Revisión aprobada (alguien distinto a quien escribió el código).
- [ ] Pruebas en verde; las pruebas de aceptación salen de los criterios de la historia.
- [ ] CI en verde (incluye escaneo de secretos).
- [ ] Descripción: historia, qué cambia, cómo se probó, impacto de versión.

## 6. Definición de Terminado

- [ ] Criterios de aceptación cumplidos y probados.
- [ ] Revisión aprobada.
- [ ] Sin secretos ni valores "mágicos" (colores, medidas sueltas) en el código.
- [ ] Documentación actualizada si cambió el comportamiento.
- [ ] Checklist de seguridad (FEATURE y PROYECTO) o mini-checklist (PARCHE que toque datos o permisos).

## 7. Versiones (SemVer)

- 🟢 **PATCH** (`1.0.1`): corrección compatible.
- 🟡 **MINOR** (`1.1.0`): funcionalidad nueva compatible.
- 🔴 **MAJOR** (`2.0.0`): algo deja de ser compatible. Siempre se confirma con el líder.
Cada versión lleva tag y notas de versión.

## 8. Variables de entorno y secretos

- `.env.example` en el repo, sin valores reales. Los `.env` reales nunca van a git.
- Producción vive solo en el gestor de secretos de la empresa.
- Si la app no arranca por una variable faltante, el error dice cuál.

## 9. Despliegue

- `develop` despliega a pruebas automáticamente.
- Producción: solo con autorización explícita, con backup verificado y plan de rollback.

## 10. Decisiones grandes

Se presentan con un máximo de 3 opciones, una recomendada y una tabla comparativa. Decide el responsable; la decisión queda en un ADR.

## 11. Qué hace cumplir esto automáticamente (configurar en el repositorio)

- Protección de `main` y `develop`: solo por PR, con revisión y CI obligatorios.
- CI: pruebas, linter, validación del formato de commits y escaneo de secretos.
- Plantilla de PR con el checklist de la sección 5.
- Responsables de código por área (archivo de propietarios de código) si el equipo es grande.
