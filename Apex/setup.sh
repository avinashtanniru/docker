#!/bin/bash
cd $ROOTDIR/
yum install unzip gcc python-dev libkrb5-dev wget zlib zlib-devel libaio-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel -y
yum groupinstall -y "Development Tools"
yum install autoconf automake binutils bison flex gcc gcc-c++ gettext libtool make patch pkgconfig redhat-rpm-config rpm-build rpm-sign byacc cscope ctags diffstat doxygen elfutils gcc-gfortran git indent intltool patchutils rcs subversion swig systemtap -y
wget https://www.python.org/ftp/python/3.5.2/Python-3.5.2.tar.xz
tar -xJf Python-3.5.2.tar.xz 
cd Python-3.5.2
./configure
make
make install
curl https://bootstrap.pypa.io/get-pip.py | python3.5
pip3 install -r $ROOTDIR/requirement.txt
cd /opt/
unzip $ORAFILE
yum clean all
rm -rf /var/cache/yum
