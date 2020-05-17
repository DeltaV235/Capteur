package com.wuyue.model.vo;

import java.util.List;

/**
 * @author DeltaV235
 * @version 1.0
 * @className RuleData
 * @description 用于封装至ResultEntity对象中的数据
 * @date 2020/5/17 21:24
 */
public class RuleData {
    private List<Rule> rules;

    public RuleData() {
    }

    public RuleData(List<Rule> rules) {
        this.rules = rules;
    }

    public List<Rule> getRules() {
        return rules;
    }

    public void setRules(List<Rule> rules) {
        this.rules = rules;
    }
}
