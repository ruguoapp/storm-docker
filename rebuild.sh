#!/bin/bash

version=1.2

docker build --build-arg version=${version} -t="804775010343.dkr.ecr.cn-north-1.amazonaws.com.cn/base:${version}" base
docker build --build-arg version=${version} -t="804775010343.dkr.ecr.cn-north-1.amazonaws.com.cn/storm:${version}" storm
docker build --build-arg version=${version} -t="804775010343.dkr.ecr.cn-north-1.amazonaws.com.cn/storm-nimbus:${version}" storm-nimbus
docker build --build-arg version=${version} -t="804775010343.dkr.ecr.cn-north-1.amazonaws.com.cn/storm-supervisor:${version}" storm-supervisor
docker build --build-arg version=${version} -t="804775010343.dkr.ecr.cn-north-1.amazonaws.com.cn/storm-ui:${version}" storm-ui

docker push 804775010343.dkr.ecr.cn-north-1.amazonaws.com.cn/base:${version}
docker push 804775010343.dkr.ecr.cn-north-1.amazonaws.com.cn/storm:${version}
docker push 804775010343.dkr.ecr.cn-north-1.amazonaws.com.cn/storm-nimbus:${version}
docker push 804775010343.dkr.ecr.cn-north-1.amazonaws.com.cn/storm-supervisor:${version}
docker push 804775010343.dkr.ecr.cn-north-1.amazonaws.com.cn/storm-ui:${version}
