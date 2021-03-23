package com.legou.dao;

import com.legou.entry.Comment;
import com.legou.entry.CommentExample;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface CommentMapper {
    long countByExample(CommentExample example);

    int deleteByExample(CommentExample example);

    int deleteByPrimaryKey(String commentId);

    int insert(Comment record);

    int insertSelective(Comment record);

    List<Comment> selectByExample(CommentExample example);

    /**
     * 查询评价时同时查询用户名
     *
     * @param example
     * @return
     */
    List<Comment> selectByExampleWithCustomer(CommentExample example);


    Comment selectByPrimaryKey(String commentId);

    int updateByExampleSelective(@Param("record") Comment record, @Param("example") CommentExample example);

    int updateByExample(@Param("record") Comment record, @Param("example") CommentExample example);

    int updateByPrimaryKeySelective(Comment record);

    int updateByPrimaryKey(Comment record);
}