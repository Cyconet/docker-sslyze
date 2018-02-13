FROM alpine:3.7
                                                                                
# Dockerfile Maintainer
MAINTAINER Jan Wagner "waja@cyconet.org"

ENV SSLYZE_CLI_VERSION 1.1.4

RUN apk --no-cache add python3 openssl && \
 apk --no-cache add --virtual build-dependencies python3-dev libffi-dev openssl-dev build-base wget && \
 python3 -m ensurepip && \
 rm -r /usr/lib/python*/ensurepip && \
 pip3 install --upgrade pip setuptools && \
 if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
 pip install sslyze==$SSLYZE_CLI_VERSION && \
 apk del build-dependencies

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]

CMD ["sslyze"]
