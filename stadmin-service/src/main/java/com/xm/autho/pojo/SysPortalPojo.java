package com.xm.autho.pojo;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.xm.autho.common.constants.R;

@Entity
@Table(name=R.SysConfig.SYS_TABLE_PREFIX+"portal")
//@DynamicUpdate
//@DynamicInsert
//@org.hibernate.annotations.Entity(dynamicInsert=true,dynamicUpdate=true)
public class SysPortalPojo implements Serializable{
    
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
     * 登录界面logo
     */
    private java.lang.String loginLogo;
    /**
     * 登录页背景
     */
    private java.lang.String loginBg;
    /**
     * 首页LOGO
     */
    private java.lang.String indexLogo;
    /**
     * 建设单位
     */
    private java.lang.String developUnit;
    /**
     * 业主单位
     */
    private java.lang.String ownerUnit;
    /**
     * 登录需验证码
     */
    private java.lang.Integer useCaptcha;
    /**
     * CSS样式
     */
    private java.lang.String cssTheme;
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
    public java.lang.String getLoginLogo(){
        return this.loginLogo;
    }
    
    public void setLoginLogo(java.lang.String loginLogo){
        this.loginLogo = loginLogo;
    }
    public java.lang.String getLoginBg(){
        return this.loginBg;
    }
    
    public void setLoginBg(java.lang.String loginBg){
        this.loginBg = loginBg;
    }
    public java.lang.String getIndexLogo(){
        return this.indexLogo;
    }
    
    public void setIndexLogo(java.lang.String indexLogo){
        this.indexLogo = indexLogo;
    }
    public java.lang.String getDevelopUnit(){
        return this.developUnit;
    }
    
    public void setDevelopUnit(java.lang.String developUnit){
        this.developUnit = developUnit;
    }
    public java.lang.String getOwnerUnit(){
        return this.ownerUnit;
    }
    
    public void setOwnerUnit(java.lang.String ownerUnit){
        this.ownerUnit = ownerUnit;
    }
    public java.lang.Integer getUseCaptcha(){
        return this.useCaptcha;
    }
    
    public void setUseCaptcha(java.lang.Integer useCaptcha){
        this.useCaptcha = useCaptcha;
    }
    public java.lang.String getCssTheme(){
        return this.cssTheme;
    }
    
    public void setCssTheme(java.lang.String cssTheme){
        this.cssTheme = cssTheme;
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
