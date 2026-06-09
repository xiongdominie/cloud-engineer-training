# Day 53 - Docker Networking

## Commands Learned

### Run a Container

docker run nginx

Creates and starts a container.

---

### Run in Background

docker run -d nginx

-d = detached mode

---

### Port Mapping

docker run -d -p 8080:80 nginx

8080 = host/EC2 port
80 = container port

Traffic Flow:

Browser
↓
EC2:8080
↓
Container:80
↓
Nginx

---

### View Running Containers

docker ps

Shows running containers only.

---

### View All Containers

docker ps -a

Shows running and stopped containers.

---

### View Logs

docker logs <container-id>

Displays container output.

---

### Enter Container

docker exec -it <container-id> bash

Starts a bash shell inside the container.

---

### Stop Container

docker stop <container-id>

Stops a running container.

---

### Start Container

docker start <container-id>

Starts an existing stopped container.

---

## Key Concepts

Image = Blueprint

Container = Running instance of an image

docker run = create + start

docker start = start existing container

Containers are lightweight because they share the host kernel.