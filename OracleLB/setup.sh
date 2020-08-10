#!/bin/bash
cd $ROOTDIR/
yum install unzip gcc python-dev libkrb5-dev wget zlib zlib-devel libaio-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel -y
yum groupinstall -y "Development Tools"
yum install autoconf automake binutils bison flex gcc gcc-c++ gettext libtool make patch pkgconfig redhat-rpm-config rpm-build rpm-sign byacc cscope ctags diffstat doxygen elfutils gcc-gfortran git indent intltool patchutils rcs subversion swig systemtap -y
# Download all Prereqs
wget https://ftp.pcre.org/pub/pcre/pcre-8.43.tar.gz
tar -zxf pcre-8.43.tar.gz
wget http://zlib.net/zlib-1.2.11.tar.gz
tar -zxf zlib-1.2.11.tar.gz
wget http://www.openssl.org/source/openssl-1.1.1c.tar.gz
tar -zxf openssl-1.1.1c.tar.gz
wget https://github.com/openresty/headers-more-nginx-module/archive/v0.33.tar.gz
tar -xvf v0.33.tar.gz
wget https://nginx.org/download/nginx-1.17.6.tar.gz
tar zxf nginx-1.17.6.tar.gz
cd nginx-1.17.6
./configure --prefix=/opt/nginx \
	--sbin-path=/usr/sbin/nginx \
	--modules-path=/usr/lib64/nginx/modules \
	--conf-path=/opt/nginx/nginx.conf \
	--error-log-path=/var/log/nginx/error.log \
	--pid-path=/var/run/nginx.pid \
	--lock-path=/var/run/nginx.lock \
	--user=nginx \
	--group=nginx \
	--with-select_module \
	--with-poll_module \
	--with-threads \
	--with-file-aio \
	--with-http_ssl_module \
	--with-http_v2_module \
	--with-http_realip_module \
	--with-http_addition_module \
	--with-http_sub_module \
	--with-http_dav_module \
	--with-http_flv_module \
	--with-http_mp4_module \
	--with-http_gunzip_module \
	--with-http_gzip_static_module \
	--with-http_auth_request_module \
	--with-http_random_index_module \
	--with-http_secure_link_module \
	--with-http_degradation_module \
	--with-http_slice_module \
	--with-http_stub_status_module \
	--http-log-path=/var/log/nginx/access.log \
	--http-client-body-temp-path=/var/cache/nginx/client_temp \
	--http-proxy-temp-path=/var/cache/nginx/proxy_temp \
	--http-fastcgi-temp-path=/var/cache/nginx/fastcgi_temp \
	--http-uwsgi-temp-path=/var/cache/nginx/uwsgi_temp \
	--http-scgi-temp-path=/var/cache/nginx/scgi_temp \
	--with-mail=dynamic \
	--with-mail_ssl_module \
	--with-stream=dynamic \
	--with-stream_ssl_module \
	--with-stream_realip_module \
	--with-stream_ssl_preread_module \
	--with-compat \
	--with-pcre=../pcre-8.43 \
	--with-pcre-jit \
	--with-zlib=../zlib-1.2.11 \
	--with-openssl=../openssl-1.1.1c \
	--with-openssl-opt=no-nextprotoneg \
	--add-dynamic-module=../headers-more-nginx-module-0.33 \
	--with-debug
make
make install
yum clean all
rm -rf /var/cache/yum