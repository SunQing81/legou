package com.legou.dao;

import com.legou.entry.Administrator;
import com.legou.entry.Customer;
import com.legou.entry.CustomerExample;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface CustomerMapper {
    long countByExample(CustomerExample example);

    int deleteByExample(CustomerExample example);

    int deleteByPrimaryKey(String cId);

    int insert(Customer record);

    int insertSelective(Customer record);

    List<Customer> selectByExample(CustomerExample example);

    Customer selectByPrimaryKey(String cId);

    int updateByExampleSelective(@Param("record") Customer record, @Param("example") CustomerExample example);

    int updateByExample(@Param("record") Customer record, @Param("example") CustomerExample example);

    int updateByPrimaryKeySelective(Customer record);

    int updateByPrimaryKey(Customer record);

    //条件查询
    List<Customer> selectByCustomer(Customer customer);
}