package com.wuyue.controller.exception;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

/**
 * @author DeltaV235
 * @version 1.0
 * @className CommonExceptionHandler
 * @description 用于处理controller中抛出的异常, 通用异常处理类
 * @date 2020/5/14 0:54
 */
@ControllerAdvice
public class CommonExceptionHandler {
    private final Logger logger = LoggerFactory.getLogger(getClass());

    @ExceptionHandler(Exception.class)
    public String genericExceptionHandler(Exception exception) {
        logger.warn("exception message: " + exception.getMessage(), exception);

        return "500";
    }

}
