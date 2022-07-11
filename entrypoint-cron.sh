#!/bin/sh
set -e

# Setup
rm -rf /app/var/*
chown www-data:www-data /app/var
touch /app/var/instance-id

# Init
mkdir -p /app/var/log
touch /app/var/log/cron.log

# Run
crond -f -L /app/var/log/cron.log &
tail -f /app/var/log/cron.log
