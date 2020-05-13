package com.wuyue.service.impl;

import com.wuyue.mapper.SensorDataMapper;
import com.wuyue.model.entity.SensorData;
import com.wuyue.model.vo.ChartData;
import com.wuyue.service.intf.SensorDataService;
import com.wuyue.utils.ChartUtil;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author DeltaV235
 * @version 1.0
 * @className SensorDataService
 * @description
 * @date 2020/5/13 22:34
 */
@Service
public class SensorDataServiceImpl implements SensorDataService {
    private final SensorDataMapper sensorDataMapper;

    public SensorDataServiceImpl(SensorDataMapper sensorDataMapper) {
        this.sensorDataMapper = sensorDataMapper;
    }

    /**
     * @return 最新数据的实体类
     * @author DeltaV235
     * @date 2020/5/14 2:15
     * @description 获取数据库中最新的一条数据, 并返回
     */
    @Override
    public SensorData getCurrentData() {
        return sensorDataMapper.selectsLatest();
    }

    /**
     * @param durationTime 要获取最近多少时间内的数据,单位为mins
     * @param intervalTime 多少时间计算一次平均值,单位为mins
     * @return ChartData的数组引用对象, 包含了图像中每一个点的时间, 指定时间范围内的温度湿度气压亮度的平均值
     * @author DeltaV235
     * @date 2020/5/14 2:16
     * @description 计算指定时间内, 指定时间间隔的数据平均值并返回一个vo, 用于提供图表的数据
     */
    @Override
    public List<ChartData> getChartData(Double durationTime, Double intervalTime) {
        long endTime = new Date().getTime();
        long startTime = Math.round(endTime - durationTime * 60 * 1000);
        // 时间片的开始结束时间
        List<Long[]> startEndTimeResults = ChartUtil.calStartEndTime(startTime, endTime, intervalTime);
        // 整个时间范围内的记录
        List<SensorData> sensorDataList = sensorDataMapper.selectByTimeSlice(startTime, endTime);
        // 处理每一个时间片
        for (Long[] result : startEndTimeResults) {
            long timeSliceStartTime = result[0];
            long timeSliceEndTime = result[1];
            Date date = new Date((timeSliceStartTime + timeSliceEndTime) / 2);
            Double temp;
            Double humi;
            Double light;
            Double press;
            ArrayList<Double> dataList = new ArrayList<>();
            for (SensorData sensorData : sensorDataList) {
                long time = sensorData.getDate().getTime();
                if (time >= timeSliceStartTime && time <= timeSliceEndTime) {
                    dataList.add()
                }
            }
        }
        return null;
    }
}













