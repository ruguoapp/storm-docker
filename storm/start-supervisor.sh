#!/usr/bin/env bash
sed -i -e "s/%zookeeper%/$ZK_PORT_2181_TCP_ADDR/g" $STORM_HOME/conf/storm.yaml
sed -i -e "s/%nimbus%/$NIMBUS_PORT_6627_TCP_ADDR/g" $STORM_HOME/conf/storm.yaml
sed -i -e "s|%storm%|$STORM_HOME|g" $STORM_HOME/conf/storm.yaml

echo "storm.local.hostname: `hostname -i`" >> $STORM_HOME/conf/storm.yaml
echo 'storm.zookeeper.root:  "/storm_temporary"' >> $STORM_HOME/conf/storm.yaml

/usr/sbin/sshd && supervisord
