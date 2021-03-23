package com.legou.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.legou.entry.*;
import com.legou.service.GoodsService;
import com.legou.utils.DateUtil;
import com.legou.utils.ImageUtils;
import com.legou.utils.UUIDUtils;
import org.hamcrest.Condition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


@Controller
public class GoodsController {

    @Autowired
    GoodsService goodsService;

    /**
     * 单个与批量结合
     *
     * @param gId
     * @return
     */
    @RequestMapping(value = "/deleteGoods/{gId}", method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteGoods(@PathVariable("gId") String gId) {
        if (gId.contains("-")) {
            String[] gid = gId.split("-");
            List<String> list = new ArrayList<>(Arrays.asList(gid));
            goodsService.deleteBatch(list);
        } else {
            goodsService.deleteGoods(gId);
        }
        return Msg.success();
    }

    /**
     * 修改商品信息
     *
     * @return
     */
    @RequestMapping(value = "/updateGoods", method = RequestMethod.POST)
    @ResponseBody
    public Msg updateGoods(@RequestParam String gId, String gDetailinfo, String gPrice, String gCreattime,
                           String gEndtime, String gNum, String goodsFirstTypes, String goodsSecondTypes,
                           String goodsThreeTypes, MultipartFile pictureFile,
                           HttpServletRequest request) throws Exception {
        //初始化一个商品对象
        Goods goods = new Goods();
        if (gDetailinfo.length() > 0 && gPrice.length() > 0 && gCreattime.length() > 0 &&
                gEndtime.length() > 0 && gNum.length() > 0 && goodsFirstTypes.length() > 0 &&
                goodsSecondTypes.length() > 0 && goodsThreeTypes.length() > 0) {
            goods.setgId(gId);
            goods.setgDetailinfo(gDetailinfo);
            goods.setgPrice(Float.parseFloat(gPrice));
            goods.setgCreattime(DateUtil.getTimestamp(DateUtil.StringToDate(gCreattime)));
            goods.setgEndtime(DateUtil.getTimestamp(DateUtil.StringToDate(gEndtime)));
            goods.setgNum(Integer.parseInt(gNum));
            goods.setGftId(Integer.parseInt(goodsFirstTypes));
            goods.setGstId(Integer.parseInt(goodsSecondTypes));
            goods.setGtId(Integer.parseInt(goodsThreeTypes));
        }
        if (pictureFile != null) {
            // 得到上传图片的地址
            String imgPath;
            try {
                //ImageUtils为之前添加的工具类
                imgPath = ImageUtils.upload(request, pictureFile);
                if (imgPath != null) {
                    // 将上传图片的地址封装到实体类
                    goods.setgImage("/" + imgPath);
                    System.out.println("-----------------图片上传成功！");
                } else {
                    System.out.println("-----------------图片上传失败！1");
                }
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
                System.out.println("----------------图片上传失败！2");
            }
        }
        goodsService.updateGoods(goods);
        return Msg.success();
    }

    /**
     * 修改商品信息前获取该商品信息
     *
     * @param gid
     * @return
     */
    @RequestMapping(value = "/getGoodsWithTypeByGid", method = RequestMethod.GET)
    @ResponseBody
    public Msg getGoodsWithTypeByGid(@RequestParam String gid) {
        Goods goods = goodsService.getGoodsWithTypeByGid(gid);
        return Msg.success().add("goods", goods);
    }

    /**
     * 添加商品信息
     *
     * @param request     MultipartFile
     * @param pictureFile
     * @return
     */
    @RequestMapping(value = "/addGoods", method = RequestMethod.POST)
    @ResponseBody
    public Msg addGoods(@RequestParam String gDetailinfo, String gPrice, String gCreattime, String gEndtime,
                        String gNum, String goodsFirstTypes, String goodsSecondTypes, String goodsThreeTypes,
                        HttpServletRequest request, MultipartFile pictureFile) throws Exception {
        if (gDetailinfo.length() > 0 && gPrice.length() > 0 && gCreattime.length() > 0 &&
                gEndtime.length() > 0 && gNum.length() > 0 && goodsFirstTypes.length() > 0 &&
                goodsSecondTypes.length() > 0 && goodsThreeTypes.length() > 0 && pictureFile != null) {
            //初始化一个商品对象
            Goods goods = new Goods();
            goods.setgId(UUIDUtils.getUUID(8));
            goods.setgDetailinfo(gDetailinfo);
            goods.setgPrice(Float.parseFloat(gPrice));
            goods.setgCreattime(DateUtil.getTimestamp(DateUtil.StringToDate(gCreattime)));
            goods.setgEndtime(DateUtil.getTimestamp(DateUtil.StringToDate(gEndtime)));
            goods.setgNum(Integer.parseInt(gNum));
            goods.setgClicknum(0);
            goods.setGftId(Integer.parseInt(goodsFirstTypes));
            goods.setGstId(Integer.parseInt(goodsSecondTypes));
            goods.setGtId(Integer.parseInt(goodsThreeTypes));
            // 得到上传图片的地址
            String imgPath = null;
            try {
                //ImageUtils为之前添加的工具类
                imgPath = ImageUtils.upload(request, pictureFile);
                if (imgPath != null) {
                    // 将上传图片的地址封装到实体类
                    goods.setgImage("/" + imgPath);
                    System.out.println("-----------------图片上传成功！");
                } else {
                    System.out.println("-----------------图片上传失败！1");
                }
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
                System.out.println("----------------图片上传失败！2");
            }
            System.out.println(goods);
            //将数据提交到数据库（包含文件和普通表单数据）
            int rowNo = goodsService.addGoods(goods);
            if (rowNo > 0) {
                return Msg.success();
            } else {
                return Msg.fail();
            }
        } else {
            return Msg.fail();
        }
    }

    /**
     * 条件查询商品信息
     *
     * @param goods
     * @return
     */
    @RequestMapping(value = "/selectGoodsBytiaojian", method = RequestMethod.GET)
    @ResponseBody
    public Msg selectGoodsBytiaojian(Goods goods, @RequestParam("orderBygEndtime") Integer orderBygEndtime,
                                     @RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        PageHelper.startPage(pn, 5);
//        startPage后面紧跟的这个查询就是一个分页查询
        List<Goods> list;
        if (orderBygEndtime == null) {
            list = goodsService.selectGoodsBytiaojian(goods, null);
        } else {
            list = goodsService.selectGoodsBytiaojian(goods, orderBygEndtime);
        }
//        System.out.println(list);
//        使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行
//        封装了详细的分页信息，包括有我们查询出来的数据,传入连续显示的页数
        PageInfo pageInfo = new PageInfo(list, 5);
        return Msg.success().add("pageInfo", pageInfo);
    }

    /**
     * 获取商品对应三级分类
     *
     * @return
     */
    @RequestMapping(value = "/getGoodsThreeTypesBygstId", method = RequestMethod.GET)
    @ResponseBody
    public Msg getGoodsThreeTypesBygstId(@RequestParam("gstId") Integer gstId) {
        List<GoodsThreeType> goodsThreeTypes = goodsService.getGoodsThreeTypesBygstId(gstId);
        return Msg.success().add("goodsSecondTypesBygstId", goodsThreeTypes);
    }

    /**
     * 获取商品对应二级分类
     *
     * @return
     */
    @RequestMapping(value = "/getGoodsSecondTypesBygftId", method = RequestMethod.GET)
    @ResponseBody
    public Msg getGoodsSecondTypesBygftId(@RequestParam("gftId") Integer gftId) {
        List<GoodsSecondType> goodsSecondTypes = goodsService.getGoodsSecondTypesBygftId(gftId);
        return Msg.success().add("goodsSecondTypesBygftId", goodsSecondTypes);
    }

    /**
     * 获取商品一级分类
     *
     * @return
     */
    @RequestMapping(value = "/getGoodsFirstType", method = RequestMethod.GET)
    @ResponseBody
    public Msg getGoodsFirstType() {
        List<GoodsFirstType> goodsFirstTypes = goodsService.getGoodsFirstType();
        return Msg.success().add("goodsFirstTypes", goodsFirstTypes);
    }

    /**
     * 获取所有的商品信息
     *
     * @return
     */
    @RequestMapping(value = "/getAllGoods", method = RequestMethod.GET)
    @ResponseBody
    public Msg getAllGoods(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        PageHelper.startPage(pn, 5);
//        startPage后面紧跟的这个查询就是一个分页查询
        List<Goods> list = goodsService.getAllGoods();
//        使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行
//        封装了详细的分页信息，包括有我们查询出来的数据,传入连续显示的页数
        PageInfo pageInfo = new PageInfo(list, 5);
        return Msg.success().add("pageInfo", pageInfo);
    }

    /**
     * 根据价格获取12个商品作为兑换
     *
     * @return
     */
    @RequestMapping(value = "/getGoodsByPrice", method = RequestMethod.GET)
    @ResponseBody
    public Msg getGoodsByPrice() {
        List<Goods> list = goodsService.getGoodsByPrice();
        return Msg.success().add("GoodsByPrice", list);
    }

    /**
     * 一级分类查找商品
     *
     * @return
     */
    @RequestMapping(value = "/getGoodsByGftId", method = RequestMethod.GET)
    @ResponseBody
    public Msg getGoodsByGftId(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String gftId = (String) session.getAttribute("gftId");
        List<Goods> list = goodsService.getGoodsByGftId(gftId);
        GoodsFirstType goodsFirstType = goodsService.getGoodsFirstTypeBygftId(Integer.parseInt(gftId));
        session.removeAttribute("gftId");
        return Msg.success().add("searchGoods", list).add("goodsFirstType", goodsFirstType);
    }

    /**
     * 一级分类转发到商品页
     *
     * @param gftId
     * @param request
     * @return
     */
    @RequestMapping(value = "/toGoodsPageByGftId", method = RequestMethod.GET)
    public String toGoodsPageByGftId(@RequestParam("gftId") String gftId, HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.removeAttribute("gftId");
        session.removeAttribute("url");
        session.setAttribute("gftId", gftId);
        session.setAttribute("url", "SearchPage");
        return "SearchPage";
    }

    /**
     * 二级分类查找商品
     *
     * @return
     */
    @RequestMapping(value = "/getGoodsByGstId", method = RequestMethod.GET)
    @ResponseBody
    public Msg getGoodsByGstId(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String gstId = (String) session.getAttribute("gstId");
        List<Goods> list = goodsService.getGoodsByGstId(gstId);
        GoodsSecondType goodsSecondType = goodsService.getGoodsSecondTypeBygstId(Integer.parseInt(gstId));
        session.removeAttribute("gstId");
        return Msg.success().add("searchGoods", list).add("goodsSecondType", goodsSecondType);
    }

    /**
     * 二级分类转发到商品页
     *
     * @param gstId
     * @param request
     * @return
     */
    @RequestMapping(value = "/toGoodsPageByGstId", method = RequestMethod.GET)
    public String toGoodsPageByGstId(@RequestParam("gstId") String gstId, HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.removeAttribute("gstId");
        session.removeAttribute("url");
        session.setAttribute("gstId", gstId);
        session.setAttribute("url", "SearchPage");
        return "SearchPage";
    }

    /**
     * 三级分类查找商品
     *
     * @return
     */
    @RequestMapping(value = "/getGoodsByGtId", method = RequestMethod.GET)
    @ResponseBody
    public Msg getGoodsByGtId(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String gtId = (String) session.getAttribute("gtId");
        List<Goods> list = goodsService.getGoodsByGtId(gtId);
        GoodsThreeType goodsThreeType = goodsService.getGoodsThreeTypeBygtId(Integer.parseInt(gtId));
        session.removeAttribute("gtId");
        return Msg.success().add("searchGoods", list).add("goodsThreeType", goodsThreeType);
    }

    /**
     * 三级分类转发到商品页
     *
     * @param gtId
     * @param request
     * @return
     */
    @RequestMapping(value = "/toGoodsPageByGtId", method = RequestMethod.GET)
    public String toGoodsPageByGtId(@RequestParam("gtId") String gtId, HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.removeAttribute("gtId");
        session.removeAttribute("url");
        session.setAttribute("gtId", gtId);
        session.setAttribute("url", "SearchPage");
        return "SearchPage";
    }

    /**
     * 搜索框根据查找内容查找商品
     *
     * @return
     */
    @RequestMapping(value = "/getSearchGoods", method = RequestMethod.GET)
    @ResponseBody
    public Msg getSearchGoods(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String searchContent = (String) session.getAttribute("searchContent");
        List<Goods> list = goodsService.getSearchGoods(searchContent);
//        System.out.println(list);
        session.removeAttribute("searchContent");
        return Msg.success().add("searchGoods", list).add("searchContent", searchContent);
    }

    /**
     * 搜索框搜索商品转发到商品搜索页
     *
     * @param searchContent
     * @param request
     * @return
     */
    @RequestMapping(value = "/toSearchGoodsPage", method = RequestMethod.GET)
    public String toSearchGoodsPage(@RequestParam("searchContent") String searchContent, HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.removeAttribute("searchContent");
        session.removeAttribute("url");
        session.setAttribute("searchContent", searchContent);
        session.setAttribute("url", "SearchPage");
        return "SearchPage";
    }

    /**
     * 通过商品ID获取商品信息并返回到商品详情页面
     *
     * @return
     */
    @RequestMapping(value = "/getGoodsByGid", method = RequestMethod.GET)
    public String getGoodsByGid(@RequestParam("gid") String gid, HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.removeAttribute("goodsInfo");
        session.removeAttribute("url");
        session.removeAttribute("typeInfo");
        Goods goods = goodsService.getGoodsByGid(gid);
        System.out.println(goods);
        GoodsFirstType goodsFirstType = goodsService.getGoodsFirstTypeBygftId(goods.getGftId());
        GoodsSecondType goodsSecondType = goodsService.getGoodsSecondTypeBygstId(goods.getGstId());
        GoodsThreeType goodsThreeType = goodsService.getGoodsThreeTypeBygtId(goods.getGtId());
        String typeInfo = goodsFirstType.getGftId() + "-" + goodsFirstType.getGftName() + "-" +
                goodsSecondType.getGstId() + "-" + goodsSecondType.getGstName() + "-" +
                goodsThreeType.getGtId() + "-" + goodsThreeType.getGtName();
        //商品点击量+1
        goodsService.updateGoodsClickNum(gid);
        session.setAttribute("goodsInfo", goods);
        session.setAttribute("url", "GoodsShow");
        session.setAttribute("typeInfo", typeInfo);
        return "GoodsShow";
    }

    /**
     * 首页获取热门商品信息
     *
     * @return
     */
    @RequestMapping(value = "/getHotGoods", method = RequestMethod.GET)
    @ResponseBody
    public Msg getHotGoods() {
        List<Goods> list = goodsService.getHotGoods();
//        System.out.println(list);
        return Msg.success().add("GoodsInfo", list);
    }

    /**
     * 首页获取商品信息
     *
     * @return
     */
    @RequestMapping(value = "/getGoods", method = RequestMethod.GET)
    @ResponseBody
    public Msg getGoods(@RequestParam("gftId") String str_gftId) {
        int gftId = Integer.parseInt(str_gftId);
        List<Goods> list = goodsService.getGoods(gftId);
//        System.out.println(list);
        return Msg.success().add("GoodsInfo", list);
    }

    /**
     * 首页获取商品分类信息
     *
     * @return
     */
    @RequestMapping(value = "/getGoodsType", method = RequestMethod.GET)
    @ResponseBody
    public Msg getGoodsType() {
        List<GoodsFirstType> goodsFirstTypes = goodsService.getGoodsFirstType();
        List<GoodsSecondType> goodsSecondTypes = goodsService.getGoodsSecondType();
        List<GoodsThreeType> goodsThreeTypes = goodsService.getGoodsThreeType();
        return Msg.success().add("goodsFirstTypes", goodsFirstTypes)
                .add("goodsSecondTypes", goodsSecondTypes).add("goodsThreeTypes", goodsThreeTypes);
    }
}
