#!/bin/sh
set -e

bin/console messenger:consume async --limit=500 -v
