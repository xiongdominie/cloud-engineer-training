# Day 58 - Docker Best Practices

## Objectives

Learn how Docker optimizes image builds using layers and build cache, understand the purpose of the build context and .dockerignore, learn why containers are immutable, understand multi-stage builds, and master the differences between RUN, CMD, and ENTRYPOINT.

---

# Docker Image Layers

Every instruction in a Dockerfile creates a new image layer.

Example:

```dockerfile
FROM nginx

COPY . /usr/share/nginx/html
```

Layer 1

```dockerfile
FROM nginx
```

Layer 2

```dockerfile
COPY . /usr/share/nginx/html
```

Each layer is stored separately.

If a layer has not changed, Docker can reuse it during future builds.

Benefits:

- Faster builds
- Less downloading
- Better storage efficiency

---

# Docker Build Cache

Docker remembers previously built layers.

Example:

```dockerfile
FROM nginx

COPY . /usr/share/nginx/html
```

If only index.html changes:

Docker reuses:

```dockerfile
FROM nginx
```

Docker rebuilds:

```dockerfile
COPY . /usr/share/nginx/html
```

This is called the Build Cache.

The Build Cache significantly reduces build time because unchanged layers do not need to be rebuilt.

---

# Build Context

Command:

```bash
docker build -t my-nginx:v3 .
```

Explanation:

docker

Docker command-line interface.

build

Build a Docker image.

-t

Assign a tag.

my-nginx:v3

Repository name and version.

.

Current directory.

The "." tells Docker to send everything in the current directory to the Docker Engine.

This collection of files is called the Build Context.

---

# .dockerignore

Purpose:

Prevent unnecessary files from becoming part of the Build Context.

Example:

```text
Dockerfile
README.md
.git
.DS_Store
```

Benefits:

- Smaller images
- Faster builds
- Less network traffic
- Better security
- Cleaner production images

---

# Hidden Files in Linux

Files beginning with a period are hidden.

Examples:

```text
.dockerignore
.gitignore
.bashrc
.profile
```

View hidden files:

```bash
ls -la
```

Explanation:

ls

List files.

-l

Long format.

-a

Display all files, including hidden files.

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

Benefits:

- Consistent deployments
- Easy rollbacks
- Predictable environments
- Easier troubleshooting

---

# Multi-Stage Builds

Purpose:

Separate the build environment from the production environment.

Example:

```dockerfile
FROM python:3.13 AS builder

WORKDIR /app

COPY . .

RUN pip install -r requirements.txt

FROM python:3.13-slim

WORKDIR /app

COPY --from=builder /app /app

CMD ["python", "app.py"]
```

Benefits:

- Smaller production images
- Faster deployments
- Improved security
- Removes unnecessary build tools

---

# Understanding Multi-Stage Builds

Stage 1

Builder Environment

Contains:

- Python
- pip
- Build tools
- Temporary files

Builds the application.

Stage 2

Production Environment

Starts with a clean image.

Only the finished application is copied from the Builder stage.

This keeps the production image as small and secure as possible.

---

# WORKDIR

Example:

```dockerfile
WORKDIR /app
```

Purpose:

Sets the working directory for all following instructions.

Equivalent to:

```bash
cd /app
```

inside the Docker image.

---

# COPY

Example:

```dockerfile
COPY . .
```

First "."

Current project directory.

Second "."

Current WORKDIR inside the image.

If:

```dockerfile
WORKDIR /app
```

then:

```dockerfile
COPY . .
```

means:

Copy everything from the project folder into /app.

---

# RUN

Purpose:

Execute commands while building the image.

Examples:

```dockerfile
RUN apt-get update

RUN pip install -r requirements.txt
```

Characteristics:

- Executes during docker build
- Installs software
- Configures the image
- Runs only once while building

Easy way to remember:

RUN builds the image.

---

# CMD

Purpose:

Defines the default command when a container starts.

Example:

```dockerfile
CMD ["python", "app.py"]
```

Characteristics:

- Executes during docker run
- Starts the application
- Can be overridden

Easy way to remember:

CMD starts the application.

---

# ENTRYPOINT

Purpose:

Defines the primary executable for the container.

Example:

```dockerfile
ENTRYPOINT ["python"]
```

ENTRYPOINT normally remains constant.

---

# ENTRYPOINT + CMD

Example:

```dockerfile
ENTRYPOINT ["python"]

CMD ["app.py"]
```

Running:

```bash
docker run my-image
```

Executes:

```bash
python app.py
```

Running:

```bash
docker run my-image weather.py
```

Executes:

```bash
python weather.py
```

ENTRYPOINT remains the same.

CMD provides the default arguments.

---

# RUN vs CMD

RUN

- During docker build
- Installs software
- Creates image layers

CMD

- During docker run
- Starts the application

Simple rule:

RUN builds.

CMD runs.

---

# Professional Docker Workflow

Edit source code

↓

docker build

↓

Docker Image

↓

docker run

↓

Container

↓

Deploy to Production

---

# Key Takeaways

- Every Dockerfile instruction creates a layer.
- Docker reuses unchanged layers using the Build Cache.
- The Build Context is everything Docker receives during a build.
- .dockerignore reduces unnecessary files in the Build Context.
- Containers are immutable and should be replaced, not edited.
- Multi-stage builds separate building from production.
- WORKDIR sets the working directory.
- COPY transfers files into the image.
- RUN executes while building.
- CMD executes when the container starts.
- ENTRYPOINT defines the primary executable.
- Professional Docker images are small, secure, and reproducible.