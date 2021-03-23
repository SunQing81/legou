package com.legou.service;

import com.legou.dao.NoticeMapper;
import com.legou.entry.Notice;
import com.legou.entry.NoticeExample;
import com.legou.entry.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeService {
    @Autowired
    NoticeMapper noticeMapper;

    //获取所有的公告信息
    public List<Notice> getAllNotice() {
        return noticeMapper.selectNoticeWithAdminName(null);
    }

    //添加公告信息
    public void addNotice(Notice notice) {
        noticeMapper.insertSelective(notice);
    }

    //条件查询
    public List<Notice> selectNoticeBytiaojian(Notice notice) {
        Notice notice1 = new Notice();
        if (notice.getnId() != null && !notice.getnId().equals("")) {
            notice1.setnId(notice.getnId());
        }
        if (notice.getnContent() != null && !notice.getnContent().equals("")) {
            notice1.setnContent(notice.getnContent());
        }
        return noticeMapper.selectByNotice(notice1);
    }

    //修改前获取该公告信息
    public Notice getNoticeByNid(String nId) {
        return noticeMapper.selectByPrimaryKey(nId);
    }

    //修改公告信息
    public void updateNotice(Notice notice) {
        noticeMapper.updateByPrimaryKeySelective(notice);
    }

    //批量删除
    public void deleteBatch(List<String> list) {
        NoticeExample example = new NoticeExample();
        NoticeExample.Criteria criteria = example.createCriteria();
        criteria.andNIdIn(list);
        noticeMapper.deleteByExample(example);
    }

    //单个删除
    public void deleteNotice(String nId) {
        noticeMapper.deleteByPrimaryKey(nId);
    }
}
