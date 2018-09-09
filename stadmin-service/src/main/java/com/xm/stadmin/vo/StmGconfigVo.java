package com.xm.stadmin.vo;

import javax.persistence.*;
import java.io.Serializable;

/**
 *
 */

public class StmGconfigVo implements Serializable{
    
    private static final long serialVersionUID = 1L;

    /**
     * 
     */
    @Id @GeneratedValue(strategy=GenerationType.AUTO)
    private Integer seqId;
    /**
     *
     */
    private java.util.Date updatedAt;
    /**
     *
     */
    private java.util.Date createdAt;
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
    public java.util.Date getUpdatedAt(){
        return this.updatedAt;
    }

    public void setUpdatedAt(java.util.Date updatedAt){
        this.updatedAt = updatedAt;
    }
    public java.util.Date getCreatedAt(){
        return this.createdAt;
    }

    public void setCreatedAt(java.util.Date createdAt){
        this.createdAt = createdAt;
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
		return "StmGconfigPojo [seqId=" + seqId + ", updatedAt=" + updatedAt + ", createdAt=" + createdAt + ", isDel="
				+ isDel + ", groupName=" + groupName + ", configName=" + configName + ", configVal=" + configVal
				+ ", configMemo=" + configMemo + "]";
	}
    
}
