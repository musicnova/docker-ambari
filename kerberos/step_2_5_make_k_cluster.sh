#!/bin/sh
echo "export MYIP=127.0.0.1"
# xhost +local:
# Step 5. Create Cluster with Ambari
echo '
{
  "blueprint" : "mydefaults2",
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
' | curl -H "X-Requested-By: ambari" -X POST -d @- -u admin:admin http://$MYIP:8080/api/v1/clusters/myCluster2
