package com.wuyue.service;

import com.wuyue.model.vo.WarningData;
import com.wuyue.service.intf.WarningService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * @author DeltaV235
 * @version 1.0
 * @className WarningServiceTest
 * @description
 * @date 2020/5/19 3:59
 */
@ContextConfiguration("classpath:/spring*.xml" )
@RunWith(SpringJUnit4ClassRunner.class)
public class WarningServiceTest {
    @Autowired
    private WarningService warningService;

    @Test
    public void testGetAllWarningData() {
        List<WarningData> allWarningsData = warningService.getAllWarningsData();
        System.out.println(allWarningsData);
    }
}
