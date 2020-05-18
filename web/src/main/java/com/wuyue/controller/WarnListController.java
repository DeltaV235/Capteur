package com.wuyue.controller;

import com.wuyue.constant.constant.RequestScopeAttribute;
import com.wuyue.model.vo.WarningData;
import com.wuyue.service.intf.WarningService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

/**
 * @author DeltaV235
 * @version 1.0
 * @className WarnListController
 * @description 处理告警列表页面的请求
 * @date 2020/5/19 2:04
 */
@Controller
public class WarnListController {
    private final WarningService warningService;
    private final Logger logger = LoggerFactory.getLogger(getClass());

    public WarnListController(WarningService warningService) {
        this.warningService = warningService;
    }

    @GetMapping("/warnings")
    public String getWarnings(Model model) {
        List<WarningData> warningDataList = warningService.getAllWarningsData();
        logger.info(warningDataList.toString());
        model.addAttribute(RequestScopeAttribute.WARNINGS, warningDataList);
        return "warn-list";
    }
}
