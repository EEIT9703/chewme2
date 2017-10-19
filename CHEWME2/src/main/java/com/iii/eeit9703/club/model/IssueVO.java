package com.iii.eeit9703.club.model;

import java.sql.Blob;
import java.util.List;

public class IssueVO {
	private Integer issueId;
	private Integer clubId;
	private String issueContent;
	private Integer proposerId;
	private Blob issuepic;
	private List<CommentVO> comments;
	public Integer getIssueId() {
		return issueId;
	}
	public void setIssueId(Integer issueId) {
		this.issueId = issueId;
	}
	public Integer getClubId() {
		return clubId;
	}
	public void setClubId(Integer clubId) {
		this.clubId = clubId;
	}
	public String getIssueContent() {
		return issueContent;
	}
	public void setIssueContent(String issueContent) {
		this.issueContent = issueContent;
	}
	public Integer getProposerId() {
		return proposerId;
	}
	public void setProposerId(Integer proposerId) {
		this.proposerId = proposerId;
	}
	public Blob getIssuepic() {
		return issuepic;
	}
	public void setIssuepic(Blob issuepic) {
		this.issuepic = issuepic;
	}
	public List<CommentVO> getComments() {
		return comments;
	}
	public void setComments(List<CommentVO> comments) {
		this.comments = comments;
	}
}
