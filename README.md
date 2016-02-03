docker-fedora-systemd
=====================

Fedora Docker containers with systemd running as pid 1.

Meant to be a building block for situations when you need systemd running as
the supervisor in the container. Such as with Test-Kitchen, or when you want
to create a quick demo of a "fedora system" with systemd running and managing
multiple services.

Hopefully you don't use this in production and you're using the
single-process-per-container strategy instead.

Usage
-----

NOTE: You must run these containers with the `--privileged` flag in order
for systemd to function properly.

- Useless demo:

    $ docker run --privileged --name=fedora-systemd -d joemiller/fedora-systemd:22
    1ff58ef39f70c3431dc4544f79037356a73190dcc78d2271b0093861bf4a307d

    $ docker exec -it fedora-systemd /bin/bash
    [root@1ff58ef39f70 /]# ps aux
    USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
    root         1  0.5  0.2  42968  4724 ?        Ss   23:52   0:00 /usr/lib/systemd/systemd
    root        17  0.0  0.3  37352  6792 ?        Ss   23:52   0:00 /usr/lib/systemd/systemd-journald
    root        26  2.5  0.1  12548  3728 ?        Ss   23:52   0:00 /bin/bash
    root        42  0.0  0.1  47964  3404 ?        R+   23:52   0:00 ps aux

See the `examples/` subdirectory for more example Dockerfiles that build on
top of the base image and do more useful things.

Building
--------

- Running `make build` will run the docker build tasks.
- To add a new fedora version, edit the `VERSIONS` var in the `Makefile` and
  create a new `Dockerfile.f$(VERSION)`.
