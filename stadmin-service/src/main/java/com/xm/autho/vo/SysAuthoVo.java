package com.xm.autho.vo;

import java.io.Serializable;

public class SysAuthoVo implements Serializable{
    
    private static final long serialVersionUID = 1L;

    /**
     * ID
     */
    private java.lang.Long seqId;
    /**
     * 权限名
     */
    private java.lang.String name;
    /**
     * 权限编码
     */
    private java.lang.String code;
    /**
     * 英文名
     */
    private java.lang.String enName;
    /**
     * 地址
     */
    private java.lang.String uri;
    /**
     * (1、模块，2、菜单，3、按钮)
     */
    private java.lang.Integer type;
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
     * 图标样式
     */
    private java.lang.String iconClass;
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
    public java.lang.String getCode(){
        return this.code;
    }
    
    public void setCode(java.lang.String code){
        this.code = code;
    }
    public java.lang.String getEnName(){
        return this.enName;
    }
    
    public void setEnName(java.lang.String enName){
        this.enName = enName;
    }
    public java.lang.String getUri(){
        return this.uri;
    }
    
    public void setUri(java.lang.String uri){
        this.uri = uri;
    }
    public java.lang.Integer getType(){
        return this.type;
    }
    
    public void setType(java.lang.Integer type){
        this.type = type;
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
    public java.lang.String getIconClass(){
        return this.iconClass;
    }
    
    public void setIconClass(java.lang.String iconClass){
        this.iconClass = iconClass;
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
