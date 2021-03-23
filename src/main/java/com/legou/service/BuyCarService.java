package com.legou.service;

import com.legou.dao.BuyCarMapper;
import com.legou.entry.BuyCar;
import com.legou.entry.BuyCarExample;
import com.legou.entry.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Service
public class BuyCarService {

    @Autowired
    BuyCarMapper buyCarMapper;

    /**
     * 获取购物车的信息
     *
     * @return
     */
    public List<BuyCar> getAllBuyCar(HttpServletRequest request) {
        HttpSession session = request.getSession();
        List<BuyCar> list = null;
        Customer customer = (Customer) session.getAttribute("customer");

        if (customer == null) {
            BuyCarExample example = new BuyCarExample();
            BuyCarExample.Criteria criteria = example.createCriteria();
            criteria.andStatusEqualTo(0);
            list = buyCarMapper.selectByExampleWithGoods(example);
        } else {
            BuyCarExample example = new BuyCarExample();
            BuyCarExample.Criteria criteria = example.createCriteria();
            criteria.andStatusEqualTo(0);
            //查询用户未登录时，加入购物车的商品
            List<BuyCar> list_false = buyCarMapper.selectByExampleWithGoods(example);

            if (list_false.size() > 0) {
                BuyCarExample example_true = new BuyCarExample();
                BuyCarExample.Criteria criteria_true = example_true.createCriteria();
                criteria_true.andStatusEqualTo(1).andCIdEqualTo(customer.getcId());
                //查询用户登录时，个人购物车的商品
                List<BuyCar> list_true = buyCarMapper.selectByExampleWithGoods(example_true);

                for (int i = 0; i < list_false.size(); i++) {
                    int num = 0;
                    for (int j = 0; j < list_true.size(); j++) {
                        if (list_false.get(i).getgId().equals(list_true.get(j).getgId())) {
//                            System.out.println("相同的商品ID"+list_true.get(j).getgId());
//                            System.out.println(list_false.get(i).getbId()+"-"+list_true.get(j).getbId());
//                            System.out.println(list_false.get(i).getbNum()+list_true.get(j).getbNum());
                            num = list_false.get(i).getbNum() + list_true.get(j).getbNum();
                            list_true.get(j).setbNum(num);
                            buyCarMapper.updateByPrimaryKeySelective(list_true.get(j));
                            buyCarMapper.deleteByPrimaryKey(list_false.get(i).getbId());
                            break;
                        }
                    }
                }
                BuyCarExample exampleSetCid = new BuyCarExample();
                BuyCarExample.Criteria criteriaSetCid = exampleSetCid.createCriteria();
                criteriaSetCid.andStatusEqualTo(0);
                List<BuyCar> list_SetCid = buyCarMapper.selectByExampleWithGoods(exampleSetCid);
                if (list_SetCid.size() > 0) {
                    for (int k = 0; k < list_SetCid.size(); k++) {
//                        list_SetCid.get(k).setcId(customer.getcId());
                        list_SetCid.get(k).setStatus(1);
                        list_SetCid.get(k).setcId(customer.getcId());
                        buyCarMapper.updateByPrimaryKeySelective(list_SetCid.get(k));
                    }
                }
                list = buyCarMapper.selectByExampleWithGoods(example_true);
            } else {
                BuyCarExample example1 = new BuyCarExample();
                BuyCarExample.Criteria criteria1 = example.createCriteria();
                criteria1.andStatusEqualTo(1).andCIdEqualTo(customer.getcId());
                list = buyCarMapper.selectByExampleWithGoods(example1);
            }
        }
        return list;
    }

    /**
     * 添加商品到购物车
     *
     * @param buyCar
     */
    public void addGoodsToBuyCar(BuyCar buyCar) {
//        System.out.println("传"+buyCar);
        BuyCarExample example = new BuyCarExample();
        BuyCarExample.Criteria criteria = example.createCriteria();
        //查询
        List<BuyCar> buyCar1;
        if (buyCar.getcId() != null) {
            criteria.andGIdEqualTo(buyCar.getgId()).andCIdEqualTo(buyCar.getcId())
                    .andStatusEqualTo(1);
            buyCar1 = buyCarMapper.selectByExample(example);
        } else {
            criteria.andGIdEqualTo(buyCar.getgId()).andStatusEqualTo(0);
            buyCar1 = buyCarMapper.selectByExample(example);
        }
        if (buyCar1.size() == 1) {
//            System.out.println("查"+buyCar1.get(0));
            BuyCar buyCar2 = buyCar1.get(0);
            buyCar2.setbNum(buyCar.getbNum() + buyCar2.getbNum());
            buyCarMapper.updateByPrimaryKeySelective(buyCar2);
        } else {
            buyCarMapper.insert(buyCar);
        }
    }

    /**
     * 删除
     *
     * @param bid
     */
    public void deleteGoodsInBuyCarByBid(String bid) {
        buyCarMapper.deleteByPrimaryKey(bid);
    }

    /**
     * 批量删除购物车商品信息
     *
     * @param ids
     */
    public void deleteBatch(List<String> ids) {
        BuyCarExample example = new BuyCarExample();
        BuyCarExample.Criteria criteria = example.createCriteria();
        criteria.andBIdIn(ids);
        buyCarMapper.deleteByExample(example);
    }

    /**
     * 修改购物车商品的数量
     *
     * @return
     */
    public void updateGoodsNumByBid(String bid, int num) {
        BuyCar buyCar = new BuyCar();
        buyCar.setbId(bid);
        buyCar.setbNum(num);
        buyCarMapper.updateByPrimaryKeySelective(buyCar);
    }

    /**
     * 根据状态位清空购物车
     *
     * @param buyCar
     * @return
     */
    public void cleanBuyCarByStatus(BuyCar buyCar) {
        BuyCarExample example = new BuyCarExample();
        BuyCarExample.Criteria criteria = example.createCriteria();
        if (buyCar.getStatus() == 0) {
            criteria.andStatusEqualTo(0);
        } else if (buyCar.getStatus() == 1 && buyCar.getcId() != null) {
            criteria.andStatusEqualTo(1).andCIdEqualTo(buyCar.getcId());
        }
        buyCarMapper.deleteByExample(example);
    }

    /**
     * 获取确认订单商品信息
     *
     * @param bid
     * @return
     */
    public List<BuyCar> getConfirmOrderGoods(String[] bid) {
        BuyCarExample example = new BuyCarExample();
        BuyCarExample.Criteria criteria = example.createCriteria();
        List<String> list = new ArrayList<>();
        for (int i = 0; i < bid.length; i++) {
            list.add(bid[i]);
        }
        criteria.andBIdIn(list);
        List<BuyCar> Goodslist = buyCarMapper.selectByExampleWithGoods(example);
        return Goodslist;
    }
}
