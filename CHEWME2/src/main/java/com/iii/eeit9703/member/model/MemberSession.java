package com.iii.eeit9703.member.model;

import java.util.LinkedList;
import java.util.List;

public class MemberSession {
	private Integer memId;
	public Integer getMemId() {
		return memId;
	}
	public void setMemId(Integer memId) {
		this.memId = memId;
	}
	List<Integer> authorizedClubList;
	MemberSession(){
	authorizedClubList = new LinkedList();
	}
	void addAuthorizedClubList(Integer clubId){
		authorizedClubList.add(clubId);
	}
	boolean checkAuthorized(Integer clubId){
		if(authorizedClubList.contains(clubId)){
			return true;
		} else{
			return false;			
		}
	}
	
	
	
	
}
