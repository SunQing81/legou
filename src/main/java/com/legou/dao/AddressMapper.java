package com.legou.dao;

import com.legou.entry.Address;
import com.legou.entry.AddressExample;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface AddressMapper {
    long countByExample(AddressExample example);

    int deleteByExample(AddressExample example);

    int deleteByPrimaryKey(String aId);

    int insert(Address record);

    int insertSelective(Address record);

    List<Address> selectByExample(AddressExample example);

    Address selectByPrimaryKey(String aId);

    int updateByExampleSelective(@Param("record") Address record, @Param("example") AddressExample example);

    int updateByExample(@Param("record") Address record, @Param("example") AddressExample example);

    int updateByPrimaryKeySelective(Address record);

    int updateByPrimaryKey(Address record);

    int updateByPrimaryKeys(List<String> aids);
}