# 🚀 Dockerized Spring Boot + MySQL Stack

This repository demonstrates how to **containerize a Spring Boot backend application** with a **MySQL database** using Docker.  
It provides **two ways** to run the setup:
1. Using **user-defined Docker networks** manually.  
2. Using **Docker Compose** for a simpler, one-command setup.

---

## 🧩 Project Structure
dockerized-springboot-mysql-stack/ <br>
│<br>
├── backend-springboot/        # Spring Boot application source code <br>
├── mysql-data/                # MySQL data volume (auto-created at runtime) <br>
├── Dockerfile                 # Dockerfile for building the Spring Boot backend image <br>
├── docker-compose.yml         # Docker Compose configuration <br>
└── .gitignore 

---

## ⚙️ Prerequisites

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/)
- [Maven](https://maven.apache.org/) (for building the Spring Boot JAR)

---

## 🧱 Step 1 — Build the Spring Boot JAR

1. Navigate into the Spring Boot application directory:
   
   ```bash
   cd backend-springboot
   ```
2. Build the project:
   ```bash
   mvn clean package
   ```
4. After successful build, a JAR file will be created inside:\
   ```bash
   backend-springboot/target/
   ```
6. Copy that JAR file into the project’s root directory (next to the Dockerfile).
   ```bash
   cp path/to/springboot.jar path/to/dockerfile/directory
   ```
## 🐳 Step 2 — Build the Docker Image

Run the following command from the project root:
```bash
sudo docker build -t backend-springboot .
```
This creates a Docker image named backend-springboot.

---

### 🧠 Option 1 — Run Using User-Defined Docker Network
1. Create a Docker network:
```bash
sudo docker network create --driver bridge springboot-mysql-network
```
2. Start the MySQL container:
```bash
sudo docker run --name mysql-server \
  --network springboot-mysql-network \
  -v /absolute/path/to/mysql-data:/var/lib/mysql \
  -e MYSQL_ROOT_PASSWORD=root \
  -e MYSQL_DATABASE=springboot_mysql_database \
  -e MYSQL_USER=rcspell \
  -e MYSQL_PASSWORD=admin \
  -d mysql:8
```
3. Create a Docker network:
```bash
sudo docker run --name mysql-server \
  --network springboot-mysql-network \
  -v /absolute/path/to/mysql-data:/var/lib/mysql \
  -e MYSQL_ROOT_PASSWORD=root \
  -e MYSQL_DATABASE=springboot_mysql_database \
  -e MYSQL_USER=rcspell \
  -e MYSQL_PASSWORD=admin \
  -d mysql:8
```
4. ✅ Both containers are now running and linked together.
```bash
Access the application at:
👉 http://localhost:8080
```
---

### 🧠 Option 2 — Run Using Docker Compose (Simpler Way)

1. Ensure docker-compose.yml is in the project root.
2. Run the following command:
```bash
sudo docker compose up
```
3.Docker Compose will automatically:
- Create the network
- Start the MySQL and Spring Boot containers
- Connect them together
  
---
## Cleanup Commands
To stop and remove containers and networks:
```bash
sudo docker compose down
```
To remove all containers and volumes manually:
```bash
sudo docker rm -f $(docker ps -aq)
sudo docker volume prune -f
```

## 📝 Notes
- The MySQL data is stored persistently inside the mysql-data/ directory.

## 🙏 Credits
This project’s backend was adapted and customized from the open-source project by
@DanielPM1982 — springboot2-meeting-mng.
All credit for the original backend logic goes to the author.
