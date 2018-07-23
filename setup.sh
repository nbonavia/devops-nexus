#!/bin/bash

set -e
mkdir -p ./nexus-data

if [ ! -f ./ssl/local.jks ]; then
    ./ssl/localhost.sh
fi

if [ ! -f ./ssl/prod.jks ]; then
    ./ssl/prod.sh
fi

source .env
sed -i -e "/application-port=/ s/=.*/=${HTTP_PORT}/" nexus.properties
sed -i -e "/application-port-ssl=/ s/=.*/=${HTTPS_PORT}/" nexus.properties
docker-compose down
docker-compose up -d