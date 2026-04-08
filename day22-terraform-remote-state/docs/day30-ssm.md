# Day 30 — AWS Systems Manager (SSM) & Secure Instance Access

## Objective

Set up secure, production-style access to EC2 instances using AWS Systems Manager (SSM) instead of SSH, and perform remote system administration tasks.

---

## What is SSM?

AWS Systems Manager (SSM) is a service that allows secure management of EC2 instances without requiring SSH access, key pairs, or open inbound ports.

---

## Why SSM instead of SSH?

### Security Advantages:

* No open port 22 (reduces attack surface)
* No SSH key management
* Access controlled via IAM roles
* Full audit logging of sessions

### Operational Advantages:

* Browser-based access (no local terminal needed)
* Works across multiple instances
* Easier automation and scaling
* Centralized control via AWS

---

## Architecture Overview

* EC2 instance launched with IAM role
* IAM role attached: `AmazonSSMManagedInstanceCore`
* SSM Agent (preinstalled on Amazon Linux)
* Connection via Session Manager (no SSH)

---

## Steps Performed

### 1. Created IAM Role for EC2

* Service: EC2
* Policy attached:

  * AmazonSSMManagedInstanceCore
* Role name:

  * ec2-ssm-role

---

### 2. Launched EC2 Instance

* Name: ec2-ssm-lab
* AMI: Amazon Linux
* Instance type: t2.micro
* Key pair: **None (SSM only)**
* IAM Role attached: ec2-ssm-role
* Public IP enabled

---

### 3. Verified SSM Connectivity

* Navigated to:

  * Systems Manager → Fleet Manager → Managed Nodes
* Confirmed instance appears as managed

---

### 4. Connected via Session Manager

* EC2 → Connect → Session Manager
* Successfully accessed instance via browser terminal

---

## Commands Executed

### System Checks

```bash
whoami
uname -a
df -h
free -m
```

### Install and Run NGINX

```bash
sudo yum update -y
sudo yum install -y nginx
sudo systemctl start nginx
sudo systemctl status nginx
```

---

## Verification

* NGINX installed successfully
* Service status:

  * active (running)
* No SSH key used
* No inbound ports opened

---

## Key Learnings

* IAM roles provide secure permissions to EC2
* SSM replaces SSH for secure access
* Session Manager enables browser-based terminal
* Modern cloud environments avoid SSH entirely

---

## Real-World Relevance

This setup reflects modern production environments where:

* Security is enforced via IAM, not keys
* Infrastructure is managed centrally
* Engineers access systems without exposing ports

---

## Screenshot Evidence

(Add your Session Manager + nginx running screenshot here)
