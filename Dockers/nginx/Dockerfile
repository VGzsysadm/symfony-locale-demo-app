FROM php:8.2.11-fpm-alpine3.18

ARG APP_ENV
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./default.conf /etc/nginx/conf.d/default.conf
COPY --from=composer /usr/bin/composer /usr/bin/composer
COPY ./start.sh /root
COPY env /root/.env
RUN chmod +x /root/start.sh
RUN apk add nginx git
RUN docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable pdo_mysql
WORKDIR /var/www/
RUN rm -rf * ; git clone https://github.com/VGzsysadm/symfony-locale-demo-app.git
RUN mkdir -p /run/nginx
RUN sed -i "s/APP_ENV=VAR_ENV/APP_ENV=$APP_ENV/g" /root/.env
CMD ["/root/start.sh"]