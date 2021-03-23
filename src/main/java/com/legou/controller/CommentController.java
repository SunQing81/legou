package com.legou.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.legou.entry.Comment;
import com.legou.entry.Goods;
import com.legou.entry.Msg;
import com.legou.entry.Order;
import com.legou.service.CommentService;
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
import java.util.Date;
import java.util.List;

@Controller
public class CommentController {
    @Autowired
    OrderService orderService;
    @Autowired
    GoodsService goodsService;
    @Autowired
    CommentService commentService;

    /**
     * 根据商品ID获取评价信息
     *
     * @param pn
     * @return
     */
    @RequestMapping(value = "/getAllCommentByGid", method = RequestMethod.GET)
    @ResponseBody
    public Msg getAllCommentByGid(@RequestParam(value = "pn", defaultValue = "1") Integer pn, HttpServletRequest request) {
        HttpSession session = request.getSession();
        Goods goods = (Goods) session.getAttribute("goodsInfo");
        PageHelper.startPage(pn, 10);
        List<Comment> list = commentService.getAllCommentByGid(goods.getgId());
        PageInfo pageInfo = new PageInfo(list, 5);
        return Msg.success().add("pageInfo", pageInfo);
    }

    /**
     * 新增评价
     *
     * @param comment
     * @param request
     * @return
     */
    @RequestMapping(value = "/createComment/{comment}", method = RequestMethod.POST)
    @ResponseBody
    public Msg createComment(@PathVariable("comment") String comment, HttpServletRequest request) {
        HttpSession session = request.getSession();
        Order order = (Order) session.getAttribute("commentOrder");
        String[] strings = comment.split("-");
        if (strings.length == 2) {
            Comment comment_insert = new Comment();
            comment_insert.setCommentId(UUIDUtils.getUUID(8));
            comment_insert.setCommentContent(strings[1]);
            comment_insert.setScore(Integer.parseInt(strings[0]));
            comment_insert.setCreatetime(DateUtil.getTimestamp(new Date()));
            comment_insert.setoId(order.getoId());
            comment_insert.setgId(order.getGoodsList().get(0).getgId());
            comment_insert.setcId(order.getcId());
            commentService.createComment(comment_insert);
            //查出该订单的所有信息更改订单评论状态
            Order orderInfo = orderService.getOrderByOid(order.getoId());
            String[] gId = orderInfo.getgIds().split("-");
            String[] isComment = orderInfo.getIsComment().split("-");
            for (int i = 0; i < gId.length; i++) {
                if (gId[i].equals(order.getGoodsList().get(0).getgId())) {
                    isComment[i] = "1";
                }
            }
            String isComment_new = "";
            for (String s : isComment) {
                isComment_new = s + "-";
            }
            isComment_new = isComment_new.substring(0, isComment_new.length() - 1);
            orderInfo.setIsComment(isComment_new);
            orderService.updateOrderIsCommentStatus(orderInfo);
            return Msg.success();
        } else {
            return Msg.fail();
        }
    }

    /**
     * 获取订单ID去评价页面
     *
     * @param oid_gid
     * @param request
     * @return
     */
    @RequestMapping(value = "/toComment/{oid_gid}", method = RequestMethod.GET)
    public String toComment(@PathVariable("oid_gid") String oid_gid, HttpServletRequest request) {
        HttpSession session = request.getSession();
        String[] str = oid_gid.split("-");
        if (str.length == 2) {
            Order order = orderService.getOrderByOid(str[0]);
            Goods goods = goodsService.getGoodsByGid(str[1]);
            List<Goods> goodsList = new ArrayList<>();
            goodsList.add(goods);
            order.setGoodsList(goodsList);
            session.removeAttribute("commentOrder");
            session.setAttribute("commentOrder", order);
        }
        return "OrderComment";
    }
}
