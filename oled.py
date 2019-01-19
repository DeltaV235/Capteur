# coding=utf-8

import time
import os
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
    __envImage = Image.new('1', (__width, __height))
    __sysImage = Image.new('1', (__width, __height))
    __blackImage = Image.new('1', (__width, __height))

    # Get drawing object to draw on image.
    __envDraw = ImageDraw.Draw(__envImage)
    __sysDraw = ImageDraw.Draw(__sysImage)

    # First define some constants to allow easy resizing of shapes.
    __xpadding = 0
    __ypadding = -2
    __top = __ypadding
    __bottom = __height - __ypadding
    __left = __xpadding
    __right = __width - __xpadding
    # Move left to right keeping track of the current x position for drawing shapes.
    # __x = __padding

    # Load default font.
    __font = ImageFont.load_default()

    # __offset = 0
    # 数据变量
    __seq = []
    __data = {}
    __unit = {}

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

    def getData(self, seq, data, unit):
        self.__seq = seq
        self.__data = data
        self.__unit = unit

    def showData(self, status):
        # self.__image = self.__blackImage.copy()
        # self.__disp.clear()
        # self.__disp.display()
        x = self.__left
        y = self.__top
        xoffset = 0   # 列偏移量
        xstep = 10   # 列距(像素)
        ystep = 8   # 行距(像素)
        row = 0     # 行
        col = 0     # 列
        temp = 0    # 最小列距
        charrate = 6.2  # 字符/像素点

        # self.__draw.rectangle((x, y, self.__right, self.__bottom), outline=1, fill=0)  # show area
        if status == 0:
            self.__envDraw.rectangle((0, -2, self.__width, self.__height), outline=0, fill=0)  # edge area , refresh whole OLED
            for title in self.__seq:
                string = title + ':' + str(self.__data[title]) + self.__unit[title]
                if charrate * len(string) > temp:
                    temp = charrate * len(string)
                self.__envDraw.text((x + xoffset, y + row * ystep), string, font=self.__font, fill=255)
                row += 1
                if row == 4:  # 4行换列
                    row = 0
                    col += 1
                    xoffset += temp + xstep
                    temp = 0
            self.__disp.image(self.__envImage)

        if status == 1:
            self.__sysDraw.rectangle((0, -2, self.__width, self.__height), outline=0, fill=0)  # edge area , refresh whole OLED
            # Shell scripts for system monitoring from here : https://unix.stackexchange.com/questions/119126/command-to-display-memory-usage-disk-usage-and-cpu-load
            # cmd = "hostname -I | cut -d\' \' -f1"
            # IP = subprocess.check_output(cmd, shell=True)
            # cmd = "top -bn1 | grep load | awk '{printf \"CPU Load: %.2f\", $(NF-2)}'"
            # CPU = subprocess.check_output(cmd, shell=True)
            # cmd = "free -m | awk 'NR==2{printf \"Mem: %s/%sMB %.2f%%\", $3,$2,$3*100/$2 }'"
            # MemUsage = subprocess.check_output(cmd, shell=True)
            # cmd = "df -h | awk '$NF==\"/\"{printf \"Disk: %d/%dGB %s\", $3,$2,$5}'"
            # Disk = subprocess.check_output(cmd, shell=True)
            ip = os.popen('hostname -I | cut -d\' \' -f1').read()
            cpu = os.popen('top -bn1 | grep load | awk \'{printf \"CPU Load: %.2f\", $(NF-2)}\'').read()
            mem = os.popen('free -m | awk \'NR==2{printf \"Mem: %s/%sMB %.2f%%\", $3,$2,$3*100/$2 }\'').read()
            disk = os.popen('df -h | awk \'$NF==\"/\"{printf \"Disk: %d/%dGB %s\", $3,$2,$5}\'').read()
            # Write two lines of text.
            self.__sysDraw.text((x, y), "IP: " + ip, font=self.__font, fill=255)
            self.__sysDraw.text((x, y + ystep), cpu, font=self.__font, fill=255)
            self.__sysDraw.text((x, y + 2*ystep), mem, font=self.__font, fill=255)
            self.__sysDraw.text((x, y + 3*ystep), disk, font=self.__font, fill=255)
            self.__disp.image(self.__sysImage)

        self.__disp.display()

        # Display image.
        # self.__image.save('./display_test.png')



    def clear(self):
        self.__disp.image(self.__blackImage)
        self.__disp.display()


if __name__ == '__main__':
    seq = ['temp', 'humi', 'illu', 'test', 'test2']
    data = {'temp':20, 'humi':60, 'illu':200, 'test':1, 'test2':2}
    unit = {'temp':'C', 'humi':'%', 'illu':'l', 'test':'', 'test2':''}
    # data = [20 ,60 ,200 ,1 ]
    oled = oledDisplay()
    # oled.showData(seq, data, unit)