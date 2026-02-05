# Day 11 – CloudWatch CPU Alarm (EC2)

## Objective
Create and validate a CloudWatch alarm that monitors EC2 CPU utilization and evaluates correctly under load.

---

## EC2 Instance
- Region: us-east-1 (N. Virginia)
- Instance type: EC2 (Ubuntu)
- Metric namespace: AWS/EC2

---

## Alarm Configuration
- Alarm name: day11-ec2-cpu-alarm
- Metric: CPUUtilization
- Threshold: >= 60%
- Period: 1 minute
- Evaluation periods: 1 of 1
- Statistic: Average
- Actions: Enabled
- Alarm type: Metric alarm

---

## Validation Method
CPU load was intentionally generated on the EC2 instance using `stress-ng`.

### Command used:
```bash
stress-ng --cpu 2 --cpu-method matrixprod --timeout 180s
