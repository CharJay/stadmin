package com.xm.autho.vo;

import java.io.Serializable;

public class GrantAuthoVo implements Serializable {

	private static final long serialVersionUID = 1L;

	private java.lang.Long authoId;
	private java.lang.Long superId;
	private java.lang.String name;
	private java.lang.String enName;
	private Integer isGrant;
	private Integer type;

	public String getEnName() {
		return enName;
	}

	public void setEnName(String enName) {
		this.enName = enName;
	}

	public Long getSuperId() {
		return superId;
	}

	public void setSuperId(Long superId) {
		this.superId = superId;
	}

	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public java.lang.Long getAuthoId() {
		return authoId;
	}
	public void setAuthoId(java.lang.Long authoId) {
		this.authoId = authoId;
	}
	public java.lang.String getName() {
		return name;
	}
	public void setName(java.lang.String name) {
		this.name = name;
	}
	public Integer getIsGrant() {
		return isGrant;
	}
	public void setIsGrant(Integer isGrant) {
		this.isGrant = isGrant;
	}

}

