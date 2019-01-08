# coding=utf-8

import RPi.GPIO as GPIO
import Adafruit_DHT as DHT
import Adafruit_BMP.BMP085 as BMP
import time
import pymysql
import smbus
#import socket
import threading
import os
import signal
import smtplib
from email.mime.text import MIMEText
import logging
import getopt
import sys

from oled import oledDisplay as OLED


# bcmChannel=3
# GPIO.setmode(GPIO.BCM)
# GPIO.setwarnings(True)
# GPIO.setup(bcmChannel,GPIO.OUT)
# GPIO.input(bcmChannel)
# GPIO.output(bcmChannel,GPIO.HIGH)
# print(GPIO.VERSION)
# GPIO.cleanup()
# class dht22:
#    def __init__(self):
#        pass


def getLocalTime():
    localtime = time.strftime('%Y%m%d%H%M%S', time.localtime(time.time()))
    return localtime


def getLocalTimeHuman():
    localtime = time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(time.time()))
    return localtime


def getConnection(host, user, password, db, port=3306, charset='utf8'):
    connection = pymysql.connect(host=host, user=user, password=password, db=db, port=port, charset=charset)
    return connection


# except Exception as exc:
#     print(getLocalTime(),exc)

def insertDataDHT22(connection, table, temp, humi):
    # try:
    with connection.cursor() as cursor:
        sql = 'insert into ' + table + '(date,temp,humi) values (' + getLocalTime() + ',' + str(temp) + ',' + str(
            humi) + ');'
        cout = cursor.execute(sql)
        if cout >= 1:
            print(getLocalTimeHuman(), 'Insert', cout, 'row(s) in sensors_data.' + table)
        connection.commit()


# except AttributeError as exc:
#     print(getLocalTimeHuman(),'Connection hasnt opened!',exc)
# except Exception as exc:
#     print(getLocalTimeHuman(),'Database insert error!',exc)
#     connection.rollback()

def insertDataGY30(connection, table, illuminance):
    # try:
    with connection.cursor() as cursor:
        sql = 'insert into ' + table + '(date,illuminance) values (' + getLocalTime() + ',' + str(illuminance) + ');'
        cout = cursor.execute(sql)
        if cout >= 1:
            print(getLocalTimeHuman(), 'Insert', cout, 'row(s) in sensors_data.' + table)
        connection.commit()


# except AttributeError as exc:
#     print(getLocalTimeHuman(),'Connection hasnt opened!',exc)
# except Exception as exc:
#     print(getLocalTimeHuman(),'Database insert error!',exc)
#     connection.rollback()

def insertDataMQ7(connection, table, haveco):
    # try:
    with connection.cursor() as cursor:
        sql = 'insert into ' + table + '(date,haveco) values (' + getLocalTime() + ',"' + haveco + '");'
        cout = cursor.execute(sql)
        if cout >= 1:
            print(getLocalTimeHuman(), 'Insert', cout, 'row(s) in sensors_data.' + table)
        connection.commit()


# except AttributeError as exc:
#     print(getLocalTimeHuman(),'Connection hasnt opened!',exc)
# except Exception as exc:
#     print(getLocalTimeHuman(),'Database insert error!',exc)
#     connection.rollback()

def insertDataGY68(connection, table, pressure, temperature, altitude, sealevel_pressure):
    # try:
    with connection.cursor() as cursor:
        sql = 'insert into ' + table + '(date,pressure,temperature,altitude,sealevel_pressure) values (' + getLocalTime() + ',' + str(
            pressure) + ',' + str(temperature) + ',' + str(altitude) + ',' + str(sealevel_pressure) + ');'
        cout = cursor.execute(sql)
        if cout >= 1:
            print(getLocalTimeHuman(), 'Insert', cout, 'row(s) in sensors_data.' + table)
        connection.commit()


# except AttributeError as exc:
#     print(getLocalTimeHuman(),'Connection hasnt opened!',exc)
# except Exception as exc:
#     print(getLocalTimeHuman(),'Database insert error!',exc)
#     connection.rollback()

def insertDataALL(connection, table, temp, humi, illuminance, pressure, haveco):
    # try:
    with connection.cursor() as cursor:
        sql = 'insert into ' + table + '(date,temp,humi,illuminance,pressure,haveco) values (' + getLocalTime() + ',' + str(
            temp) + ',' + str(humi) + ',' + str(illuminance) + ',' + str(pressure) + ',"' + haveco + '");'
        cout = cursor.execute(sql)
        if cout >= 1:
            print(getLocalTimeHuman(), 'Insert', cout, 'row(s) in sensors_data.' + table)
        connection.commit()


# except AttributeError as exc:
#     print(getLocalTimeHuman(),'Connection hasnt opened!',exc)
# except Exception as exc:
#     print(getLocalTimeHuman(),'Database insert error!',exc)
#     connection.rollback()

