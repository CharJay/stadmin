package com.xm.autho.vo;

import java.io.Serializable;

public class AdminVo implements Serializable{

    private static final long serialVersionUID = 1L;

    /**
     * ID
     */
    private Long seqId;
    /**
     * 用户名,唯一性
     */
    private String username;
    /**
     * 真实姓名
     */
    private String realname;

    /**
     * 手机号
     */
    private String mobilePhone;
    /**
     * 联系电话
     */
    private String contactNumber;
    /**
     * 电子邮件
     */
    private String email;
    /**
     * 描述
     */
    private String descr;

    /**
     * 性别：0未知 1男，2女
     */
    private Integer sex;
    /**
     * 用户类型（1：管理员，2：普通用户，3：注册用户）
     */
    private Integer userType;
    /**
     * 头像url
     */
    private String photoUrl;

    public Long getSeqId() {
        return seqId;
    }

    public void setSeqId(Long seqId) {
        this.seqId = seqId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public String getMobilePhone() {
        return mobilePhone;
    }

    public void setMobilePhone(String mobilePhone) {
        this.mobilePhone = mobilePhone;
    }

    public String getContactNumber() {
        return contactNumber;
    }

    public void setContactNumber(String contactNumber) {
        this.contactNumber = contactNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public Integer getUserType() {
        return userType;
    }

    public void setUserType(Integer userType) {
        this.userType = userType;
    }

    public String getPhotoUrl() {
        return photoUrl;
    }

    public void setPhotoUrl(String photoUrl) {
        this.photoUrl = photoUrl;
    }
}
