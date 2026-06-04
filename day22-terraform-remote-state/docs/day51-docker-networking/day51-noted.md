# Day 51 - Docker Networking

## Docker Images Used

- hello-world
- nginx
- alpine

## Commands

### Verify Docker

```bash
docker --version
docker run hello-world
```

### Create Network

```bash
docker network create app-network
docker network ls
```

### Create Nginx Container

```bash
docker run -d --name web1 --network app-network nginx
```

### Create Alpine Test Container

```bash
docker run -it --name test1 --network app-network alpine sh
```

### Test Connectivity

```bash
wget -qO- http://web1
ping -c 4 web1
```

### Port Mapping

```bash
docker run -d --name web1 -p 8080:80 nginx
```

### Verify Port Mapping

```bash
curl http://localhost:8080
```

### Inspect Container

```bash
docker inspect web1
```

## Concepts Learned

- Docker Images
- Docker Containers
- Docker Networks
- Docker DNS
- Container Communication
- Port Mapping
- Docker Inspect