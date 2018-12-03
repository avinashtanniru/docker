FROM ubuntu

# Created By Avinash
MAINTAINER Avinash "tanniru.avinash@gmail.com"

RUN apt-get update && apt-get install -y \
    sudo \
    nano \
    nginx \
    openssh-server \
    php7.0 \
    php7.0-fpm \
    php7.0-mysql \
    php7.0-xml \
    php7.0-cli \
    php7.0-common \
    php7.0-curl \
    php7.0-gd \
    php7.0-bz2 \
    php7.0-mbstring \
    zip \
    unzip

RUN echo "root:password" | chpasswd

RUN sed -ie 's/PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config

ADD default /etc/nginx/sites-available/default
ADD composer /usr/local/bin/
ADD phpmyadmin /etc/nginx/sites-available/

RUN ln -s /etc/nginx/sites-available/phpmyadmin /etc/nginx/sites-enabled/

# Usage: EXPOSE [port]
EXPOSE 80 443 22



#CMD ["nginx", "-g", "daemon off;"]
CMD /etc/init.d/ssh start && \
    /etc/init.d/php7.0-fpm start && \
    /etc/init.d/php7.0-fpm restart && \
    /etc/init.d/nginx start && \
    /bin/bash