# Day 12 – CloudWatch Dashboard (EC2 Ops View)

## Objective
Create a single-pane-of-glass CloudWatch dashboard to monitor EC2 operational health.

---

## Environment
- AWS Region: us-east-1 (N. Virginia)
- Service: Amazon EC2
- Monitoring: Amazon CloudWatch
- Dashboard name: day12-ec2-ops-dashboard

---

## Dashboard Widgets
1. CPUUtilization (EC2 – Per-Instance Metrics)
2. NetworkIn (EC2 – Per-Instance Metrics)
3. NetworkOut (EC2 – Per-Instance Metrics)
4. Disk activity (EBS – Per-Volume Metrics)

---

## Validation
Dashboard metrics were validated by generating CPU load on the EC2 instance.

### Command executed:
```bash
stress-ng --cpu 2 --cpu-method matrixprod --timeout 60s
