package com.legou.dao;

import com.legou.entry.Notice;
import com.legou.entry.NoticeExample;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface NoticeMapper {
    long countByExample(NoticeExample example);

    int deleteByExample(NoticeExample example);

    int deleteByPrimaryKey(String nId);

    int insert(Notice record);

    int insertSelective(Notice record);

    List<Notice> selectByExample(NoticeExample example);

    Notice selectByPrimaryKey(String nId);

    int updateByExampleSelective(@Param("record") Notice record, @Param("example") NoticeExample example);

    int updateByExample(@Param("record") Notice record, @Param("example") NoticeExample example);

    int updateByPrimaryKeySelective(Notice record);

    int updateByPrimaryKey(Notice record);

    //查询公告信息和发布人姓名
    List<Notice> selectNoticeWithAdminName(NoticeExample example);

    //条件查询
    List<Notice> selectByNotice(Notice notice);
}