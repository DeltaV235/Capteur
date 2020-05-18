package com.wuyue.utils;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;

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
        System.out.println(expression);
        ScriptEngineManager scriptEngineManager = new ScriptEngineManager();
        ScriptEngine js = scriptEngineManager.getEngineByName("js");
        return (boolean) js.eval(expression);
    }
}
