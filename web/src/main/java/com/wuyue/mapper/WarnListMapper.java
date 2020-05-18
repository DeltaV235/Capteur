package com.wuyue.mapper;

import com.wuyue.model.entity.WarnList;
import com.wuyue.model.entity.WarnListExample;
import java.util.List;

import com.wuyue.model.vo.WarningData;
import org.apache.ibatis.annotations.Param;

public interface WarnListMapper {
    long countByExample(WarnListExample example);

    int deleteByExample(WarnListExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(WarnList record);

    int insertSelective(WarnList record);

    List<WarnList> selectByExample(WarnListExample example);

    WarnList selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") WarnList record, @Param("example") WarnListExample example);

    int updateByExample(@Param("record") WarnList record, @Param("example") WarnListExample example);

    int updateByPrimaryKeySelective(WarnList record);

    int updateByPrimaryKey(WarnList record);

//    List<WarningData> selectAllWarningData();
}