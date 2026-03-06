# Day 20 - Canary Deployments and Deployment Monitoring

## Objective
Today I learned how real cloud engineers reduce deployment risk by using canary deployments and CloudWatch alarms.

---

## Part 1 - Canary Deployment

### What is a Canary Deployment?
A canary deployment means sending only a small percentage of traffic to the new version of an application first, instead of sending all users at once.

Example used in this lab:

- 90% traffic -> BLUE target group (old stable version)
- 10% traffic -> GREEN target group (new version)

This allows engineers to test the new version safely.

If the new version has problems, only a small number of users are affected.

---

## Deployment Types Learned So Far

### 1. Rolling Deployment
A rolling deployment updates servers one at a time.

Simple meaning:
- Replace old servers gradually
- Keep the application running during updates
- Reduce downtime risk

Example:
- Update server A
- Wait until healthy
- Update server B
- Wait until healthy
- Continue until all are updated

### 2. Blue/Green Deployment
A blue/green deployment uses two separate environments.

Simple meaning:
- BLUE = old version
- GREEN = new version
- Traffic switches from one full environment to the other

Benefits:
- Fast cutover
- Easy rollback by switching traffic back

### 3. Canary Deployment
A canary deployment slowly introduces the new version to a small percentage of users.

Simple meaning:
- Most traffic stays on old version
- Small traffic goes to new version first
- Monitor closely before sending more users

Benefits:
- Limits blast radius
- Safer production testing
- Easier to detect problems early

---

## Part 2 - Configuring Canary Traffic in the ALB

### What I changed
I edited the Application Load Balancer listener rule so traffic was split between two target groups.

Target groups used:
- day16-tg = BLUE / old version
- day19-green-target-group = GREEN / new version

### Traffic weights configured
- day16-tg = 90
- day19-green-target-group = 10

This created a true canary deployment.

### What this means
- Most users continue going to the stable version
- A small number of users test the new version
- This reduces deployment risk

---

## Part 3 - Monitoring the New Deployment

After sending traffic to GREEN, I learned that engineers must monitor the new deployment for signs of failure.

### Important metrics discussed
- RequestCount
- HealthyHostCount
- TargetResponseTime
- HTTPCode_Target_4XX_Count
- HTTPCode_Target_5XX_Count

### Meaning of these metrics

#### RequestCount
Shows how many requests are reaching the target group.

#### HealthyHostCount
Shows how many targets are healthy.

#### TargetResponseTime
Shows how long the application takes to respond.

#### HTTPCode_Target_4XX_Count
Shows client-side request errors such as:
- 400 Bad Request
- 403 Forbidden
- 404 Not Found

#### HTTPCode_Target_5XX_Count
Shows server-side failures such as:
- 500 Internal Server Error
- 502 Bad Gateway
- 503 Service Unavailable

---

## Important CloudWatch Lesson
CloudWatch may not show a metric unless it has been generated at least once.

In this lab, the 5XX metric was not available yet because the deployment had not produced any server-side errors.

Because of that, I used the 4XX metric to practice the alarm workflow.

This is acceptable for the lab because the main goal was learning the monitoring and alert process.

---

## Part 4 - Creating a CloudWatch Alarm

### Metric selected
- HTTPCode_Target_4XX_Count

### Resource monitored
- day19-green-target-group

### Alarm condition configured
- Threshold type: Static
- Condition: Greater than 5
- Period: 1 minute

### Meaning
If the GREEN target group produces more than 5 request errors within 1 minute, CloudWatch will trigger an alarm.

---

## Part 5 - Alarm Notification Flow

The alarm was configured to use SNS for notifications.

### Flow
CloudWatch -> SNS -> sends alert notification

In a real company this could notify:
- Slack
- PagerDuty
- Email
- On-call engineer

---

## Alarm Created

### Alarm name
Green-Deployment-4XX-Alarm

### Alarm description
Triggers if GREEN target group produces more than 5 client errors in 1 minute during canary deployment.

---

## What I Accomplished Today in Simple Terms

Today I learned how to release a new version safely.

Instead of sending all users to the new version, I sent only 10% of traffic to the GREEN environment.

Then I configured CloudWatch to watch the GREEN target group for errors.

If too many errors happen in a short period of time, CloudWatch triggers an alarm so engineers know the deployment may be bad.

This is how real cloud engineers reduce the risk of production outages.

---

## Production Safety Loop

Deploy new version  
-> Send small traffic to new version  
-> Monitor metrics  
-> Alarm triggers if errors increase  
-> Engineers investigate and rollback if needed

---

## Why Day 20 Matters
This lab taught me how professional teams deploy software more safely in production.

I now understand these real-world concepts:
- Rolling deployment
- Blue/Green deployment
- Canary deployment
- Deployment monitoring
- CloudWatch alarms
- SNS alerting

This is real Cloud Engineer / DevOps work because production systems must be deployed carefully and monitored immediately after release.

---

## End-of-Day Summary
Day 20 focused on safe production deployment strategy.

I used my ALB to split traffic between old and new target groups, creating a canary deployment.

Then I created a CloudWatch alarm to monitor the GREEN deployment for errors.

This lab showed me how engineers combine deployment strategy and monitoring to protect production systems.