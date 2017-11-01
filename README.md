# Docker-SSLyze

[![Build Status](https://travis-ci.org/Cyconet/docker-sslyze.svg?branch=development)](https://travis-ci.org/Cyconet/docker-sslyze)
[![Docker Build Status](https://img.shields.io/docker/build/waja/sslyze.svg)](https://hub.docker.com/r/waja/sslyze/)
[![GitHub tag](https://img.shields.io/github/tag/Cyconet/docker-sslyze.svg)](https://github.com/Cyconet/docker-sslyze/tags)
[![](https://img.shields.io/docker/pulls/waja/sslyze.svg)](https://hub.docker.com/r/waja/sslyze/)
[![](https://img.shields.io/docker/stars/waja/sslyze.svg)](https://hub.docker.com/r/waja/sslyze/)
[![](https://img.shields.io/docker/automated/waja/sslyze.svg)](https://hub.docker.com/r/waja/sslyze/)

Builds a docker image with the [sslyze](https://github.com/nabla-c0d3/sslyze) ready to run.

Running
-------

- run the docker container with:

```
docker run --rm --net=host waja/sslyze -h
```

We don't actually _require_ `--net=host`, but if we're wanting to test native performance (or use `--source some-specific-host-IP`) then we want direct access to the relevant connections without any overhead.

Building
--------

```
make build
```

Get a shell in a running container
----------------------------------

```
make shell
```
