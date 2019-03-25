#!/bin/bash

processCount=`ps -ef|grep 'python3'|grep 'main.py' -c`
processes=`ps -ef|grep 'python3'|grep 'main.py'`
pid=`ps -ef|grep 'python3'|grep 'main.py'|awk '{printf "%d\t",$2}'`
# 判断程序是否已经启动，若进程数大于0，说明已存在进程，不再重复启动
if [[ ${processCount}  -gt 0 ]]
then
    echo -e "EMS is RUNNING!\nPlease STOP it first!\nPID = ${pid}"
else
    nohup python3 main.py --slient &>/dev/null &
    pid=`ps -ef|grep 'python3'|grep 'main.py'|awk '{printf "%d\t",$2}'`
    echo -e "EMS is RUNNING\nPID = ${pid}"
fi

exit 0