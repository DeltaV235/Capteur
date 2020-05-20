package com.wuyue.service.impl;

import com.wuyue.constant.constant.WarningStatus;
import com.wuyue.constant.enums.EnvironmentParameter;
import com.wuyue.constant.enums.RuleStatus;
import com.wuyue.mapper.ConditionsMapper;
import com.wuyue.mapper.ContactRuleMapper;
import com.wuyue.mapper.RuleListMapper;
import com.wuyue.mapper.WarnListMapper;
import com.wuyue.model.entity.*;
import com.wuyue.model.vo.Rule;
import com.wuyue.service.intf.RuleService;
import com.wuyue.utils.CheckRuleUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;

import static com.wuyue.constant.constant.CompareSymbol.GT;
import static com.wuyue.constant.constant.CompareSymbol.LT;
import static com.wuyue.constant.enums.EnvironmentParameter.PRESSURE;

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
    private final ConditionsMapper conditionsMapper;
    private final ContactRuleMapper contactRuleMapper;
    private final WarnListMapper warnListMapper;
    private final Logger logger = LoggerFactory.getLogger(getClass());

    public RuleServiceImpl(RuleListMapper ruleListMapper, ConditionsMapper conditionsMapper, ContactRuleMapper contactRuleMapper, WarnListMapper warnListMapper) {
        this.ruleListMapper = ruleListMapper;
        this.conditionsMapper = conditionsMapper;
        this.contactRuleMapper = contactRuleMapper;
        this.warnListMapper = warnListMapper;
    }

    /**
     * @param id 告警规则id
     * @return 成功与否
     * @author DeltaV235
     * @date 2020/5/20 19:39
     * @description 启用一个告警规则及启用其已经触发告警
     */
    @Override
    public boolean enaRule(Integer id) {
        // 获取所有告警状态是禁用的告警id
        WarnListExample warnListExample = new WarnListExample();
        WarnListExample.Criteria criteria = warnListExample.createCriteria();
        criteria.andRuleIdEqualTo(id).andStatusEqualTo(WarningStatus.DISABLE);
        List<WarnList> warnLists = warnListMapper.selectByExample(warnListExample);

        // 更新上方找到的告警的状态为未恢复,进入下一次告警判断
        for (WarnList warnList : warnLists) {
            warnList.setStatus(WarningStatus.WARNING);
            warnListMapper.updateByPrimaryKeySelective(warnList);
        }
        RuleList ruleList = new RuleList(id,
                null,
                RuleStatus.ENABLE.getStatus(),
                null,
                null,
                null);
        return ruleListMapper.updateByPrimaryKeySelective(ruleList) > 0;
    }

    /**
     * @param id 告警规则id
     * @author DeltaV235
     * @date 2020/5/20 19:40
     * @description 禁用告警规则, 并禁用已经触发, 且未恢复的告警
     */
    @Override
    public boolean disRule(Integer id) {
        // 获取所有告警状态是未恢复的告警id
        WarnListExample warnListExample = new WarnListExample();
        WarnListExample.Criteria criteria = warnListExample.createCriteria();
        criteria.andRuleIdEqualTo(id).andStatusEqualTo(WarningStatus.WARNING);
        List<WarnList> warnLists = warnListMapper.selectByExample(warnListExample);

        // 更新上方找到的告警的状态为已禁用
        for (WarnList warnList : warnLists) {
            warnList.setStatus(WarningStatus.DISABLE);
            warnListMapper.updateByPrimaryKeySelective(warnList);
        }

        RuleList ruleList = new RuleList(id,
                null,
                RuleStatus.DISABLE.getStatus(),
                null,
                null,
                null);
        return ruleListMapper.updateByPrimaryKeySelective(ruleList) > 0;
    }

    /**
     * @return 告警联系人集合
     * @author DeltaV235
     * @date 2020/5/18 15:45
     * @description 获取所有告警联系人
     */
    @Override
    public List<Rule> getAllRules() {
        return ruleListMapper.selectAllRuleData();
    }

    /**
     * @param ruleList 告警记录
     * @param param    告警条件参数
     * @param data     告警条件阈值
     * @param contact  告警联系人id
     * @return 该条告警是否插入成功
     * @author DeltaV235
     * @date 2020/5/18 15:22
     * @description 添加一条告警记录
     */
    @Override
    public boolean addRule(RuleList ruleList, String param, String data, String contact) {
        int insertRuleList = ruleListMapper.insert(ruleList);
        int insertedConditions = 0;
        int insertedContacts = 0;

        // 添加告警条件
        String[] splitParam = param.split(",");
        String[] splitData = data.split(",");
        for (int count = 0; count < splitParam.length; count++) {
            // 获取一个触发条件的最大最小值
            String[] maxMin = splitData[count].split(";");
            double min = Double.parseDouble(maxMin[0]);
            double max = Double.parseDouble(maxMin[1]);

            // 返回环境参数的枚举类型
            EnvironmentParameter environmentParameter = CheckRuleUtil.getEnvirParamByString(splitParam[count]);

            if (Objects.nonNull(environmentParameter)) {

                // 如果温度最小值为-20,则添加一条条件: temp<data.max
                if (min == environmentParameter.getMinValue()) {
                    Conditions realCondition = new Conditions(null,
                            environmentParameter.getParamName(),
                            LT,
                            environmentParameter == PRESSURE ? max * 100.0 : max,
                            ruleList.getId());
                    insertedConditions += conditionsMapper.insert(realCondition);
                }
                // 如果温度最大值为50,则添加一条条件: temp>data.min
                if (max == environmentParameter.getMaxValue()) {
                    Conditions realCondition = new Conditions(null,
                            environmentParameter.getParamName(),
                            GT,
                            environmentParameter == PRESSURE ? min * 100.0 : min,
                            ruleList.getId());
                    insertedConditions += conditionsMapper.insert(realCondition);
                }
                if (min != environmentParameter.getMinValue() && max != environmentParameter.getMaxValue()) {
                    Conditions realCondition1 = new Conditions(null,
                            environmentParameter.getParamName(),
                            LT,
                            environmentParameter == PRESSURE ? max * 100.0 : max,
                            ruleList.getId());
                    Conditions realCondition2 = new Conditions(null,
                            environmentParameter.getParamName(),
                            GT,
                            environmentParameter == PRESSURE ? min * 100.0 : min,
                            ruleList.getId());
                    insertedConditions += conditionsMapper.insert(realCondition1);
                    insertedConditions += conditionsMapper.insert(realCondition2);
                }

            }
        }

        // 添加告警联系人
        String[] contactsId = contact.split(",");
        for (String id : contactsId) {
            insertedContacts += contactRuleMapper.insert(new ContactRuleKey(Integer.parseInt(id),
                    ruleList.getId()));
        }

        return insertRuleList > 0 && insertedConditions > 0 && insertedContacts > 0;
    }

    /**
     * @param id 告警规则id
     * @return 若成功禁用则返回true, 返回false
     * @author DeltaV235
     * @date 2020/5/20 18:53
     * @description 禁用指定id的告警规则
     */
    @Override
    public boolean delRule(Integer id) {
        // 禁用告警规则
        RuleList ruleList = new RuleList(id,
                null,
                null,
                null,
                null,
                null,
                true);
        return ruleListMapper.updateByPrimaryKeySelective(ruleList) > 0;
    }
}
