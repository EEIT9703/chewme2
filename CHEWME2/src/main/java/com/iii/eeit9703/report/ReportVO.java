package com.iii.eeit9703.report;

import java.io.Serializable;
import java.sql.Timestamp;

import com.iii.eeit9703.activity.model.ActivityVO;
import com.iii.eeit9703.member.model.MemVO;

public class ReportVO implements Serializable {
	private ActivityVO activityVO;
	private MemVO memVO;
	private Timestamp reportTime;
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

	public Timestamp getReportTime() {
		return reportTime;
	}

	public void setReportTime(Timestamp reportTime) {
		this.reportTime = reportTime;
	}

	public String getReportContext() {
		return reportContext;
	}

	public void setReportContext(String reportContext) {
		this.reportContext = reportContext;
	}

}