def insert():
    global humi22, temp22, illuminance, haveco, pressure, temperature, altitude, sealevel_pressure, saveFreq
    lock = threading.Lock()
    try:
        connCloud = getConnection('118.25.46.104', 'DeltaV', '960123W78u', 'sensors_data')
        while (True):
            connCloud.commit()
            date = travValue(connCloud, 'all_sensors_data', 'date', 'order by date desc limit 1')
            distance = (time.mktime(time.localtime(time.time())) - time.mktime(
                time.strptime(str(date[0][0]), "%Y-%m-%d %H:%M:%S")))
            if distance >= saveFreq * 60 or date == None:
                if temp22 is not None and 0 <= humi22 <= 100.0 and illuminance >= 0 and haveco is not None :
                    lock.acquire()
                    print('Cloud Server:')
                    insertDataDHT22(connCloud, 'dht22', ('%.2f' % temp22), ('%.2f' % humi22))
                    insertDataGY30(connCloud, 'gy30', ('%.1f' % illuminance))
                    insertDataMQ7(connCloud, 'mq7', haveco)
                    insertDataGY68(connCloud, 'gy68', pressure, temperature, altitude, sealevel_pressure)
                    insertDataALL(connCloud, 'all_sensors_data', ('%.2f' % temp22), ('%.2f' % humi22), ('%.1f' % illuminance), ('%.2f' % pressure), haveco)
                    # date[0][0] = getLocalTime()
                    lock.release()
                else:  # 错误输出错误信息，和校验数据
                    print (getLocalTimeHuman(), "Insert Data Wrong! Waiting For ReAcquirt")
                    time.sleep(10)
            elif saveFreq * 60 - distance > 600:
                time.sleep(540)
            elif saveFreq * 60 - distance > 300:
                time.sleep(240)
            elif saveFreq * 60 - distance > 80:
                time.sleep(60)
            elif saveFreq * 60 - distance > 50:
                time.sleep(30)
            elif saveFreq * 60 - distance > 20:
                time.sleep(10)
            elif saveFreq * 60 - distance > 10:
                time.sleep(5)
            elif saveFreq * 60 - distance > 1:
                time.sleep(1)
            elif saveFreq * 60 - distance <= 1:
                pass
    except KeyboardInterrupt:
        exit(0)

    # except Exception as exc:
    #     print(getLocalTimeHuman(),'thrSave:',exc)
    #     time.sleep(5)


def acquire():
    global humi22, temp22, illuminance, haveco, pressure, temperature, altitude, sealevel_pressure, acqFreq, saveFreq, warnFreq
    try:
        connection = getConnection('localhost', 'root', '960123%W78u&', 'setting')
        connection_vps = getConnection('118.25.46.104', 'DeltaV', '960123W78u', 'setting')
        lock = threading.Lock()
        dht22Pin = 4

        bus_GY30 = smbus.SMBus(1)
        addr_GY30 = 0x23
        # bus_GY68 = smbus.SMBus(2)
        # addr_GY68 = 0x77

        mq7Pin = 18
        haveco = ''
        GPIO.setmode(GPIO.BCM)
        GPIO.setwarnings(False)
        GPIO.setup(mq7Pin, GPIO.IN)

        count = 0
        while (True):
            connection.commit()
            connection_vps.commit()
            Freq = travValue(connection_vps, 'setting')
            if count >= 2:                      # 前2次采集不更新采集频率，使用main中的短采集周期，提高程序的启动速度
                acqFreq = Freq[0][0]
            else:
                count += 1
            saveFreq = Freq[0][1]
            warnFreq = Freq[0][2]
            # print (acqFreq, saveFreq, warnFreq)

            # 采集数据
            # read temp from dht22
            lock.acquire()
            humi22, temp22 = DHT.read_retry(DHT.DHT22, dht22Pin)
            # read illum from gy30
            data = bus_GY30.read_i2c_block_data(addr_GY30, 0x11)
            illuminance = (data[1] + (256 * data[0])) / 1.2
            # read pressure from GY68
            gy68 = BMP.BMP085(mode=BMP.BMP085_ULTRAHIGHRES)
            pressure = gy68.read_pressure()
            temperature = gy68.read_temperature()
            altitude = gy68.read_altitude()
            sealevel_pressure = gy68.read_sealevel_pressure()
            # read CO from mq7
            if GPIO.input(mq7Pin) == 1:
                haveco = 'N'
            elif GPIO.input(mq7Pin) == 0:
                haveco = 'Y'
            print(getLocalTimeHuman(),
                  'Temp:{0:0.2f} *C  Humidity:{1:0.2f} %  Illuminance:{2:0.1f} lux  Pressure:{3:0.2f} Pa  CO:{4}  '
                  'Temp_GY68:{5:0.2f} *C  Altitude_GY68:{6:0.2f} m  Sealevel_Pressure_GY68:{7:0.2f} Pa  acqFreq:{8:0.1f} s'
                  .format(temp22, humi22, illuminance, pressure, haveco, temperature, altitude, sealevel_pressure, acqFreq * 60))
            # logging.ERROR('Temp:{0:0.2f} *C  Humidity:{1:0.2f} %  Illuminance:{2:0.1f} lux  Pressure:{3:0.2f} Pa  CO:{4}  '
            #       'Temp_GY68:{5:0.2f} *C  Altitude_GY68:{6:0.2f} m  Sealevel_Pressure_GY68:{7:0.2f} Pa  acqFreq:{8:0.1f} s'
            #       .format(temp22, humi22, illuminance, pressure, haveco, temperature, altitude, sealevel_pressure, acqFreq * 60))
            if temp22 is None or humi22 is None or humi22 > 100.0 or illuminance is None or haveco is None:
                print(getLocalTimeHuman(), 'Data Wrong! Retry after 10 secs!')
                lock.release()
                time.sleep(10)
                continue
            checkWarning(connection, connection_vps)
            # print(getLocalTimeHuman(), 'acqFreq =', round(acqFreq * 60, 1), 's')
            lock.release()
            time.sleep(acqFreq * 60)

    except KeyboardInterrupt:
        GPIO.cleanup()
        exit(0)
    # except Exception as exc:
    #     print(getLocalTimeHuman(), 'thrAqr:', exc)
    #     time.sleep(5)


