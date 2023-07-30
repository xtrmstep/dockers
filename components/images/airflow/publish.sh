#!/bin/bash

DOCKER_IMAGE_TAG=$(date +"%Y%m%d_%H%M%S")
DOCKER_IMAGE=di-airflow:$DOCKER_IMAGE_TAG

docker build --no-cache --force-rm -t $DOCKER_IMAGE .
docker image tag $DOCKER_IMAGE main-harbor.btigroup.io/datainsights-docker/$DOCKER_IMAGE
docker push main-harbor.btigroup.io/datainsights-docker/$DOCKER_IMAGE