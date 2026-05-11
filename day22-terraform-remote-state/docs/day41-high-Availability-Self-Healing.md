# Day 40 - High Availability and Self-Healing Infrastructure

## Completed Work

Built a highly available nginx web environment using:

- Application Load Balancer
- Target Group
- Launch Template
- EC2 User Data
- Auto Scaling Group
- Two healthy EC2 instances across multiple Availability Zones

## User Data Automation

The launch template automatically installed and started nginx on new EC2 instances.

## Failure Test 1: Application Failure

Stopped nginx on one instance:

```bash
sudo systemctl stop nginx