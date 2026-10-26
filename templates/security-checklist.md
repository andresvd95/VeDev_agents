# Checklist de seguridad — [Proyecto] — [Fase / Release vX.Y.Z]

> Dueño: `cybersecurity-engineer`. Se firma antes de cada release (ruta FEATURE y PROYECTO). En ruta exprés se usa el mini-checklist de `protocols/quality-gates.md`.

**Fecha:** [AAAA-MM-DD] · **Revisó:** [rol] · **Resultado:** [APROBADO | APROBADO CON RIESGOS ACEPTADOS | RECHAZADO]

## Diseño
- [ ] Modelo de amenazas (STRIDE) actualizado
- [ ] Autenticación y autorización según diseño (OAuth2/OIDC si aplica)
- [ ] Principio de mínimo privilegio en servicios y usuarios

## OWASP Top 10 (resumen)
- [ ] Control de acceso verificado en cada endpoint/pantalla
- [ ] Sin fallas criptográficas (TLS, hashing de contraseñas con algoritmo adecuado)
- [ ] Sin inyección (consultas parametrizadas, validación de entradas)
- [ ] Diseño seguro de flujos sensibles (recuperación de cuenta, pagos)
- [ ] Configuración segura (cabeceras, CORS, modo debug apagado)
- [ ] Componentes vulnerables revisados (auditoría de dependencias)
- [ ] Autenticación robusta (límite de intentos, sesiones)
- [ ] Integridad de software y datos (dependencias y builds confiables)
- [ ] Registro y monitoreo de eventos de seguridad sin datos sensibles
- [ ] Protección contra SSRF en llamadas salientes

## Secretos y configuración
- [ ] Checklist de `protocols/env-management.md` cumplido

## Privacidad y cumplimiento
- [ ] Datos personales identificados y minimizados
- [ ] Base legal / consentimiento según la regulación aplicable (definida en el intake o en el pack)
- [ ] Retención y borrado definidos
- [ ] Derechos de los titulares atendibles (acceso, rectificación, supresión)

## Hallazgos
| Severidad | Hallazgo | Ubicación | Corrección | Estado |
|---|---|---|---|---|
| [crítica/alta/media/baja] | [ … ] | [archivo:línea] | [ … ] | [abierto/cerrado/aceptado] |

## Riesgos aceptados
- [riesgo — quién lo aceptó — fecha]
