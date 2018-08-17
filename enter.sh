#!/bin/sh
N=1
(echo '#'INIT_N=5 &&
echo '#'uname -a &&
echo '#'Linux e18069532eea 4.15.0-30-generic '#'32~16.04.1-Ubuntu SMP x86_64 x86_64 x86_64 GNU/Linux &&
echo &&
echo '#'N=2 &&
echo '#'uname -a &&
echo '#'Linux amb4.service.consul 4.15.0-30-generic '#'32~16.04.1-Ubuntu SMP x86_64 x86_64 x86_64 GNU/Linux &&
echo &&
echo '#'N=3 &&
echo '#'uname -a &&
echo '#'Linux amb3.service.consul 4.15.0-30-generic '#'32~16.04.1-Ubuntu SMP x86_64 x86_64 x86_64 GNU/Linux &&
echo &&
echo '#'N=4 &&
echo '#'uname -a &&
echo '#'Linux amb2.service.consul 4.15.0-30-generic '#'32~16.04.1-Ubuntu SMP x86_64 x86_64 x86_64 GNU/Linux &&
echo &&
echo '#'N=5 &&
echo '#'uname -a &&
echo '#'Linux amb1.service.consul 4.15.0-30-generic '#'32~16.04.1-Ubuntu SMP x86_64 x86_64 x86_64 GNU/Linux &&
echo &&
echo '#'N=6 &&
echo '#'uname -a &&
echo '#'Linux amb-server.service.consul 4.15.0-30-generic '#'32~16.04.1-Ubuntu SMP x86_64 x86_64 x86_64 GNU/Linux &&
echo &&
echo '#'N=7 &&
echo '#'uname -a &&
echo '#'Linux amb-consul.service.consul 4.15.0-30-generic '#'32~16.04.1-Ubuntu SMP Thu Jul 26 20:25:39 UTC 2018 x86_64 Linux &&
echo &&
echo cd docker-ambari &&
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