def findLastDate(connection, table, showKeys='date'):
    sql = 'select ' + showKeys + ' from ' + table + ' order by date desc limit 1;'
    # try:
    with connection.cursor() as cursor:
        cout = cursor.execute(sql)
        row = cursor.fetchone()
        date = (int(row[0].timestamp()) * 1000)

    print(getLocalTimeHuman(), 'Find ', cout, 'row(s)  date : ', str(date))
    return date


def travValue(connection, table, showKeys='*', where=''):
    sql = 'select ' + showKeys + ' from ' + table + ' ' + where + ';'
    data = []
    temp = []
    # try:
    with connection.cursor() as cursor:
        cout = cursor.execute(sql)
        rows = cursor.fetchall()
    for row in rows:
        for value in row:
            temp.append(value)
        data.append(temp)
        temp = []
    # print(getLocalTimeHuman(), 'Find ', cout, 'row(s) from ',table,showKeys,where)
    return data


def sendWarnEmail(smtpserver, username, password, sender, receiver, subject, user, compareName, value, name, curData,
                  date):
    HTML = '''
            <div  style="margin-left: 8px; margin-top: 8px; margin-bottom: 8px; margin-right: 8px;">
                <div>
                    
                    <br>
                    <span >
                        <font face="微软雅黑, Microsoft Yahei, Heiti" size="2">
                            <h1 style="font-size: 18px; font-family: '微软雅黑', 'Microsoft Yahei', 'Heiti'; margin-bottom: 30px;">尊敬的<span style="border-bottom: 1px dashed rgb(204, 204, 204); z-index: 1; position: static;" t="7" onclick="return false;" >''' + user + '''</span>，</h1>
                            <p style="font-family: '微软雅黑', 'Microsoft Yahei', 'Heiti';">您的环境监测系统 - ''' + compareName + str(
        value) + ''' 告警被触发，您可以登录<a href="http://" style="color: #0071ce;" target="_blank">环境监测系统</a>查看或取消接收告警。</p>
                            <h2 style="font-size: 16px; font-family: '微软雅黑', 'Microsoft Yahei', 'Heiti'; margin-top: 20px;">告警详情</h2>
                            <ul style="font-family: '微软雅黑', 'Microsoft Yahei', 'Heiti';">
                                <li style="line-height: 1.5em;">策略组名：''' + name + ''' </li>
                                <li style="line-height: 1.5em;">监控指标：''' + compareName + str(value) + ''' </li>
                                <li style="line-height: 1.5em;">当前数据：''' + curData + ''' </li>
                                <li style="line-height: 1.5em;">触发时间：<span style="border-bottom:1px dashed #ccc;" t="5" times="">''' + str(
        date) + '''</span> (UTC+08:00) </li>
                            </ul>
                        </font>
                        <p style="color: #27303f; margin-top: 60px; margin-bottom: 10px; font-family: '微软雅黑', 'Microsoft Yahei', 'Heiti'"></p>
                        <table border="0" width="100%" cellpadding="0" cellspacing="0" style="margin: 10px 0">
                            <tbody>
                                <tr>
                                    <td style="background:none; border-bottom: 1px dashed #d6d5e1; height:1px; line-height: 0; width:100%; margin:0px 0px 0px 0px;">&nbsp;</td>
                                 </tr>
                            </tbody>
                        </table>
                        <p style="color: gray; font-family: '微软雅黑', 'Microsoft Yahei', 'Heiti';">本邮件为系统推送，请不要直接回复。
                    </span>
                    <br>
                    <span >
                    </span>
                </div>
            </div>
            '''

    message = MIMEText(HTML, 'HTML', 'utf-8')
    message['Subject'] = subject
    message['From'] = sender
    message['To'] = receiver
    smtp = smtplib.SMTP_SSL(smtpserver, 465)
    smtp.set_debuglevel(0)
    smtp.login(sender, password)
    smtp.sendmail(sender, receiver, message.as_string())
    print(getLocalTimeHuman(), "Email Send!")
    smtp.quit()


