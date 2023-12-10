# Services Repository

## Description
This repository contains a multi-container Docker application that includes MySQL, MongoDB, Redis, PHPMyAdmin, a FastAPI backend, and a React frontend. It's designed to provide a comprehensive development environment for web applications.

## Components
- **MySQL**: A relational database management system.
- **PHPMyAdmin**: A free and open-source administration tool for MySQL and MariaDB.
- **Spark-Master**: The central component of Apache Spark that manages resource allocation and task scheduling across the Spark cluster.
- **Spark-Worker**: A node in a Spark cluster that executes tasks assigned by the Spark Master, handling data processing and computation.
- **Minio**: An open-source, high-performance object storage server, compatible with Amazon S3, designed for storing unstructured data like photos, videos, and backups.

## Setup and Installation

### Prerequisites
- Docker and Docker Compose installed on your machine.


### Repository setup
Clone the repositories from [GitHub](https://github.com/dhbw-loerrach-wds22a)
1. bdsp-setup
3. bdsp-extract-pipe
4. bdsp-services

Layout of the repositories:

![Alt text](./img/repository_layout.png "Optional title")
### Installation Steps
1. Clone the repository to your local machine.
2. Navigate to the directory containing `docker-compose.yml`.
3. Run the following command to build the projects. keep in mind that 4 repositories have to be in place. 
   ```bash
   docker-compose build

4. Run the following command to start all services:
   ```bash
   docker-compose up -d
5. To stop the services, use:
    ```bash
    docker-compose down
   
## Accessing the Services

- **MySQL** is accessible on port `3306`. Default root password is `mypassword`.
- **PHPMyAdmin** can be accessed at [http://localhost:8080](http://localhost:8080).

## Data Persistence
- MySQL data is persisted in `./data/mysql-data`.

## Usage
- Use PHPMyAdmin to manage your MySQL databases.

## License

[MIT](LICENSE)
