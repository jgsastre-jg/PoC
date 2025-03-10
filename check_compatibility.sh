#!/bin/sh
TMPFILE=$(mktemp)
jq -Rs '{schemaType: "PROTOBUF", schema: .}' message_v2-.proto > $TMPFILE
curl -s -X POST http://localhost:8081/compatibility/subjects/acme/versions/1 \
    -H 'Accept: application/vnd.schemaregistry.v1+json, application/vnd.schemaregistry+json, application/json' \
    -H 'Content-Type: application/json' \
    --data @$TMPFILE

rm $TMPFILE
