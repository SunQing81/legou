package com.legou.dao;

import com.legou.entry.GoodsThreeType;
import com.legou.entry.GoodsThreeTypeExample;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface GoodsThreeTypeMapper {
    long countByExample(GoodsThreeTypeExample example);

    int deleteByExample(GoodsThreeTypeExample example);

    int deleteByPrimaryKey(Integer gtId);

    int insert(GoodsThreeType record);

    int insertSelective(GoodsThreeType record);

    List<GoodsThreeType> selectByExample(GoodsThreeTypeExample example);

    GoodsThreeType selectByPrimaryKey(Integer gtId);

    int updateByExampleSelective(@Param("record") GoodsThreeType record, @Param("example") GoodsThreeTypeExample example);

    int updateByExample(@Param("record") GoodsThreeType record, @Param("example") GoodsThreeTypeExample example);

    int updateByPrimaryKeySelective(GoodsThreeType record);

    int updateByPrimaryKey(GoodsThreeType record);
}