package com.iii.eeit9703.member.model;


import java.util.HashSet;
import java.util.Set;

import com.iii.eeit9703.activity.model.ActivityVO;
import com.iii.eeit9703.collection.CollectionVO;
import com.iii.eeit9703.report.ReportVO;

public class MemVO implements java.io.Serializable{
	private Integer memId;
	private String memberId;
	private String memName;
	private String memNickN;
	private String memPwd;
	private java.sql.Date memBirthday;
	private String memMail;
	private String memAddr;
	private String memPhone;
	private String memIntr;
	private String memPhoto;
	private String memStatus;
	private String memRole;
	private String googleId;
	private Set<ActivityVO> Activitys = new HashSet<ActivityVO>();
	private Set<CollectionVO> Collects = new HashSet<CollectionVO>();
	private Set<ReportVO> Reports = new HashSet<ReportVO>();
	private Integer clubId;

	
	public Integer getMemId() {
		return memId;
	}
	public void setMemId(Integer memId) {
		this.memId = memId;
	}
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getMemNickN() {
		return memNickN;
	}
	public void setMemNickN(String memNickN) {
		this.memNickN = memNickN;
	}
	public String getMemPwd() {
		return memPwd;
	}
	public void setMemPwd(String memPwd) {
		this.memPwd = memPwd;
	}
	public java.sql.Date getMemBirthday() {
		return memBirthday;
	}
	public void setMemBirthday(java.sql.Date memBirthday) {
		this.memBirthday = memBirthday;
	}
	public String getMemMail() {
		return memMail;
	}
	public void setMemMail(String memMail) {
		this.memMail = memMail;
	}
	public String getMemAddr() {
		return memAddr;
	}
	public void setMemAddr(String memAddr) {
		this.memAddr = memAddr;
	}
	public String getMemPhone() {
		return memPhone;
	}
	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}
	public String getMemIntr() {
		return memIntr;
	}
	public void setMemIntr(String memIntr) {
		this.memIntr = memIntr;
	}

	public String getMemPhoto() {
		return memPhoto;
	}
	public void setMemPhoto(String memPhoto) {
		this.memPhoto = memPhoto;
	}
	public String getMemStatus() {
		return memStatus;
	}
	public void setMemStatus(String memStatus) {
		this.memStatus = memStatus;
	}
	public String getMemRole() {
		return memRole;
	}
	public void setMemRole(String memRole) {
		this.memRole = memRole;
	}
	public Set<ActivityVO> getActivitys() {
		return Activitys;
	}
	public void setActivitys(Set<ActivityVO> activitys) {
		Activitys = activitys;
	}
	public Set<CollectionVO> getCollects() {
		return Collects;
	}
	public void setCollects(Set<CollectionVO> collects) {
		Collects = collects;
	}
	public Set<ReportVO> getReports() {
		return Reports;
	}
	public void setReports(Set<ReportVO> reports) {
		Reports = reports;
	}
	public Integer getClubId() {
		return clubId;
	}
	public void setClubId(Integer clubId) {
		this.clubId = clubId;
	}
	public String getGoogleId() {
		return googleId;
	}
	public void setGoogleId(String googleId) {
		this.googleId = googleId;
	}	
}
