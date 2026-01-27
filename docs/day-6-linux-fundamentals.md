# Day 6 – Linux Fundamentals on AWS EC2

## Objective

Build real-world Linux fundamentals by working directly on an Ubuntu EC2 instance. Focus is on **navigation, users, permissions awareness, and basic networking identity** — not advanced administration.

---

## Environment

* **Cloud Provider:** AWS
* **Service:** EC2
* **OS:** Ubuntu 22.04 LTS
* **Login User:** `ubuntu`
* **Access Method:** SSH with key pair

---

## Lab A – Access & Identity

**Goal:** Understand how access to a Linux server works in AWS.

### Key Points

* SSH access using a `.pem` key
* Default login user is `ubuntu` (not root)
* Root login is disabled by default (security best practice)
* `sudo` provides temporary root privileges

### Commands Used

```bash
whoami
sudo whoami
id
```

---

## Lab B – Linux Filesystem Basics

**Goal:** Learn how Linux organizes files and how to navigate.

### Key Concepts

* `/` is the root of the filesystem
* `/home/ubuntu` is the user home directory
* Absolute vs relative paths

### Commands Used

```bash
pwd
ls
cd /
cd /home/ubuntu
```

---

## Lab C – Files & Directories

**Goal:** Create and navigate directories and files.

### Work Performed

* Created lab workspace
* Created nested directories
* Navigated using relative paths

### Commands Used

```bash
mkdir labs
cd labs
mkdir -p linux/day1 linux/day2
cd linux/day1
touch test.txt
```

---

## Lab D – Permissions (Read-Only Awareness)

**Goal:** Learn how to *read* permissions without changing them yet.

### Key Concepts

* `ls -l` shows permissions, owner, group
* `rwx` meaning (read, write, execute)
* Empty directories may show no output
* Silence ≠ error

### Commands Used

```bash
ls -l
```

Example output:

```
-rw-r--r-- 1 ubuntu ubuntu 0 Jan 27 test.txt
```

---

## Lab E – Process Awareness (Intro Only)

**Goal:** Understand that Linux runs background services.

* No service management performed
* Awareness only (no `systemctl` yet)

---

## Lab F – Networking Basics

**Goal:** Identify instance networking inside AWS.

### Key Concepts

* **Private IP:** Address of the instance inside the VPC
* **Default Gateway:** Router used to reach external networks
* Private IP ≠ Default Gateway

### Commands Used

```bash
ip a
ip route
```

### Observations

* Private IP example: `172.31.x.x`
* Default route example:

```
default via 172.31.0.1 dev ens5
```

---

## Final Day 6 Outcome

By the end of Day 6, I can:

* SSH into an EC2 Linux instance
* Navigate the Linux filesystem confidently
* Understand users and sudo at a basic level
* Create and inspect files and directories
* Identify private IP and default gateway

---

## Notes

* Day 6 is about **mental models**, not speed
* Advanced topics (NGINX, apt, services) belong to later days

✅ **Day 6 Complete**

