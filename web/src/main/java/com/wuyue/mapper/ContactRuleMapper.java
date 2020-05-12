package com.wuyue.mapper;

import com.wuyue.model.entity.ContactRuleExample;
import com.wuyue.model.entity.ContactRuleKey;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ContactRuleMapper {
    long countByExample(ContactRuleExample example);

    int deleteByExample(ContactRuleExample example);

    int deleteByPrimaryKey(ContactRuleKey key);

    int insert(ContactRuleKey record);

    int insertSelective(ContactRuleKey record);

    List<ContactRuleKey> selectByExample(ContactRuleExample example);

    int updateByExampleSelective(@Param("record") ContactRuleKey record, @Param("example") ContactRuleExample example);

    int updateByExample(@Param("record") ContactRuleKey record, @Param("example") ContactRuleExample example);
}