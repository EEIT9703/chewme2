package com.iii.eeit9703.crawler.model;

public class ArticleVO implements java.io.Serializable{
	private Integer articleID;
	private Integer mId;
	private String attractionID;
	private String contents;
	public Integer getArticleID() {
		return articleID;
	}
	public void setArticleID(Integer articleID) {
		this.articleID = articleID;
	}
	public Integer getmId() {
		return mId;
	}
	public void setmId(Integer mId) {
		this.mId = mId;
	}
	public String getAttractionID() {
		return attractionID;
	}
	public void setAttractionID(String attractionID) {
		this.attractionID = attractionID;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	
}
