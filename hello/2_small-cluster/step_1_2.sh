#!/bin/sh
echo "export MYIP=127.0.0.1"
# xhost +local:
# Step 2. Register Blueprint with Ambari
cat 2_all/small-cluster.json | sed -e 's#"Blueprints" : {#"Blueprints" : {"blueprint_name" : "mydefaults_2_small_cluster",#g' | curl -H "X-Requested-By: ambari" -X POST -d @- -u admin:admin http://$MYIP:8080/api/v1/blueprints/2_all_small_cluster
echo 'continue?'
if [ -n "$DBG" ]; then read ANSWER; else exit 0; fi
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
    "blueprint_name" : "mydefaults_1_sandbox",
    "stack_name" : "HDP",
    "stack_version" : "2.3"
  }
}'
cat 2_all/small-cluster.json | sed -e 's#"Blueprints" : {#"Blueprints" : {"blueprint_name" : "mydefaults_2_small_cluster",#g' 
