package com.iii.eeit9703.crawler.model;

import java.sql.Blob;

public class AttrVO implements java.io.Serializable{
    //商家、景點、住宿共用欄位
	private Integer attractionID;   //商家編號
	private String name;            //商家名稱
	private String county;          //所在地區
	private String type;            //類型
	private String address;         //地址
	private String tel;             //電話
	private String intro;           //商家簡介
	private java.sql.Blob image;    //相關圖片
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
	public Blob getImage() {
		return image;
	}
	public void setImage(Blob image) {
		this.image = image;
	}
}