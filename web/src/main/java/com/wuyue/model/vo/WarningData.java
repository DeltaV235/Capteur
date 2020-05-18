package com.wuyue.model.vo;

import com.wuyue.model.entity.Conditions;
import com.wuyue.model.entity.Contact;
import com.wuyue.model.entity.SensorData;

import java.util.Date;
import java.util.List;

/**
 * @author DeltaV235
 * @version 1.0
 * @className WarningData
 * @description 每一条告警记录的所有信息
 * @date 2020/5/19 2:12
 */
public class WarningData {
    private String name;
    private Integer id;
    private String status;
    private Integer ruleId;
    private Date startTime;
    private Date lastTriggerTime;
    private Date recoverTime;

    private String level;
    private String description;

    private SensorData curSensorData;

    private List<Conditions> conditions;

    private List<Contact> contacts;

    @Override
    public String toString() {
        return "WarningData{" +
                "name='" + name + '\'' +
                ", id=" + id +
                ", status='" + status + '\'' +
                ", ruleId=" + ruleId +
                ", startTime=" + startTime +
                ", lastTriggerTime=" + lastTriggerTime +
                ", recoverTime=" + recoverTime +
                ", level='" + level + '\'' +
                ", description='" + description + '\'' +
                ", curSensorData=" + curSensorData +
                ", conditions=" + conditions +
                ", contacts=" + contacts +
                '}';
    }

    public WarningData() {
    }

    public WarningData(String name, Integer id, String status, Integer ruleId, Date startTime, Date lastTriggerTime, Date recoverTime, String level, String description, SensorData curSensorData, List<Conditions> conditions, List<Contact> contacts) {
        this.name = name;
        this.id = id;
        this.status = status;
        this.ruleId = ruleId;
        this.startTime = startTime;
        this.lastTriggerTime = lastTriggerTime;
        this.recoverTime = recoverTime;
        this.level = level;
        this.description = description;
        this.curSensorData = curSensorData;
        this.conditions = conditions;
        this.contacts = contacts;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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
        this.status = status;
    }

    public Integer getRuleId() {
        return ruleId;
    }

    public void setRuleId(Integer ruleId) {
        this.ruleId = ruleId;
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

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public SensorData getCurSensorData() {
        return curSensorData;
    }

    public void setCurSensorData(SensorData curSensorData) {
        this.curSensorData = curSensorData;
    }

    public List<Conditions> getConditions() {
        return conditions;
    }

    public void setConditions(List<Conditions> conditions) {
        this.conditions = conditions;
    }

    public List<Contact> getContacts() {
        return contacts;
    }

    public void setContacts(List<Contact> contacts) {
        this.contacts = contacts;
    }
}
