package com.xm.autho.param;

public class SysOrgParam{

    /**
     * ID
     */
    private Long seqId;
    /**
     * 组织机构名称
     */
    private String name;
    /**
     * 描述
     */
    private String descr;
    /**
     * 父节点ID
     */
    private Long superId;
    /**
     * 节点层级
     */
    private Integer nodeLevel;
    /**
     * 节点路径
     */
    private String nodePath;
    /**
     * 门户标识
     */
    private String portalKey;
    /**
     * 叶子节点
     */
    private Integer isLeaf;
    /**
     * 上级名称
     */
    private String superName;
    /**
     * 节点路径名称
     */
    private String nodePathName;
    /**
     * 机构编号
     */
    private String idcard;
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
    private Integer dversion;
    /**
     * 是否删除
     */
    private Integer isDel;
    /**
     * 排序
     */
    private Integer dataOrder;

    public Long getSeqId(){
        return this.seqId;
    }

    public void setSeqId(Long seqId){
        this.seqId = seqId;
    }
    public String getName(){
        return this.name;
    }

    public void setName(String name){
        this.name = name;
    }
    public String getDescr(){
        return this.descr;
    }

    public void setDescr(String descr){
        this.descr = descr;
    }
    public Long getSuperId(){
        return this.superId;
    }

    public void setSuperId(Long superId){
        this.superId = superId;
    }
    public Integer getNodeLevel(){
        return this.nodeLevel;
    }

    public void setNodeLevel(Integer nodeLevel){
        this.nodeLevel = nodeLevel;
    }
    public String getNodePath(){
        return this.nodePath;
    }

    public void setNodePath(String nodePath){
        this.nodePath = nodePath;
    }
    public String getPortalKey(){
        return this.portalKey;
    }

    public void setPortalKey(String portalKey){
        this.portalKey = portalKey;
    }
    public Integer getIsLeaf(){
        return this.isLeaf;
    }

    public void setIsLeaf(Integer isLeaf){
        this.isLeaf = isLeaf;
    }
    public String getSuperName(){
        return this.superName;
    }

    public void setSuperName(String superName){
        this.superName = superName;
    }
    public String getNodePathName(){
        return this.nodePathName;
    }

    public void setNodePathName(String nodePathName){
        this.nodePathName = nodePathName;
    }
    public String getIdcard(){
        return this.idcard;
    }

    public void setIdcard(String idcard){
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
    public Integer getDversion(){
        return this.dversion;
    }

    public void setDversion(Integer dversion){
        this.dversion = dversion;
    }
    public Integer getIsDel(){
        return this.isDel;
    }

    public void setIsDel(Integer isDel){
        this.isDel = isDel;
    }
    public Integer getDataOrder(){
        return this.dataOrder;
    }

    public void setDataOrder(Integer dataOrder){
        this.dataOrder = dataOrder;
    }
    
}
