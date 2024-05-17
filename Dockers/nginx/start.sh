#!/bin/sh
mv /root/.env /var/www/symfony-locale-demo-app/.env
cd /var/www/symfony-locale-demo-app && composer install --no-dev
php bin/console asset-map:compile 
composer dump-env prod
chmod -R 777 /var/www/symfony-locale-demo-app/var/cache/prod
php-fpm -D
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start my_first_process: $status"
  exit $status
fi

nginx
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start my_second_process: $status"
  exit $status
fi

while sleep 60; do
  ps aux |grep php-fpm |grep -q -v grep
  PROCESS_1_STATUS=$?
  ps aux |grep nginx |grep -q -v grep
  PROCESS_2_STATUS=$?

  if [ $PROCESS_1_STATUS -ne 0 -o $PROCESS_2_STATUS -ne 0 ]; then
    echo "One of the processes has already exited."
    exit 1
  fi
done
