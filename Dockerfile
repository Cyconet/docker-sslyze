FROM alpine:3.6
                                                                                
# Dockerfile Maintainer
MAINTAINER Jan Wagner "waja@cyconet.org"

ENV SSLYZE_CLI_VERSION 1.1.4

RUN apk --no-cache add python py-pip openssl && \
 apk --no-cache add --virtual build-dependencies python-dev libffi-dev openssl-dev build-base wget && \
 pip install sslyze==$SSLYZE_CLI_VERSION && \
 apk del build-dependencies

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]

CMD ["sslyze"]
