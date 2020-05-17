package com.wuyue.controller;

import com.wuyue.model.vo.Rule;
import com.wuyue.service.intf.RuleService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

/**
 * @author DeltaV235
 * @version 1.0
 * @className RuleController
 * @description 处理告警规则页面的所有请求
 * @date 2020/5/17 21:15
 */
@Controller
public class RuleController {
    private final RuleService ruleService;
    private final Logger logger = LoggerFactory.getLogger(getClass());

    public RuleController(RuleService ruleService) {
        this.ruleService = ruleService;
    }

    /**
     * @author DeltaV235
     * @date 2020/5/17 21:38
     * @description 返回所有告警规则
     */
    @GetMapping("/rules")
    public String getAllRules(Model model) {
        List<Rule> rules = ruleService.getAllRules();
        logger.info(rules.toString());
        model.addAttribute("rules", rules);
        return "rule-list";
    }
}
