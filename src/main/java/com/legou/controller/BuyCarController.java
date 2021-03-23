package com.legou.controller;

import com.legou.entry.BuyCar;
import com.legou.entry.Customer;
import com.legou.entry.Msg;
import com.legou.service.BuyCarService;
import com.legou.utils.UUIDUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class BuyCarController {
    @Autowired
    BuyCarService buyCarService;

    /**
     * 获取确认订单的商品信息
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/getConfirmOrderGoods", method = RequestMethod.GET)
    @ResponseBody
    public Msg getConfirmOrderGoods(HttpServletRequest request) {
        HttpSession session = request.getSession();
        List<BuyCar> list = null;
        if (session.getAttribute("bids") != null) {
            String bids = (String) session.getAttribute("bids");
            String[] str = bids.split("");
            String[] bid;
            if (!str[str.length - 1].equals("-")) {
                bid = bids.split("-");
            } else {
                bids = bids.substring(0, bids.length() - 1);
                bid = bids.split("-");
            }
            list = buyCarService.getConfirmOrderGoods(bid);
        }
        return Msg.success().add("confrimOrderGoods", list);
    }

    /**
     * 进入BuyCar_Two
     *
     * @param bids
     * @return
     */
    @RequestMapping(value = "/toBuyCar_Two", method = RequestMethod.GET)
    public String toBuyCar_Two(@RequestParam("bids") String bids, HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.removeAttribute("bids");
        session.setAttribute("bids", bids);
        return "BuyCar_Two";
    }

    /**
     * 修改购物车商品的数量
     *
     * @param updateNum
     * @return
     */
    @RequestMapping(value = "/updateGoodsNumByBid", method = RequestMethod.PUT)
    @ResponseBody
    public Msg updateGoodsNumByBid(@RequestParam("updateNum") String updateNum) {
        if (updateNum.contains("-")) {
            String[] str = updateNum.split("-");
            if (str.length == 2) {
                int num = Integer.parseInt(str[1]);
                buyCarService.updateGoodsNumByBid(str[0], num);
                return Msg.success();
            }
        }
        return Msg.fail();
    }

    /**
     * 删除,单个与批量结合
     */
    @RequestMapping(value = "/deleteGoodsInBuyCarByBid/{bids}", method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteGoodsInBuyCarByBid(@PathVariable("bids") String bids) {
//        System.out.println(bids);
        if (bids.contains("-")) {
            String[] bid = bids.split("-");
            List<String> list = new ArrayList<>();
            for (String string : bid) {
                list.add(string);
            }
            buyCarService.deleteBatch(list);
        } else {
            buyCarService.deleteGoodsInBuyCarByBid(bids);
        }
        return Msg.success();
    }

    /**
     * 根据状态位清空购物车
     *
     * @return
     */
    @RequestMapping(value = "/cleanBuyCarByStatus", method = RequestMethod.DELETE)
    @ResponseBody
    public Msg cleanBuyCarByStatus(HttpServletRequest request) {
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("customer");
        BuyCar buyCar = new BuyCar();
        if (customer != null) {
            buyCar.setcId(customer.getcId());
            buyCar.setStatus(1);
        } else {
            buyCar.setStatus(0);
        }
        buyCarService.cleanBuyCarByStatus(buyCar);
        return Msg.success();
    }

    /**
     * 添加商品到购物车
     *
     * @return
     */
    @RequestMapping(value = "/addGoodsToBuyCar", method = RequestMethod.GET)
    @ResponseBody
    public Msg addGoodsToBuyCar(@RequestParam("buyCarInfo") String buyCarInfo, HttpServletRequest request) {
        HttpSession session = request.getSession();
        if (buyCarInfo.contains("-")) {
            String[] bc = buyCarInfo.split("-");
            if (bc.length == 2) {
                BuyCar buyCar = new BuyCar();
                buyCar.setbId(UUIDUtils.getUUID(8));
                buyCar.setbNum(Integer.parseInt(bc[1]));
                buyCar.setgId(bc[0]);
                if (session.getAttribute("customer") != null) {
                    Customer customer = (Customer) session.getAttribute("customer");
                    buyCar.setcId(customer.getcId());
                    buyCar.setStatus(1);
                } else {
                    buyCar.setcId(null);
                    buyCar.setStatus(0);
                }
                buyCarService.addGoodsToBuyCar(buyCar);
                return Msg.success();
            }
        }
        return Msg.fail();
    }


    /**
     * 获取购物车的信息
     *
     * @return
     */
    @RequestMapping(value = "/getAllBuyCar", method = RequestMethod.GET)
    @ResponseBody
    public Msg getAllBuyCar(HttpServletRequest request) {
        List<BuyCar> list = buyCarService.getAllBuyCar(request);
//        System.out.println("购物车的数据为："+list);
        return Msg.success().add("buyCarInfo", list);
    }

}
