## Environment Constraints Encountered

During implementation, IAM permission boundaries prevented:

- SNS topic creation (KMS dependency restriction)
- CloudShell environment creation
- CloudWatch alarm creation

This reflects real enterprise least-privilege environments where monitoring configuration is restricted to platform teams.

Monitoring design and validation methodology were still implemented conceptually and tested via EC2 load simulation.
