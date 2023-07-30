#!/bin/bash

airflow users create -r Admin -u admin -f admin -l admin -p 12345 -e admin@mail123.com
airflow variables import /airflow-variables.json
airflow connections import /airflow-connections.json
