package com.wuyue.service.intf;

import com.wuyue.model.entity.SensorData;
import com.wuyue.model.vo.ChartData;
import com.wuyue.model.vo.TableData;

import java.util.List;

/**
 * @author DeltaV235
 * @version 1.0
 * @className SensorDataService
 * @description
 * @date 2020/5/13 22:35
 */
public interface SensorDataService {
    SensorData getCurrentData();

    List<ChartData> getChartData(Double durationTime, Double intervalTime);

    TableData getTableData(Integer start, Integer length, Integer draw);
}
