# Day 17 – Zero Downtime Rolling Deployment with IMDSv2 Fix

## Objective
Deploy a new application version safely using Launch Template versioning and Auto Scaling Instance Refresh while maintaining service availability.

---

## Environment
- Auto Scaling Group: day16-asg
- Launch Template: day16-web-lt
- Load Balancer: Application Load Balancer (ALB)
- Target Group: day16-tg
- Region: us-east-1

---

## Deployment Process

### 1. Created Launch Template Version 2
- Updated user data to modify nginx index page
- Triggered Instance Refresh
- Verified target group health
- Observed zero downtime behavior

### 2. Identified IMDSv2 Enforcement Issue
- Metadata call returned blank Instance ID
- Determined IMDSv2 required token-based authentication

### 3. Created Launch Template Version 3 (IMDSv2 Compliant)

Implemented secure metadata retrieval:

```bash
TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" \
  -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

INSTANCE_ID=$(curl -s \
  -H "X-aws-ec2-metadata-token: $TOKEN" \
  http://169.254.169.254/latest/meta-data/instance-id)