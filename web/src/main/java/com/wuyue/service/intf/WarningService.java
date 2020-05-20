package com.wuyue.service.intf;

import com.wuyue.model.entity.WarnList;
import com.wuyue.model.vo.IndexWarning;
import com.wuyue.model.vo.WarningData;

import java.util.List;

/**
 * @author DeltaV235
 * @version 1.0
 * @className WarningService
 * @description 处理告警列表相关的业务
 * @date 2020/5/19 1:09
 */
public interface WarningService {
    List<IndexWarning> getLatestWarnings(Integer length);

    boolean updateWarning(WarnList warnList);

    List<WarningData> getAllWarningsData();

    boolean findUnRecoverWarning(Integer ruleId);

    List<WarningData> findUnRecoverWarningData();

    boolean addWarning(Integer ruleId);
}
