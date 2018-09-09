package com.xm.autho.pojo;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.xm.autho.common.constants.R;

@Entity
@Table(name=R.SysConfig.SYS_TABLE_PREFIX+"login_log")
//@DynamicUpdate
//@DynamicInsert
//@org.hibernate.annotations.Entity(dynamicInsert=true,dynamicUpdate=true)
public class SysLoginLogPojo implements Serializable{
    
    private static final long serialVersionUID = 1L;

    /**
     * ID
     */
    @Id @GeneratedValue(strategy=GenerationType.AUTO)
    private java.lang.Long seqId;
    /**
     * IP
     */
    private java.lang.String remoteIp;
    /**
     * 用户ID
     */
    private java.lang.Long userId;
    /**
     * 用户名
     */
    private java.lang.String userName;
    /**
     * 认证类型。1密码，2token
     */
    private java.lang.Integer authType;
    /**
     * 0为成功
     */
    private java.lang.Integer retCode;
    /**
     * 结果描述
     */
    private java.lang.String retMsg;
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
    public java.lang.String getRemoteIp(){
        return this.remoteIp;
    }
    
    public void setRemoteIp(java.lang.String remoteIp){
        this.remoteIp = remoteIp;
    }
    public java.lang.Long getUserId(){
        return this.userId;
    }
    
    public void setUserId(java.lang.Long userId){
        this.userId = userId;
    }
    public java.lang.String getUserName(){
        return this.userName;
    }
    
    public void setUserName(java.lang.String userName){
        this.userName = userName;
    }
    public java.lang.Integer getAuthType(){
        return this.authType;
    }
    
    public void setAuthType(java.lang.Integer authType){
        this.authType = authType;
    }
    public java.lang.Integer getRetCode(){
        return this.retCode;
    }
    
    public void setRetCode(java.lang.Integer retCode){
        this.retCode = retCode;
    }
    public java.lang.String getRetMsg(){
        return this.retMsg;
    }
    
    public void setRetMsg(java.lang.String retMsg){
        this.retMsg = retMsg;
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
