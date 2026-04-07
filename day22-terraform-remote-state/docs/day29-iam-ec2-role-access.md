# Day 29 – IAM Roles, PassRole, and EC2 Access

## Objective

Launch EC2 from a restricted IAM user and securely access S3 using an IAM role (no credentials).

## What I Built

* Created IAM user (engineer) with limited permissions
* Attached custom policy (dev-engineer-policy)
* Created IAM role (ec2-s3-read-only)
* Attached S3 read permissions to role
* Launched EC2 with role attached
* Connected via EC2 Instance Connect

## Key Concepts Learned

### 1. iam:PassRole

* Required for user to assign role to EC2
* Without it → launch fails

### 2. EC2 Instance Connect Permission

* Required: ec2-instance-connect:SendSSHPublicKey
* Needed for browser-based SSH

### 3. Role vs User

* User → launches resources
* Role → used by AWS services (EC2)

### 4. No Credentials Needed

* EC2 automatically receives temporary credentials from IAM role
* Verified using:

  ```bash
  aws s3 ls
  ```

## Problems Encountered

* Missing iam:PassRole permission
* Incorrect resource scoping
* Missing EC2 Instance Connect permission
* Confusion between root vs IAM user permissions

## Outcome

* Successfully launched EC2 from restricted user
* EC2 accessed S3 securely via IAM role
* Verified end-to-end IAM trust chain

## Key Learning

This demonstrates a core AWS security model:
EC2 → IAM Role → Policy → AWS Service (S3)

No hardcoded credentials required.
