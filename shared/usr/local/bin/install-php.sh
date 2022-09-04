#!/usr/bin/env sh

curl https://raw.githubusercontent.com/renatomefi/php-fpm-healthcheck/master/php-fpm-healthcheck \
     --output /usr/local/bin/php-fpm-healthcheck.sh
chmod +x /usr/local/bin/php-fpm-healthcheck.sh

apk add --no-cache \
  composer \
  fcgi \
  php-fpm \
  php-json \
  php-pdo \
  php-gd \
  php-curl \
  php-mbstring \
  php-session \
  php-ctype \
  php-fileinfo \
  php-gettext \
  php-iconv \
  php-opcache \
  php-pcntl \
  php-pdo_mysql \
  php-phar \
  php-posix \
  php-cli

mkdir -p /run/php-fpm/
chown www-data:www-data /run/php-fpm/
ln -s $(realpath /etc/php*) /etc/php