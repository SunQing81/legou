package com.legou.dao;

import com.legou.entry.GoodsSecondType;
import com.legou.entry.GoodsSecondTypeExample;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface GoodsSecondTypeMapper {
    long countByExample(GoodsSecondTypeExample example);

    int deleteByExample(GoodsSecondTypeExample example);

    int deleteByPrimaryKey(Integer gstId);

    int insert(GoodsSecondType record);

    int insertSelective(GoodsSecondType record);

    List<GoodsSecondType> selectByExample(GoodsSecondTypeExample example);

    GoodsSecondType selectByPrimaryKey(Integer gstId);

    int updateByExampleSelective(@Param("record") GoodsSecondType record, @Param("example") GoodsSecondTypeExample example);

    int updateByExample(@Param("record") GoodsSecondType record, @Param("example") GoodsSecondTypeExample example);

    int updateByPrimaryKeySelective(GoodsSecondType record);

    int updateByPrimaryKey(GoodsSecondType record);
}