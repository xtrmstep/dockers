#!/bin/bash

# used to get value for AIRFLOW__WEBSERVER__SECRET_KEY
echo $RANDOM | md5sum | head -c 32; echo;