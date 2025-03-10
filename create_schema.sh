#!/bin/sh
TMPFILE=$(mktemp)
jq -Rs '{schemaType: "PROTOBUF", schema: .}' message.proto > $TMPFILE
curl -s -X POST http://localhost:8081/subjects/acme/versions \
    -H 'Accept: application/vnd.schemaregistry.v1+json, application/vnd.schemaregistry+json, application/json' \
    -H 'Content-Type: application/json' \
    --data @$TMPFILE

rm $TMPFILE
