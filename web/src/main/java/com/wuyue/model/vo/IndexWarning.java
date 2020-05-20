package com.wuyue.model.vo;

import java.util.Date;

/**
 * @author DeltaV235
 * @version 1.0
 * @className IndexWarning
 * @description 封装首页的告警信息
 * @date 2020/5/20 19:47
 */
public class IndexWarning {
    private Integer id;
    private String name;
    private String status;
    private Date lastTriggerTime;

    public IndexWarning(Integer id, String name, String status, Date lastTriggerTime) {
        this.id = id;
        this.name = name;
        this.status = status;
        this.lastTriggerTime = lastTriggerTime;
    }

    public IndexWarning() {
    }

    @Override
    public String toString() {
        return "IndexWarning{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", status='" + status + '\'' +
                ", lastTriggerTime=" + lastTriggerTime +
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
        this.name = name;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getLastTriggerTime() {
        return lastTriggerTime;
    }

    public void setLastTriggerTime(Date lastTriggerTime) {
        this.lastTriggerTime = lastTriggerTime;
    }
}
