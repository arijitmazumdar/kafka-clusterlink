# Kafka cluster link setup
Objective of this project is to create an example project to execute various scenario for cluster linking provided by Confluent

## Prerequisite
1. Confluent platform
2. tmux (optional)

## Steps
1. Run source kafka cluster
```
zookeeper-server-start src/zookeeper.properties 

kafka-server-start src/server.properties 
```
2. Load data into `demo` topic
```
kafka-console-producer --bootstrap-server localhost:9092 --topic demo <<EOF
Arijit
Is
Not
so
Good
Boy
EOF

kafka-console-consumer --bootstrap-server localhost:9092 --topic demo --group srcgrp --timeout-ms 1000
```
3. Check consumer status in cluster 1
```
kafka-consumer-groups --bootstrap-server localhost:9092 --describe --group srcgrp

```
4. Start cluster 2
```
zookeeper-server-start dest/zookeeper.properties 

kafka-server-start dest/server.properties 
```
5. Create cluster link
```
kafka-cluster-links --bootstrap-server localhost:9093 \
      --create --link demo-link --config-file link-config.txt \
      --consumer-group-filters-json-file consumer-offset-filter.properties

 kafka-mirrors --create --mirror-topic demo --link demo-link \
--bootstrap-server localhost:9093      
```
6. Wait for sometime and see consumer group has been replicated to new cluster
```
kafka-consumer-groups --bootstrap-server localhost:9093 --describe --group srcgrp
```
7. Destroy the clusters, and cleanup
```
kafka-server-stop
zookeeper-server-stop
./cleanup.sh
```