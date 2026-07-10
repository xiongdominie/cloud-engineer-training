# Day 70 – Docker Compose Networking

## Objective
Learn how Docker Compose networking works, how containers communicate, and how Docker provides automatic service discovery.

---

# Docker Compose Automatic Network

When running:

```bash
docker compose up -d
```

Docker Compose automatically:

- Creates a network (if one doesn't exist)
- Creates containers
- Creates defined volumes
- Starts the application

Example automatic network:

```
day70-networking_default
```

---

# Docker Networks

List all Docker networks:

```bash
docker network ls
```

Default networks:

- bridge
- host
- none

Compose automatically creates a project network.

---

# Service Discovery

Containers communicate using **service names**, not IP addresses.

Example:

```yaml
services:
  ubuntu:
    image: ubuntu

  redis:
    image: redis
```

Ubuntu can communicate with Redis using:

```bash
ping redis
```

Docker automatically resolves:

```
redis
```

to the correct container IP using its internal DNS.

Advantages:

- No hardcoded IP addresses
- IP addresses can change
- Applications continue working after container restarts

---

# Internal DNS

Docker automatically maintains an internal DNS server.

Example:

```
redis
      ↓
172.xx.xx.xx
```

Applications use service names instead of IP addresses.

---

# docker exec

Run a command inside a running container.

Syntax:

```bash
docker exec -it <container-name> bash
```

Example:

```bash
docker exec -it day70-networking-ubuntu-1 bash
```

Flags:

- -i = Interactive
- -t = Terminal (TTY)

Purpose:

- Troubleshooting
- Running Linux commands
- Testing networking
- Viewing files

---

# ping

Test communication between containers.

Example:

```bash
ping redis
```

Stop ping:

```
Ctrl + C
```

Successful ping proves:

- Containers are on the same network
- Docker DNS is working
- Service discovery is working

---

# docker network inspect

Display detailed information about a Docker network.

Syntax:

```bash
docker network inspect <network-name>
```

Example:

```bash
docker network inspect day70-networking_backend
```

Shows:

- Network name
- Driver
- Connected containers
- Container IP addresses
- Network configuration

---

# Custom Networks

Define a custom network inside compose.yaml.

Example:

```yaml
services:
  ubuntu:
    image: ubuntu:latest
    command: sleep infinity
    networks:
      - backend

  redis:
    image: redis:latest
    networks:
      - backend

networks:
  backend:
```

Docker Compose creates:

```
day70-networking_backend
```

instead of using only the default network.

Benefits:

- Better organization
- Easier troubleshooting
- Improved security
- Meaningful network names

---

# Multiple Networks

A container can belong to multiple networks.

Example:

```yaml
services:
  api:
    networks:
      - frontend
      - backend
```

This allows the API to communicate with both networks.

Example architecture:

Internet

↓

Web Server

↓

API Server

↓

Database

The API acts as a bridge between frontend and backend networks.

---

# docker compose down

Stop and remove the Compose application.

```bash
docker compose down
```

Removes:

- Containers
- Compose-created networks

Does NOT remove:

- Images
- Named volumes

---

# docker compose ps

Display containers belonging to the current Compose project.

```bash
docker compose ps
```

Unlike:

```bash
docker ps
```

which shows all running containers.

---

# Linux Commands Learned

Create directory:

```bash
mkdir day70-networking
```

Change directory:

```bash
cd day70-networking
```

Print current directory:

```bash
pwd
```

Create empty file:

```bash
touch compose.yaml
```

Open file:

```bash
nano compose.yaml
```

Display file contents:

```bash
cat compose.yaml
```

Update package list:

```bash
apt update
```

Install ping utility:

```bash
apt install -y iputils-ping
```

---

# Key Concepts Learned

- Docker Compose automatically creates networks.
- Containers communicate using service names.
- Docker provides internal DNS.
- Service discovery removes the need for hardcoded IP addresses.
- docker exec enters running containers.
- docker network inspect shows network details.
- Custom networks improve organization and security.
- Multiple networks isolate applications while allowing controlled communication.
- docker compose down removes the application and Compose-created network.

---

# Important Commands

```bash
docker compose up -d

docker compose down

docker compose ps

docker network ls

docker network inspect <network>

docker exec -it <container> bash

ping redis

cat compose.yaml
```