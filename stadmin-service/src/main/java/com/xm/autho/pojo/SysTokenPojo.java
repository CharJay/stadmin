package com.xm.autho.pojo;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;

import com.xm.autho.common.constants.R;


@Entity
@Table(name=R.SysConfig.SYS_TABLE_PREFIX+"token")
//@DynamicUpdate
@DynamicInsert
//@org.hibernate.annotations.Entity(dynamicInsert=true,dynamicUpdate=true)
public class SysTokenPojo implements Serializable{
    
    private static final long serialVersionUID = 1L;

    /**
     * ID
     */
    @Id
    private java.lang.String seqId;
    /**
     * 用户
     */
    private java.lang.Long userId;
    /**
     * 创建时间
     */
    private java.util.Date createTime;
    /**
     * 修改时间
     */
    private java.util.Date updateTime;
    /**
     * 过期时间
     */
    private java.util.Date expireTime;
    /**
     * 数据版本
     */
    private java.lang.Integer dversion;
    /**
     * 是否删除
     */
    private java.lang.Integer isDel;
    
    public java.lang.String getSeqId(){
        return this.seqId;
    }
    
    public void setSeqId(java.lang.String seqId){
        this.seqId = seqId;
    }
    public java.lang.Long getUserId(){
        return this.userId;
    }
    
    public void setUserId(java.lang.Long userId){
        this.userId = userId;
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
    public java.util.Date getExpireTime(){
        return this.expireTime;
    }
    
    public void setExpireTime(java.util.Date expireTime){
        this.expireTime = expireTime;
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
    
}
