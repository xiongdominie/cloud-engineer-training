# Day 61 – Docker Compose

## What is Docker Compose?

Docker Compose allows you to define and manage multiple Docker containers using a single YAML configuration file.

Instead of running multiple `docker run` commands, everything is defined in one file called `docker-compose.yml`.

Example:

docker compose up

starts the complete application.

---

## YAML

Docker Compose uses YAML.

Indentation is important.
Use spaces, not tabs.

---

## services

```yaml
services:
```

Defines all containers that belong to the application.

---

## image

```yaml
image: nginx
```

Tells Docker which image to use.

If the image does not exist locally, Docker downloads it automatically from Docker Hub.

---

## ports

```yaml
ports:
  - "8080:80"
```

8080 = Host (EC2)

80 = Container (Nginx)

Requests sent to port 8080 on the EC2 instance are forwarded to port 80 inside the container.

---

## Commands Learned

Start application

```bash
docker compose up
```

Start in background

```bash
docker compose up -d
```

Stop application

```bash
docker compose down
```

View running services

```bash
docker compose ps
```

View logs

```bash
docker compose logs
```

---

## Troubleshooting

Installed Docker Compose v2

```bash
sudo apt install docker-compose-v2 -y
```

Fixed typo:

Incorrect:

image: mginx

Correct:

image: nginx

Also learned Docker Compose must be run from the directory containing docker-compose.yml.

---

## Key Takeaways

- Docker Compose manages multiple containers.
- YAML defines the application.
- Port mapping connects the host to containers.
- docker compose up creates and starts services.
- docker compose down stops and removes services.
- docker compose up -d runs containers in the background.