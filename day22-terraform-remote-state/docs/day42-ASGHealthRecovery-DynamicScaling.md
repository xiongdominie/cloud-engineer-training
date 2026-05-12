# Day 42 – Auto Scaling Health Recovery & Dynamic Scaling Validation

## Objectives
- Validate Auto Scaling scale-out behavior under CPU load
- Validate scale-in behavior after load reduction
- Test ALB application-level health checks
- Simulate nginx application failure
- Observe Auto Scaling Group recovery behavior

## Environment
- Application Load Balancer
- Target Group
- Launch Template
- Auto Scaling Group
- CloudWatch Target Tracking Policy
- Amazon Linux 2023 EC2 instances running nginx

## Dynamic Scaling Test
Generated CPU load using stress-ng to trigger Auto Scaling scale-out events.

Observed:
- CPU utilization increased
- CloudWatch alarms triggered scaling activity
- ASG launched additional EC2 instances automatically

After stopping the load:
- ASG eventually scaled back down to desired capacity
- Learned that scale-in behavior is intentionally slower and conservative

## Application Failure Test
Stopped nginx manually on one EC2 instance:

```bash
sudo systemctl stop nginx