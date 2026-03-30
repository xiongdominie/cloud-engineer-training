# Day 25 - Multi-Environment Setup

## Objective
Introduce environment-based configurations using variables and tfvars.

## What I implemented
- Created environments folder
- Added dev and prod tfvars files
- Used variables.tf to define reusable inputs
- Passed environment-specific values using -var-file

## What I learned
- tfvars files separate configuration from code
- Same infrastructure can be reused across environments
- Environment tagging is critical for identification

## Result
Able to deploy different configurations for dev and prod using same Terraform code.