def sendMsg(phone, compareName, value, name, date, curData, recoverDate=None):
    if recoverDate == None:
        msg1 = '【环境监测系统】监控警告触发'
        msg2 = '您的【' + compareName + str(value) + '】告警被触发'
        msg3 = '当前数值：' + curData
        msg4 = '告警组名：' + name
        msg5 = '触发时间：' + date
        os.system('adb shell input keyevent 26')
        os.system('adb shell am start -a android.intent.action.SENDTO -d sms:' + str(
            phone) + ' --es sms_body "' + msg1 + '" --ez exit_on_sent true')
        os.system('adb shell input keyevent 66')
        os.system('adb shell am broadcast -a ADB_INPUT_TEXT --es msg "' + msg2 + '"')
        os.system('adb shell input keyevent 66')
        os.system('adb shell am broadcast -a ADB_INPUT_TEXT --es msg "' + msg3 + '"')
        os.system('adb shell input keyevent 66')
        os.system('adb shell am broadcast -a ADB_INPUT_TEXT --es msg "' + msg4 + '"')
        os.system('adb shell input keyevent 66')
        os.system('adb shell am broadcast -a ADB_INPUT_TEXT --es msg "' + msg5 + '"')

        os.system('adb shell input keyevent 22')
        os.system('adb shell input keyevent 66')
        os.system('adb shell input keyevent 26')
    else:
        msg1 = '【环境监测系统】监控警告恢复'
        msg2 = '您的【' + compareName + str(value) + '】告警已恢复'
        msg3 = '当前数值：' + curData
        msg4 = '告警组名：' + name
        msg5 = '触发时间：' + date
        msg6 = '恢复时间：' + recoverDate
        os.system('adb shell input keyevent 26')
        os.system('adb shell am start -a android.intent.action.SENDTO -d sms:' + str(
            phone) + ' --es sms_body "' + msg1 + '" --ez exit_on_sent true')
        os.system('adb shell input keyevent 66')
        os.system('adb shell am broadcast -a ADB_INPUT_TEXT --es msg "' + msg2 + '"')
        os.system('adb shell input keyevent 66')
        os.system('adb shell am broadcast -a ADB_INPUT_TEXT --es msg "' + msg3 + '"')
        os.system('adb shell input keyevent 66')
        os.system('adb shell am broadcast -a ADB_INPUT_TEXT --es msg "' + msg4 + '"')
        os.system('adb shell input keyevent 66')
        os.system('adb shell am broadcast -a ADB_INPUT_TEXT --es msg "' + msg5 + '"')
        os.system('adb shell input keyevent 66')
        os.system('adb shell am broadcast -a ADB_INPUT_TEXT --es msg "' + msg6 + '"')

        os.system('adb shell input keyevent 22')
        os.system('adb shell input keyevent 66')
        os.system('adb shell input keyevent 26')


def insertWarnList(connection, table, name, env_args, compare, value, phone, email, date, user, status, islook):
    # try:
    with connection.cursor() as cursor:
        sql = 'insert into ' + table + '(name,env_args,compare,value,phone,email,date,user,status,islook) ' \
                                       'values ("' + name + '","' + env_args + '","' + compare + '",' + str(
            value) + ',"' + phone + '","' + email + '",' + date + ',"' + user + '","' + status + '","' + islook + '");'
        # print (sql)
        cout = cursor.execute(sql)
        if cout >= 1:
            print(getLocalTimeHuman(), 'Insert', cout, 'row(s) in setting.warn_list' + table)
        connection.commit()


# except AttributeError as exc:
#     print(getLocalTimeHuman(),'Connection hasnt opened!',exc)
# except Exception as exc:
#     print(getLocalTimeHuman(),'Database insert error!',exc)
#     connection.rollback()

def checkExist(connection, name):
    isExist = False
    warning_list = travValue(connection, 'warning_list',
                             'name,env_args,compare,value,phone,email,date,user,last_warn_date,status,islook',
                             'where name = "' + name + '"')
    for (
    name_list, env_args_list, compare_list, value_list, phone_list, email_list, date_list, user_list, last_warn_date,
    status, islook) in warning_list:
        if name == name_list and status == 'warning':
            isExist = True
        else:
            isExist = False
    return isExist


