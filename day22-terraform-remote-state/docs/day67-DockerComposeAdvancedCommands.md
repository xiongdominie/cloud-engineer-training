# Day 67 - Docker Compose Advanced Commands

## Objective

Learn how to inspect running containers, understand the Docker Compose container lifecycle, and rebuild images after application changes.

---

# Commands Learned

## Enter a Running Container

```bash
docker exec -it python-app sh
```

### Breakdown

- `docker` → Docker CLI
- `exec` → Execute a command inside an existing container
- `-i` → Interactive mode
- `-t` → Allocate a terminal
- `python-app` → Container name
- `sh` → Open a shell inside the container

This allows you to troubleshoot or inspect a running container without rebuilding it.

---

## View Files Inside the Container

```bash
ls
```

Lists files in the current directory.

---

## Show Current Directory

```bash
pwd
```

Displays the current working directory.

Expected output:

```text
/app
```

This directory comes from:

```dockerfile
WORKDIR /app
```

---

## Display File Contents

```bash
cat app.py
```

Prints the contents of the Python application.

---

## Exit the Container

```bash
exit
```

Exits the shell.

**Important:** The container continues running after you exit.

---

# Docker Compose Lifecycle

## Stop Containers

```bash
docker compose stop
```

Stops all containers defined in the Compose project.

Containers still exist.

Network still exists.

---

## Verify Running Containers

```bash
docker ps
```

Shows only running containers.

---

## Show All Containers

```bash
docker ps -a
```

Shows running and stopped containers.

Stopped containers display:

```text
Exited
```

---

## Restart Existing Containers

```bash
docker compose start
```

Starts previously stopped containers.

No new containers are created.

---

## Remove Containers

```bash
docker compose down
```

This command:

- Stops containers
- Removes containers
- Removes the Docker Compose network

Images are NOT deleted.

---

## Verify Containers Were Removed

```bash
docker ps -a
```

The Compose containers should no longer appear.

---

# Images Remain

Check existing images:

```bash
docker images
```

Even after `docker compose down`, images remain available.

Containers can be recreated from these images.

---

# Rebuild Images

```bash
docker compose up --build
```

or

```bash
docker compose up --build -d
```

This command:

1. Rebuilds images from the Dockerfile
2. Creates new containers
3. Starts the application

---

# Why --build Is Needed

Changing source code does NOT automatically update a Docker image.

Example:

Original:

```python
print("Hello World")
```

Updated:

```python
print("Cloud Engineer")
```

Running:

```bash
docker compose up
```

uses the old image.

Running:

```bash
docker compose up --build
```

creates a new image with the updated code.

---

# Docker Build Flow

```text
Dockerfile
      │
      ▼
Image
      │
      ▼
Container
```

- Dockerfile = Recipe
- Image = Finished product
- Container = Running instance

Changing the Dockerfile or application code requires rebuilding the image.

---

# Common Development Workflow

```bash
docker compose down
docker compose up --build -d
```

This removes old containers, rebuilds images, creates new containers, and starts everything in the background.

---

# Key Differences

| Command | Purpose |
|----------|---------|
| docker compose up | Create and start containers |
| docker compose up -d | Start containers in background |
| docker compose stop | Stop containers without deleting them |
| docker compose start | Restart existing stopped containers |
| docker compose down | Stop and remove containers and network |
| docker compose up --build | Rebuild images and create fresh containers |

---

# Real-World Usage

Cloud Engineers frequently use:

- `docker exec` to troubleshoot running containers
- `docker compose logs` to inspect application output
- `docker compose stop` for temporary shutdowns
- `docker compose down` to clean up environments
- `docker compose up --build` after application or Dockerfile changes

Understanding the distinction between images, containers, and Docker Compose lifecycle commands is essential for developing and maintaining containerized applications.

---

# Lab Completed

Successfully completed:

- Entered a running container
- Explored the container filesystem
- Viewed application files
- Exited the container
- Stopped Compose services
- Verified stopped containers
- Restarted services
- Removed Compose project
- Verified container removal
- Rebuilt application using `docker compose up --build`

---

# Day 67 Complete ✅

You now understand how to inspect running containers, manage the Docker Compose lifecycle, and rebuild images after application changes. These are core skills used daily by Cloud Engineers working with Docker in development and production environments.