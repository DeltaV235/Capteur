# coding=utf-8

import time

import RPi.GPIO as GPIO
import Adafruit_GPIO.SPI as SPI
import Adafruit_SSD1306

from PIL import Image
from PIL import ImageDraw
from PIL import ImageFont

class oledDisplay():
    # Raspberry Pi pin configuration:
    __RST = 24
    # Note the following are only used with SPI:
    __DC = 23
    __SPI_PORT = 0
    __SPI_DEVICE = 0

    # Beaglebone Black pin configuration:
    # RST = 'P9_12'
    # Note the following are only used with SPI:
    # DC = 'P9_15'
    # SPI_PORT = 1
    # SPI_DEVICE = 0

    # 128x32 display with hardware I2C:
    __disp = Adafruit_SSD1306.SSD1306_128_32(rst=__RST)

    # # Initialize library.
    # __disp.begin()
    #
    # # Clear display.
    # __disp.clear()
    # __disp.display()

    # Create blank image for drawing.
    # Make sure to create image with mode '1' for 1-bit color.
    __width = __disp.width
    __height = __disp.height
    __image = Image.new('1', (__width, __height))
    __blackImage = __image.copy()

    # Get drawing object to draw on image.
    __draw = ImageDraw.Draw(__image)

    # First define some constants to allow easy resizing of shapes.
    __padding = 3
    __top = __padding
    __bottom = __height - __padding
    __left = __padding
    __right = __width - __padding
    # Move left to right keeping track of the current x position for drawing shapes.
    # __x = __padding

    # Load default font.
    __font = ImageFont.load_default()

    __offset = 0

    def __init__(self):
        # Initialize library.
        self.__disp.begin()

        # Clear display.
        self.__disp.clear()
        self.__disp.display()
        time.sleep(.1)



    # def showDataDist(self, data):
    #     __step = 0
    #     for (title, value) in data.items():
    #         self.__draw.text((self.__x,self. __top + __step), title + ':' + str(value), font=self.__font, fill=255)
    #         __step += 8
    #     # self.__draw.text((self.__x, self.__top+7 ), 'World!', font=self.__font, fill=255)
    #
    #     # Display image.
    #     self.__disp.image(self.__image)
    #     self.__disp.display()



    def showData(self, seq, data, unit):
        # self.__image = self.__blackImage.copy()
        # self.__disp.clear()
        # self.__disp.display()
        x = self.__padding
        y = self.__top
        xoffset = 0   # 列偏移量
        xstep = 10   # 列距
        ystep = 8   # 行距
        row = 0     # 行
        col = 0     # 列
        temp = 0    # 最小列距
        charrate = 6.2  # 字符/像素点
        self.__draw.rectangle((0, 0, self.__width - 1, self.__height - 1), outline=1, fill=0)  # edge area , refresh OLED
        # self.__draw.rectangle((x, y, self.__right, self.__bottom), outline=1, fill=0)  # show area
        for title in seq:
            string = title + ':' + str(data[title]) + unit[title]
            if charrate * len(string) > temp:
                temp = charrate * len(string)
            self.__draw.text((x + xoffset, y + row * ystep), string, font=self.__font, fill=255)
            row += 1
            if row == 3:  # 3行换列
                row = 0
                col += 1
                xoffset += temp + xstep
                temp = 0

        # Display image.
        # self.__image.save('./display_test.png')
        self.__disp.image(self.__image)
        self.__disp.display()


    def clear(self):
        self.__draw.rectangle((0, 0, self.__width - 1, self.__height - 1), outline=0, fill=0)  # edge area , refresh OLED
        self.__disp.image(self.__image)
        self.__disp.display()


if __name__ == '__main__':
    seq = ['temp', 'humi', 'illu', 'test', 'test2']
    data = {'temp':20, 'humi':60, 'illu':200, 'test':1, 'test2':2}
    unit = {'temp':'C', 'humi':'%', 'illu':'l', 'test':'', 'test2':''}
    # data = [20 ,60 ,200 ,1 ]
    oled = oledDisplay()
    oled.showData(seq, data, unit)