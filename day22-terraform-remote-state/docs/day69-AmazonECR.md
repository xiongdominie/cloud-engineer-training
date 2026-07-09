
---

# Day 69 README.md

````markdown
# Day 69 – Amazon Elastic Container Registry (ECR)

## Objectives

- Learn Amazon ECR
- Build Docker Images
- Authenticate Docker to AWS
- Push Images to Amazon ECR
- Pull Images from Amazon ECR
- Understand IAM Role authentication

---

## AWS Services

- Amazon ECR
- IAM Roles
- AWS CLI
- STS

---

## Commands Learned

```bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o awscliv2.zip

sudo apt install unzip

unzip awscliv2.zip

sudo ./aws/install

aws --version

aws sts get-caller-identity

aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com

mkdir hello-world

cd hello-world

nano Dockerfile

docker build -t hello-world:latest .

docker images

docker tag hello-world:latest ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com/hello-world:latest

docker push ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com/hello-world:latest

docker rmi hello-world:latest

docker rmi ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com/hello-world:latest

docker pull ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com/hello-world:latest

docker run --rm ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com/hello-world:latest