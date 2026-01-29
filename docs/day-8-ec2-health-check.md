# Day 8 — EC2 Health Check Script + Artifact Capture

## Objective
Simulate real cloud engineer operational workflow:
- Run server diagnostics
- Capture output artifact
- Securely transfer artifact off server
- Store artifact in Git for audit proof

---

## Environment
Platform: AWS EC2 (Ubuntu Linux)  
Access Method: SSH using PEM key  
Local System: macOS  
Version Control: Git + GitHub  

---

## Work Completed

### 1. SSH Configuration
Configured SSH alias for EC2 access using:
- ~/.ssh/config
- IdentityFile PEM key
- Host alias for simplified login

---

### 2. Health Check Script Creation
Created Bash script:

File: ops/day8/healthcheck.sh


Script collects:
- Timestamp
- Hostname
- Uptime
- Memory usage
- Disk usage
- Top CPU processes

---

### 3. Script Execution Permissions
Command:
./healthcheck.sh > health_output.txt


Purpose:
Redirect runtime diagnostics into persistent artifact file.

---

### 5. Secure File Transfer (EC2 → Mac)
Used SCP:

Purpose:
Redirect runtime diagnostics into persistent artifact file.

---

### 5. Secure File Transfer (EC2 → Mac)
Used SCP:
scp -i ~/.ssh/cloud-engineer-lab-key.pem ubuntu@<EC2-IP>:~/ops/day8/health_output.txt .


Purpose:
Securely download server diagnostic artifact.

---

### 6. Git Artifact Storage
Moved artifact into repo and committed:
git add health_output.txt
git commit -m "Day 8: EC2 health check output artifact"
git push


Purpose:
Create permanent audit trail of server state.

---

### 7. Repo Hygiene
Added macOS system file exclusion:
.DS_Store → .gitignore


Purpose:
Prevent non-operational files from polluting repo history.

---

## Real World Skills Demonstrated
- Linux permissions management
- Bash scripting
- SSH + key authentication
- Secure file transfer
- Artifact capture for incident response
- Git version control workflow
- Repo hygiene practices

---

## Operational Value
This workflow mirrors real production tasks:
- Incident response data capture
- Compliance evidence storage
- Operational runbook execution
- Audit traceability

---

## Next Steps
Planned:
- Automate script execution using cron
- Add timestamped artifact naming
- Implement artifact rotation policy



