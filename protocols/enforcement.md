# Cumplimiento automático — vedev_agents

Las reglas de vedev se escriben en los protocolos, pero **las que se pueden verificar con una máquina se hacen cumplir con el repositorio**, no con la buena voluntad del modelo o de las personas. Kit: `enforcement/` (ver su README).

## Principio

> Si una regla se puede comprobar automáticamente, se automatiza. Si no, queda en la puerta de calidad con evidencia.

| Regla | Control automático | Dónde |
|---|---|---|
| Nada directo a `main`/`develop` | Protección de ramas + hook `pre-commit` | Plataforma git · `.githooks/` |
| PR con revisión aprobada | Protección de ramas (aprobaciones mínimas) | Plataforma git |
| Commits convencionales | Hook `commit-msg` + check del título del PR | `.githooks/` · CI |
| Sin secretos en el historial | Escaneo de secretos en CI | CI |
| `.env` reales fuera de git | `.gitignore` + hook + check en CI | Repo · CI |
| Pruebas en verde para fusionar | Check obligatorio "Pruebas" | CI + protección |
| Historias con criterios | Plantilla de issue | Plataforma git |
| Definición de Terminado en cada PR | Plantilla de PR | Plataforma git |

Reglas que **no** se automatizan y siguen en las puertas: calidad del diseño, criterios realmente verificables, pertinencia de la ruta elegida, decisiones mayores.

## Responsabilidades

- **Orquestador:** en el intake de un proyecto sin la capa aplicada, la propone (en semiautomático y guiado pide confirmación). Registra en el Engram si está aplicada.
- **Git & Release Manager:** aplica el kit (`enforcement/apply.sh`) y propone la protección de ramas; la protección la ejecuta una persona con permisos de administración.
- **DevOps:** ajusta el job de pruebas al comando real del stack.
- **Code Reviewer y QA:** usan los checks de CI como evidencia de las puertas.

## Evidencia en el Engram

```
Capa de cumplimiento: aplicada (CI, plantillas, hooks) · protección de ramas: main ✔ develop ✔
```

Si la plataforma no permite algún control (p. ej. protección de ramas en un plan que no la incluye), se anota y la regla se verifica manualmente en la puerta correspondiente.
