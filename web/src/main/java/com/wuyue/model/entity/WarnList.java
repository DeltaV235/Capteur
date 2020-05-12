package com.wuyue.model.entity;

import java.util.Date;

public class WarnList {
    private Integer id;

    private String status;

    private Date startTime;

    private Date lastTriggerTime;

    private Date recoverTime;

    private Date suppressStartTime;

    private Date suppressTime;

    private Integer ruleId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getLastTriggerTime() {
        return lastTriggerTime;
    }

    public void setLastTriggerTime(Date lastTriggerTime) {
        this.lastTriggerTime = lastTriggerTime;
    }

    public Date getRecoverTime() {
        return recoverTime;
    }

    public void setRecoverTime(Date recoverTime) {
        this.recoverTime = recoverTime;
    }

    public Date getSuppressStartTime() {
        return suppressStartTime;
    }

    public void setSuppressStartTime(Date suppressStartTime) {
        this.suppressStartTime = suppressStartTime;
    }

    public Date getSuppressTime() {
        return suppressTime;
    }

    public void setSuppressTime(Date suppressTime) {
        this.suppressTime = suppressTime;
    }

    public Integer getRuleId() {
        return ruleId;
    }

    public void setRuleId(Integer ruleId) {
        this.ruleId = ruleId;
    }
}