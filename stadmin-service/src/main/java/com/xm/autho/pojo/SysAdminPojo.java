package com.xm.autho.pojo;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import com.xm.autho.common.constants.R;

@Entity
@Table(name=R.SysConfig.SYS_TABLE_PREFIX+"admin")
@DynamicUpdate
@DynamicInsert
//@org.hibernate.annotations.Entity(dynamicInsert=true,dynamicUpdate=true)
public class SysAdminPojo implements Serializable{
    
    private static final long serialVersionUID = 1L;

    /**
     * ID
     */
    @Id @GeneratedValue(strategy=GenerationType.AUTO)
    private java.lang.Long seqId;
    /**
     * 用户名,唯一性
     */
    private java.lang.String username;
    /**
     * 真实姓名
     */
    private java.lang.String realname;
    /**
     * 密码
     */
    private java.lang.String password;
    /**
     * 加密盐
     */
    private java.lang.String salt;
    /**
     * 地址
     */
    private java.lang.String address;
    /**
     * 手机号
     */
    private java.lang.String mobilePhone;
    /**
     * 联系电话
     */
    private java.lang.String contactNumber;
    /**
     * 电子邮件
     */
    private java.lang.String email;
    /**
     * 描述
     */
    private java.lang.String descr;
    /**
     * 状态 1正常 2锁定
     */
    private java.lang.Integer status;
    /**
     * 门户标识
     */
    private java.lang.String portalKey;
    /**
     * 所属物业
     */
    private java.lang.Long propertyId;
    /**
     * 性别：0未知 1男，2女
     */
    private java.lang.Integer sex;
    /**
     * 用户类型（1：管理员，2：普通用户，3：注册用户）
     */
    private java.lang.Integer userType;
    /**
     * 头像url
     */
    private java.lang.String photoUrl;
    /**
     * 创建时间
     */
    private java.util.Date createTime;
    /**
     * 修改时间
     */
    private java.util.Date updateTime;
    /**
     * 数据版本
     */
    @javax.persistence.Version
    private java.lang.Integer dversion;
    /**
     * 是否删除
     */
    private java.lang.Integer isDel;
    /**
     * 排序
     */
    private java.lang.Integer dataOrder;
    
    public java.lang.Long getSeqId(){
        return this.seqId;
    }
    
    public void setSeqId(java.lang.Long seqId){
        this.seqId = seqId;
    }
    public java.lang.String getUsername(){
        return this.username;
    }
    
    public void setUsername(java.lang.String username){
        this.username = username;
    }
    public java.lang.String getRealname(){
        return this.realname;
    }
    
    public void setRealname(java.lang.String realname){
        this.realname = realname;
    }
    public java.lang.String getPassword(){
        return this.password;
    }
    
    public void setPassword(java.lang.String password){
        this.password = password;
    }
    public java.lang.String getSalt(){
        return this.salt;
    }
    
    public void setSalt(java.lang.String salt){
        this.salt = salt;
    }
    public java.lang.String getAddress(){
        return this.address;
    }
    
    public void setAddress(java.lang.String address){
        this.address = address;
    }
    public java.lang.String getMobilePhone(){
        return this.mobilePhone;
    }
    
    public void setMobilePhone(java.lang.String mobilePhone){
        this.mobilePhone = mobilePhone;
    }
    public java.lang.String getContactNumber(){
        return this.contactNumber;
    }
    
    public void setContactNumber(java.lang.String contactNumber){
        this.contactNumber = contactNumber;
    }
    public java.lang.String getEmail(){
        return this.email;
    }
    
    public void setEmail(java.lang.String email){
        this.email = email;
    }
    public java.lang.String getDescr(){
        return this.descr;
    }
    
    public void setDescr(java.lang.String descr){
        this.descr = descr;
    }
    public java.lang.Integer getStatus(){
        return this.status;
    }
    
    public void setStatus(java.lang.Integer status){
        this.status = status;
    }
    public java.lang.String getPortalKey(){
        return this.portalKey;
    }
    
    public void setPortalKey(java.lang.String portalKey){
        this.portalKey = portalKey;
    }
    public java.lang.Long getPropertyId(){
        return this.propertyId;
    }
    
    public void setPropertyId(java.lang.Long propertyId){
        this.propertyId = propertyId;
    }
    public java.lang.Integer getSex(){
        return this.sex;
    }
    
    public void setSex(java.lang.Integer sex){
        this.sex = sex;
    }
    public java.lang.Integer getUserType(){
        return this.userType;
    }
    
    public void setUserType(java.lang.Integer userType){
        this.userType = userType;
    }
    public java.lang.String getPhotoUrl(){
        return this.photoUrl;
    }
    
    public void setPhotoUrl(java.lang.String photoUrl){
        this.photoUrl = photoUrl;
    }
    public java.util.Date getCreateTime(){
        return this.createTime;
    }
    
    public void setCreateTime(java.util.Date createTime){
        this.createTime = createTime;
    }
    public java.util.Date getUpdateTime(){
        return this.updateTime;
    }
    
    public void setUpdateTime(java.util.Date updateTime){
        this.updateTime = updateTime;
    }
    public java.lang.Integer getDversion(){
        return this.dversion;
    }
    
    public void setDversion(java.lang.Integer dversion){
        this.dversion = dversion;
    }
    public java.lang.Integer getIsDel(){
        return this.isDel;
    }
    
    public void setIsDel(java.lang.Integer isDel){
        this.isDel = isDel;
    }
    public java.lang.Integer getDataOrder(){
        return this.dataOrder;
    }
    
    public void setDataOrder(java.lang.Integer dataOrder){
        this.dataOrder = dataOrder;
    }
    
}
