#!/bin/bash
# Program:
#   A script to install all environment to run the EMS.
# History:
#   2019/07/28  DeltaV235   V1.0

chmod a+x ./*.sh
echo -e "\nChecking python environment ...\n"

# 需要安装的包名
aptInsList="python3.7 python3-pip libopenjp2-7 python3-libtiff i2c-tools"
# 将要被安装的包名
aptShouldIns=""

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
    sudo apt-get update
    while true
    do
        ((count++))
        echo "These package(s) will be installed:"
        echo -e "\t$aptShouldIns\n" && sleep 3
        # shellcheck disable=SC2086
        if sudo apt-get install -y $aptShouldIns;then
            printf "\n\033[1;32m%s\033[0m\n\n" "Package install SUCC"
            break
        else
            printf "\n\033[1;31m%s\033[0m\n\n" "Package install FAIL"
            if [ $count -lt 4 ];then
                echo -e "Reinstalling(remain $((4-count)) times) ...\n"
                sleep 3
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

sleep 1
echo -e "\n\033[1;32mPython check complete\033[0m"
echo "-----------------------------------------------------------------------------------------"
echo -e "\nChecking python3 package environment ...\n"

# 需要安装的python库
pipInsList="Adafruit-BMP Adafruit-DHT Adafruit-GPIO Adafruit-PureIO Adafruit-SSD1306 coloredlogs PyMySQL smbus RPi.GPIO Pillow PillowImage"

# 已安装的python库
pipInsedPackage=$(pip3 list|awk 'NR>2{printf "%s\n",$0}')

# 将要安装的库
pipShouldIns=""

for package in $pipInsList
do
    if [ "$(echo "$pipInsedPackage"|grep "$package "|cut -d " " -f1)" != "$package" ];then
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
        if sudo pip3 install "$pipShouldIns";then
            printf "\n\033[1;32m%s\033[0m\n" "Package install SUCC"
            break
        else
            printf "\n\033[1;31m%s\033[0m\n" "Package install FAIL"
            if [ $count -lt 4 ]; then
                echo -e "Reinstalling(remain $((4-count)) times) ...\n"
                sleep 3
            else
                echo -e "Please check your network or install these package(s) manually"
                echo -e "\t$pipShouldIns\n"
                exit 255
            fi
        fi
    done
fi

pipInsedPackage=$(pip3 list|awk 'NR>2{printf "%s\n",$0}')               # 更新已安装的包
printf "%-30s%s\n\n" "package" "version"
for package in $pipInsList
do
    echo "$pipInsedPackage"|grep "$package "|awk '{printf "%-30s%s\n",$1,$2}'
done

# 检查i2c总线是否开启
i2cdetect -y 1 &>/dev/null && printf "\n\033[1;32m%s\033[0m\n" "I2C Checked" || printf "\n\033[1;31m%s\033[0m\n%s\n" "I2C Error" \
"Please enable I2C interface by use command 'sudo raspi-config'"

# 未测试(树莓派开机自启动EMS)
sudo cp systemd/* /lib/systemd/system/ && sudo systemctl enable before_ems.service && sudo systemctl enable ems.service \
&& printf "\n\033[1;32m%s\033[0m\n" "EMS will start when system boot" || printf "\n\033[1;31m%s\033[0m\n\n" "Self-starting set failed"


# 测试test.py是否能正常运行
python3 test.py && printf "\n\033[1;32m%s\033[0m\n\n" "TEST PASS" || printf "\n\033[1;31m%s\033[0m\n\n" "TEST FAIL"