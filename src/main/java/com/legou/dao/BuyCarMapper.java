package com.legou.dao;

import com.legou.entry.BuyCar;
import com.legou.entry.BuyCarExample;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface BuyCarMapper {
    long countByExample(BuyCarExample example);

    int deleteByExample(BuyCarExample example);

    int deleteByPrimaryKey(String bId);

    int insert(BuyCar record);

    int insertSelective(BuyCar record);

    List<BuyCar> selectByExample(BuyCarExample example);

    BuyCar selectByPrimaryKey(String bId);

    //查询购物车时同时查询商品的信息
    List<BuyCar> selectByExampleWithGoods(BuyCarExample example);

    BuyCar selectByPrimaryKeyWithGoods(String bId);

    int updateByExampleSelective(@Param("record") BuyCar record, @Param("example") BuyCarExample example);

    int updateByExample(@Param("record") BuyCar record, @Param("example") BuyCarExample example);

    int updateByPrimaryKeySelective(BuyCar record);

    int updateByPrimaryKey(BuyCar record);


}