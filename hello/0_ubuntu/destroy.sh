#!/bin/sh
(echo cd docker-ambari/hello/0_ubuntu &&
echo &&
echo 'A=$(docker ps -a | grep -v "_data" | awk '"'"'NR>1 {print $1}'"')" &&
echo &&
echo echo '$A'
echo &&
echo docker rm --force '$A'
echo)
