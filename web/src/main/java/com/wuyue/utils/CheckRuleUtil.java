package com.wuyue.utils;

import com.wuyue.constant.enums.EnvironmentParameter;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;

import static com.wuyue.constant.enums.EnvironmentParameter.*;

/**
 * @author DeltaV235
 * @version 1.0
 * @className CheckRuleUtil
 * @description 用于检查告警是否触发的工具类
 * @date 2020/5/19 0:54
 */
public class CheckRuleUtil {
    /**
     * @param expression 执行判断的表达式
     * @return true/false
     * @author DeltaV235
     * @date 2020/5/19 0:55
     * @description 将两个数比较的字符串当做js代码执行, 并返回布尔值
     */
    public static boolean eval(String expression) throws ScriptException {
        ScriptEngineManager scriptEngineManager = new ScriptEngineManager();
        ScriptEngine js = scriptEngineManager.getEngineByName("js");
        return (boolean) js.eval(expression);
    }

    /**
     * @param param EnvParam对应的字符串
     * @return EnvParam
     * @author DeltaV235
     * @date 2020/5/19 14:44
     * @description 根据传入的字符串返回对应的EnvironmentParameter类对象
     */
    public static EnvironmentParameter getEnvirParamByString(String param) {
//        if (Strings.isNullOrEmpty(param))
//            throw new RuntimeException("入参为空或null");
        if (TEMPERATURE.getParamName().equals(param))
            return TEMPERATURE;
        else if (HUMIDITY.getParamName().equals(param))
            return HUMIDITY;
        else if (LIGHT.getParamName().equals(param))
            return LIGHT;
        else if (PRESSURE.getParamName().equals(param))
            return PRESSURE;
        else
            throw new RuntimeException("传入字符串不正确: " + param);
    }
}
