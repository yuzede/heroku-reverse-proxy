#!/bin/bash
service nginx start
bash -c "chmod +x extract_env.sh && bash extract_env.sh && sleep 1" && laravel-echo-server start