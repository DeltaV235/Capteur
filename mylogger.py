#!/usr/bin/python3.4
# coding=utf-8

import time
import logging
import logging.config
import os
import coloredlogs      # 使StreamHandler能够根据level来改变文字颜色
# import logging.handlers

class mylogger():

    _loggerName = ''
    _logDirName = ''

    # Config for logger
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
                'filename': 'info.log',
                'encoding': 'utf-8',
                'when': 'MIDNIGHT',
                'interval': 1,
                'backupCount': 10,
                'formatter': 'common'
            },
            'error': {
                'level': 'ERROR',
                'class': 'logging.handlers.TimedRotatingFileHandler',
                'filename': 'error.log',
                'encoding': 'utf-8',
                'when': 'MIDNIGHT',
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

    # Create DIR if not exist,change work dir to DIR,output the *.log
    def __init__(self, loggerName, logDirName='log'):
        self._loggerName = loggerName
        self._logDirName = logDirName
        if not os.path.exists(self._logDirName):
            os.makedirs(self._logDirName)
            os.chdir(self._logDirName)
        else:
            os.chdir(self._logDirName)
        logging.config.dictConfig(self._dictConfig)
        self._logger = logging.getLogger(self._loggerName)
        # handler=StreamHandler,formatter=common. coloredlogs.coloredHandler will replace logging.StreamHandler
        coloredlogs.install(logger=self._logger,
                            level='INFO', fmt=self._dictConfig['formatters']['common']['format'],
                            datefmt=self._dictConfig['formatters']['common']['datefmt'])

    def tarLogs(self):  # 未完成，用于打包过往的log
        if not os.system('*.log.*'):
            if not os.system('tar -cf '):
                pass

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
    logger = mylogger('test_logger')
    logger.info('test_message!')
