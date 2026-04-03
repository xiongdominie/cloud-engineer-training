# Terraform Modular ALB Project

This project provisions a simple AWS web application stack using Terraform with a modular structure.

This project demonstrates modular Terraform design, safe infrastructure updates, and real-world debugging of AWS dependency issues.

## What this project builds

- A custom VPC
- Two public subnets in different Availability Zones
- An Internet Gateway and public route table
- Security groups for ALB and EC2
- One EC2 instance running a web server
- One Application Load Balancer
- One target group and listener
- Target group attachment between ALB and EC2

## Project structure

```text
.
├── main.tf
├── networking.tf
├── security.tf
├── variables.tf
├── outputs.tf
├── environments/
│   ├── dev.tfvars
│   └── prod.tfvars
└── modules/
    ├── alb/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    └── ec2/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf

```

## How to test

After running `terraform apply`, copy the ALB DNS name from outputs and open it in your browser. You should see the EC2 web server response.

This confirms:
- ALB is routing traffic correctly
- Target group is healthy
- EC2 instance is reachable