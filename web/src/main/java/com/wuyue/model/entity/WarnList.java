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

    public WarnList() {
    }

    public WarnList(Integer id, String status, Date startTime, Date lastTriggerTime, Date recoverTime, Date suppressStartTime, Date suppressTime, Integer ruleId) {
        this.id = id;
        this.status = status;
        this.startTime = startTime;
        this.lastTriggerTime = lastTriggerTime;
        this.recoverTime = recoverTime;
        this.suppressStartTime = suppressStartTime;
        this.suppressTime = suppressTime;
        this.ruleId = ruleId;
    }

    @Override
    public String toString() {
        return "WarnList{" +
                "id=" + id +
                ", status='" + status + '\'' +
                ", startTime=" + startTime +
                ", lastTriggerTime=" + lastTriggerTime +
                ", recoverTime=" + recoverTime +
                ", suppressStartTime=" + suppressStartTime +
                ", suppressTime=" + suppressTime +
                ", ruleId=" + ruleId +
                '}';
    }

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