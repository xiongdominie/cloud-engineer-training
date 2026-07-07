# Day 65 - Docker Bind Mounts

## Objective

Understand the difference between Docker Volumes and Bind Mounts.

---

## Create Project Folder

```bash
mkdir mywebsite

cd mywebsite
```

---

## Create Web Page

```bash
echo "<h1>Hello from Bind Mount</h1>" > index.html
```

---

## Run Nginx

```bash
docker run -d \
--name nginx-bind \
-p 8080:80 \
-v $(pwd):/usr/share/nginx/html \
nginx
```

---

## Explanation

- -d = detached mode
- --name = container name
- -p = port mapping
- -v = bind mount
- $(pwd) = current host directory
- /usr/share/nginx/html = nginx web folder

---

## Verify

```bash
docker ps
```

---

## Inspect

```bash
docker inspect nginx-bind
```

---

## Execute Command Inside Container

```bash
docker exec nginx-bind cat /usr/share/nginx/html/index.html
```

---

## Remove Container

```bash
docker rm -f nginx-bind
```

---

## Docker Volume vs Bind Mount

Docker Volume

- Managed by Docker
- Best for databases
- Persistent storage

Bind Mount

- Managed by host
- Best for development
- Live editing