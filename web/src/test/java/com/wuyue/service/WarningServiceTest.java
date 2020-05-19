package com.wuyue.service;

import com.wuyue.model.entity.WarnList;
import com.wuyue.model.vo.WarningData;
import com.wuyue.service.intf.WarningService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * @author DeltaV235
 * @version 1.0
 * @className WarningServiceTest
 * @description
 * @date 2020/5/19 3:59
 */
@ContextConfiguration(locations = {"classpath:/spring-persist-tx.xml", "classpath:/spring-persist-mybatis.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
public class WarningServiceTest {
    @Autowired
    private WarningService warningService;

    @Test
    public void testGetAllWarningData() {
        List<WarningData> allWarningsData = warningService.getAllWarningsData();
        System.out.println(allWarningsData);
    }

    @Test
    public void testFindUncoverWarningData() {
        List<WarningData> unRecoverWarningData = warningService.findUnRecoverWarningData();
        System.out.println(unRecoverWarningData);
    }

    @Test
    @Rollback(false)
    public void testUpdateWarning() {
        boolean result = warningService.updateWarning(new WarnList(19,
                "r",
                null,
                null,
                new Date(),
                null,
                null,
                null));
        System.out.println(result);
        List<WarningData> allWarningsData = warningService.getAllWarningsData();
        System.out.println(allWarningsData);
    }
}
