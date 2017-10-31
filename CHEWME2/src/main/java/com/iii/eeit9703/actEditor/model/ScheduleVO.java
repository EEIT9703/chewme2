package com.iii.eeit9703.actEditor.model;

public class ScheduleVO implements java.io.Serializable{

	private Integer scheduleID;		//行程點名稱流水號
	private Integer actID;		//行程名稱ID
	private Integer attractionID;		//景點名稱ID
	private Integer dayNo;		//第__天行程點
	private String period;	//時段(EX.09:00)
	private String remark;	//備註
	
	public Integer getScheduleID() {
		return scheduleID;
	}
	public void setScheduleID(Integer scheduleID) {
		this.scheduleID = scheduleID;
	}
	public Integer getActID() {
		return actID;
	}
	public void setActID(Integer actID) {
		this.actID = actID;
	}
	public Integer getAttractionID() {
		return attractionID;
	}
	public void setAttractionID(Integer attractionID) {
		this.attractionID = attractionID;
	}
	public Integer getDayNo() {
		return dayNo;
	}
	public void setDayNo(Integer dayNo) {
		this.dayNo = dayNo;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
	
	
}
