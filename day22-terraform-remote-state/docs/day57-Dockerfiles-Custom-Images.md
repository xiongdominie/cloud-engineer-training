# Day 57 - Dockerfiles and Building Custom Images

## Objectives

Learn how Docker images are built using a Dockerfile, create a custom Docker image, understand how files are copied into an image, and deploy a custom website inside a Docker container.

---

# What is a Dockerfile?

A Dockerfile is a text file containing instructions that Docker follows to build an image.

Think of it as a recipe.

Docker reads each instruction from top to bottom.

Example:

```dockerfile
FROM nginx

COPY . /usr/share/nginx/html
```

---

# Docker Build Process

Dockerfile

↓

docker build

↓

Docker Image

↓

docker run

↓

Running Container

---

# Building Your First Image

Command:

```bash
docker build -t my-nginx:v1 .
```

Explanation:

docker

Docker command-line interface.

build

Creates a Docker image.

-t

Assigns a tag (name and version).

my-nginx

Repository name.

v1

Version tag.

.

Current directory.

Docker uses the current directory as the Build Context.

---

# Build Context

The Build Context is the collection of files Docker sends to the Docker Engine during a build.

Example:

docker-demo/

├── Dockerfile

└── index.html

The "." in:

```bash
docker build .
```

means:

Use everything inside the current directory.

---

# Dockerfile Instructions

## FROM

Example:

```dockerfile
FROM nginx
```

Purpose:

Uses the official nginx image as the starting point.

Every Docker image begins with a base image.

---

## COPY

Example:

```dockerfile
COPY . /usr/share/nginx/html
```

Explanation:

.

Copy everything from the current project folder.

Destination:

/usr/share/nginx/html

This is the default folder where Nginx serves website files.

---

# Creating a Custom Website

Create a file:

```text
index.html
```

Example:

```html
<!DOCTYPE html>

<html>

<head>

<title>Dominic's Docker Website</title>

</head>

<body>

<h1>Hello from Dominic's Docker Image!</h1>

<p>I built this during Cloud Engineering training.</p>

</body>

</html>
```

Docker copies this file into the Nginx web server during the image build.

---

# Building a New Version

```bash
docker build -t my-nginx:v2 .
```

Purpose:

Create a new version of the Docker image after modifying the website.

Versioning allows multiple images to exist at the same time.

Examples:

my-nginx:v1

my-nginx:v2

my-nginx:v3

---

# Running Your Custom Image

```bash
docker run -d --name my-custom-nginx -p 8082:80 my-nginx:v2
```

Explanation:

docker run

Creates and starts a container.

-d

Detached mode.

Runs in the background.

--name my-custom-nginx

Assigns a friendly container name.

-p 8082:80

Maps port 8082 on the EC2 instance to port 80 inside the container.

my-nginx:v2

Uses your custom Docker image.

---

# Verifying the Website

Inside EC2:

```bash
curl http://localhost:8082
```

Purpose:

Tests the website locally on the server.

If curl works but the browser cannot connect, the problem is usually the AWS Security Group.

---

# AWS Security Groups

Containers may be working correctly even if users cannot access them.

Remember to open the correct port.

Example:

8082/TCP

Source:

0.0.0.0/0

---

# Browser Test

Example:

http://<EC2-Public-IP>:8082

If everything is configured correctly, your custom webpage appears instead of the default Nginx welcome page.

---

# Docker Image vs Container

Docker Image

Blueprint

↓

Docker Container

Running application

Updating an image does NOT automatically update existing containers.

To deploy changes:

1. Edit source files.

2. Build a new image.

3. Start a new container.

4. Remove the old container.

---

# Immutable Containers

Containers should not be modified after deployment.

Professional workflow:

Edit source code

↓

Build new image

↓

Deploy new container

↓

Remove old container

Containers are disposable.

Images are the source of truth.

---

# Troubleshooting Steps

If the website does not load:

1. Check running containers.

```bash
docker ps
```

2. Test locally.

```bash
curl http://localhost:8082
```

3. Verify AWS Security Group.

4. Confirm correct port mapping.

5. Restart the container if necessary.

---

# Key Takeaways

- Dockerfiles describe how images are built.
- Docker reads Dockerfiles from top to bottom.
- FROM selects the base image.
- COPY copies project files into the image.
- Build Context is the folder Docker sends during a build.
- Images create containers.
- Editing source code requires rebuilding the image.
- Existing containers do not update automatically.
- Security Groups must allow access to the exposed port.