#!/bin/bash
yum install libaio-devel iputils -y
yum clean all
rm -rf /var/cache/yum
sh -c "echo /opt/instantclient_19_5 > /etc/ld.so.conf.d/oracle-instantclient.conf"
ldconfig
groupadd -r oracle && useradd -r -g oracle oracle
mkdir /app
chown -R oracle:oracle /app
chmod 771 /app
chmod g+s /app
