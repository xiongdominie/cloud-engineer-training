# Day 7 – Linux Ops Fundamentals (AWS EC2)

## Environment
- Platform: AWS EC2
- Operating System: Ubuntu Linux
- Access Method: SSH
- User Context: Regular user (ubuntu), non-root

## Objective
Practice real-world Linux operational tasks including directory structure creation,
file management, permission control, and log handling on a cloud-based Linux server.

## Tasks Completed

### 1. Environment Verification
- Verified current user, working directory, and host
- Confirmed work was performed as a non-root user

Commands used:
- whoami
- pwd
- hostname

### 2. Operations Directory Structure
- Created a structured operations directory to simulate real server organization
- Established separate directories for configuration, logs, and backups

Commands used:
- mkdir -p ~/ops/day7/{config,logs,backup}
- cd ~/ops/day7
- ls -R

### 3. File Creation
- Created example configuration, log, and backup files
- Verified file ownership and default permissions

Files created:
- config/app.conf
- logs/app.log
- backup/app.bak

Commands used:
- touch
- ls -l

### 4. File Permissions (Least Privilege)
- Restricted access to the configuration file so only the owner can read/write
- Verified permission changes

Command used:
- chmod 600 config/app.conf

Verification:
- ls -l config/app.conf

### 5. Logging
- Wrote a timestamped log entry
- Verified log contents

Commands used:
- echo "Day 7 initialized at $(date)" >> logs/app.log
- cat logs/app.log

## Key Takeaways
- Always verify user and location before making changes
- Use structured directories for operational clarity
- Apply least-privilege permissions to sensitive files
- Logs are essential for troubleshooting and system visibility
- Work should be performed as a regular user, using sudo only when required

## Status
Day 7 completed successfully with all tasks executed and verified on a live EC2 instance.
