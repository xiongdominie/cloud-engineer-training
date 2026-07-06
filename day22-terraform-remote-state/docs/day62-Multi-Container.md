# Day 62 – Multi-Container Applications

## Multiple Services

Docker Compose can start multiple containers using one command.

Example:

- Nginx
- PostgreSQL

---

## PostgreSQL

```yaml
image: postgres:16
```

Uses PostgreSQL version 16.

---

## Environment Variables

```yaml
environment:
  POSTGRES_PASSWORD: mypassword
```

Docker passes configuration into the PostgreSQL container.

Without a password, PostgreSQL will not start.

---

## Docker Network

Docker Compose automatically creates a private bridge network.

Containers communicate using service names.

Example:

database

instead of

172.18.0.3

Docker automatically resolves the service name.

---

## Network Commands

List networks

```bash
docker network ls
```

Inspect network

```bash
docker network inspect day61-compose_default
```

---

## depends_on

```yaml
depends_on:
  - database
```

Controls startup order.

Docker starts the database container before the web container.

Important:

depends_on does NOT wait until PostgreSQL is fully ready.

It only starts the container first.

---

## Key Takeaways

- Multiple services can be defined in one Compose file.
- Docker creates networks automatically.
- Containers communicate using service names.
- depends_on controls startup order.