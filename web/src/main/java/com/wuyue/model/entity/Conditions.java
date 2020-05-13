package com.wuyue.model.entity;

public class Conditions {
    private Integer id;

    private String param;

    private String symbol;

    private Double data;

    private Integer ruleId;

    public Conditions() {
    }

    public Conditions(Integer id, String param, String symbol, Double data, Integer ruleId) {
        this.id = id;
        this.param = param;
        this.symbol = symbol;
        this.data = data;
        this.ruleId = ruleId;
    }

    @Override
    public String toString() {
        return "Conditions{" +
                "id=" + id +
                ", param='" + param + '\'' +
                ", symbol='" + symbol + '\'' +
                ", data=" + data +
                ", ruleId=" + ruleId +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getParam() {
        return param;
    }

    public void setParam(String param) {
        this.param = param == null ? null : param.trim();
    }

    public String getSymbol() {
        return symbol;
    }

    public void setSymbol(String symbol) {
        this.symbol = symbol == null ? null : symbol.trim();
    }

    public Double getData() {
        return data;
    }

    public void setData(Double data) {
        this.data = data;
    }

    public Integer getRuleId() {
        return ruleId;
    }

    public void setRuleId(Integer ruleId) {
        this.ruleId = ruleId;
    }
}