package com.legou.dao;

import com.legou.entry.Administrator;
import com.legou.entry.AdministratorExample;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface AdministratorMapper {
    long countByExample(AdministratorExample example);

    int deleteByExample(AdministratorExample example);

    int deleteByPrimaryKey(String adminId);

    int insert(Administrator record);

    int insertSelective(Administrator record);

    List<Administrator> selectByExample(AdministratorExample example);

    List<Administrator> selectByEmployee(Administrator record);

    Administrator selectByPrimaryKey(String adminId);

    int updateByExampleSelective(@Param("record") Administrator record, @Param("example") AdministratorExample example);

    int updateByExample(@Param("record") Administrator record, @Param("example") AdministratorExample example);

    int updateByPrimaryKeySelective(Administrator record);

    int updateByPrimaryKey(Administrator record);
}