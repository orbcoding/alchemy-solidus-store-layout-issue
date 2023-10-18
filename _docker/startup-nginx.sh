#!/bin/bash
envsubst '$RAILS_ROOT $ORB_CURRENT_ENV $ORB_APP_NAME $ORB_APP_DOMAINS' < /tmp/docker.nginx > /etc/nginx/conf.d/default.conf && cat /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'
