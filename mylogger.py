#!/usr/bin/python3.4
# coding=utf-8

import logging

class mylogger():

    def __init__(self, loggerName):
        # create logger
        self._logger = logging.getLogger(loggerName)
        self._logger.setLevel(logging.INFO)

        # create fileHandler
        self._fh = logging.FileHandler('test.log', mode='a', encoding='utf-8')
        self._fh.setLevel(logging.INFO)
        self._logger.addHandler(self._fh)



    def info(self, msg):
        self._logger.info(self))

if __name__ == '__main__':
    logger = mylogger('ems')
    logger.info('hehe')
