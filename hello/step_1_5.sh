#!/bin/sh
echo "export MYIP=127.0.0.1"
curl -H "X-Requested-By: ambari" -X POST -u admin:admin http://$MYIP:8080/api/v1/clusters/:myCluster
