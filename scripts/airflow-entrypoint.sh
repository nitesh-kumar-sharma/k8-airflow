#!/bin/bash

initial-setup.sh

chmod 777 -R /usr/local/airflow/

case "${NODE}" in
  "scheduler")
    airflow scheduler
    ;;
  "webserver")
    airflow webserver
    ;;
  "worker")
    airflow worker
    ;;
  *)
    echo "successfully setup airflow env without any service, as service not selected"
    ;;
esac
