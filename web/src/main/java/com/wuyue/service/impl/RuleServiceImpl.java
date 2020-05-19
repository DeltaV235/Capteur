package com.wuyue.service.impl;

import com.wuyue.constant.enums.EnvironmentParameter;
import com.wuyue.mapper.ConditionsMapper;
import com.wuyue.mapper.ContactRuleMapper;
import com.wuyue.mapper.RuleListMapper;
import com.wuyue.model.entity.Conditions;
import com.wuyue.model.entity.ContactRuleKey;
import com.wuyue.model.entity.RuleList;
import com.wuyue.model.vo.Rule;
import com.wuyue.service.intf.RuleService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;

import static com.wuyue.constant.constant.CompareSymbol.GT;
import static com.wuyue.constant.constant.CompareSymbol.LT;
import static com.wuyue.constant.enums.EnvironmentParameter.*;

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
    private final Logger logger = LoggerFactory.getLogger(getClass());

    public RuleServiceImpl(RuleListMapper ruleListMapper, ConditionsMapper conditionsMapper, ContactRuleMapper contactRuleMapper) {
        this.ruleListMapper = ruleListMapper;
        this.conditionsMapper = conditionsMapper;
        this.contactRuleMapper = contactRuleMapper;
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

            // 如果告警条件是温度
            EnvironmentParameter environmentParameter = null;
            if (splitParam[count].equals(TEMPERATURE.getParamName())) {
                environmentParameter = TEMPERATURE;
            } else if (splitParam[count].equals(HUMIDITY.getParamName())) {
                environmentParameter = HUMIDITY;
            } else if (splitParam[count].equals(LIGHT.getParamName())) {
                environmentParameter = LIGHT;
            } else if (splitParam[count].equals(PRESSURE.getParamName())) {
                environmentParameter = PRESSURE;
            }

            if (Objects.nonNull(environmentParameter)) {

                // 如果温度最小值为-20,则添加一条条件: temp<data.max
                if (min == environmentParameter.getMinValue()) {
                    Conditions realCondition = new Conditions(null, environmentParameter.getParamName(), LT, max, ruleList.getId());
                    insertedConditions += conditionsMapper.insert(realCondition);
                }
                // 如果温度最大值为50,则添加一条条件: temp>data.min
                if (max == environmentParameter.getMaxValue()) {
                    Conditions realCondition = new Conditions(null, environmentParameter.getParamName(), GT, min,
                            ruleList.getId());
                    insertedConditions += conditionsMapper.insert(realCondition);
                }
                if (min != environmentParameter.getMinValue() && max != environmentParameter.getMaxValue()) {
                    Conditions realCondition1 = new Conditions(null, environmentParameter.getParamName(), LT, max,
                            ruleList.getId());
                    Conditions realCondition2 = new Conditions(null, environmentParameter.getParamName(), GT, min,
                            ruleList.getId());
                    insertedConditions += conditionsMapper.insert(realCondition1);
                    insertedConditions += conditionsMapper.insert(realCondition2);
                }

            }

            // 添加告警联系人
            String[] contactsId = contact.split(",");
            for (String id : contactsId) {
                insertedContacts += contactRuleMapper.insert(new ContactRuleKey(Integer.parseInt(id),
                        ruleList.getId()));
            }
        }
        return insertRuleList > 0 && insertedConditions > 0 && insertedContacts > 0;
    }

    @Override
    public boolean delRule(Integer id) {
        return ruleListMapper.deleteByPrimaryKey(id) > 0;
    }
}
