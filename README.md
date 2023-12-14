# Repository README

## Overview

This repository contains a Docker Compose setup for orchestrating a multi-container Docker application. It includes services for MySQL, phpMyAdmin, Apache Spark (Master and Worker), MinIO, and Apache Airflow. This configuration is well-suited for data processing and analytics tasks, providing a robust and scalable platform for managing, storing, and processing large datasets.

## Services

### MySQL
- **Image**: `mysql:latest`
- **Purpose**: Database service.
- **Environment Variables**: Root password and database name.
- **Ports**: 3306
- **Volumes**: Data persistence in `./data/mysql-data`.

### phpMyAdmin
- **Image**: `phpmyadmin/phpmyadmin`
- **Purpose**: Web interface for MySQL database management.
- **Environment Variables**: Host and port configuration for MySQL.
- **Ports**: 8082
- **Dependencies**: Depends on the MySQL service.

### Spark Master
- **Build Context**: `./spark-master`
- **Purpose**: Master node for Apache Spark.
- **Environment Variables**: Spark mode set to master.
- **Ports**: 8080, 7077
- **Volumes**: Data persistence in `./data/spark-data`.

### Spark Worker
- **Build Context**: `./spark-master`
- **Purpose**: Worker node for Apache Spark.
- **Environment Variables**: Spark mode and master URL.
- **Dependencies**: Depends on the Spark Master service.
- **Volumes**: Application code in `../bdsp-extract-pipe/spark`.
- **Working Directory**: `/app`

### MinIO
- **Image**: `minio/minio:latest`
- **Purpose**: Object storage server.
- **Environment Variables**: Root user and password.
- **Ports**: 9000
- **Volumes**: Data persistence in `./data/minio-data`.
- **Command**: `server /data`

### Airflow Webserver
- **Build Context**: `./airflow`
- **Purpose**: Workflow management and scheduling.
- **Environment Variables**: Executor type, Spark connection, and database connection.
- **Ports**: 8081
- **Volumes**: DAGs in `../bdsp-extract-pipe/dags`, Spark code in `../bdsp-extract-pipe/spark`, and logs in `./logs/airflow`.
- **Dependencies**: Depends on MySQL and Spark Master services.

## Repository setup
Clone the repositories from [GitHub](https://github.com/dhbw-loerrach-wds22a)
1. [bdsp-setup](https://github.com/dhbw-loerrach-wds22a/bdsp-setup)
3. [bdsp-extract-pipe](https://github.com/dhbw-loerrach-wds22a/bdsp-extract-pipe)
4. [bdsp-services](https://github.com/dhbw-loerrach-wds22a/bdsp-services)
5. [bdsp-apps](https://github.com/dhbw-loerrach-wds22a/bdsp-apps)

Layout of the repositories:

Project folder
  - bdsp-setup
  - bdsp-extract-pipe
  - bdsp-services
### Usage

1. **Prerequisites**: Docker and Docker Compose must be installed on your system.
2. **Starting Services**: Run `docker-compose up` in the root directory of this repository.
3. **Accessing Services**: Use the specified ports to access each service (e.g., phpMyAdmin at `localhost:8082`).

## Customization

You can customize the configurations by modifying the `docker-compose.yml` file according to your requirements. This includes changing environment variables, ports, and volume mappings.

## Contributing

Contributions to improve or extend the functionality are welcome. Please submit pull requests with detailed descriptions of changes or enhancements.

## License

MIT
