# Day 13 — EC2 SSH Recovery Incident

## Symptoms
- SSH timeout
- Permission denied (publickey)
- Inconsistent SSH behavior

## Root Cause
- Security group SSH rule locked to stale public IP
- SSH troubleshooting initially masked by network-level block

## Resolution
- Temporarily opened SSH access
- Attached root volume to rescue instance
- Verified filesystem and user SSH configuration
- Restored correct permissions and ownership
- Reattached volume and rebooted instance
- Verified SSH persistence after reboot
- Removed rescue instance
- Locked SSH access back to trusted IP

## Outcome
- EC2 instance fully recovered
- SSH access stable and persistent
- No data loss