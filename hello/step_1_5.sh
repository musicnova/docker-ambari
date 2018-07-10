#!/bin/sh
echo "export MYIP=127.0.0.1"
# xhost +local:
# Step 2. Register Blueprint with Ambari
echo '
{
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
    "blueprint_name" : "myBlueprint",
    "stack_name" : "HDP",
    "stack_version" : "2.4"
  }
}
' | curl -H "X-Requested-By: ambari" -X POST -d @- -u admin:admin http://$MYIP:8080/api/v1/clusters/myCluster
