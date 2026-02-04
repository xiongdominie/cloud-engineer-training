# Day 10 – Logs and Observability

## Objective
Understand how to inspect system, boot, and application logs on an EC2 instance.

## System Logs
- /var/log/syslog
- /var/log/auth.log
- journalctl
- dmesg

## AWS Boot Logs
- cloud-init.log
- Used to diagnose EC2 startup issues

## Application Logs (NGINX)
- access.log – records all HTTP requests
- error.log – records crashes and failures

## Live Monitoring
- Used `tail -f` to observe logs in real time
- Verified traffic by accessing EC2 from browser

## Network Debugging Insight
- Initial lack of logs was caused by missing HTTP (port 80) inbound rule
- Security Groups must allow traffic before logs can record requests

## Failure Simulation
- Stopped nginx service
- Verified outage via browser and service status
- Inspected logs
- Restarted service and confirmed recovery

## Key Takeaways
- Logs explain system behavior
- Observability prevents guessing
- Always verify network access before debugging applications
