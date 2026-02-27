## Day 16 — Application Load Balancer + Auto Scaling (Self-Healing Architecture)

### Objective
Design and deploy a highly available, self-healing web tier using AWS-native services, ensuring that:
- Instances are launched automatically
- Unhealthy instances are replaced without manual intervention
- Traffic is distributed across multiple Availability Zones
- The system continues operating despite instance or AZ failure

---

### What I Built

I implemented a complete self-healing architecture composed of:

- **Launch Template** (`day16-web-lt`)
  - Defined immutable EC2 configuration
  - Included user data to automatically install Apache and serve a health page
  - Ensured every instance launched is identical and reproducible

- **Target Group** (`day16-tg`)
  - Protocol: HTTP (port 80)
  - Health check path: `/`
  - Used by the Application Load Balancer to determine instance health
  - Instances are registered automatically by Auto Scaling (no manual registration)

- **Application Load Balancer** (`day16-loadbalancer`)
  - Internet-facing ALB
  - Listener on HTTP :80
  - Default action forwards traffic to `day16-tg`
  - Deployed across two public subnets in different Availability Zones
  - Uses its own security group allowing inbound HTTP traffic

- **Auto Scaling Group** (`day16-asg`)
  - Launches instances using the launch template
  - Desired capacity: 2
  - Min: 1, Max: 3
  - Spans two Availability Zones for high availability
  - Attached to the ALB target group
  - Elastic Load Balancing health checks enabled
  - Automatically replaces unhealthy or terminated instances

---

### Key Configuration Decisions

- Enabled **ELB health checks** so Auto Scaling replaces instances based on application health, not just EC2 status
- Avoided manual target registration to preserve full automation
- Used immutable infrastructure (Launch Template) instead of modifying instances
- Distributed instances across multiple AZs to tolerate zone failure
- Verified that security groups allow ALB → EC2 traffic on port 80

---

### Verification & Results

- Auto Scaling Group successfully launched **two EC2 instances**
- Instances registered automatically into the target group
- Target group health transitioned from `initial` → `healthy`
- Both instances showed **Healthy**
- Accessing the ALB DNS returned:
  `Healthy from <hostname>`
- Refreshing the page rotated responses between instances, confirming load balancing
- Architecture continued functioning without manual intervention

---

### Outcome

This deployment demonstrates a production-grade, self-healing AWS architecture:
- No SSH required for recovery
- No manual scaling or registration
- Automatic instance replacement
- High availability across multiple Availability Zones

This mirrors real-world cloud engineering practices used in production environments.

