# Debugging

## Things to Check

* RAM utilization -- zcoind is very hungry and typically needs in excess of 1GB.  A swap file might be necessary.
* Disk utilization -- The zcoin blockchain will continue growing and growing and growing.  Then it will grow some more.  At the time of writing, 2GB+ is necessary.

## Viewing zcoind Logs

    docker logs zcoind-node


## Running Bash in Docker Container

*Note:* This container will be run in the same way as the zcoind node, but will not connect to already running containers or processes.

    docker run -v zcoind-data:/zcoin --rm -it mrmonotone/zcoind bash -l

You can also attach bash into running container to debug running zcoind

    docker exec -it zcoind-node bash -l


