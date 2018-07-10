#!/bin/sh
echo "export MYIP=127.0.0.1"

# Confirm the Agent hosts are registered with the Server.
curl -H "X-Requested-By: ambari" -X GET -u admin:admin http://$MYIP:8080/api/v1/hosts
