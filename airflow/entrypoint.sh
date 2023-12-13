#!/bin/bash
# Wait for the database to be up
# You can add a loop here to wait for MySQL or Postgres

# Initialize the database
airflow db init

airflow users  create --role Admin --username admin --email admin --firstname admin --lastname admin --password admin
# Start Airflow webserver

airflow scheduler &

exec airflow webserver
