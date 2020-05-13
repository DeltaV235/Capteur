package com.wuyue.model.entity;

import java.util.Date;

public class RuleList {
    private Integer id;

    private String name;

    private String status;

    private String level;

    private Date createTime;

    private String description;

    public RuleList() {
    }

    public RuleList(Integer id, String name, String status, String level, Date createTime, String description) {
        this.id = id;
        this.name = name;
        this.status = status;
        this.level = level;
        this.createTime = createTime;
        this.description = description;
    }

    @Override
    public String toString() {
        return "RuleList{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", status='" + status + '\'' +
                ", level='" + level + '\'' +
                ", createTime=" + createTime +
                ", description='" + description + '\'' +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level == null ? null : level.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }
}