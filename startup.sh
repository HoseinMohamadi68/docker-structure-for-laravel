#!/usr/bin/env sh
set -e
## every commit need to run on production and beta
supervisord -c /etc/supervisord.conf
crond
crontab /home/app/crontabs/app
