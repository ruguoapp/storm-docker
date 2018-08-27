#!/bin/bash

docker build -t="804775010343.dkr.ecr.cn-north-1.amazonaws.com.cn/base" base
docker build -t="804775010343.dkr.ecr.cn-north-1.amazonaws.com.cn/storm" storm
docker build -t="804775010343.dkr.ecr.cn-north-1.amazonaws.com.cn/storm-nimbus" storm-nimbus
docker build -t="804775010343.dkr.ecr.cn-north-1.amazonaws.com.cn/storm-supervisor" storm-supervisor
docker build -t="804775010343.dkr.ecr.cn-north-1.amazonaws.com.cn/storm-ui" storm-ui

docker push 804775010343.dkr.ecr.cn-north-1.amazonaws.com.cn/base
docker push 804775010343.dkr.ecr.cn-north-1.amazonaws.com.cn/storm
docker push 804775010343.dkr.ecr.cn-north-1.amazonaws.com.cn/storm-nimbus
docker push 804775010343.dkr.ecr.cn-north-1.amazonaws.com.cn/storm-supervisor
docker push 804775010343.dkr.ecr.cn-north-1.amazonaws.com.cn/storm-ui
