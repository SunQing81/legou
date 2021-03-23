package com.legou.entry;

public class Comment {
    private String commentId;

    private String commentContent;

    private Integer score;

    private String createtime;

    private String oId;

    private String gId;

    private String cId;

    private Customer customer;

    public Comment() {
    }

    public Comment(String commentId, String commentContent, Integer score, String createtime, String oId, String gId, String cId, Customer customer) {
        this.commentId = commentId;
        this.commentContent = commentContent;
        this.score = score;
        this.createtime = createtime;
        this.oId = oId;
        this.gId = gId;
        this.cId = cId;
        this.customer = customer;
    }

    public String getCommentId() {
        return commentId;
    }

    public void setCommentId(String commentId) {
        this.commentId = commentId == null ? null : commentId.trim();
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent == null ? null : commentContent.trim();
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime == null ? null : createtime.trim();
    }

    public String getoId() {
        return oId;
    }

    public void setoId(String oId) {
        this.oId = oId == null ? null : oId.trim();
    }

    public String getgId() {
        return gId;
    }

    public void setgId(String gId) {
        this.gId = gId == null ? null : gId.trim();
    }

    public String getcId() {
        return cId;
    }

    public void setcId(String cId) {
        this.cId = cId == null ? null : cId.trim();
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "commentId='" + commentId + '\'' +
                ", commentContent='" + commentContent + '\'' +
                ", score=" + score +
                ", createtime='" + createtime + '\'' +
                ", oId='" + oId + '\'' +
                ", gId='" + gId + '\'' +
                ", cId='" + cId + '\'' +
                ", customer=" + customer +
                '}';
    }
}