# Day 52 – Docker Fundamentals on AWS Ubuntu

## Environment

- AWS EC2 Ubuntu 24.04
- Connected via AWS Systems Manager (SSM)
- Installed Docker and verified service

---

## Images vs Containers

### Image

- Blueprint/template
- Read-only
- Example: `ubuntu:latest`

### Container

- Running (or stopped) instance of an image
- Has its own writable layer
- Multiple containers can be created from one image

Analogy:

- Image = recipe
- Container = cake

---

## Docker Verification

```bash
docker run hello-world
```

Verified:

- Docker daemon running
- Internet access working
- Image downloads working
- Containers can start

---

## Show Running Containers

```bash
docker ps
```

Shows currently running containers.

---

## Show All Containers

```bash
docker ps -a
```

Shows running and stopped containers.

---

## Show Images

```bash
docker images
```

Lists images stored locally.

---

## First Interactive Container

```bash
docker run -it ubuntu bash
```

### Breakdown

#### docker

Docker command-line interface.

#### run

Create and start a new container.

#### -i

Interactive mode.

Keeps keyboard input connected.

#### -t

Allocate terminal (TTY).

Provides a proper shell experience.

#### ubuntu

Image name.

#### bash

Command to run inside container.

Meaning:

> Create a new Ubuntu container and open an interactive Bash shell.

---

## Container Identity

Commands:

```bash
hostname
cat /etc/os-release
pwd
```

Learned:

- Container gets its own hostname
- Container behaves like a separate Linux machine
- Current directory was `/`

---

## Linux Filesystem

### /etc

Configuration files.

### /home

User home directories.

### /root

Root user's home directory.

### /tmp

Temporary files.

### /usr

Installed software.

### /var

Logs and changing data.

### /bin

Essential Linux commands.

---

## Process Isolation

```bash
ps aux
```

Observed:

```text
PID 1 = bash
```

Key lesson:

```text
bash exits
↓
container stops
```

Container lifetime is tied to its main process.

---

## Creating Files

```bash
touch myfile.txt
```

Creates an empty file.

Verify:

```bash
ls
```

---

## Viewing File Contents

```bash
cat myfile.txt
```

Displays file contents.

---

## Writing Data

```bash
echo "hello from container" > myfile.txt
```

### Breakdown

#### echo

Print text.

#### >

Redirect output into a file.

---

## Persistence Experiment

Created:

```text
myfile.txt
```

Exited:

```bash
exit
```

Started a new container:

```bash
docker run -it ubuntu bash
```

Result:

```text
myfile.txt
```

was gone.

Reason:

```text
New container ≠ old container
```

---

## Stopped vs Deleted

Important lesson:

```text
Stopped
≠
Deleted
```

A stopped container still exists.

---

## Starting Existing Container

```bash
docker start romantic_moore
```

Starts an existing stopped container.

---

## Entering Existing Container

```bash
docker exec -it romantic_moore bash
```

### Breakdown

#### exec

Run command inside an existing container.

#### -it

Interactive terminal.

#### bash

Open shell.

Result:

Original file still existed.

---

## Overlay Filesystem

Command:

```bash
mount | head
```

Observed:

```text
overlay on / type overlay
```

Docker layers:

```text
Ubuntu Image (read-only)
        +
Container Layer (writable)
```

Files created in the container go into the writable layer.

---

## Real-World Relevance

Why companies use persistent storage:

- Docker Volumes
- AWS EBS
- AWS EFS
- Kubernetes Persistent Volumes

Reason:

```text
Containers are disposable
```

---

## Most Important Takeaways

1. Image = blueprint
2. Container = running instance
3. One image can create many containers
4. Containers have isolated processes
5. PID 1 is critical
6. Stopped containers still exist
7. New containers get fresh filesystems
8. Container data should not be treated as permanent
9. Docker uses layered storage
10. `docker exec -it` is used constantly by engineers

---

## Day 53 Preview

```bash
docker run -p 8080:80 nginx
```

Topics:

- Port mapping
- Nginx containers
- Host port vs container port
- Serving web traffic from Docker