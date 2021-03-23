package com.legou.dao;

import com.legou.entry.Goods;
import com.legou.entry.GoodsExample;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface GoodsMapper {
    long countByExample(GoodsExample example);

    int deleteByExample(GoodsExample example);

    int deleteByPrimaryKey(String gId);

    int insert(Goods record);

    int insertSelective(Goods record);

    List<Goods> selectByExample(GoodsExample example);

    //查询商品时查询分类信息
    List<Goods> selectGoodsWithType(GoodsExample example);

    Goods selectByPrimaryKey(String gId);

    int updateByExampleSelective(@Param("record") Goods record, @Param("example") GoodsExample example);

    int updateByExample(@Param("record") Goods record, @Param("example") GoodsExample example);

    int updateByPrimaryKeySelective(Goods record);

    int updateByPrimaryKey(Goods record);

    /**
     * 根据点击量获取热门商品
     *
     * @return
     */
    List<Goods> selectBygclickNum();

    /**
     * 商品点击量+1
     *
     * @param gid
     */
    void updateGclickNum(String gid);

    /**
     * 根据查找内容查找商品
     *
     * @return
     */
    List<Goods> selectGoodsBysearchContent(String searchContent);

    /**
     * 根据价格
     *
     * @return
     */
    List<Goods> selectByPrice();

    //条件查询
    List<Goods> selectByGoods(@Param("goods") Goods goods, @Param("sort") String sort);

    //获取商品信息用于修改
    Goods getGoodsWithTypeByGid(String gid);
}