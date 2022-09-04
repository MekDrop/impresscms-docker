#!/usr/bin/env sh

apk add --no-cache \
  nginx \
  nginx-mod-http-brotli \


mkdir -p /var/lib/nginx/cache/
chown www-data:www-data /var/lib/nginx/cache/