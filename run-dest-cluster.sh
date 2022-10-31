#!/bin/bash

kcat() {
  docker run -v "$(pwd)"/files:/files -it --network=host --rm edenhill/kcat:1.7.1  $*
}

nohup zookeeper-server-start dest/zookeeper.properties & > /dev/null
nohup kafka-server-start dest/server.properties & > /dev/null

sleep 5s

kcat -b localhost:9093 -L

echo consume messages
kcat -b localhost:9093 -C -t demo

