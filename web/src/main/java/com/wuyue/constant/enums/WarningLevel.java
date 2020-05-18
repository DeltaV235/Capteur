package com.wuyue.constant.enums;

/**
 * @author DeltaV235
 * @version 1.0
 * @className WarningLevel
 * @description
 * @date 2020/5/18 2:39
 */
public enum WarningLevel {
    INFO("e"),
    WARN("w"),
    ERROR("e");

    private String level;

    WarningLevel(String level) {
        this.level = level;
    }

    public String getLevel() {
        return level;
    }

}
