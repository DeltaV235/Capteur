package com.wuyue.service.impl;

import com.wuyue.mapper.RuleListMapper;
import com.wuyue.model.vo.Rule;
import com.wuyue.service.intf.RuleService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author DeltaV235
 * @version 1.0
 * @className RuleServiceImpl
 * @description
 * @date 2020/5/17 21:16
 */
@Service
public class RuleServiceImpl implements RuleService {
    private final RuleListMapper ruleListMapper;
    private final Logger logger = LoggerFactory.getLogger(getClass());

    public RuleServiceImpl(RuleListMapper ruleListMapper) {
        this.ruleListMapper = ruleListMapper;
    }

    @Override
    public List<Rule> getAllRules() {
        return ruleListMapper.selectAllRuleData();
    }
}
