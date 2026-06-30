# Day 59 – Docker Volumes (Persistent Storage)

## Objective

Learn how Docker volumes provide persistent storage that survives container deletion.

---

# What is a Docker Volume?

A Docker volume is a Docker-managed storage location that exists independently of containers.

Containers are temporary.

Volumes are persistent.

---

# Key Concepts

- Images are templates.
- Containers are disposable.
- Volumes store data outside the container.
- Deleting a container does not delete a volume.

---

# Commands Learned

## Create a volume

```bash
docker volume create my-volume
```

Creates a Docker-managed volume.

---

## List volumes

```bash
docker volume ls
```

Shows every Docker volume.

---

## Inspect a volume

```bash
docker volume inspect my-volume
```

Displays detailed information including:

- Name
- Driver
- Mountpoint

---

## Run a container using a volume

```bash
docker run -it -v my-volume:/practice ubuntu bash
```

Explanation:

- docker = Docker CLI
- run = Create and start container
- -i = Interactive mode
- -t = Terminal
- -v = Mount storage
- my-volume = Docker volume
- /practice = Directory inside the container
- ubuntu = Image
- bash = Start Bash shell

---

## Create a file

```bash
echo "Docker Volumes Save Data" > volume.txt
```

Creates the file if it doesn't already exist.

---

## Display file contents

```bash
cat volume.txt
```

---

## Remove a container

```bash
docker rm <container_id>
```

Deletes the container only.

The volume remains.

---

# Experiment

Created:

volume.txt

Deleted the container.

Created a new container using the same volume.

Verified:

```bash
cat volume.txt
```

The file still existed.

---

# Real-World Uses

- MySQL
- PostgreSQL
- MongoDB
- Uploaded files
- Application logs

---

# Summary

Docker volumes provide persistent storage.

Applications can be replaced without losing data.

Volumes are the standard solution for production databases.