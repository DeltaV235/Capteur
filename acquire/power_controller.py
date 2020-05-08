# coding=utf-8

import RPi.GPIO as  GPIO
import time


class PowerControl:

    pin3_3v_up = 22           # 用于控制 OLED GY-30 BMP180 LED Button
    pin3_3v_down = 23         # 用于控制 DHT22 MQ-7

    def __init__(self, logger):
        self.logger = logger
        GPIO.setmode(GPIO.BCM)
        GPIO.setwarnings(False)
        GPIO.setup(self.pin3_3v_up, GPIO.OUT)
        GPIO.setup(self.pin3_3v_down, GPIO.OUT)
        GPIO.output(self.pin3_3v_up, GPIO.HIGH)
        GPIO.output(self.pin3_3v_down, GPIO.HIGH)
        logger.warning('Power ON!')
        time.sleep(1)

    def set_high(self, pin):
        GPIO.output(pin, GPIO.HIGH)
        self.logger.warning('Pin ' + str(pin) + ' Power UP!')

    def set_low(self, pin):
        GPIO.output(pin, GPIO.LOW)
        self.logger.warning('Pin ' + str(pin) + ' Power DOWN!')

    def power_off(self):
        GPIO.setmode(GPIO.BCM)
        GPIO.setup(self.pin3_3v_up, GPIO.OUT)
        GPIO.setup(self.pin3_3v_down, GPIO.OUT)
        self.set_low(self.pin3_3v_up)
        self.set_low(self.pin3_3v_down)
        self.logger.warning('Power OFF!')
