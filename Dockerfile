FROM alpine:3.7

LABEL maintainer="monnier.matthieu@gmail.com"

RUN apk --no-cache add nginx nginx-mod-http-headers-more \
    && rm /etc/init.d/nginx /etc/nginx/conf.d/default.conf \ 
    && mkdir /srv/www /run/nginx

COPY nginx_maintenance.conf /etc/nginx/conf.d
COPY maintenance.html /srv/www
COPY logo.png /srv/www
COPY favicon.ico /srv/www

RUN touch /run/nginx.pid
RUN chown -R 1001:1001 /var/log/nginx /run/nginx /var/lib/nginx /run/nginx.pid /etc/nginx

USER 1001

CMD [ "/usr/sbin/nginx", "-c", "/etc/nginx/conf.d/nginx_maintenance.conf" ]
