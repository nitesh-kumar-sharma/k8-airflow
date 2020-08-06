#!/bin/bash

initial-setup.sh

export \
  AIRFLOW__CORE__EXECUTOR="KubernetesExecutor"\
  AIRFLOW_HOME="/usr/local/airflow" \
  AIRFLOW__CORE__DAGS_FOLDER="/usr/local/airflow/dags" \
  DAGS_FOLDER="/usr/local/airflow/dags"


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
