package com.wuyue.controller;

import com.wuyue.model.entity.SensorData;
import com.wuyue.model.vo.ChartData;
import com.wuyue.service.intf.SensorDataService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

/**
 * @author DeltaV235
 * @version 1.0
 * @className IndexController
 * @description 处理首页的请求, 需要返回当前环境数据, 历史24小时环境数据, 最近告警的部分信息
 * @date 2020/5/13 22:29
 */
@Controller
public class IndexController {
    private final SensorDataService sensorDataService;
    private final Logger logger = LoggerFactory.getLogger(getClass());

    public IndexController(SensorDataService sensorDataService) {
        this.sensorDataService = sensorDataService;
    }

    /**
     * @param model 模型参数
     * @return 视图名
     * @author DeltaV235
     * @date 2020/5/14 2:03
     * @description 处理首页的请求, 在模型中添加当前数据, 历史24小时数据, 最近告警等信息
     */
    @GetMapping("/")
    public String handleIndex(Model model) {
        // 查询当前环境数据
        SensorData sensorData = sensorDataService.getCurrentData();
        Double intervalTime = 2 * 60d;      // 时间间隔2小时
        Double durationTime = 24 * 60d;     // 持续时间1天
        List<ChartData> chartData = sensorDataService.getChartData(durationTime, intervalTime);
        model.addAttribute("curData", sensorData);
        logger.info(sensorData.toString());
        return "index";
    }

}
