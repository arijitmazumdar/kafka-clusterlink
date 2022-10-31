#!/bin/bash

kcat() {
  docker run -v "$(pwd)"/files:/files -it --network=host --rm edenhill/kcat:1.7.1  $*
}

nohup zookeeper-server-start src/zookeeper.properties 2>&1 > /dev/null 

echo "sleeping for 3 sec" && sleep 3s

nohup kafka-server-start src/server.properties 2>&1 > /dev/null 

#sleep 2s
#
#kcat -b localhost:9092 -L -m 2
#
#echo produce messages
#kcat -b localhost:9092 -P -t demo -m 2<<EOF
#Arijit
#Is 
#a
#Good
#Boy
#EOF
#
#echo consume messages
#kcat -b localhost:9092 -C -t demo -m 2
#
