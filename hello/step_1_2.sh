#!/bin/sh
echo "export MYIP=127.0.0.1"
# xhost +local:
# Step 2. Register Blueprint with Ambari
echo '
{
  "configurations" : [ ],
  "host_groups" : [
    {
      "name" : "host_group_1",
      "components" : [
        {
          "name" : "NAMENODE"
        },
        {
          "name" : "SECONDARY_NAMENODE"
        },
        {
          "name" : "DATANODE"
        },
        {
          "name" : "HDFS_CLIENT"
        },
        {
          "name" : "RESOURCEMANAGER"
        },
        {
          "name" : "NODEMANAGER"
        },
        {
          "name" : "YARN_CLIENT"
        },
        {
          "name" : "HISTORYSERVER"
        },
        {
          "name" : "APP_TIMELINE_SERVER"
        },
        {
          "name" : "MAPREDUCE2_CLIENT"
        },
        {
          "name" : "ZOOKEEPER_SERVER"
        },
        {
          "name" : "ZOOKEEPER_CLIENT"
        }
      ],
      "cardinality" : "1"
    }
  ],
  "Blueprints" : {
    "blueprint_name" : "myBlueprintName",
    "stack_name" : "HDP",
    "stack_version" : "2.3"
  }
}
' | curl -H "X-Requested-By: ambari" -X POST -d @- -u admin:admin http://$MYIP:8080/api/v1/blueprints/myBlueprint
