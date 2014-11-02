#!/bin/bash

set -e

echo "========================================================================"
echo "You can now connect to this Elasticsearch Server using:"
echo ""
echo "    curl localhost:9200"
echo ""
echo "========================================================================"
exec service supervisor restart
