package com.xm.autho.pojo;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.xm.autho.common.constants.R;

@Entity
@Table(name=R.SysConfig.SYS_TABLE_PREFIX+"role")
//@DynamicUpdate
//@DynamicInsert
//@org.hibernate.annotations.Entity(dynamicInsert=true,dynamicUpdate=true)
public class SysRolePojo implements Serializable{
    
    private static final long serialVersionUID = 1L;

    /**
     * ID
     */
    @Id @GeneratedValue(strategy=GenerationType.AUTO)
    private java.lang.Long seqId;
    /**
     * 名称
     */
    private java.lang.String name;
    /**
     * 英文名
     */
    private java.lang.String enName;
    /**
     * 描述
     */
    private java.lang.String descr;
    /**
     * 门户标识
     */
    private java.lang.String portalKey;
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
    public java.lang.String getName(){
        return this.name;
    }
    
    public void setName(java.lang.String name){
        this.name = name;
    }
    public java.lang.String getEnName(){
        return this.enName;
    }
    
    public void setEnName(java.lang.String enName){
        this.enName = enName;
    }
    public java.lang.String getDescr(){
        return this.descr;
    }
    
    public void setDescr(java.lang.String descr){
        this.descr = descr;
    }
    public java.lang.String getPortalKey(){
        return this.portalKey;
    }
    
    public void setPortalKey(java.lang.String portalKey){
        this.portalKey = portalKey;
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
