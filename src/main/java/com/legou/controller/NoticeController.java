package com.legou.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.legou.entry.Administrator;
import com.legou.entry.Msg;
import com.legou.entry.Notice;
import com.legou.entry.Order;
import com.legou.service.NoticeService;
import com.legou.utils.DateUtil;
import com.legou.utils.UUIDUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
public class NoticeController {

    @Autowired
    NoticeService noticeService;

    /**
     * 单个与批量结合
     *
     * @param nId
     * @return
     */
    @RequestMapping(value = "/deleteNotice/{nId}", method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteNotice(@PathVariable String nId) {
        if (nId.contains("-")) {
            String[] strings = nId.split("-");
            List<String> list = new ArrayList<>(Arrays.asList(strings));
            noticeService.deleteBatch(list);
        } else {
            noticeService.deleteNotice(nId);
        }
        return Msg.success();
    }

    /**
     * 修改公告信息
     *
     * @param notice
     * @return
     */
    @RequestMapping(value = "/updateNotice", method = RequestMethod.PUT)
    @ResponseBody
    public Msg updateNotice(Notice notice) throws Exception {
        notice.setnCreatetime(DateUtil.getTimestamp(DateUtil.StringToDate(notice.getnCreatetime())));
        noticeService.updateNotice(notice);
        return Msg.success();
    }

    /**
     * 修改前获取该公告信息
     *
     * @param nId
     * @return
     */
    @RequestMapping(value = "/getNoticeByNid/{nId}", method = RequestMethod.GET)
    @ResponseBody
    public Msg getNoticeByNid(@PathVariable String nId) {
        Notice notice = noticeService.getNoticeByNid(nId);
        return Msg.success().add("notice", notice);
    }

    /**
     * 条件查询
     *
     * @param notice
     * @param pn
     * @return
     */
    @RequestMapping(value = "/selectNoticeBytiaojian", method = RequestMethod.GET)
    @ResponseBody
    public Msg selectNoticeBytiaojian(Notice notice, @RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        PageHelper.startPage(pn, 5);
//        startPage后面紧跟的这个查询就是一个分页查询
        List<Notice> list = noticeService.selectNoticeBytiaojian(notice);
//        使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行
//        封装了详细的分页信息，包括有我们查询出来的数据,传入连续显示的页数
        PageInfo pageInfo = new PageInfo(list, 5);
        return Msg.success().add("pageInfo", pageInfo);
    }

    /**
     * 添加公告
     *
     * @param notice
     * @return
     */
    @RequestMapping(value = "/addNotice", method = RequestMethod.POST)
    @ResponseBody
    public Msg addNotice(Notice notice, HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession();
        Administrator administrator = (Administrator) session.getAttribute("admin");
        notice.setnId(UUIDUtils.getUUID(8));
        notice.setAdminId(administrator.getAdminId());
        notice.setnCreatetime(DateUtil.getTimestamp(DateUtil.StringToDate(notice.getnCreatetime())));
        noticeService.addNotice(notice);
        return Msg.success();
    }

    /**
     * 获取所有的公告信息
     *
     * @return
     */
    @RequestMapping(value = "/getAllNotice", method = RequestMethod.GET)
    @ResponseBody
    public Msg getAllNotice(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        PageHelper.startPage(pn, 5);
//        startPage后面紧跟的这个查询就是一个分页查询
        List<Notice> list = noticeService.getAllNotice();
//        使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行
//        封装了详细的分页信息，包括有我们查询出来的数据,传入连续显示的页数
        PageInfo pageInfo = new PageInfo(list, 5);
        return Msg.success().add("pageInfo", pageInfo);
    }
}
