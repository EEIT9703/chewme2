package com.iii.eeit9703.bridge.model;

import java.util.Date;

import com.iii.eeit9703.club.model.ClubVO;
import com.iii.eeit9703.member.model.MemVO;

public class ClubMemRelationVO implements java.io.Serializable {
	private Integer clubId;
	private Integer memId;
	private Date date;
	private ClubVO clubVO;
	private MemVO memVO;
	
	public MemVO getMemVO() {
		return memVO;
	}
	public void setMemVO(MemVO memVO) {
		this.memVO = memVO;
	}
	public Integer getClubId() {
		return clubId;
	}
	public void setClubId(Integer clubId) {
		this.clubId = clubId;
	}
	public ClubVO getClubVO() {
		return clubVO;
	}
	public void setClubVO(ClubVO clubVO) {
		this.clubVO = clubVO;
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
