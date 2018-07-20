#!/bin/sh
echo "export MYIP=127.0.0.1"
# xhost +local:
# Step 5. Create Cluster with Ambari
cat 1_all/sandbox-template.json | sed -e "s#c6401.ambari.apache.org#amb1.service.consul"#g" | curl -H "X-Requested-By: ambari" -X POST -d @- -u admin:admin http://$MYIP:8080/api/v1/clusters/myCluster
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
cat 1_all/sandbox-template.json | sed -e "s#c6401.ambari.apache.org#amb1.service.consul"#g"
