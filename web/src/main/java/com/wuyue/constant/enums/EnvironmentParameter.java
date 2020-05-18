package com.wuyue.constant.enums;

/**
 * @author DeltaV235
 * @version 1.0
 * @className EnvironmentParameter
 * @description 表示能够处理的环境参数
 * @date 2020/5/14 13:26
 */
public enum EnvironmentParameter {
    TEMPERATURE("t", -20, 50),
    HUMIDITY("h", 0, 100),
    PRESSURE("p", 900, 1200),
    LIGHT("l",0, 30000);

    private String paramName;
    private double maxValue;
    private double minValue;

    EnvironmentParameter(String paramName, double maxValue, double minValue) {
        this.paramName = paramName;
        this.maxValue = maxValue;
        this.minValue = minValue;
    }

    public String getParamName() {
        return paramName;
    }

    public double getMaxValue() {
        return maxValue;
    }

    public double getMinValue() {
        return minValue;
    }
}
