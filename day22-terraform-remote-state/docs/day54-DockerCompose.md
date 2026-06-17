# Day 54 – Docker Compose

## Objective

Learn how Docker Compose simplifies managing multi-container applications by defining everything inside one YAML configuration file.

---

## Why Docker Compose?

Without Docker Compose, every container must be started individually.

Example:

```bash
docker network create my-network

docker run -d \
--name redis \
--network my-network \
redis

docker run -d \
--name web \
-p 8080:80 \
--network my-network \
my-image
```

Docker Compose allows everything to be managed with one file.

---

## docker-compose.yml

Example:

```yaml
version: "3.8"

services:

  redis:
    image: redis

  web:
    build: .
    ports:
      - "8080:80"
    depends_on:
      - redis
```

---

## Main Commands

Start containers

```bash
docker compose up
```

Start in background

```bash
docker compose up -d
```

View running containers

```bash
docker ps
```

View logs

```bash
docker compose logs
```

Stop containers

```bash
docker compose stop
```

Stop and remove everything

```bash
docker compose down
```

Rebuild images

```bash
docker compose up --build
```

---

## Important Concepts

### Services

A service represents one container.

Example:

- web
- redis
- mysql

---

### Image

Uses an existing Docker image.

```yaml
image: redis
```

---

### Build

Builds an image from a Dockerfile.

```yaml
build: .
```

---

### Ports

Maps host ports to container ports.

```yaml
ports:
  - "8080:80"
```

Host:
8080

Container:
80

---

### depends_on

Starts containers in order.

```yaml
depends_on:
  - redis
```

---

### Networks

Docker Compose automatically creates a network.

Containers communicate using service names.

Instead of

```
172.18.0.2
```

you simply use

```
redis
```

---

## Advantages

- Easier deployment
- One command to start everything
- Automatic networking
- Easier scaling
- Cleaner configuration
- Version controlled

---

## Commands Learned

```bash
docker compose up

docker compose up -d

docker compose down

docker compose stop

docker compose logs

docker compose up --build
```

---

## What I Learned

- Docker Compose manages multiple containers.
- A YAML file defines the entire application.
- Compose automatically creates networks.
- Containers communicate using service names.
- One command can start or stop the whole application.

---

## Next Topic

Amazon ECS (Elastic Container Service)