# Day 39 – Auto Scaling & Self-Healing Architecture

## Objective
Build and validate a fully automated, self-healing AWS architecture using Application Load Balancer (ALB), Target Groups, Launch Templates, and Auto Scaling Groups (ASG).

---

## Architecture Overview

Internet → ALB → Target Group → Auto Scaling Group → EC2 Instances

---

## Components

### 1. Application Load Balancer (ALB)
- Internet-facing
- Listener: HTTP (Port 80)
- Routes traffic to Target Group
- Configured across multiple Availability Zones

---

### 2. Target Group
- Protocol: HTTP
- Port: 80
- Health Check Path: /
- Monitors EC2 instance health

---

### 3. EC2 Instances
- Amazon Linux
- Nginx installed via user data
- Serve dynamic page with instance ID

---

### 4. Launch Template
- AMI: Amazon Linux
- Instance type: t3.micro
- Security group: EC2 web SG (port 80 open)
- IAM instance profile: enabled (for SSM + AWS access)
- No subnet or Availability Zone defined

#### User Data Script

```bash
#!/bin/bash
dnf update -y
dnf install -y nginx

TOKEN=$(curl -s -X PUT "http://169.254.169.254/latest/api/token" \
-H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

INSTANCE_ID=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" \
http://169.254.169.254/latest/meta-data/instance-id)

echo "<h1>Hello from $INSTANCE_ID</h1>" > /usr/share/nginx/html/index.html

systemctl enable nginx
systemctl restart nginx