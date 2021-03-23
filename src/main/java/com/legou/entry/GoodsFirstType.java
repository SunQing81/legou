package com.legou.entry;

/**
 * 商品一级分类
 */
public class GoodsFirstType {
    private Integer gftId;

    private String gftName;

    public GoodsFirstType() {
    }

    public GoodsFirstType(Integer gftId, String gftName) {
        this.gftId = gftId;
        this.gftName = gftName;
    }


    public Integer getGftId() {
        return gftId;
    }

    public void setGftId(Integer gftId) {
        this.gftId = gftId;
    }

    public String getGftName() {
        return gftName;
    }

    public void setGftName(String gftName) {
        this.gftName = gftName == null ? null : gftName.trim();
    }

    @Override
    public String toString() {
        return "GoodsFirstType{" +
                "gftId=" + gftId +
                ", gftName='" + gftName + '\'' +
                '}';
    }
}