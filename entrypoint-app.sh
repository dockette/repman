#!/bin/sh
set -e

# Init
bin/console d:m:m --no-interaction
bin/console messenger:setup-transports --no-interaction
bin/console repman:security:update-db
bin/console assets:install
rm -rf /app/var/*
chown www-data:www-data /app/var
touch /app/var/instance-id

# Run
php-fpm &
nginx
