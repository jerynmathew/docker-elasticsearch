#!/bin/bash

echo "========================================================================"
echo "You can now connect to this Elasticsearch Server using:"
echo ""
echo "    curl localhost:9200"
echo ""
echo "========================================================================"
service supervisor restart
