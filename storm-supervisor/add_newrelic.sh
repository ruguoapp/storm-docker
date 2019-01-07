#!/usr/bin/env bash
mkdir $STORM_HOME/newrelic
cp /opt/newrelic.jar $STORM_HOME/newrelic/newrelic.jar
cp /opt/newrelic.yml $STORM_HOME/newrelic/newrelic.yml
sudo chmod 777 opt
sudo chmod 777 $STORM_HOME
sudo chmod 777 $STORM_HOME/newrelic
sudo chmod 777 $STORM_HOME/newrelic/newrelic.jar