cat > README.md <<'EOF'
# Day 48–50: Docker, ECR, and Docker Networking

## Day 48 – Amazon ECR

- Created an Amazon ECR repository: dominic-nginx
- Fixed IAM permissions for:
  - engineer user
  - EC2 instance role
- Authenticated Docker to ECR
- Built a custom NGINX Docker image
- Tagged image for ECR
- Pushed image to ECR
- Removed local image
- Pulled image back from ECR

Key flow:

Dockerfile → Image → Tag → Push to ECR → Pull from ECR

Important commands:

aws sts get-caller-identity
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 509399624719.dkr.ecr.us-east-1.amazonaws.com
docker build -t dominic-nginx:v1 .
docker tag dominic-nginx:v1 509399624719.dkr.ecr.us-east-1.amazonaws.com/dominic-nginx:v1
docker push 509399624719.dkr.ecr.us-east-1.amazonaws.com/dominic-nginx:v1
docker pull 509399624719.dkr.ecr.us-east-1.amazonaws.com/dominic-nginx:v1

## Day 49 – Run Container From ECR

- Ran a container from the ECR image
- Used port mapping with `-p 80:80`
- Verified the app with curl

Important command:

docker run -d -p 80:80 --name dominic-web 509399624719.dkr.ecr.us-east-1.amazonaws.com/dominic-nginx:v1

Test:

curl localhost

Result:

Cloud Engineer Dominic - ECR Lab

## Day 50 – Docker Networking

- Learned one image can create many containers
- Created multiple containers from the same image
- Learned container IP addresses
- Learned default bridge network
- Created custom Docker network: dominic-net
- Proved containers can communicate by name using Docker DNS
- Used temporary curl container for testing

Important commands:

docker ps
docker ps -a
docker inspect dominic-web
docker network ls
docker network create dominic-net
docker run -d --name dominic-web3 --network dominic-net 509399624719.dkr.ecr.us-east-1.amazonaws.com/dominic-nginx:v1
docker run --rm --network dominic-net curlimages/curl curl dominic-web3

## Key Concepts

Dockerfile = instructions to build image

Image = template/artifact

Container = running application created from image

ECR = AWS-managed image registry

docker run = create a new container

docker start = start an existing container

docker stop = stop a running container

docker rm = delete a container

docker rmi = remove a local image or tag

-p 80:80 = map EC2 port 80 to container port 80

Custom Docker network = containers can find each other by name
EOF