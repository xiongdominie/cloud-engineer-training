# Day 19 — Blue/Green Deployment (ALB + Dual Target Groups)

## Goal
Deploy a new environment (GREEN) in parallel with the existing environment (BLUE), then switch production traffic instantly via ALB listener.

## Architecture
- ALB: day16-loadbalancer
- BLUE target group: day16-tg (previous production)
- GREEN target group: day19-green-target-group (new production)
- GREEN ASG: day19-green-asg (2 instances, multi-AZ)

## Steps Performed
1. Created GREEN target group (no manual instance registration).
2. Created GREEN Auto Scaling Group and attached it to the GREEN target group.
3. Verified GREEN targets became Healthy (2/2).
4. Switched ALB listener (HTTP:80) default action from BLUE → GREEN (100%).
5. Verified end-user traffic was served by two different instances by refreshing the ALB DNS endpoint.

## Verification Evidence
- ALB listener default action forwards to day19-green-target-group (100%).
- Target group day19-green-target-group shows 2 Healthy targets.
- Browser refresh shows alternating instance hostnames (load balancing proof).

## Rollback Plan
If issues occur, switch ALB listener default action back to BLUE target group (day16-tg) for immediate rollback.

## Notes / Lessons
- Keeping BLUE and GREEN fully separate enables near-instant rollback.
- Traffic switching is controlled entirely by the ALB listener.