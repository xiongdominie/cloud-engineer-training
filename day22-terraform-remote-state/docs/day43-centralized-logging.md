# Day 43 — Centralized Logging & Observability

## Objective

Learn how centralized logging works in AWS using:

- nginx
- Linux log files
- CloudWatch Agent
- CloudWatch Logs

---

# Architecture Overview

User Request
↓
nginx receives request
↓
nginx writes local logs
↓
CloudWatch Agent reads logs
↓
CloudWatch Agent uploads logs to AWS
↓
CloudWatch Logs stores logs centrally
↓
Engineers investigate logs during incidents

---

# Key Concepts Learned

## 1. Local Linux Logs

nginx stores logs locally on the EC2 instance.

### Access Log

```bash
/var/log/nginx/access.log
