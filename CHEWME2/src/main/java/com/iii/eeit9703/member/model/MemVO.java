package com.iii.eeit9703.member.model;

import java.io.InputStream;
import java.sql.*;

public class MemVO implements java.io.Serializable{
	private Integer memId;
	private String memAccount;
	private String memName;
	private String memNickN;
	private String memPwd;
	private java.sql.Date memBirthday;
	private String memMail;
	private String memAddr;
	private String memPhone;
	private String memIntr;
	private String memFileName;
	private InputStream memPhoto;
	private String memStatus;
	private String memRole;
	public Integer getMemId() {
		return memId;
	}
	public void setMemId(Integer memId) {
		this.memId = memId;
	}
	public String getMemAccount() {
		return memAccount;
	}
	public void setMemAccount(String memAccount) {
		this.memAccount = memAccount;
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
	public String getMemFileName() {
		return memFileName;
	}
	public void setMemFileName(String memFileName) {
		this.memFileName = memFileName;
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


	
}
