#!/usr/bin/python3.4
# coding=utf-8

import datetime,time
import logging,logging.config

class mylogger():

    def __init__(self, loggerName):
        # create logger
        self._logger = logging.getLogger(loggerName)
        self._logger.setLevel(logging.INFO)
        # create fileHandler
        self._fh = logging.FileHandler(str(datetime.date.today())+'.log', mode='a', encoding='utf-8')
        # self._fh = logging.FileHandler(localtime + '.log', mode='a', encoding='utf-8')
        self._fh.setLevel(logging.INFO)

        self._fmt = logging.Formatter(fmt='%(levelname)s\t%(asctime)s %(threadName)s: %(message)s', datefmt='%Y-%m-%d %H:%M:%S')
        self._fh.formatter = self._fmt

        self._logger.addHandler(self._fh)

    def info(self, msg):
        self._logger.info(msg)
    def warning(self, msg):
        self._logger.warning(msg)
    def error(self, msg):
        self._logger.error(msg)
    def critical(self, msg):
        self._logger.critical(msg)
    def exception(self,msg):
        self._logger.exception(msg)

if __name__ == '__main__':
    logger = mylogger('ems')
    logger.info('test_message!')
