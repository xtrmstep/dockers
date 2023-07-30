#!/bin/bash

airflow db upgrade

exec airflow webserver & airflow scheduler
