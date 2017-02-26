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
