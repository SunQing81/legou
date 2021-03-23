package com.legou.entry;

public class AdminType {
    private Integer adminTypeId;

    private String adminTypeName;

    public AdminType() {
    }

    public AdminType(Integer adminTypeId, String adminTypeName) {
        this.adminTypeId = adminTypeId;
        this.adminTypeName = adminTypeName;
    }

    public Integer getAdminTypeId() {
        return adminTypeId;
    }

    public void setAdminTypeId(Integer adminTypeId) {
        this.adminTypeId = adminTypeId;
    }

    public String getAdminTypeName() {
        return adminTypeName;
    }

    public void setAdminTypeName(String adminTypeName) {
        this.adminTypeName = adminTypeName == null ? null : adminTypeName.trim();
    }

    @Override
    public String toString() {
        return "AdminType{" +
                "adminTypeId=" + adminTypeId +
                ", adminTypeName='" + adminTypeName + '\'' +
                '}';
    }
}