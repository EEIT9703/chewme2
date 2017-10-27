package com.iii.eeit9703.activity.model;

import java.sql.Date;
import java.sql.Time;
import java.util.HashSet;
import java.util.Set;

import com.iii.eeit9703.collection.CollectionVO;
import com.iii.eeit9703.member.model.MemVO;
import com.iii.eeit9703.report.ReportVO;

public class ActivityVO implements java.io.Serializable {
	
	//活動表
	private Integer actID;       //行程編號(完成編輯)
	//private Integer memId;  //會員編號
	private String  act_name;  //活動名稱
	private Integer act_groups; //成團人數
	private Integer act_current;//當前人數
	private Date BDate;        //開始日期
	private Date EDate;       //結束日期
	private Integer activity_state; //活動型態  0 = 建構中, 1 = 上架  ,  2 = 被檢舉  , 3 = 下架 
	private Set<CollectionVO> Collects = new HashSet<CollectionVO>();
	private Set<ReportVO> Reports = new HashSet<ReportVO>();
	private MemVO memVO; //為浪如果jdbc 要輸入會員ID 需要 程式碼改成memVO.getMemId 

	public MemVO getMemVO() {
		return memVO;
	}
	public void setMemVO(MemVO memVO) {
		this.memVO = memVO;
	}
	public Set<ReportVO> getReports() {
		return Reports;
	}
	public void setReports(Set<ReportVO> reports) {
		Reports = reports;
	}
	public Set<CollectionVO> getCollects() {
		return Collects;
	}
	public void setCollects(Set<CollectionVO> collects) {
		Collects = collects;
	}
	
	public Integer getActID() {
		return actID;
	}
	public void setActID(Integer actID) {
		this.actID = actID;
	}

	public String getAct_name() {
		return act_name;
	}
	public void setAct_name(String act_name) {
		this.act_name = act_name;
	}
	public Integer getAct_groups() {
		return act_groups;
	}
	public void setAct_groups(Integer act_groups) {
		this.act_groups = act_groups;
	}
	public Integer getAct_current() {
		return act_current;
	}
	public void setAct_current(Integer act_current) {
		this.act_current = act_current;
	}
	public Date getBDate() {
		return BDate;
	}
	public void setBDate(Date bDate) {
		BDate = bDate;
	}
	public Date getEDate() {
		return EDate;
	}
	public void setEDate(Date eDate) {
		EDate = eDate;
	}
	public Integer getActivity_state() {
		return activity_state;
	}
	public void setActivity_state(Integer activity_state) {
		this.activity_state = activity_state;
	}
	


}
