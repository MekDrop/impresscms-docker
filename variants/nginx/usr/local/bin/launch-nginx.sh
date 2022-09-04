#!/usr/bin/env sh

dockerize \
  -template /etc/templates/nginx/nginx.conf.tmpl:/etc/nginx/nginx.conf \
  -template /etc/templates/nginx/http.d/default.conf.tmpl:/etc/nginx/http.d/default.conf \
  -stderr "$NGINX_ERROR_LOG" \
  nginx