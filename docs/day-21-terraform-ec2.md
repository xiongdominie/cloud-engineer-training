# Day 21 — Terraform EC2 Deployment (Infrastructure as Code)

## Objective
Learn Terraform basics by provisioning an EC2 instance using Infrastructure as Code and dynamically retrieving the latest Amazon Linux AMI.

---

# Tools Used

- Terraform
- AWS CLI
- AWS EC2
- Visual Studio Code
- Git / GitHub

---

# Terraform Configuration

File: `main.tf`

```
provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners = ["amazon"]

  filter {
    name = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "day21_example" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t3.micro"

  tags = {
    Name = "Day21-Terraform-Instance"
  }
}
```

---

# Terraform Workflow

### Initialize Terraform

```
terraform init
```

Downloads the AWS provider plugin.

---

### Plan Infrastructure

```
terraform plan
```

Terraform compares:

- Terraform configuration
- Terraform state
- Real AWS infrastructure

Output confirmed:

```
No changes. Your infrastructure matches the configuration.
```

This demonstrates Terraform **idempotency**.

---

### Apply Infrastructure

```
terraform apply
```

Result:

- Terraform queried AWS for the newest Amazon Linux AMI
- Terraform created a `t3.micro` EC2 instance
- Terraform stored the resource in the state file

State files created:

```
terraform.tfstate
terraform.tfstate.backup
```

---

# Terraform State Inspection

List tracked resources:

```
terraform state list
```

Output:

```
data.aws_ami.amazon_linux
aws_instance.day21_example
```

Inspect resource details:

```
terraform state show aws_instance.day21_example
```

Displayed attributes such as:

- instance ID
- AMI ID
- instance type
- availability zone
- tags
- networking details

---

# Verification in AWS

Console location:

```
EC2 → Instances
```

Instance confirmed running with tag:

```
Day21-Terraform-Instance
```

---

# Terraform Concepts Learned

### Infrastructure as Code (IaC)

Infrastructure is defined in version-controlled configuration files rather than manually created.

---

### Terraform Data Sources

```
data "aws_ami"
```

Allows Terraform to query existing AWS resources dynamically.

This avoids hardcoding AMI IDs.

---

### Terraform State

File:

```
terraform.tfstate
```

Tracks:

- resource IDs
- configuration attributes
- infrastructure relationships

Terraform uses this to determine infrastructure changes.

---

### Idempotency

Terraform can be run repeatedly without duplicating infrastructure.

```
terraform plan
```

Result:

```
No changes. Your infrastructure matches the configuration.
```

---

# Key Engineering Lesson

Terraform compares:

1. Desired state (code)
2. Recorded state (terraform.tfstate)
3. Real infrastructure (AWS)

This comparison allows Terraform to safely manage infrastructure changes.

---

# Outcome

Successfully deployed and verified an EC2 instance using Terraform Infrastructure as Code.

This completes the first Terraform infrastructure deployment workflow.
