package com.iii.eeit9703.club.model;

public class QuestionVO implements java.io.Serializable{
	private Integer questionId;
	private Integer clubId;
	private String qTitle;
	private String qcontent;
	private int askerId;
	private boolean readed;
	
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
	public String getQTitle() {
		return qTitle;
	}
	public void setQTitle(String qTitle) {
		this.qTitle = qTitle;
	}
	public String getQcontent() {
		return qcontent;
	}
	public void setQcontent(String qContent) {
		this.qcontent = qContent;
	}
	public int getAskerId() {
		return askerId;
	}
	public void setAskerId(int askerId) {
		this.askerId = askerId;
	}
	public boolean getReaded() {
		return readed;
	}
	public void setReaded(boolean readed) {
		this.readed = readed;
	}
}
