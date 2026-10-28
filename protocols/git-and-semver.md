# Git y versionado semántico — vedev_agents

Dueño: `git-release-manager`. Aplica desde el **primer commit**.

## Sincronizar con el origin

Al iniciar trabajo en un proyecto (arranque de sesión), el Orquestador revisa si el remoto tiene cambios que el local no tiene. Así se evita construir sobre una base vieja y generar conflictos evitables.

1. **Solo si aplica:** el directorio es un repositorio git con un remoto configurado. Si no lo es (proyecto nuevo sin repo) o no hay red, se anota en una línea y se sigue; no se bloquea el arranque.
2. `git fetch` (lectura; no toca el árbol de trabajo).
3. Compara la rama actual con su rama remota: `git status -sb` o `git rev-list --left-right --count HEAD...@{u}`.
4. Según el resultado:

| Situación | Acción |
|---|---|
| Al día | No hagas nada ni lo menciones |
| Atrasado, árbol limpio, avance rápido posible | `git pull --ff-only`; informa en una línea cuántos commits trajo |
| Atrasado con cambios locales sin commitear | No traigas nada; avisa y pregunta cómo proceder (commit, stash o dejarlo) |
| Divergente (commits locales y remotos distintos) | No hagas merge ni rebase por tu cuenta; muestra la situación y ofrece 2–3 opciones |
| Adelantado (commits locales sin subir) | Avísalo en una línea; no subas nada sin que el usuario lo pida |

5. Si el repositorio tiene submódulos, `git submodule update --init` tras traer cambios, salvo que el pack fije una versión distinta.
6. Si la rama de trabajo salió de `develop` y `develop` avanzó en el remoto, avísalo; no actualices la rama de trabajo sin confirmación.

**Límites:** nunca `git pull` con merge automático, `git reset --hard`, `git clean` ni `--force` para sincronizar. Nunca se hace push como parte de esta revisión.

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
