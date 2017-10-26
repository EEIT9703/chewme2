package com.iii.eeit9703.collection;

import java.io.Serializable;

import com.iii.eeit9703.activity.model.ActivityVO;
import com.iii.eeit9703.member.model.MemVO;


public class CollectionVO implements Serializable {
	private ActivityVO activityVO;
	private MemVO MemVO;
	private String context;
	private Integer status;
	
	
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
		
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public ActivityVO getActivityVO() {
		return activityVO;
	}
	public void setActivityVO(ActivityVO activityVO) {
		this.activityVO = activityVO;
	}
	public MemVO getMemVO() {
		return MemVO;
	}
	public void setMemVO(MemVO memVO) {
		MemVO = memVO;
	}
	

	
}
