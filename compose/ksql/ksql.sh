#!/bin/bash
export MIRRORMAKER_CONSUMER_GROUP_TAG=${HOSTNAME}
docker-compose -f compose-ksql.yml $1 $2