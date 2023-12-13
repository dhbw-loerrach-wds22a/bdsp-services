#!/bin/bash
# Wait for the database to be up
# You can add a loop here to wait for MySQL or Postgres

# Initialize the database
airflow db init

airflow users  create --role Admin --username admin --email admin --firstname admin --lastname admin --password admin

# Add Spark connection
if ! airflow connections get spark > /dev/null 2>&1; then
    airflow connections add spark --conn-type Spark --conn-host spark://spark --conn-port 7077
    echo "Spark connection added."
else
    echo "Spark connection already exists."
fi



# Start Airflow webserver
airflow scheduler &

exec airflow webserver
