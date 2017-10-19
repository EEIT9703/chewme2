package com.iii.eeit9703.club.model;

public class QuestionVO {
	private Integer questionId;
	private Integer clubId;
	private String qTitle;
	private String qcontent;
	private int askerId;
	private boolean read;
	public Integer getQuestionId() {
		return questionId;
	}
	public void setQuestionId(Integer questionId) {
		this.questionId = questionId;
	}
	public Integer getClubId() {
		return clubId;
	}
	public void setClubId(Integer clubId) {
		this.clubId = clubId;
	}
	public String getqTitle() {
		return qTitle;
	}
	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}
	public String getQcontent() {
		return qcontent;
	}
	public void setQcontent(String qcontent) {
		this.qcontent = qcontent;
	}
	public int getAskerId() {
		return askerId;
	}
	public void setAskerId(int askerId) {
		this.askerId = askerId;
	}
	public boolean isRead() {
		return read;
	}
	public void setRead(boolean read) {
		this.read = read;
	}
}
