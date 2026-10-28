<div align="center">

# 🤖 vedev_agents

**Un equipo de ingeniería de software con IA, listo para usar.**

An AI software-engineering team in a box: 23 specialized agents (architect, UX/UI, devs, QA, cybersecurity, DevOps, DBA, BI…) that take any project from idea to production. Spec-driven, token-efficient, engine-agnostic — Claude Code, Cursor, Codex, OpenCode & more.

![Versión](https://img.shields.io/badge/versión-v1.1.0-blue)
![Estado](https://img.shields.io/badge/estado-en%20uso%20real-brightgreen)
![Licencia](https://img.shields.io/badge/licencia-MIT-green)
![Agentes](https://img.shields.io/badge/agentes-23-purple)
![Formato](https://img.shields.io/badge/formato-Markdown%20puro-lightgrey)

[Inicio rápido](#-inicio-rápido) · [Cómo funciona](#-cómo-funciona) · [El equipo](#-el-equipo-cómo-funcionan-los-agentes) · [Instalación](#-instalación) · [Cumplimiento](#️-capa-de-cumplimiento) · [Packs de empresa](#-packs-de-empresa) · [Hoja de ruta](#️-hoja-de-ruta)

</div>

---

## ¿Por qué vedev_agents?

Los asistentes de IA programan rápido, pero sin proceso cada persona del equipo trabaja distinto: unos documentan, otros no; unos prueban, otros confían; las decisiones se pierden en el chat. Y los frameworks de agentes que sí imponen proceso suelen cobrar **la misma ceremonia por un bugfix que por un proyecto**, quemando tokens.

vedev_agents resuelve las dos cosas:

- 🧭 **Un proceso estándar de industria**, el mismo para todo el equipo: historias con criterios verificables, decisiones registradas, revisión independiente, pruebas desde la especificación, seguridad, versionado y documentación.
- ⚡ **Ceremonia proporcional al tamaño**: un parche usa 3 agentes, no 23.
- 🔌 **Portable**: Markdown puro. Funciona en Claude Code, Cursor, Codex, OpenCode, Warp y más.
- 🏢 **Personalizable sin forks**: lo propio de tu empresa vive en un *pack* aparte; el núcleo no se toca.
- 🛡️ **Reglas que se cumplen solas**: CI, protección de ramas, plantillas y hooks hacen cumplir lo verificable, use o no la gente los agentes.

---

## 🚀 Inicio rápido

**1. Instala** (ejemplo con Claude Code, en la raíz de tu proyecto):

```bash
git clone https://github.com/andresvd95/VeDev_agents.git .claude/skills/vedev_agents
```

> ¿Usas otro entorno? Mira la [tabla de instalación](#-instalación).

**2. Pide lo que necesitas**, en tu idioma:

```
Quiero construir una API de reservas para clínicas. Modo semiautomático.
```

**3. El Orquestador hace el intake**, clasifica la tarea, te dice qué agentes activa (y cuáles no, y por qué) y arranca. Al cerrar cada fase recibes un reporte como este:

```
## Arquitectura — requiere decisión
Ruta: PROYECTO · Modo: 🤝 Semiautomático
Qué se hizo: TDD con diagramas C4 y modelo de datos. Falta elegir la base de datos.
Artefactos: docs/tdd.md, docs/adr/ADR-001-borrador.md
Puerta de calidad: pendiente — decisión mayor sin elegir
Decisiones pendientes: base de datos (3 opciones, recomendada: PostgreSQL)
Consumo de la fase: ~18K tokens (estimado) · 12% del presupuesto
Siguiente paso: elige una opción para continuar con Diseño UX/UI
```

*(Ejemplo ilustrativo del formato de reporte.)*

---

## 🧠 Cómo funciona

```mermaid
flowchart LR
    A[Solicitud] --> B[Orquestador<br/>carga memoria + intake]
    B --> C{¿Tamaño?}
    C -->|PARCHE| D[Ruta exprés<br/>Dev → Revisión → QA]
    C -->|FEATURE| E[Ruta estándar<br/>solo las fases tocadas]
    C -->|PROYECTO| F[Ruta completa<br/>pipeline + especialistas]
    D --> G[Puertas de calidad]
    E --> G
    F --> G
    G --> H[Release · Deploy con permiso · Operación]
```

### Tres rutas según el tamaño

| Ruta | Cuándo | Qué se produce | Agentes típicos |
|---|---|---|---|
| ⚡ **PARCHE** | Fix puntual o cambio menor | Historia mínima, código, prueba del caso | Dev + Reviewer + QA |
| 🧩 **FEATURE** | Funcionalidad nueva acotada | Historias, diseño de la parte afectada, pantallas, pruebas, docs | Solo los de las fases que toca |
| 🏗️ **PROYECTO** | Nuevo, escalamiento o refactor mayor | Viabilidad, PRD, TDD, ADR, tokens de diseño, código, pruebas, seguridad, docs, deploy | Núcleo + especialistas que indique la matriz |

> **Regla de oro:** un bugfix nunca paga el peaje de un proyecto.

### Ajustes para proyectos pequeños

En FEATURE y PROYECTO, el Orquestador **pregunta** (nunca decide solo) si quieres reducir u omitir entregables negociables, con una recomendación por punto. Por ejemplo: 2–3 historias en vez del set completo, sin PRD, decisiones en una lista en vez de ADR, o sin rama `develop`. Lo no negociable se mantiene siempre: criterios de aceptación, revisión independiente, pruebas, sin secretos, nada directo a `main`, deploy con permiso. 👉 [protocols/ceremony-options.md](protocols/ceremony-options.md)

### El pipeline completo

`Viabilidad → Requerimientos → Arquitectura → Diseño UX/UI → Construcción → Revisión → QA → Seguridad → Documentación → Deploy → Operación`

Los proyectos existentes **entran en la fase que corresponda**: un mantenimiento entra directo en Construcción; una auditoría solo produce un informe.

### Principios que no se negocian

| Principio | En la práctica |
|---|---|
| 💬 **Artefactos, no chat** | Los agentes se pasan documentos con plantilla, nunca el historial de la conversación |
| 🎯 **Activación mínima** | Ningún agente entra "por si acaso"; los especialistas solo si la matriz de cobertura lo justifica |
| 🔁 **Topes duros** | Máximo 3–5 iteraciones por bucle; al tope, se detiene y te da opciones |
| 🧪 **Pruebas desde la especificación** | QA escribe los tests desde los criterios de aceptación *antes* de ver el código, y el Reviewer lo verifica |
| ⚖️ **Tú decides lo importante** | Decisiones mayores con máximo 3 opciones y una recomendada; la elección queda en un ADR |
| 🔐 **Seguro por defecto** | Sin secretos de producción, sin commits directos a `main`, sin deploy a producción sin tu permiso |
| 🧠 **Memoria del proyecto** | `project-state.md` guarda dónde va todo; cada sesión arranca con un resumen de 5 líneas |

### Modos de autonomía

| Modo | Comportamiento |
|---|---|
| 🚀 **Piloto automático** | Avanza solo; se detiene en decisiones mayores, versión MAJOR, deploy a producción o bloqueos |
| 🤝 **Semiautomático** *(por defecto)* | Como el anterior, y además confirma deploys y cambios de alto impacto |
| 🧭 **Guiado** | Confirma contigo al cerrar cada fase |
| 🔍 **Auditoría** | Solo lectura: entrega un informe priorizado sin tocar nada |

---

## 👥 El equipo: cómo funcionan los agentes

vedev_agents imita un equipo de ingeniería real: un **Tech Lead** (el Orquestador) que recibe el trabajo y decide quién participa, un **núcleo** de 16 roles que cubren el ciclo de vida completo, y **7 especialistas** que solo entran cuando el proyecto los necesita.

### Las dos capas

```mermaid
flowchart TB
    U([👤 Tú]) <--> O
    O["🎯 ORQUESTADOR · Tech Lead<br/>intake · ruta · convoca · custodia la memoria"]
    O <--> M[("🧠 project-state.md<br/>memoria del proyecto")]

    subgraph P1["🔷 PISO 1 · NÚCLEO (16)"]
        PL["📐 PLANIFICAR<br/>Viabilidad · Requerimientos · Arquitecto<br/>Repo Scout · UX/UI"]
        CO["🛠️ CONSTRUIR<br/>Dev Backend · Dev Frontend · Dev Data<br/>Git & Release"]
        VE["🔍 VERIFICAR<br/>Code Reviewer · QA Engineer · Ciberseguridad"]
        EN["🚀 ENTREGAR Y OPERAR<br/>Documentador · DevOps / Deploy · Centinela"]
        PL --> CO --> VE --> EN
    end

    subgraph P2["🔶 PISO 2 · ESPECIALISTAS (7)"]
        subgraph ESP[" "]
            direction LR
            E1[DBA] ~~~ E2[BI] ~~~ E3[Contenedores] ~~~ E4[Cloud]
            E5[Infra / SRE] ~~~ E6[Rendimiento] ~~~ E7[IA de producto]
        end
    end

    O ==>|convoca según la ruta| PL
    EN -.->|"solo si la matriz<br/>lo justifica"| P2

    classDef orq fill:#1f6feb,stroke:#0b3d91,color:#fff
    classDef mem fill:#8957e5,stroke:#5a32a3,color:#fff
    classDef fase fill:#ddf4ff,stroke:#54aeff,color:#0a3069
    classDef esp fill:#fff1e5,stroke:#fb8f44,color:#762c00
    class O orq
    class M mem
    class PL,CO,VE,EN fase
    class E1,E2,E3,E4,E5,E6,E7 esp
```

| | 🔷 Piso 1 — Núcleo | 🔶 Piso 2 — Especialistas |
|---|---|---|
| **Qué cubre** | El ciclo de vida de cualquier proyecto: planificar, construir, verificar, entregar y operar | Disciplinas que solo algunos proyectos necesitan: datos, BI, contenedores, nube, infraestructura, rendimiento, IA |
| **Cuándo entra** | Según la ruta (PARCHE, FEATURE o PROYECTO) | Solo si la [matriz de cobertura](protocols/coverage-matrix.md) lo justifica |
| **Costo en reposo** | Solo los convocados consumen tokens | Cero: no se cargan |
| **Transparencia** | El Orquestador declara quién trabaja en cada fase | El Orquestador declara activos, descartados **y la razón** de cada descarte |

### Anatomía de un agente

Cada agente es un archivo Markdown con **8 secciones fijas**. Funciona como un contrato: qué recibe, qué entrega y cuándo terminó.

```mermaid
flowchart LR
    IN["📥 ENTRADAS<br/>solo artefactos:<br/>historia, TDD, ADR, diff…<br/>nunca el chat"] --> AG
    AG["🤖 AGENTE<br/>misión · responsabilidades<br/>herramientas permitidas<br/>reglas duras · piso de modelo"] --> OUT
    OUT["📤 SALIDAS<br/>artefactos con plantilla:<br/>PRD, ADR, PR, veredicto,<br/>reporte de pruebas…"] --> DONE
    DONE{"✅ ¿Criterio de<br/>terminado cumplido?"} -->|sí| ORQ["🎯 Orquestador<br/>registra y sigue"]
    DONE -->|no · máx. 3 rondas| AG
```

| Sección | Para qué sirve |
|---|---|
| **Misión** | Una frase: por qué existe el agente |
| **Responsabilidades** | Qué hace, en concreto |
| **Entradas** | Los únicos documentos que recibe. Así cada agente gasta solo el contexto de su fase |
| **Salidas** | Lo que entrega, siempre con una plantilla de `templates/` |
| **Herramientas permitidas y prohibidas** | Qué puede tocar. Ej.: el Repo Scout recomienda pero jamás instala |
| **Piso de modelo** | 🟢 económico, 🟡 estándar o 🔴 fuerte según la dificultad del rol |
| **Reglas duras** | Líneas que nunca cruza. Ej.: el dev no aprueba su propio código |
| **Criterio de terminado** | Checklist verificable para dar el trabajo por cerrado |

### Quién trabaja en cada ruta

✅ siempre · ◐ según el caso · — no participa

| Agente | ⚡ PARCHE | 🧩 FEATURE | 🏗️ PROYECTO |
|---|:---:|:---:|:---:|
| 🎯 Orquestador | ✅ | ✅ | ✅ |
| Viabilidad | — | — | ✅ |
| Requerimientos | ◐ ¹ | ✅ | ✅ |
| Arquitecto | ◐ ² | ◐ | ✅ |
| Repo Scout | — | ◐ | ✅ |
| UX/UI | — | ◐ ³ | ◐ ³ |
| Devs (backend, frontend, data) | ✅ ⁴ | ✅ ⁴ | ✅ |
| Git & Release | ◐ | ✅ | ✅ |
| Code Reviewer | ✅ | ✅ | ✅ |
| QA Engineer | ✅ | ✅ | ✅ |
| Ciberseguridad | ◐ ⁵ | ✅ | ✅ |
| Documentador | ◐ | ✅ | ✅ |
| DevOps / Deploy | — | ◐ | ✅ |
| Centinela | — | ◐ | ✅ |
| 🔶 Especialistas | — | ◐ ⁶ | ◐ ⁶ |

¹ Solo la historia mínima del parche · ² Solo si toca una decisión de arquitectura vigente · ³ Solo si hay interfaz · ⁴ Solo la capa que cambia · ⁵ Mini-checklist si toca datos, entradas o permisos · ⁶ Según la matriz de cobertura

### Así colaboran: una feature de principio a fin

Ejemplo: *"Agrega exportación a Excel en el módulo de reportes"*.

```mermaid
sequenceDiagram
    autonumber
    actor U as 👤 Tú
    participant O as 🎯 Orquestador
    participant R as Requerimientos
    participant QA as QA Engineer
    participant D as Dev Backend
    participant CR as Code Reviewer
    participant S as Ciberseguridad
    participant DOC as Documentador

    U->>O: "Agrega exportación a Excel"
    O->>O: Carga la memoria y clasifica: FEATURE
    O->>U: Ruta, agentes activos y ajustes de ceremonia
    U->>O: Acepto
    O->>R: Solicitud + contexto del proyecto
    R-->>O: Historia con criterios Dado/Cuando/Entonces
    O->>QA: Historia (sin código todavía)
    QA-->>O: Casos de prueba derivados de los criterios
    O->>D: Historia + diseño técnico vigente
    D-->>O: PR + nota de cambios
    loop Máximo 3 rondas
        O->>CR: Diff + historia + pruebas de QA
        CR-->>O: APROBADO o CAMBIOS REQUERIDOS
        O->>QA: Ejecutar pruebas
        QA-->>O: Resultado
    end
    O->>S: Diff (checklist de seguridad)
    S-->>O: Checklist firmado
    O->>DOC: Notas de cambios
    DOC-->>O: README y changelog al día
    O->>U: Reporte: artefactos, versión sugerida, siguiente paso
```

Fíjate en los pasos 7 y 8: **QA escribe las pruebas desde la historia antes de que exista el código**. Así las pruebas verifican lo que se pidió, no lo que el dev asumió.

### Directorio de agentes

Piso de modelo: 🟢 económico · 🟡 estándar · 🔴 fuerte

#### 🔷 Piso 1 — Núcleo

**🎯 Dirección**

| Agente | Misión | Recibe | Entrega | Modelo |
|---|---|---|---|:---:|
| [Orquestador](agents/orchestrator.md) | Dirigir el equipo con la mínima ceremonia que exige cada tarea. No escribe código | Tu solicitud y la memoria del proyecto | Reportes por fase y memoria actualizada | 🔴 / 🟡 |

**📐 Planificar**

| Agente | Misión | Recibe | Entrega | Modelo |
|---|---|---|---|:---:|
| [Viabilidad](agents/feasibility-analyst.md) | Decidir si vale la pena antes de invertir | La idea y las respuestas del intake | Dictamen: viable / con condiciones / no viable | 🟡 |
| [Requerimientos](agents/requirements-analyst.md) | Convertir la idea en alcance sin ambigüedad | La solicitud y el dictamen | Historias con criterios y PRD | 🟡 |
| [Arquitecto](agents/architect.md) | Diseñar la solución y guiar las decisiones mayores | PRD e historias | TDD, tabla de 3 opciones y ADR | 🔴 |
| [Repo Scout](agents/repo-scout.md) | Encontrar lo que ya existe para no reinventarlo | Una necesidad concreta y el stack | Hasta 5 candidatos evaluados. Nunca instala | 🟢 |
| [UX/UI](agents/ux-ui-designer.md) | Diseñar pantallas antes de programarlas | Historias y Figma (si hay) | Especificación de pantallas y design tokens | 🟡 |

**🛠️ Construir**

| Agente | Misión | Recibe | Entrega | Modelo |
|---|---|---|---|:---:|
| [Dev Backend](agents/dev-backend.md) | Implementar servidor, APIs e integraciones | Historia, TDD y ADR | PR con nota de cambios | 🟡 |
| [Dev Frontend](agents/dev-frontend.md) | Construir interfaces fieles al diseño | Historia, pantallas y tokens | PR con las pantallas en 3 tamaños | 🟡 |
| [Dev Data](agents/dev-data.md) | Implementar la capa de datos de forma reversible | Historia y modelo de datos | Migraciones reversibles y PR | 🟡 |
| [Git & Release](agents/git-release-manager.md) | Hacer cada cambio trazable y cada versión justificada | PRs y veredictos | Versión SemVer, tag y notas de versión | 🟢 |

**🔍 Verificar**

| Agente | Misión | Recibe | Entrega | Modelo |
|---|---|---|---|:---:|
| [Code Reviewer](agents/code-reviewer.md) | Revisar con ojos frescos e independientes | Diff, historia, ADR y pruebas de QA | Aprobado o cambios, con hallazgos `archivo:línea` | 🔴 |
| [QA Engineer](agents/qa-engineer.md) | Demostrar con pruebas que se cumple lo pedido | Criterios (antes del código) y luego la implementación | Matriz criterio → prueba, tests y reporte | 🟡 |
| [Ciberseguridad](agents/cybersecurity-engineer.md) | Diseñar la seguridad desde el inicio | TDD y diffs | Modelo de amenazas y checklist firmado | 🔴 |

**🚀 Entregar y operar**

| Agente | Misión | Recibe | Entrega | Modelo |
|---|---|---|---|:---:|
| [Documentador](agents/documenter.md) | Que la documentación diga lo que el sistema hace | Notas de cambios y docs existentes | README, API, runbook y changelog | 🟡 |
| [DevOps / Deploy](agents/devops-deploy.md) | Desplegar de forma repetible y reversible | Release aprobado | Guía de despliegue, CI/CD y reporte post-deploy | 🟡 |
| [Centinela](agents/sentinel.md) | Detectar problemas antes de que sean incidentes | Consumo, monitoreo y backups | Alertas 50/80/100%, política de backups y bitácora | 🟢 |

#### 🔶 Piso 2 — Especialistas bajo demanda

| Especialista | Se activa cuando… | Entrega | Modelo |
|---|---|---|:---:|
| [DBA / Arquitecto de datos](agents/specialists/dba-data-architect.md) | Hay base de datos propia, volumen serio o migraciones | Modelo y diccionario de datos, plan de migraciones, RPO/RTO | 🔴 / 🟡 |
| [BI y dashboards](agents/specialists/bi-dashboards.md) | El negocio pide reportes o tableros de decisión | Catálogo de métricas y dashboards | 🟡 |
| [Contenedores](agents/specialists/containers-specialist.md) | El despliegue es contenerizado o multiservicio | Imágenes endurecidas y manifiestos | 🟡 |
| [Arquitecto cloud](agents/specialists/cloud-architect.md) | Nube nueva, migración o costos que gobernar | ADR de nube, infraestructura como código, costo mensual | 🔴 / 🟡 |
| [Infra, redes y SRE](agents/specialists/infra-networks-sre.md) | Infraestructura propia o red no trivial | Diseño de red, SLOs y observabilidad | 🟡 |
| [Rendimiento](agents/specialists/performance-engineer.md) | Hay requisitos de carga o latencia, o lentitud reportada | Presupuestos de rendimiento e informe de carga | 🟡 |
| [IA de producto](agents/specialists/ai-product-engineer.md) | El producto tiene una capa de IA activa (no una idea futura) | Diseño de la capa de IA, evaluaciones y costo por usuario | 🔴 |

---

## 📦 Instalación

Cada entorno se instala en **un solo paso**. El detalle (activación, MCP, limitaciones) está en cada adaptador.

| Entorno | Paso único | Guía |
|---|---|---|
| **Claude Code** | `git clone https://github.com/andresvd95/VeDev_agents.git .claude/skills/vedev_agents` | [claude-code.md](adapters/claude-code.md) |
| **Cursor** | Comando único: clona + una línea en `AGENTS.md` (abajo) | [cursor.md](adapters/cursor.md) |
| **Codex** | Comando único: clona + una línea en `AGENTS.md` (abajo) | [codex.md](adapters/codex.md) |
| **OpenCode** | Comando único: clona + una línea en `AGENTS.md` (abajo) | [opencode.md](adapters/opencode.md) |
| **Warp** | Comando único: clona + una línea en `AGENTS.md` (abajo) | [warp.md](adapters/warp.md) |
| **Hermes** | `git clone https://github.com/andresvd95/VeDev_agents.git ~/.hermes/skills/vedev_agents` | [hermes.md](adapters/hermes.md) · *por verificar* |
| **Orca** | Comando único con el archivo de instrucciones del proyecto | [orca.md](adapters/orca.md) · *por verificar* |

Comando único para entornos basados en `AGENTS.md` (Cursor, Codex, OpenCode, Warp):

```bash
git clone https://github.com/andresvd95/VeDev_agents.git vedev_agents && printf '\n## vedev_agents\nSigue vedev_agents/SKILL.md como protocolo de trabajo. Agentes en vedev_agents/agents/.\n' >> AGENTS.md
```

> **¿Tu entorno no tiene subagentes?** No pasa nada: un solo agente ejecuta los roles en secuencia leyendo los mismos archivos.

---

## 🛡️ Capa de cumplimiento

Los protocolos dicen qué reglas sigue el equipo; la capa de cumplimiento hace que **el repositorio no deje romperlas**. Se aplica a tu proyecto en un paso (Git Bash en Windows):

```bash
sh .claude/skills/vedev_agents/enforcement/apply.sh
```

| Qué instala | Qué hace cumplir |
|---|---|
| CI (`vedev-ci`) | Título de PR con commits convencionales · escaneo de secretos · sin `.env` reales · pruebas |
| Plantillas de PR e issues | Definición de Terminado en cada PR · historias con criterios Dado/Cuando/Entonces |
| Hooks de git | Sin commits directos a `main`/`develop` · commits convencionales · sin `.env` en el commit |
| Protección de ramas (un comando `gh`) | Solo por PR, con aprobación y checks obligatorios, sin force-push |

GitHub y GitLab soportados. No borra nada y conserva los archivos que ya tengas. 👉 [enforcement/README.md](enforcement/README.md)

## 🧩 Funciona con otras herramientas

vedev es la **capa de proceso**; no compite con los paquetes de skills y agentes que ya uses, los aprovecha. Si en tu entorno hay, por ejemplo, revisores especializados por lenguaje (como los de *Everything Claude Code*) o flujos de TDD y depuración (como los de *Superpowers*), los agentes de vedev pueden delegarles el "cómo" de su paso, manteniendo los artefactos, las puertas y las reglas duras de vedev. Nada externo es obligatorio. 👉 [protocols/interop.md](protocols/interop.md)

---

## 🏢 Packs de empresa

El núcleo es genérico a propósito. Lo particular de tu empresa (regulación, stack oficial, nombres de ramas, gestor de secretos, canal de alertas, plantillas con tu formato, agentes extra) va en un **pack**, idealmente en un repositorio privado:

```mermaid
flowchart LR
    N["vedev_agents<br/>(público, genérico)"] -->|submodule fijado a un tag| P["tu-empresa-vedev<br/>(privado)"]
    P --> O["pack/overrides/<br/>reemplaza archivos del núcleo"]
    P --> V["pack/pack.md<br/>valores de la empresa"]
    P --> X["pack/agents/<br/>agentes propios"]
```

- El pack **sobrescribe**, nunca edita el núcleo.
- Tu empresa fija una versión del núcleo y actualiza cuando quiere.
- Lo que sirve a todos se propone al núcleo.

👉 Guía completa: [packs/README.md](packs/README.md)

---

## 👩‍💻 Para equipos humanos

El proceso también está escrito **para personas, sin IA**: [docs/proceso-equipo.md](docs/proceso-equipo.md) (10 minutos de lectura). Incluye Definición de Listo y de Terminado, flujo de ramas, checklist de PR, versionado y qué configurar en el repositorio para que las reglas se cumplan solas.

Así todo el equipo habla el mismo idioma, use o no los agentes.

---

## 🗂️ Estructura del repositorio

```
SKILL.md          Protocolo del Orquestador (lo que carga el entorno)
agents/           16 agentes del núcleo
  specialists/    7 especialistas bajo demanda
protocols/        intake · autonomía · cobertura · 3 opciones · memoria · git/semver · .env
                  · design tokens · integraciones · economía de tokens · puertas de calidad
                  · cumplimiento · interoperabilidad · piloto · ajustes de ceremonia
templates/        PRD · TDD · ADR · historia · estado del proyecto · seguridad · deploy · release
                  · auditoría · informe de piloto
enforcement/      CI, plantillas de PR/issues, hooks y protección de ramas + apply.sh
adapters/         instalación y activación por entorno
packs/            cómo personalizar para una empresa sin tocar el núcleo
docs/             guía del proceso para personas
```

---

## 🛣️ Hoja de ruta

- [x] **v0.1.0** — Especificación completa: orquestador, 23 agentes, protocolos, plantillas, adaptadores
- [x] **v0.2.0** — Capa de cumplimiento (CI, plantillas, hooks, protección de ramas), interoperabilidad y protocolo de piloto
- [x] **v1.0.0** — Primer proyecto real exitoso ([piloto 01](docs/pilots/piloto-01-google-tv.md)), lecciones aplicadas al núcleo, ajustes de ceremonia y primera personalización por empresa con un pack

**Después de v1**
- [ ] Más pilotos medidos (un PARCHE y una FEATURE) con tokens por fase
- [ ] CI de la capa de cumplimiento ejecutado en repositorios reales
- [ ] Adaptadores validados en cada entorno (incluye Orca y Hermes)
- [ ] Entrevista técnica guiada antes de escribir historias
- [ ] Benchmark publicado frente a trabajar sin proceso

## ⚠️ Estado y limitaciones

**v1.0.0 está en uso real.** Se aplicó en un proyecto completo (un launcher para Google TV, ruta PROYECTO) con buen resultado y se personalizó para una empresa mediante un pack, sin tocar el núcleo. Las lecciones del primer proyecto ya están incorporadas: [informe del piloto 01](docs/pilots/piloto-01-google-tv.md). Lo que todavía no está medido o verificado:

- La eficiencia de tokens **aún no se mide con precisión**: el piloto 01 registró costo estimado, no tokens por fase. Desde ahora se mide por diferencia del contador del entorno.
- La capa de cumplimiento se probó localmente (hooks e instalador), pero el CI aún no se ha ejecutado en un repositorio real.
- El Centinela define políticas y verifica; el monitoreo continuo y los backups programados los ejecutan herramientas reales (CI, nube, monitoreo).
- El consumo de tokens se reporta cuando el entorno lo expone; si no, se estima y se marca como estimación.
- Los adaptadores de Orca y Hermes están por verificar.

¿Lo usaste? Abre un issue con tu experiencia: cada proyecto real mejora el núcleo.

---

## 🤝 Contribuir

- **Issues:** errores, ideas o resultados de pilotos.
- **Pull requests:** mejoras al núcleo. Si algo nació en un pack y sirve a cualquier equipo, súbelo aquí.
- Mantén el formato: cada agente con sus 8 secciones, núcleo agnóstico (sin empresas reales), todo en español.

## 📄 Licencia

[MIT](LICENSE) © 2026 andresvd95
