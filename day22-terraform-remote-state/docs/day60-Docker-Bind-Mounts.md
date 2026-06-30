# Day 60 – Docker Bind Mounts

## Objective

Learn how bind mounts allow Docker containers to directly access files stored on the host machine.

---

# What is a Bind Mount?

A bind mount shares an existing folder on the host with a container.

Docker does not manage the storage.

The host does.

---

# Key Concepts

Volumes

- Managed by Docker
- Best for databases
- Stored under Docker's storage directory

Bind Mounts

- Managed by the user
- Best for source code
- Uses existing host directories

---

# Commands Learned

## Create project directory

```bash
mkdir bind-demo
```

---

## Enter directory

```bash
cd bind-demo
```

---

## Display current directory

```bash
pwd
```

Returns the current working directory.

---

## Create file

```bash
echo "Hello from EC2" > index.txt
```

Creates the file and writes text into it.

---

## View file

```bash
cat index.txt
```

---

## Start container with bind mount

```bash
docker run -it -v $(pwd):/app ubuntu bash
```

Explanation

- docker = Docker CLI
- run = Create container
- -i = Interactive
- -t = Terminal
- -v = Mount storage
- $(pwd) = Current host directory
- /app = Directory inside the container
- ubuntu = Image
- bash = Bash shell

---

## Verify bind mount

```bash
cd /app

ls

cat index.txt
```

The container reads the same file stored on the host.

---

# Linux Permission Lesson

Encountered:

Permission denied

Solved using:

```bash
sudo chown -R ssm-user:ssm-user bind-demo
```

Explanation

- chown = Change owner
- -R = Recursive
- ssm-user = Owner
- bind-demo = Directory

---

# Real-World Uses

- Software development
- Editing source code
- Configuration files
- Live code changes

---

# Volume vs Bind Mount

Docker Volume

- Docker manages storage
- Production databases
- Persistent application data

Bind Mount

- User manages storage
- Development
- Source code
- Configuration files

---

# Summary

Bind mounts allow Docker containers and the host machine to share the same files.

Changes made on either side are immediately visible.

This is the standard workflow used during software development.