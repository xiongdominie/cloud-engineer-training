# Day 24 - Terraform Modularization

## Objective
Refactor Terraform configuration into reusable modules for better structure and scalability.

## What I implemented
- Created module structure under modules/ec2
- Moved EC2 resource into module
- Defined input variables for AMI, instance type, and tags
- Connected root module to EC2 module

## What I learned
- Modules make Terraform reusable and cleaner
- Separation of concerns improves maintainability
- Inputs and outputs control module behavior

## Result
Terraform project now uses modular structure instead of a flat configuration.