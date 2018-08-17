#!/bin/sh
N=1
(echo cd docker-ambari &&
echo &&
echo 'A=$(docker ps -a | grep -v "_data" | awk '"'"'NR>1 {print $1}'"')" &&
echo &&
echo echo '$A'
echo &&
echo B='`'echo '$'A '|' awk -F '"''{'print '$'$N';''}''"''`' &&
echo &&
echo docker exec -it '$B' bash
echo)
