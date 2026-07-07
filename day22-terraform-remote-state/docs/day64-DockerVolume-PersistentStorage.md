# Day 64 - Docker Volumes (Persistent Storage)

## Objective

Learn how Docker volumes provide persistent storage that survives container removal.

---

## Docker Installation

```bash
sudo apt update
sudo apt install docker.io -y
docker --version
docker info
```

---

## List Images

```bash
docker images
```

Shows all downloaded Docker images.

---

## List Containers

Running containers:

```bash
docker ps
```

All containers:

```bash
docker ps -a
```

---

## List Docker Volumes

```bash
docker volume ls
```

Lists all Docker volumes.

---

## Create a Docker Volume

```bash
docker volume create mydata
```

Creates a Docker-managed volume named **mydata**.

---

## Inspect a Volume

```bash
docker volume inspect mydata
```

Displays:

- Volume name
- Driver
- Mountpoint

---

## Mount a Volume

```bash
docker run -it -v mydata:/data ubuntu bash
```

Explanation:

- run = create container
- -it = interactive terminal
- -v = mount volume
- mydata = Docker volume
- /data = folder inside container

---

## Create a File

```bash
cd /data

echo "Hello Cloud Engineer" > file.txt
```

---

## Verify

```bash
ls

cat file.txt
```

---

## Exit

```bash
exit
```

---

## Start Another Container

```bash
docker run -it -v mydata:/data ubuntu bash

cd /data

ls

cat file.txt
```

The file still exists because Docker volumes provide persistent storage.

---

## Key Concepts

- Containers are temporary.
- Docker volumes preserve data.
- Databases should use Docker volumes.