package com.wuyue.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wuyue.constant.enums.EnvironmentParameter;
import com.wuyue.mapper.SensorDataMapper;
import com.wuyue.model.entity.SensorData;
import com.wuyue.model.entity.SensorDataExample;
import com.wuyue.model.vo.ChartData;
import com.wuyue.model.vo.TableData;
import com.wuyue.service.intf.SensorDataService;
import com.wuyue.utils.ChartUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import static com.wuyue.constant.enums.EnvironmentParameter.*;

/**
 * @author DeltaV235
 * @version 1.0
 * @className SensorDataService
 * @description 处理环境数据相关的业务
 * @date 2020/5/13 22:34
 */
@Service
public class SensorDataServiceImpl implements SensorDataService {
    private final SensorDataMapper sensorDataMapper;
    private final Logger logger = LoggerFactory.getLogger(getClass());

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
        Date tempdate = sensorDataMapper.selectLatestUpdateTime();
        logger.debug(tempdate.toString());
        long latestUpdateTime = sensorDataMapper.selectLatestUpdateTime().getTime();
        // 若最近更新时间比查询的开始时间还早,呢么该方法将不能返回有效的图表数据,所以在此将结束时间强制设定为最后更新时间
        if (latestUpdateTime < startTime) {
            // 将最后一条记录也包含进去
            endTime = latestUpdateTime + 1000;
            startTime = Math.round(endTime - durationTime * 60 * 1000);
        }


        // 时间片的开始结束时间
        List<Long[]> startEndTimeResults = ChartUtil.calStartEndTime(startTime, endTime, intervalTime);
        // 整个时间范围内的记录
        List<SensorData> sensorDataList = sensorDataMapper.selectByTimeSlice(new Date(startTime), new Date(endTime));
        // 返回值
        List<ChartData> returnValue = new ArrayList<>();

        // 处理每一个时间片
        for (Long[] result : startEndTimeResults) {
            long timeSliceStartTime = result[0];
            long timeSliceEndTime = result[1];
            logger.debug("timeSliceStartTime: " + new Date(timeSliceStartTime) + "\ttimeSliceEndTime: " +
                    new Date(timeSliceEndTime));
            Date date = new Date((timeSliceStartTime + timeSliceEndTime) / 2);
            HashMap<EnvironmentParameter, List<Double>> dataMap = new HashMap<>();
            ArrayList<Double> temp = new ArrayList<>();
            ArrayList<Double> humi = new ArrayList<>();
            ArrayList<Double> light = new ArrayList<>();
            ArrayList<Double> press = new ArrayList<>();
            dataMap.put(TEMPERATURE, temp);
            dataMap.put(HUMIDITY, humi);
            dataMap.put(LIGHT, light);
            dataMap.put(PRESSURE, press);
            // 取出所有符合时间片范围的数据,并将其放入到Map中的List
            for (SensorData sensorData : sensorDataList) {
                logger.trace("\n sensorData: " + sensorData);
                long time = sensorData.getDate().getTime();
                if (time >= timeSliceStartTime && time < timeSliceEndTime) {
                    dataMap.get(TEMPERATURE).add(sensorData.getTemp());
                    dataMap.get(HUMIDITY).add(sensorData.getHumi());
                    dataMap.get(LIGHT).add(sensorData.getLight());
                    dataMap.get(PRESSURE).add(sensorData.getPress());
                } else if (time > timeSliceEndTime)
                    // 由于记录按照时间升序,所以记录时间大于结束时间的后续记录都不可能符合时间要求,该时间片的数据遍历结束
                    break;
            }

            // 计算出每个环境参数的平均值
            List<Double> tempList = dataMap.get(TEMPERATURE);
            List<Double> humiList = dataMap.get(HUMIDITY);
            List<Double> lightList = dataMap.get(LIGHT);
            List<Double> pressList = dataMap.get(PRESSURE);
            Double[] tempArray = new Double[tempList.size()];
            Double[] humiArray = new Double[humiList.size()];
            Double[] lightArray = new Double[lightList.size()];
            Double[] pressArray = new Double[pressList.size()];
            tempList.toArray(tempArray);
            humiList.toArray(humiArray);
            lightList.toArray(lightArray);
            pressList.toArray(pressArray);

            double tempAvg = ChartUtil.calAverage(tempArray);
            double humiAvg = ChartUtil.calAverage(humiArray);
            double lightAvg = ChartUtil.calAverage(lightArray);
            double pressAvg = ChartUtil.calAverage(pressArray);
            ChartData chartData = new ChartData(date, tempAvg, humiAvg, pressAvg, lightAvg);
            logger.debug("chartData: " + chartData);
            returnValue.add(chartData);
        }
        return returnValue;
    }

    /**
     * @param start  开始记录索引,从0开始
     * @param length 每页的长度
     * @param draw   检验用数据
     * @return TableData 一个用于DataTable的POJO
     * @author DeltaV235
     * @date 2020/5/16 1:42
     * @description 根据分页信息, 查询数据库中记录并返回
     */
    @Override
    public TableData<SensorData> getTableData(Integer start, Integer length, Integer draw) {
        PageHelper.offsetPage(start, length, true);
        List<SensorData> sensorDataList = sensorDataMapper.selectByExample(new SensorDataExample());
        PageInfo<SensorData> pageInfo = ((Page<SensorData>) sensorDataList).toPageInfo();
        int recordsTotal = (int) pageInfo.getTotal();
        int recordsFiltered = (int) pageInfo.getTotal();
        return new TableData<>(draw, recordsTotal, recordsFiltered, sensorDataList, null);
    }
}













