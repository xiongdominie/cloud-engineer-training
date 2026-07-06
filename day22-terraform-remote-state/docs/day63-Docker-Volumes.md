# Day 63 – Docker Volumes

## Why Volumes?

Containers are temporary.

Important data should not be stored inside containers.

Volumes provide persistent storage.

---

## Named Volume

```yaml
volumes:
  - postgres_data:/var/lib/postgresql/data
```

Left side

postgres_data

Docker-managed volume.

Right side

/var/lib/postgresql/data

Location inside the PostgreSQL container.

---

## Create Volume

```yaml
volumes:
  postgres_data:
```

Creates a named Docker volume.

---

## Commands

List volumes

```bash
docker volume ls
```

Inspect volume

```bash
docker volume inspect day61-compose_postgres_data
```

---

## down vs down -v

```bash
docker compose down
```

Removes:

- Containers
- Networks

Keeps:

- Named volumes

---

```bash
docker compose down -v
```

Removes:

- Containers
- Networks
- Named volumes

Database data is deleted.

---

## Named Volumes vs Bind Mounts

Named Volume

Docker manages storage.

Best for databases.

Bind Mount

Example

```yaml
volumes:
  - ./html:/usr/share/nginx/html
```

Uses a folder on the host.

Best for:

- HTML
- Source code
- Configuration files

---

## Key Takeaways

- Volumes preserve data.
- Containers can be recreated without losing database data.
- Docker stores named volumes on the host.
- Named volumes are preferred for databases.
- Bind mounts are preferred for development files.