#!/bin/bash
export MIRRORMAKER_CONSUMER_GROUP_TAG=${HOSTNAME}_$(date +"%Y%m%d_%H%M%S")
docker-compose -f compose-kafka.yml $1 $2