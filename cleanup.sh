#!/bin/bash

echo stopping kafka servers..

kafka-server-stop

echo stopping zookeeper servers..
zookeeper-server-stop

echo cleaning data directories..
rm -rf /tmp/zookeeper-1
rm -rf /tmp/kafka-logs-1
rm -rf /tmp/zookeeper-2
rm -rf /tmp/kafka-logs-2

