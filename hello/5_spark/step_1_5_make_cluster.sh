#!/bin/sh
echo "export MYIP=127.0.0.1"
# xhost +local:
# Step 5. Create Cluster with Ambari
cat 5_all/spark-template.json | sed -e "s#c6401.ambari.apache.org#amb-server.service.consul#g;s#master1.ambari.apache.org#amb1.service.consul#g;s#master2.ambari.apache.org#amb2.service.consul#g;s#master3.ambari.apache.org#amb3.service.consul#g;s#slave1.ambari.apache.org#amb4.service.consul#g;s#slave2.ambari.apache.org#amb5.service.consul#g;s#slave3.ambari.apache.org#amb6.service.consul#g;s#slave4.ambari.apache.org#amb7.service.consul#g;s#slave5.ambari.apache.org#amb8.service.consul#g;s#slave6.ambari.apache.org#amb9.service.consul#g;s#client1.ambari.apache.org#amb10.service.consul#g" | sed -e 's#"blueprint" : "spark"#"blueprint" : "mydefaults_5_spark"#g' | curl -H "X-Requested-By: ambari" -X POST -d @- -u admin:admin http://$MYIP:8080/api/v1/clusters/myCluster5
echo 'continue?'
if [ -n "$DBG" ]; then read ANSWER; else exit 0; fi
echo '
{
  "blueprint" : "mydefaults",
  "host_groups" :[
    {
      "name" : "host_group_1", 
      "hosts" : [         
        {
          "fqdn" : "'"$MYIP"'"
        },
        {
          "fqdn" : "'"$MYIP"'"
        }
      ]
    }
  ]
}
'
cat 5_all/spark-template.json | sed -e "s#c6401.ambari.apache.org#amb-server.service.consul#g;s#master1.ambari.apache.org#amb1.service.consul#g;s#master2.ambari.apache.org#amb2.service.consul#g;s#master3.ambari.apache.org#amb3.service.consul#g;s#slave1.ambari.apache.org#amb4.service.consul#g;s#slave2.ambari.apache.org#amb5.service.consul#g;s#slave3.ambari.apache.org#amb6.service.consul#g;s#slave4.ambari.apache.org#amb7.service.consul#g;s#slave5.ambari.apache.org#amb8.service.consul#g;s#slave6.ambari.apache.org#amb9.service.consul#g;s#client1.ambari.apache.org#amb10.service.consul#g" | sed -e 's#"blueprint" : "spark"#"blueprint" : "mydefaults_5_spark"#g' 
