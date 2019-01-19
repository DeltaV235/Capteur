#!/usr/bin/python3.4
# coding=utf-8

import datetime,time
import logging, logging.config

class mylogger():

    _dictConfig = {
        'version': 1,
        'disable_existing_loggers': True,
        'formatters': {
            'common': {
                'format': '%(levelname)-9s%(asctime)s %(threadName)s: %(message)s',
                'datefmt': '%Y-%m-%d %H:%M:%S'
            }
        },
        'handlers': {
            'file': {
                'level': 'INFO',
                'class': 'logging.handlers.TimedRotatingFileHandler',
                'filename': str(datetime.date.today())+'.log',
                'encoding': 'utf-8',
                'when': 'D',
                'interval': 1,
                'formatter': 'common'
            },
            'console': {
                'level': 'INFO',
                'class': 'logging.StreamHandler',
                'formatter': 'common'
            }
        },
        'loggers': {
            'ems': {
                'handlers': ['file', 'console'],
                'level': 'INFO'
            }
        }
    }
    def __init__(self, loggerName):
        logging.config.dictConfig(self._dictConfig)
        self._logger = logging.getLogger(loggerName)

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