def checkWarning(connection, connection_vps):
    compareName = {'temp': {'g': '温度大于', 'ge': '温度大于等于', 'l': '温度小于', 'le': '温度小于等于', 'e': '温度等于', 'ne': '温度不等于'},
                   'humi': {'g': '湿度大于', 'ge': '湿度大于等于', 'l': '湿度小于', 'le': '湿度小于等于', 'e': '湿度等于', 'ne': '湿度不等于'},
                   'illu': {'g': '光照度大于', 'ge': '光照度大于等于', 'l': '光照度小于', 'le': '光照度小于等于', 'e': '光照度等于', 'ne': '光照度不等于'},
                   'press': {'g': '气压大于', 'ge': '气压大于等于', 'l': '气压小于', 'le': '气压小于等于', 'e': '气压等于', 'ne': '气压不等于'},
                   'haveco': {'g': '一氧化碳大于', 'ge': '一氧化碳大于等于', 'l': '一氧化碳小于', 'le': '一氧化碳小于等于', 'e': '一氧化碳等于',
                              'ne': '一氧化碳不等于'}
                   }
    global humi22, temp22, illuminance, haveco, pressure, temperature, altitude, sealevel_pressure
    try:
        connection.commit()
        connection_vps.commit()
        warning_policy = travValue(connection_vps, 'warning_policy',
                                   'name,env_args,compare,value,phone,email,date,user')
        # print (warning_policy)
        for (name, env_args, compare, value, phone, email, date, user) in warning_policy:
            temp = 0
            curData = ''
            if env_args == 'temp':
                temp = temp22
                curData = str('%.1f' % temp22) + ' ℃'
            elif env_args == 'humi':
                temp = humi22
                curData = str('%.1f' % humi22) + ' %'
            elif env_args == 'illu':
                temp = illuminance
                curData = str('%.1f' % illuminance) + ' lux'
            elif env_args == 'press':
                temp = pressure
                curData = str('%.1f' % pressure) + ' hPa'
            elif env_args == 'haveco':
                if haveco == 'Y':
                    temp = 1
                    curData = '有 一氧化碳'
                else:
                    temp = 0
                    curData = '无 一氧化碳'

            if compare == 'g':
                if temp > value:
                    if not checkExist(connection_vps, name):
                        insertWarnList(connection_vps, 'warning_list', name, env_args, compare, value, phone, email,
                                       getLocalTime(),
                                       user, 'warning', 'N')
                elif checkExist(connection_vps, name):
                    updateStatus(connection_vps, 'warning_list', name)  # 此处可以添加恢复时间
                    updateRecoverDate(connection_vps, 'warning_list', name, getLocalTime())
                    if phone == 'Y':
                        phoneNumber = travValue(connection_vps, 'user_profile', 'phone', 'where name = "' + user + '"')
                        sendMsg(phoneNumber[0][0], compareName[env_args][compare], value, name, str(date), curData,
                                getLocalTimeHuman())
            elif compare == 'ge':
                if temp >= value:
                    if not checkExist(connection_vps, name):
                        insertWarnList(connection_vps, 'warning_list', name, env_args, compare, value, phone, email,
                                       getLocalTime(),
                                       user, 'warning', 'N')
                elif checkExist(connection_vps, name):
                    updateStatus(connection_vps, 'warning_list', name)
                    updateRecoverDate(connection_vps, 'warning_list', name, getLocalTime())
                    if phone == 'Y':
                        phoneNumber = travValue(connection_vps, 'user_profile', 'phone', 'where name = "' + user + '"')
                        sendMsg(phoneNumber[0][0], compareName[env_args][compare], value, name, str(date), curData,
                                getLocalTimeHuman())
            elif compare == 'l':
                if temp < value:
                    if not checkExist(connection_vps, name):
                        insertWarnList(connection_vps, 'warning_list', name, env_args, compare, value, phone, email,
                                       getLocalTime(),
                                       user, 'warning', 'N')
                elif checkExist(connection_vps, name):
                    updateStatus(connection_vps, 'warning_list', name)
                    updateRecoverDate(connection_vps, 'warning_list', name, getLocalTime())
                    if phone == 'Y':
                        phoneNumber = travValue(connection_vps, 'user_profile', 'phone', 'where name = "' + user + '"')
                        sendMsg(phoneNumber[0][0], compareName[env_args][compare], value, name, str(date), curData,
                                getLocalTimeHuman())
            elif compare == 'le':
                if temp <= value:
                    if not checkExist(connection_vps, name):
                        insertWarnList(connection_vps, 'warning_list', name, env_args, compare, value, phone, email,
                                       getLocalTime(),
                                       user, 'warning', 'N')
                elif checkExist(connection_vps, name):
                    updateStatus(connection_vps, 'warning_list', name)
                    updateRecoverDate(connection_vps, 'warning_list', name, getLocalTime())
                    if phone == 'Y':
                        phoneNumber = travValue(connection_vps, 'user_profile', 'phone', 'where name = "' + user + '"')
                        sendMsg(phoneNumber[0][0], compareName[env_args][compare], value, name, str(date), curData,
                                getLocalTimeHuman())
            elif compare == 'e':
                if temp == value:
                    if not checkExist(connection_vps, name):
                        insertWarnList(connection_vps, 'warning_list', name, env_args, compare, value, phone, email,
                                       getLocalTime(),
                                       user, 'warning', 'N')
                elif checkExist(connection_vps, name):
                    updateStatus(connection_vps, 'warning_list', name)
                    updateRecoverDate(connection_vps, 'warning_list', name, getLocalTime())
                    if phone == 'Y':
                        phoneNumber = travValue(connection_vps, 'user_profile', 'phone', 'where name = "' + user + '"')
                        sendMsg(phoneNumber[0][0], compareName[env_args][compare], value, name, str(date), curData,
                                getLocalTimeHuman())

            elif compare == 'ne':
                if temp != value:
                    if not checkExist(connection_vps, name):
                        insertWarnList(connection_vps, 'warning_list', name, env_args, compare, value, phone, email,
                                       getLocalTime(),
                                       user, 'warning', 'N')
                elif checkExist(connection_vps, name):
                    updateStatus(connection_vps, 'warning_list', name)
                    updateRecoverDate(connection_vps, 'warning_list', name, getLocalTime())
                    if phone == 'Y':
                        phoneNumber = travValue(connection_vps, 'user_profile', 'phone', 'where name = "' + user + '"')
                        sendMsg(phoneNumber[0][0], compareName[env_args][compare], value, name, str(date), curData,
                                getLocalTimeHuman())

    except KeyboardInterrupt:
        exit(0)


def updateStatus(connection, table, name):
    # try:
    with connection.cursor() as cursor:
        sql = 'update ' + table + ' set status = "recover" where status = "warning" and name = "' + name + '";'
        # print (sql)
        cout = cursor.execute(sql)
        # if cout>=1:
        #     print(getLocalTimeHuman(),'LastWarnTime for',name,'has update!')
        connection.commit()


