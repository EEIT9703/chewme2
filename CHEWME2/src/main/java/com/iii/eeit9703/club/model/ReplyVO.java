package com.iii.eeit9703.club.model;

import java.sql.Date;

public class ReplyVO {
	private Integer reqlyId;
	private Integer qId;
	private String content;
	private Integer replyerId;
	private Date replyDate;
	private boolean read;
	public Integer getReqlyId() {
		return reqlyId;
	}
	public void setReqlyId(Integer reqlyId) {
		this.reqlyId = reqlyId;
	}
	public Integer getqId() {
		return qId;
	}
	public void setqId(Integer qId) {
		this.qId = qId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getReplyerId() {
		return replyerId;
	}
	public void setReplyerId(Integer replyerId) {
		this.replyerId = replyerId;
	}
	public Date getReplyDate() {
		return replyDate;
	}
	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}
	public boolean isRead() {
		return read;
	}
	public void setRead(boolean read) {
		this.read = read;
	}

}
