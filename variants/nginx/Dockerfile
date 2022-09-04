####################################################################
# BASE image                                                       #
####################################################################
FROM powerman/dockerize:latest AS base

ENV PHP_FPM_POOLS=2 \
    PHP_FPM_MAX_CHILDREN=5 \
    PHP_FPM_MIN_SPARE_SERVERS=5 \
    PHP_FPM_MAX_SPARE_SERVERS=10 \
    PHP_FPM_MAX_REQUESTS=1000 \
    PHP_FPM_ERROR_LOG=/dev/stderr \
    PHP_FPM_LOG_ERRORS=on \
    PHP_FPM_DISPLAY_ERRORS=off \
    PHP_FPM_EXPOSE_PHP=off \
    UPLOAD_MAX_FILESIZE=15M \
    POST_MAX_SIZE=15M \
    WEBSITES=localhost \
    NGINX_ERROR_LOG=/var/log/nginx/error.log \
    NGINX_ACCESS_LOG=/var/log/nginx/access.log \
    NGINX_GZIP=off \
    URL=http://localhost \
    DB_TYPE=pdo.mysql \
    DB_HOST="" \
    DB_USER=root \
    DB_PASS="" \
    DB_PCONNECT=0 \
    DB_NAME=icms \
    DB_CHARSET=utf8 \
    DB_COLLATION=utf8_general_ci \
    DB_PREFIX="" \
    APP_KEY="" \
    DB_PORT=3306 \
    INSTALL_ADMIN_PASS="" \
    INSTALL_ADMIN_LOGIN="" \
    INSTALL_ADMIN_NAME="" \
    INSTALL_ADMIN_EMAIL=""

COPY /shared/ /
COPY /variants/nginx/etc/ /etc/
COPY /variants/nginx/usr/ /usr/

RUN chmod +x /usr/local/bin/*.sh

RUN ./bin/create-user-www-data.sh && \
    rm -rf /usr/local/bin/create-user-www-data.sh

RUN ./bin/install-common.sh && \
    rm -rf /usr/local/bin/install-common.sh

RUN ./bin/install-nginx.sh && \
    rm -rf /usr/local/bin/install-nginx.sh

RUN ./bin/install-php.sh && \
    rm -rf /usr/local/bin/install-php.sh

EXPOSE 80 443

VOLUME /srv/www/modules
VOLUME /srv/www/language
VOLUME /srv/www/storage
VOLUME /srv/www/htdocs/libraries
VOLUME /srv/www/htdocs/include
VOLUME /srv/www/htdocs/themes
VOLUME /srv/www/htdocs/uploads
VOLUME /srv/www/htdocs/vendor

ENTRYPOINT entrypoint.sh

####################################################################
# DEV image                                                        #
####################################################################
FROM base AS dev

ENV PHP_FPM_LOG_ERRORS=on \
    PHP_FPM_DISPLAY_ERRORS=on \
    PHP_FPM_EXPOSE_PHP=on

WORKDIR /srv/www

####################################################################
# PROD image                                                       #
####################################################################

FROM base AS prod

ADD ./impresscms/ /srv/www/

COPY ./shared/usr/local/bin/fix-web-paths.sh \
     /usr/local/bin/

RUN chmod +x /usr/local/bin/*.sh

RUN sh /usr/local/bin/fix-web-paths.sh && \
    rm -rf /usr/local/bin/fix-web-paths.sh && \
    cd /srv/www && \
    composer install --no-dev -optimize-autoloader

####################################################################
# ALL-IN-ONE image                                                 #
####################################################################
FROM prod AS all-in-one

COPY ./all-in-one/ /

RUN chmod +x /usr/local/bin/*.sh

RUN sh /usr/local/bin/install-mysql.sh && \
    rm -rf /usr/local/bin/install-mysql.sh