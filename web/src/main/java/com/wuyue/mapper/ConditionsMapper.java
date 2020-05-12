package com.wuyue.mapper;

import com.wuyue.model.entity.Conditions;
import com.wuyue.model.entity.ConditionsExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ConditionsMapper {
    long countByExample(ConditionsExample example);

    int deleteByExample(ConditionsExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Conditions record);

    int insertSelective(Conditions record);

    List<Conditions> selectByExample(ConditionsExample example);

    Conditions selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Conditions record, @Param("example") ConditionsExample example);

    int updateByExample(@Param("record") Conditions record, @Param("example") ConditionsExample example);

    int updateByPrimaryKeySelective(Conditions record);

    int updateByPrimaryKey(Conditions record);
}