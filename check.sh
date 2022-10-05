#!/usr/bin/env sh
set -e
## every commit need to run on production and beta
composer install
php artisan storage:link
composer dump-autoload
php artisan migrate
php artisan db:seed
php artisan L5-swagger:generate
composer phpcs
php artisan test --parallel
