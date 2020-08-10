# --------------------------------------------------------------------
# Copyright (c). All Rights Reserved.
# Author(s): Venkata Avinash Tanniru
# 
# This software may be modified and distributed under the terms of the
# MIT license. See the LICENSE file for details.
# --------------------------------------------------------------------
# .ONESHELL:
# SHELL = /bin/bash
# .SHELLFLAGS = -e

PDIT = http://den02cyg.us.oracle.com:8080
DMZ = http://wfdmzvm00346.us.oracle.com:8080
HTTP_PROXY = http://www-proxy.us.oracle.com:80

install:
	apt-get install docker.io -y

build:
	cp nginx-conf nginx.conf
	sed -i -e "s|__OCSP__|${DMZ}|g" nginx.conf
	# docker build --build-arg http_proxy=${HTTP_PROXY} --build-arg https_proxy=${HTTP_PROXY} -t oracleslb .
	docker build -t oracleslb .

clean:
	rm nginx.conf