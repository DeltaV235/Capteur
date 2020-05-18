package com.wuyue.controller;

import com.wuyue.constant.enums.RuleStatus;
import com.wuyue.model.entity.Contact;
import com.wuyue.model.entity.RuleList;
import com.wuyue.model.vo.Rule;
import com.wuyue.service.intf.ContactService;
import com.wuyue.service.intf.RuleService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Date;
import java.util.List;

import static com.wuyue.constant.constant.RequestScopeAttribute.CONTACTS;
import static com.wuyue.constant.constant.RequestScopeAttribute.RULES;

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
    private final ContactService contactService;
    private final Logger logger = LoggerFactory.getLogger(getClass());

    public RuleController(RuleService ruleService, ContactService contactService) {
        this.ruleService = ruleService;
        this.contactService = contactService;
    }

    /**
     * @param name        告警名称
     * @param level       告警等级
     * @param description 告警描述
     * @param param       告警条件参数
     * @param data        告警阈值
     * @param contact     告警联系人
     * @return 视图名
     * @author DeltaV235
     * @date 2020/5/18 15:45
     * @description 处理告警插入表单请求
     */
    @PostMapping("/rules")
    public String addRule(String name,
                          String level,
                          String description,
                          String param,
                          String data,
                          String contact) {

        System.out.println(name);
        System.out.println(level);
        System.out.println(description);
        System.out.println(param);
        System.out.println(data);
        System.out.println(contact);

        RuleList ruleList = new RuleList(null, name, RuleStatus.ENABLE.getStatus(), level, new Date(), description);
        try {
            boolean isSuccess = ruleService.addRule(ruleList, param, data, contact);
            if (isSuccess)
                logger.info("告警插入成功");
            else
                logger.warn("告警插入失败");
        } catch (Exception e) {
            logger.warn("告警插入异常", e);
        }

        return "redirect:/rules";
    }

    /**
     * @param id 告警规则id
     * @return
     * @author DeltaV235
     * @date 2020/5/18 16:41
     * @description 处理告警规则删除请求
     */
    @GetMapping("/rules/del/{id}")
    public String delRule(@PathVariable("id") Integer id) {
        try {
            boolean isRemoved = ruleService.delRule(id);
            if (isRemoved)
                logger.info("告警删除成功");
            else
                logger.warn("告警删除失败");
        } catch (Exception e) {
            logger.warn("告警删除异常", e);
        }

        return "redirect:/rules";
    }

    /**
     * @author DeltaV235
     * @date 2020/5/17 21:38
     * @description 返回所有告警规则
     */
    @GetMapping("/rules")
    public String getAllRules(Model model) {
        // 获得所有告警条目
        List<Rule> rules = ruleService.getAllRules();
        logger.info(rules.toString());
        model.addAttribute(RULES, rules);

        // 获得所有告警联系人
        List<Contact> contacts = contactService.getAllContacts();
        model.addAttribute(CONTACTS, contacts);
        return "rule-list";
    }
}
