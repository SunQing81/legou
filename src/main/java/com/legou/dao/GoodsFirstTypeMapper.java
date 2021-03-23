package com.legou.dao;

import com.legou.entry.GoodsFirstType;
import com.legou.entry.GoodsFirstTypeExample;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface GoodsFirstTypeMapper {
    long countByExample(GoodsFirstTypeExample example);

    int deleteByExample(GoodsFirstTypeExample example);

    int deleteByPrimaryKey(Integer gftId);

    int insert(GoodsFirstType record);

    int insertSelective(GoodsFirstType record);

    List<GoodsFirstType> selectByExample(GoodsFirstTypeExample example);

//    List<GoodsFirstType> selectByExampleWithSecondWithThree(GoodsFirstTypeExample example);

    GoodsFirstType selectByPrimaryKey(Integer gftId);

    int updateByExampleSelective(@Param("record") GoodsFirstType record, @Param("example") GoodsFirstTypeExample example);

    int updateByExample(@Param("record") GoodsFirstType record, @Param("example") GoodsFirstTypeExample example);

    int updateByPrimaryKeySelective(GoodsFirstType record);

    int updateByPrimaryKey(GoodsFirstType record);


}