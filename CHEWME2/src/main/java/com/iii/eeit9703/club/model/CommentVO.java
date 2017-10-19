package com.iii.eeit9703.club.model;

public class CommentVO {
	private Integer commentId;
	private Integer issueId;
	private String content;
	private Integer commenterId;
	private java.sql.Date commentDate;
	public Integer getCommentId() {
		return commentId;
	}
	public void setCommentId(Integer commentId) {
		this.commentId = commentId;
	}
	public Integer getIssueId() {
		return issueId;
	}
	public void setIssueId(Integer issueId) {
		this.issueId = issueId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getCommenterId() {
		return commenterId;
	}
	public void setCommenterId(Integer commenterId) {
		this.commenterId = commenterId;
	}
	public java.sql.Date getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(java.sql.Date commentDate) {
		this.commentDate = commentDate;
	}
}
