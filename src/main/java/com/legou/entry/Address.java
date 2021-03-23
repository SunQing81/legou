package com.legou.entry;

/**
 * 地址类
 */
public class Address {
    private String aId;

    private String aName;

    private String aPhone;

    private String aProvince;

    private String aCity;

    private String aDistrict;

    private String aInfo;

    private Integer aStatus;

    private String aAddtime;

    private String cId;

    public Address() {
    }

    public Address(String aId, String aName, String aPhone, String aProvince, String aCity, String aDistrict, String aInfo, Integer aStatus, String aAddtime, String cId) {
        this.aId = aId;
        this.aName = aName;
        this.aPhone = aPhone;
        this.aProvince = aProvince;
        this.aCity = aCity;
        this.aDistrict = aDistrict;
        this.aInfo = aInfo;
        this.aStatus = aStatus;
        this.aAddtime = aAddtime;
        this.cId = cId;
    }

    public String getaId() {
        return aId;
    }

    public void setaId(String aId) {
        this.aId = aId == null ? null : aId.trim();
    }

    public String getaName() {
        return aName;
    }

    public void setaName(String aName) {
        this.aName = aName == null ? null : aName.trim();
    }

    public String getaPhone() {
        return aPhone;
    }

    public void setaPhone(String aPhone) {
        this.aPhone = aPhone == null ? null : aPhone.trim();
    }

    public String getaProvince() {
        return aProvince;
    }

    public void setaProvince(String aProvince) {
        this.aProvince = aProvince == null ? null : aProvince.trim();
    }

    public String getaCity() {
        return aCity;
    }

    public void setaCity(String aCity) {
        this.aCity = aCity == null ? null : aCity.trim();
    }

    public String getaDistrict() {
        return aDistrict;
    }

    public void setaDistrict(String aDistrict) {
        this.aDistrict = aDistrict == null ? null : aDistrict.trim();
    }

    public String getaInfo() {
        return aInfo;
    }

    public void setaInfo(String aInfo) {
        this.aInfo = aInfo == null ? null : aInfo.trim();
    }

    public Integer getaStatus() {
        return aStatus;
    }

    public void setaStatus(Integer aStatus) {
        this.aStatus = aStatus;
    }

    public String getaAddtime() {
        return aAddtime;
    }

    public void setaAddtime(String aAddtime) {
        this.aAddtime = aAddtime == null ? null : aAddtime.trim();
    }

    public String getcId() {
        return cId;
    }

    public void setcId(String cId) {
        this.cId = cId == null ? null : cId.trim();
    }

    @Override
    public String toString() {
        return "Address{" +
                "aId='" + aId + '\'' +
                ", aName='" + aName + '\'' +
                ", aPhone='" + aPhone + '\'' +
                ", aProvince='" + aProvince + '\'' +
                ", aCity='" + aCity + '\'' +
                ", aDistrict='" + aDistrict + '\'' +
                ", aInfo='" + aInfo + '\'' +
                ", aStatus=" + aStatus +
                ", aAddtime='" + aAddtime + '\'' +
                ", cId='" + cId + '\'' +
                '}';
    }
}