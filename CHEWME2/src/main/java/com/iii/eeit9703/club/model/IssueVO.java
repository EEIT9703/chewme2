package com.iii.eeit9703.club.model;

import java.sql.Blob;
import java.util.HashSet;
import java.util.Set;

public class IssueVO implements java.io.Serializable{
	private Integer issueId;
	private Integer clubId;
	private String issueTitle;
	private String issueContent;
	private Integer proposerId;
	private Blob issuepic;
//	private List<CommentVO> comments = new ArrayList<CommentVO>();
	private Set<CommentVO> comments = new HashSet<CommentVO>();
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
	public String getIssueTitle() {
		return issueTitle;
	}
	public void setIssueTitle(String issueTitle) {
		this.issueTitle = issueTitle;
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
/*	public List<CommentVO> getComments() {
		return comments;
	}
	public void setComments(List<CommentVO> comments) {
		this.comments = comments;
	}*/
	public Set<CommentVO> getComments() {
		return comments;
	}
	public void setComments(Set<CommentVO> comments) {
		this.comments = comments;
	}
	

}
