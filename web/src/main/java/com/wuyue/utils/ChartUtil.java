package com.wuyue.utils;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/**
 * @author DeltaV235
 * @version 1.0
 * @className CalAverage
 * @description 计算图表的工具类
 * @date 2020/5/14 2:29
 */
public class ChartUtil {
    /**
     * @param data 数据数组,不能为null,若数组为空,则返回NaN
     * @return 数据的平均值
     * @author DeltaV235
     * @date 2020/5/14 2:38
     * @description 计算传入参数的平均值
     */
    public static double calAverage(Double... data) {
        Objects.requireNonNull(data, "入参不能为null");
        double sum = 0d;
        int count = 0;
        for (Double element : data) {
            if (element == null)
                continue;
            sum += element;
            count++;
        }
        DecimalFormat decimalFormat = new DecimalFormat("#.#");
        return Double.parseDouble(decimalFormat.format(sum / count));
    }

    /**
     * @param startTime    图表的开始时间, 开始的时间必须早于结束的时间
     * @param endTime      图表的结束时间
     * @param intervalTime 两点之间的时间间隔(min),不能为null或0
     * @return 一个存储单个计算点的开始时间和结束时间, 长度为2的数组的集合
     * @author DeltaV235
     * @date 2020/5/14 2:39
     * @description 给定图表的开始时间, 结束时间即时间间隔, 计算出每一个点的平均值计算的开始时间和结束时间.若时间不能完整的分割,
     * 最后一个时间片的时间将小于指定的时间间隔
     */
    public static List<Long[]> calStartEndTime(long startTime, long endTime, Double intervalTime) {
        if (null == intervalTime || intervalTime == 0)
            throw new RuntimeException("时间间隔不能为null,,或者0");
        if (startTime >= endTime)
            throw new RuntimeException("开始时间不能大于等于结束时间");
        List<Long[]> results = new ArrayList<>();
        long timeSliceStart = startTime;
        long timeSliceIntervalTime = Math.round(intervalTime * 60 * 1000);
        while (true) {
            long timeSliceEndTime = timeSliceStart + timeSliceIntervalTime;
            Long[] oneResult = new Long[2];
            // 结束时间未越界,开始结束时间合法
            if (timeSliceEndTime <= endTime) {
                oneResult[0] = timeSliceStart;
                oneResult[1] = timeSliceEndTime;
                results.add(oneResult);
                // 设置下一次循环的开始时间
                timeSliceStart = timeSliceEndTime + 1000;
            } else {
                // 结束时间越界,改时间片是最后一个时间片
                timeSliceEndTime = endTime;
                oneResult[0] = timeSliceStart;
                oneResult[1] = timeSliceEndTime;
                results.add(oneResult);
                break;
            }
        }

        return results;
    }
}
