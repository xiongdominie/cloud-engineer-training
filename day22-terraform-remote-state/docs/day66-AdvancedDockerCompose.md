# Day 66 - Advanced Docker Compose

## Objective

Learn production Docker Compose features.

---

## Restart Policy

```yaml
restart: unless-stopped
```

Automatically restarts containers unless intentionally stopped.

---

## Environment Variables

```yaml
environment:
  MYSQL_ROOT_PASSWORD: mypassword
  MYSQL_DATABASE: inventory
```

Used to pass configuration into containers.

Examples:

- Passwords
- Database names
- API Keys

---

## depends_on

```yaml
depends_on:
  - database
```

Starts another service first.

Important:

depends_on controls startup order only.

It does NOT wait until the application is healthy.

---

## Health Check

```yaml
healthcheck:
  test: ["CMD", "mysqladmin", "ping"]
  interval: 10s
  retries: 5
```

Checks whether the application inside the container is actually ready.

---

## Production Example

```yaml
services:
  web:
    image: nginx
    ports:
      - "8080:80"
    restart: unless-stopped
    depends_on:
      - database

  database:
    image: mysql:8.0
    restart: unless-stopped
    environment:
      MYSQL_ROOT_PASSWORD: mypassword
      MYSQL_DATABASE: inventory
    healthcheck:
      test: ["CMD", "mysqladmin", "ping"]
      interval: 10s
      retries: 5
```

---

## Key Concepts

restart:
- Automatic recovery

environment:
- Configuration values

depends_on:
- Startup order

healthcheck:
- Application readiness

Production databases:
- Docker Volumes

Development:
- Bind Mounts