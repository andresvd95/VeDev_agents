# Gestión de variables de entorno (.env) — vedev_agents

Dueños: `cybersecurity-engineer` (política) y `devops-deploy` (aplicación). Aplica desde el primer commit.

## Reglas

1. **`.env.example` versionado** con TODAS las variables que la app necesita, con valores vacíos o claramente falsos y un comentario por variable (para qué sirve, formato, si es obligatoria).
   ```
   # URL de conexión a la base de datos (obligatoria). Formato: postgres://usuario:clave@host:puerto/bd
   DATABASE_URL=
   # Nivel de log: debug | info | warn | error (opcional, por defecto info)
   LOG_LEVEL=info
   ```
2. **Los `.env` reales jamás entran a git.** `.gitignore` con `.env`, `.env.*` y `!.env.example` desde el primer commit.
3. **Escaneo de secretos en CI** (y opcionalmente como hook local antes del commit). Un hallazgo bloquea el PR.
4. **Un set por ambiente** (desarrollo / pruebas / producción): mismos **nombres**, distintos **valores**.
5. **Producción vive solo en un gestor de secretos.** El pack de la empresa elige cuál (p. ej. Vault, Doppler, AWS Secrets Manager, Azure Key Vault, GCP Secret Manager, o el de la plataforma de despliegue). Nunca en archivos compartidos por chat o correo.
6. **Validación al arranque con esquema:** si una variable falta o es inválida, la app no arranca y el error dice **cuál** variable y **qué** se esperaba. Nunca imprime el valor.
7. **Acceso por rol:** quién puede leer/modificar secretos de cada ambiente, documentado en el runbook.
8. **Rotación documentada:** periodicidad, procedimiento y responsable en el runbook; rotación inmediata ante sospecha de fuga.
9. **Los agentes del equipo solo ven variables de desarrollo y pruebas, NUNCA las de producción.** Si un agente necesita un valor de producción para continuar, se detiene y lo pide como acción humana.

## Incorporación de una persona nueva

1. Copia `.env.example` a `.env`.
2. Solicita los valores de desarrollo al responsable (o los obtiene del gestor de secretos con su rol).
3. Arranca la app: si falta algo, el validador lo dice.

## Checklist rápido (usado en la puerta de Seguridad)

- [ ] `.env.example` existe, está completo y sin valores reales
- [ ] `.gitignore` excluye `.env` reales
- [ ] Escaneo de secretos activo en CI
- [ ] Validación de variables al arranque
- [ ] Producción solo en gestor de secretos
- [ ] Rotación y accesos documentados en el runbook
