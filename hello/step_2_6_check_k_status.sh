#!/bin/sh
#!/bin/sh
echo "export MYIP=127.0.0.1"
# xhost +local:
# Step 6. Track installaion


curl -H "X-Requested-By: ambari" -X GET -u admin:admin http://$MYIP:8080/api/v1/clusters/myCluster/requests/

echo
echo "====="
echo

curl -H "X-Requested-By: ambari" -X GET -u admin:admin http://$MYIP:8080/api/v1/clusters/myCluster/requests/1
