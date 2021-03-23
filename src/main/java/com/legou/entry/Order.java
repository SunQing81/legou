package com.legou.entry;

import java.util.List;

public class Order {
    private String oId;

    private String cId;

    private String aId;

    private String gIds;

    private String gNums;

    private Float totalMoney;

    private String createtime;

    private String alipayId;

    private String isComment;

    private Integer payStatus;

    private Address address;

    private List<Goods> goodsList;

    public Order() {
    }

    public Order(String oId, String cId, String aId, String gIds, String gNums, Float totalMoney, String createtime, String alipayId, String isComment, Integer payStatus, Address address, List<Goods> goodsList) {
        this.oId = oId;
        this.cId = cId;
        this.aId = aId;
        this.gIds = gIds;
        this.gNums = gNums;
        this.totalMoney = totalMoney;
        this.createtime = createtime;
        this.alipayId = alipayId;
        this.isComment = isComment;
        this.payStatus = payStatus;
        this.address = address;
        this.goodsList = goodsList;
    }

    public String getoId() {
        return oId;
    }

    public void setoId(String oId) {
        this.oId = oId == null ? null : oId.trim();
    }

    public String getcId() {
        return cId;
    }

    public void setcId(String cId) {
        this.cId = cId == null ? null : cId.trim();
    }

    public String getaId() {
        return aId;
    }

    public void setaId(String aId) {
        this.aId = aId == null ? null : aId.trim();
    }

    public String getgIds() {
        return gIds;
    }

    public void setgIds(String gIds) {
        this.gIds = gIds == null ? null : gIds.trim();
    }

    public String getgNums() {
        return gNums;
    }

    public void setgNums(String gNums) {
        this.gNums = gNums == null ? null : gNums.trim();
    }

    public Float getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(Float totalMoney) {
        this.totalMoney = totalMoney;
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime == null ? null : createtime.trim();
    }

    public String getAlipayId() {
        return alipayId;
    }

    public void setAlipayId(String alipayId) {
        this.alipayId = alipayId == null ? null : alipayId.trim();
    }

    public String getIsComment() {
        return isComment;
    }

    public void setIsComment(String isComment) {
        this.isComment = isComment == null ? null : isComment.trim();
    }

    public Integer getPayStatus() {
        return payStatus;
    }

    public void setPayStatus(Integer payStatus) {
        this.payStatus = payStatus;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public List<Goods> getGoodsList() {
        return goodsList;
    }

    public void setGoodsList(List<Goods> goodsList) {
        this.goodsList = goodsList;
    }

    @Override
    public String toString() {
        return "Order{" +
                "oId='" + oId + '\'' +
                ", cId='" + cId + '\'' +
                ", aId='" + aId + '\'' +
                ", gIds='" + gIds + '\'' +
                ", gNums='" + gNums + '\'' +
                ", totalMoney=" + totalMoney +
                ", createtime='" + createtime + '\'' +
                ", alipayId='" + alipayId + '\'' +
                ", isComment='" + isComment + '\'' +
                ", payStatus=" + payStatus +
                ", address=" + address +
                ", goodsList=" + goodsList +
                '}';
    }
}