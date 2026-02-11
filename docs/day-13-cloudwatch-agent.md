# Day 13 – CloudWatch Agent (EC2 Memory & Disk Metrics)

## Objective
Install and configure the Amazon CloudWatch Agent on an Ubuntu EC2 instance to publish
memory and disk utilization metrics to CloudWatch.

---

## Environment
- AWS EC2 (Ubuntu)
- Instance Type: t3.micro
- Region: us-east-1 (N. Virginia)

---

## Installation

### Install CloudWatch Agent (AWS package)
```bash
wget https://s3.amazonaws.com/amazoncloudwatch-agent/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb
sudo dpkg -i amazon-cloudwatch-agent.deb
