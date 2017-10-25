package com.iii.eeit9703.member.model;

import java.io.InputStream;
import java.sql.*;
import java.util.HashSet;
import java.util.Set;

import com.iii.eeit9703.collection.CollectionVO;

public class MemVO implements java.io.Serializable{
	private Integer mId;
	private String memberId;
	private String mName;
	private String mNickN;
	private String mPwd;
	private java.sql.Date mBirthday;
	private String mMail;
	private String mAddr;
	private String mPhone;
	private String mIntr;
	private String mFileName;
	private InputStream mPhoto;
	private String mStatus;
	private String mRole;
	private Set<CollectionVO> Collects = new HashSet<CollectionVO>();
	
	
	public Set<CollectionVO> getCollects() {
		return Collects;
	}
	public void setCollects(Set<CollectionVO> collects) {
		Collects = collects;
	}
	public Integer getmId() {
		return mId;
	}
	public void setmId(Integer mId) {
		this.mId = mId;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getmNickN() {
		return mNickN;
	}
	public void setmNickN(String mNickN) {
		this.mNickN = mNickN;
	}
	public String getmPwd() {
		return mPwd;
	}
	public void setmPwd(String mPwd) {
		this.mPwd = mPwd;
	}
	public java.sql.Date getmBirthday() {
		return mBirthday;
	}
	public void setmBirthday(java.sql.Date mBirthday) {
		this.mBirthday = mBirthday;
	}
	public String getmMail() {
		return mMail;
	}
	public void setmMail(String mMail) {
		this.mMail = mMail;
	}
	public String getmAddr() {
		return mAddr;
	}
	public void setmAddr(String mAddr) {
		this.mAddr = mAddr;
	}
	public String getmPhone() {
		return mPhone;
	}
	public void setmPhone(String mPhone) {
		this.mPhone = mPhone;
	}
	public String getmIntr() {
		return mIntr;
	}
	public void setmIntr(String mIntr) {
		this.mIntr = mIntr;
	}
	public String getmFileName() {
		return mFileName;
	}
	public void setmFileName(String mFileName) {
		this.mFileName = mFileName;
	}
	public InputStream getmPhoto() {
		return mPhoto;
	}
	public void setmPhoto(InputStream mPhoto) {
		this.mPhoto = mPhoto;
	}
	public String getmStatus() {
		return mStatus;
	}
	public void setmStatus(String mStatus) {
		this.mStatus = mStatus;
	}
	public String getmRole() {
		return mRole;
	}
	public void setmRole(String mRole) {
		this.mRole = mRole;
	}
	public MemVO(String memberId,String mName,String mNickN,String mPwd,java.sql.Date mBirthday,String mMail,String mAddr,String mPhone,String mIntr){
		super();
		this.setMemberId(memberId);
		this.setmName(mName);
		this.setmNickN(mNickN);
		this.setmPwd(mPwd);
		this.setmBirthday(mBirthday);
		this.setmMail(mMail);
		this.setmAddr(mAddr);
		this.setmPhone(mPhone);
		this.setmIntr(mIntr);
	}
	public MemVO() {
		
	}

	
}
