package com.iii.eeit9703.member.model;

import java.util.LinkedList;
import java.util.List;

import com.iii.eeit9703.club.model.ClubService;

public class MemberSession {
	private Integer memId;
	private List<Integer> joinedClubList;
	private List<Integer> ownClubList;
	private List<Integer> ownActivityList;
	//private List<> 
	
	private MemVO memVO;
	
	
	MemberSession(){
		joinedClubList = new LinkedList<Integer>();
	}
	MemberSession(MemVO memVO){
		this();
		setMemId(this.memVO.getMemId());
		setMemVO(memVO);
		setAuthorizedclubList();
			
		
	
	}
	public void setMemVO(MemVO memVO){
		this.memVO = memVO;
	}
	public MemVO getMemVO(){
		return this.memVO;
	}
	
	public Integer getMemId() {
		return memId;
	}
	public void setMemId(Integer memId) {
		this.memId = memId;
	}
	public void setAuthorizedclubList(){
		ClubService cs = new ClubService();
		
	}
	
	public void addjoinedClubList(Integer clubId){
		joinedClubList.add(clubId);
	}
	public boolean checkjoined(Integer clubId){
		if(joinedClubList.contains(clubId)){
			return true;
		} else{
			return false;			
		}
	}
	
	
	
	
}
