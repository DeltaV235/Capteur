package com.wuyue.database;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

/**
 * @author DeltaV235
 * @version 1.0
 * @className MybatisTest
 * @description
 * @date 2020/5/13 1:35
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:/spring-persist-mybatis.xml", "classpath:/spring-persist-tx.xml"})
public class MybatisTest {


}
