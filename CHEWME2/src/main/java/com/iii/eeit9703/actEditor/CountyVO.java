package com.iii.eeit9703.actEditor;

public class CountyVO implements java.io.Serializable{

	private Integer countyID;		//區域代碼(EX.100)
	private String countyName;		//區鄉鎮(EX.中正區)
	private String countryName;		//市(EX.台北市)
	private String countryID;		//市縮寫(EX.TPE)
	public Integer getCountyID() {
		return countyID;
	}
	public void setCountyID(Integer countyID) {
		this.countyID = countyID;
	}
	public String getCountyName() {
		return countyName;
	}
	public void setCountyName(String countyName) {
		this.countyName = countyName;
	}
	public String getCountryName() {
		return countryName;
	}
	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}
	public String getCountryID() {
		return countryID;
	}
	public void setCountryID(String countryID) {
		this.countryID = countryID;
	}
	
	
}
