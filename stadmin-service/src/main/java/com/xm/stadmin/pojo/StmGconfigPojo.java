package com.xm.stadmin.pojo;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * stm_gconfig
 * 
 */
@Entity
@Table(name="stm_gconfig")
//@DynamicUpdate
//@DynamicInsert
//@org.hibernate.annotations.Entity(dynamicInsert=true,dynamicUpdate=true)
public class StmGconfigPojo implements Serializable{
    
    private static final long serialVersionUID = 1L;

    /**
     * 
     */
    @Id @GeneratedValue(strategy=GenerationType.AUTO)
    private Integer seqId;
    /**
     *
     */
    private java.util.Date updateTime;
    /**
     *
     */
    private java.util.Date createTime;
    /**
     *
     */
    private Integer isDel;
    /**
     *
     */
    private String groupName;
    /**
     *
     */
    private String configName;
    /**
     *
     */
    private String configVal;
    /**
     *
     */
    private String configMemo;

    public Integer getSeqId(){
        return this.seqId;
    }

    public void setSeqId(Integer seqId){
        this.seqId = seqId;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getIsDel(){
        return this.isDel;
    }

    public void setIsDel(Integer isDel){
        this.isDel = isDel;
    }
    public String getGroupName(){
        return this.groupName;
    }

    public void setGroupName(String groupName){
        this.groupName = groupName;
    }
    public String getConfigName(){
        return this.configName;
    }

    public void setConfigName(String configName){
        this.configName = configName;
    }
    public String getConfigVal(){
        return this.configVal;
    }

    public void setConfigVal(String configVal){
        this.configVal = configVal;
    }
    public String getConfigMemo(){
        return this.configMemo;
    }

    public void setConfigMemo(String configMemo){
        this.configMemo = configMemo;
    }

    @Override
    public String toString() {
        return "StmGconfigPojo{" +
                "seqId=" + seqId +
                ", isDel=" + isDel +
                ", groupName='" + groupName + '\'' +
                ", configName='" + configName + '\'' +
                ", configVal='" + configVal + '\'' +
                ", configMemo='" + configMemo + '\'' +
                '}';
    }
}
