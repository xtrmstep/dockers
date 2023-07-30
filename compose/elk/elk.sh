#!/bin/bash
# docker volume create elasticsearch_data
docker-compose -f compose-elk.yml $1 $2
# curl -X PUT "localhost:9200/test_index" -H 'Content-Type: application/json' -d'{"mappings": {"properties": {"timestamp": {"type": "date"}}}}'
