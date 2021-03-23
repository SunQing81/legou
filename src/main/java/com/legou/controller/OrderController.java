package com.legou.controller;

import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.legou.alipay.AlipayConfig;
import com.legou.entry.Customer;
import com.legou.entry.Goods;
import com.legou.entry.Msg;
import com.legou.entry.Order;
import com.legou.service.BuyCarService;
import com.legou.service.CustomerService;
import com.legou.service.GoodsService;
import com.legou.service.OrderService;
import com.legou.utils.DateUtil;
import com.legou.utils.UUIDUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

@Controller
public class OrderController {
    @Autowired
    OrderService orderService;
    @Autowired
    BuyCarService buyCarService;
    @Autowired
    GoodsService goodsService;
    @Autowired
    CustomerService customerService;

    /**
     * 用户确认收货设置订单完成状态
     *
     * @return
     */
    @RequestMapping(value = "/updateOrderSuccessStatus/{oId}", method = RequestMethod.PUT)
    @ResponseBody
    public Msg updateOrderSuccessStatus(@PathVariable String oId) {
        orderService.updateOrderSuccessStatus(oId);
        return Msg.success();
    }

    /**
     * 管理员设置订单发货状态
     *
     * @return
     */
    @RequestMapping(value = "/updateOrderDeliverStatus/{oId}", method = RequestMethod.PUT)
    @ResponseBody
    public Msg updateOrderDeliverStatus(@PathVariable String oId) {
        orderService.updateOrderDeliverStatus(oId);
        return Msg.success();
    }

    /**
     * 条件查询
     *
     * @param order
     * @param pn
     * @return
     */
    @RequestMapping(value = "/selectOrderBytiaojian", method = RequestMethod.GET)
    @ResponseBody
    public Msg selectOrderBytiaojian(Order order, @RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        PageHelper.startPage(pn, 5);
//        startPage后面紧跟的这个查询就是一个分页查询
        List<Order> list = orderService.selectOrderBytiaojian(order);
//        使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行
//        封装了详细的分页信息，包括有我们查询出来的数据,传入连续显示的页数
        PageInfo pageInfo = new PageInfo(list, 5);
        return Msg.success().add("pageInfo", pageInfo);
    }

    /**
     * 查询所有订单信息
     *
     * @param pn
     * @return
     */
    @RequestMapping(value = "/getAllorder", method = RequestMethod.GET)
    @ResponseBody
    public Msg getAllorder(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        PageHelper.startPage(pn, 5);
//        startPage后面紧跟的这个查询就是一个分页查询
        List<Order> list = orderService.getAllorder();
//        使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行
//        封装了详细的分页信息，包括有我们查询出来的数据,传入连续显示的页数
        PageInfo pageInfo = new PageInfo(list, 5);
        return Msg.success().add("pageInfo", pageInfo);
    }

    /**
     * 确认积分订单后减去对应的积分
     *
     * @param jifen
     * @param request
     * @return
     */
    @RequestMapping(value = "/JiFenOrderConfirm/{jifen}", method = RequestMethod.GET)
    public String JiFenOrderConfirm(@PathVariable("jifen") String jifen, HttpServletRequest request) {
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("customer");
        int new_jifen = customer.getJifen() - Integer.parseInt(jifen);
        Customer customer1 = new Customer();
        customer1.setcId(customer.getcId());
        customer1.setJifen(new_jifen);
        customerService.updateCustomer(customer1);
        Customer customer2 = customerService.selectCustomerByCid(customer.getcId());
        session.removeAttribute("customer");
        session.setAttribute("customer", customer2);
        return "UserOrder";
    }

    /**
     * 获取兑换积分商品
     *
     * @param jifen_gid
     * @param request
     * @return
     */
    @RequestMapping(value = "/getJiFenGoodsByGid/{jifen_gid}", method = RequestMethod.GET)
    @ResponseBody
    public Msg getJiFenGoodsByGid(@PathVariable("jifen_gid") String jifen_gid, HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.removeAttribute("jifen_gid");
        Goods goods = goodsService.getGoodsByGid(jifen_gid);
        return Msg.success().add("jifenGoods", goods);
    }

