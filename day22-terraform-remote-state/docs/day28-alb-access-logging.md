# Day 28 – ALB Access Logging

## Objective

Enable Application Load Balancer access logging to S3 for observability and audit purposes.

## What I Built

* Created S3 bucket for ALB logs
* Configured bucket policy to allow ALB service to write logs
* Updated Terraform ALB module to enable access_logs block
* Wired logging variables through module structure

## Key Terraform Concepts

* Module variable propagation (root → module)
* S3 bucket policies for AWS services
* ALB logging configuration

## Problems Encountered

* Bucket policy permissions initially incorrect
* Needed correct ALB service principal
* Terraform dependency ordering issues

## Outcome

* ALB successfully configured with access logging
* Logs delivered to S3 bucket
* Infrastructure deployed via Terraform

## Key Learning

Understanding how AWS services interact with S3 via service principals and policies is critical for real-world observability setups.
