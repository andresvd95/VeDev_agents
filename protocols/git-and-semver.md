# Git y versionado semántico — vedev_agents

Dueño: `git-release-manager`. Aplica desde el **primer commit**.

## Flujo de ramas

| Rama | Propósito | Despliega a |
|---|---|---|
| `main` | Producción. Siempre desplegable | URL final de producción |
| `develop` (o el nombre que defina el pack) | Integración y pruebas | URL de pruebas/staging |
| `feat/<id>-<descripcion>` | Funcionalidad nueva, corta (días, no semanas) | — |
| `fix/<id>-<descripcion>` | Corrección | — |
| `hotfix/<id>-<descripcion>` | Corrección urgente de producción: sale de `main`, vuelve a `main` **y** a `develop` | — |

- Las ramas de trabajo salen de `develop` y vuelven a `develop` por Pull Request.
- `develop` → `main` solo por PR de release, con suite completa verde en pruebas.

## Pull Requests

Para fusionar se requiere:
1. Revisión **APROBADA** del Code Reviewer (y de un humano si el pack lo exige).
2. QA en verde (suite rápida en cada PR; suite completa en el PR de release).
3. Checks de CI en verde (incluye escaneo de secretos).
4. Descripción con: historia relacionada, qué cambia, cómo se probó, impacto en versionado.

Se recomienda hacer cumplir esto con **protección de ramas** en la plataforma (GitHub/GitLab/otra): el proceso se respeta aunque alguien no use los agentes.

## Commits convencionales

`<tipo>(<ámbito opcional>): <descripción en imperativo>`

Tipos: `feat`, `fix`, `docs`, `refactor`, `test`, `chore`, `perf`, `ci`, `build`. Un cambio incompatible lleva `!` tras el tipo o `BREAKING CHANGE:` en el cuerpo.

Ejemplo: `fix(auth): normaliza el correo a minúsculas antes de buscar el usuario`

## Semáforo de versionado (SemVer)

Tras cada cambio que llega a `main`, el Git & Release Manager dictamina la versión **con justificación**:

| Semáforo | Tipo | Cuándo | Ejemplo |
|---|---|---|---|
| 🟢 | **PATCH** `x.y.Z` | Corrección compatible; nadie que use el sistema tiene que cambiar nada | `1.0.0 → 1.0.1` |
| 🟡 | **MINOR** `x.Y.0` | Funcionalidad nueva compatible hacia atrás | `1.0.1 → 1.1.0` |
| 🔴 | **MAJOR** `X.0.0` | Ruptura incompatible: API, contrato, esquema o comportamiento del que otros dependen | `1.1.0 → 2.0.0` |

Ejemplos de decisión:
- Se corrige un cálculo erróneo sin cambiar la interfaz → PATCH.
- Se agrega un endpoint nuevo opcional → MINOR.
- Se renombra un campo de la respuesta de la API → MAJOR (requiere confirmación del usuario en todos los modos).
- Antes de `1.0.0` (desarrollo inicial) los cambios incompatibles suben MINOR; se declara en el README.

Cada release lleva **tag** (`vX.Y.Z`) y notas (`templates/release-notes.md`).

## Prohibido

- Commits directos a `main`.
- Force-push a ramas compartidas (`main`, `develop`).
- Secretos en el historial. Si ocurre: rotar el secreto **de inmediato** (borrar el commit no basta), luego limpiar el historial y registrar el incidente.
