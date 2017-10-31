package com.iii.eeit9703.bridge.model;

public class MemActRelationVO implements java.io.Serializable {
	private Integer memId;
	private Integer actId;
	private java.sql.Date date;
	public Integer getMemId() {
		return memId;
	}
	public void setMemId(Integer memId) {
		this.memId = memId;
	}
	public Integer getActId() {
		return actId;
	}
	public void setActId(Integer actId) {
		this.actId = actId;
	}
	public java.sql.Date getDate() {
		return date;
	}
	public void setDate(java.sql.Date date) {
		this.date = date;
	}
}
