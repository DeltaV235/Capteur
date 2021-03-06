package com.wuyue.service.intf;

import com.wuyue.model.entity.RuleList;
import com.wuyue.model.vo.Rule;

import java.util.List;

/**
 * @author DeltaV235
 * @version 1.0
 * @className RuleService
 * @description 处理告警规则的service
 * @date 2020/5/17 21:16
 */
public interface RuleService {
    boolean enaRule(Integer id);

    boolean disRule(Integer id);

    List<Rule> getAllRules();

    boolean addRule(RuleList ruleList, String param, String data, String contact);

    boolean delRule(Integer id);
}
