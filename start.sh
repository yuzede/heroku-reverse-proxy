#!/bin/bash
envsubst '${PORT} ${YUZE_API_HOST}' < nginx.conf.template > /etc/nginx/nginx.conf && service nginx start
bash -c "chmod +x extract_env.sh && bash extract_env.sh && sleep 1" && laravel-echo-server start
