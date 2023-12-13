# Use the official Airflow image as a parent image
FROM apache/airflow:latest-python3.11

# Install Java
USER root
RUN apt-get update && apt-get install -y openjdk-11-jdk
RUN apt-get update && apt-get install -y procps
# Install wget
RUN apt-get update && apt-get install -y wget

ENV SPARK_VERSION=3.5.0
ENV HADOOP_VERSION=3
ENV SPARK_HOME /usr/local/spark

# Spark submit binaries and jars (Spark binaries must be the same version of spark cluster)
RUN cd "/tmp" && \
        wget --no-verbose "https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz" && \
        tar -xvzf "spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz" && \
        mkdir -p "${SPARK_HOME}/bin" && \
        mkdir -p "${SPARK_HOME}/assembly/target/scala-2.12/jars" && \
        cp -a "spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}/bin/." "${SPARK_HOME}/bin/" && \
        cp -a "spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}/jars/." "${SPARK_HOME}/assembly/target/scala-2.12/jars/" && \
        rm "spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz"

# Install Hadoop AWS, AWS Java SDK JARs
RUN wget -P ${SPARK_HOME}/assembly/target/scala-2.12/jars/ https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/3.2.3/hadoop-aws-3.2.3.jar \
 && wget -P ${SPARK_HOME}/assembly/target/scala-2.12/jars/ https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-bundle/1.11.1032/aws-java-sdk-bundle-1.11.1032.jar \
 && wget -P ${SPARK_HOME}/assembly/target/scala-2.12/jars/ https://repo1.maven.org/maven2/com/mysql/mysql-connector-j/8.2.0/mysql-connector-j-8.2.0.jar



# Create SPARK_HOME env var
RUN export SPARK_HOME
ENV PATH $PATH:/usr/local/spark/bin
USER airflow
# Copy the requirements.txt file into the Docker image
COPY requirements.txt /tmp/

# Install Python packages from requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt



ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64
RUN export JAVA_HOME

# Install the pymysql package
RUN pip install pymysql

RUN pip install apache-airflow-providers-apache-spark
# Copy the entrypoint script
COPY entrypoint.sh ./entrypoint.sh

# Give execution rights on the entrypoint script
USER root
RUN chmod +x ./entrypoint.sh
USER airflow
# Set the entrypoint script to be executed
ENTRYPOINT ["./entrypoint.sh"]