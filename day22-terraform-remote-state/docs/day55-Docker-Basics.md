# Day 55 - Docker Basics

## Objective

Install Docker on Ubuntu and learn the fundamental Docker concepts and commands used by real Cloud Engineers.

---

# Docker Installation

Update Ubuntu package list

```bash
sudo apt update
```

Install required packages

```bash
sudo apt install -y ca-certificates curl
```

Verify Docker service

```bash
sudo systemctl status docker
```

---

# Linux Permissions

Docker communicates through:

```text
/var/run/docker.sock
```

Add the current user to the Docker group:

```bash
sudo usermod -aG docker ssm-user
```

Reconnect to the server for the group membership to take effect.

---

# Docker Concepts

## Docker Image

A Docker image is a **read-only blueprint** used to create containers.

Examples:

- nginx
- ubuntu
- hello-world

---

## Docker Container

A Docker container is a **running instance** created from an image.

One image can create many containers.

```
Image
   │
docker run
   ▼
Container
```

Containers continue running only while their main process is running.

---

# Docker Commands

## List running containers

```bash
docker ps
```

Shows only running containers.

---

## List all containers

```bash
docker ps -a
```

Shows both running and stopped containers.

---

## List downloaded images

```bash
docker images
```

Displays all Docker images stored locally.

---

## Create and start a container

```bash
docker run hello-world
```

Docker automatically:

1. Checks for the image
2. Downloads it if necessary
3. Creates a container
4. Starts the container

---

## Run Nginx

```bash
docker run -d --name my-nginx -p 8080:80 nginx
```

### Explanation

- `-d` = Detached mode (run in background)
- `--name` = Assign a friendly container name
- `-p 8080:80` = Map EC2 port 8080 to container port 80

---

## Stop a container

```bash
docker stop my-nginx
```

Gracefully stops the container.

---

## Start an existing container

```bash
docker start my-nginx
```

Starts a previously stopped container.

---

## Restart a container

```bash
docker restart my-nginx
```

Equivalent to:

```text
docker stop
docker start
```

---

# Important Concepts

## docker run

Creates a **new** container every time it is executed.

---

## docker start

Starts an **existing** container.

---

## hello-world

The container exits immediately because its only task is to print a message and exit successfully.

---

## nginx

The container remains running because the Nginx web server continues listening for incoming requests.

---

# Troubleshooting

Check Docker service

```bash
sudo systemctl status docker
```

Check running containers

```bash
docker ps
```

Check all containers

```bash
docker ps -a
```

---

# Key Takeaways

- Docker Image = Blueprint
- Docker Container = Running instance
- One image can create many containers
- Containers stop when their main process exits
- `docker run` creates a new container
- `docker start` starts an existing container
- `docker ps` shows running containers
- `docker ps -a` shows all containers