# except AttributeError as exc:
#     print(getLocalTimeHuman(),'Connection hasnt opened!',exc)
# except Exception as exc:
#     print(getLocalTimeHuman(),'Database insert error!',exc)
#     connection.rollback()

def updateLastWarnDate(connection, table, name, date, lastWarnDate):
    # try:
    with connection.cursor() as cursor:
        sql = 'update ' + table + ' set last_warn_date = ' + lastWarnDate + ' where date ="' + str(date) + \
              '" and name = "' + name + '";'
        # print (sql)
        cout = cursor.execute(sql)
        # if cout>=1:
        #     print(getLocalTimeHuman(),'LastWarnTime for',name,'has update!')
        connection.commit()


# except AttributeError as exc:
#     print(getLocalTimeHuman(),'Connection hasnt opened!',exc)
# except Exception as exc:
#     print(getLocalTimeHuman(),'Database insert error!',exc)
#     connection.rollback()

def updateRecoverDate(connection, table, name, recoverDate):
    # try:
    with connection.cursor() as cursor:
        sql = 'update ' + table + ' set recover_date = ' + recoverDate + ' where status = "recover" and name = "' + name + '" and recover_date is null;'
        # print (sql)
        cout = cursor.execute(sql)
        # if cout>=1:
        #     print(getLocalTimeHuman(),'LastWarnTime for',name,'has update!')
        connection.commit()


# except AttributeError as exc:
#     print(getLocalTimeHuman(),'Connection hasnt opened!',exc)
# except Exception as exc:
#     print(getLocalTimeHuman(),'Database insert error!',exc)
#     connection.rollback()

# 线程
def sendWarning():
    compareName = {'temp': {
        'g': '温度大于',
        'ge': '温度大于等于',
        'l': '温度小于',
        'le': '温度小于等于',
        'e': '温度等于',
        'ne': '温度不等于'
    },
        'humi': {
            'g': '湿度大于',
            'ge': '湿度大于等于',
            'l': '湿度小于',
            'le': '湿度小于等于',
            'e': '湿度等于',
            'ne': '湿度不等于'
        },
        'illu': {
            'g': '光照度大于',
            'ge': '光照度大于等于',
            'l': '光照度小于',
            'le': '光照度小于等于',
            'e': '光照度等于',
            'ne': '光照度不等于'
        },
        'press': {
            'g': '气压大于',
            'ge': '气压大于等于',
            'l': '气压小于',
            'le': '气压小于等于',
            'e': '气压等于',
            'ne': '气压不等于'
        },
        'haveco': {
            'g': '一氧化碳大于',
            'ge': '一氧化碳大于等于',
            'l': '一氧化碳小于',
            'le': '一氧化碳小于等于',
            'e': '一氧化碳等于',
            'ne': '一氧化碳不等于'}
    }
    global warnFreq, acqFreq, humi22, temp22, illuminance, haveco, pressure, temperature, altitude, sealevel_pressure
    try:
        connCloud = getConnection('118.25.46.104', 'DeltaV', '960123W78u', 'setting')
        connLocal = getConnection('localhost', 'root', '960123%W78u&', 'setting')
        smtpserver = 'smtp.qq.com'
        username = '1749491282'
        password = 'xsnamqlsyozmdjaa'
        sender = '1749491282@qq.com'
        subject = '【环境监测】触发监控告警'
        while (True):
            connCloud.commit()
            connLocal.commit()
            warning_list = travValue(connCloud, 'warning_list',
                                     'name,env_args,compare,value,phone,email,date,user,last_warn_date,status,islook')
            # print (warning_list)
            if warning_list:
                for (name, env_args, compare, value, phone, email, date, user, last_warn_date, status, islook) in warning_list:
                    if last_warn_date is None or (time.mktime(time.localtime(time.time())) - time.mktime(
                            time.strptime((str(last_warn_date)), "%Y-%m-%d %H:%M:%S"))) > (
                            warnFreq * 60 - 10) and status == 'warning':
                        curData = ''
                        if env_args == 'temp':
                            curData = str('%.1f' % temp22) + ' ℃'
                        elif env_args == 'humi':
                            curData = str('%.1f' % humi22) + ' %'
                        elif env_args == 'illu':
                            curData = str('%.1f' % illuminance) + ' lux'
                        elif env_args == 'press':
                            curData = str('%.1f' % pressure) + ' hPa'
                        elif env_args == 'haveco':
                            if haveco == 'Y':
                                curData = '有 一氧化碳'
                            else:
                                curData = '无 一氧化碳'
                        phone_email = travValue(connCloud, 'user_profile', 'phone,email', 'where name = "' + user + '"')
                        if phone_email:
                            if phone_email[0][0] is not None and phone == 'Y':
                                sendMsg(phone_email[0][0], compareName[env_args][compare], value, name, str(date), curData)
                            if phone_email[0][1] is not None and email == 'Y':
                                sendWarnEmail(smtpserver, username, password, sender, str(phone_email[0][1]), subject, user,
                                              compareName[env_args][compare],
                                              value, name, curData, date)
                        else:
                            pass #联系人不存在，告警策略已修改
                        updateLastWarnDate(connCloud, 'warning_list', name, date, getLocalTime())
            time.sleep(acqFreq)
    except KeyboardInterrupt:
        pass
    # except Exception as exc:
    #     print(getLocalTimeHuman(), 'thrSend:', exc)
    #     time.sleep(5)

