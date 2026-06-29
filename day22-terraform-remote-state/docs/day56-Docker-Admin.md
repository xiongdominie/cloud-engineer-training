# Day 56 - Docker Administration

## Objectives

Learn the basic Docker administration commands used by Cloud Engineers to manage images, containers, logs, and Docker environments.

---

# What is Docker?

Docker is a platform that packages an application and all of its dependencies into a container.

This allows the application to run consistently on any computer or server.

---

# Docker Architecture

User
↓

Docker CLI

↓

Docker Engine (Daemon)

↓

Images

↓

Containers

---

# Image vs Container

Image

- Blueprint
- Read-only
- Used to create containers

Examples:

- nginx
- ubuntu
- python

Container

- Running instance of an image
- Can be started
- Can be stopped
- Can be deleted

Think of it like:

Image = House Blueprint

Container = Finished House

---

# Installing Docker

Ubuntu

```bash
sudo apt update
```

Updates Ubuntu's package list.

```bash
sudo apt install docker.io
```

Installs Docker.

---

# Checking Docker Version

```bash
docker --version
```

Shows the installed Docker version.

Example:

Docker version 29.1.3

---

# Starting Docker

```bash
sudo systemctl start docker
```

Starts the Docker service.

---

# Enable Docker at Boot

```bash
sudo systemctl enable docker
```

Automatically starts Docker whenever the server boots.

---

# Verify Docker is Running

```bash
sudo systemctl status docker
```

Shows whether the Docker service is active.

---

# Run the Hello World Container

```bash
docker run hello-world
```

Purpose:

Downloads the hello-world image (if necessary) and starts a test container.

Confirms Docker is working correctly.

---

# Download an Image

```bash
docker pull nginx
```

Downloads the latest nginx image from Docker Hub.

Does not create a container.

---

# List Images

```bash
docker images
```

or

```bash
docker image ls
```

Displays all images stored on the local machine.

---

# Create and Start a Container

```bash
docker run -d --name my-nginx -p 8080:80 nginx
```

Explanation:

docker run

Creates and starts a container.

-d

Detached mode.

Runs the container in the background.

--name my-nginx

Assigns a friendly name.

-p 8080:80

Maps host port 8080 to container port 80.

nginx

The image used to create the container.

---

# List Running Containers

```bash
docker ps
```

Shows all running containers.

---

# List All Containers

```bash
docker ps -a
```

Shows running and stopped containers.

---

# View Logs

```bash
docker logs my-nginx
```

Displays the application's output.

Useful for troubleshooting.

---

# Execute Commands Inside a Container

```bash
docker exec -it my-nginx bash
```

Explanation:

docker exec

Run a command inside a running container.

-i

Interactive mode.

-t

Creates a terminal.

bash

Launches the Bash shell.

---

# Exit the Container

```bash
exit
```

Leaves the container shell.

The container continues running.

---

# Stop a Container

```bash
docker stop my-nginx
```

Gracefully stops a running container.

---

# Start a Container

```bash
docker start my-nginx
```

Starts a stopped container.

---

# Restart a Container

```bash
docker restart my-nginx
```

Stops and starts the container.

---

# Remove a Container

```bash
docker rm my-nginx
```

Deletes a stopped container.

---

# Remove an Image

```bash
docker rmi nginx
```

Deletes an image that is not being used by a container.

---

# Docker Workflow

Download Image

↓

Create Image

↓

Run Container

↓

Inspect Logs

↓

Stop Container

↓

Restart Container

↓

Remove Container

---

# Key Takeaways

- Images are templates.
- Containers are running instances of images.
- Docker packages applications with their dependencies.
- Containers are isolated from the host operating system.
- Docker administration focuses on creating, managing, and troubleshooting containers.