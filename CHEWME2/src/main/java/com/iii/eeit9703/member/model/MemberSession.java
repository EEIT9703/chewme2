package com.iii.eeit9703.member.model;

import java.util.LinkedList;
import java.util.List;

import com.iii.eeit9703.bridge.model.ClubMemRelationService;
import com.iii.eeit9703.bridge.model.MemActRelationService;
import com.iii.eeit9703.club.model.ClubService;

public class MemberSession {
	private Integer memId;
	private MemVO memVO;
	private List<Integer> joinedClubList;
	private List<Integer> joinedActList;
	private List<Integer> ownClubList;
	private List<Integer> ownActivityList;
	ClubService cbService;
	MemActRelationService marService;
	ClubMemRelationService cmrService;		
	//private List<> 
	
	MemberSession(){
		joinedClubList = new LinkedList<Integer>();
		joinedActList = new LinkedList<Integer>();
		ownClubList = new LinkedList<Integer>();
		ownActivityList = new LinkedList<Integer>();
		cbService = new ClubService();
		marService = new MemActRelationService();
		cmrService = new ClubMemRelationService();	
	}
	
	MemberSession(MemVO memVO){
		this();		
		setMemId(memVO.getMemId());
		setMemVO(memVO);
		init(memVO.getMemId());
	}
	MemberSession(Integer memId){
		this();
		init(memId);
	}
	
	private void init(Integer memId){		
		setAuthorizedclubList();
		ownClubList =  cbService.getClubIdListByManagerId(memId);
		joinedActList = marService.getRelationByMemId(memId);
		joinedClubList = cmrService.getRelationByMemId(memId);
	}
	
	
	public List<Integer> getJoinedClubList() {
		return joinedClubList;
	}
	public void setJoinedClubList(List<Integer> joinedClubList) {
		this.joinedClubList = joinedClubList;
	}
	public List<Integer> getOwnClubList() {
		return ownClubList;
	}
	public void setOwnClubList(List<Integer> ownClubList) {
		this.ownClubList = ownClubList;
	}
	public List<Integer> getOwnActivityList() {
		return ownActivityList;
	}
	public void setOwnActivityList(List<Integer> ownActivityList) {
		this.ownActivityList = ownActivityList;
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
	public List<Integer> getJoinedActList() {
		return joinedActList;
	}

	public void setJoinedActList(List<Integer> joinedActList) {
		this.joinedActList = joinedActList;
	}
	
	
	public static void main(String[] args) {
		MemberSession chd = new MemberSession(new Integer(1));
		List<Integer> joinClubList = chd.getJoinedClubList();
		List<Integer> joinActList = chd.getJoinedActList();
		List<Integer> ownClubList = chd.getOwnClubList();
		List<Integer> ownActList = chd.getOwnActivityList();
		System.out.println(joinClubList);
		System.out.println(joinActList);
		System.out.println(ownActList);
		System.out.println(ownClubList);
		
	}


	
}
