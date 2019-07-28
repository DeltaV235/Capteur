# EMS(Environmental Monitoring System)
一个记录室内环境参数的系统，部署于树莓派。  
树莓派通过GPIO连接各类环境传感器，如温湿度传感器DHT22、气压传感器GY-38等，并定时采集数据。所有的环境数据将存储至远端的Mysql数据库中，并通过网页将数据展示出来。用户还能够设置相关的告警，当某个环境参数超出阈值时，将通过短信和邮件通知用户。
Raspberry pi通过Adafruit_python库控制各类传感器，获取各类环境数据。同时判断是否有告警被触发，若有触发的告警，则通过SMTP发送告警通知邮件，通过ADB调用连接在pi上的Android手机，自动发送提醒短信。  
连线示意图如下图所示：
![连线示意图](https://github.com/DeltaV235/EMS/raw/master/img/%E8%BF%9E%E6%8E%A5%E7%A4%BA%E6%84%8F%E5%9B%BE.jpg)
   
运行环境：
* raspbian
* python3.4
* Adafruit