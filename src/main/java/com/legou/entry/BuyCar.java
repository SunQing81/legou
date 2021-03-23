package com.legou.entry;

public class BuyCar {
    private String bId;

    private Integer bNum;

    private String gId;

    private String cId;

    private Integer status;

    private Goods goods;

    public BuyCar() {
    }

    public BuyCar(String bId, Integer bNum, String gId, String cId, Integer status, Goods goods) {
        this.bId = bId;
        this.bNum = bNum;
        this.gId = gId;
        this.cId = cId;
        this.status = status;
        this.goods = goods;
    }

    public String getbId() {
        return bId;
    }

    public void setbId(String bId) {
        this.bId = bId == null ? null : bId.trim();
    }

    public Integer getbNum() {
        return bNum;
    }

    public void setbNum(Integer bNum) {
        this.bNum = bNum;
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

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Goods getGoods() {
        return goods;
    }

    public void setGoods(Goods goods) {
        this.goods = goods;
    }

    @Override
    public String toString() {
        return "BuyCar{" +
                "bId='" + bId + '\'' +
                ", bNum=" + bNum +
                ", gId='" + gId + '\'' +
                ", cId='" + cId + '\'' +
                ", status=" + status +
                ", goods=" + goods +
                '}';
    }
}