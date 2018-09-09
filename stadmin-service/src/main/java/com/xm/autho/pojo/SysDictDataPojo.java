package com.xm.autho.pojo;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.xm.autho.common.constants.R;

@Entity
@Table(name=R.SysConfig.SYS_TABLE_PREFIX+"dict_data")
//@DynamicUpdate
//@DynamicInsert
//@org.hibernate.annotations.Entity(dynamicInsert=true,dynamicUpdate=true)
public class SysDictDataPojo implements Serializable{
    
    private static final long serialVersionUID = 1L;

    /**
     * ID
     */
    @Id @GeneratedValue(strategy=GenerationType.AUTO)
    private java.lang.Long seqId;
    /**
     * 字典类型
     */
    private java.lang.String dictType;
    /**
     * 字典名称
     */
    private java.lang.String dictName;
    /**
     * 字典类ID
     */
    private java.lang.String classId;
    /**
     * 字典名
     */
    private java.lang.String className;
    /**
     * 条目
     */
    private java.lang.String entryId;
    /**
     * 条目名称
     */
    private java.lang.String entryName;
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
    public java.lang.String getDictType(){
        return this.dictType;
    }
    
    public void setDictType(java.lang.String dictType){
        this.dictType = dictType;
    }
    public java.lang.String getDictName(){
        return this.dictName;
    }
    
    public void setDictName(java.lang.String dictName){
        this.dictName = dictName;
    }
    public java.lang.String getClassId(){
        return this.classId;
    }
    
    public void setClassId(java.lang.String classId){
        this.classId = classId;
    }
    public java.lang.String getClassName(){
        return this.className;
    }
    
    public void setClassName(java.lang.String className){
        this.className = className;
    }
    public java.lang.String getEntryId(){
        return this.entryId;
    }
    
    public void setEntryId(java.lang.String entryId){
        this.entryId = entryId;
    }
    public java.lang.String getEntryName(){
        return this.entryName;
    }
    
    public void setEntryName(java.lang.String entryName){
        this.entryName = entryName;
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
