#!/bin/bash
source /etc/apache2/envvars
#a2ensite 000-default.conf
#a2enmod rewrite
#a2enmod proxy
#a2enmod proxy_http
exec /usr/sbin/apache2 -e info -D FOREGROUND
