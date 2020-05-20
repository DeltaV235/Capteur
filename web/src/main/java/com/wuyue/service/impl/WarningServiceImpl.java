package com.wuyue.service.impl;

import com.wuyue.constant.constant.WarningStatus;
import com.wuyue.mapper.*;
import com.wuyue.model.entity.*;
import com.wuyue.model.vo.IndexWarning;
import com.wuyue.model.vo.WarningData;
import com.wuyue.service.intf.WarningService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author DeltaV235
 * @version 1.0
 * @className WarningServiceImpl
 * @description
 * @date 2020/5/19 1:11
 */
@Service
public class WarningServiceImpl implements WarningService {
    private final WarnListMapper warnListMapper;
    private final RuleListMapper ruleListMapper;
    private final SensorDataMapper sensorDataMapper;
    private final ConditionsMapper conditionsMapper;
    private final ContactMapper contactMapper;
    private final ContactRuleMapper contactRuleMapper;
    private final Logger logger = LoggerFactory.getLogger(getClass());

    public WarningServiceImpl(WarnListMapper warnListMapper,
                              RuleListMapper ruleListMapper,
                              SensorDataMapper sensorDataMapper,
                              ConditionsMapper conditionsMapper,
                              ContactMapper contactMapper,
                              ContactRuleMapper contactRuleMapper) {
        this.warnListMapper = warnListMapper;
        this.ruleListMapper = ruleListMapper;
        this.sensorDataMapper = sensorDataMapper;
        this.conditionsMapper = conditionsMapper;
        this.contactMapper = contactMapper;
        this.contactRuleMapper = contactRuleMapper;
    }

    @Override
    public List<IndexWarning> getLatestWarnings(Integer length) {
        List<IndexWarning> indexWarnings = warnListMapper.selectLatestWarnings(length);
        return indexWarnings;
    }

    /**
     * @param warnList 修改的对象
     * @return 修改成功返回true, 否则false
     * @author DeltaV235
     * @date 2020/5/19 14:08
     * @description 根据id修改warn list 中的数据
     */
    @Override
    public boolean updateWarning(WarnList warnList) {
        int update = warnListMapper.updateByPrimaryKeySelective(warnList);
        return update > 0;
    }

    /**
     * @return 告警信息的集合
     * @author DeltaV235
     * @date 2020/5/19 2:20
     * @description 获取所有告警记录的信息
     */
    @Override
    public List<WarningData> getAllWarningsData() {
        List<WarningData> returnValue = new ArrayList<>();
        // 告警根据最后触发时间降序
        WarnListExample warnListExample = new WarnListExample();
        warnListExample.setOrderByClause("`last_trigger_time` desc");
        List<WarnList> warnLists = warnListMapper.selectByExample(warnListExample);

        // 获取当前的环境数据
        SensorData sensorData = sensorDataMapper.selectsLatest();

        for (WarnList warning : warnLists) {
            Integer ruleId = warning.getRuleId();
            // 获取告警对应的规则记录
            RuleList ruleList = ruleListMapper.selectByPrimaryKey(ruleId);

            // 获取告警规则id对应的告警条件
            ConditionsExample conditionsExample = new ConditionsExample();
            ConditionsExample.Criteria conditionsExampleCriteria = conditionsExample.createCriteria();
            conditionsExampleCriteria.andRuleIdEqualTo(ruleId);
            List<Conditions> conditions = conditionsMapper.selectByExample(conditionsExample);

            // 获取告警规则id对应的告警联系人
            List<Contact> contacts = new ArrayList<>();
            // 根据ruleId找到所有联系人contactId
            ContactRuleExample contactRuleExample = new ContactRuleExample();
            ContactRuleExample.Criteria contactRuleExampleCriteria = contactRuleExample.createCriteria();
            contactRuleExampleCriteria.andRuleIdEqualTo(ruleId);
            List<ContactRuleKey> contactRuleKeys = contactRuleMapper.selectByExample(contactRuleExample);
            // 根据contactId查找联系人具体信息
            for (ContactRuleKey contactRuleKey : contactRuleKeys) {
                Integer contactId = contactRuleKey.getContactId();
                Contact contact = contactMapper.selectByPrimaryKey(contactId);
                contacts.add(contact);
            }

            // 将一条告警记录的所有相关信息放入返回值集合中
            WarningData warningData = new WarningData(ruleList.getName(),
                    warning.getId(),
                    warning.getStatus(),
                    warning.getRuleId(),
                    warning.getStartTime(),
                    warning.getLastTriggerTime(),
                    warning.getRecoverTime(),
                    ruleList.getLevel(),
                    ruleList.getDescription(),
                    sensorData,
                    conditions,
                    contacts);
            returnValue.add(warningData);
        }

        return returnValue;
    }

    /**
     * @param ruleId 告警规则id
     * @return 若存在为恢复的告警则返回true, 否则false
     * @author DeltaV235
     * @date 2020/5/19 1:26
     * @description 根据传入的id判断该告警记录是否存在未恢复的告警
     */
    @Override
    public boolean findUnRecoverWarning(Integer ruleId) {
        WarnListExample warnListExample = new WarnListExample();
        WarnListExample.Criteria criteria = warnListExample.createCriteria();
        criteria.andRuleIdEqualTo(ruleId);
        criteria.andStatusEqualTo(WarningStatus.WARNING);
        List<WarnList> warnLists = warnListMapper.selectByExample(warnListExample);
        return warnLists.size() > 0;
    }

    /**
     * @return 未恢复的告警集合
     * @author DeltaV235
     * @date 2020/5/19 13:48
     * @description 查询所有未恢复的告警
     */
    @Override
    public List<WarningData> findUnRecoverWarningData() {
        List<WarningData> allWarningsData = getAllWarningsData();
        List<WarningData> unRecoverWarningData = new ArrayList<>();
        for (WarningData warningData : allWarningsData) {
            if (warningData.getStatus().equals(WarningStatus.WARNING))
                unRecoverWarningData.add(warningData);
        }
        return unRecoverWarningData;
    }

    /**
     * @param ruleId 关联的告警规则id
     * @return 告警记录是否添加成功
     * @author DeltaV235
     * @date 2020/5/19 1:11
     * @description 增加告警记录
     */
    @Override
    public boolean addWarning(Integer ruleId) {
        try {
            WarnList warnList = new WarnList(null, WarningStatus.WARNING, new Date(), new Date(), null,
                    null, null, ruleId);
            int insert = warnListMapper.insert(warnList);
            return insert > 0;
        } catch (Exception exception) {
            logger.warn("告警信息插入异常");
            return false;
        }
    }
}