def syncDatabase():
    pass

# LED闪烁线程&OLED刷新线程
def ledFlicker(redLED, greenLED, toggle_1, toggle_2, ftime):
    # global humi22, temp22, illuminance, haveco, pressure, temperature, altitude, sealevel_pressure
    GPIO.setmode(GPIO.BCM)
    GPIO.setwarnings(False)
    GPIO.setup(redLED, GPIO.OUT)
    GPIO.setup(greenLED, GPIO.OUT)
    GPIO.setup(toggle_1, GPIO.IN)
    GPIO.add_event_detect(toggle_1, GPIO.RISING, callback=oledToggleInt, bouncetime=700)
    GPIO.setup(toggle_2, GPIO.IN)
    GPIO.add_event_detect(toggle_2, GPIO.RISING, callback=statusToggleInt, bouncetime=500)
    GPIO.output(redLED, GPIO.LOW)
    GPIO.output(greenLED, GPIO.LOW)
    oled = OLED()
    seq = ['H', 'T', 'I', 'CO', 'P', 'AF']
    unit= {'H':'%', 'T':'C', 'I':' l', 'CO':'', 'P':'hPa', 'AF':'s'}
    isrunning = False
    isExecuted = False
    isOFF = False
    # try:
    while not isINT:                # 初始化：绿LED闪烁，等待所有线程正常启动
        data = {'H': round(humi22, 1), 'T': round(temp22, 1), 'I': int(illuminance), 'CO': haveco, 'P': round(pressure/100.0, 2), 'AF':int(acqFreq*60)}
        oled.getData(seq, data, unit)
        oled.showData(oledStatus)
        GPIO.output(greenLED, GPIO.HIGH)
        time.sleep(ftime)
        GPIO.output(greenLED, GPIO.LOW)
        time.sleep(ftime)
        if isFirstStarted is True:
            GPIO.output(greenLED, GPIO.LOW)
            break

    while not isINT:                #所有线程启动1次后
        if thrAcqAlive is False or thrSaveAlive is False or thrSendAlive is False:      # 如有线程未正常运行，则红LED闪烁
            isExecuted = False              # 是否已经使green LED常亮
            isrunning = False
            # 置空所有LED
            GPIO.output(greenLED, GPIO.LOW)
            GPIO.output(redLED, GPIO.LOW)
            # LED闪烁
            GPIO.output(redLED, GPIO.HIGH)
            time.sleep(ftime)
            GPIO.output(redLED, GPIO.LOW)
            time.sleep(ftime)
        else:                                   # 所有线程正常运行，绿LED常亮
            if not isExecuted:
                GPIO.output(redLED, GPIO.LOW)
                GPIO.output(greenLED, GPIO.HIGH)
                isExecuted = True
            if isrunning is False:
                print(getLocalTimeHuman(), 'All threads is running')
                isrunning = True

        if oledOFF:                 # 如果触发了按键1中断，则停止刷新OLED并熄灭屏幕
            if not isOFF:
                oled.clear()
                isOFF = True
            time.sleep(5)
            continue
        else:
            isOFF = False
        data = {'H': round(humi22, 1), 'T': round(temp22, 1), 'I': int(illuminance), 'CO': haveco, 'P': round(pressure/100.0, 2), 'AF':int(acqFreq*60)}
        oled.getData(seq, data, unit)
        oled.showData(oledStatus)
        time.sleep(1)

    oled.clear()    # 键盘中断，熄灭OLED屏幕
    # except Exception as exc:
    #     print(getLocalTimeHuman(), 'thrLED:', exc)

# 按键1中断，点亮/熄灭OLED屏幕
def oledToggleInt(self):
    global oledOFF
    oledOFF = not oledOFF
    if oledOFF:
        print(getLocalTimeHuman(), 'OLED OFF')
        oled.clear()
    else:
        print(getLocalTimeHuman(), 'OLED ON')
        oled.showData(oledStatus)

# 按键2中断，改变OLED显示内容
def statusToggleInt(self):
    global oledStatus
    oledStatus += 1
    if oledStatus == allStatus:
        oledStatus = 0
        print(getLocalTimeHuman(), 'Change display concent to Env_Args')
        oled.showData(oledStatus)         # 按键中断产生后，立即刷新OLED显示的内容
    else:
        print(getLocalTimeHuman(), 'Change display concent to Sys_Status')
        oled.showData(oledStatus)


def argParse():
    global oledOFF, oledStatus
    # Default setting
    oledOFF = False
    oledStatus = 0
    try:
        helpmsg = '''
        options:
            -h --help :Show help message
            -s --slient :Slient mode,turn off the oled
            -m --mode env/sys : Oled display mode:env or sys
        '''
        opts, args = getopt.getopt(sys.argv[1:], 'shm:', ['slient','help','mode='])
    except:
        print(helpmsg)
        sys.exit(2)
    for opt, arg in opts:
        if opt in ('-s', '--slient'):           # 静默模式
            oledOFF = True
            print('Slient Mode,OLED OFF')
        if opt in ('-h', '--help'):             # 输出帮助信息
            print(helpmsg)
            sys.exit(2)
        if opt in ('-m', '--mode'):             # 设置OLED显示模式
            if arg == 'env':
                oledStatus = 0
            elif arg == 'sys':
                oledStatus = 1


