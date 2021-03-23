package com.legou.entry;

/**
 * 商品二级分类
 */
public class GoodsSecondType {
    private Integer gstId;

    private String gstName;

    private Integer gftId;

    public GoodsSecondType() {
    }

    public GoodsSecondType(Integer gstId, String gstName, Integer gftId) {
        this.gstId = gstId;
        this.gstName = gstName;
        this.gftId = gftId;
    }

    public Integer getGstId() {
        return gstId;
    }

    public void setGstId(Integer gstId) {
        this.gstId = gstId;
    }

    public String getGstName() {
        return gstName;
    }

    public void setGstName(String gstName) {
        this.gstName = gstName == null ? null : gstName.trim();
    }

    public Integer getGftId() {
        return gftId;
    }

    public void setGftId(Integer gftId) {
        this.gftId = gftId;
    }

    @Override
    public String toString() {
        return "GoodsSecondType{" +
                "gstId=" + gstId +
                ", gstName='" + gstName + '\'' +
                ", gftId=" + gftId +
                '}';
    }
}