# Pull base image ---------------
FROM oraclelinux:7-slim as base
# Maintainer ----------
MAINTAINER Venkata Avinash <venkata.avinash.tanniru@oracle.com>

# Use second ENV so that variable get substituted
ENV SETUP="setup.sh" \
    ROOTDIR="/opt"

COPY $SETUP $ROOTDIR/

RUN chmod ug+x $ROOTDIR/*.sh && \
    sync && \
    $ROOTDIR/$SETUP

FROM oraclelinux:7-slim

COPY --from=base /usr/sbin/nginx /usr/sbin/nginx
COPY --from=base /usr/lib64/nginx/modules /usr/lib64/nginx/modules/
COPY --from=base /opt/nginx /opt/nginx/
COPY run.sh /opt/
COPY nginx.conf /opt/nginx/

USER root
RUN chmod ug+x /opt/*.sh && \
    sync && \
    /opt/run.sh && \
    rm -rf /opt/run.sh

USER nginx

WORKDIR /tmp

#VOLUME ["/app"]

EXPOSE 80/tcp
EXPOSE 443/tcp

CMD ["nginx","-g","daemon off;"]
