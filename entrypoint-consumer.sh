#!/bin/sh
set -e

# Setup
rm -rf /app/var/*
chown www-data:www-data /app/var
touch /app/var/instance-id

# Run
bin/console messenger:consume async --limit=500 -v
