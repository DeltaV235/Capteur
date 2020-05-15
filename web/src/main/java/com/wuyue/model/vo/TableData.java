package com.wuyue.model.vo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.wuyue.model.entity.SensorData;

import java.util.List;

/**
 * @author DeltaV235
 * @version 1.0
 * @className TableData
 * @description 响应给DataTable的数据结构
 * @date 2020/5/15 20:33
 */
public class TableData {
    private Integer draw;
    private Integer recordsTotal;
    private Integer recordsFiltered;
    private List<SensorData> data;
    @JsonIgnore
    private String error;

    public TableData() {
    }

    public TableData(Integer draw, Integer recordsTotal, Integer recordsFiltered, List<SensorData> data, String error) {
        this.draw = draw;
        this.recordsTotal = recordsTotal;
        this.recordsFiltered = recordsFiltered;
        this.data = data;
        this.error = error;
    }

    public Integer getDraw() {
        return draw;
    }

    public void setDraw(Integer draw) {
        this.draw = draw;
    }

    public Integer getRecordsTotal() {
        return recordsTotal;
    }

    public void setRecordsTotal(Integer recordsTotal) {
        this.recordsTotal = recordsTotal;
    }

    public Integer getRecordsFiltered() {
        return recordsFiltered;
    }

    public void setRecordsFiltered(Integer recordsFiltered) {
        this.recordsFiltered = recordsFiltered;
    }

    public List<SensorData> getData() {
        return data;
    }

    public void setData(List<SensorData> data) {
        this.data = data;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }
}
