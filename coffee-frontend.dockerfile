FROM nginx:1.21.3-alpine

ARG CONFIG_FILE

ENV NGNIX_USER=laravel
ENV NGINX_GROUP=laravel

RUN mkdir -p /var/www/html/public

ADD ${CONFIG_FILE} /etc/nginx/conf.d/default.conf

RUN sed -i "s/user www-data/user ${NGNIX_USER}/g" /etc/nginx/nginx.conf

RUN adduser -g ${NGINX_GROUP} -s /bin/sh -D ${NGNIX_USER}
