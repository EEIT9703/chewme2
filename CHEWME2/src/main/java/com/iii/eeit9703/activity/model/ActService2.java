package com.iii.eeit9703.activity.model;

import java.util.List;

public class ActService2 {

	private ActivityDAO_interface2 dao;
	
	public ActService2(){
		dao = new ActivityDAO2();
	}
	
	

	
	//修改新增活動     工頭把包好的資料交給DAO去工作
	public void updateAct(ActivityVO activityVO){
		dao.update(activityVO);
	}
	
	//上傳預覽圖  編輯簡介
	public void finalAct(ActivityVO activityVO){
		dao.finalAct(activityVO);
	}
	
	//查詢單一
	public ActivityVO getOneAct(Integer actID){
		return dao.findByPrimaryKey(actID);
	}
	
	public List<ActivityVO> getAll(){
		return dao.getAll();
	}
	public List<ActivityVO> getListByClubId(Integer clubId){
		return dao.getListByClubId(clubId);
	}
	public List<ActivityVO> getListVOBymemId(Integer memId){
		return dao.getOwnListVOByMemId(memId);
	}

}