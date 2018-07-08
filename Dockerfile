#FROM alpine:3.7
FROM frolvlad/alpine-glibc

# Dockerfile Maintainer
MAINTAINER Jan Wagner "waja@cyconet.org"

ARG BUILD_DATE
ARG BUILD_VERSION
ARG VCS_URL
ARG VCS_REF
ARG VCS_BRANCH

# See http://label-schema.org/rc1/ and https://microbadger.com/labels
LABEL org.label-schema.name="sslyze - fast and powerful SSL/TLS server scanner" \
    org.label-schema.description="A Python CLI tool that can analyze the SSL configuration of a server on Alpine Linux based container" \
    org.label-schema.vendor="Cyconet" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.build-date="${BUILD_DATE:-unknown}" \
    org.label-schema.version="${BUILD_VERSION:-unknown}" \
    org.label-schema.vcs-url="${VCS_URL:-unknown}" \
    org.label-schema.vcs-ref="${VCS_REF:-unknown}" \
    org.label-schema.vcs-branch="${VCS_BRANCH:-unknown}"

ENV SSLYZE_CLI_VERSION 1.4.1

RUN apk --no-cache update && apk --no-cache upgrade && \
 apk --no-cache add python3 openssl libstdc++ && \
 apk --no-cache add --virtual build-dependencies python3-dev libffi-dev openssl-dev build-base wget git-lfs musl-dev && \
 # Work around https://github.com/pypa/pip/issues/3969, see https://github.com/xemuliam/docker-python/blob/9a0154a07a8c2499eff0ed1f83f9fe857369b82b/Dockerfile#L24
 echo "manylinux1_compatible = True" > /usr/lib/python3.6/_manylinux.py && \
 pip3 install --upgrade pip setuptools && \
# apk --no-cache add openssl libstdc++ && \
# echo "manylinux1_compatible = True" > /usr/local/lib/python3.6/_manylinux.py && \
 pip3 install --upgrade https://github.com/nabla-c0d3/nassl/archive/1.1.0.tar.gz && \
 pip3 install --upgrade sslyze==$SSLYZE_CLI_VERSION && \
# rm -f /bin/sh && ln -s /bin/bash /bin/sh
 apk del build-dependencies

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]

CMD ["sslyze"]
