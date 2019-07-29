#!/bin/bash
# Program:
#   A script to install all environment to run the EMS.
# History:
#   2019/07/28  DeltaV235   V1.0

echo -e "\nChecking python environment ...\n"

aptInsList="python3.7 python3-pip"          # 需要安装的包名
aptShouldIns=""                             # 将要被安装的包名

# 判断那些包需要被安装
for package in $aptInsList
do
    if [ "$(apt list "$package" 2>/dev/null|grep "\[installed\]"|cut -d "/" -f1)" != "$package" ];then
        aptShouldIns="$aptShouldIns $package"
    fi
done

# 若首次因为网络原因安装失败，则重试3次后依然失败，则提示检查网络或手动安装相应的包,并返回255
if [ "$aptShouldIns" != "" ];then
    declare -i count=0
    while true
    do
        ((count++))
        echo "These package(s) will be installed:"
        echo -e "\t$pipShouldIns\n" && sleep 3
        sudo apt-get install -y "$pipShouldIns"
        if [ "$?" == true ];then
            printf "\n\033[1;32m%s\033[0m\n\n" "Package install SUCC"
            break
        else
            printf "\n\033[1;31m%s\033[0m\n\n" "Package install FAIL"
            if [ $count -lt 4 ];then
                echo -e "Reinstalling(remain $((4-count)) times) ...\n"
            else
                echo -e "Please check your network or install these package(s) manually"
                echo -e "\t$aptShouldIns\n"
                exit 255
            fi
        fi
    done
fi

# 若安装成功或无需安装，则输出对应包的版本
for package in $aptInsList
do
        printf "%-30sversion: %s\n" "$package" "$(apt list "$package" 2>/dev/null|grep "\[installed\]"|cut -d " " -f2)"
done

echo -e "\n\033[1;32mPython check complete\033[0m"
echo "---------------------------------------------------"
echo -e "\nChecking python3 package environment ...\n"

pipInsList="Adafruit-BMP Adafruit-DHT Adafruit-GPIO Adafruit-PureIO Adafruit-SSD1306 coloredlogs PyMySQL smbus RPi.GPIO pillow"         # 需要安装的python库
pipInsedPackage=$(pip3 list|awk 'NR>2{printf "%s\n",$0}')                                                                               # 已安装的python库
pipShouldIns=""                                                                                                                         # 将要安装的库

for package in $pipInsList
do
    if [ "$(echo "$pipInsedPackage"|grep "$package"|cut -d " " -f1)" != "$package" ];then
        pipShouldIns="$pipShouldIns $package"
    fi
done

if [ "$pipShouldIns" != "" ];then
    count=0
    while true
    do
        ((count++))
        echo "These package(s) will be installed:"
        echo -e "\t$pipShouldIns\n"
        sudo pip3 install "$pipShouldIns"
        if [ "$?" == true ];then
            printf "\n\033[1;32m%s\033[0m\n" "Package install SUCC"
            break
        else
            printf "\n\033[1;31m%s\033[0m\n" "Package install FAIL"
            if [ $count -lt 4 ]; then
                echo -e "Reinstalling(remain $((4-count)) times) ...\n"
            else
                echo -e "Please check your network or install these package(s) manually"
                echo -e "\t$pipShouldIns\n"
                exit 255
            fi
        fi
    done
fi

printf "%-30s%s\n\n" "package" "version"
for list in $pipInsList
do
    echo "$pipInsedPackage"|grep "$list"|awk '{printf "%-30s%s\n",$1,$2}'
done


echo
python3 test.py && printf "\033[1;32m%s\033[0m\n\n" "TEST PASS" || printf "\033[1;31m%s\033[0m\n\n" "TEST FAIL"
#uninstallPackage=""
#for package in $pipInsedPackage
