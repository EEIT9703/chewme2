package com.iii.eeit9703.member.model;

import java.util.LinkedList;
import java.util.List;

import com.iii.eeit9703.activity.model.ActService2;
import com.iii.eeit9703.activity.model.ActivityVO;
import com.iii.eeit9703.bridge.model.ClubMemRelationService;
import com.iii.eeit9703.bridge.model.MemActRelationService;
import com.iii.eeit9703.club.model.ClubService;
import com.iii.eeit9703.collection.CollectionService;
import com.iii.eeit9703.collection.CollectionVO;

public class MemberSession {
	private Integer memId;
	private MemVO memVO;
	private List<Integer> joinedClubList;
	private List<Integer> joinedActList;
	private List<Integer> ownClubList;
	private List<Integer> ownActivityList;
	private List<ActivityVO> ownActivityVOList;
	//private List<Integer> ownColList;
	private List<CollectionVO> ownColVoList;//collection改用拿VO
	ClubService cbService;
	MemActRelationService marService;
	ClubMemRelationService cmrService;
	CollectionService colService;
	//private List<> 
	
	MemberSession(){
		joinedClubList = new LinkedList<Integer>();
		joinedActList = new LinkedList<Integer>();
		ownClubList = new LinkedList<Integer>();
		ownActivityList = new LinkedList<Integer>();
		cbService = new ClubService();
		marService = new MemActRelationService();
		cmrService = new ClubMemRelationService();
		colService = new CollectionService();
	}
	
	MemberSession(MemVO memVO){
		this();		
		setMemId(memVO.getMemId());
		setMemVO(memVO);
		init(memVO.getMemId());
	}
	public MemberSession(Integer memId){
		this();
		init(memId);
	}
	
	private void init(Integer memId){		
		setAuthorizedclubList();
//		ownClubList =  cbService.getClubIdListByManagerId(memId);
//		joinedActList = marService.getRelationByMemId(memId);
//		joinedClubList = cmrService.getRelationByMemId(memId);
//		ownColList =  colService.getColIdListByMemId(memId);
		ownColVoList = colService.getColVOListByMemId(memId);//測試
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
	
	
//	public List<Integer> getOwnColList() {
//		return ownColList;
//	}
//
//	public void setOwnColList(List<Integer> ownColList) {
//		this.ownColList = ownColList;
//	}

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
	//先不要用此方法 下面兩個方法可能會砍掉byHungYu
	public void setOwnActivityVOList() {
		ActService2 as = new ActService2();
		this.ownActivityVOList = as.getListVOBymemId(this.getMemId());
	}
	public List<ActivityVO> getOwnActivityVOList(){
		ActService2 as = new ActService2();
		return as.getListVOBymemId(this.getMemId());
	}
	
	
	
	public List<CollectionVO> getOwnColVoList() {
		return ownColVoList;
	}

	public void setOwnColVoList(List<CollectionVO> ownColVoList) {
		this.ownColVoList = ownColVoList;
	}

	public static void main(String[] args) {
		MemberSession chd = new MemberSession(new Integer(1));
//		List<Integer> joinClubList = chd.getJoinedClubList();
//		List<Integer> joinActList = chd.getJoinedActList();
//		List<Integer> ownClubList = chd.getOwnClubList();
//		List<Integer> ownActList = chd.getOwnActivityList();
//		System.out.println(joinClubList);
//		System.out.println(joinActList);
//		System.out.println(ownActList);
//		System.out.println(ownClubList);	
//		 List<Integer> owncolList =chd.getOwnColList();
//		 System.out.println(owncolList.size());
		 
		 List<CollectionVO> colVOs=chd.getOwnColVoList();
		 
		 for(CollectionVO vo:colVOs){
			 
			 System.out.println(vo.getActivityVO().getAct_name());
			 
		 }
	}


	
}
