package com.wuyue.model.vo;

import com.wuyue.model.entity.Conditions;
import com.wuyue.model.entity.Contact;

import java.util.Date;
import java.util.List;

/**
 * @author DeltaV235
 * @version 1.0
 * @className Rule
 * @description 每一条告警规则的所有信息
 * @date 2020/5/17 21:29
 */
public class Rule {
    private String name;
    private Integer id;
    private String status;
    private String level;
    private String description;
    private List<Conditions> conditions;
    private Date createTime;
    private Date lastTriggerTime;
    private List<Contact> contacts;

    @Override
    public String toString() {
        return "Rule{" +
                "name='" + name + '\'' +
                ", id=" + id +
                ", status='" + status + '\'' +
                ", level='" + level + '\'' +
                ", description='" + description + '\'' +
                ", conditions=" + conditions +
                ", createTime=" + createTime +
                ", lastTriggerTime=" + lastTriggerTime +
                ", contacts=" + contacts +
                '}';
    }

    public Rule() {
    }

    public Rule(String name, Integer id, String status, String level, String description, List<Conditions> conditions, Date createTime, Date lastTriggerTime, List<Contact> contacts) {
        this.name = name;
        this.id = id;
        this.status = status;
        this.level = level;
        this.description = description;
        this.conditions = conditions;
        this.createTime = createTime;
        this.lastTriggerTime = lastTriggerTime;
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

    public List<Conditions> getConditions() {
        return conditions;
    }

    public void setConditions(List<Conditions> conditions) {
        this.conditions = conditions;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getLastTriggerTime() {
        return lastTriggerTime;
    }

    public void setLastTriggerTime(Date lastTriggerTime) {
        this.lastTriggerTime = lastTriggerTime;
    }

    public List<Contact> getContacts() {
        return contacts;
    }

    public void setContacts(List<Contact> contacts) {
        this.contacts = contacts;
    }
}
