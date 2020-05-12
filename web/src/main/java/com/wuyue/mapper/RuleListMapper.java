package com.wuyue.mapper;

import com.wuyue.model.entity.RuleList;
import com.wuyue.model.entity.RuleListExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface RuleListMapper {
    long countByExample(RuleListExample example);

    int deleteByExample(RuleListExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(RuleList record);

    int insertSelective(RuleList record);

    List<RuleList> selectByExampleWithBLOBs(RuleListExample example);

    List<RuleList> selectByExample(RuleListExample example);

    RuleList selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") RuleList record, @Param("example") RuleListExample example);

    int updateByExampleWithBLOBs(@Param("record") RuleList record, @Param("example") RuleListExample example);

    int updateByExample(@Param("record") RuleList record, @Param("example") RuleListExample example);

    int updateByPrimaryKeySelective(RuleList record);

    int updateByPrimaryKeyWithBLOBs(RuleList record);

    int updateByPrimaryKey(RuleList record);
}