package com.wuyue.task;

import com.wuyue.constant.constant.WarningStatus;
import com.wuyue.constant.enums.EnvironmentParameter;
import com.wuyue.constant.enums.RuleStatus;
import com.wuyue.model.entity.Conditions;
import com.wuyue.model.entity.SensorData;
import com.wuyue.model.entity.WarnList;
import com.wuyue.model.vo.Rule;
import com.wuyue.model.vo.WarningData;
import com.wuyue.service.intf.RuleService;
import com.wuyue.service.intf.SensorDataService;
import com.wuyue.service.intf.WarningService;
import com.wuyue.utils.CheckRuleUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.script.ScriptException;
import java.util.Date;
import java.util.List;

/**
 * @author DeltaV235
 * @version 1.0
 * @className CheckRules
 * @description 检查当前环境是否触发告警, 若触发则创建告警信息并写入数据库
 * @date 2020/5/18 20:31
 */
public class CheckRules {
    private final Logger logger = LoggerFactory.getLogger(getClass());
    private final RuleService ruleService;
    private final SensorDataService sensorDataService;
    private final WarningService warningService;
    private List<Rule> rules;

    public CheckRules(RuleService ruleService, SensorDataService sensorDataService, WarningService warningService) {
        this.ruleService = ruleService;
        this.sensorDataService = sensorDataService;
        this.warningService = warningService;
    }

    /**
     * @author DeltaV235
     * @date 2020/5/19 1:08
     * @description 定时任务, 检查所有告警是否被触发
     */
    public void check() {
        logger.debug("告警检查任务执行");
        try {
            rules = ruleService.getAllRules();
            SensorData curSensorData = sensorDataService.getCurrentData();
            for (Rule rule : rules) {
                // 若该告警已被禁用,则不再判断其触发条件
                if (rule.getStatus().equals(RuleStatus.DISABLE.getStatus()))
                    continue;

                for (Conditions condition : rule.getConditions()) {
                    EnvironmentParameter ep =
                            CheckRuleUtil.getEnvirParamByString(condition.getParam());
                    if (CheckRuleUtil.eval(curSensorData.getValueByEnvironmentParameter(ep).toString() +
                            condition.getSymbol() + condition.getData())) {
                        // 检查是否存在已触发的告警
                        if (!warningService.findUnRecoverWarning(rule.getId())) {
                            // 不存在已触发的告警,触发告警
                            warningService.addWarning(rule.getId());
                            logger.debug("告警规则id: " + rule.getId() + "\t已触发");
                        }
                    }
                }
            }
        } catch (Exception exception) {
            logger.warn("告警规则检查出现异常", exception);
        }
    }

    /**
     * @author DeltaV235
     * @date 2020/5/19 13:41
     * @description 定时任务, 检查是否存在告警已恢复, 若已恢复则修改告警状态位, 否则更新告警的最后触发时间
     */
    public void recover() throws ScriptException {
        logger.debug("告警恢复任务执行");
        // 获取当前环境数据
        SensorData curSensorData = sensorDataService.getCurrentData();
        // 查询所有未恢复的告警
        List<WarningData> unRecoverWarnings = warningService.findUnRecoverWarningData();
        for (WarningData unRecoverWarning : unRecoverWarnings) {
            boolean isRecover = true;
            // 检查一条未恢复告警,获得所有判断条件
            List<Conditions> conditions = unRecoverWarning.getConditions();
            // 遍历判断条件
            for (Conditions condition : conditions) {
                // 获取条件中环境参数对应的enum类型
                EnvironmentParameter ep = CheckRuleUtil.getEnvirParamByString(condition.getParam());
                if (CheckRuleUtil.eval(curSensorData.getValueByEnvironmentParameter(ep) +
                        condition.getSymbol() + condition.getData())) {
                    // 告警条件依旧成立
                    isRecover = false;
                    break;
                }
            }

            // 一条告警的条件判断完毕,若isRecover==true,则表示所有告警条件都没有被触发
            if (isRecover) {
                // 告警已恢复,修改告警状态位
                logger.debug("告警id: " + unRecoverWarning.getId() + "\t已恢复");
                WarnList updateWarnList = new WarnList(unRecoverWarning.getId(),
                        WarningStatus.RECOVER,
                        null,
                        null,
                        new Date(),
                        null,
                        null,
                        null);
                warningService.updateWarning(updateWarnList);
            } else {
                // 告警未恢复,更新告警最后触发时间
                WarnList updateWarnList = new WarnList(unRecoverWarning.getId(),
                        null,
                        null,
                        new Date(),
                        null,
                        null,
                        null,
                        null);
                warningService.updateWarning(updateWarnList);
            }

        }
    }


}


