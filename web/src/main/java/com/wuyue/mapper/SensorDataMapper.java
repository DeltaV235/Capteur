package com.wuyue.mapper;

import com.wuyue.model.entity.SensorData;
import com.wuyue.model.entity.SensorDataExample;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface SensorDataMapper {
    long countByExample(SensorDataExample example);

    int deleteByExample(SensorDataExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(SensorData record);

    int insertSelective(SensorData record);

    List<SensorData> selectByExample(SensorDataExample example);

    SensorData selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") SensorData record, @Param("example") SensorDataExample example);

    int updateByExample(@Param("record") SensorData record, @Param("example") SensorDataExample example);

    int updateByPrimaryKeySelective(SensorData record);

    int updateByPrimaryKey(SensorData record);

    /**
     * @return 最新数据的实体类
     * @author DeltaV235
     * @date 2020/5/14 2:15
     * @description 获取最新的一条数据
     */
    SensorData selectsLatest();

    /**
     * @param startTime 开始时间
     * @param endTime   结束时间
     * @return 包含了SensorData实体类的List
     * @author DeltaV235
     * @date 2020/5/14 3:42
     * @description 找出date字段的值在startTime和endTime之间的所有记录
     */
    List<SensorData> selectByTimeSlice(@Param("startTime") Date startTime, @Param("endTime") Date endTime);

    /**
     * @return 最后一次更新数据的时间
     * @author DeltaV235
     * @date 2020/5/14 14:32
     * @description 查询最后一次更新数据的时间
     */
    Date selectLatestUpdateTime();

    List<SensorData> selectAllWithoutPrimaryKey();
}