package com.legou.service;

import com.legou.dao.CommentMapper;
import com.legou.entry.Comment;
import com.legou.entry.CommentExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentService {
    @Autowired
    CommentMapper commentMapper;

    /**
     * 新增评价
     *
     * @param comment
     * @return
     */
    public void createComment(Comment comment) {
        commentMapper.insert(comment);
    }

    /**
     * 根据商品ID获取评价信息
     *
     * @param gid
     * @return
     */
    public List<Comment> getAllCommentByGid(String gid) {
        CommentExample commentExample = new CommentExample();
        CommentExample.Criteria criteria = commentExample.createCriteria();
        criteria.andGIdEqualTo(gid);
        return commentMapper.selectByExampleWithCustomer(commentExample);
    }
}
