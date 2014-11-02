#!/bin/bash

set -e

USER=${ELASTICSEARCH_USER:-admin}
echo "=> Starting Elasticsearch with basic auth ..."
echo ${ELASTICSEARCH_PASS} | htpasswd -i -c /htpasswd ${USER}
echo "========================================================================"
echo "You can now connect to this Elasticsearch Server using:"
echo ""
echo "    curl ${USER}:${ELASTICSEARCH_PASS}@localhost:9200"
echo ""
echo "========================================================================"
exec service supervisor restart
