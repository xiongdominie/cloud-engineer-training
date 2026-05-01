# Day 40 — Auto Scaling Based on CPU (Target Tracking)

## 🎯 Objective
Implement dynamic scaling using an Auto Scaling Group (ASG) with a target tracking policy based on CPU utilization.

---

## 🧱 Architecture

User → ALB → Target Group → Auto Scaling Group → EC2 Instances

---

## ⚙️ Configuration Steps

### 1. Auto Scaling Group Setup
- Min capacity: 1  
- Desired capacity: 2  
- Max capacity: 3  
- Attached to Application Load Balancer  
- Health check type: ELB  

---

### 2. Scaling Policy (Target Tracking)
- Policy type: Target tracking  
- Metric: Average CPU Utilization  
- Target value: 50%  
- Instance warm-up: ~300 seconds (default)

---

## 🧪 Load Testing

Connected to EC2 instance via SSM and installed stress tool:

```bash
sudo dnf install -y stress-ng