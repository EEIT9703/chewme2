package com.iii.eeit9703.club.model;

import java.util.HashSet;
import java.util.Set;

import com.iii.eeit9703.bridge.model.ClubMemRelationVO;

public class ClubVO implements java.io.Serializable{
	private Integer clubId;
	private String clubName;
	private Integer managerId;
	private Integer locationId;
	private String brief;
	private String refURL;
	private Integer vistors;
	private Integer vistorsInMonth;
	private String addr;
	private String clubPic;
	private Set<ClubMemRelationVO> clubMemRelation = new HashSet<ClubMemRelationVO>();
	public Set<ClubMemRelationVO> getClubMemRelation() {
		return clubMemRelation;
	}
	public void setClubMemRelation(Set<ClubMemRelationVO> clubMemRelation) {
		this.clubMemRelation = clubMemRelation;
	}
	public ClubVO(){
		clubName = null;
		managerId = null;
		locationId = null;
		brief = null;
		refURL = null;
		vistors = null;
		vistorsInMonth = null;
		addr = null;
		clubPic = null;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public Integer getClubId() {
		return clubId;
	}
	public void setClubId(Integer clubId) {
		this.clubId = clubId;
	}
	public String getClubName() {
		return clubName;
	}
	public void setClubName(String clubName) {
		this.clubName = clubName;
	}
	public Integer getManagerId() {
		return managerId;
	}
	public void setManagerId(Integer managerId) {
		this.managerId = managerId;
	}
	public Integer getLocationId() {
		return locationId;
	}
	public void setLocationId(Integer locationId) {
		this.locationId = locationId;
	}
	public String getBrief() {
		return brief;
	}
	public void setBrief(String brief) {
		this.brief = brief;
	}
	public String getRefURL() {
		return refURL;
	}
	public void setRefURL(String refURL) {
		this.refURL = refURL;
	}
	public String getClubPic() {
		return clubPic;
	}
	public void setClubPic(String clubPic) {
		this.clubPic = clubPic;
	}
	public Integer getVistors() {
		return vistors;
	}
	public void setVistors(Integer vistors) {
		this.vistors = vistors;
	}
	public Integer getVistorsInMonth() {
		return vistorsInMonth;
	}
	public void setVistorsInMonth(Integer vistorsInMonth) {
		this.vistorsInMonth = vistorsInMonth;
	}
	

}
