Objective: zero-downtime deploy new web version
Baseline: TG healthy 2/2, ASG desired 2
Change: Launch Template v4 (Version 2 page)
Issue: Instance ID blank due to IMDSv2 tokens required
Fix: Launch Template v5 with IMDSv2 token workflow
Deploy: ASG Instance Refresh (min healthy 50%, warmup 60s)
Validation: ALB shows Version 2; refresh alternates instance IDs
Outcome: Successful rolling deploy, no downtime observed