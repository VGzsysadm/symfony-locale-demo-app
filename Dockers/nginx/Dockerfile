FROM php:7.4.11-fpm-alpine3.12

ARG APP_ENV

COPY --from=composer /usr/bin/composer /usr/bin/composer
COPY ./start.sh /root
COPY .env /root
RUN chmod +x /root/start.sh
RUN apk add nginx git
RUN docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable pdo_mysql
WORKDIR /var/www/
RUN rm -rf * ; git clone https://github.com/VGzsysadm/namesend.git
RUN mkdir -p /run/nginx
CMD ["/root/start.sh"]