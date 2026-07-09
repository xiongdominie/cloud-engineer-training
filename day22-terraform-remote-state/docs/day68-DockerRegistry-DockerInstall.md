# Day 68 – Docker Registry & Official Docker Installation

## Objectives

- Understand Docker Registries
- Learn the difference between Registry, Repository, and Tags
- Install Docker from Docker's official repository
- Understand Docker Engine components
- Learn Linux package repositories
- Verify Docker installation

---

## Topics Covered

- Docker Registry
- Docker Hub
- Amazon ECR overview
- Repository vs Registry
- Image Tags
- Push vs Pull
- Docker login
- Docker tag
- Docker push
- Docker pull

---

## Linux Commands Learned

```bash
sudo apt update
sudo apt install -y ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
docker --version
docker compose version
docker info
sudo systemctl status docker
sudo usermod -aG docker $USER
groups
docker run hello-world