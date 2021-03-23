package com.legou.dao;

import com.legou.entry.AdminType;
import com.legou.entry.AdminTypeExample;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface AdminTypeMapper {
    long countByExample(AdminTypeExample example);

    int deleteByExample(AdminTypeExample example);

    int deleteByPrimaryKey(Integer adminTypeId);

    int insert(AdminType record);

    int insertSelective(AdminType record);

    List<AdminType> selectByExample(AdminTypeExample example);

    AdminType selectByPrimaryKey(Integer adminTypeId);

    int updateByExampleSelective(@Param("record") AdminType record, @Param("example") AdminTypeExample example);

    int updateByExample(@Param("record") AdminType record, @Param("example") AdminTypeExample example);

    int updateByPrimaryKeySelective(AdminType record);

    int updateByPrimaryKey(AdminType record);
}