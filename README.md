Zcoind for Docker
================

[![Docker Stats](http://dockeri.co/image/mrmonotone/zcoind)](https://hub.docker.com/r/mrmonotone/zcoind/)

[![Build Status](https://travis-ci.org/mrmonotone/docker-zcoind.svg?branch=master)](https://travis-ci.org/mrmonotone/docker-zcoind/)


Docker image that runs the Zcoin zcoind node in a container for easy deployment.


Requirements
------------

* Physical machine, cloud instance, or VPS that supports Docker (i.e. Vultr, Digital Ocean, KVM or XEN based VMs) running Ubuntu 16.04 or later (*not OpenVZ containers!*)
* At least 4 GB to store the block chain files
* At least 1 GB RAM + 2 GB swap file

Recommended and tested on Vultr 1024 MB RAM/320 GB disk instance @ $8/mo.  Vultr also *accepts Bitcoin payments*!  May run on the 512 MB instance, but took *forever* (1+ week) to initialize due to swap and disk thrashing.


Really Fast Quick Start
-----------------------

One liner for Ubuntu 16.04 LTS machines with JSON-RPC enabled on localhost and adds upstart init script:

    curl https://raw.githubusercontent.com/mrmonotone/docker-zcoind/master/bootstrap-host.sh | sh -s trusty


Quick Start
-----------

1. Create a `zcoind-data` volume to persist the zcoind blockchain data, should exit immediately.  The `zcoind-data` container will store the blockchain when the node container is recreated (software upgrade, reboot, etc):

        docker volume create --name=zcoind-data
        docker run -v zcoind-data:/zcoin --name=zcoind-node -d \
            -p 9999:9999 \
            -p 127.0.0.1:9998:9998 \
            mrmonotone/zcoind

2. Verify that the container is running and zcoind node is downloading the blockchain

        $ docker ps
        CONTAINER ID        IMAGE                         COMMAND             CREATED             STATUS              PORTS                                              NAMES
        d0e1076b2dca        mrmonotone/zcoind:latest          "zcoin_oneshot"      2 seconds ago       Up 1 seconds        127.0.0.1:9998->9998/tcp, 0.0.0.0:9999->9999/tcp   zcoind-node

3. You can then access the daemon's output thanks to the [docker logs command]( https://docs.docker.com/reference/commandline/cli/#logs)

        docker logs -f zcoind-node

4. Install optional init scripts for upstart and systemd are in the `init` directory.


Documentation
-------------

* To run in testnet, add environment variable `TESTNET=1` to `docker run` as such:

        docker run -v zcoind-data:/zcoin --name=zcoind-node -d \
            --env TESTNET=1 \
            -p 9999:9999 \
            -p 127.0.0.1:9998:9998 \
            mrmonotone/zcoind

* Additional documentation in the [docs folder](docs).

Credits
-------
Forked from Holger Schinzel of the Dash team [https://github.com/dashpay/docker-dashd](https://github.com/dashpay/docker-dashd).
Original work by Kyle Manna [https://github.com/kylemanna/docker-bitcoind](https://github.com/kylemanna/docker-bitcoind).
Modified for use with Zcoin instead of Dash.

