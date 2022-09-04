#!/usr/bin/env sh

chown -R www-data:www-data /srv/www

chmod 0777 /srv/www/modules
chmod 0777 /srv/www/language
chmod 0777 /srv/www/storage
chmod 0777 /srv/www/htdocs/libraries
chmod 0777 /srv/www/htdocs/include
chmod 0777 /srv/www/htdocs/themes
chmod 0777 /srv/www/htdocs/uploads
chmod 0777 /srv/www/htdocs/vendor