#!/bin/sh
set -e

bin/console d:m:m --no-interaction
bin/console messenger:setup-transports --no-interaction
bin/console repman:security:update-db
bin/console assets:install
mkdir -p /app/var/{log,cache,repo}
chown www-data:www-data /app/var /app/var/{log,cache,repo}

php-fpm &
nginx
