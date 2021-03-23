package com.legou.entry;

import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.Pattern;
import java.util.Date;

public class Customer {
    private String cId;
    @Pattern(regexp = "^[a-zA-Z0-9\\u4e00-\\u9fa5]{4,20}$",
            message = "用户名格式有误")
    private String cName;
    @Pattern(regexp = "^[0-9A-Za-z_]{8,20}$",
            message = "密码格式有误")
    private String cPassword;

    private Integer cGender;
    @DateTimeFormat(pattern = "yyyy-MM-dd")     //前传后
    private Date cBirthday;
    @Pattern(regexp = "^[A-Za-z\\d]+([-_.][A-Za-z\\d]+)*@([A-Za-z\\d]+[-.])+[A-Za-z\\d]{2,4}$",
            message = "邮箱格式有误")
    private String cEmail;
    @Pattern(regexp = "^1([38][0-9]|4[579]|5[0-3,5-9]|6[6]|7[0135678]|9[89])\\d{8}$",
            message = "手机号码格式有误")
    private String cPhone;

    private String cImage;

    private Integer jifen;

    public Customer() {
    }

    public Customer(String cId, String cName, String cPassword, Integer cGender, Date cBirthday, String cEmail, String cPhone, String cImage, Integer jifen) {
        this.cId = cId;
        this.cName = cName;
        this.cPassword = cPassword;
        this.cGender = cGender;
        this.cBirthday = cBirthday;
        this.cEmail = cEmail;
        this.cPhone = cPhone;
        this.cImage = cImage;
        this.jifen = jifen;
    }

    public String getcId() {
        return cId;
    }

    public void setcId(String cId) {
        this.cId = cId == null ? null : cId.trim();
    }

    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName == null ? null : cName.trim();
    }

    public String getcPassword() {
        return cPassword;
    }

    public void setcPassword(String cPassword) {
        this.cPassword = cPassword == null ? null : cPassword.trim();
    }

    public Integer getcGender() {
        return cGender;
    }

    public void setcGender(Integer cGender) {
        this.cGender = cGender;
    }

    public Date getcBirthday() {
        return cBirthday;
    }

    public void setcBirthday(Date cBirthday) {
        this.cBirthday = cBirthday;
    }

    public String getcEmail() {
        return cEmail;
    }

    public void setcEmail(String cEmail) {
        this.cEmail = cEmail == null ? null : cEmail.trim();
    }

    public String getcPhone() {
        return cPhone;
    }

    public void setcPhone(String cPhone) {
        this.cPhone = cPhone == null ? null : cPhone.trim();
    }

    public String getcImage() {
        return cImage;
    }

    public void setcImage(String cImage) {
        this.cImage = cImage == null ? null : cImage.trim();
    }

    public Integer getJifen() {
        return jifen;
    }

    public void setJifen(Integer jifen) {
        this.jifen = jifen;
    }

    @Override
    public String toString() {
        return "Customer{" +
                "cId='" + cId + '\'' +
                ", cName='" + cName + '\'' +
                ", cPassword='" + cPassword + '\'' +
                ", cGender=" + cGender +
                ", cBirthday=" + cBirthday +
                ", cEmail='" + cEmail + '\'' +
                ", cPhone='" + cPhone + '\'' +
                ", cImage='" + cImage + '\'' +
                ", jifen=" + jifen +
                '}';
    }
}