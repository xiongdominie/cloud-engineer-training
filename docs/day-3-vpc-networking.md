# Day 3 – AWS VPC & Networking

> Goal: Build AWS networking the real (production) way — no defaults, no shortcuts  
> Region: us-east-2 (Ohio)  
> Identity used: IAM user (engineer)

---

## 1. VPC (Virtual Private Cloud)

### What it is (simple)
A VPC is my **own private network** inside AWS.  
Nothing can communicate in or out unless I explicitly allow it.

### What I created
VPC name:prod-vpc
CIDR: 10.0.0.0/16


### Key takeaways
- Completely isolated by default
- No internet access initially
- This is the security foundation of AWS

---

## 2. Subnets

### What they are
Subnets are **smaller network segments** inside a VPC.

### What I created
public-subnet-1a -> 10.0.1.0/24
private-subnet-1a -> 10.0.2.0/24
Availability Zone: us-east-2a


### Key takeaways
- Subnets are NOT public or private by name
- Routing determines everything

---

## 3. Internet Gateway (IGW)

### What it is
The Internet Gateway is the **door between my VPC and the public internet**.

### What I created
Internet Gateway: prod-igw
Attached to: prod-vpc


### Key takeaways
- IGW alone does nothing
- It only works if routing points to it

---

## 4. Route Tables

### What they are
Route tables are **traffic rules** that tell AWS where packets should go.

### Public route table
Route table name: public-rt
Route added: 0.0.0.0/0 -> prod-igw


### Meaning
- 0.0.0.0/0 = any destination
- This allows traffic to leave the VPC to the internet

---

## 5. Route Table Associations

### What I did
public-rt -> associated with public-subnet-1a
main-rt -> used by private-subnet-1a


### Result
- public-subnet-1a = PUBLIC
- private-subnet-1a = PRIVATE

### Critical rule
> A subnet is public ONLY if its route table sends 0.0.0.0/0 to an Internet Gateway.

---

## 6. Security Groups

### What they are
Security groups are **instance-level firewalls**.

### Test configuration
Inbound:
HTTP (TCP 80) from 0.0.0.0/0
Outbound:
All traffic allowed (default)


### Key takeaways
- Security groups do NOT make subnets public
- They only control traffic to/from instances

---

## 7. IAM (Identity and Access Management)

### Root vs Engineer
- Root = account owner (full power)
- Engineer = IAM user with limited permissions

### What the engineer could do
- Create VPCs
- Create subnets
- Attach Internet Gateway
- Create route tables
- Create security groups

### What the engineer could NOT do
- Launch EC2 instances
- Create key pairs

---


## 8. RunInstances Permission

### Definition
RunInstances=permission to START an EC2 server


### What happened
- EC2 launch failed
- Error: ec2:RunInstances not authorized

### Meaning
- Networking was correct
- IAM blocked execution
- This is normal enterprise AWS behavior

---

## Final Mental Model (Memorize)

> Public subnet = route table with 0.0.0.0/0 -> Internet Gateway

IAM controls **who can press buttons**.  
Networking controls **how traffic flows**.

---

## Day 3 Status

✔ Custom VPC created  
✔ Public and private subnets built  
✔ Internet Gateway attached  
✔ Routing configured correctly  
✔ IAM permission boundaries understood  

**Day 3 COMPLETE**



