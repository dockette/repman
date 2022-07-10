#!/bin/sh
set -e

crond -f -L /app/var/log/cron.log