    /**
     * 前往积分订单页
     *
     * @param jifen_gid
     * @param request
     * @return
     */
    @RequestMapping(value = "/toJiFenOrderPage/{jifen_gid}", method = RequestMethod.GET)
    public String toJiFenOrderPage(@PathVariable("jifen_gid") String jifen_gid, HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.removeAttribute("jifen_gid");
        session.setAttribute("jifen_gid", jifen_gid);
        return "JiFenOrder";
    }

    /**
     * 删除订单
     *
     * @param oid
     * @return
     */
    @RequestMapping(value = "/deleteOrderByOid/{oid}", method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteOrderByOid(@PathVariable("oid") String oid) {
        orderService.deleteOrderByOid(oid);
        return Msg.success();
    }

    /**
     * 获取所有的订单
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/getAllOrderByCid", method = RequestMethod.GET)
    @ResponseBody
    public Msg getAllOrderByCid(HttpServletRequest request) {
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("customer");
        List<Order> list = orderService.getAllOrderByCid(customer.getcId());
//        System.out.println(list);
        return Msg.success().add("allOrderInfo", list);
    }

    /**
     * 支付成功后修改订单的状态信息，以及支付宝交易订单号,以及减少商品库存，以及修改用户积分
     *
     * @param trade
     * @return
     */
    @RequestMapping(value = "/updateOrderStatus/{trade}", method = RequestMethod.PUT)
    @ResponseBody
    public Msg updateOrderStatus(@PathVariable("trade") String trade, HttpServletRequest request) {
//        System.out.println(trade);
        HttpSession session = request.getSession();
        String[] tradeInfo = trade.split("-");
        Order order = new Order();
        order.setoId(tradeInfo[0]);
        order.setAlipayId(tradeInfo[1]);
        order.setPayStatus(1);
        orderService.updateOrderStatus(order, request);
        //修改商品库存
        Order order1 = orderService.getOrderByOid(tradeInfo[0]);
        String[] gid = order1.getgIds().split("-");
        String[] gNum = order1.getgNums().split("-");
        for (int i = 0; i < gid.length; i++) {
            Goods goods = new Goods();
            goods.setgId(gid[i]);
            Goods goods1 = goodsService.getGoodsByGid(gid[i]);
            goods.setgNum(goods1.getgNum() - Integer.parseInt(gNum[i]));
            goodsService.updateGoodsNum(goods);
        }
        //修改用户积分
        Customer customer = (Customer) session.getAttribute("customer");
        Customer customer1 = new Customer();
        customer1.setcId(customer.getcId());
        customer1.setJifen((int) (customer.getJifen() + order1.getTotalMoney()));
        customerService.updateCustomer(customer1);
        session.removeAttribute("customer");
        Customer customer2 = customerService.selectCustomerByCid(customer.getcId());
        session.setAttribute("customer", customer2);
        return Msg.success();
    }

    /**
     * 创建订单
     * GET请求最后参数带小数点的时候 用 Spring 注解 @PathVariable 会自动截取 点.后面字符
     * 解决办法：@PathVariable("{filename:[a-zA-Z0-9\.]+}")
     *
     * @param orderInfo
     * @param request
     * @return
     */
    //只适用于参数在url最后面
    @RequestMapping(value = "/creatOrder/{orderInfo:.+}", method = RequestMethod.POST)
    @ResponseBody
    public Msg creatOrder(@PathVariable("orderInfo") String orderInfo, HttpServletRequest request) {
        // System.out.println(orderInfo);
        String[] str = orderInfo.split("_");
        //str[0]是地址 str[1]是商品Id集合 str[2]是商品对应数量 str[3]是订单总金额
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("customer");
        String[] gId = str[1].split("-");
        String isComment = "";
        for (int i = 0; i < gId.length; i++) {
            isComment = isComment + "0" + "-";
        }
        isComment = isComment.substring(0, isComment.length() - 1);
        if (str.length == 4) {
            Order order = new Order();
            order.setoId(UUIDUtils.getUUID(8));
            order.setcId(customer.getcId());
            order.setaId(str[0]);
            order.setgIds(str[1]);
            order.setgNums(str[2]);
            order.setTotalMoney(Float.parseFloat(str[3]));
            order.setCreatetime(DateUtil.getTimestamp(new Date()));
            order.setAlipayId("");
            order.setIsComment(isComment);
            if (Float.parseFloat(str[3]) == 0) {
                order.setPayStatus(1);
                orderService.creatOrder(order);
            } else {
                order.setPayStatus(0);
                orderService.creatOrder(order);
                //订单创建完成后，删除购物车对应信息
                String bids = session.getAttribute("bids").toString();
                String[] bid = bids.split("-");
                List<String> bidlist = new ArrayList<>(Arrays.asList(bid));
                buyCarService.deleteBatch(bidlist);
            }
            return Msg.success().add("orderInfo", order);
        } else {
            return Msg.fail().add("checkOrder", "数据丢失，异常");
        }
    }

    /**
     * @Title: AlipayController.java
     * @Package com.sihai.controller
     * @Description: 前往支付宝第三方网关进行支付
     * Copyright: Copyright (c) 2017
     * Company:FURUIBOKE.SCIENCE.AND.TECHNOLOGY
     * @version V1.0
     */
    @RequestMapping(value = "/goAlipay/{oid}", produces = "text/html; charset=UTF-8", method = RequestMethod.GET)
    @ResponseBody
    public String goAlipay(@PathVariable("oid") String oid, HttpServletRequest request, HttpServletRequest response) throws Exception {
        if (oid != null && oid.length() == 8) {
            Order order = orderService.getOrderByOid(oid);
            System.out.println(order);
            //获得初始化的AlipayClient
            AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl,
                    AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json",
                    AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);
            //设置请求参数
            AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
            alipayRequest.setReturnUrl(AlipayConfig.return_url);
            alipayRequest.setNotifyUrl(AlipayConfig.notify_url);
            //商户订单号，商户网站订单系统中唯一订单号，必填
            String out_trade_no = order.getoId();
            System.out.println(order.getoId());
            //付款金额，必填
//            DecimalFormat decimalFormat=new DecimalFormat(".00");//构造方法的字符格式这里如果小数不足2位,会以0补足.
//            String total_amount = decimalFormat.format();
            String total_amount = order.getTotalMoney().toString();
//            System.out.println(total_amount);
            //订单名称，必填
            String subject = "乐购网上超市";
            //商品描述，可空
            String body = "";
            // 该笔订单允许的最晚付款时间，逾期将关闭交易。取值范围：1m～15d。m-分钟，h-小时，d-天，1c-当天（1c-当天的情况下，
            // 无论交易何时创建，都在0点关闭）。 该参数数值不接受小数点， 如 1.5h，可转换为 90m。
            String timeout_express = "1c";
            alipayRequest.setBizContent("{\"out_trade_no\":\"" + out_trade_no + "\","
                    + "\"total_amount\":\"" + total_amount + "\","
                    + "\"subject\":\"" + subject + "\","
                    + "\"body\":\"" + body + "\","
                    + "\"timeout_express\":\"" + timeout_express + "\","
                    + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
            //请求
            String result = "";
            try {
                result = alipayClient.pageExecute(alipayRequest).getBody(); //调用SDK生成表单
            } catch (Exception e) {
                e.printStackTrace();
            }
//        System.out.println(result);
            return result;
        } else {
            return null;
        }
    }
}
