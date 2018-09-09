package com.xm.stadmin.pojo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
@Entity
@javax.persistence.Table(name="stm_goods_classify")
public class StmGoodsClassifyPojo implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	private  Long     seqId;
    private  String   name;
    private  Integer  dataOrder;
    private  Integer  isDel;
    private  Date     createTime;
    private  Date     updateTime;
	public Long getSeqId() {
		return seqId;
	}
	public void setSeqId(Long seqId) {
		this.seqId = seqId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getDataOrder() {
		return dataOrder;
	}
	public void setDataOrder(Integer dataOrder) {
		this.dataOrder = dataOrder;
	}
	public Integer getIsDel() {
		return isDel;
	}
	public void setIsDel(Integer isDel) {
		this.isDel = isDel;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
    
}
