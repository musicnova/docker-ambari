#!/bin/sh
N=1
(echo cd docker-ambari/hello/0_ubuntu &&
echo &&
echo 'A=$(docker ps -a | grep -v "_data" | awk '"'"'NR>1 {print $1}'"')" &&
echo &&
echo echo '$A'
echo &&
echo N=1
echo &&
echo B='`'echo '$'A '|' awk "'"'{'print '$'"'"'$'N"'"';''}'"'"'`' &&
echo &&
echo docker exec -it '$B' bash &&
echo)
