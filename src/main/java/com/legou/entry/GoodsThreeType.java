package com.legou.entry;

/**
 * 商品三级分类
 */
public class GoodsThreeType {
    private Integer gtId;

    private String gtName;

    private Integer gftId;

    private Integer gstId;

    public GoodsThreeType() {
    }

    public GoodsThreeType(Integer gtId, String gtName, Integer gftId, Integer gstId) {
        this.gtId = gtId;
        this.gtName = gtName;
        this.gftId = gftId;
        this.gstId = gstId;
    }

    public Integer getGtId() {
        return gtId;
    }

    public void setGtId(Integer gtId) {
        this.gtId = gtId;
    }

    public String getGtName() {
        return gtName;
    }

    public void setGtName(String gtName) {
        this.gtName = gtName == null ? null : gtName.trim();
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

    @Override
    public String toString() {
        return "GoodsThreeType{" +
                "gtId=" + gtId +
                ", gtName='" + gtName + '\'' +
                ", gftId=" + gftId +
                ", gstId=" + gstId +
                '}';
    }
}