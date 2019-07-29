#!/bin/bash
# Program:
#   A script to install all environment to run the EMS.
# History:
#   2019/07/28  DeltaV235   V1.0

echo "Checking python environment ..."
aptList=$(apt list 2>/dev/null|grep "installed"|cut -d '/' -f1)
isInstalledPyt=false
isInstalledPip=false
for line in $aptList
do
#    echo "$line"
    if [ "$line" == "python3.7" ];then
        isInstalledPyt=true
    elif [ "$line" == "python3-pip" ];then
        isInstalledPip=true
    fi
    if [ $isInstalledPyt == true ] && [ $isInstalledPip == true ]; then
        echo -e "\npython\t\tversion:  $(apt list python3.7 2>/dev/null|grep "\[installed\]"|cut -d " " -f2)"
        echo -e "pip3\t\tversion:  $(apt list python3-pip -a 2>/dev/null|grep "\[installed\]"|cut -d " " -f2)"
        break
    fi
done
if [ $isInstalledPyt == false ];then
    echo -e "Installing python3.7\n" && sleep 2
    sudo apt-get install python3.7-minimal -y
fi
if [ $isInstalledPip == false ];then
    echo -e "Installing python3-pip\n" && sleep 2
    sudo apt-get install python3-pip -y
fi

echo -e "\nPython check complete"
echo "---------------------------------------------------"
echo -e "\nChecking python3 package environment ...\n"

installList="Adafruit-BMP Adafruit-DHT Adafruit-GPIO Adafruit-PureIO Adafruit-SSD1306 coloredlogs PyMySQL smbus RPi.GPIO pillow"
installedPackage=$(pip3 list|awk 'NR>2{printf "%s\n",$0}')
#echo "$installedPackage"
shouldInstall=""
for list in $installList
do
    if [ "$(echo "$installedPackage"|grep "$list")" == "" ];then
        shouldInstall="$shouldInstall $list"
    fi
done

#echo "$shouldInstall"
while true
do
    if [ "$shouldInstall" != "" ];then
        echo "This package will be installed:"
        echo "$shouldInstall"
        sudo pip3 install "$shouldInstall"
        if [ "$?" == true ];then
            printf "\n\033[1;32m%s\033[0m\n" "Install package SUCC"
            break
        else
            printf "\n\033[1;31m%s\033[0m\n" "Install package FAIL"
            echo -e "Reinstalling ...\n"
        fi
    fi
done
    printf "%-30s%s\n\n" "package" "version"
    for list in $installList
    do
        echo "$installedPackage"|grep "$list"|awk '{printf "%-30s%s\n",$1,$2}'
    done


echo
python3 test.py && printf "\033[32m%s\033[0m\n\n" "TEST PASS" || printf "\033[31m%s\033[0m\n\n" "TEST FAIL"
#uninstallPackage=""
#for package in $installedPackage
