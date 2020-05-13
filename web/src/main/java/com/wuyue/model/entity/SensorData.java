package com.wuyue.model.entity;

import java.util.Date;

public class SensorData {
    private Integer id;

    private Date date;

    private Double temp;

    private Double humi;

    private Double light;

    private Double press;

    public SensorData() {
    }

    public SensorData(Integer id, Date date, Double temp, Double humi, Double light, Double press) {
        this.id = id;
        this.date = date;
        this.temp = temp;
        this.humi = humi;
        this.light = light;
        this.press = press;
    }

    @Override
    public String toString() {
        return "SensorData{" +
                "id=" + id +
                ", date=" + date +
                ", temp=" + temp +
                ", humi=" + humi +
                ", light=" + light +
                ", press=" + press +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Double getTemp() {
        return temp;
    }

    public void setTemp(Double temp) {
        this.temp = temp;
    }

    public Double getHumi() {
        return humi;
    }

    public void setHumi(Double humi) {
        this.humi = humi;
    }

    public Double getLight() {
        return light;
    }

    public void setLight(Double light) {
        this.light = light;
    }

    public Double getPress() {
        return press;
    }

    public void setPress(Double press) {
        this.press = press;
    }
}