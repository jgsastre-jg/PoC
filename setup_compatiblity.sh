#!/bin/sh
curl -s -X PUT http://localhost:8081/config \
    -H 'Accept: application/vnd.schemaregistry.v1+json, application/vnd.schemaregistry+json, application/json' \
    -H 'Content-Type: application/json' \
    --data-raw '{
        "compatibility": "FORWARD"
    }'
