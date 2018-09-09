package com.xm.stadmin.vo;

import java.io.Serializable;

public class StmGoodsVo implements Serializable{
    
    private static final long serialVersionUID = 1L;

    private java.lang.Long seqId;
    /**
     * 
     */
    private java.util.Date activeDate;
    /**
     * 
     */
    private java.util.Date updateTime;
    /**
     * 
     */
    private java.lang.String name;
    /**
     * 
     */
    private java.lang.String intro;
    /**
     * 
     */
    private java.lang.String imgUrl;
    /**
     * 规格
     */
  //  private java.lang.String spe;
    /**
     * 产地
     */
  //  private java.lang.String place;
    /**
     * 单价 分
     */
    private java.lang.Long price;
    /**
     * 快递费 分
     */
    private java.lang.Long priceExpress;
    /**
     * 成本价
     */
    private java.lang.Long priceCost;
    /**
     * 抵扣金额
     */
    private java.lang.Long priceDis;
    /**
     * 满减金额
     */
    private java.lang.Long priceCut;
    /**
     * 详细
     */
    private java.lang.String detail;
    /**
     * 库存
     */
    private java.lang.Long num;
    /**
     * 1上架 2已下架
     */
    private java.lang.Integer status;
    /**
     * 是否可升级 1是 0否
     */
    private java.lang.Integer isUpgrade;
    /**
     * 是否可赠送（正价无法配置送礼）
     */
    private java.lang.Integer isGift;
    /**
     * 商品分类
     */
    private java.lang.Integer classifyId;
    /**
     * 1 普通商品  11优惠券 
     */
    private java.lang.Integer goodsType;
    /**
     * 支付类型 1人民币 3纯积分
     */
    private java.lang.Integer payType;
    /**
     * 升级的商品id
     */
    private java.lang.Long upGoodsId;
    /**
     * 
     */
    private java.util.Date createTime;
    /**
     * 
     */
    private java.lang.Long createUserId;
    /**
     * 正向排序
     */
    private java.lang.Integer dataOrder;
    
    private Integer isDel = 0;
    
    public Integer getIsDel() {
		return isDel;
	}

	public void setIsDel(Integer isDel) {
		this.isDel = isDel;
	}

	public java.lang.Long getSeqId(){
        return this.seqId;
    }
    
    public void setSeqId(java.lang.Long seqId){
        this.seqId = seqId;
    }
    public java.util.Date getActiveDate(){
        return this.activeDate;
    }
    
    public void setActiveDate(java.util.Date activeDate){
        this.activeDate = activeDate;
    }
    public java.util.Date getUpdateTime(){
        return this.updateTime;
    }
    
    public void setUpdateTime(java.util.Date updateTime){
        this.updateTime = updateTime;
    }
    public java.lang.String getName(){
        return this.name;
    }
    
    public void setName(java.lang.String name){
        this.name = name;
    }
    public java.lang.String getIntro(){
        return this.intro;
    }
    
    public void setIntro(java.lang.String intro){
        this.intro = intro;
    }
    public java.lang.String getImgUrl(){
        return this.imgUrl;
    }
    
    public void setImgUrl(java.lang.String imgUrl){
        this.imgUrl = imgUrl;
    }
    public java.lang.Long getPrice(){
        return this.price;
    }
    
    public void setPrice(java.lang.Long price){
        this.price = price;
    }
    public java.lang.Long getPriceExpress(){
        return this.priceExpress;
    }
    
    public void setPriceExpress(java.lang.Long priceExpress){
        this.priceExpress = priceExpress;
    }
    public java.lang.Long getPriceCost(){
        return this.priceCost;
    }
    
    public void setPriceCost(java.lang.Long priceCost){
        this.priceCost = priceCost;
    }
    public java.lang.Long getPriceDis(){
        return this.priceDis;
    }
    
    public void setPriceDis(java.lang.Long priceDis){
        this.priceDis = priceDis;
    }
    public java.lang.Long getPriceCut(){
        return this.priceCut;
    }
    
    public void setPriceCut(java.lang.Long priceCut){
        this.priceCut = priceCut;
    }
    public java.lang.String getDetail(){
        return this.detail;
    }
    
    public void setDetail(java.lang.String detail){
        this.detail = detail;
    }
    public java.lang.Long getNum(){
        return this.num;
    }
    
    public void setNum(java.lang.Long num){
        this.num = num;
    }
    public java.lang.Integer getStatus(){
        return this.status;
    }
    
    public void setStatus(java.lang.Integer status){
        this.status = status;
    }
    public java.lang.Integer getIsUpgrade(){
        return this.isUpgrade;
    }
    
    public void setIsUpgrade(java.lang.Integer isUpgrade){
        this.isUpgrade = isUpgrade;
    }
    public java.lang.Integer getIsGift(){
        return this.isGift;
    }
    
    public void setIsGift(java.lang.Integer isGift){
        this.isGift = isGift;
    }
    public java.lang.Integer getGoodsType(){
        return this.goodsType;
    }
    
    public void setGoodsType(java.lang.Integer goodsType){
        this.goodsType = goodsType;
    }
    public java.lang.Integer getPayType(){
        return this.payType;
    }
    
    public void setPayType(java.lang.Integer payType){
        this.payType = payType;
    }
    public java.lang.Long getUpGoodsId(){
        return this.upGoodsId;
    }
    
    public void setUpGoodsId(java.lang.Long upGoodsId){
        this.upGoodsId = upGoodsId;
    }
    public java.util.Date getCreateTime(){
        return this.createTime;
    }
    
    public void setCreateTime(java.util.Date createTime){
        this.createTime = createTime;
    }
    public java.lang.Long getCreateUserId(){
        return this.createUserId;
    }
    
    public void setCreateUserId(java.lang.Long createUserId){
        this.createUserId = createUserId;
    }
    public java.lang.Integer getDataOrder(){
        return this.dataOrder;
    }
    
    public void setDataOrder(java.lang.Integer dataOrder){
        this.dataOrder = dataOrder;
    }

	public java.lang.Integer getClassifyId() {
		return classifyId;
	}

	public void setClassifyId(java.lang.Integer classifyId) {
		this.classifyId = classifyId;
	}
    
    
}
