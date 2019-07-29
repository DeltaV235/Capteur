#!/bin/bash
# Program:
#   A script to install all environment to run the EMS.
# History:
#   2019/07/28  DeltaV235   V1.0

aptList=$(apt list 2>/dev/null|grep "installed"|cut -d '/' -f1)
isInstalledPyt=false
isInstalledPip=false
for line in $aptList
do
#    echo "$line"
    if [ "$line" == "python3.7" ];then
        isInstalledPyt=true
        echo -e "python\t\tversion:  $(apt list python3.7 2>/dev/null|grep "\[installed\]"|cut -d " " -f2)"
    elif [ "$line" == "python3-pip" ];then
        isInstalledPip=true
        echo -e "pip3\t\tversion:  $(apt list python3-pip -a 2>/dev/null|grep "\[installed\]"|cut -d " " -f2)"
    fi
    if [ $isInstalledPyt == true ] && [ $isInstalledPip == true ]; then
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

echo -e "Python check complete"
echo "---------------------------------------------------"
installedPackage=$(pip3 list|awk 'NR>2{printf "%s\n"},"$1"')
echo "$installedPackage"
#uninstallPackage=""
#for package in $installedPackage
#Adafruit-BMP (1.5.2)
#Adafruit-DHT (1.3.2)
#Adafruit-GPIO (1.0.3)
#Adafruit-PureIO (0.2.1)
#Adafruit-SSD1306 (1.6.2)
#coloredlogs (10.0)
#PyMySQL (0.8.0)
#PyMySQL (0.8.0)
#smbus (1.1)