jike-storm-docker
============

## Nimbus

```shell
  docker run -d \
     --name nimbus \
     -e TZ="Asia/Shanghai" \
     -e ZK_PORT_2181_TCP_ADDR="172.31.56.114,172.31.58.37,172.31.48.12" \   
     -v "/log/storm-logs:/var/log/storm/" \
     --log-opt max-size=50m  \
     --net=host \
     804775010343.dkr.ecr.cn-north-1.amazonaws.com.cn/storm-nimbus
```

## Supervisor

```shell
  docker run -d \
     --name supervisor \
     -e TZ="Asia/Shanghai" \
     -e ZK_PORT_2181_TCP_ADDR="172.31.56.114,172.31.58.37,172.31.48.12" \
     -e NIMBUS_PORT_6627_TCP_ADDR="172.31.25.114" \
     -v "/log/storm-logs:/var/log/storm" \
     --log-opt max-size=50m  \
     --net=host \
     804775010343.dkr.ecr.cn-north-1.amazonaws.com.cn/storm-supervisor
```

## UI

```shell
  docker run -d \
     --name storm-ui \
     -e TZ="Asia/Shanghai" \
     -e ZK_PORT_2181_TCP_ADDR="172.31.56.114,172.31.58.37,172.31.48.12" \
     -e NIMBUS_PORT_6627_TCP_ADDR="172.31.25.114" \
     --net=host \
     804775010343.dkr.ecr.cn-north-1.amazonaws.com.cn/storm-ui
```