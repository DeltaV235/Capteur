package com.wuyue.constant.enums;

/**
 * @author DeltaV235
 * @version 1.0
 * @className RuleStatus
 * @description
 * @date 2020/5/18 2:37
 */
public enum RuleStatus {
    ENABLE("e"),
    DISABLE("d"),
    SUPPRESS("s");

    private String status;

    RuleStatus(String status) {
        this.status = status;
    }

    public String getStatus() {
        return status;
    }
}