def main():
    try:
        global saveFreq
        global acqFreq
        global warnFreq
        global humi22, temp22, illuminance, haveco, pressure, temperature, altitude, sealevel_pressure
        global thrAcqAlive, thrSaveAlive, thrSendAlive, isFirstStarted
        global isINT, oledOFF, oledStatus, allStatus
        # GPIO.setmode(GPIO.BCM)
        # GPIO.setwarnings(False)

        isINT = False
        allStatus = 2
        humi22 = temp22 = illuminance = pressure = temperature = altitude = sealevel_pressure = -1
        haveco = 'E'
        acqFreq = 1/6
        isFirstStarted = False
        greenLED = 17
        redLED = 27
        toggle_1 = 26
        toggle_2 = 13
        thrLED = threading.Thread(target=ledFlicker, name='Thread_LED', args=(redLED, greenLED, toggle_1, toggle_2, .5))
        thrLED.setDaemon(True)
        thrLED.start()
        # GPIO.setup(greenLED, GPIO.OUT)
        # GPIO.setup(redLED,GPIO.OUT)
        #
        # GPIO.output(greenLED, GPIO.LOW)

        signal.signal(signal.SIGTERM, termHandler)

        thrAcq = threading.Thread(target = acquire, name= 'Thread_Acq')
        thrAcq.setDaemon(True)
        thrAcq.start()
        time.sleep(10)

        time.sleep(acqFreq * 60)
        thrSave = threading.Thread(target = insert, name = 'Thread_Save')
        thrSave.setDaemon(True)
        thrSave.start()
        thrSend = threading.Thread(target = sendWarning, name = 'Thread_Send')
        thrSend .setDaemon(True)
        thrSend.start()
        isFirstStarted = True

        while True:
            thrLEDAlive = thrAcqAlive = thrSaveAlive = thrSendAlive = False
            # for thread in threading.enumerate():
            #     threadName = str(str(thread).split(',', 1)[0]).split('(', 1)[1]
            #     # print(threadName)
            #     if threadName == 'Thread_Acq':
            #         thrAcqAlive = True
            #     elif threadName == 'Thread_Save':
            #         thrSaveAlive = True
            #     elif threadName == 'Thread_Send':
            #         thrSendAlive = True
            if thrLED.isAlive():
                thrLEDAlive = True
            if thrAcq.isAlive():
                thrAcqAlive = True
            if thrSave.isAlive():
                thrSaveAlive = True
            if thrSend.isAlive():
                thrSendAlive = True
            if not thrLEDAlive:
                print(getLocalTimeHuman(), 'Restarting LED thread!')
                thrLED = threading.Thread(target=ledFlicker, name='Thread_LED',args=(redLED, greenLED, toggle_1, toggle_2, .5))
                thrLED.setDaemon(True)
                thrLED.start()
            if not thrAcqAlive:
                acqFreq = 1/6
                print(getLocalTimeHuman(), 'Restarting Acquire thread!')
                thrAcq = threading.Thread(target=acquire, name='Thread_Acq')
                thrAcq.setDaemon(True)
                thrAcq.start()
                time.sleep(10)
                time.sleep(acqFreq * 60)
            if not thrSaveAlive:
                print(getLocalTimeHuman(), 'Restarting Save thread!')
                thrSave = threading.Thread(target=insert, name='Thread_Save')
                thrSave.setDaemon(True)
                thrSave.start()
            if not thrSendAlive:
                print(getLocalTimeHuman(), 'Restarting Send thread!')
                thrSend = threading.Thread(target=sendWarning, name='Thread_Send')
                thrSend.setDaemon(True)
                thrSend.start()
            # print(threading.enumerate())
            time.sleep(10)
    except KeyboardInterrupt:
        print('\n'+getLocalTimeHuman(), 'KeyboardInterrupt')
        greenLED = 17
        redLED = 27
        isINT = True
        time.sleep(2)                   # kill LED thread for turn off the OLED and two LED
        GPIO.output(greenLED, GPIO.LOW)
        GPIO.output(redLED, GPIO.LOW)
        exit(0)
    except Exception as exc:
        print(getLocalTimeHuman(), exc)
        greenLED = 17
        redLED = 27
        isINT = True
        time.sleep(2)  # kill LED thread for turn off the OLED and two LED
        GPIO.output(greenLED, GPIO.LOW)
        GPIO.output(redLED, GPIO.LOW)
        exit(0)

# 处理KeyboardsInterrupt
def termHandler(arg1, arg2):
    print (getLocalTimeHuman(), '\nCatch SIGTERM', arg1, arg2)
    global isINT
    greenLED = 17
    redLED = 27
    isINT = True
    time.sleep(2)  # kill LED thread for turn off the OLED and two LED
    GPIO.output(greenLED, GPIO.LOW)
    GPIO.output(redLED, GPIO.LOW)
    exit(0)

if __name__ == '__main__':
    argParse()
    main()
