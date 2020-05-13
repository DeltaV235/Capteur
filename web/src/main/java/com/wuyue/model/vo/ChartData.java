package com.wuyue.model.vo;

import java.util.Date;

/**
 * @author DeltaV235
 * @version 1.0
 * @className ChartData
 * @description 图表所用的vo
 * @date 2020/5/14 2:06
 */
public class ChartData {
    private Date date;
    private Double temp;
    private Double humi;
    private Double press;
    private Double light;

    public ChartData() {
    }

    public ChartData(Date date, Double temp, Double humi, Double press, Double light) {
        this.date = date;
        this.temp = temp;
        this.humi = humi;
        this.press = press;
        this.light = light;
    }

    @Override
    public String toString() {
        return "ChartData{" +
                "date=" + date +
                ", temp=" + temp +
                ", humi=" + humi +
                ", press=" + press +
                ", light=" + light +
                '}';
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

    public Double getPress() {
        return press;
    }

    public void setPress(Double press) {
        this.press = press;
    }

    public Double getLight() {
        return light;
    }

    public void setLight(Double light) {
        this.light = light;
    }
}
