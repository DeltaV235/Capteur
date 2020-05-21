package com.wuyue.model.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.wuyue.constant.enums.EnvironmentParameter;

import java.util.Date;
import java.util.Objects;

import static com.wuyue.constant.enums.EnvironmentParameter.*;

public class SensorData {
    @JsonIgnore
    private Integer id;

    @JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss")
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

    public Double getValueByEnvironmentParameter(EnvironmentParameter environmentParameter) {
        Objects.requireNonNull(environmentParameter, "入参不能为null");
        if (environmentParameter == TEMPERATURE)
            return getTemp();
        else if (environmentParameter == HUMIDITY)
            return getHumi();
        else if (environmentParameter == LIGHT)
            return getLight();
        else if (environmentParameter == PRESSURE)
            return getPress();
        return null;
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
        if (light == null)
            return null;
        return Math.round(light * 10) / 10.0;
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