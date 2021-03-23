package com.legou.entry;

import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.Pattern;

public class Administrator {
    private String adminId;

    @Pattern(regexp = "^[a-zA-Z0-9\\u4e00-\\u9fa5]{2,10}$",
            message = "员工名格式有误")
    private String adminName;
    @Pattern(regexp = "^[0-9A-Za-z_]{8,20}$",
            message = "密码格式有误")
    private String adminPassword;

    private Integer adminGender;
    @Pattern(regexp = "^[A-Za-z\\d]+([-_.][A-Za-z\\d]+)*@([A-Za-z\\d]+[-.])+[A-Za-z\\d]{2,4}$",
            message = "邮箱格式有误")
    private String adminEmail;
    @Pattern(regexp = "^1([38][0-9]|4[579]|5[0-3,5-9]|6[6]|7[0135678]|9[89])\\d{8}$",
            message = "手机号码格式有误")
    private String adminPhone;

    private String adminCreatetime;

    private String adminImage;

    private Integer adminTypeId;

    public Administrator() {
    }

    public Administrator(String adminId, String adminName, String adminPassword, Integer adminGender, String adminEmail, String adminPhone, String adminCreatetime, String adminImage, Integer adminTypeId) {
        this.adminId = adminId;
        this.adminName = adminName;
        this.adminPassword = adminPassword;
        this.adminGender = adminGender;
        this.adminEmail = adminEmail;
        this.adminPhone = adminPhone;
        this.adminCreatetime = adminCreatetime;
        this.adminImage = adminImage;
        this.adminTypeId = adminTypeId;
    }

    public String getAdminId() {
        return adminId;
    }

    public void setAdminId(String adminId) {
        this.adminId = adminId == null ? null : adminId.trim();
    }

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName == null ? null : adminName.trim();
    }

    public String getAdminPassword() {
        return adminPassword;
    }

    public void setAdminPassword(String adminPassword) {
        this.adminPassword = adminPassword == null ? null : adminPassword.trim();
    }

    public Integer getAdminGender() {
        return adminGender;
    }

    public void setAdminGender(Integer adminGender) {
        this.adminGender = adminGender;
    }

    public String getAdminEmail() {
        return adminEmail;
    }

    public void setAdminEmail(String adminEmail) {
        this.adminEmail = adminEmail == null ? null : adminEmail.trim();
    }

    public String getAdminPhone() {
        return adminPhone;
    }

    public void setAdminPhone(String adminPhone) {
        this.adminPhone = adminPhone == null ? null : adminPhone.trim();
    }

    public String getAdminCreatetime() {
        return adminCreatetime;
    }

    public void setAdminCreatetime(String adminCreatetime) {
        this.adminCreatetime = adminCreatetime == null ? null : adminCreatetime.trim();
    }

    public String getAdminImage() {
        return adminImage;
    }

    public void setAdminImage(String adminImage) {
        this.adminImage = adminImage == null ? null : adminImage.trim();
    }

    public Integer getAdminTypeId() {
        return adminTypeId;
    }

    public void setAdminTypeId(Integer adminTypeId) {
        this.adminTypeId = adminTypeId;
    }

    @Override
    public String toString() {
        return "Administrator{" +
                "adminId='" + adminId + '\'' +
                ", adminName='" + adminName + '\'' +
                ", adminPassword='" + adminPassword + '\'' +
                ", adminGender=" + adminGender +
                ", adminEmail='" + adminEmail + '\'' +
                ", adminPhone='" + adminPhone + '\'' +
                ", adminCreatetime='" + adminCreatetime + '\'' +
                ", adminImage='" + adminImage + '\'' +
                ", adminTypeId=" + adminTypeId +
                '}';
    }
}