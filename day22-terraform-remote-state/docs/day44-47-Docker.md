# Cloud Engineering Journey – Day 44–47

## Day 44 – Introduction to Docker

### Objective

Understand what containers are and why they are used.

### Key Concepts

#### Traditional Deployment Problems

* Dependency conflicts
* Different software versions
* Difficult application deployment
* "Works on my machine" problems

#### Docker Solution

Docker packages:

* Application
* Dependencies
* Libraries
* Configuration

into a container.

### Analogy

AMI → EC2 Instance

Docker Image → Docker Container

### Commands

Install Docker:

```bash
sudo dnf install docker -y
```

Start Docker:

```bash
sudo systemctl start docker
```

Enable Docker:

```bash
sudo systemctl enable docker
```

Verify Docker:

```bash
docker --version
```

Check Docker service:

```bash
sudo systemctl status docker
```

### Lessons Learned

* Docker Engine runs containers.
* Images are blueprints.
* Containers are running instances.

---

# Day 45 – Running First Container

## Objective

Deploy NGINX using Docker.

### Download Image

```bash
sudo docker pull nginx
```

### Verify Image

```bash
sudo docker images
```

### Run Container

```bash
sudo docker run -d -p 80:80 nginx
```

### Port Mapping

```text
EC2 Port 80 → Container Port 80
```

### Verify Container

```bash
sudo docker ps
```

### Access Website

```text
http://PUBLIC-IP
```

### Lessons Learned

* Pulling an image does not start an application.
* Containers must be created from images.
* Port mapping connects EC2 traffic to containers.

---

# Day 46 – Container Operations & Troubleshooting

## Objective

Learn how engineers troubleshoot containers.

### View Running Containers

```bash
sudo docker ps
```

### View All Containers

```bash
sudo docker ps -a
```

### View Logs

```bash
sudo docker logs frosty_nash
```

### Enter Container

```bash
sudo docker exec -it frosty_nash bash
```

### Inspect Website Files

```bash
cd /usr/share/nginx/html
ls -l
cat index.html
```

### Understanding the Architecture

```text
Internet
 ↓
Security Group
 ↓
EC2
 ↓
Docker
 ↓
NGINX Container
 ↓
index.html
```

### Modify Website

```bash
echo "<h1>Hello from Dominic's Docker Container</h1>" > index.html
```

### Result

Website updated immediately without restarting NGINX.

### Lessons Learned

* Logs are critical for troubleshooting.
* Containers can be entered and inspected.
* NGINX serves content from index.html.
* Static file changes appear immediately.

---

# Day 47 – Building Custom Docker Images

## Objective

Create and deploy a custom Docker image.

### Create Project Directory

```bash
cd ~
mkdir myapp
cd myapp
```

### Create Custom Web Page

```bash
echo "<h1>Cloud Engineer Dominic</h1>" > index.html
```

### Create Dockerfile

```dockerfile
FROM nginx
COPY index.html /usr/share/nginx/html/index.html
```

### Understanding Dockerfile

```text
Dockerfile
 ↓ build
Docker Image
 ↓ run
Docker Container
```

### Build Image

```bash
sudo docker build -t dominic-nginx:v1 .
```

### Verify Image

```bash
sudo docker images
```

### Stop Old Container

```bash
sudo docker stop frosty_nash
sudo docker rm frosty_nash
```

### Run Custom Container

```bash
sudo docker run -d -p 80:80 --name dominic-web dominic-nginx:v1
```

### Verify

```bash
sudo docker ps
```

### Result

Custom webpage displayed:

```text
Cloud Engineer Dominic
```

### Lessons Learned

* Dockerfile is a blueprint for building images.
* Images are versioned artifacts.
* Containers are created from images.
* Production changes should be made in images, not directly inside containers.

---

# Key Concepts Mastered

## Docker Lifecycle

```text
Dockerfile
    ↓
docker build
    ↓
Image
    ↓
docker run
    ↓
Container
```

## Common Commands

```bash
sudo docker images
sudo docker ps
sudo docker ps -a
sudo docker logs <container>
sudo docker exec -it <container> bash
sudo docker stop <container>
sudo docker start <container>
sudo docker rm <container>
sudo docker build -t image:tag .
sudo docker run -d -p 80:80 image:tag
```

## Status

Day 44–47 Completed

Topics Covered:

* Docker Fundamentals
* Images vs Containers
* NGINX Containers
* Container Troubleshooting
* Logs
* Container Inspection
* Custom Docker Images
* Dockerfile Basics
* Image Versioning
* Custom Container Deployment

Next Up:
Day 48 – AWS ECR (Elastic Container Registry)
