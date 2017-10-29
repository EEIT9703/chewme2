package com.iii.eeit9703.crawler.model;

public class ArticleVO implements java.io.Serializable{
	private Integer articleID;
	private Integer memId;
	private Integer attractionID;
	private String contents;
	public Integer getArticleID() {
		return articleID;
	}
	public void setArticleID(Integer articleID) {
		this.articleID = articleID;
	}
	public Integer getMemId() {
		return memId;
	}
	public void setMemId(Integer memId) {
		this.memId = memId;
	}
	public Integer getAttractionID() {
		return attractionID;
	}
	public void setAttractionID(Integer attractionID) {
		this.attractionID = attractionID;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	
}
