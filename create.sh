#!/bin/sh
(echo cd docker-ambari &&
echo &&
echo . ambari-functions or source ambari-functions &&
echo &&
# Download the file and source it:
# To start a 3 node cluster:
# https://github.com/sequenceiq/docker-ambari
echo amb-settings &&
echo &&
if [ "$1" = "" ]; then echo amb-start-cluster 3; fi
if [ "$1" = "1" ]; then echo amb-start-cluster 1; fi
if [ "$1" = "2" ]; then echo amb-start-cluster 11; fi
if [ "$1" = "3" ]; then echo amb-start-cluster 11; fi
if [ "$1" = "4" ]; then echo amb-start-cluster 5; fi
if [ "$1" = "5" ]; then echo amb-start-cluster 11; fi
echo &&
echo amb-settings '|' grep AMBARI_SERVER_IP &&
echo &&
echo amb-shell &&
echo &&
echo wget 127.0.0.1:8080 &&
echo &&
echo admin/admin &&
echo)
