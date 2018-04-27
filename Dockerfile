FROM alpine:3.7

LABEL maintainer="monnier.matthieu@gmail.com"

RUN apk --no-cache add nginx nginx-mod-http-headers-more \
    && rm /etc/init.d/nginx /etc/nginx/conf.d/default.conf \ 
    && mkdir /srv/www

COPY nginx_maintenance.conf /etc/nginx/conf.d
COPY maintenance.html /srv/www
COPY logo.png /srv/www
COPY favicon.ico /srv/www

CMD [ "/usr/sbin/nginx", "-c", "/etc/nginx/conf.d/nginx_maintenance.conf" ]
