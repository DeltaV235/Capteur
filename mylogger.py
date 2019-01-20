#!/usr/bin/python3.4
# coding=utf-8

import time
import logging
import logging.config
import os
import coloredlogs


class mylogger():

    _loggerName = ''
    _logDirName = ''

    _dictConfig = {
        'version': 1,
        'disable_existing_loggers': True,
        'formatters': {
            'common': {
                'format': '%(levelname)-9s%(asctime)s  %(threadName)-12s: %(message)s',
                'datefmt': '%Y-%m-%d %H:%M:%S'
            },
            'error': {
                'format': '%(levelname)-9s%(asctime)s %(name)s %(processName)s[%(process)d] %(threadName)s[%(thread)d]: %(message)s',
                'datefmt': '%Y-%m-%d %H:%M:%S'
            }
        },
        'handlers': {
            'file': {
                'level': 'INFO',
                'class': 'logging.handlers.TimedRotatingFileHandler',
                'filename': 'ems-'+str(time.strftime('%Y%m%d', time.localtime())) + '-info.log',
                'encoding': 'utf-8',
                'when': 'D',
                'interval': 1,
                'formatter': 'common'
            },
            'error': {
                'level': 'ERROR',
                'class': 'logging.handlers.TimedRotatingFileHandler',
                'filename': 'ems-'+str(time.strftime('%Y%m%d', time.localtime())) + '-error.log',
                'encoding': 'utf-8',
                'when': 'D',
                'interval': 1,
                'formatter': 'error'
            }
        },
        'loggers': {
            'ems': {
                'handlers': ['file', 'error'],
                'level': 'INFO'
            }
        }
    }
    def __init__(self, loggerName, logDirName='log'):
        self._loggerName = loggerName
        self._logDirName = logDirName
        if not os.path.exists(self._logDirName):
            os.mkdir(self._logDirName)
            os.chdir(self._logDirName)
        else:
            os.chdir(self._logDirName)
        logging.config.dictConfig(self._dictConfig)
        self._logger = logging.getLogger(self._loggerName)
        coloredlogs.install(logger=self._logger,
                            level='INFO', fmt=self._dictConfig['formatters']['common']['format'],
                            datefmt=self._dictConfig['formatters']['common']['datefmt'])

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
