package com.iii.eeit9703.member.model;

import java.io.InputStream;
import java.sql.*;
import java.util.HashSet;
import java.util.Set;

import com.iii.eeit9703.collection.CollectionVO;

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
	private InputStream memPhoto;
	private String memStatus;
	private String memRole;
	private Set<CollectionVO> Collects = new HashSet<CollectionVO>();
//	public MemVO(String memberId2, String memName2, String memNickN2, String memPwd2, Date memBirthday2,
//			String memMail2, String memAddr2, String memPhone2, String memIntr2) {
//		super();
//		this.memberId=memberId2;
//		this.memName=memName2;
//		this.memNickN=memNickN2;
//		this.memPwd=memPwd2;
//		this.memBirthday=memBirthday2;
//		this.memMail=memMail2;
//		this.memAddr=memAddr2;
//		this.memPhone=memPhone2;
//		this.memIntr=memIntr2;
//	}
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

	public InputStream getMemPhoto() {
		return memPhoto;
	}
	public void setMemPhoto(InputStream memPhoto) {
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
	public Set<CollectionVO> getCollects() {
		return Collects;
	}
	public void setCollects(Set<CollectionVO> collects) {
		Collects = collects;
	}



	
}
