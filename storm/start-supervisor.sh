#!/usr/bin/env bash
sed -i -e "s/%zookeeper%/$ZK_PORT_2181_TCP_ADDR/g" $STORM_HOME/conf/storm.yaml
sed -i -e "s/%nimbus%/$NIMBUS_PORT_6627_TCP_ADDR/g" $STORM_HOME/conf/storm.yaml
sed -i -e "s/%storm%/$STORM_HOME/g" $STORM_HOME/conf/storm.yaml

echo "storm.local.hostname: `hostname -i`" >> $STORM_HOME/conf/storm.yaml
echo 'storm.zookeeper.root:  "/storm_test"' >> $STORM_HOME/conf/storm.yaml
sudo aws s3 cp s3.cn-north-1.amazonaws.com.cn/jike-data-warehouse/newrelic/newrelic.jar $STORM_HOME/newrelic/newrelic.jar
sudo aws s3 cp s3.cn-north-1.amazonaws.com.cn/jike-data-warehouse/newrelic/newrelic.yml $STORM_HOME/newrelic/newrelic.yml
sudo chmod 777 opt
sudo chmod 777 $STORM_HOME
sudo chmod 777 $STORM_HOME/newrelic
sudo chmod 777 $STORM_HOME/newrelic/newrelic.jar


/usr/sbin/sshd && supervisord
