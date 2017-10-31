package com.iii.eeit9703.actEditor.model;

public class CountryVO implements java.io.Serializable{

	private Integer queue;		//縣市序號(EX.2)
	private String countryID;	//縣市縮寫代號(EX.TPE)
	private String countryName;	//縣市名稱(EX.臺北市)
	
	public Integer getQueue() {
		return queue;
	}
	public void setQueue(Integer queue) {
		this.queue = queue;
	}
	public String getCountryID() {
		return countryID;
	}
	public void setCountryID(String countryID) {
		this.countryID = countryID;
	}
	public String getCountryName() {
		return countryName;
	}
	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}
	
	
}
