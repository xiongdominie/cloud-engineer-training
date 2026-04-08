# Day 31 — AWS Systems Manager (SSM) Run Command Automation

## Objective

Use AWS Systems Manager (SSM) Run Command to execute commands across multiple EC2 instances simultaneously, eliminating the need for manual login into each server.

---

## What is SSM Run Command?

SSM Run Command is a feature of AWS Systems Manager that allows remote execution of commands on one or many EC2 instances at the same time.

---

## Why Use Run Command Instead of SSH?

### Security Advantages:

* No need to open port 22
* No SSH keys required
* Access controlled via IAM roles
* Fully logged and auditable

### Operational Advantages:

* Execute commands across multiple instances at once
* Consistent execution across all servers
* Reduces manual work and human error
* Scales easily to large environments

---

## Architecture Overview

* Multiple EC2 instances running (SSM-managed)
* IAM role attached: `AmazonSSMManagedInstanceCore`
* Instances connected via Systems Manager
* Commands executed centrally via Run Command

---

## Environment Setup

### EC2 Instances:

* ec2-ssm-lab
* ec2-ssm-lab-2
* ec2-ssm-lab-3

### Configuration:

* AMI: Amazon Linux
* Instance type: t2.micro
* IAM role: ec2-ssm-role
* Key pair: None (SSM-only access)

---

## Steps Performed

### 1. Verified Instances in SSM

* Navigated to:

  * Systems Manager → Fleet Manager → Managed Nodes
* Confirmed all instances are registered and online

---

### 2. Executed Run Command

Navigated to:

* Systems Manager → Run Command → Run command

Selected:

* Document: AWS-RunShellScript

Target:

* Selected all EC2 instances manually

---

### 3. Commands Executed

```bash id="n2x68n"
sudo yum install -y nginx
sudo systemctl start nginx
sudo systemctl enable nginx
```

---

## Verification

* Command status: Success
* NGINX installed on all instances
* Service running on all instances
* No manual login required

---

## Key Learnings

* SSM Run Command enables centralized server management
* Eliminates need for SSH access at scale
* Ensures consistent execution across all instances
* Reduces operational complexity and risk

---

## Real-World Relevance

This simulates production scenarios such as:

* Deploying applications across multiple servers
* Applying patches or updates to all instances
* Running operational commands across infrastructure

---

## Screenshot Evidence

(Add screenshot showing Run Command success output across instances)
