package com.legou.entry;

/**
 * 商品类
 */
public class Goods {
    private String gId;

    private String gDetailinfo;

    private Float gPrice;

    private String gCreattime;

    private String gEndtime;

    private Integer gNum;

    private String gImage;

    private Integer gClicknum;

    private Integer gftId;

    private Integer gstId;

    private Integer gtId;

    private GoodsFirstType goodsFirstType;

    private GoodsSecondType goodsSecondType;

    private GoodsThreeType goodsThreeType;

    public Goods() {
    }

    public Goods(String gId, String gDetailinfo, Float gPrice, String gCreattime, String gEndtime,
                 Integer gNum, String gImage, Integer gClicknum, Integer gftId, Integer gstId, Integer gtId,
                 GoodsFirstType goodsFirstType, GoodsSecondType goodsSecondType, GoodsThreeType goodsThreeType) {
        this.gId = gId;
        this.gDetailinfo = gDetailinfo;
        this.gPrice = gPrice;
        this.gCreattime = gCreattime;
        this.gEndtime = gEndtime;
        this.gNum = gNum;
        this.gImage = gImage;
        this.gClicknum = gClicknum;
        this.gftId = gftId;
        this.gstId = gstId;
        this.gtId = gtId;
        this.goodsFirstType = goodsFirstType;
        this.goodsSecondType = goodsSecondType;
        this.goodsThreeType = goodsThreeType;
    }

    public String getgId() {
        return gId;
    }

    public void setgId(String gId) {
        this.gId = gId == null ? null : gId.trim();
    }

    public String getgDetailinfo() {
        return gDetailinfo;
    }

    public void setgDetailinfo(String gDetailinfo) {
        this.gDetailinfo = gDetailinfo == null ? null : gDetailinfo.trim();
    }

    public Float getgPrice() {
        return gPrice;
    }

    public void setgPrice(Float gPrice) {
        this.gPrice = gPrice;
    }

    public String getgCreattime() {
        return gCreattime;
    }

    public void setgCreattime(String gCreattime) {
        this.gCreattime = gCreattime == null ? null : gCreattime.trim();
    }

    public String getgEndtime() {
        return gEndtime;
    }

    public void setgEndtime(String gEndtime) {
        this.gEndtime = gEndtime == null ? null : gEndtime.trim();
    }

    public Integer getgNum() {
        return gNum;
    }

    public void setgNum(Integer gNum) {
        this.gNum = gNum;
    }

    public String getgImage() {
        return gImage;
    }

    public void setgImage(String gImage) {
        this.gImage = gImage == null ? null : gImage.trim();
    }

    public Integer getgClicknum() {
        return gClicknum;
    }

    public void setgClicknum(Integer gClicknum) {
        this.gClicknum = gClicknum;
    }

    public Integer getGftId() {
        return gftId;
    }

    public void setGftId(Integer gftId) {
        this.gftId = gftId;
    }

    public Integer getGstId() {
        return gstId;
    }

    public void setGstId(Integer gstId) {
        this.gstId = gstId;
    }

    public Integer getGtId() {
        return gtId;
    }

    public void setGtId(Integer gtId) {
        this.gtId = gtId;
    }

    public GoodsFirstType getGoodsFirstType() {
        return goodsFirstType;
    }

    public void setGoodsFirstType(GoodsFirstType goodsFirstType) {
        this.goodsFirstType = goodsFirstType;
    }

    public GoodsSecondType getGoodsSecondType() {
        return goodsSecondType;
    }

    public void setGoodsSecondType(GoodsSecondType goodsSecondType) {
        this.goodsSecondType = goodsSecondType;
    }

    public GoodsThreeType getGoodsThreeType() {
        return goodsThreeType;
    }

    public void setGoodsThreeType(GoodsThreeType goodsThreeType) {
        this.goodsThreeType = goodsThreeType;
    }

    @Override
    public String toString() {
        return "Goods{" +
                "gId='" + gId + '\'' +
                ", gDetailinfo='" + gDetailinfo + '\'' +
                ", gPrice=" + gPrice +
                ", gCreattime='" + gCreattime + '\'' +
                ", gEndtime='" + gEndtime + '\'' +
                ", gNum=" + gNum +
                ", gImage='" + gImage + '\'' +
                ", gClicknum=" + gClicknum +
                ", gftId=" + gftId +
                ", gstId=" + gstId +
                ", gtId=" + gtId +
                ", goodsFirstType=" + goodsFirstType +
                ", goodsSecondType=" + goodsSecondType +
                ", goodsThreeType=" + goodsThreeType +
                '}';
    }
}