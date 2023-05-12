#!/bin/bash
set -x

echo "script is running"
# Extract REDIS_URL components
REDIS_URL=${REDIS_URL}
REDIS_PASSWORD=$(echo "$REDIS_URL" | awk -F':' '{print $3}' | awk -F'@' '{print $1}')
REDIS_HOST=$(echo "$REDIS_URL" | awk -F'@' '{print $2}' | awk -F':' '{print $1}')
REDIS_PORT=$(echo "$REDIS_URL" | awk -F':' '{print $NF}')

# Create .env file
echo "LARAVEL_ECHO_SERVER_REDIS_PASSWORD=${REDIS_PASSWORD}" >> .env
echo "LARAVEL_ECHO_SERVER_REDIS_HOST=${REDIS_HOST}" >> .env
echo "LARAVEL_ECHO_SERVER_REDIS_PORT=${REDIS_PORT}" >> .env
echo "LARAVEL_ECHO_SERVER_AUTH_HOST=${AUTH_HOST}" >> .env
echo "LARAVEL_ECHO_SERVER_PORT=6001" >> .env
