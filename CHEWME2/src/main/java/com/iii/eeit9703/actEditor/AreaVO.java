package com.iii.eeit9703.actEditor;

public class AreaVO implements java.io.Serializable{

	private Integer contyID;		//區域代碼(EX.100)
	private String conty;		//區鄉鎮(EX.中正區)
	private String county;		//市(EX.台北市)
	private String countyID;		//市縮寫(EX.TPE)
	
	public Integer getContyID() {
		return contyID;
	}
	public void setContyID(Integer contyID) {
		this.contyID = contyID;
	}

	public String getConty() {
		return conty;
	}
	public void setConty(String conty) {
		this.conty = conty;
	}

	public String getCounty() {
		return county;
	}
	public void setCounty(String county) {
		this.county = county;
	}

	public String getCountyID() {
		return countyID;
	}
	public void setCountyID(String countyID) {
		this.countyID = countyID;
	}
	
	

}
