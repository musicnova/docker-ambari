#!/bin/sh
echo "export MYIP=127.0.0.1"
# xhost +local:
curl -H "X-Requested-By: ambari" -X GET -u admin:admin http://$MYIP:8080/api/v1/blueprints
