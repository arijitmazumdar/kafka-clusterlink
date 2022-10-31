kafka-configs --bootstrap-server localhost:9093 --alter --cluster-link demo-link --add-config-file newFilters.properties

kafka-cluster-links --bootstrap-server localhost:9093 \
      --create --link demo-link --config-file link-config.txt \
      --consumer-group-filters-json-file consumer-offset-filter.properties

kafka-cluster-links --list --bootstrap-server localhost:9093

kafka-mirrors --bootstrap-server localhost:9093 --list


kafka-mirrors --create --mirror-topic demo --link demo-link \
--bootstrap-server localhost:9093 

kafka-mirrors --pause --topics demo --bootstrap-server localhost:9093


kcat -b localhost:9092 -C -t demo  -o beginning -e -G srcgrp demo


kafka-consumer-groups --bootstrap-server localhost:9092 --describe --group srcgrp


consumer.offset.sync.enable=true


kafka-configs --bootstrap-server localhost:9093 --alter --cluster-link demo-link --add-config-file newFilters.properties


kafka-configs --bootstrap-server localhost:9092 \
                  --alter \
                  --cluster-link demo-link \
                  --add-config-file link-config-update.txt \
                  --consumer-group-filters-json-file --consumer-group-filters-json-file
                  
kafka-cluster-links --bootstrap-server localhost:9093 \
                       --delete \
                       --link demo-link
                       
kafka-mirrors --promote --topics example-topic --link example-link --bootstrap-server localhost:9093

                       

