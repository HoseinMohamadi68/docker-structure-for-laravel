#!/usr/bin/env sh
set -e
## every commit need to run on production and beta
composer install
composer dump-autoload
php artisan migrate
php artisan storage:link
php artisan key:generate
php artisan passport:install
php artisan db:seed
