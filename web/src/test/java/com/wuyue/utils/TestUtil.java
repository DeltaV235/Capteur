package com.wuyue.utils;

import org.junit.Test;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @author DeltaV235
 * @version 1.0
 * @className TestUtil
 * @description
 * @date 2020/5/14 3:07
 */
public class TestUtil {
    @Test
    public void testCalAverage() {
        double average = ChartUtil.calAverage(300.0, 1000.0);
        System.out.println(average);
    }

    @Test
    public void testCalStartEndTime() {
        long endTime = new Date().getTime();
        long startTime = endTime - 24 * 60 * 60 * 1000;
        System.out.println(startTime + "/" + endTime);
        List<Long[]> results = ChartUtil.calStartEndTime(startTime, endTime, 2 * 60d);
        int count = 1;
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        for (Long[] result : results) {
            Long start = result[0];
            Long end = result[1];
            Date startDate = new Date(start);
            Date endDate = new Date(end);

            System.out.println(count + ": startTime---> " + simpleDateFormat.format(startDate) + "\tendTime---> " +
                    simpleDateFormat.format(endDate));
            count++;
        }
    }

    @Test
    public void temp() {
        double v = Double.parseDouble("120");
        System.out.println(v);
    }
}
