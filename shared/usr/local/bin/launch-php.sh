<?php

dockerize \
  -template /etc/templates/php/conf.d/max_size.ini.tmpl:/etc/php/conf.d/max_size.ini \
  -template /etc/templates/php/php-fpm.d/status.conf.tmpl:/etc/php/php-fpm.d/status.conf \
  -template /etc/templates/php/php-fpm.d/www.conf.tmpl:/etc/php/php-fpm.d/www.conf \
  -stderr "$PHP_FPM_ERROR_LOG" \
  php-fpm