# Pull base image ---------------
FROM oraclelinux:7-slim as base
# Maintainer ----------
MAINTAINER Venkata Avinash <venkata.avinash.tanniru@oracle.com>

# Use second ENV so that variable get substituted
ENV ORACLE_HOME=/opt/instantclient_19_5 \
    DYLD_LIBRARY_PATH=$ORACLE_HOME \
    LD_LIBRARY_PATH=$ORACLE_HOME \
    PATH=$ORACLE_HOME:$PATH \
    SETUP="setup.sh" \
    ORAFILE="instantclient-basic-linux.x64-19.5.0.0.0dbru.zip" \
    PIPREQ="requirement.txt" \
    ROOTDIR="/opt" \
    PYLIB="/usr/local/lib/python3.5" \
    PYBIN="/usr/local/bin"

COPY $SETUP $ORAFILE $PIPREC $ROOTDIR/



RUN chmod ug+x $ROOTDIR/*.sh && \
    sync && \
    $ROOTDIR/$SETUP

FROM oraclelinux:7-slim

COPY --from=base /usr/local/lib/python3.5 /usr/local/lib/python3.5/
COPY --from=base /usr/local/bin /usr/local/bin/
COPY --from=base /opt/instantclient_19_5 /opt/instantclient_19_5/
COPY run.sh /opt/

USER root
RUN chmod ug+x /opt/*.sh && \
    sync && \
    /opt/run.sh && \
    rm -rf /opt/run.sh

USER oracle

WORKDIR /app

VOLUME ["/app"]

EXPOSE 8080/tcp

CMD ["gunicorn","-c","gunicorn.conf.py","wsgi"]
