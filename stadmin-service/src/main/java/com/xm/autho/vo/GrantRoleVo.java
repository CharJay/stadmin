package com.xm.autho.vo;

import java.io.Serializable;

public class GrantRoleVo implements Serializable {
	
	private static final long serialVersionUID = 1L;

	private java.lang.Long roleId;
	private java.lang.String name;
	private Integer isGrant;
	public java.lang.Long getRoleId() {
		return roleId;
	}
	public void setRoleId(java.lang.Long roleId) {
		this.roleId = roleId;
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
