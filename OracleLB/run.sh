#!/bin/bash
mkdir -p /etc/nginx
mkdir -p /var/log/nginx
touch /var/log/nginx/error.log
touch /var/log/nginx/access.log
ln -s /usr/lib64/nginx/modules /opt/nginx
useradd --system --home /var/cache/nginx --shell /sbin/nologin --comment "nginx user" --user-group nginx
mkdir -p /var/cache/nginx && nginx -t
chown -R nginx:nginx /opt/nginx
chown -R nginx:nginx /var/log/nginx