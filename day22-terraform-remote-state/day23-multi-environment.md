# Day 23 – Multi-Environment Terraform

## Objective

Enable Terraform to support multiple environments (dev and prod) using variables instead of hardcoding values.

---

## What I Built

* Created `variables.tf` to define reusable inputs:

  * instance_type
  * environment
  * instance_name

* Replaced hardcoded values in `main.tf` with variables:

  * instance_type = var.instance_type
  * Name = var.instance_name
  * Environment = var.environment

* Created environment-specific variable files:

  * environments/dev.tfvars
  * environments/prod.tfvars

---

## Environment Configurations

### dev.tfvars

* instance_type = "t3.micro"
* environment = "dev"
* instance_name = "dee-ec2-dev"

### prod.tfvars

* instance_type = "t3.small"
* environment = "prod"
* instance_name = "dee-ec2-prod"

---

## Project Structure

day22-terraform-remote-state/
├── main.tf
├── variables.tf
├── backend.tf
├── environments/
│   ├── dev.tfvars
│   └── prod.tfvars

---

## Commands Used

### Dev

terraform plan -var-file="environments/dev.tfvars"

### Prod

terraform plan -var-fi
