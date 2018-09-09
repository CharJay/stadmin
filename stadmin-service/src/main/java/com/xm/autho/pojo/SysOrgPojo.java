package com.xm.autho.pojo;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.xm.autho.common.constants.R;

@Entity
@Table(name=R.SysConfig.SYS_TABLE_PREFIX+"org")
//@DynamicUpdate
//@DynamicInsert
//@org.hibernate.annotations.Entity(dynamicInsert=true,dynamicUpdate=true)
public class SysOrgPojo implements Serializable{
    
    private static final long serialVersionUID = 1L;

    /**
     * ID
     */
    @Id @GeneratedValue(strategy=GenerationType.AUTO)
    private java.lang.Long seqId;
    /**
     * 组织机构名称
     */
    private java.lang.String name;
    /**
     * 描述
     */
    private java.lang.String descr;
    /**
     * 父节点ID
     */
    private java.lang.Long superId;
    /**
     * 节点层级
     */
    private java.lang.Integer nodeLevel;
    /**
     * 节点路径
     */
    private java.lang.String nodePath;
    /**
     * 门户标识
     */
    private java.lang.String portalKey;
    /**
     * 叶子节点
     */
    private java.lang.Integer isLeaf;
    /**
     * 上级名称
     */
    private java.lang.String superName;
    /**
     * 节点路径名称
     */
    private java.lang.String nodePathName;
    /**
     * 机构编号
     */
    private java.lang.String idcard;
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
    public java.lang.String getDescr(){
        return this.descr;
    }
    
    public void setDescr(java.lang.String descr){
        this.descr = descr;
    }
    public java.lang.Long getSuperId(){
        return this.superId;
    }
    
    public void setSuperId(java.lang.Long superId){
        this.superId = superId;
    }
    public java.lang.Integer getNodeLevel(){
        return this.nodeLevel;
    }
    
    public void setNodeLevel(java.lang.Integer nodeLevel){
        this.nodeLevel = nodeLevel;
    }
    public java.lang.String getNodePath(){
        return this.nodePath;
    }
    
    public void setNodePath(java.lang.String nodePath){
        this.nodePath = nodePath;
    }
    public java.lang.String getPortalKey(){
        return this.portalKey;
    }
    
    public void setPortalKey(java.lang.String portalKey){
        this.portalKey = portalKey;
    }
    public java.lang.Integer getIsLeaf(){
        return this.isLeaf;
    }
    
    public void setIsLeaf(java.lang.Integer isLeaf){
        this.isLeaf = isLeaf;
    }
    public java.lang.String getSuperName(){
        return this.superName;
    }
    
    public void setSuperName(java.lang.String superName){
        this.superName = superName;
    }
    public java.lang.String getNodePathName(){
        return this.nodePathName;
    }
    
    public void setNodePathName(java.lang.String nodePathName){
        this.nodePathName = nodePathName;
    }
    public java.lang.String getIdcard(){
        return this.idcard;
    }
    
    public void setIdcard(java.lang.String idcard){
        this.idcard = idcard;
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
