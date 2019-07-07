#!/bin/bash

# 停进程
processCount=`ps -ef|grep 'python3'|grep 'main.py' -c`
if [[ ${processCount} == 0 ]]
then
    echo 'EMS is NOT RUNIING!'
else
    pids=`ps -ef|grep main|grep python3|awk '{printf "%d ",$2}'`
    for pid in ${pids}
    do
        kill ${pid}
        echo "Killed PID = ${pid}"
    done
fi

# 确保进程停止后再进行下一步
while true
do
    processCount=`ps -ef|grep 'python3'|grep 'main.py' -c`
    if [[ ${processCount} -eq 0 ]]
    then
        break
    else
        sleep 1
    fi
done

# 起进程
processCount=`ps -ef|grep 'python3'|grep 'main.py' -c`
processes=`ps -ef|grep 'python3'|grep 'main.py'`
pid=`ps -ef|grep 'python3'|grep 'main.py'|awk '{printf "%d\t",$2}'`
if [[ ${processCount}  -gt 0 ]]
then
    echo -e "EMS is RUNNING!\nPlease STOP it first!\nPID = ${pid}"
else
    nohup python3 main.py --slient &>/dev/null &
    pid=`ps -ef|grep 'python3'|grep 'main.py'|awk '{printf "%d\t",$2}'`
    echo -e "EMS is RUNNING\nPID = ${pid}"
fi

exit 0