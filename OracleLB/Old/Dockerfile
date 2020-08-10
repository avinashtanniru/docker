FROM nginx:1.17.3

MAINTAINER venkata.avinash.tanniru@oracle.com

#ENV http_proxy=http://www-proxy-brmdc.us.oracle.com:80
#ENV https_proxy=http://www-proxy-brmdc.us.oracle.com:80

#RUN /bin/bash -c 'apt-get update; \
#apt-get install apt-utils -y; \
#apt-get install nginx-common -y; \
#apt-get install libnginx-mod-http-headers-more-filter -y; \
#mkdir /etc/nginx/sites-enabled; \
#apt-get clean; \
#apt-get autoclean'
#RUN /bin/bash -c 'useradd oracle; \
#usermod -aG sudo oracle'
ADD nginx.conf /etc/nginx/
ADD 50x.html /var/www/html/
ADD vhost.conf /etc/nginx/vhost/
ADD default /etc/nginx/sites-enabled/
ADD ngx_http_headers_more_filter_module.so /usr/lib/nginx/modules

#VOLUME ["/etc/nginx/ssl]

EXPOSE 443/tcp

CMD ["nginx","-g","daemon off;"]

#USER nginx
