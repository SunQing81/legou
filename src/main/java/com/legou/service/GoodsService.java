package com.legou.service;

import com.legou.dao.GoodsFirstTypeMapper;
import com.legou.dao.GoodsMapper;
import com.legou.dao.GoodsSecondTypeMapper;
import com.legou.dao.GoodsThreeTypeMapper;
import com.legou.entry.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GoodsService {
    @Autowired
    GoodsFirstTypeMapper goodsFirstTypeMapper;
    @Autowired
    GoodsSecondTypeMapper goodsSecondTypeMapper;
    @Autowired
    GoodsThreeTypeMapper goodsThreeTypeMapper;
    @Autowired
    GoodsMapper goodsMapper;

    /**
     * 获取商品一级菜单
     *
     * @return
     */
    public List<GoodsFirstType> getGoodsFirstType() {
        return goodsFirstTypeMapper.selectByExample(null);
    }

    /**
     * 获取商品二级菜单
     *
     * @return
     */
    public List<GoodsSecondType> getGoodsSecondType() {
        return goodsSecondTypeMapper.selectByExample(null);
    }

    /**
     * 获取商品三级菜单
     *
     * @return
     */
    public List<GoodsThreeType> getGoodsThreeType() {
        return goodsThreeTypeMapper.selectByExample(null);
    }

    /**
     * 获取根据一级分类商品的信息，首页显示商品
     *
     * @param gftId
     * @return
     */
    public List<Goods> getGoods(int gftId) {
        GoodsExample example = new GoodsExample();
        GoodsExample.Criteria criteria = example.createCriteria();
        criteria.andGftIdEqualTo(gftId);
        List<Goods> list = goodsMapper.selectByExample(example);
        return list;
    }

    /**
     * 根据点击量获取热门商品
     *
     * @return
     */
    public List<Goods> getHotGoods() {
        List<Goods> list = goodsMapper.selectBygclickNum();
        return list;
    }

    /**
     * 通过商品ID获取商品信息并返回到商品详情页面
     *
     * @return
     */
    public Goods getGoodsByGid(String gid) {
        Goods goods = goodsMapper.selectByPrimaryKey(gid);
        return goods;
    }

    /**
     * 通过商品一级分类ID获取一级分类信息
     *
     * @param gftId
     * @return
     */
    public GoodsFirstType getGoodsFirstTypeBygftId(Integer gftId) {
        GoodsFirstType goodsFirstType = goodsFirstTypeMapper.selectByPrimaryKey(gftId);
        return goodsFirstType;
    }

    /**
     * 通过商品二级分类ID获取二级分类信息
     *
     * @param gstId
     * @return
     */
    public GoodsSecondType getGoodsSecondTypeBygstId(Integer gstId) {
        GoodsSecondType goodsSecondType = goodsSecondTypeMapper.selectByPrimaryKey(gstId);
        return goodsSecondType;
    }

    /**
     * 通过商品三级分类ID获取三级分类信息
     *
     * @param gtId
     * @return
     */
    public GoodsThreeType getGoodsThreeTypeBygtId(Integer gtId) {
        GoodsThreeType goodsThreeType = goodsThreeTypeMapper.selectByPrimaryKey(gtId);
        return goodsThreeType;
    }

    /**
     * 订单完成后修改商品数量
     *
     * @param goods
     */
    public void updateGoodsNum(Goods goods) {
        goodsMapper.updateByPrimaryKeySelective(goods);
    }

    /**
     * 商品点击量+1
     *
     * @param gid
     */
    public void updateGoodsClickNum(String gid) {
        goodsMapper.updateGclickNum(gid);
    }

    /**
     * 根据查找内容查找商品
     *
     * @return
     */
    public List<Goods> getSearchGoods(String searchContent) {
        List<Goods> goodsList = goodsMapper.selectGoodsBysearchContent(searchContent);
        return goodsList;
    }

    /**
     * 三级分类查找商品
     *
     * @return
     */
    public List<Goods> getGoodsByGtId(String gtId) {
        GoodsExample example = new GoodsExample();
        GoodsExample.Criteria criteria = example.createCriteria();
        criteria.andGtIdEqualTo(Integer.parseInt(gtId));
        List<Goods> list = goodsMapper.selectByExample(example);
        return list;
    }

    /**
     * 二级分类查找商品
     *
     * @return
     */
    public List<Goods> getGoodsByGstId(String gstId) {
        GoodsExample example = new GoodsExample();
        GoodsExample.Criteria criteria = example.createCriteria();
        criteria.andGstIdEqualTo(Integer.parseInt(gstId));
        List<Goods> list = goodsMapper.selectByExample(example);
        return list;
    }

    /**
     * 一级分类查找商品
     *
     * @return
     */
    public List<Goods> getGoodsByGftId(String gftId) {
        GoodsExample example = new GoodsExample();
        GoodsExample.Criteria criteria = example.createCriteria();
        criteria.andGftIdEqualTo(Integer.parseInt(gftId));
        List<Goods> list = goodsMapper.selectByExample(example);
        return list;
    }

    /**
     * 根据价格
     *
     * @return
     */
    public List<Goods> getGoodsByPrice() {
        List<Goods> list = goodsMapper.selectByPrice();
        return list;
    }

    //获取所有的商品信息
    public List<Goods> getAllGoods() {
        return goodsMapper.selectGoodsWithType(null);
    }

    //获取商品对应二级分类
    public List<GoodsSecondType> getGoodsSecondTypesBygftId(Integer gftId) {
        GoodsSecondTypeExample example = new GoodsSecondTypeExample();
        GoodsSecondTypeExample.Criteria criteria = example.createCriteria();
        criteria.andGftIdEqualTo(gftId);
        return goodsSecondTypeMapper.selectByExample(example);
    }

    //获取商品对应三级分类
    public List<GoodsThreeType> getGoodsThreeTypesBygstId(Integer gstId) {
        GoodsThreeTypeExample example = new GoodsThreeTypeExample();
        GoodsThreeTypeExample.Criteria criteria = example.createCriteria();
        criteria.andGstIdEqualTo(gstId);
        return goodsThreeTypeMapper.selectByExample(example);
    }

    //条件查询
    public List<Goods> selectGoodsBytiaojian(Goods goods, Integer orderBygEndtime) {
        Goods goods1 = new Goods();
        if (goods.getgId() != null && !goods.getgId().equals("")) {
            goods1.setgId(goods.getgId());
        }
        if (goods.getgDetailinfo() != null && !goods.getgDetailinfo().equals("")) {
            goods1.setgDetailinfo(goods.getgDetailinfo());
        }
        if (goods.getGftId() != null) {
            goods1.setGftId(goods.getGftId());
        }
        if (goods.getGstId() != null) {
            goods1.setGstId(goods.getGstId());
        }
        if (goods.getGtId() != null) {
            goods1.setGtId(goods.getGtId());
        }
        if (orderBygEndtime != null) {
            String sort;
            if (orderBygEndtime == 1) {
                sort = " g.g_endTime";
            } else if (orderBygEndtime == 0) {
                sort = " g.g_endTime DESC";
            } else {
                sort = null;
            }
            System.out.println(sort);
            return goodsMapper.selectByGoods(goods1, sort);
        } else {
            return goodsMapper.selectByGoods(goods1, null);
        }

    }

    //添加商品
    public int addGoods(Goods goods) {
        return goodsMapper.insertSelective(goods);
    }

    //修改商品数据
    public void updateGoods(Goods goods) {
        goodsMapper.updateByPrimaryKeySelective(goods);
    }

    //获取商品信息用户修改
    public Goods getGoodsWithTypeByGid(String gid) {
        return goodsMapper.getGoodsWithTypeByGid(gid);
    }

    //单个删除
    public void deleteGoods(String gId) {
        goodsMapper.deleteByPrimaryKey(gId);
    }

    //批量删除
    public void deleteBatch(List<String> list) {
        GoodsExample example = new GoodsExample();
        GoodsExample.Criteria criteria = example.createCriteria();
        criteria.andGIdIn(list);
        goodsMapper.deleteByExample(example);
    }
}
