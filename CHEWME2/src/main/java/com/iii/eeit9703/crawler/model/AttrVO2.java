package com.iii.eeit9703.crawler.model;
import java.io.InputStream;
public class AttrVO2 implements java.io.Serializable{

	private Integer attractionID;
	private String name;
	private String county;
	private String type;
	private String address;
	private String tel;
	private String intro;
	private InputStream image;
	
	public Integer getAttractionID() {
		return attractionID;
	}
	public void setAttractionID(Integer attractionID) {
		this.attractionID = attractionID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCounty() {
		return county;
	}
	public void setCounty(String county) {
		this.county = county;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public InputStream getImage() {
		return image;
	}
	public void setImage(InputStream image) {
		this.image = image;
	}
	
}
