#!/bin/bash

processCount=`ps -ef|grep 'python3'|grep 'main.py' -c`
if [[ ${processCount} == 0 ]]
then
    echo 'EMS is NOT RUNIING!'
else
    pids=`ps -ef|grep main|grep python3|awk '{printf "%d ",$2}'`
    # 在进程多起的情况下，遍历所有符合条件的PID，将其TERM掉
    for pid in ${pids}
    do
        kill ${pid}
        echo "Killed PID = ${pid}"
    done
fi

exit 0