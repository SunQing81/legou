package com.legou.service;

import com.legou.dao.AddressMapper;
import com.legou.dao.GoodsMapper;
import com.legou.dao.OrderMapper;
import com.legou.entry.*;
import org.aspectj.weaver.ast.Or;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Service
public class OrderService {
    @Autowired
    OrderMapper orderMapper;
    @Autowired
    AddressMapper addressMapper;
    @Autowired
    GoodsMapper goodsMapper;

    /**
     * 创建订单
     *
     * @param order
     */
    public void creatOrder(Order order) {
        orderMapper.insertSelective(order);
    }

    /**
     * 通过主键查询订单信息
     *
     * @param oid
     * @return
     */
    public Order getOrderByOid(String oid) {
        Order order = orderMapper.selectByPrimaryKey(oid);
        return order;
    }

    /**
     * 支付成功后修改订单的状态信息，以及支付宝交易订单号
     *
     * @param order
     * @return
     */
    public void updateOrderStatus(Order order, HttpServletRequest request) {
        HttpSession session = request.getSession();
        orderMapper.updateByPrimaryKeySelective(order);
        Order getOrder = orderMapper.selectByPrimaryKey(order.getoId());
        session.removeAttribute("order");
        session.setAttribute("order", getOrder);
    }

    /**
     * 获取所有的订单以及订单对应的地址和商品信息
     *
     * @param cId
     * @return
     */
    public List<Order> getAllOrderByCid(String cId) {
        OrderExample example = new OrderExample();
        OrderExample.Criteria criteria = example.createCriteria();
        criteria.andCIdEqualTo(cId);
        List<Order> list = orderMapper.selectByExample(example);
        for (Order order : list) {
            order.setAddress(addressMapper.selectByPrimaryKey(order.getaId()));
            String[] gid = order.getgIds().split("-");
            List<String> gIdList = new ArrayList<>(Arrays.asList(gid));
//            方法一：响应较慢
//            goodsList = new ArrayList<>();
//            for (String s : gid) {
//                goodsList.add(goodsMapper.selectByPrimaryKey(s));
//            }
//            order.setGoodsList(goodsList);

            //            System.out.println(gIdList);


            GoodsExample example_goods = new GoodsExample();
            GoodsExample.Criteria criteria_goods = example_goods.createCriteria();
            criteria_goods.andGIdIn(gIdList);
            List<Goods> goodsList = goodsMapper.selectByExample(example_goods);
//            System.out.println(goodsList.size());
            order.setGoodsList(new ArrayList<>(goodsList));
        }
        return list;
    }

    /**
     * 通过订单ID删除订单
     *
     * @param oid
     */
    public void deleteOrderByOid(String oid) {
        orderMapper.deleteByPrimaryKey(oid);
    }

    /**
     * 修改订单用户评价状态
     *
     * @param orderInfo
     */
    public void updateOrderIsCommentStatus(Order orderInfo) {
        orderMapper.updateByPrimaryKeySelective(orderInfo);
    }

    //获取所有的订单信息
    public List<Order> getAllorder() {
        return orderMapper.selectByExample(null);
    }

    //条件查询
    public List<Order> selectOrderBytiaojian(Order order) {
        Order order1 = new Order();
        if (order.getoId() != null && !order.getoId().equals("")) {
            order1.setoId(order.getoId());
        }
        if (order.getAlipayId() != null && !order.getAlipayId().equals("")) {
            order1.setAlipayId(order.getAlipayId());
        }
        if (order.getPayStatus() != null) {
            order1.setPayStatus(order.getPayStatus());
        }
        return orderMapper.selectByOrderSelective(order1);
    }

    //管理员设置订单发货状态
    public void updateOrderDeliverStatus(String oId) {
        Order order = new Order();
        order.setoId(oId);
        order.setPayStatus(2);
        orderMapper.updateByPrimaryKeySelective(order);
    }

    //用户确认收货设置订单完成状态
    public void updateOrderSuccessStatus(String oId) {
        Order order = new Order();
        order.setoId(oId);
        order.setPayStatus(3);
        orderMapper.updateByPrimaryKeySelective(order);
    }
}
