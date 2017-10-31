package com.iii.eeit9703.bridge.model;

import java.util.Date;

public class ClubMemRelationVO implements java.io.Serializable {
	private Integer clubId;
	private Integer memId;
	private Date date;
	public Integer getClubId() {
		return clubId;
	}
	public void setClubId(Integer clubId) {
		this.clubId = clubId;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Integer getMemId() {
		return memId;
	}
	public void setMemId(Integer memId) {
		this.memId = memId;
	}
	
}
