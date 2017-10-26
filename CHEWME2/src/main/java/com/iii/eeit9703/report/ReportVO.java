package com.iii.eeit9703.report;

import java.io.Serializable;
import java.sql.Date;

import com.iii.eeit9703.activity.model.ActivityVO;
import com.iii.eeit9703.member.model.MemVO;


public class ReportVO implements Serializable {
	private ActivityVO activityVO;
	private MemVO memVO;
	private Date reportTime;
	private String reportContext;
	
	public ActivityVO getActivityVO() {
		return activityVO;
	}
	public void setActivityVO(ActivityVO activityVO) {
		this.activityVO = activityVO;
	}
	public MemVO getMemVO() {
		return memVO;
	}
	public void setMemVO(MemVO memVO) {
		this.memVO = memVO;
	}
	public Date getReportTime() {
		return reportTime;
	}
	public void setReportTime(Date reportTime) {
		this.reportTime = reportTime;
	}
	public String getReportContext() {
		return reportContext;
	}
	public void setReportContext(String reportContext) {
		this.reportContext = reportContext;
	}
	
	
	

}
