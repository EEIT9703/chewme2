package com.iii.eeit9703.member.model;

import java.util.LinkedList;
import java.util.List;

public class MemberSession {
	Integer memId;
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
