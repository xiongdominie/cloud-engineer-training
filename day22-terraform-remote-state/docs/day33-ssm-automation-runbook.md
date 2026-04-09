# Day 33 – SSM Automation Runbook

## Objective
Automate EC2 restart and verification using AWS Systems Manager Automation

## What I Built
- Runbook to stop EC2 instance
- Start EC2 instance
- Execute verification command using SSM

## Steps
1. aws:changeInstanceState (stop)
2. aws:changeInstanceState (start)
3. aws:runCommand (verify uptime)

## Issues Encountered
- Used wrong SSM document (PowerShell vs Shell)
- Missing instance target in runCommand step
- AWS versioning caused old runbook to execute

## Outcome
- Fully automated EC2 restart workflow
- Verified execution success across all steps

## Key Learning
SSM Automation requires explicit inputs per step and careful handling of document versions.